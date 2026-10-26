import os
import re
import paramiko

# 只读检查：确认当前后端进程的实际内存占用与服务器内存情况，用于判断能否交给 systemd(-Xmx512m) 托管
PROJECT_ROOT = r"e:\Code\AI\Start\Web\Mindapp\healthsystems"
CRED_SOURCE = os.path.join(PROJECT_ROOT, "scratch", "deploy_remote_optimized.py")


def read_credentials():
    with open(CRED_SOURCE, "r", encoding="utf-8") as f:
        text = f.read()
    host = re.search(r'hostname\s*=\s*"([^"]+)"', text).group(1)
    user = re.search(r'username\s*=\s*"([^"]+)"', text).group(1)
    pwd = re.search(r'password\s*=\s*"([^"]+)"', text).group(1)
    return host, user, pwd


CMDS = [
    "free -m",
    "ps -o pid,ppid,rss,vsz,etime,cmd -C java",
    "systemctl is-enabled healthsystem; systemctl is-active healthsystem",
    "grep -c 'Port 1443 was already in use' /healthsystem-test/backend.log",
    "tail -n 5 /healthsystem-test/backend.log",
]


def main():
    host, user, pwd = read_credentials()
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, username=user, password=pwd, timeout=20, banner_timeout=20)
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
