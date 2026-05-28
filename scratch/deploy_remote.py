import os
import subprocess
import paramiko
import time
import sys

# Local and remote paths
backend_dir = r"e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend"
local_jar = os.path.join(backend_dir, "target", "backend-0.0.1-SNAPSHOT.jar")
remote_path = "/healthsystem-test/"
remote_jar = remote_path + "backend-0.0.1-SNAPSHOT.jar"

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Step 1: Compiling and packaging backend locally...")
os.chdir(backend_dir)
# Build local jar
build_res = subprocess.run("mvn clean package -DskipTests", shell=True)
if build_res.returncode != 0:
    print("Error: Local build failed!")
    sys.exit(1)

if not os.path.exists(local_jar):
    print(f"Error: JAR file not found at {local_jar}")
    sys.exit(1)
print("Local compilation completed successfully!")

print("\nStep 2: Uploading JAR to remote server via SFTP...")
try:
    transport = paramiko.Transport((hostname, 22))
    transport.connect(username=username, password=password)
    sftp = paramiko.SFTPClient.from_transport(transport)
    
    # Show progress of upload
    def progress_callback(transferred, total):
        sys.stdout.write(f"\rTransferred: {transferred}/{total} bytes ({(transferred/total)*100:.2f}%)")
        sys.stdout.flush()

    sftp.put(local_jar, remote_jar, callback=progress_callback)
    print("\nSFTP Upload completed successfully!")
    sftp.close()
    transport.close()
except Exception as e:
    print(f"\nError uploading JAR: {e}")
    sys.exit(1)

print("\nStep 3: Connecting via SSH to restart backend service...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    
    # Kill old java process
    print("Killing existing backend process...")
    ssh.exec_command("pkill -f backend-0.0.1-SNAPSHOT.jar")
    time.sleep(2)
    
    # Start backend
    print("Starting new backend process...")
    start_cmd = f"nohup java -jar {remote_jar} --spring.profiles.active=deploy > {remote_path}backend.log 2>&1 &"
    ssh.exec_command(start_cmd)
    
    print("Waiting 10 seconds for backend to start up...")
    time.sleep(10)
    
    # Check if running
    stdin, stdout, stderr = ssh.exec_command("ps -ef | grep java | grep -v grep")
    ps_out = stdout.read().decode('utf-8')
    if ps_out:
        print("Backend process is RUNNING:")
        print(ps_out)
    else:
        print("Backend process failed to start! Check backend.log output below:")
        
    stdin, stdout, stderr = ssh.exec_command(f"tail -n 50 {remote_path}backend.log")
    print(stdout.read().decode('utf-8'))
    
    ssh.close()
except Exception as e:
    print(f"Error during SSH restart: {e}")
    sys.exit(1)
