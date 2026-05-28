import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    stdin, stdout, stderr = ssh.exec_command("tail -n 150 /healthsystem-test/backend.log")
    out = stdout.read().decode('utf-8', errors='ignore')
    
    with open("scratch/backend_log_tail.txt", "w", encoding="utf-8") as f:
        f.write(out)
        
    print("Saved backend_log_tail.txt successfully!")
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
