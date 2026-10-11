# import os
# import csv
# import argparse
# import json
# import re
# import mysql.connector
# from mysql.connector import Error

# # --------------------------- 核心配置 ---------------------------
# DB_CONFIG = {
#     "host": "localhost",
#     "port": 3306,
#     "user": "root",
#     "password": "1234",
#     "database": "hsd",
# }

# # DB_CONFIG = {
# #     "host": "127.0.0.1",
# #     "port": 3306,
# #     "user": "root",
# #     "password": "nwpuhs@ABC123!@#",
# #     "database": "healthsystem_test2",
# # }
# # --------------------------- 手动类型配置 ---------------------------
# COLUMN_TYPE_OVERRIDES = {
#     "activity": {
#         "bodyBatteryAtWakeTime": "INT",
#     },
#     "sleep": {
#         'napTimeSeconds': "VARCHAR(100)",
#         "sleepTimeSeconds": "VARCHAR(100)",
#         "unmeasurableSleepSeconds": "VARCHAR(100)",
#         "deepSleepSeconds": "VARCHAR(100)",
#         "lightSleepSeconds": "VARCHAR(100)",
#         "remSleepSeconds": "VARCHAR(100)",
#         "awakeSleepSeconds": "VARCHAR(100)"
#     },
#     "stats_body_composition": {
#         'bodyBatteryAtWakeTime': "INT",
#     }
# }

# # --------------------------- 手动唯一键配置（新增用户标识） ---------------------------
# UNIQUE_KEY_CONFIG = {
#     "steps": ["email"],  # 加入user_email作为唯一键一部分
# }

# # --------------------------- 全局变量：存储列名映射关系 ---------------------------
# COLUMN_RENAME_MAP = {}  # 格式：{原始列名: 重命名后的列名}

# # --------------------------- 新增：null日期处理辅助函数 ---------------------------
# def load_null_json(null_json_path):
#     """加载null日期JSON文件，返回{user_email: [null_dates]}的字典"""
#     if not os.path.exists(null_json_path):
#         print(f"错误：null日期JSON文件不存在 - {null_json_path}")
#         return {}
    
#     try:
#         with open(null_json_path, "r", encoding="utf-8") as f:
#             data = json.load(f)
        
#         # 解析JSON结构，提取user_email和null_dates（统一日期格式为字符串）
#         null_date_dict = {}
#         for item in data:
#             user_email = item.get("user_email")
#             null_dates = item.get("null_dates", [])
#             if user_email and null_dates:
#                 null_date_dict[user_email] = [str(date).strip() for date in null_dates]
        
#         print(f"成功加载null日期数据，覆盖 {len(null_date_dict)} 个用户")
#         return null_date_dict
    
#     except json.JSONDecodeError as e:
#         print(f"错误：解析null日期JSON失败 - {e}")
#         return {}
#     except Exception as e:
#         print(f"错误：加载null日期JSON异常 - {e}")
#         return {}

# def extract_user_email_from_path(file_path, csv_root_dir):
#     """从CSV路径提取用户邮箱（路径格式：csv_root_dir/用户目录(xxx_xxx.com)/...）"""
#     try:
#         # 直接从csv_root_dir中提取用户目录
#         user_dir = os.path.basename(csv_root_dir)
#         # 替换_为@得到邮箱
#         user_email = user_dir.replace("_", "@")
        
#         # 简单验证邮箱格式
#         if "@" not in user_email:
#             print(f"警告：用户目录 {user_dir} 转换后非有效邮箱 - {user_email}")
#             return None
#         return user_email
#     except Exception as e:
#         print(f"提取用户邮箱失败（路径：{file_path}）：{e}")
#         return None

# def extract_date_from_path(file_path):
#     """从路径提取日期（匹配YYYY-MM-DD格式）"""
#     date_pattern = r"\d{4}-\d{2}-\d{2}"
#     match = re.search(date_pattern, file_path)
#     if match:
#         return match.group()
#     print(f"警告：路径 {file_path} 无YYYY-MM-DD格式日期")
#     return None

# def get_date_column_for_table(cursor, table_name):
#     """获取表的日期列名（优先start_date，其次包含date的日期类型列）"""
#     try:
#         # 查询表结构（DESCRIBE结果：(字段名, 类型, 空, 键, 默认, 额外)）
#         cursor.execute(f"DESCRIBE `{table_name}`")
#         columns = cursor.fetchall()
#         if not columns:
#             print(f" 警告：表 `{table_name}` 无列结构")
#             return None
        
#         # 筛选日期相关列
#         date_columns = []
#         for col in columns:
#             col_name = col[0]
#             col_type = col[1].upper()
#             # 日期类型（DATE/DATETIME）或列名含date
#             is_date_type = any(kw in col_type for kw in ["DATE", "DATETIME"])
#             has_date_name = "date" in col_name.lower()
#             if is_date_type or has_date_name:
#                 date_columns.append(col_name)
        
#         if not date_columns:
#             print(f"警告：表 `{table_name}` 无日期列")
#             return None
        
#         # 优先选择start_date，无则返回第一个日期列
#         return "start_date" if "start_date" in date_columns else date_columns[0]
#     except Error as e:
#         print(f"查询表 `{table_name}` 列结构失败：{e}")
#         return None

# def delete_null_date_data(cursor, table_name, user_email, date_value, date_col, user_col):
#     """删除指定表中「用户+null日期」的旧数据，返回删除行数"""
#     if not all([table_name, user_email, date_value, date_col, user_col]):
#         print("删除失败：缺少必要参数（表名/用户/日期/列名）")
#         return 0
    
#     # 构造删除SQL（避免SQL注入，用参数化查询）
#     delete_sql = f"""
#     DELETE FROM `{table_name}`
#     WHERE `{user_col}` = %s
#       AND `{date_col}` = %s
#     """
    
#     try:
#         cursor.execute(delete_sql, (user_email, date_value))
#         deleted_rows = cursor.rowcount
#         print(f"表 `{table_name}` 删除 {deleted_rows} 条旧数据（用户：{user_email}，日期：{date_value}）")
#         return deleted_rows
#     except Error as e:
#         print(f"表 `{table_name}` 删除失败（用户：{user_email}，日期：{date_value}）：{e}")
#         return 0

# # --------------------------- 原有工具函数 ---------------------------
# def create_database_if_not_exists():
#     """若数据库不存在则创建"""
#     try:
#         conn = mysql.connector.connect(
#             host=DB_CONFIG["host"],
#             user=DB_CONFIG["user"],
#             password=DB_CONFIG["password"],
#             port=DB_CONFIG["port"]
#         )
#         cursor = conn.cursor()
#         cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_CONFIG['database']} "
#                        f"CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
#         print(f"数据库 {DB_CONFIG['database']} 已就绪（创建或已存在）")
#     except Error as e:
#         print(f"创建数据库失败：{e}")
#     finally:
#         if conn:
#             conn.close()

# def get_csv_files_recursively(root_dir):
#     """递归遍历目录，按分类收集 CSV 文件"""
#     category_files = {}
#     for root, dirs, files in os.walk(root_dir):
#         csv_files = [f for f in files if f.endswith(".csv")]
#         if csv_files:
#             relative_path = os.path.relpath(root, root_dir)
#             category = relative_path.split(os.sep)[0] if relative_path != "." else ""
#             if category not in category_files:
#                 category_files[category] = []
#             category_files[category].extend([os.path.join(root, f) for f in csv_files])
#     return category_files

# def create_table_for_paths(cursor):
#     """创建用于存储文件路径的表"""
#     create_sql = """
#     CREATE TABLE IF NOT EXISTS `csv_file_paths` (
#         `id` INT AUTO_INCREMENT PRIMARY KEY,
#         `category` VARCHAR(100) NOT NULL,
#         `file_path` TEXT NOT NULL,
#         `imported_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
#         UNIQUE KEY `unique_path` (`file_path`(100))
#     ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
#     """
#     try:
#         cursor.execute(create_sql)
#         print("表 `csv_file_paths` 已就绪（创建或已存在）")
#     except Error as e:
#         print(f"创建表 `csv_file_paths` 失败：{e}")

# def get_user_identifier_column(headers):
#     """从表头中识别用户标识列（支持email/user/account等关键词）"""
#     user_columns = [h for h in headers if any(kw in h.lower() for kw in ["email", "user", "account"])]
#     return user_columns[0] if user_columns else None

# def create_table_from_csv(cursor, table_name, csv_headers):
#     """根据 CSV 表头自动创建表（加入用户标识到唯一键）"""
#     columns = []
#     global COLUMN_RENAME_MAP
#     COLUMN_RENAME_MAP = {}  # 重置映射关系
    
#     # 生成当前表的id前缀（如sleep表→sleep_id）
#     id_prefix = f"{table_name}_id"
    
#     # 识别用户标识列
#     user_col = get_user_identifier_column(csv_headers)
    
#     for col in csv_headers:
#         original_col = col
#         # 若列名为'id'，用表名前缀重命名（避免主键冲突）
#         if col.lower() == 'id':
#             col = id_prefix
#             COLUMN_RENAME_MAP[original_col] = col  # 记录原始列名→新列名的映射
        
#         # 优先使用手动配置的类型（基于原始列名匹配）
#         if table_name in COLUMN_TYPE_OVERRIDES and original_col in COLUMN_TYPE_OVERRIDES[table_name]:
#             data_type = COLUMN_TYPE_OVERRIDES[table_name][original_col]
#             columns.append(f"`{col}` {data_type}")
#             continue
        
#         # 自动推断类型（基于原始列名）
#         if "date" in original_col.lower() or "time" in original_col.lower():
#             data_type = "DATETIME"
#         elif "steps" in original_col.lower() or "count" in original_col.lower() or "value" in original_col.lower():
#             data_type = "INT"
#         elif "calories" in original_col.lower() or "distance" in original_col.lower():
#             data_type = "FLOAT"
#         else:
#             data_type = "VARCHAR(100)"
        
#         columns.append(f"`{col}` {data_type}")
    
#     # 优化唯一键生成逻辑（强制包含用户标识列）
#     if table_name in UNIQUE_KEY_CONFIG:
#         # 处理列名映射（如果有重命名）
#         unique_cols = [
#             COLUMN_RENAME_MAP[col] if col in COLUMN_RENAME_MAP else col
#             for col in UNIQUE_KEY_CONFIG[table_name]
#         ]
#     else:
#         # 自动生成唯一键时，优先包含「用户标识+日期」
#         date_columns = [
#             COLUMN_RENAME_MAP[h] if h in COLUMN_RENAME_MAP else h 
#             for h in csv_headers if "date" in h.lower()
#         ]
#         unique_cols = []
#         # 确保用户标识列在唯一键中
#         if user_col:
#             mapped_user_col = COLUMN_RENAME_MAP[user_col] if user_col in COLUMN_RENAME_MAP else user_col
#             unique_cols.append(mapped_user_col)
#         # 加入日期列
#         if date_columns:
#             unique_cols.append(date_columns[0])
#         # 若仍无唯一键，使用第一个列
#         if not unique_cols and columns:
#             unique_cols.append(columns[0].split()[0].strip('`'))
    
#     unique_key = ", ".join([f"`{col}`" for col in unique_cols]) if unique_cols else ""
    
#     # 构建CREATE TABLE语句
#     create_sql = f"""
#     CREATE TABLE IF NOT EXISTS `{table_name}` (
#         `id` INT AUTO_INCREMENT PRIMARY KEY,  # 表的自增主键
#         {", ".join(columns)},
#         {f"UNIQUE KEY `unique_entry` ({unique_key})" if unique_key else ""}
#     ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
#     """
    
#     try:
#         cursor.execute(create_sql)
#         print(f"表 `{table_name}` 结构已就绪（创建或已存在）")
#     except Error as e:
#         print(f"创建表 `{table_name}` 失败：{e}")

# def insert_csv_data(cursor, table_name, csv_headers, rows):
#     """批量插入 CSV 数据到数据库"""
#     global COLUMN_RENAME_MAP
#     # 调整列名：使用重命名后的列名
#     adjusted_headers = [
#         COLUMN_RENAME_MAP[h] if h in COLUMN_RENAME_MAP else h 
#         for h in csv_headers
#     ]
    
#     # 过滤掉自增主键列（id）
#     columns = [h for h in adjusted_headers if h != "id"]
#     placeholders = ", ".join(["%s"] * len(columns))
    
#     # 选择第一个普通字段作为更新目标（避免更新自增主键）
#     update_col = columns[0] if columns else "id"
    
#     insert_sql = f"""
#     INSERT INTO `{table_name}` ({', '.join([f'`{h}`' for h in columns])}) 
#     VALUES ({placeholders})
#     ON DUPLICATE KEY UPDATE `{update_col}` = `{update_col}`  # 唯一键冲突时不更新（仅避免报错）
#     """
    
#     try:
#         cursor.executemany(insert_sql, rows)
#         print(f"成功插入 {len(rows)} 条数据到表 `{table_name}`")
#     except Error as e:
#         print(f"插入数据到表 `{table_name}` 失败：{e}")

# def insert_file_path(cursor, category, file_path):
#     """插入文件路径到记录表（避免重复导入）"""
#     insert_sql = """
#     INSERT INTO `csv_file_paths` (`category`, `file_path`)
#     VALUES (%s, %s)
#     ON DUPLICATE KEY UPDATE `imported_at` = CURRENT_TIMESTAMP  # 重复时更新导入时间
#     """
#     try:
#         cursor.execute(insert_sql, (category, file_path))
#         print(f"已记录文件路径：{file_path}")
#     except Error as e:
#         print(f"记录文件路径失败：{e}")

# # --------------------------- 核心处理函数（修改后） ---------------------------
# def process_csv_to_database(csv_root_dir, null_json_path):
#     """核心流程：加载nullJSON→删除旧数据→导入新数据"""
#     # 1. 验证输入路径
#     if not os.path.exists(csv_root_dir):
#         print(f"错误：CSV根目录不存在 - {csv_root_dir}")
#         return
#     if not os.path.isdir(csv_root_dir):
#         print(f"错误：{csv_root_dir} 不是有效目录")
#         return
    
#     # 2. 加载null日期数据（关键新增步骤）
#     null_json_data = load_null_json(null_json_path)
#     if not null_json_data:
#         print("警告：未加载到有效null日期数据，后续将跳过删除步骤")
    
#     # 3. 创建数据库（如果不存在）
#     create_database_if_not_exists()
    
#     try:
#         # 4. 连接数据库
#         conn = mysql.connector.connect(**DB_CONFIG)
#         cursor = conn.cursor()
#         print("数据库连接成功")
        
#         # 5. 创建CSV文件路径记录表
#         create_table_for_paths(cursor)
#         conn.commit()
        
#         # 6. 递归获取所有CSV文件（按分类）
#         category_files = get_csv_files_recursively(csv_root_dir)
#         print(f"共找到 {len(category_files)} 个数据分类")
        
#         # 7. 按分类处理每个CSV文件
#         for category, files in category_files.items():
#             print(f"\n==================== 处理分类: {category}（共 {len(files)} 个文件） ====================")
            
#             for file_path in files:
#                 print(f"\n正在处理文件：{file_path}")
                
#                 if "summary" in file_path.lower():
#                     print("检测到summary文件，执行流程：删除null旧数据 → 导入新数据")
                    
#                     try:
#                         with open(file_path, "r", encoding="utf-8-sig") as f:
#                             csv_reader = csv.reader(f)
#                             headers = next(csv_reader)  # 读取CSV表头
                            
#                             # 7.1 先创建表（确保表存在，才能执行后续删除）
#                             table_name = category if category else "uncategorized"
#                             create_table_from_csv(cursor, table_name, headers)
#                             conn.commit()
                            
#                             # 7.2 提取用户邮箱和日期（用于匹配null日期）
#                             user_email = extract_user_email_from_path(file_path, csv_root_dir)
#                             date_value = extract_date_from_path(file_path)
                            
#                             # 7.3 执行null日期旧数据删除（新增核心步骤）
#                             if null_json_data and user_email and date_value:
#                                 # 检查当前日期是否在用户的null列表中
#                                 user_null_dates = null_json_data.get(user_email, [])
#                                 if date_value in user_null_dates:
#                                     print(f"匹配到null日期：用户 {user_email} → 日期 {date_value}，准备删除旧数据")
                                    
#                                     # 获取用户列名（从CSV表头）和日期列名（从表结构）
#                                     user_col = get_user_identifier_column(headers)
#                                     date_col = get_date_column_for_table(cursor, table_name)
                                    
#                                     if user_col and date_col:
#                                         delete_null_date_data(cursor, table_name, user_email, date_value, date_col, user_col)
#                                         conn.commit()  # 立即提交删除操作
#                                     else:
#                                         print("无法删除：缺少用户列或日期列")
#                                 else:
#                                     print(f"日期 {date_value} 不在用户 {user_email} 的null列表中，跳过删除")
#                             else:
#                                 print("跳过删除：缺少null数据/用户/日期")
                            
#                             # 7.4 处理CSV数据（清洗空值/NAN）
#                             data_rows = []
#                             for row in csv_reader:
#                                 processed_row = []
#                                 for value in row:
#                                     # 将空字符串/NAN转换为None（适配数据库NULL）
#                                     if value.strip() == "" or value.lower() == "nan":
#                                         processed_row.append(None)
#                                     else:
#                                         processed_row.append(value)
#                                 data_rows.append(tuple(processed_row))
                            
#                             print(f"数据清洗完成，共 {len(data_rows)} 条有效数据")
                            
#                             # 7.5 批量插入数据（原有逻辑保留）
#                             if data_rows:
#                                 BATCH_SIZE = 500
#                                 for i in range(0, len(data_rows), BATCH_SIZE):
#                                     batch = data_rows[i:i+BATCH_SIZE]
#                                     insert_csv_data(cursor, table_name, headers, batch)
#                                     conn.commit()
#                             else:
#                                 print("无有效数据可插入")
                            
#                             # 7.6 记录文件路径（避免重复导入）
#                             insert_file_path(cursor, category, file_path)
#                             conn.commit()
#                             print(f"文件 {file_path} 处理完成")
                    
#                     except Exception as e:
#                         print(f"文件处理失败（仅记录路径）：{str(e)}")
#                         insert_file_path(cursor, category, file_path)
#                         conn.commit()
#                 else:
#                     print("非summary文件，仅记录路径")
#                     insert_file_path(cursor, category, file_path)
#                     conn.commit()
        
#         print("\n所有文件处理完成！")
        
#     except Error as e:
#         print(f"\n数据库操作失败：{str(e)}")
#     finally:
#         if conn:
#             conn.close()
#             print("\n数据库连接已关闭")

# # --------------------------- 入口函数（修改后：新增nullJSON参数） ---------------------------
# if __name__ == "__main__":
#     parser = argparse.ArgumentParser(description='Garmin CSV数据导入MySQL（支持null日期旧数据删除）')
#     parser.add_argument('--csv-root-dir', default='E:\\learn\\vue3\\health\\python_scripts\\csv_data\\ccceee00001_163.com')
#     parser.add_argument('--null-dates', required=False)
#     args = parser.parse_args()

#     user_dir = os.path.basename(args.csv_root_dir)
#     null_json_path = os.path.join(
#         "E:\\learn\\vue3\\health\\python_scripts\\json_data",  # 固定根路径
#         user_dir,                                               # 动态用户目录（含邮箱信息）
#         "null_data_records.json"                                # 固定文件名
#     )

#     # null_json_path = os.path.join(
#     #     "/healthsystem-test/python_scripts/json_data",  # 固定根路径
#     #     user_dir,                                               # 动态用户目录（含邮箱信息）
#     #     "null_data_records.json"                                # 固定文件名
#     # )
    
#     # 调用核心处理函数
#     process_csv_to_database(args.csv_root_dir, null_json_path)



import os
import csv
import argparse
import re
import mysql.connector
from mysql.connector import Error

# --------------------------- 核心配置 ---------------------------
# DB_CONFIG = {
#     "host": "localhost",
#     "port": 3306,
#     "user": "root",
#     "password": "1234",
#     "database": "hsd",
# }

DB_CONFIG = {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "nwpuhs@ABC123!@#",
    "database": "healthsystem_test2",
}
# --------------------------- 手动类型配置 ---------------------------
COLUMN_TYPE_OVERRIDES = {
    "activity": {
        "bodyBatteryAtWakeTime": "INT",
    },
    "sleep": {
        'napTimeSeconds': "VARCHAR(100)",
        "sleepTimeSeconds": "VARCHAR(100)",
        "unmeasurableSleepSeconds": "VARCHAR(100)",
        "deepSleepSeconds": "VARCHAR(100)",
        "lightSleepSeconds": "VARCHAR(100)",
        "remSleepSeconds": "VARCHAR(100)",
        "awakeSleepSeconds": "VARCHAR(100)"
    },
    "stats_body_composition": {
        'bodyBatteryAtWakeTime': "INT",
    }
}

# --------------------------- 手动唯一键配置（新增用户标识） ---------------------------
UNIQUE_KEY_CONFIG = {
    "steps": ["email"],  # 加入user_email作为唯一键一部分
}

# --------------------------- 全局变量：存储列名映射关系 ---------------------------
COLUMN_RENAME_MAP = {}  # 格式：{原始列名: 重命名后的列名}

# --------------------------- 新增：null日期处理辅助函数 ---------------------------
def extract_user_email(csv_root_dir):
    """从CSV根目录提取用户邮箱（目录格式：xxx_xxx.com → xxx@xxx.com）"""
    try:
        # 取CSV根目录的最后一级（用户目录，如ccceee000001_163.com）
        user_dir_name = os.path.basename(csv_root_dir)
        # 替换_为@得到邮箱
        user_email = user_dir_name.replace("_", "@")
        # 基础格式校验（含@且@后有.）
        if "@" not in user_email or "." not in user_email.split("@")[-1]:
            print(f"警告：用户目录 {user_dir_name} 转换后非有效邮箱 → {user_email}")
            return None
        return user_email
    except Exception as e:
        print(f"提取用户邮箱失败：{str(e)}")
        return None

def validate_date_format(date_str):
    """验证并清洗日期格式（去除多余的括号、引号）"""
    # 清除日期中的括号、引号等特殊字符
    cleaned_date = re.sub(r'[^\d-]', '', date_str.strip())
    # 验证清洗后的格式
    return bool(re.match(r"^\d{4}-\d{2}-\d{2}$", cleaned_date)), cleaned_date

def get_table_date_column(cursor, table_name):
    """获取表的日期列名（优先start_date，其次含date的列）"""
    try:
        # 查询表结构（DESCRIBE结果：(字段名, 类型, 空, 键, 默认, 额外)）
        cursor.execute(f"DESCRIBE `{table_name}`")
        columns = cursor.fetchall()
        if not columns:
            print(f"警告：表 `{table_name}` 无列结构，无法确定日期列")
            return None
        
        # 筛选日期相关列（日期类型或列名含date）
        date_candidates = []
        for col in columns:
            col_name = col[0]
            col_type = col[1].upper()
            # 日期类型（DATE/DATETIME）或列名包含date
            is_date_type = any(kw in col_type for kw in ["DATE", "DATETIME"])
            has_date_name = "date" in col_name.lower()
            if is_date_type or has_date_name:
                date_candidates.append(col_name)
        
        if not date_candidates:
            print(f"警告：表 `{table_name}` 无日期相关列，无法删除旧数据")
            return None
        
        # 优先选择start_date，无则返回第一个候选列
        return "start_date" if "start_date" in date_candidates else date_candidates[0]
    except Error as e:
        print(f"查询表 `{table_name}` 日期列失败：{str(e)}")
        return None

def delete_old_null_data(cursor, table_name, user_email, target_date, user_col, date_col):
    """删除指定表中「当前用户+目标日期」的旧数据"""
    # 参数完整性校验
    if not all([table_name, user_email, target_date, user_col, date_col]):
        print("删除旧数据失败：缺少必要参数（表名/用户/日期/列名）")
        return
    
    # 构造参数化删除SQL（防SQL注入）
    delete_sql = f"""
    DELETE FROM `{table_name}`
    WHERE `{user_col}` = %s
      AND `{date_col}` = %s
    """
    
    try:
        cursor.execute(delete_sql, (user_email, target_date))
        deleted_rows = cursor.rowcount
        if deleted_rows > 0:
            print(f"表 `{table_name}`：删除 {deleted_rows} 条旧数据（用户：{user_email}，日期：{target_date}）")
        else:
            print(f"表 `{table_name}`：无旧数据可删（用户：{user_email}，日期：{target_date}）")
        # 修复：cursor.connection → cursor._connection
        cursor._connection.commit()
    except Error as e:
        print(f"表 `{table_name}` 删除旧数据失败：{str(e)}")
        cursor._connection.rollback()

def extract_date_from_filename(file_path):
    """从CSV文件名/路径中提取日期（匹配YYYY-MM-DD格式）"""
    date_match = re.search(r"\d{4}-\d{2}-\d{2}", file_path)
    if date_match:
        return date_match.group()
    print(f"警告：文件 {os.path.basename(file_path)} 未匹配到YYYY-MM-DD格式日期")
    return None

# --------------------------- 原有工具函数（无修改） ---------------------------
def create_database_if_not_exists():
    """若数据库不存在则创建"""
    try:
        conn = mysql.connector.connect(
            host=DB_CONFIG["host"],
            user=DB_CONFIG["user"],
            password=DB_CONFIG["password"],
            port=DB_CONFIG["port"]
        )
        cursor = conn.cursor()
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_CONFIG['database']} "
                       f"CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
        print(f"数据库 {DB_CONFIG['database']} 已创建（或已存在）")
    except Error as e:
        print(f"创建数据库失败：{e}")
    finally:
        if conn:
            conn.close()

def get_csv_files_recursively(root_dir):
    """递归遍历目录，按分类收集 CSV 文件"""
    category_files = {}
    for root, dirs, files in os.walk(root_dir):
        csv_files = [f for f in files if f.endswith(".csv")]
        if csv_files:
            relative_path = os.path.relpath(root, root_dir)
            category = relative_path.split(os.sep)[0] if relative_path != "." else ""
            if category not in category_files:
                category_files[category] = []
            category_files[category].extend([os.path.join(root, f) for f in csv_files])
    return category_files

def create_table_for_paths(cursor):
    """创建用于存储文件路径的表"""
    create_sql = """
    CREATE TABLE IF NOT EXISTS `csv_file_paths` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `category` VARCHAR(100) NOT NULL,
        `file_path` TEXT NOT NULL,
        `imported_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        UNIQUE KEY `unique_path` (`file_path`(100))
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
    """
    try:
        cursor.execute(create_sql)
        print("表 `csv_file_paths` 创建成功（或已存在）")
    except Error as e:
        print(f"创建表 `csv_file_paths` 失败：{e}")

def get_user_identifier_column(headers):
    """从表头中识别用户标识列（支持多种可能的列名）"""
    user_columns = [h for h in headers if 'email' in h.lower() or 'user' in h.lower() or 'account' in h.lower()]
    return user_columns[0] if user_columns else None

def create_table_from_csv(cursor, table_name, csv_headers):
    """根据 CSV 表头自动创建表（加入用户标识到唯一键）"""
    columns = []
    global COLUMN_RENAME_MAP
    COLUMN_RENAME_MAP = {}  # 重置映射关系
    
    # 生成当前表的id前缀（如sleep表→sleep_id）
    id_prefix = f"{table_name}_id"
    
    # 识别用户标识列
    user_col = get_user_identifier_column(csv_headers)
    
    for col in csv_headers:
        original_col = col
        # 若列名为'id'，用表名前缀重命名（如sleep_id）
        if col.lower() == 'id':
            col = id_prefix
            COLUMN_RENAME_MAP[original_col] = col  # 记录原始列名→新列名的映射
        
        # 优先使用手动配置的类型（基于原始列名匹配）
        if table_name in COLUMN_TYPE_OVERRIDES and original_col in COLUMN_TYPE_OVERRIDES[table_name]:
            data_type = COLUMN_TYPE_OVERRIDES[table_name][original_col]
            columns.append(f"`{col}` {data_type}")
            continue
        
        # 自动推断类型（基于原始列名）
        if "date" in original_col.lower() or "time" in original_col.lower():
            data_type = "DATETIME"
        elif "steps" in original_col.lower() or "count" in original_col.lower() or "value" in original_col.lower():
            data_type = "INT"
        elif "calories" in original_col.lower() or "distance" in original_col.lower():
            data_type = "FLOAT"
        else:
            data_type = "VARCHAR(100)"
        
        columns.append(f"`{col}` {data_type}")
    
    # 优化唯一键生成逻辑（强制包含用户标识列）
    if table_name in UNIQUE_KEY_CONFIG:
        # 处理列名映射（如果有重命名）
        unique_cols = [
            COLUMN_RENAME_MAP[col] if col in COLUMN_RENAME_MAP else col
            for col in UNIQUE_KEY_CONFIG[table_name]
        ]
    else:
        # 自动生成唯一键时，优先包含用户标识+日期
        date_columns = [
            COLUMN_RENAME_MAP[h] if h in COLUMN_RENAME_MAP else h 
            for h in csv_headers if "date" in h.lower()
        ]
        unique_cols = []
        # 确保用户标识列在唯一键中
        if user_col:
            mapped_user_col = COLUMN_RENAME_MAP[user_col] if user_col in COLUMN_RENAME_MAP else user_col
            unique_cols.append(mapped_user_col)
        # 加入日期列
        if date_columns:
            unique_cols.append(date_columns[0])
        # 若仍无唯一键，使用第一个列
        if not unique_cols and columns:
            unique_cols.append(columns[0].split()[0].strip('`'))
    
    unique_key = ", ".join([f"`{col}`" for col in unique_cols]) if unique_cols else ""
    
    # 构建CREATE TABLE语句
    create_sql = f"""
    CREATE TABLE IF NOT EXISTS `{table_name}` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,  # 表的自增主键
        {", ".join(columns)},
        {f"UNIQUE KEY `unique_entry` ({unique_key})" if unique_key else ""}
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
    """
    
    try:
        cursor.execute(create_sql)
        print(f"表 `{table_name}` 创建成功（或已存在）")
    except Error as e:
        print(f"创建表 `{table_name}` 失败：{e}")

def insert_csv_data(cursor, table_name, csv_headers, rows):
    """批量插入 CSV 数据到数据库"""
    global COLUMN_RENAME_MAP
    # 调整列名：使用重命名后的列名
    adjusted_headers = [
        COLUMN_RENAME_MAP[h] if h in COLUMN_RENAME_MAP else h 
        for h in csv_headers
    ]
    
    # 过滤掉自增主键列（id）
    columns = [h for h in adjusted_headers if h != "id"]
    if not columns:
        print(f"警告：表 `{table_name}` 无有效列可插入，跳过数据导入")
        return
    placeholders = ", ".join(["%s"] * len(columns))
    
    # 选择第一个普通字段作为更新目标（避免更新自增主键）
    update_col = columns[0]
    
    insert_sql = f"""
    INSERT INTO `{table_name}` ({', '.join([f'`{h}`' for h in columns])}) 
    VALUES ({placeholders})
    ON DUPLICATE KEY UPDATE `{update_col}` = `{update_col}`
    """
    
    try:
        cursor.executemany(insert_sql, rows)
        print(f"成功插入 {len(rows)} 条数据到表 `{table_name}`")
        cursor._connection.commit()
    except Error as e:
        print(f"插入数据失败：{e}")
        cursor._connection.rollback()

def insert_file_path(cursor, category, file_path):
    """插入文件路径到记录表"""
    insert_sql = """
    INSERT INTO `csv_file_paths` (`category`, `file_path`)
    VALUES (%s, %s)
    ON DUPLICATE KEY UPDATE `imported_at` = CURRENT_TIMESTAMP
    """
    try:
        cursor.execute(insert_sql, (category, file_path))
        print(f"已记录文件路径: {os.path.basename(file_path)}")
        cursor._connection.commit()
    except Error as e:
        print(f"记录文件路径失败：{e}")
        cursor._connection.commit()

# --------------------------- 核心处理函数（修改后） ---------------------------
def process_csv_to_database(csv_root_dir, null_dates=None, null_json_path=None):
    """
    核心处理函数：根据null-dates参数判断是否删除旧数据后导入
    :param csv_root_dir: CSV文件根目录
    :param null_dates: 命令行传入的null日期列表（YYYY-MM-DD格式，非空则删除旧数据）
    :param null_json_path: 预留的null日期JSON路径（当前需求未用到，保留参数兼容性）
    """
    # 1. 验证输入路径
    if not os.path.exists(csv_root_dir):
        print(f"错误：路径不存在 - {csv_root_dir}")
        return
    if not os.path.isdir(csv_root_dir):
        print(f"错误：不是有效的目录 - {csv_root_dir}")
        return

    # 2. 初始化null日期相关变量
    valid_null_dates = []
    if null_dates and isinstance(null_dates, list):
        # 过滤无效日期格式
        valid_null_dates = [date for date in null_dates if validate_date_format(date)]
        invalid_dates = [date for date in null_dates if not validate_date_format(date)]
        if invalid_dates:
            print(f"警告：以下日期格式无效（需YYYY-MM-DD），已过滤 → {invalid_dates}")
    print(f"最终待处理的null日期：{valid_null_dates if valid_null_dates else '无'}")

    # 3. 提取当前用户邮箱（删除旧数据需关联用户）
    current_user_email = extract_user_email(csv_root_dir)
    if valid_null_dates and not current_user_email:
        print("警告：无法提取用户邮箱，跳过所有旧数据删除操作")
        valid_null_dates = []  # 无用户则无法删数据，清空列表

    # 4. 创建数据库（若不存在）
    create_database_if_not_exists()
    
    try:
        # 5. 连接数据库
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        print("数据库连接成功")
        
        # 6. 创建文件路径记录表
        create_table_for_paths(cursor)
        conn.commit()
        
        # 7. 按分类获取所有CSV文件
        category_files = get_csv_files_recursively(csv_root_dir)
        print(f"共找到 {len(category_files)} 个分类的 CSV 文件")
        
        # 8. 逐个分类处理CSV
        for category, files in category_files.items():
            print(f"\n==================== 处理分类: {category}（共 {len(files)} 个文件） ====================")
            
            for file_path in files:
                file_basename = os.path.basename(file_path)
                print(f"\n正在处理文件：{file_basename}")
                
                # 仅处理summary文件（数据主文件，非summary仅记录路径）
                if "summary" in file_basename.lower():
                    print("→ 执行完整流程：表创建 → 旧数据删除（如需）→ 数据导入")
                    
                    try:
                        # 8.1 读取CSV表头和数据
                        with open(file_path, "r", encoding="utf-8-sig") as f:
                            csv_reader = csv.reader(f)
                            csv_headers = next(csv_reader)  # 读取表头
                            
                            # 8.2 检查用户标识列（无则警告）
                            user_col = get_user_identifier_column(csv_headers)
                            if not user_col:
                                print(f"警告：文件 {file_basename} 无用户标识列（email/user等），数据可能无归属")
                            
                            # 8.3 清洗CSV数据（空值/NAN转None）
                            data_rows = []
                            for row in csv_reader:
                                processed_row = [
                                    None if (value.strip() == "" or value.lower() == "nan") else value
                                    for value in row
                                ]
                                data_rows.append(tuple(processed_row))
                            print(f"数据清洗完成：共 {len(data_rows)} 条有效数据")
                            
                            # 8.4 创建/验证表结构（必须在删除前，确保表存在）
                            table_name = category if category else "uncategorized"
                            create_table_from_csv(cursor, table_name, csv_headers)
                            
                            # 8.5 若有valid_null_dates，执行旧数据删除
                            if valid_null_dates and current_user_email and user_col:
                                # 提取当前文件的日期（判断是否在null日期列表中）
                                file_date = extract_date_from_filename(file_path)
                                if file_date and file_date in valid_null_dates:
                                    # 获取表的日期列（用于删除条件）
                                    table_date_col = get_table_date_column(cursor, table_name)
                                    if table_date_col:
                                        # 执行删除（当前用户+当前文件日期+当前表）
                                        delete_old_null_data(
                                            cursor=cursor,
                                            table_name=table_name,
                                            user_email=current_user_email,
                                            target_date=file_date,
                                            user_col=user_col,
                                            date_col=table_date_col
                                        )
                                    else:
                                        print(f"跳过删除：表 `{table_name}` 无有效日期列")
                                else:
                                    print(f"跳过删除：文件日期 {file_date} 不在null日期列表中")
                            else:
                                print("跳过删除：无有效null日期/用户邮箱/用户列")
                            
                            # 8.6 批量插入新数据
                            if data_rows:
                                BATCH_SIZE = 500  # 分批插入，避免事务过大
                                for i in range(0, len(data_rows), BATCH_SIZE):
                                    batch_rows = data_rows[i:i+BATCH_SIZE]
                                    insert_csv_data(cursor, table_name, csv_headers, batch_rows)
                            else:
                                print("无有效数据可插入")
                            
                            # 8.7 记录文件路径（避免重复导入）
                            insert_file_path(cursor, category, file_path)
                    
                    except Exception as e:
                        print(f"文件 {file_basename} 完整流程失败，仅记录路径：{str(e)}")
                        insert_file_path(cursor, category, file_path)
                
                else:
                    # 非summary文件：仅记录路径，不导入数据
                    print("→ 非summary文件，仅记录路径")
                    insert_file_path(cursor, category, file_path)
        
        print("\n所有文件处理完成！")
        
    except Error as e:
        print(f"\n数据库核心操作失败：{str(e)}")
        if 'conn' in locals() and conn.is_connected():
            conn.rollback()
    finally:
        if 'conn' in locals() and conn.is_connected():
            cursor.close()
            conn.close()
            print("\n数据库连接已关闭")

# --------------------------- 入口函数（参数解析修改） ---------------------------
if __name__ == "__main__":
    # 命令行参数解析
    parser = argparse.ArgumentParser(description='Garmin CSV数据导入MySQL（支持null日期旧数据删除）')
    parser.add_argument('--csv-root-dir', 
                        required=True,
                        help='CSV文件根目录（格式：.../csv_data/xxx_xxx.com，最后一级为用户目录）')
    parser.add_argument('--null-dates', 
                        required=False,
                        help='需删除旧数据的日期（逗号分隔，如：2024-01-01,2024-01-02，格式必须为YYYY-MM-DD）')
    args = parser.parse_args()
    
    # 处理null-dates参数（转成列表，空则为None）
    null_dates_list = None
    if args.null_dates and args.null_dates.strip():
        raw_dates = list(set([date.strip() for date in args.null_dates.split(',') if date.strip()]))
        # 清洗并验证日期格式
        cleaned_dates = []
        for date in raw_dates:
            is_valid, cleaned = validate_date_format(date)
            if is_valid:
                cleaned_dates.append(cleaned)
            else:
                print(f"警告：无效日期格式（清洗后）→ {date} → {cleaned}")
        null_dates_list = cleaned_dates
    
    # 预留的null_json_path（当前需求未用到，保留原代码结构）
    user_dir = os.path.basename(args.csv_root_dir)
    # null_json_path = os.path.join(
    #     "E:\\learn\\vue3\\health\\python_scripts\\json_data",
    #     user_dir,
    #     "null_data_records.json"
    # )
    null_json_path = os.path.join(
        "/healthsystem-test/python_scripts/json_data",
        user_dir,
        "null_data_records.json"
    )
    
    # 调用核心处理函数
    process_csv_to_database(
        csv_root_dir=args.csv_root_dir,
        null_dates=null_dates_list,
        null_json_path=null_json_path
    )

