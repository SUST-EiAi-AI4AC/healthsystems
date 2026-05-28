import urllib.request
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

try:
    req = urllib.request.Request("https://h.playe.top/", headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, context=ctx, timeout=10) as response:
        print("Status Code:", response.getcode())
        print("Headers:")
        for k, v in response.getheaders():
            print(f"  {k}: {v}")
        html = response.read().decode('utf-8', errors='ignore')
        print("Title:", html[html.find("<title>")+7:html.find("</title>")])
except Exception as e:
    print("Error:", e)
