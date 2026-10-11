import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

stdin, stdout, stderr = ssh.exec_command("cat /healthsystem-test/python_scripts/data_process/database_process.py")
content = stdout.read().decode('utf-8', errors='ignore')
with open("scratch/database_process_remote.py", "w", encoding="utf-8") as f:
    f.write(content)
print(f"Downloaded database_process.py ({len(content)} chars)")

ssh.close()
