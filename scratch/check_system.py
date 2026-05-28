import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    
    def run_and_print(cmd):
        print(f"\n--- {cmd} ---")
        stdin, stdout, stderr = ssh.exec_command(cmd)
        out = stdout.read().decode('utf-8')
        err = stderr.read().decode('utf-8')
        if out:
            print("STDOUT:", out)
        if err:
            print("STDERR:", err)

    run_and_print("crontab -l")
    run_and_print("systemctl list-units --type=service | grep -E 'java|backend|health'")
    run_and_print("free -h")
    run_and_print("uptime")
    
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
