import urllib.request
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = "https://www.nwpuhs.cn/welcome.html"
print(f"Requesting {url}...")
try:
    with urllib.request.urlopen(url, context=ctx, timeout=10) as response:
        status = response.status
        html = response.read().decode('utf-8')
        print(f"Response Status: {status}")
        print("Page Title Check:")
        if "<title>" in html:
            title_start = html.find("<title>") + len("<title>")
            title_end = html.find("</title>")
            print(f"Title: {html[title_start:title_end]}")
        else:
            print("No title tag found.")
        
        # Check some key sections
        print("\nChecking sections in page:")
        keywords = ["项目简介", "用户画像", "特色功能", "竞品分析", "用户评价", "会员计划", "立即使用"]
        for kw in keywords:
            present = kw in html
            print(f"- '{kw}': {'FOUND' if present else 'NOT FOUND'}")
            
except Exception as e:
    print(f"Error checking page: {e}")
