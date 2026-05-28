import paramiko
import os
import sys

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"
local_jar = r"e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend\target\backend-0.0.1-SNAPSHOT.jar"
remote_path = "/healthsystem-test/"
remote_jar = remote_path + "backend-0.0.1-SNAPSHOT.jar"

if not os.path.exists(local_jar):
    print(f"Error: Local JAR file not found at {local_jar}")
    sys.exit(1)

print("Connecting to server...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=30)
    
    # SFTP upload
    print("Starting SFTP upload...")
    sftp = ssh.open_sftp()
    
    # Progress callback
    def progress_callback(transferred, total):
        sys.stdout.write(f"\rUploaded: {transferred}/{total} bytes ({(transferred/total)*100:.1f}%)")
        sys.stdout.flush()
        
    sftp.put(local_jar, remote_jar, callback=progress_callback)
    print("\nUpload completed successfully!")
    sftp.close()
    
    # Restart service
    print("Restarting backend service on remote server...")
    restart_cmd = (
        f"set -e; "
        f"pkill -f backend-0.0.1-SNAPSHOT.jar || true; "
        f"nohup java -jar {remote_jar} --spring.profiles.active=deploy > {remote_path}backend.log 2>&1 & "
        f"sleep 5; "
        f"pgrep -f backend-0.0.1-SNAPSHOT.jar >/dev/null && echo 'Backend process: OK' || (echo 'Backend process: FAIL' && tail -n 200 {remote_path}backend.log && exit 1)"
    )
    
    stdin, stdout, stderr = ssh.exec_command(restart_cmd)
    out = stdout.read().decode('gb18030', errors='ignore')
    err = stderr.read().decode('gb18030', errors='ignore')
    
    print("\n--- Command Output ---")
    if out:
        print("STDOUT:")
        print(out)
    if err:
        print("STDERR:")
        print(err)
        
    ssh.close()
    print("Deployment completed successfully!")
except Exception as e:
    print(f"\nError occurred during deployment: {e}")
    sys.exit(1)
