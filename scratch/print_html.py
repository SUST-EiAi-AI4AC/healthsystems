import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

url = "https://www.nwpuhs.cn/"
try:
    response = requests.get(url, verify=False, timeout=10)
    print("HTML HEAD:")
    print(response.text[:2000])
except Exception as e:
    print(f"Error: {e}")
