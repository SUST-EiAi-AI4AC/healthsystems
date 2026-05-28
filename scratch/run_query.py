import paramiko
import sys

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    
    output_lines = []

    def run_cmd(cmd):
        output_lines.append(f"\n========================================\nCOMMAND: {cmd}\n========================================\n")
        stdin, stdout, stderr = ssh.exec_command(cmd)
        out = stdout.read().decode('utf-8')
        err = stderr.read().decode('utf-8')
        if out:
            output_lines.append("--- STDOUT ---\n")
            output_lines.append(out)
        if err:
            output_lines.append("--- STDERR ---\n")
            output_lines.append(err)

    run_cmd("ps -ef | grep java | grep -v grep")
    run_cmd("netstat -tulnp | grep -E '8081|1443|80|443'")
    run_cmd("systemctl status nginx | cat")
    run_cmd("tail -n 100 /healthsystem-test/backend.log")

    ssh.close()

    with open("scratch/query_output.txt", "w", encoding="utf-8") as f:
        f.writelines(output_lines)
    print("Query finished and written to scratch/query_output.txt")
except Exception as e:
    print(f"Error: {e}")
