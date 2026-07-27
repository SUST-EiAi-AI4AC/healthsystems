import paramiko
import json
import datetime
from test_sync_mapping import extract_activity_row

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname, username=username, password=password, timeout=15)

cmd = "mysql -u root -pnwpuhs@ABC123\\!@# -e \"USE healthsystem_test2; DESCRIBE activity;\""
stdin, stdout, stderr = ssh.exec_command(cmd)
out = stdout.read().decode('utf-8', errors='ignore').strip()
ssh.close()

db_cols = []
for line in out.splitlines()[1:]:
    parts = line.split()
    if parts:
        col_name = parts[0]
        if col_name != "id":
            db_cols.append(col_name)

json_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\database\xtt\python_scripts\json_data\ccceee00022_163.com\garmin_activity_data_20260714_20260722.json"
with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

row = extract_activity_row("ccceee00022@163.com", datetime.date(2026, 7, 14), data[0]["data"])
mapped_cols = list(row.keys())

print(f"DB Columns count (excluding id): {len(db_cols)}")
print(f"Mapped Columns count: {len(mapped_cols)}")

mismatches = []
for i in range(max(len(db_cols), len(mapped_cols))):
    db_c = db_cols[i] if i < len(db_cols) else "MISSING"
    mp_c = mapped_cols[i] if i < len(mapped_cols) else "MISSING"
    if db_c != mp_c:
        mismatches.append((i, db_c, mp_c))

if mismatches:
    print("Mismatches found:")
    for idx, db_c, mp_c in mismatches:
        print(f"  Index {idx}: DB='{db_c}', Mapped='{mp_c}'")
else:
    print("SUCCESS: Every single column matches DB schema exactly in order!")
