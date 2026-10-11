import requests

res = requests.get("http://47.109.49.174:8081/garminAnalysis/getUserTrend?email=ccceee00021@163.com&limit=7")
print("Status:", res.status_code)
print("Data:", res.json())
