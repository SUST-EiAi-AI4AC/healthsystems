-- =============================================================================
-- 账号角色体系迁移（二）：回滚脚本
-- 文件：database/migrations/20261026_02_role_admin_rollback.sql
-- 作用：把 20261026_01_role_admin_upgrade.sql 提升为 admin 的历史账号，还原成迁移前的角色
-- 依赖：user_role_migration_log（升级脚本创建的备份日志表）
-- 说明：只还原“当前仍然是 admin”的行；迁移后被人工改过角色的账号不会被覆盖
-- 执行顺序：确认需要回滚后直接执行本文件 -> 按“核对”段落验证
-- =============================================================================

SET NAMES utf8;

-- 回滚前先看一眼将被还原的账号（可选，用于人工确认）
SELECT u.`user_id`, u.`user_name`, u.`role` AS `current_role`, l.`old_role`
FROM `user_info` u
JOIN `user_role_migration_log` l ON u.`user_id` = l.`user_id`
WHERE u.`role` = 'admin'
ORDER BY u.`user_id`;

-- 执行回滚：恢复迁移前角色
UPDATE `user_info` u
JOIN `user_role_migration_log` l ON u.`user_id` = l.`user_id`
SET u.`role` = l.`old_role`
WHERE u.`role` = 'admin';

-- 核对：角色分布应回到迁移前的状态（user / doctor 混合，无 admin）
SELECT `role`, COUNT(*) AS total FROM `user_info` GROUP BY `role` ORDER BY `role`;

-- 回滚完成、确认无需再次回滚后，可手工清理辅助表（可选，不清理也不影响业务）：
-- DROP TABLE IF EXISTS `user_role_migration_log`;
-- DROP TABLE IF EXISTS `role_migration_meta`;
