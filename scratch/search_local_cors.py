import os

dir_path = "healthsystem-backend6/healthsystem-backend/"
keywords = ["cors", "crossorigin", "allowedorigin", "origin"]

for root, dirs, files in os.walk(dir_path):
    for file in files:
        if file.endswith((".java", ".yml", ".properties")):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                for kw in keywords:
                    if kw in content.lower():
                        print(f"Found '{kw}' in {file_path}")
                        # print context
                        idx = content.lower().find(kw)
                        print("  Context:", content[max(0, idx-50):min(len(content), idx+150)].replace('\n', ' '))
            except Exception as e:
                pass
