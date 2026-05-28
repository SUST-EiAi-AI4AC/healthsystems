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
    
    # Print lines around "location /"
    lines = content.splitlines()
    loc_idx = -1
    for idx, line in enumerate(lines):
        if "location / {" in line:
            loc_idx = idx
            break
            
    if loc_idx != -1:
        print("\nLocation / block in nginx.conf:")
        for idx in range(loc_idx, min(len(lines), loc_idx + 25)):
            print(f"{idx+1}: {lines[idx]}")
    else:
        print("Location / block not found.")
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
