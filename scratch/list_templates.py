import os

path = r"healthsystem-backend6/healthsystem-backend/src/main/resources/templates"
for root, dirs, files in os.walk(path):
    for f in files:
        fpath = os.path.join(root, f)
        print(os.path.relpath(fpath, path))
