import urllib.request
import json
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

req = urllib.request.Request(
    "https://www.nwpuhs.cn/user/login",
    data=json.dumps({"userNameOrPhone": "chf", "password": "123"}).encode("utf-8"),
    headers={"Content-Type": "application/json;charset=UTF-8"},
    method="POST"
)

try:
    with urllib.request.urlopen(req, context=ctx) as resp:
        headers = resp.info()
        token = headers.get("Authorization")
        raw = resp.read().decode("utf-8")
        print(f"Login headers Authorization: {token}")
        print("Login body:", raw)
        
        # Test getBinding
        req2 = urllib.request.Request("https://www.nwpuhs.cn/garminDataProcess/getBinding", headers={"Authorization": token})
        with urllib.request.urlopen(req2, context=ctx) as r2:
            print("getBinding:", r2.read().decode())

        # Test getCurrentDayHeartrate
        req3 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDayHeartrate", headers={"Authorization": token})
        with urllib.request.urlopen(req3, context=ctx) as r3:
            print("getCurrentDayHeartrate:", r3.read().decode())

        # Test getCurrentDaySleep
        req4 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDaySleep", headers={"Authorization": token})
        with urllib.request.urlopen(req4, context=ctx) as r4:
            print("getCurrentDaySleep:", r4.read().decode())

        # Test getCurrentDaySteps
        req5 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDaySteps", headers={"Authorization": token})
        with urllib.request.urlopen(req5, context=ctx) as r5:
            print("getCurrentDaySteps:", r5.read().decode())

        # Test getCurrentDayBodyBattery
        req6 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDayBodyBattery", headers={"Authorization": token})
        with urllib.request.urlopen(req6, context=ctx) as r6:
            print("getCurrentDayBodyBattery:", r6.read().decode())

        # Test getCurrentDayStress
        req7 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDayStress", headers={"Authorization": token})
        with urllib.request.urlopen(req7, context=ctx) as r7:
            print("getCurrentDayStress:", r7.read().decode())

        # Test getCurrentDaySpO2
        req8 = urllib.request.Request("https://www.nwpuhs.cn/healthInfo/getCurrentDaySpO2", headers={"Authorization": token})
        with urllib.request.urlopen(req8, context=ctx) as r8:
            print("getCurrentDaySpO2:", r8.read().decode())

except Exception as e:
    import traceback
    traceback.print_exc()
