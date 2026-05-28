import paramiko
import sys

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting to remote server via SSH...")
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
try:
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
except Exception as e:
    print(f"Failed to connect: {e}")
    sys.exit(1)

def run_cmd(cmd):
    print(f"\nExecuting: {cmd}")
    stdin, stdout, stderr = ssh.exec_command(cmd)
    out = stdout.read().decode('utf-8')
    err = stderr.read().decode('utf-8')
    if out:
        print("STDOUT:")
        print(out)
    if err:
        print("STDERR:")
        print(err)

run_cmd("ps -ef | grep java | grep -v grep")
run_cmd("netstat -tulnp | grep -E '8081|1443|80|443'")
run_cmd("systemctl status nginx | cat")
run_cmd("tail -n 100 /healthsystem-test/backend.log")

ssh.close()
