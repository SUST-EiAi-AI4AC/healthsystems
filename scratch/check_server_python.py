import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

stdin, stdout, stderr = ssh.exec_command("/root/anaconda3/envs/garmin/bin/python -c 'import garminconnect, garth, pymysql; print(\"OK\")'")
print("Server Python env test:", stdout.read().decode('utf-8', errors='ignore'))
err = stderr.read().decode('utf-8', errors='ignore')
if err:
    print("Error:", err)

stdin, stdout, stderr = ssh.exec_command("which python; which python3; /root/anaconda3/envs/garmin/bin/python --version")
print("Python versions:", stdout.read().decode('utf-8', errors='ignore'))

ssh.close()
