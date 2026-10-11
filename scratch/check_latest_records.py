import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

def run_sql(sql):
    cmd = f'mysql -u root -pnwpuhs@ABC123\\!@# healthsystem_test2 -e "{sql}"'
    stdin, stdout, stderr = ssh.exec_command(cmd)
    return stdout.read().decode('utf-8', errors='ignore').strip()

email = "ccceee00021@163.com"
print("heart_rate latest:\n", run_sql(f"SELECT * FROM heart_rate WHERE email='{email}' ORDER BY calendarDate DESC LIMIT 1;"))
print("\nsleep latest:\n", run_sql(f"SELECT * FROM sleep WHERE email='{email}' ORDER BY calendarDate DESC LIMIT 1;"))
print("\ndaily_steps latest:\n", run_sql(f"SELECT * FROM daily_steps WHERE email='{email}' ORDER BY calendarDate DESC LIMIT 1;"))
print("\nbody_battery latest:\n", run_sql(f"SELECT * FROM body_battery WHERE email='{email}' ORDER BY date DESC LIMIT 1;"))
print("\nstress latest:\n", run_sql(f"SELECT * FROM stress WHERE email='{email}' ORDER BY calendarDate DESC LIMIT 1;"))
print("\nspo2 latest:\n", run_sql(f"SELECT * FROM spo2 WHERE email='{email}' ORDER BY calendarDate DESC LIMIT 1;"))

ssh.close()
