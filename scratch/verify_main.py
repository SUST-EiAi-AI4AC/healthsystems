import urllib.request
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = "https://www.nwpuhs.cn/"
print(f"Requesting {url}...")
try:
    with urllib.request.urlopen(url, context=ctx, timeout=10) as response:
        status = response.status
        html = response.read().decode('utf-8', errors='ignore')
        print(f"Response Status: {status}")
        if "<title>" in html:
            title_start = html.find("<title>") + len("<title>")
            title_end = html.find("</title>")
            print(f"Title: {html[title_start:title_end]}")
        else:
            print("No title tag found.")
except Exception as e:
    print(f"Error checking main page: {e}")
