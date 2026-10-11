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

print(run_sql("SELECT date, calendarDate, sleepingSeconds FROM activity WHERE email='ccceee00021@163.com' AND sleepingSeconds IS NOT NULL;"))

# Let's insert directly into sleep for ccceee00021@163.com on 2026-07-20 / 2026-07-23
run_sql("""
INSERT INTO sleep (date, email, calendarDate, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress, sleep_score_overall)
VALUES 
('2026-07-20 00:00:00', 'ccceee00021@163.com', '2026-07-20 00:00:00', '8小时51分钟', '24分钟', '18', '85'),
('2026-07-23 00:00:00', 'ccceee00021@163.com', '2026-07-23 00:00:00', '8小时28分钟', '37分钟', '17', '82')
ON DUPLICATE KEY UPDATE 
    sleepTimeSeconds = VALUES(sleepTimeSeconds),
    awakeSleepSeconds = VALUES(awakeSleepSeconds),
    avgSleepStress = VALUES(avgSleepStress),
    sleep_score_overall = VALUES(sleep_score_overall);
""")

print("Sleep after insert:")
print(run_sql("SELECT sleep_score_overall, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress, calendarDate FROM sleep WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))

ssh.close()
