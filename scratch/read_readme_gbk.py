with open("README.md", "r", encoding="gbk", errors="ignore") as f:
    content = f.read()

# Print lines containing playe.top
for i, line in enumerate(content.splitlines()):
    if "playe.top" in line.lower():
        print(f"Line {i+1}: {line}")
