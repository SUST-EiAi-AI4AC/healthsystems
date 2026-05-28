import paramiko

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=30)
    
    # Find folders containing index.html in /var/www/ or /usr/share/nginx/ or anywhere else
    cmd = "find / -name index.html 2>/dev/null | grep -E 'h5|health|dist|www|nginx|playe'"
    stdin, stdout, stderr = ssh.exec_command(cmd)
    
    print("STDOUT:")
    print(stdout.read().decode('utf-8', errors='ignore'))
    print("STDERR:")
    print(stderr.read().decode('utf-8', errors='ignore'))
    
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
