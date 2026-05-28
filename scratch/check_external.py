import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

url = "https://www.nwpuhs.cn/"
print(f"Connecting to {url}...")
try:
    response = requests.get(url, verify=False, timeout=10)
    print(f"Status Code: {response.status_code}")
    print(f"Headers: {response.headers}")
    print(f"Length of response: {len(response.text)}")
except Exception as e:
    print(f"Error connecting: {e}")
