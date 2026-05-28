import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    # Check java path and environment
    cmds = [
        "echo PATH=$PATH",
        "which java || true",
        "java -version 2>&1 || true",
        "ls -l /healthsystem-test/backend-0.0.1-SNAPSHOT.jar || true"
    ]
    
    for cmd in cmds:
        stdin, stdout, stderr = ssh.exec_command(cmd)
        print(f"--- Command: {cmd} ---")
        print("STDOUT:", stdout.read().decode('utf-8', errors='ignore').strip())
        print("STDERR:", stderr.read().decode('utf-8', errors='ignore').strip())
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
