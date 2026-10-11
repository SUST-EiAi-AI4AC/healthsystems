import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('47.109.49.174', port=22, username='root', password='nwpuhs@ABC123!@#')
stdin, stdout, stderr = ssh.exec_command("mysql -uroot -p'nwpuhs@ABC123!@#' healthsystem_test2 -e 'SELECT user_id, user_name, email, LEFT(garminPassword, 3) as pwd_prefix FROM user_info WHERE email IS NOT NULL AND email != \"\";'")
print(stdout.read().decode())
ssh.close()
