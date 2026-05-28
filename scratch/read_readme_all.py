import chardet

with open("README.md", "rb") as f:
    raw = f.read(1000)
    print("Detected encoding:", chardet.detect(raw))

# Open with detected encoding
with open("README.md", "r", encoding="utf-16", errors="ignore") as f:
    content = f.read()

# Print lines containing playe.top
for i, line in enumerate(content.splitlines()):
    if "playe.top" in line.lower():
        print(f"Line {i+1}: {line}")
