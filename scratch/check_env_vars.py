import os
import paramiko

print("--- LOCAL ENV VARS ---")
for k, v in os.environ.items():
    if any(kw in k.lower() for kw in ["ali", "oss", "key", "secret", "bucket", "deploy"]):
        print(f"{k} = {v}")

print("\n--- REMOTE ENV VARS ---")
hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=15)
    
    stdin, stdout, stderr = ssh.exec_command("env")
    env_out = stdout.read().decode('utf-8', errors='ignore')
    for line in env_out.splitlines():
        if any(kw in line.lower() for kw in ["ali", "oss", "key", "secret", "bucket", "deploy"]):
            print(line)
    ssh.close()
except Exception as e:
    print("Remote error:", e)
