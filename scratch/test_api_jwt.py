import jwt
import time
import datetime
import urllib.request
import json
import ssl

SECRET = "nwpuf4e2e52034348f86b67cde581c0f9eb5"
now = int(time.time())
exp = now + 7 * 24 * 3600

# create JWT token matching Auth0 Java JWT format
payload = {
    "username": "xtt",
    "exp": exp
}
token = jwt.encode(payload, SECRET, algorithm="HS256")
print("Generated Token for xtt:", token)

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

headers = {"Authorization": token}

endpoints = [
    ("/garminDataProcess/getBinding", "GET"),
    ("/healthInfo/getCurrentDayHeartrate", "GET"),
    ("/healthInfo/getCurrentDaySleep", "GET"),
    ("/healthInfo/getCurrentDaySteps", "GET"),
    ("/healthInfo/getCurrentDayBodyBattery", "GET"),
    ("/healthInfo/getCurrentDayStress", "GET"),
    ("/healthInfo/getCurrentDaySpO2", "GET"),
    ("/healthInfo/getStepsHistory?period=7", "GET"),
    ("/healthInfo/getHeartrateHistory?period=7", "GET"),
    ("/healthInfo/getSleepHistory?period=7", "GET"),
    ("/healthInfo/getBodyBatteryHistory?period=7", "GET"),
    ("/healthInfo/getStressHistory?period=7", "GET"),
    ("/healthInfo/getSpO2History?period=7", "GET")
]

for ep, method in endpoints:
    url = f"https://www.nwpuhs.cn{ep}"
    req = urllib.request.Request(url, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, context=ctx) as resp:
            data = resp.read().decode("utf-8")
            print(f"=== {ep} ===")
            print(data)
    except Exception as e:
        print(f"FAILED {ep}: {e}")
