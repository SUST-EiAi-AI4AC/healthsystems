import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

stdin, stdout, stderr = ssh.exec_command("ps -ef | grep java")
print("Remote Java process:\n", stdout.read().decode('utf-8', errors='ignore'))

stdin, stdout, stderr = ssh.exec_command("ls -la /healthsystem-test/backend*")
print("Remote JAR file:\n", stdout.read().decode('utf-8', errors='ignore'))

ssh.close()
