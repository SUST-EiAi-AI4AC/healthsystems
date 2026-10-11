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
    out = stdout.read().decode('utf-8', errors='ignore').strip()
    return out

print("=== User Info (first 10) ===")
print(run_sql("SELECT user_id, user_name, email, garminPassword FROM user_info WHERE email IS NOT NULL AND email != '' LIMIT 10;"))

print("\n=== Recent entries in activity ===")
print(run_sql("SELECT id, email, calendarDate, totalSteps, maxHeartRate, restingHeartRate, sleepingSeconds, averageStressLevel, averageSpo2 FROM activity ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Recent entries in daily_steps ===")
print(run_sql("SELECT id, email, calendarDate, totalSteps, totalDistance, stepGoal FROM daily_steps ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Recent entries in heart_rate ===")
print(run_sql("SELECT id, email, calendarDate, maxHeartRate, minHeartRate, restingHeartRate FROM heart_rate ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Recent entries in sleep ===")
print(run_sql("SELECT id, email, calendarDate, sleep_score_overall, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress FROM sleep ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Recent entries in body_battery ===")
print(run_sql("SELECT id, email, date, charged, drained FROM body_battery ORDER BY date DESC LIMIT 5;"))

print("\n=== Recent entries in stress ===")
print(run_sql("SELECT id, email, calendarDate, maxStressLevel, avgStressLevel FROM stress ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Recent entries in spo2 ===")
print(run_sql("SELECT id, email, calendarDate, averageSpO2, lowestSpO2, latestSpO2 FROM spo2 ORDER BY calendarDate DESC LIMIT 5;"))

ssh.close()
