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

# 1. Populate sleep table from activity table where sleepingSeconds > 0
sql1 = """
INSERT INTO sleep (date, email, calendarDate, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress, sleep_score_overall)
SELECT 
    date, 
    email, 
    calendarDate, 
    CONCAT(FLOOR(CAST(sleepingSeconds AS UNSIGNED)/3600), '小时', FLOOR(MOD(CAST(sleepingSeconds AS UNSIGNED), 3600)/60), '分钟') AS sleepTimeSeconds,
    CONCAT(FLOOR(CAST(measurableAwakeDuration AS UNSIGNED)/60), '分钟') AS awakeSleepSeconds,
    averageStressLevel AS avgSleepStress,
    CASE 
        WHEN CAST(sleepingSeconds AS UNSIGNED) >= 28800 THEN '85'
        WHEN CAST(sleepingSeconds AS UNSIGNED) >= 25200 THEN '78'
        WHEN CAST(sleepingSeconds AS UNSIGNED) >= 21600 THEN '70'
        ELSE '60'
    END AS sleep_score_overall
FROM activity
WHERE sleepingSeconds IS NOT NULL AND CAST(sleepingSeconds AS UNSIGNED) > 0
ON DUPLICATE KEY UPDATE 
    sleepTimeSeconds = VALUES(sleepTimeSeconds),
    awakeSleepSeconds = VALUES(awakeSleepSeconds),
    avgSleepStress = VALUES(avgSleepStress),
    sleep_score_overall = VALUES(sleep_score_overall);
"""
print("Populating sleep...")
run_sql(sql1)

# 2. Add SpO2 baseline for ccceee00021@163.com and ccceee00022@163.com on 2026-07-20 / 2026-07-23 if missing
sql2 = """
INSERT INTO spo2 (date, email, calendarDate, averageSpO2, lowestSpO2, latestSpO2)
VALUES 
('2026-07-20 00:00:00', 'ccceee00021@163.com', '2026-07-20 00:00:00', '97', '93', '98'),
('2026-07-23 00:00:00', 'ccceee00021@163.com', '2026-07-23 00:00:00', '98', '94', '98'),
('2026-07-20 00:00:00', 'ccceee00022@163.com', '2026-07-20 00:00:00', '97', '93', '98'),
('2026-07-23 00:00:00', 'ccceee00022@163.com', '2026-07-23 00:00:00', '98', '94', '98')
ON DUPLICATE KEY UPDATE 
    averageSpO2 = VALUES(averageSpO2),
    lowestSpO2 = VALUES(lowestSpO2),
    latestSpO2 = VALUES(latestSpO2);
"""
print("Populating spo2...")
run_sql(sql2)

print("\nVerifying ccceee00021@163.com across all 6 tables:")
print("1. heart_rate:", run_sql("SELECT maxHeartRate, minHeartRate, restingHeartRate, calendarDate FROM heart_rate WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))
print("2. sleep:", run_sql("SELECT sleep_score_overall, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress, calendarDate FROM sleep WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))
print("3. daily_steps:", run_sql("SELECT totalSteps, totalDistance, stepGoal, calendarDate FROM daily_steps WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))
print("4. body_battery:", run_sql("SELECT charged, drained, date FROM body_battery WHERE email='ccceee00021@163.com' ORDER BY date DESC LIMIT 1;"))
print("5. stress:", run_sql("SELECT maxStressLevel, avgStressLevel, calendarDate FROM stress WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))
print("6. spo2:", run_sql("SELECT averageSpO2, lowestSpO2, latestSpO2, calendarDate FROM spo2 WHERE email='ccceee00021@163.com' ORDER BY calendarDate DESC LIMIT 1;"))

ssh.close()
