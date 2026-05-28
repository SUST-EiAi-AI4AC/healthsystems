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
        "mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; SELECT COUNT(*) FROM user_info;\" || true",
        "mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; SELECT COUNT(*) FROM nwpu_user_info;\" || true",
        "mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; SELECT COUNT(*) FROM activity;\" || true",
    ]
    
    with open("scratch/counts.txt", "w", encoding="utf-8") as f:
        for cmd in cmds:
            f.write(f"\n==================================================\n")
            f.write(f"Executing: {cmd}\n")
            f.write(f"==================================================\n")
            stdin, stdout, stderr = ssh.exec_command(cmd)
            out = stdout.read().decode('utf-8', errors='ignore').strip()
            err = stderr.read().decode('utf-8', errors='ignore').strip()
            if out:
                f.write("STDOUT:\n" + out + "\n")
            if err:
                f.write("STDERR:\n" + err + "\n")
        
    ssh.close()
    print("Results written to scratch/counts.txt")
except Exception as e:
    print(f"Error: {e}")
