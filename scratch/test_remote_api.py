import paramiko
import time

def run_test():
    for attempt in range(1, 6):
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect("47.109.49.174", username="root", password="nwpuhs@ABC123!@#", timeout=20)

            cmd = """
            TOKEN=$(curl -i -s -X POST -H 'Content-Type: application/json' -d '{"userNameOrPhone":"chf","password":"123456"}' http://localhost:8081/user/login | grep -i '^Authorization:' | awk '{print $2}' | tr -d '\r')
            echo "Extracted TOKEN: ${TOKEN:0:30}..."
            echo "=== Testing /garminAnalysis/detail/10191 ==="
            curl -s -H "Authorization: $TOKEN" http://localhost:8081/garminAnalysis/detail/10191
            """

            _, stdout, stderr = ssh.exec_command(cmd)
            out = stdout.read().decode('utf-8', errors='ignore')
            ssh.close()
            return out
        except Exception as e:
            print(f"Attempt {attempt} failed: {e}")
            time.sleep(3)
    return "All attempts failed"

print(run_test())
