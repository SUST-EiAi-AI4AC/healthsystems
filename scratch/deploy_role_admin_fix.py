import os
import re
import sys
import time
import paramiko

# =============================================================================
# 账号角色体系修复：部署新 jar + 交给 systemd 托管 + 生产库角色迁移（先备份）
#
# 线上现状（已核查）：
#   - PID 12139：Oct 11 用 nohup 直接启的老 jar，独占 8081/1443，RSS 约 320MB
#   - healthsystem.service：enabled，ExecStart 用 -Xmx512m 启同一个 jar，因端口被占
#     每 10 秒失败一次，backend.log 已写到 1GB（80310 次 "Port 1443 was already in use"）
#   - 服务器内存 1756MB，老进程默认最大堆约 439MB < 512MB，所以交给 systemd 托管不会降级
#
# 部署顺序：先换代码（新代码兼容旧数据：doctor 仍可登录后台），再迁移数据库
# 凭据：SSH 从既有脚本 scratch/deploy_remote_optimized.py 解析，避免重复硬编码
# =============================================================================

PROJECT_ROOT = r"e:\Code\AI\Start\Web\Mindapp\healthsystems"
BACKEND_DIR = os.path.join(
    PROJECT_ROOT, "healthsystem-backend6", "healthsystem-backend")
MIG_DIR = os.path.join(PROJECT_ROOT, "database", "migrations")
LOCAL_JAR = os.path.join(BACKEND_DIR, "target", "backend-0.0.1-SNAPSHOT.jar")
LOCAL_SQL_UP = os.path.join(MIG_DIR, "20261026_01_role_admin_upgrade.sql")
LOCAL_SQL_ROLLBACK = os.path.join(
    MIG_DIR, "20261026_02_role_admin_rollback.sql")
CRED_SOURCE = os.path.join(PROJECT_ROOT, "scratch",
                           "deploy_remote_optimized.py")

REMOTE_DIR = "/healthsystem-test"
REMOTE_JAR = REMOTE_DIR + "/backend-0.0.1-SNAPSHOT.jar"
REMOTE_LOG = REMOTE_DIR + "/backend.log"
REMOTE_BAK_DIR = "/healthsystem-test_backup"
REMOTE_SQL_DIR = REMOTE_DIR + "/migrations"
SERVICE = "healthsystem"

DB_NAME = "healthsystem_test2"
DB_USER = "root"
DB_PASS = "nwpuhs@ABC123!@#"


def read_credentials():
    with open(CRED_SOURCE, "r", encoding="utf-8") as f:
        text = f.read()
    host = re.search(r'hostname\s*=\s*"([^"]+)"', text).group(1)
    user = re.search(r'username\s*=\s*"([^"]+)"', text).group(1)
    pwd = re.search(r'password\s*=\s*"([^"]+)"', text).group(1)
    return host, user, pwd


def run(ssh, cmd, echo=True, timeout=180):
    if echo:
        print("\n$ " + cmd)
    stdin, stdout, stderr = ssh.exec_command(cmd, timeout=timeout)
    out = stdout.read().decode("utf-8", "ignore")
    err = stderr.read().decode("utf-8", "ignore")
    code = stdout.channel.recv_exit_status()
    if out.strip():
        print(out.rstrip())
    if err.strip():
        print("[stderr] " + err.rstrip())
    return code, out, err


def mysql(ssh, sql, vertical=False):
    cmd = ("mysql -u%s -p'%s' --default-character-set=utf8 %s -t -e \"%s\""
           % (DB_USER, DB_PASS, DB_NAME, sql))
    return run(ssh, cmd)


def wait_http(ssh, seconds=120):
    for i in range(seconds // 5):
        time.sleep(5)
        code, out, err = run(ssh, "curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:8081/page/login.html",
                             echo=False, timeout=30)
        if out.strip() == "200":
            return True, (i + 1) * 5
    return False, seconds


def main():
    for path in (LOCAL_JAR, LOCAL_SQL_UP, LOCAL_SQL_ROLLBACK):
        if not os.path.exists(path):
            print("缺少文件: " + path)
            sys.exit(1)

    host, user, pwd = read_credentials()
    stamp = time.strftime("%Y%m%d%H%M%S")

    transport = paramiko.Transport((host, 22))
    transport.window_size = 3 * 1024 * 1024
    transport.connect(username=user, password=pwd)
    sftp = paramiko.SFTPClient.from_transport(transport)
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=pwd,
                timeout=20, banner_timeout=20)

    # ---------- 1. 备份旧 jar，上传新 jar 与迁移脚本 ----------
    run(ssh, "mkdir -p %s %s" % (REMOTE_SQL_DIR, REMOTE_BAK_DIR))
    code, out, _ = run(ssh, "test -f %s && cp -a %s %s/backend-%s.jar && echo JAR_BACKED_UP"
                       % (REMOTE_JAR, REMOTE_JAR, REMOTE_BAK_DIR, stamp))
    if code != 0:
        print("旧 jar 备份失败，终止部署（未做任何改动）")
        sys.exit(1)

    size = os.path.getsize(LOCAL_JAR)
    print("\n上传新 jar (%.1f MB)..." % (size / 1024.0 / 1024.0))
    sftp.put(LOCAL_JAR, REMOTE_JAR + ".new")
    run(ssh, "mv -f %s.new %s && ls -l %s" %
        (REMOTE_JAR, REMOTE_JAR, REMOTE_JAR))
    sftp.put(LOCAL_SQL_UP, REMOTE_SQL_DIR +
             "/" + os.path.basename(LOCAL_SQL_UP))
    sftp.put(LOCAL_SQL_ROLLBACK, REMOTE_SQL_DIR +
             "/" + os.path.basename(LOCAL_SQL_ROLLBACK))

    # ---------- 2. 停掉 systemd 死循环 + 老 nohup 进程，等待端口释放 ----------
    print("\n停止服务与残留进程...")
    run(ssh, "systemctl stop %s" % SERVICE)
    run(ssh, "pkill -f '[b]ackend-0.0.1-SNAPSHOT.jar'; sleep 3; true")
    for i in range(10):
        code, out, _ = run(
            ssh, "ss -ltn | grep -E ':(8081|1443)' | wc -l", echo=False, timeout=30)
        if out.strip() == "0":
            print("端口已释放")
            break
        time.sleep(3)
    # 轮转 1GB 的旧日志（保留文件，不删除）
    run(ssh, "test -f %s && mv %s %s.%s.old; true" %
        (REMOTE_LOG, REMOTE_LOG, REMOTE_LOG, stamp))

    # ---------- 3. 用 systemd 启动新 jar ----------
    print("\n启动新后端（systemd 托管）...")
    run(ssh, "systemctl start %s" % SERVICE)
    ok, used = wait_http(ssh, 150)
    if not ok:
        print("!! 新 jar 启动失败，正在回滚到旧 jar ...")
        run(ssh,
            "systemctl stop %s; pkill -f '[b]ackend-0.0.1-SNAPSHOT.jar'; sleep 3; true" % SERVICE)
        run(ssh, "cp -a %s/backend-%s.jar %s" %
            (REMOTE_BAK_DIR, stamp, REMOTE_JAR))
        run(ssh, "systemctl start %s" % SERVICE)
        ok2, _ = wait_http(ssh, 90)
        run(ssh, "tail -n 80 " + REMOTE_LOG)
        print("回滚后服务状态: " + ("已恢复" if ok2 else "仍然失败，请人工介入"))
        ssh.close()
        transport.close()
        sys.exit(1)
    print("新 jar 启动成功（%d 秒）" % used)

    # ---------- 4. 新代码自检（此时数据库仍是旧角色） ----------
    run(ssh, "curl -s http://127.0.0.1:8081/js/myjs/myscript.js | grep -c getRoleBadge")
    run(ssh, "curl -s http://127.0.0.1:8081/page/table_user.html | grep -c '账号类型'")
    run(ssh, "curl -s http://127.0.0.1:8081/api/init.json | grep -E 'table_user|table_health'")
    run(ssh, "curl -s -X POST -H 'Content-Type: application/json' "
             "-d '{\"userNameOrPhone\":\"__probe__\",\"password\":\"__probe__\"}' http://127.0.0.1:8081/user/admin/login")

    # ---------- 5. 数据库：先备份，再迁移 ----------
    backup_sql = "%s/user_role_%s.sql" % (REMOTE_BAK_DIR, stamp)
    code, out, err = run(ssh, "mysqldump -u%s -p'%s' --single-transaction %s user_info role_permission > %s "
                              "&& ls -l %s" % (DB_USER, DB_PASS, DB_NAME, backup_sql, backup_sql))
    if code != 0:
        print("!! 数据库备份失败，跳过迁移（未对数据库做任何修改）。可稍后手工执行 %s"
              % (REMOTE_SQL_DIR + "/" + os.path.basename(LOCAL_SQL_UP)))
        ssh.close()
        transport.close()
        sys.exit(1)

    print("\n迁移前角色分布：")
    mysql(ssh, "SELECT role, COUNT(*) AS total FROM user_info GROUP BY role;")

    print("\n执行迁移脚本：")
    code, out, err = run(ssh, "mysql -u%s -p'%s' --default-character-set=utf8 %s < %s/%s"
                         % (DB_USER, DB_PASS, DB_NAME, REMOTE_SQL_DIR, os.path.basename(LOCAL_SQL_UP)))
    if code != 0:
        print("!! 迁移执行失败，可用备份还原： mysql -u%s -p'***' %s < %s" %
              (DB_USER, DB_NAME, backup_sql))
        ssh.close()
        transport.close()
        sys.exit(1)

    print("\n迁移后核对：")
    mysql(ssh, "SELECT role, COUNT(*) AS total FROM user_info GROUP BY role;")
    mysql(ssh, "SELECT COUNT(*) AS migrated_rows FROM user_role_migration_log;")
    mysql(ssh, "SELECT boundary_user_id FROM role_migration_meta WHERE id=1;")
    mysql(ssh, "SELECT user_id, user_name, role FROM user_info ORDER BY user_id DESC LIMIT 5;")

    # ---------- 6. 服务健康复核 ----------
    print("\n服务健康复核：")
    run(ssh, "systemctl is-active %s; ps -o pid,ppid,rss,etime,cmd -C java | grep -v grep" % SERVICE)
    run(ssh, "tail -n 8 " + REMOTE_LOG)
    run(ssh, "ls -l %s" % REMOTE_BAK_DIR)

    sftp.close()
    ssh.close()
    transport.close()
    print("\n完成。备份：jar=%s/backend-%s.jar  db=%s  旧日志=%s.%s.old"
          % (REMOTE_BAK_DIR, stamp, backup_sql, REMOTE_LOG, stamp))


if __name__ == "__main__":
    main()
