import os

path = r"frontend/unpackage/dist/build/web/assets"
if os.path.exists(path):
    for f in os.listdir(path):
        fpath = os.path.join(path, f)
        print(f"{f}: {os.path.getsize(fpath)} bytes")
else:
    print("Assets directory does not exist")
