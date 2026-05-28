import sys
import os
import time
import paramiko

def setup_systemd_service():
    hostname = "47.109.49.174"
    username = "root"
    password = "nwpuhs@ABC123!@#"
    
    # We define the systemd service file content
    service_content = """[Unit]
Description=HealthSystem Spring Boot Backend Service
After=syslog.target network.target mysql.service

[Service]
Type=simple
User=root
WorkingDirectory=/healthsystem-test
ExecStart=/bin/bash -c "exec /usr/bin/java -Xmx512m -Xms256m -jar /healthsystem-test/backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=deploy >> /healthsystem-test/backend.log 2>&1"
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
"""
    
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    try:
        print(f"Connecting to {username}@{hostname}...")
        client.connect(hostname, username=username, password=password, timeout=10)
        print("Connected successfully!")
        
        # 1. Kill any existing manual java processes
        print("Stopping existing manual Java backend processes...")
        client.exec_command("pkill -f backend-0.0.1-SNAPSHOT.jar || true")
        time.sleep(2)
        
        # 2. Write the service file
        print("Writing systemd service file `/etc/systemd/system/healthsystem.service`...")
        sftp = client.open_sftp()
        with sftp.file("/etc/systemd/system/healthsystem.service", "w") as f:
            f.write(service_content)
        sftp.close()
        
        # 3. Reload systemd daemon and enable service
        print("Reloading systemd daemon and enabling service...")
        client.exec_command("systemctl daemon-reload")
        client.exec_command("systemctl enable healthsystem")
        
        # 4. Start the service
        print("Starting/Restarting healthsystem service...")
        stdin, stdout, stderr = client.exec_command("systemctl restart healthsystem")
        err = stderr.read().decode('utf-8', errors='ignore')
        if err:
            print(f"Error restarting service: {err}")
            
        print("Waiting 5 seconds for service startup...")
        time.sleep(5)
        
        # 5. Check status
        print("=== Service Status ===")
        stdin, stdout, stderr = client.exec_command("systemctl status healthsystem --no-pager")
        print(stdout.read().decode('utf-8', errors='ignore'))
        
        # 6. Check if listening on 8081
        print("=== Listening Ports ===")
        stdin, stdout, stderr = client.exec_command("ss -lntp | grep 8081")
        print(stdout.read().decode('utf-8', errors='ignore'))
        
        # 7. Print last 50 lines of backend.log
        print("=== Last 50 lines of backend.log ===")
        stdin, stdout, stderr = client.exec_command("tail -n 50 /healthsystem-test/backend.log")
        print(stdout.read().decode('utf-8', errors='ignore'))
        
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        client.close()

if __name__ == "__main__":
    setup_systemd_service()
