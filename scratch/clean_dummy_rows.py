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

sqls = [
    "DELETE FROM heart_rate WHERE (maxHeartRate IS NULL OR maxHeartRate = '' OR maxHeartRate = 'null') AND (restingHeartRate IS NULL OR restingHeartRate = '' OR restingHeartRate = 'null');",
    "DELETE FROM sleep WHERE (sleep_score_overall IS NULL OR sleep_score_overall = '' OR sleep_score_overall = 'null') AND (sleepTimeSeconds IS NULL OR sleepTimeSeconds = '' OR sleepTimeSeconds = 'null');",
    "DELETE FROM body_battery WHERE (charged IS NULL OR charged = '' OR charged = 'null') AND (drained IS NULL OR drained = '' OR drained = 'null');",
    "DELETE FROM stress WHERE (avgStressLevel IS NULL OR avgStressLevel = '' OR avgStressLevel = 'null') AND (maxStressLevel IS NULL OR maxStressLevel = '' OR maxStressLevel = 'null');",
    "DELETE FROM spo2 WHERE (averageSpO2 IS NULL OR averageSpO2 = '' OR averageSpO2 = 'null') AND (lowestSpO2 IS NULL OR lowestSpO2 = '' OR lowestSpO2 = 'null');"
]

for s in sqls:
    print("Running:", s)
    run_sql(s)

print("Remaining rows:")
print("heart_rate:", run_sql("SELECT count(*) FROM heart_rate;"))
print("sleep:", run_sql("SELECT count(*) FROM sleep;"))
print("body_battery:", run_sql("SELECT count(*) FROM body_battery;"))
print("stress:", run_sql("SELECT count(*) FROM stress;"))
print("spo2:", run_sql("SELECT count(*) FROM spo2;"))

ssh.close()
