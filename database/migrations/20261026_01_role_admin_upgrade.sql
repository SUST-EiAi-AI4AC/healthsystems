-- =============================================================================
-- 账号角色体系迁移（一）：历史账号统一提升为管理员 admin
-- 文件：database/migrations/20261026_01_role_admin_upgrade.sql
-- 涉及表：user_info、role_permission（新增辅助表 role_migration_meta、user_role_migration_log）
-- 角色枚举：user=普通用户（仅 App/H5）、doctor=医生（可登录后台 + 医生端接口）、
--           admin=管理员（可登录后台；在 Shiro 中同时具备 doctor 角色，因为后台页面大量调用 /doctor/** 接口）
--
-- 特性：幂等（可重复执行）、可回滚（配合 20261026_02_role_admin_rollback.sql）
--
-- !!! 执行前必须先备份 !!!
--   mysqldump -u<user> -p --single-transaction <db> user_info role_permission \
--       > backup_user_role_YYYYMMDDHHmm.sql
--
-- 执行顺序：01（本文件） -> 按“步骤 7”核对结果 -> 异常时执行 02 回滚
-- 影响范围：仅 user_id <= 迁移边界（= 本次执行前的最大 user_id）的历史账号的 user_info.role；
--           之后新注册的账号（role 由后端强制写入 user）不会被改动
-- =============================================================================

SET NAMES utf8;

-- -----------------------------------------------------------------------------
-- 步骤 1：迁移边界表（记录“历史账号”的 user_id 上界，保证重复执行不误改新账号）
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `role_migration_meta` (
  `id` tinyint(4) NOT NULL COMMENT '固定为 1',
  `boundary_user_id` bigint(20) NOT NULL COMMENT '迁移边界：user_id <= 该值的账号视为历史账号',
  `note` varchar(255) NULL DEFAULT NULL COMMENT '说明',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号角色迁移边界（幂等依据）';

-- 只在第一次执行时写入边界；重复执行因主键冲突被 IGNORE，边界保持不变
INSERT IGNORE INTO `role_migration_meta` (`id`, `boundary_user_id`, `note`)
SELECT 1, COALESCE(MAX(`user_id`), 0), '账号角色迁移边界：首次执行时的最大 user_id'
FROM `user_info`;

-- -----------------------------------------------------------------------------
-- 步骤 2：旧角色备份日志表（回滚依据），主键 user_id 天然幂等
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_role_migration_log` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `old_role` varchar(16) NOT NULL COMMENT '迁移前的角色（回滚用）',
  `new_role` varchar(16) NOT NULL COMMENT '迁移后的角色',
  `migrated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '迁移时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号角色迁移日志（回滚依据，请勿清空）';

-- -----------------------------------------------------------------------------
-- 步骤 3：记录历史账号的旧角色（已记录的行不会被覆盖）
-- -----------------------------------------------------------------------------
SET @boundary := (SELECT `boundary_user_id` FROM `role_migration_meta` WHERE `id` = 1);

INSERT IGNORE INTO `user_role_migration_log` (`user_id`, `old_role`, `new_role`)
SELECT `user_id`, `role`, 'admin'
FROM `user_info`
WHERE `user_id` <= @boundary
  AND `role` IS NOT NULL
  AND `role` <> 'admin';

-- -----------------------------------------------------------------------------
-- 步骤 4：把历史账号提升为管理员
-- 仅当“当前角色仍等于迁移前记录的角色”时才更新：
--   - 首次执行：role 必然等于 old_role，全部提升；
--   - 重复执行：已是 admin 的行不会重复处理；
--   - 迁移后被人为改过角色的行不会被覆盖。
-- -----------------------------------------------------------------------------
UPDATE `user_info` u
JOIN `user_role_migration_log` l ON u.`user_id` = l.`user_id`
SET u.`role` = 'admin'
WHERE u.`role` = l.`old_role`
  AND u.`role` <> 'admin';

-- -----------------------------------------------------------------------------
-- 步骤 5：确保 role_permission 中存在 admin 角色（管理员的默认权限沿用 vip）
-- -----------------------------------------------------------------------------
INSERT INTO `role_permission` (`role`, `permission`)
SELECT 'admin', 'vip' FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `role_permission` WHERE `role` = 'admin');

-- -----------------------------------------------------------------------------
-- 步骤 6：更新字段注释，把枚举写进数据库
-- -----------------------------------------------------------------------------
ALTER TABLE `user_info`
  MODIFY COLUMN `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user'
  COMMENT '账号角色：user=普通用户（仅App/H5），doctor=医生，admin=管理员（可登录后台管理端）';

-- -----------------------------------------------------------------------------
-- 步骤 7：结果核对（应看到历史账号全部为 admin，且日志条数 = 历史账号中被提升的条数）
-- -----------------------------------------------------------------------------
SELECT `role`, COUNT(*) AS total FROM `user_info` GROUP BY `role` ORDER BY `role`;
SELECT COUNT(*) AS migrated_rows FROM `user_role_migration_log`;
SELECT `role`, `permission` FROM `role_permission` ORDER BY `role`;
