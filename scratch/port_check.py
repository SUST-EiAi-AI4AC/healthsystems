import socket

target = "47.109.49.174"
ports = [22, 80, 443, 8081, 1443]

print(f"Checking ports on {target}...")
for port in ports:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(3.0)
    result = s.connect_ex((target, port))
    if result == 0:
        print(f"Port {port}: OPEN")
    else:
        print(f"Port {port}: CLOSED (error {result})")
    s.close()
