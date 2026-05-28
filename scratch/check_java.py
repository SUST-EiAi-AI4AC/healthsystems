import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    
    stdin, stdout, stderr = ssh.exec_command("ps -ef | grep java | grep -v grep")
    out = stdout.read().decode('utf-8')
    
    stdin, stdout, stderr = ssh.exec_command("tail -n 50 /healthsystem-test/backend.log")
    log = stdout.read().decode('utf-8')
    
    with open("scratch/java_status.txt", "w", encoding="utf-8") as f:
        f.write("--- PROCESSES ---\n")
        f.write(out)
        f.write("\n--- LOGS ---\n")
        f.write(log)
    print("Done")
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
