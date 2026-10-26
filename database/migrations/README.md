# 账号角色体系数据库迁移说明

本目录存放 `healthsystems` 平台账号角色体系的数据库迁移脚本。
角色枚举统一为 `user_info.role`：

| role 值 | 语义 | App/H5 | 后台管理端 | 医生端接口（@RequiresRoles("doctor")） |
|---|---|---|---|---|
| `user` | 普通用户（前端注册入口新注册账号默认值） | 允许 | 拒绝 | 拒绝 |
| `doctor` | 医生（`/doctor/register` 新注册的医生） | 允许 | 允许 | 允许 |
| `admin` | 管理员（本次迁移后的历史账号） | 允许 | 允许 | 允许（admin 在 Shiro 中同时拥有 doctor 角色） |
| 空 / 未知 | 按普通用户回退 | 允许 | 拒绝 | 拒绝 |

## 一、文件与执行顺序

| 顺序 | 文件 | 作用 |
|---|---|---|
| 0 | 手工备份（见第二节） | 出错时最直接的还原手段 |
| 1 | `20261026_01_role_admin_upgrade.sql` | 把**历史账号**（迁移前已存在）统一提升为 `admin`，并记录旧角色 |
| 2 | 脚本末尾的核对查询 | 确认角色分布符合预期 |
| 3 | `20261026_02_role_admin_rollback.sql` | 仅在需要回滚时执行，还原迁移前角色 |

执行方式（示例）：

```bash
mysql -u<user> -p <db> < database/migrations/20261026_01_role_admin_upgrade.sql
```

## 二、执行前备份（必做）

```bash
mysqldump -u<user> -p --single-transaction <db> \
    user_info role_permission > backup_user_role_$(date +%Y%m%d%H%M).sql
```

## 三、影响范围

1. 只改动 `user_info.role`：
   - 仅 `user_id <= 迁移边界` 的账号会被提升为 `admin`。边界值在**首次执行时**写入 `role_migration_meta.boundary_user_id`（等于当时的 `MAX(user_id)`），之后不会再变。
   - 本次改造之后新注册的账号（`/user/register`、`/doctor/register`、后台“添加新用户”）由后端强制写入 `role='user'`，不会被迁移脚本覆盖。
2. `role_permission` 会按需补一行 `('admin','vip')`（已存在则跳过，幂等）。
3. 新增两张辅助表，不参与业务读写：
   - `role_migration_meta`：迁移边界（幂等依据），**请勿删除/修改**。
   - `user_role_migration_log`：旧角色备份（回滚依据），**请勿清空**。
4. 不会修改密码、JWT、`user_health_info`/`nwpu_user_info` 等任何其它数据。

## 四、幂等性与回滚

**幂等**：升级脚本可以重复执行。

- 边界表用主键 + `INSERT IGNORE` 固定，重复执行不会把新注册账号纳入范围；
- 日志表以 `user_id` 为主键，`INSERT IGNORE` 不会覆盖已记录的旧角色；
- 提升语句的条件是 `u.role = l.old_role AND u.role <> 'admin'`，已迁移的行会被跳过。

**回滚**：

```bash
mysql -u<user> -p <db> < database/migrations/20261026_02_role_admin_rollback.sql
```

回滚只还原“当前仍然是 `admin`”的历史账号，迁移后被人工改过角色的账号不会被覆盖。
回滚完成并确认无误后，可手工执行脚本注释里的 `DROP TABLE` 清理两张辅助表（可选）。

## 五、验证 SQL

```sql
-- 1. 角色分布（迁移后：历史账号全部 admin；新注册账号为 user）
SELECT role, COUNT(*) FROM user_info GROUP BY role ORDER BY role;

-- 2. 迁移明细（可与 user_info 逐一核对）
SELECT u.user_id, u.user_name, u.role AS current_role, l.old_role, l.migrated_at
FROM user_info u JOIN user_role_migration_log l ON u.user_id = l.user_id
ORDER BY u.user_id;

-- 3. 迁移边界（新注册账号的 user_id 必须大于该值）
SELECT boundary_user_id, created_at FROM role_migration_meta WHERE id = 1;

-- 4. 管理员默认权限是否齐备
SELECT role, permission FROM role_permission ORDER BY role;
```

## 六、单个账号授权 / 降权（日常运维）

```sql
-- 把某个账号提升为管理员（可登录后台管理端）
UPDATE user_info SET role = 'admin' WHERE user_name = '<用户名>';

-- 把某个账号降为普通用户（仅能使用 App/H5，后台登录会被拒绝）
UPDATE user_info SET role = 'user' WHERE user_name = '<用户名>';

-- 若希望“降权”在重复执行升级脚本后依然保持，需同时删除该账号的迁移日志行：
DELETE FROM user_role_migration_log WHERE user_id = <用户id>;
```

> 注意：历史账号全部提升为管理员是本需求（“历史账号视为管理员”）的直接结果，
> 意味着这些账号都能登录后台管理端。如需收紧，请用上面的降权 SQL 处理。
