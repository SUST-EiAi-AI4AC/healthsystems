import socket

domain = "www.nwpuhs.cn"
print(f"Resolving {domain}...")
try:
    ip = socket.gethostbyname(domain)
    print(f"Resolved IP: {ip}")
except Exception as e:
    print(f"Failed: {e}")
