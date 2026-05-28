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
        "ss -lntp | grep -E '8081|1443|3306' || true",
        "curl -I -s http://127.0.0.1:8081/ || true",
        "curl -k -I -s https://127.0.0.1:1443/ || true"
    ]
    
    for cmd in cmds:
        print(f"\n==================================================")
        print(f"Executing: {cmd}")
        print(f"==================================================")
        stdin, stdout, stderr = ssh.exec_command(cmd)
        out = stdout.read().decode('utf-8', errors='ignore').strip()
        err = stderr.read().decode('utf-8', errors='ignore').strip()
        if out:
            print("STDOUT:\n", out)
        if err:
            print("STDERR:\n", err)
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
