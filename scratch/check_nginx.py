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
        out = stdout.read().decode('gb18030', errors='ignore')
        err = stderr.read().decode('gb18030', errors='ignore')
        if out:
            print("STDOUT:")
            print(out)
        if err:
            print("STDERR:")
            print(err)

    run_and_print("cat /etc/nginx/nginx.conf")
    run_and_print("ls -la /etc/nginx/conf.d/")
    run_and_print("cat /etc/nginx/conf.d/*")
    
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
