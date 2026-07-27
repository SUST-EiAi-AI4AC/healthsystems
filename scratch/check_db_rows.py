import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

tables = ["user_info", "activity", "heart_rate", "sleep", "daily_steps", "body_battery", "stress", "spo2"]
for tbl in tables:
    cmd = f"mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; SELECT COUNT(*) FROM {tbl};\""
    stdin, stdout, stderr = ssh.exec_command(cmd)
    out = stdout.read().decode('utf-8', errors='ignore').strip()
    err = stderr.read().decode('utf-8', errors='ignore').strip()
    lines = out.splitlines()
    count = lines[1] if len(lines) > 1 else out
    print(f"Table {tbl}: {count}")

ssh.close()
