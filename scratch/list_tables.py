import pymysql

try:
    conn = pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="123456",
        database="healthsystem_test2",
        charset="utf8mb4"
    )
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES;")
    rows = cursor.fetchall()
    print("Tables:")
    for r in rows:
        print(f"  {r[0]}")
    conn.close()
except Exception as e:
    print(f"Error: {e}")
