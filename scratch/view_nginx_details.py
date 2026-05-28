with open("scratch/nginx_output.txt", "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()

print("File length:", len(content))
for line in content.splitlines():
    if "server {" in line or "include" in line or "proxy_pass" in line:
        print(line.strip())
