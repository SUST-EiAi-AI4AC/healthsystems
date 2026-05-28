import sys
import os
import paramiko

def run_remote_commands():
    hostname = "47.109.49.174"
    username = "root"
    password = "nwpuhs@ABC123!@#"
    
    commands = [
        ("Service_Status", "systemctl status healthsystem --no-pager"),
        ("Listening_Ports", "ss -lntp | grep -E '8081|1443|443'"),
        ("Curl_8081", "curl -I http://127.0.0.1:8081/"),
        ("Curl_1443", "curl -k -I https://127.0.0.1:1443/"),
        ("Curl_Nginx", "curl -k -I https://www.nwpuhs.cn/")
    ]
    
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    log_path = "scratch/remote_diagnose_curl.log"
    with open(log_path, "w", encoding="utf-8") as f:
        try:
            f.write(f"Connecting to {username}@{hostname}...\n")
            client.connect(hostname, username=username, password=password, timeout=10)
            f.write("Connected successfully!\n\n")
            
            for name, cmd in commands:
                f.write("="*60 + "\n")
                f.write(f"Executing: {cmd} ({name})\n")
                f.write("="*60 + "\n")
                stdin, stdout, stderr = client.exec_command(cmd)
                out = stdout.read().decode('utf-8', errors='ignore')
                err = stderr.read().decode('utf-8', errors='ignore')
                if out:
                    f.write(out + "\n")
                if err:
                    f.write("STDERR:\n" + err + "\n")
                f.write("\n\n")
            print(f"Diagnostics written to {log_path} successfully!")
        except Exception as e:
            f.write(f"An error occurred: {e}\n")
            print(f"An error occurred: {e}")
        finally:
            client.close()

if __name__ == "__main__":
    run_remote_commands()
