import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('47.109.49.174', port=22, username='root', password='nwpuhs@ABC123!@#')

queries = [
    ("heart_rate", "SELECT email, calendarDate, maxHeartRate, minHeartRate, restingHeartRate FROM heart_rate WHERE email='ccceee00021@163.com'"),
    ("sleep", "SELECT email, calendarDate, sleep_score_overall, sleepTimeSeconds, awakeSleepSeconds, avgSleepStress FROM sleep WHERE email='ccceee00021@163.com'"),
    ("daily_steps", "SELECT email, calendarDate, totalSteps, totalDistance, stepGoal FROM daily_steps WHERE email='ccceee00021@163.com'"),
    ("body_battery", "SELECT email, date, charged, drained FROM body_battery WHERE email='ccceee00021@163.com'"),
    ("stress", "SELECT email, calendarDate, maxStressLevel, avgStressLevel FROM stress WHERE email='ccceee00021@163.com'"),
    ("spo2", "SELECT email, calendarDate, averageSpO2, lowestSpO2, avgSleepSpO2 FROM spo2 WHERE email='ccceee00021@163.com'")
]

for name, q in queries:
    stdin, stdout, stderr = ssh.exec_command(f"mysql -uroot -p'nwpuhs@ABC123!@#' healthsystem_test2 -e \"{q}\"")
    print(f"=== {name} ===")
    print(stdout.read().decode())

ssh.close()
