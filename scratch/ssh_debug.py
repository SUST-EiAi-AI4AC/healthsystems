import paramiko
import logging
import sys

logging.basicConfig(level=logging.DEBUG, stream=sys.stdout)

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

print("Connecting...")
try:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname, username=username, password=password, timeout=10, banner_timeout=10)
    print("Connected successfully!")
    ssh.close()
except Exception as e:
    print(f"Error: {e}")
