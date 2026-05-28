import os
import re

js_dir = r"frontend/unpackage/dist/build/web/static/js"
if not os.path.exists(js_dir):
    print("js dir does not exist")
    exit()

for f in os.listdir(js_dir):
    if f.endswith('.js'):
        fpath = os.path.join(js_dir, f)
        with open(fpath, 'r', encoding='utf-8', errors='ignore') as file:
            content = file.read()
            # Search for ModelScope API key pattern ms-xxxxx
            matches = re.findall(r'ms-[0-9a-f\-]+', content)
            if matches:
                print(f"File {f} contains keys: {matches}")
            if "callMiniMaxAI" in content:
                print(f"File {f} contains callMiniMaxAI")
            # Search for the fallback message or fixed answers
            if "我现在有些不舒服" in content:
                print(f"File {f} contains the fallback message")
