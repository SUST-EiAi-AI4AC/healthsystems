import paramiko
import time
import os

def main():
    host = "47.109.49.174"
    username = "root"
    password = "nwpuhs@ABC123!@#"
    local_jar = r"e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend\target\backend-0.0.1-SNAPSHOT.jar"
    remote_path = "/healthsystem-test/backend-0.0.1-SNAPSHOT.jar"
    
    print(f"Local JAR exists? {os.path.exists(local_jar)}")
    if not os.path.exists(local_jar):
        print("Error: Local JAR not found!")
        return

    # SSH connection
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    try:
        print(f"Connecting to remote server {host}...")
        ssh.connect(host, username=username, password=password)
        print("SSH Connection successful!")
        
        # SFTP client
        sftp = ssh.open_sftp()
        print(f"Uploading JAR to remote path {remote_path}...")
        sftp.put(local_jar, remote_path)
        sftp.close()
        print("Upload successful!")
        
        # Kill any old processes on ports 8081 / 1443
        print("Force killing old processes on ports 8081 and 1443...")
        ssh.exec_command("fuser -k 8081/tcp; fuser -k 1443/tcp; pkill -9 -f backend-0.0.1-SNAPSHOT.jar")
        time.sleep(2)
        
        # Start new process in background
        print("Starting the backend service in background...")
        start_cmd = "nohup java -jar /healthsystem-test/backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=deploy > /healthsystem-test/backend.log 2>&1 &"
        ssh.exec_command(start_cmd)
        
        # Let's wait for it to startup and verify
        print("Waiting 10 seconds for service to initialize...")
        time.sleep(10)
        
        # Check running process
        stdin, stdout, stderr = ssh.exec_command("ps -ef | grep backend-0.0.1-SNAPSHOT.jar")
        ps_out = stdout.read().decode('utf-8')
        print("\n--- Current Running Process ---")
        print(ps_out)
        
        # Check logs
        stdin, stdout, stderr = ssh.exec_command("tail -n 60 /healthsystem-test/backend.log")
        log_out = stdout.read().decode('utf-8', errors='ignore')
        print("\n--- Recent Logs (backend.log) ---")
        print(log_out)
        
        # Verify port listening
        stdin, stdout, stderr = ssh.exec_command("netstat -lnpt | grep -E '8081|1443'")
        port_out = stdout.read().decode('utf-8')
        print("\n--- Port Status ---")
        print(port_out if port_out else "NO ports listening!")
        
        # Curl verification
        print("\nPerforming local curl test...")
        stdin, stdout, stderr = ssh.exec_command("curl -i -k https://127.0.0.1:1443/page/login.html")
        curl_out = stdout.read().decode('utf-8', errors='ignore')
        print("\n--- Local Curl Response (Headers) ---")
        print("\n".join(curl_out.splitlines()[:20]))
        
    except Exception as e:
        print(f"Error during deployment: {e}")
    finally:
        ssh.close()

if __name__ == "__main__":
    main()
