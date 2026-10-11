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

print("NULL rows in heart_rate:", run_sql("SELECT count(*) FROM heart_rate WHERE (maxHeartRate IS NULL OR maxHeartRate = '') AND (restingHeartRate IS NULL OR restingHeartRate = '');"))
print("NULL rows in sleep:", run_sql("SELECT count(*) FROM sleep WHERE (sleep_score_overall IS NULL OR sleep_score_overall = '') AND (sleepTimeSeconds IS NULL OR sleepTimeSeconds = '');"))
print("NULL rows in body_battery:", run_sql("SELECT count(*) FROM body_battery WHERE (charged IS NULL OR charged = '') AND (drained IS NULL OR drained = '');"))
print("NULL rows in stress:", run_sql("SELECT count(*) FROM stress WHERE (avgStressLevel IS NULL OR avgStressLevel = '') AND (maxStressLevel IS NULL OR maxStressLevel = '');"))
print("NULL rows in spo2:", run_sql("SELECT count(*) FROM spo2 WHERE (averageSpO2 IS NULL OR averageSpO2 = '') AND (lowestSpO2 IS NULL OR lowestSpO2 = '');"))

ssh.close()
