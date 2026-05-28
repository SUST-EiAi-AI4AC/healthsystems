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
        "ls -la /etc/pki/nginx/ || true",
        "ls -la /etc/pki/nginx/private/ || true",
        "find / -name '*.pem' -o -name '*.key' -o -name '*.crt' | grep -v '/www/server/panel' | grep -v '/usr/' | grep -v '/lib/' || true"
    ]
    
    with open("scratch/certs_list.txt", "w", encoding="utf-8") as f:
        for cmd in cmds:
            f.write(f"\n==================================================\n")
            f.write(f"Executing: {cmd}\n")
            f.write(f"==================================================\n")
            stdin, stdout, stderr = ssh.exec_command(cmd)
            out = stdout.read().decode('utf-8', errors='ignore')
            f.write(out)
            
    ssh.close()
    print("Successfully wrote certificate details to scratch/certs_list.txt")
except Exception as e:
    print(f"Error: {e}")
