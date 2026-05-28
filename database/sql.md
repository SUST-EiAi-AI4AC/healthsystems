# 数据库使用说明

## 一、数据库文件位置

所有 SQL 备份文件统一存放在项目根目录的 `database/` 文件夹中：

```
healthsystem/
└── database/
    ├── healthsystem_2026.sql   ← 最新备份（推荐使用）
    ├── healthsystem-whole2.sql
    ├── healthsystem-whole.sql
    ├── healthsystem-20240623.sql
    ├── healthsystem-20211010-全数据备份.sql
    ├── healthsystem-仅结构.sql
    ├── healthsystem-删减日常填报状态.sql
    ├── healthsystem-测试数据.sql
    ├── ceshi.sql
    ├── ceshi2.sql
    ├── ceshi3.sql
    ├── hsd.sql
    └── hsd2.sql
```

**推荐使用文件**：`healthsystem_2026.sql`
- 来源 Schema：`healthsystem_test2`
- 包含完整的表结构 + 2025 年测试数据

---

## 二、数据库连接配置

### 后端配置文件

配置文件路径：
- 开发环境：`healthsystem-backend6/healthsystem-backend/src/main/resources/application-default.yml`
- 部署环境：`healthsystem-backend6/healthsystem-backend/src/main/resources/application-deploy.yml`

### 连接参数

| 参数 | 值 |
|------|-----|
| 数据库类型 | MySQL 8.0 |
| 主机地址 | `127.0.0.1` |
| 端口 | `3306` |
| 数据库名 | `healthsystem_test2` |
| 用户名 | `root` |
| 密码 | `123456` |
| 时区 | `GMT+8`（Asia/Shanghai） |
| 字符集 | `utf-8` |
| 连接池 | Druid |

### JDBC 连接字符串

```
jdbc:mysql://127.0.0.1:3306/healthsystem_test2?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSLL=false
```

---

## 三、SQL 文件导入步骤

### 方法一：命令行导入（推荐）

**步骤 1：确认 MySQL 服务已启动**

```bash
# Windows 检查服务
sc query MySQL80
# 或
net start MySQL80
```

**步骤 2：登录 MySQL，创建数据库（如不存在）**

```bash
mysql -u root -p
```

登录后执行：

```sql
CREATE DATABASE IF NOT EXISTS healthsystem_test2 
  DEFAULT CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

USE healthsystem_test2;
```

**步骤 3：退出 MySQL，执行导入**

```bash
mysql -u root -p123456 healthsystem_test2 < "e:\Code\AI\Start\Web\Mindapp\healthsystem\database\healthsystem_2026.sql"
```

> 注意：Windows 路径中如有中文或空格，请用英文双引号包裹路径。

**步骤 4：验证导入结果**

```bash
mysql -u root -p123456 -e "USE healthsystem_test2; SHOW TABLES;"
```

---

### 方法二：Navicat 图形界面导入

1. 打开 Navicat，连接到 MySQL（参数见下方第四节）
2. 在左侧数据库列表中找到 `healthsystem_test2`，右键点击
3. 选择 **运行 SQL 文件**
4. 在弹出窗口中，点击文件夹图标，选择：
   ```
   e:\Code\AI\Start\Web\Mindapp\healthsystem\database\healthsystem_2026.sql
   ```
5. 编码选择 `UTF-8`，点击 **开始**
6. 等待导入完成，查看日志确认无错误

---

## 四、Navicat 连接参数

### 新建连接步骤

1. 打开 Navicat，点击左上角 **连接** → **MySQL**
2. 填写以下参数：

| 字段 | 值 |
|------|-----|
| 连接名 | `healthsystem_dev`（自定义） |
| 主机 | `127.0.0.1` |
| 端口 | `3306` |
| 用户名 | `root` |
| 密码 | `123456` |

3. 点击 **测试连接**，显示"连接成功"后点击 **确定**
4. 在左侧展开连接，找到 `healthsystem_test2` 数据库

---

## 五、常见问题及解决方案

### 问题 1：后端启动报错 `Access denied for user 'root'@'localhost'`

**原因**：MySQL root 密码不是 `1234`，或 root 用户无本地登录权限。

**解决方案**：
```sql
-- 以有权限的账号登录 MySQL 后执行
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;
```

---

### 问题 2：数据库 `healthsystem_test2` 不存在

**解决方案**：手动创建数据库

```sql
CREATE DATABASE healthsystem_test2 
  DEFAULT CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;
```

---

### 问题 3：导入 SQL 文件时出现字符编码错误

**解决方案**：在命令行导入时指定编码

```bash
mysql -u root -p123456 --default-character-set=utf8mb4 healthsystem_test2 < "healthsystem_2026.sql"
```

或在 Navicat 导入时，将编码从 `自动` 改为 `UTF-8`。

---

### 问题 4：Navicat 连接失败，提示 `2003 - Can't connect to MySQL server`

**原因**：MySQL 服务未启动，或防火墙阻断 3306 端口。

**解决方案**：
```bash
# 启动 MySQL 服务（Windows）
net start MySQL80

# 检查 3306 端口是否监听
netstat -ano | findstr 3306
```

---

### 问题 5：导入时提示 `Table already exists`

**原因**：数据库中已有同名表，发生冲突。

**解决方案**：先清空数据库，再重新导入

```sql
DROP DATABASE healthsystem_test2;
CREATE DATABASE healthsystem_test2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

然后重新执行导入命令。

---

## 六、后端启动验证

导入数据库并配置好连接后，启动后端：

```bash
cd healthsystem-backend6/healthsystem-backend
mvn spring-boot:run -Dspring.profiles.active=default
```

后端默认运行在 `http://localhost:8080`（HTTPS 模式下为 `https://localhost:8443`）。

若后端启动正常且无数据库连接错误，说明数据库配置完全正确。
