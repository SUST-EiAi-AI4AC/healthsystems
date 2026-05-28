import paramiko

def main():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    try:
        print("Connecting to 47.109.49.174...")
        ssh.connect("47.109.49.174", username="root", password="nwpuhs@ABC123!@#")
        print("Connected! Fetching remote logs...")
        
        # List files in /healthsystem-test/
        stdin, stdout, stderr = ssh.exec_command("ls -la /healthsystem-test/")
        print("\n--- Files in /healthsystem-test/ ---")
        print(stdout.read().decode('utf-8'))
        
        # Check java version on remote
        stdin, stdout, stderr = ssh.exec_command("java -version")
        print("--- Java Version ---")
        print(stderr.read().decode('utf-8'))
        
        # Tail backend.log
        print("\n--- Last 150 lines of backend.log ---")
        stdin, stdout, stderr = ssh.exec_command("tail -n 150 /healthsystem-test/backend.log")
        print(stdout.read().decode('utf-8', errors='ignore'))
        
        # Also list all running java processes
        stdin, stdout, stderr = ssh.exec_command("ps -ef | grep java")
        java_out = stdout.read().decode('utf-8')
        print("\nRunning Java processes:")
        print(java_out)
        
    except Exception as e:
        print(f"Error during execution: {e}")
    finally:
        ssh.close()

if __name__ == "__main__":
    main()
