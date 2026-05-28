import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    
    stdin, stdout, stderr = ssh.exec_command("cat /etc/nginx/nginx.conf")
    content = stdout.read().decode('gb18030', errors='ignore')
    
    with open("scratch/nginx_conf.txt", "w", encoding="utf-8") as f:
        f.write(content)
        
    print("Saved nginx_conf.txt successfully!")
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
