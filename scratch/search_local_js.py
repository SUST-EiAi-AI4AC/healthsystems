import os

dir_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystem\frontend\unpackage\dist\build\web\static\js"
keywords = ["nwpuhs.cn", "47.109.49.174", "8081", "playe.top"]

for root, dirs, files in os.walk(dir_path):
    for file in files:
        if file.endswith(".js"):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                for kw in keywords:
                    if kw in content:
                        print(f"Found '{kw}' in {file}")
                        # print context
                        idx = content.find(kw)
                        print("  Context:", content[max(0, idx-50):min(len(content), idx+150)])
            except Exception as e:
                print(f"Error reading {file}: {e}")
