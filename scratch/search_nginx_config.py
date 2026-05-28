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
    
    cmd = "cat /etc/nginx/nginx.conf || true"
    stdin, stdout, stderr = ssh.exec_command(cmd)
    content = stdout.read().decode('utf-8', errors='ignore')
    
    print("\nSearching Nginx config...")
    for i, line in enumerate(content.splitlines()):
        line_lower = line.lower()
        if any(kw in line_lower for kw in ["playe.top", "h5", "oss", "static", "dist"]):
            print(f"Line {i+1}: {line.strip()}")
            
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
