import os

build_dir = r"frontend/unpackage/dist/build/web"
js_files = []
for root, dirs, files in os.walk(build_dir):
    for f in files:
        if f.endswith('.js'):
            js_files.append(os.path.join(root, f))

print(f"Found {len(js_files)} JS files:")
for j in js_files[:50]:
    print(f"  {os.path.relpath(j, build_dir)} ({os.path.getsize(j)} bytes)")
