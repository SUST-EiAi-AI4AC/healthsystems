import paramiko
import time

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    print("Starting backend test run (waiting 12 seconds)...")
    # Run the jar in the foreground with a timeout or read output line by line
    stdin, stdout, stderr = ssh.exec_command(
        "java -jar /healthsystem-test/backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=deploy",
        timeout=12
    )
    
    # Read output
    try:
        out = ""
        while True:
            line = stdout.readline()
            if not line:
                break
            print("OUT:", line.strip())
            out += line
    except Exception as e:
        print(f"Read interrupted (expected due to timeout): {e}")
        
    err = stderr.read().decode('utf-8', errors='ignore')
    if err:
        print("STDERR:")
        print(err)
        
    ssh.close()
except Exception as e:
    print(f"Error during execution: {e}")
