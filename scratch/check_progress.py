import os
import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"
remote_jar = "/healthsystem-test/backend-0.0.1-SNAPSHOT.jar"

try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15, banner_timeout=15)
    sftp = ssh.open_sftp()
    try:
        remote_size = sftp.stat(remote_jar).st_size
    except FileNotFoundError:
        remote_size = 0
    local_size = os.path.getsize(r"e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend\target\backend-0.0.1-SNAPSHOT.jar")
    print(f"Local size: {local_size} bytes")
    print(f"Remote size: {remote_size} bytes")
    if local_size > 0:
        print(f"Progress: {(remote_size / local_size) * 100:.2f}%")
    sftp.close()
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
