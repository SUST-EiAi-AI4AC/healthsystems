import os
import time

files = [
    r"frontend/pages/heal/heal.vue",
    r"frontend/unpackage/dist/build/web/index.html",
    r"frontend/unpackage/dist/build/web/assets/index-Bv5r_mQh.js", # Let's see if we can find js files
    r"healthsystem-backend6/healthsystem-backend/src/main/resources/templates/welcome.html"
]

for f in files:
    try:
        mtime = os.path.getmtime(f)
        print(f"{f}: {time.ctime(mtime)}")
    except Exception as e:
        print(f"Error for {f}: {e}")

# List files in assets to find the js file
assets_path = r"frontend/unpackage/dist/build/web/assets"
if os.path.exists(assets_path):
    print("\nFiles in assets:")
    for file in os.listdir(assets_path):
        fpath = os.path.join(assets_path, file)
        print(f"  {file}: {time.ctime(os.path.getmtime(fpath))}")
