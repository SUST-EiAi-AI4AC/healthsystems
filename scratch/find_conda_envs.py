import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

stdin, stdout, stderr = ssh.exec_command("/root/anaconda3/bin/conda info --envs")
print("Conda envs:\n", stdout.read().decode('utf-8', errors='ignore'))

stdin, stdout, stderr = ssh.exec_command("find / -name 'garminconnect' 2>/dev/null")
print("Found garminconnect at:\n", stdout.read().decode('utf-8', errors='ignore'))

ssh.close()
