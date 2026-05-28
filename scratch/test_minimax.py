import urllib.request
import json
import ssl
import sys

apiKey = 'ms-80675032-298f-41ee-a768-8b6e2be32c98'
apiUrl = 'https://api-inference.modelscope.cn/v1/chat/completions'

headers = {
    'Content-Type': 'application/json',
    'Authorization': f'Bearer {apiKey}'
}

body = {
    'model': 'MiniMax/MiniMax-M2.5',
    'messages': [
        {'role': 'system', 'content': '你是专业的心理健康助手心晴。回复要温暖贴心。'},
        {'role': 'user', 'content': '你好，我今天觉得压力有点大。'}
    ],
    'max_tokens': 300,
    'temperature': 0.7,
    'stream': False
}

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

req = urllib.request.Request(apiUrl, data=json.dumps(body).encode('utf-8'), headers=headers, method='POST')

try:
    with urllib.request.urlopen(req, context=ctx, timeout=15) as response:
        status = response.getcode()
        res_body = response.read().decode('utf-8')
        print(f"Status Code: {status}")
        data = json.loads(res_body)
        # Use sys.stdout.buffer.write to print raw utf-8 bytes safely on any terminal
        text = data['choices'][0]['message']['content']
        sys.stdout.buffer.write(f"\nAI Response text: {text}\n".encode('utf-8'))
except Exception as e:
    print(f"Error calling ModelScope API: {e}")
