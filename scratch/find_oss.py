import os

keywords = ["oss", "ossutil", "bucket", "playe.top", "accesskey", "secretkey", "aliyun"]
found_files = []

for root, dirs, files in os.walk("."):
    # skip .git, unpackage, node_modules, etc
    if any(p in root for p in [".git", "unpackage", "node_modules", "healthsystem-backend6", "python-garminconnect-master"]):
        continue
    for file in files:
        if file.endswith((".js", ".json", ".ps1", ".md", ".yml", ".properties", ".txt")):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                for kw in keywords:
                    if kw in content.lower():
                        print(f"Found keyword '{kw}' in {file_path}")
                        found_files.append((file_path, kw))
            except Exception as e:
                pass
