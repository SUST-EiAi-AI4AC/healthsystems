import os

build_dir = r"frontend/unpackage/dist/build/web"
if os.path.exists(build_dir):
    print("Files in build/web:")
    for root, dirs, files in os.walk(build_dir):
        for f in files:
            full_path = os.path.join(root, f)
            rel_path = os.path.relpath(full_path, build_dir)
            size = os.path.getsize(full_path)
            mtime = os.path.getmtime(full_path)
            import time
            print(f"  {rel_path} ({size} bytes) - Last Modified: {time.ctime(mtime)}")
else:
    print(f"Directory {build_dir} does not exist.")
