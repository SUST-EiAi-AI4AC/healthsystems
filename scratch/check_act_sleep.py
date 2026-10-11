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

# Check what sleeping seconds exist in activity
print(run_sql("""
SELECT email, calendarDate, sleepingSeconds, measurableAwakeDuration, averageStressLevel, averageSpo2, lowestSpo2, latestSpo2 
FROM activity 
WHERE sleepingSeconds > 0 OR averageSpo2 IS NOT NULL
ORDER BY calendarDate DESC LIMIT 10;
"""))

ssh.close()
