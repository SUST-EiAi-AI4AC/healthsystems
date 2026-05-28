import urllib3
import requests

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

urls = [
    "http://47.109.49.174:8081/",
    "https://47.109.49.174:1443/",
    "https://www.nwpuhs.cn/",
    "https://www.nwpuhs.cn/user/login"
]

print("Sending HTTP/HTTPS requests to endpoints...")
for url in urls:
    try:
        r = requests.get(url, timeout=5, verify=False)
        print(f"URL: {url} -> Status: {r.status_code}")
        print(f"Headers: {dict(r.headers)}")
        print(f"Body snippet: {r.text[:200]}\n")
    except Exception as e:
        print(f"URL: {url} -> Failed with error: {e}\n")
