import os

root_dir = r"e:\Code\AI\Start\Web\Mindapp\healthsystem"
env_files = []
for root, dirs, files in os.walk(root_dir):
    for f in files:
        if f.startswith('.env'):
            env_files.append(os.path.join(root, f))

print(f"Found {len(env_files)} env files:")
for e in env_files:
    print(f"  {os.path.relpath(e, root_dir)}")
