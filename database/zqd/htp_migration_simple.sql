-- ============================================================
-- HTP绘画记录表结构重构迁移脚本（简化版）
-- 执行日期: 2026-03-31
-- 说明: 简化版迁移脚本，适用于 Navicat 直接执行
-- ============================================================

-- 注意：执行前请先备份数据！

-- ============================================================
-- 步骤1：检查并创建表（如果不存在）
-- ============================================================
-- 如果表不存在，直接创建新表结构
-- 此命令会检查表是否存在，不存在才创建
CREATE TABLE IF NOT EXISTS `htp_drawing_record` (
  `id`              bigint       NOT NULL AUTO_INCREMENT,
  `user_id`         bigint       NOT NULL COMMENT '用户id，外键',
  `log_date`        date         NOT NULL COMMENT '绘画日期',
  `add_timestamp`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `score`           tinyint      NOT NULL DEFAULT 0 COMMENT 'HTP综合评分 0-100',
  `report_content`  text         CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'AI生成的心理分析报告全文',
  `drawing_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '绘画图片文件路径（完整画布图片）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_htp_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_htp_log_date`(`log_date` ASC) USING BTREE,
  INDEX `idx_htp_user_date`(`user_id` ASC, `log_date` ASC) USING BTREE,
  INDEX `idx_htp_score`(`score` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'HTP绘画测验历史记录' ROW_FORMAT = DYNAMIC;

-- ============================================================
-- 步骤2：如果表已存在旧字段，执行以下语句（逐条执行）
-- ============================================================

-- 2.1 添加新字段 drawing_img_url（如果字段已存在会报错，忽略即可）
-- ALTER TABLE `htp_drawing_record` ADD COLUMN `drawing_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '绘画图片文件路径' AFTER `report_content`;

-- 2.2 迁移数据：将 canvas_img_url 数据复制到 drawing_img_url
-- UPDATE `htp_drawing_record` SET `drawing_img_url` = `canvas_img_url` WHERE `canvas_img_url` IS NOT NULL AND (`drawing_img_url` IS NULL OR `drawing_img_url` = '');

-- 2.3 删除旧字段（逐个删除，如果字段不存在会报错，忽略即可）
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `house_score`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `tree_score`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `person_score`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `house_img_url`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `tree_img_url`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `person_img_url`;
-- ALTER TABLE `htp_drawing_record` DROP COLUMN IF EXISTS `canvas_img_url`;

-- ============================================================
-- 步骤3：验证表结构
-- ============================================================
-- 查看表结构，确认只有以下字段：
-- id, user_id, log_date, add_timestamp, score, report_content, drawing_img_url
DESC `htp_drawing_record`;

-- 查看现有数据
SELECT * FROM `htp_drawing_record` LIMIT 10;
