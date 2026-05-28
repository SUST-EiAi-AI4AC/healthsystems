import paramiko
import sys

# Set standard output encoding to utf-8
sys.stdout.reconfigure(encoding='utf-8')

def main():
    host = "47.109.49.174"
    username = "root"
    password = "nwpuhs@ABC123!@#"
    
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    try:
        ssh.connect(host, username=username, password=password)
        print("SSH Connection successful!")
        
        # Check Nginx config
        print("--- Nginx Configuration ---")
        stdin, stdout, stderr = ssh.exec_command("cat /etc/nginx/nginx.conf")
        print(stdout.read().decode('utf-8', errors='ignore'))
        
        # Check if there are other conf.d files
        stdin, stdout, stderr = ssh.exec_command("ls /etc/nginx/conf.d/")
        conf_files = stdout.read().decode('utf-8').splitlines()
        print("conf.d files:", conf_files)
        for f in conf_files:
            print(f"--- conf.d/{f} ---")
            stdin, stdout, stderr = ssh.exec_command(f"cat /etc/nginx/conf.d/{f}")
            print(stdout.read().decode('utf-8', errors='ignore'))

    except Exception as e:
        print(f"Error: {e}")
    finally:
        ssh.close()

if __name__ == "__main__":
    main()
