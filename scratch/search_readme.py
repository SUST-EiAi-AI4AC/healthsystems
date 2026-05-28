with open("README.md", "r", encoding="gbk", errors="ignore") as f:
    content = f.read()

# Let's search for lines containing deploy, build, h5, or oss
for i, line in enumerate(content.splitlines()):
    line_lower = line.lower()
    if any(kwd in line_lower for kwd in ["deploy", "build", "h5", "oss"]):
        print(f"Line {i+1}: {line}")
