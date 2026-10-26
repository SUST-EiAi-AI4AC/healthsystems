import os
import re
import paramiko

# 只读校验：把线上 /doctor/getuserlist 用到的新 SQL 直接在库上跑一遍，确认列名与 role 筛选可用
PROJECT_ROOT = r"e:\Code\AI\Start\Web\Mindapp\healthsystems"
CRED_SOURCE = os.path.join(PROJECT_ROOT, "scratch", "deploy_remote_optimized.py")
DB = "healthsystem_test2"
PWD = "nwpuhs@ABC123!@#"

SQLS = [
    # 列表 SQL（含新增的 role / permission 两列 + role 筛选条件）
    ("SELECT user_info.user_id, user_name, user_info.role, user_info.permission "
     "FROM user_info LEFT JOIN user_health_info ON user_health_info.user_id = user_info.user_id "
     "LEFT JOIN nwpu_user_info ON user_info.user_id = nwpu_user_info.user_id "
     "WHERE user_health_info.doctor_id = 1 AND user_info.role = 'admin' ORDER BY user_info.user_id ASC LIMIT 5;"),
    # 按普通用户筛选（迁移后应为空，新注册账号出现后会有数据）
    ("SELECT COUNT(*) AS normal_users FROM user_info u JOIN user_health_info h ON h.user_id = u.user_id "
     "WHERE h.doctor_id = 1 AND u.role = 'user';"),
    # 管理员是否都能在 role_permission 中找到默认权限
    ("SELECT r.role, r.permission FROM role_permission r WHERE r.role IN ('admin','doctor','user') ORDER BY r.role;"),
]


def read_credentials():
    with open(CRED_SOURCE, "r", encoding="utf-8") as f:
        text = f.read()
    host = re.search(r'hostname\s*=\s*"([^"]+)"', text).group(1)
    user = re.search(r'username\s*=\s*"([^"]+)"', text).group(1)
    pwd = re.search(r'password\s*=\s*"([^"]+)"', text).group(1)
    return host, user, pwd


def main():
    host, user, pwd = read_credentials()
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=pwd, timeout=20, banner_timeout=20)
    for sql in SQLS:
        cmd = "mysql -uroot -p'%s' --default-character-set=utf8 %s -t -e \"%s\"" % (PWD, DB, sql)
        print("\n$ " + sql)
        stdin, stdout, stderr = ssh.exec_command(cmd, timeout=60)
        print(stdout.read().decode("utf-8", "ignore").rstrip())
        err = stderr.read().decode("utf-8", "ignore").strip()
        if err and "Warning" not in err:
            print("[stderr] " + err)
    # 重启后是否出现 MyBatis/SQL 报错
    print("\n$ grep -cE 'BadSqlGrammar|BindingException|SQLException' /healthsystem-test/backend.log")
    stdin, stdout, stderr = ssh.exec_command(
        "grep -cE 'BadSqlGrammar|BindingException|SQLException' /healthsystem-test/backend.log || true", timeout=60)
    print(stdout.read().decode("utf-8", "ignore").rstrip())
    ssh.close()


if __name__ == "__main__":
    main()
