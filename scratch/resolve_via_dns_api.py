import requests

domains = ["www.nwpuhs.cn", "h.playe.top"]

for domain in domains:
    print(f"\nResolving {domain} via Cloudflare DNS HTTP API...")
    url = f"https://cloudflare-dns.com/dns-query?name={domain}&type=A"
    headers = {"accept": "application/dns-json"}
    try:
        r = requests.get(url, headers=headers, timeout=10)
        data = r.json()
        print("Response Answer:")
        for ans in data.get("Answer", []):
            print(f"Name: {ans.get('name')}, Type: {ans.get('type')}, TTL: {ans.get('TTL')}, Data: {ans.get('data')}")
    except Exception as e:
        print(f"Error resolving {domain}: {e}")
