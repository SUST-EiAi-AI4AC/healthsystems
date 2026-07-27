import urllib.request
import urllib.error

url = "http://localhost:8081/garminAnalysis/statistics"
try:
    req = urllib.request.Request(url)
    with urllib.request.urlopen(req) as resp:
        print("Status:", resp.status)
        print("Body:", resp.read().decode('utf-8'))
except urllib.error.HTTPError as e:
    print("HTTPError Status:", e.code)
    print("HTTPError Body:", e.read().decode('utf-8'))
except Exception as e:
    print("Error:", e)
