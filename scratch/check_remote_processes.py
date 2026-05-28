import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    # 1. check ps
    stdin, stdout, stderr = ssh.exec_command("ps -ef | grep java")
    ps_out = stdout.read().decode('utf-8', errors='ignore')
    
    # 2. check backend.log tail (last 500 lines)
    stdin, stdout, stderr = ssh.exec_command("tail -n 500 /healthsystem-test/backend.log")
    log_out = stdout.read().decode('utf-8', errors='ignore')
    
    with open("scratch/ps.txt", "w", encoding="utf-8") as f:
        f.write("=== RUNNING PROCESSES ===\n")
        f.write(ps_out)
        f.write("\n=== LOG TAIL ===\n")
        f.write(log_out)
        
    print("Saved scratch/ps.txt successfully!")
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
