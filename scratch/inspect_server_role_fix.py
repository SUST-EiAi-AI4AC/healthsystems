import os
import re
import sys
import paramiko

# 只读检查：确认线上后端的运行方式（nohup 还是 systemd）、jar 路径与时间、nginx 代理指向
PROJECT_ROOT = r"e:\Code\AI\Start\Web\Mindapp\healthsystems"
CRED_SOURCE = os.path.join(PROJECT_ROOT, "scratch",
                           "deploy_remote_optimized.py")


def read_credentials():
    with open(CRED_SOURCE, "r", encoding="utf-8") as f:
        text = f.read()
    host = re.search(r'hostname\s*=\s*"([^"]+)"', text).group(1)
    user = re.search(r'username\s*=\s*"([^"]+)"', text).group(1)
    pwd = re.search(r'password\s*=\s*"([^"]+)"', text).group(1)
    return host, user, pwd


CMDS = [
    "ps -ef | grep -i java | grep -v grep",
    "ss -ltnp | grep -E ':8081|:1443' || netstat -ltnp | grep -E ':8081|:1443'",
    "systemctl status healthsystem --no-pager -l | head -25",
    "systemctl status backend --no-pager -l | head -20",
    "cat /etc/systemd/system/healthsystem.service 2>/dev/null || systemctl cat healthsystem --no-pager | head -30",
    "ls -l /healthsystem-test/backend.log; df -h / | tail -2",
    "tail -c 3000 /healthsystem-test/backend.log",
]


def main():
    host, user, pwd = read_credentials()
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=pwd,
                timeout=20, banner_timeout=20)
    for cmd in CMDS:
        print("\n$ " + cmd)
        stdin, stdout, stderr = ssh.exec_command(cmd, timeout=60)
        out = stdout.read().decode("utf-8", "ignore")
        err = stderr.read().decode("utf-8", "ignore")
        if out.strip():
            print(out.rstrip())
        if err.strip():
            print("[stderr] " + err.rstrip())
    ssh.close()


if __name__ == "__main__":
    main()
