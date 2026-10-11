import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('47.109.49.174', port=22, username='root', password='nwpuhs@ABC123!@#')

query = """
SELECT 'heart_rate' as tbl, count(*) as cnt, max(calendarDate) as latest FROM heart_rate WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'sleep', count(*), max(calendarDate) FROM sleep WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'daily_steps', count(*), max(calendarDate) FROM daily_steps WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'body_battery', count(*), max(date) FROM body_battery WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'stress', count(*), max(calendarDate) FROM stress WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'spo2', count(*), max(calendarDate) FROM spo2 WHERE email='ccceee00021@163.com'
UNION ALL
SELECT 'activity', count(*), max(calendarDate) FROM activity WHERE email='ccceee00021@163.com';
"""

stdin, stdout, stderr = ssh.exec_command(f"mysql -uroot -p'nwpuhs@ABC123!@#' healthsystem_test2 -e \"{query}\"")
print(stdout.read().decode())
ssh.close()
