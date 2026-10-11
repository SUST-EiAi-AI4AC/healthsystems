import requests
import urllib3
urllib3.disable_warnings()

try:
    res = requests.get("https://www.nwpuhs.cn/garminAnalysis/getUserTrend?email=ccceee00021@163.com&limit=7", verify=False, timeout=10)
    print("HTTPS Status:", res.status_code)
    print("Data:", res.text[:500])
except Exception as e:
    print("HTTPS error:", e)

try:
    res2 = requests.get("http://47.109.49.174:8081/healthInfo/getCurrentDayHeartrate", verify=False, timeout=10)
    print("8081 Status:", res2.status_code)
except Exception as e:
    print("8081 error:", e)
