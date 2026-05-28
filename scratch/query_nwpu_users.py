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
    cursor.execute("SELECT user_id, user_name, phone, password, role FROM user_info LIMIT 20;")
    rows = cursor.fetchall()
    print("Found users:")
    for r in rows:
        print(f"ID: {r[0]} | Name: {r[1]} | Phone: {r[2]} | Pass: {r[3]} | Role: {r[4]}")
    conn.close()
except Exception as e:
    print(f"Error: {e}")
