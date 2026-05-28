import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

local_key = "scratch/www.nwpuhs.cn_key.key"
local_cert = "scratch/www.nwpuhs.cn_cert_chain.pem"

remote_key = "/etc/pki/nginx/private/www.nwpuhs.cn_key.key"
remote_cert = "/etc/pki/nginx/www.nwpuhs.cn_cert_chain.pem"

print("Connecting to remote server...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    print("Connected successfully!")
    
    # 1. Backup old files
    cmds_backup = [
        f"cp {remote_cert} {remote_cert}.bak || true",
        f"cp {remote_key} {remote_key}.bak || true"
    ]
    for cmd in cmds_backup:
        print(f"Executing: {cmd}")
        ssh.exec_command(cmd)
        
    # 2. Upload via SFTP
    print("Opening SFTP channel...")
    sftp = ssh.open_sftp()
    
    print(f"Uploading {local_cert} to {remote_cert}...")
    sftp.put(local_cert, remote_cert)
    
    print(f"Uploading {local_key} to {remote_key}...")
    sftp.put(local_key, remote_key)
    
    sftp.close()
    print("Upload completed successfully!")
    
    # 3. Test and reload nginx
    cmds_apply = [
        "nginx -t",
        "systemctl reload nginx",
        "systemctl status nginx | head -n 10"
    ]
    for cmd in cmds_apply:
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
    print("\nNginx certificates update script completed.")
except Exception as e:
    print(f"Error: {e}")
