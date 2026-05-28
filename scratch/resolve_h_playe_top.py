import socket
import requests

domain = "h.playe.top"
print(f"Resolving domain: {domain}...")
try:
    ip = socket.gethostbyname(domain)
    print(f"Resolved IP: {ip}")
except Exception as e:
    print(f"Failed to resolve DNS: {e}")
    ip = None

url = f"http://{domain}/"
print(f"Connecting to {url}...")
try:
    response = requests.get(url, timeout=10)
    print(f"Status Code: {response.status_code}")
    print(f"Headers: {response.headers}")
    print(f"Length of response: {len(response.text)}")
    print("Content preview:")
    print(response.text[:1000])
except Exception as e:
    print(f"Error connecting: {e}")
