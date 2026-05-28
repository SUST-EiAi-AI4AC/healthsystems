import paramiko
import time

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting to server...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    print("Killing existing backend process...")
    ssh.exec_command("pkill -f backend-0.0.1-SNAPSHOT.jar")
    time.sleep(2)
    
    print("Starting backend process in background...")
    # Properly redirect stdin from /dev/null to prevent SIGHUP on SSH close
    cmd = "nohup java -jar /healthsystem-test/backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=deploy < /dev/null > /healthsystem-test/backend.log 2>&1 &"
    ssh.exec_command(cmd)
    
    # Wait and check progress
    print("Waiting 15 seconds for Spring Boot startup...")
    for i in range(15):
        time.sleep(1)
        print(f"Waiting... {i+1}/15s")
        
    print("\nChecking process status...")
    stdin, stdout, stderr = ssh.exec_command("pgrep -f backend-0.0.1-SNAPSHOT.jar")
    pids = stdout.read().decode('utf-8').strip()
    if pids:
        print(f"SUCCESS: Backend is running with PID(s): {pids}")
    else:
        print("FAIL: Backend process is not running!")
        # Print tail of log
        stdin, stdout, stderr = ssh.exec_command("tail -n 50 /healthsystem-test/backend.log")
        print("Log Tail:")
        print(stdout.read().decode('utf-8'))
        
    # Check port listening
    print("\nChecking ports...")
    stdin, stdout, stderr = ssh.exec_command("netstat -lntp | grep -E '8081|1443'")
    ports_info = stdout.read().decode('utf-8').strip()
    if ports_info:
        print("Listening ports:")
        print(ports_info)
    else:
        print("Warning: Ports 8081/1443 are not yet listening or netstat failed.")
        
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
