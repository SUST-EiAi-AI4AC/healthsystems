import paramiko
import os

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

local_file = "database/healthsystem_test2.sql"
remote_file = "/root/healthsystem_test2_latest.sql"

print(f"Checking local file: {local_file}")
if not os.path.exists(local_file):
    print(f"Error: Local file {local_file} does not exist!")
    exit(1)
print(f"Local file size: {os.path.getsize(local_file)} bytes")

try:
    print("Connecting to remote server...")
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    print("Connected successfully!")
    
    print("Opening SFTP channel...")
    sftp = ssh.open_sftp()
    print(f"Uploading {local_file} to {remote_file}...")
    sftp.put(local_file, remote_file)
    sftp.close()
    print("Upload completed successfully!")
    
    cmds = [
        # 1. Replace utf8mb4_0900_ai_ci with utf8mb4_general_ci for MySQL 5.7 compatibility
        "sed -i 's/utf8mb4_0900_ai_ci/utf8mb4_general_ci/g' /root/healthsystem_test2_latest.sql",
        
        # 2. Recreate database with utf8mb4_general_ci
        "mysql -u root -pnwpuhs@ABC123\\!@# -e \"DROP DATABASE IF EXISTS healthsystem_test2; CREATE DATABASE healthsystem_test2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;\" || true",
        
        # 3. Import the new SQL file
        "mysql -u root -pnwpuhs@ABC123\\!@# healthsystem_test2 < /root/healthsystem_test2_latest.sql",
        
        # 4. Verify tables count
        "mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; SHOW TABLES;\" || true",
        
        # 5. Restart backend system service
        "systemctl restart healthsystem || true",
        "sleep 3",
        "systemctl status healthsystem || true"
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
    print("Database upgrade script completed.")
except Exception as e:
    print(f"Error occurred: {e}")
