import ssl
import socket
import datetime

hostname = 'www.nwpuhs.cn'
port = 443

print(f"Connecting to {hostname}:{port} to check SSL certificate...")
context = ssl.create_default_context()
try:
    with socket.create_connection((hostname, port), timeout=5) as sock:
        with context.wrap_socket(sock, server_hostname=hostname) as ssock:
            cert = ssock.getpeercert()
            print("SSL Certificate retrieved successfully!")
            
            # Extract expiry date
            expire_str = cert['notAfter']
            expire_date = datetime.datetime.strptime(expire_str, '%b %d %H:%M:%S %Y %Z')
            print(f"Certificate expires on: {expire_date}")
            
            now = datetime.datetime.utcnow()
            days_left = (expire_date - now).days
            print(f"Days left: {days_left}")
            if days_left < 0:
                print("WARNING: Certificate is EXPIRED!")
            else:
                print("Certificate is VALID.")
except Exception as e:
    print(f"Error checking SSL: {e}")
