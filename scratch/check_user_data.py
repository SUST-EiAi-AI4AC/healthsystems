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

print("=== Activity for ccceee00021@163.com ===")
print(run_sql("SELECT id, email, calendarDate, totalSteps, maxHeartRate, minHeartRate, restingHeartRate, sleepingSeconds, averageStressLevel, bodyBatteryChargedValue, bodyBatteryDrainedValue, averageSpo2 FROM activity WHERE email = 'ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Check valid non-null rows in heart_rate for ccceee00021@163.com ===")
print(run_sql("SELECT id, calendarDate, maxHeartRate, minHeartRate, restingHeartRate FROM heart_rate WHERE email = 'ccceee00021@163.com' AND (maxHeartRate IS NOT NULL OR restingHeartRate IS NOT NULL) ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Check valid non-null rows in sleep for ccceee00021@163.com ===")
print(run_sql("SELECT id, calendarDate, sleep_score_overall, sleepTimeSeconds FROM sleep WHERE email = 'ccceee00021@163.com' AND (sleep_score_overall IS NOT NULL OR sleepTimeSeconds IS NOT NULL) ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Check valid non-null rows in stress for ccceee00021@163.com ===")
print(run_sql("SELECT id, calendarDate, avgStressLevel FROM stress WHERE email = 'ccceee00021@163.com' AND avgStressLevel IS NOT NULL ORDER BY calendarDate DESC LIMIT 5;"))

print("\n=== Check valid non-null rows in spo2 for ccceee00021@163.com ===")
print(run_sql("SELECT id, calendarDate, averageSpO2 FROM spo2 WHERE email = 'ccceee00021@163.com' AND averageSpO2 IS NOT NULL ORDER BY calendarDate DESC LIMIT 5;"))

ssh.close()
