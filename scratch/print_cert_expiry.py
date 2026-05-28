import ssl
import socket
import datetime

hostname = 'www.nwpuhs.cn'
port = 443

print(f"Connecting to {hostname}:{port} to get certificate expiry...")
# Create context that does NOT verify certificate
context = ssl._create_unverified_context()
try:
    with socket.create_connection((hostname, port), timeout=5) as sock:
        with context.wrap_socket(sock, server_hostname=hostname) as ssock:
            cert = ssock.getpeercert()
            print("SSL Certificate retrieved (unverified context)!")
            expire_str = cert['notAfter']
            print(f"notAfter string: {expire_str}")
            # Format is like "May 25 23:59:59 2026 GMT"
            # Let's try parsing it
            try:
                expire_date = datetime.datetime.strptime(expire_str, '%b %d %H:%M:%S %Y %Z')
                print(f"Expiry date: {expire_date}")
            except Exception as pe:
                print(f"Parsing error: {pe}")
except Exception as e:
    print(f"Error: {e}")
