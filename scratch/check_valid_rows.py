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

print("Valid rows with data:")
print("heart_rate with data:", run_sql("SELECT count(*) FROM heart_rate WHERE maxHeartRate IS NOT NULL AND maxHeartRate != '';"))
print("sleep with data:", run_sql("SELECT count(*) FROM sleep WHERE (sleep_score_overall IS NOT NULL AND sleep_score_overall != '') OR (sleepTimeSeconds IS NOT NULL AND sleepTimeSeconds != '');"))
print("body_battery with data:", run_sql("SELECT count(*) FROM body_battery WHERE (charged IS NOT NULL AND charged != '') OR (drained IS NOT NULL AND drained != '');"))
print("stress with data:", run_sql("SELECT count(*) FROM stress WHERE (avgStressLevel IS NOT NULL AND avgStressLevel != '') OR (maxStressLevel IS NOT NULL AND maxStressLevel != '');"))
print("spo2 with data:", run_sql("SELECT count(*) FROM spo2 WHERE (averageSpO2 IS NOT NULL AND averageSpO2 != '') OR (lowestSpO2 IS NOT NULL AND lowestSpO2 != '');"))

ssh.close()
