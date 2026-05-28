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
    
    # We run the import command and capture stderr carefully
    cmd = "mysql -u root -pnwpuhs@ABC123\\!@# healthsystem_test2 < /root/healthsystem_*2025*.sql"
    print(f"\nExecuting: {cmd}")
    stdin, stdout, stderr = ssh.exec_command(cmd)
    
    out = stdout.read().decode('utf-8', errors='ignore')
    err = stderr.read().decode('utf-8', errors='ignore')
    if out:
        print("STDOUT:\n", out)
    if err:
        print("STDERR:\n", err)
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
