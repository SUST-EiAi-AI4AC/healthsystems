import os

extensions = ['.java', '.vue', '.js', '.html', '.css', '.sql', '.py', '.yml', '.xml']
exclude_dirs = {'node_modules', '.git', 'unpackage', 'dist', 'venv', '.idea', '.qoder', '.trae', '.vscode'}

stats = {ext: {'files': 0, 'lines': 0} for ext in extensions}
other_stats = {'files': 0, 'lines': 0}

root_dir = r"e:\Code\AI\Start\Web\Mindapp\healthsystem"

for dirpath, dirnames, filenames in os.walk(root_dir):
    # filter out excluded directories
    dirnames[:] = [d for d in dirnames if d not in exclude_dirs]
    
    for filename in filenames:
        ext = os.path.splitext(filename)[1].lower()
        filepath = os.path.join(dirpath, filename)
        
        # skip large binary files or lock files
        if 'package-lock.json' in filename or 'yarn.lock' in filename:
            continue
            
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                lines = f.readlines()
                line_count = len(lines)
        except Exception as e:
            line_count = 0
            
        if ext in stats:
            stats[ext]['files'] += 1
            stats[ext]['lines'] += line_count
        else:
            other_stats['files'] += 1
            other_stats['lines'] += line_count

print("Extension | File Count | Line Count")
print("---|---|---")
for ext, data in stats.items():
    if data['files'] > 0:
        print(f"{ext} | {data['files']} | {data['lines']}")
print(f"Other | {other_stats['files']} | {other_stats['lines']}")
