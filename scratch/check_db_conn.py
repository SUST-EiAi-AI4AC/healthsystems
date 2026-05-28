import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting to remote server...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    print("Connected successfully!")
    
    cmds = [
        "systemctl status healthsystem || true",
        "tail -n 100 /healthsystem-test/backend.log || true",
        "systemctl status mysqld || systemctl status mysql || true",
        "mysql -u root -pnwpuhs@ABC123\!@# -e 'show databases;' || mysql -u root -p123456 -e 'show databases;' || true"
    ]
    
    for cmd in cmds:
        stdin, stdout, stderr = ssh.exec_command(cmd)
        print(f"\n==================================================")
        print(f"Executing: {cmd}")
        print(f"==================================================")
        out = stdout.read().decode('utf-8', errors='ignore').strip()
        err = stderr.read().decode('utf-8', errors='ignore').strip()
        if out:
            print("STDOUT:\n", out)
        if err:
            print("STDERR:\n", err)
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
