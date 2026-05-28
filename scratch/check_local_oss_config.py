import os

user_dir = os.path.expanduser("~")
print("User directory:", user_dir)

files = os.listdir(user_dir)
for f in files:
    if "oss" in f.lower() or "ali" in f.lower():
        print("Found matching file/dir:", f)
        full_path = os.path.join(user_dir, f)
        if os.path.isfile(full_path):
            print("--- Content ---")
            try:
                with open(full_path, "r", encoding="utf-8", errors="ignore") as file:
                    print(file.read()[:500])
            except Exception as e:
                print("Error reading file:", e)
