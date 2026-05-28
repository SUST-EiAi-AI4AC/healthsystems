with open("database/healthsystem_test2.sql", "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()

keywords = ["htp_drawing_record", "scale", "ai_chat", "diary"]
for kw in keywords:
    count = content.lower().count(kw)
    print(f"Keyword '{kw}': found {count} times")
    
    # Find table structure
    idx = content.lower().find(f"table structure for {kw}")
    if idx != -1:
        print(f"Found table structure for {kw} at char {idx}:")
        print(content[idx:idx+500])
