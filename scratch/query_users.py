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
    cursor.execute("SELECT id, username, phone, role FROM user LIMIT 20;")
    rows = cursor.fetchall()
    print("Found users:")
    for r in rows:
        print(f"ID: {r[0]} | Username: {r[1]} | Phone: {r[2]} | Role: {r[3]}")
    conn.close()
except Exception as e:
    print(f"Error querying database: {e}")
