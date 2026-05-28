with open("database/healthsystem_test2.sql", "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()

print("Checking collations in local healthsystem_test2.sql...")
has_0900 = "utf8mb4_0900_ai_ci" in content
print(f"Has utf8mb4_0900_ai_ci: {has_0900}")

# List all tables in this file
import re
tables = re.findall(r"CREATE TABLE `([^`]+)`", content)
print(f"Total tables in local SQL: {len(tables)}")
print("Tables:", tables)
