path = r"C:\Users\Administrator\.gemini\antigravity\brain\55a6ce55-87da-4670-877f-5d4e684fce6a\.system_generated\steps\794\content.md"

with open(path, "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()

print("File size:", len(content))
for kw in ["nwpuhs.cn", "47.109.49.174", "8081", "playe.top"]:
    found = kw in content
    print(f"Keyword '{kw}' found: {found}")
    if found:
        idx = content.find(kw)
        print(f"Around {kw}:")
        print(content[max(0, idx-100):min(len(content), idx+200)])
