import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

sftp = ssh.open_sftp()
local_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\python-garminconnect-master\sync_garmin.py"
remote_path = "/healthsystem-test/python_scripts/python-garminconnect-master/sync_garmin.py"
sftp.put(local_path, remote_path)
sftp.close()
print("Uploaded sync_garmin.py to remote server successfully!")

stdin, stdout, stderr = ssh.exec_command("chmod +x /healthsystem-test/python_scripts/python-garminconnect-master/sync_garmin.py")
print("Chmod exit:", stdout.channel.recv_exit_status())

ssh.close()
