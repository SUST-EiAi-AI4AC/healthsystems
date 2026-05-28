import socket

ip = '47.109.49.174'
port = 8081
print(f"Connecting to public IP {ip}:{port}...")
try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)
    result = sock.connect_ex((ip, port))
    if result == 0:
        print("Port 8081 is OPEN publicly!")
    else:
        print(f"Port 8081 is CLOSED or BLOCKED publicly (code {result})")
    sock.close()
except Exception as e:
    print(f"Error: {e}")
