import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

cmd = "/root/anaconda3/envs/garmin/bin/python /healthsystem-test/python_scripts/python-garminconnect-master/sync_garmin.py --help"
stdin, stdout, stderr = ssh.exec_command(cmd)
print("Remote python test stdout:\n", stdout.read().decode('utf-8', errors='ignore'))
print("Remote python test stderr:\n", stderr.read().decode('utf-8', errors='ignore'))

ssh.close()
