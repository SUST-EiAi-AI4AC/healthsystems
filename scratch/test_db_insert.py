import sys
import os
import json
import datetime
import logging

import paramiko
if not hasattr(paramiko, "DSSKey"):
    setattr(paramiko, "DSSKey", getattr(paramiko, "PKey", None))

sys.path.insert(0, r"e:\Code\AI\Start\Web\Mindapp\healthsystems\python-garminconnect-master")
from sync_garmin import save_summary_to_db, get_db_connection
from sshtunnel import SSHTunnelForwarder

logging.basicConfig(level=logging.INFO)

SSH_HOST = "47.109.49.174"
SSH_PORT = 22
SSH_USER = "root"
SSH_PASS = "nwpuhs@ABC123!@#"

print("Testing save_summary_to_db on remote DB...")
tunnel = SSHTunnelForwarder(
    (SSH_HOST, SSH_PORT),
    ssh_username=SSH_USER,
    ssh_password=SSH_PASS,
    remote_bind_address=('127.0.0.1', 3306)
)
tunnel.start()

try:
    conn = get_db_connection(host='127.0.0.1', port=tunnel.local_bind_port)
    
    json_path = r"e:\Code\AI\Start\Web\Mindapp\healthsystems\database\xtt\python_scripts\json_data\ccceee00022_163.com\garmin_activity_data_20260714_20260722.json"
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    test_date = datetime.date(2026, 7, 14)
    summary_data = data[0]["data"]
    
    save_summary_to_db(conn, "ccceee00022@163.com", test_date, summary_data)
    print("Database insert/update completed successfully!")
    
    with conn.cursor() as cursor:
        cursor.execute("SELECT userProfileId, totalKilocalories, activeKilocalories, bmrKilocalories, wellnessKilocalories, burnedKilocalories, consumedKilocalories, remainingKilocalories, totalSteps, wellnessDistanceMeters, wellnessActiveKilocalories FROM activity WHERE date = '2026-07-14 00:00:00'")
        res = cursor.fetchone()
        print("\nQueried inserted row from DB:")
        for k, v in res.items():
            print(f"  {k}: {v}")

    conn.close()
finally:
    tunnel.stop()
