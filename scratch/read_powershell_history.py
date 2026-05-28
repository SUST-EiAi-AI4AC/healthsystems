import os

history_path = os.path.expandvars(r"%APPDATA%\Microsoft\Windows\PowerShell\PSReadLine\Console_history.txt")
print("PowerShell history path:", history_path)
if os.path.exists(history_path):
    print("History file exists. Reading last 200 lines...")
    try:
        with open(history_path, "r", encoding="utf-8", errors="ignore") as f:
            lines = f.readlines()
        for i in range(max(0, len(lines)-200), len(lines)):
            print(f"{i+1}: {lines[i].strip()}")
    except Exception as e:
        print(f"Error: {e}")
else:
    print("History file does not exist.")
