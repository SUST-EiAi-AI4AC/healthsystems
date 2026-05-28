-- ============================================================
-- HTP绘画记录表结构重构迁移脚本
-- 执行日期: 2026-03-30
-- 说明: 删除旧字段（房/树/人评分和图片路径），新增统一的绘画图片字段
-- ============================================================

-- 注意：执行前请先备份数据！

-- ===================== 方案一：表不存在时直接创建 =====================
-- 如果表不存在，直接创建新表结构
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
  INDEX `idx_htp_score`(`score` ASC) USING BTREE,
  CONSTRAINT `fk_htp_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'HTP绘画测验历史记录（房-树-人测验，存储评分、报告、图片路径）' ROW_FORMAT = DYNAMIC;

-- ===================== 方案二：表存在时迁移数据 =====================
-- 如果表已存在，执行以下迁移语句（先添加新字段，迁移数据，再删除旧字段）

-- 步骤1：添加新字段（如果不存在）
-- 注意：如果字段已存在会报错，可以忽略该错误
-- ALTER TABLE `htp_drawing_record` 
-- ADD COLUMN `drawing_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '绘画图片文件路径（完整画布图片）' AFTER `report_content`;

-- 使用存储过程安全添加字段
DROP PROCEDURE IF EXISTS add_column_if_exists;
DELIMITER $$
CREATE PROCEDURE add_column_if_exists()
BEGIN
    -- 检查并添加 drawing_img_url 字段
    IF NOT EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'drawing_img_url'
    ) THEN
        ALTER TABLE `htp_drawing_record` 
        ADD COLUMN `drawing_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '绘画图片文件路径（完整画布图片）' AFTER `report_content`;
    END IF;
    
    -- 从 canvas_img_url 迁移数据到 drawing_img_url（如果 canvas_img_url 存在）
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'canvas_img_url'
    ) THEN
        UPDATE `htp_drawing_record` 
        SET `drawing_img_url` = `canvas_img_url` 
        WHERE `canvas_img_url` IS NOT NULL AND (`drawing_img_url` IS NULL OR `drawing_img_url` = '');
    END IF;
    
    -- 删除旧字段
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'house_score'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `house_score`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'tree_score'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `tree_score`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'person_score'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `person_score`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'house_img_url'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `house_img_url`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'tree_img_url'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `tree_img_url`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'person_img_url'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `person_img_url`;
    END IF;
    
    IF EXISTS (
        SELECT * FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = 'htp_drawing_record' 
        AND column_name = 'canvas_img_url'
    ) THEN
        ALTER TABLE `htp_drawing_record` DROP COLUMN `canvas_img_url`;
    END IF;
END$$
DELIMITER ;

-- 执行存储过程
CALL add_column_if_exists();

-- 清理存储过程
DROP PROCEDURE IF EXISTS add_column_if_exists;

-- 验证表结构
DESC `htp_drawing_record`;
-- 预期结果：
-- id, user_id, log_date, add_timestamp, score, report_content, drawing_img_url
