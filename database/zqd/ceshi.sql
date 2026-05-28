/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : ceshi

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 19/07/2025 16:22:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id，外键',
  `log_date` date NOT NULL COMMENT '填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。同时还可以在数据库层面完成限制：一个用户一天只有一条记录',
  `sports_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '运动信息，如慢跑、走路、游泳等，这里不应限制运动方式数量，可以存储多种，每一种方式以字符‘|’隔开',
  `sports_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '运动时间，单位分钟，与上面对应用‘|’隔开',
  `diet_info` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态',
  `statement_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_logdate`(`user_id` ASC, `log_date` ASC) USING BTREE,
  CONSTRAINT `fk_user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 681 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '每日一次的填报记录（睡眠时间、运动时间、服药等信息）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 1, '2020-10-26', '慢跑', '30分钟到1小时', '胃口更好|进食更多', '', '2020-11-16 15:39:35');
INSERT INTO `answer` VALUES (2, 1, '2020-11-15', '慢跑', '1小时到1.5小时', '胃口更好', ' ', '2020-11-21 13:59:27');
INSERT INTO `answer` VALUES (4, 1, '2020-11-16', '慢跑', '超过2小时', '暴饮暴食', '', '2020-11-21 13:58:24');
INSERT INTO `answer` VALUES (5, 1, '2020-11-17', '游泳', '1.5小时到2小时', '我的胃口更好，吃的比平时更多了', '', '2020-11-21 13:58:21');
INSERT INTO `answer` VALUES (6, 1, '2020-11-29', '跳绳', '1小时到1.5小时', '我的胃口更好，吃的比平时更多了', '', '2020-12-04 18:04:39');
INSERT INTO `answer` VALUES (7, 1, '2020-11-30', '球类运动', '30分钟到1小时', '我的胃口更好，吃的比平时更多了', '', '2020-12-04 18:04:34');
INSERT INTO `answer` VALUES (9, 1, '2020-12-01', '球类运动', '少于30分钟', '我的胃口更好，吃的比平时更多了', '', '2020-12-04 18:04:31');
INSERT INTO `answer` VALUES (10, 1, '2020-12-02', '瑜伽', '30分钟到1小时', '我的胃口更好，吃的比平时更多了', '', '2020-12-04 18:04:27');
INSERT INTO `answer` VALUES (11, 1, '2020-12-03', '没有运动(请您跳过第二题，直接选择第三题)', '0', '我的胃口更好，吃的比平时更多了', '', '2020-12-04 18:04:23');
INSERT INTO `answer` VALUES (12, 1, '2020-12-04', '没有运动(请您跳过第二题，直接选择第三题)', '0', '我的胃口更差，吃的比平时更少了', '', '2020-12-04 18:04:20');
INSERT INTO `answer` VALUES (13, 1, '2020-12-10', '游泳', '30分钟到1小时', '暴饮暴食', '', '2020-12-11 22:14:15');
INSERT INTO `answer` VALUES (14, 1, '2020-12-11', '球类运动', '1小时到1.5小时', '我的胃口更好，吃的比平时更多了', '', '2020-12-11 22:21:42');
INSERT INTO `answer` VALUES (15, 1, '2020-12-12', '游泳', '1小时到1.5小时', '暴饮暴食', '', '2020-12-17 17:03:07');
INSERT INTO `answer` VALUES (16, 1, '2020-12-13', '游泳', '1小时到1.5小时', '暴饮暴食', '', '2020-12-17 17:03:08');
INSERT INTO `answer` VALUES (17, 1, '2020-12-14', '没有运动(请您跳过第二题，直接选择第三题)', '1小时到1.5小时', '我的胃口更好，吃的比平时更多了', '', '2020-12-17 17:03:13');
INSERT INTO `answer` VALUES (18, 1, '2021-01-06', '走路', '少于30分钟', '我的胃口更差，吃的比平时更少了', '', '2021-01-06 16:23:56');
INSERT INTO `answer` VALUES (19, 1, '2021-01-08', '走路', '30分钟到1小时', '我的胃口更好，吃的比平时更多了', '', '2021-01-08 14:39:25');
INSERT INTO `answer` VALUES (20, 1, '2021-01-10', '瑜伽', '1小时到1.5小时', '我的胃口更好，吃的比平时更多了', '', '2021-01-10 17:54:31');
INSERT INTO `answer` VALUES (21, 1, '2021-01-11', '走路', '30分钟到1小时', '我的胃口更好，吃的比平时更多了', '', '2021-01-11 23:44:01');
INSERT INTO `answer` VALUES (22, 1, '2021-01-12', '走路', '30分钟到1小时', '我的胃口更好，吃的比平时更多了', '', '2021-01-12 21:41:45');
INSERT INTO `answer` VALUES (23, 1, '2021-01-15', '跳绳', '超过2小时', '我的胃口更差，吃的比平时更少了', '', '2021-01-15 21:26:48');
INSERT INTO `answer` VALUES (24, 1, '2021-01-20', '走路', '超过2小时', '我的胃口更好，吃的比平时更多了', '', '2021-01-20 18:05:29');
INSERT INTO `answer` VALUES (25, 1, '2021-01-23', '没有运动(请您跳过第二题，直接选择第三题)', '0', '我的胃口更差，吃的比平时更少了', '', '2021-01-23 14:55:25');
INSERT INTO `answer` VALUES (26, 1, '2021-02-02', '跑步', '1.5小时到2小时', '我的胃口更差，吃的比平时更少了', '', '2021-02-02 18:46:55');
INSERT INTO `answer` VALUES (28, 1, '2021-03-03', '瑜伽', '30分钟到1小时', '我的胃口更差，吃的比平时更少了', '', '2021-03-03 14:04:07');
INSERT INTO `answer` VALUES (29, 3, '2021-03-04', '跑步', '1.5小时到2小时', '我的胃口更好，吃的比平时更多了', '', '2021-03-04 21:29:37');
INSERT INTO `answer` VALUES (35, 3, '2021-03-05', '游泳', '1.5小时到2小时', '我的胃口更差，吃的比平时更少了', '', '2021-03-05 09:13:27');
INSERT INTO `answer` VALUES (680, 1, '2023-04-23', '瑜伽', '1.5小时到2小时', '我的胃口更差，吃的比平时更少了', '', '2023-04-23 12:53:53');

-- ----------------------------
-- Table structure for everyday_status
-- ----------------------------
DROP TABLE IF EXISTS `everyday_status`;
CREATE TABLE `everyday_status`  (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL,
  `status_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_date`(`user_id` ASC, `log_date` ASC) USING BTREE,
  CONSTRAINT `everyday_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of everyday_status
-- ----------------------------

-- ----------------------------
-- Table structure for invition_code
-- ----------------------------
DROP TABLE IF EXISTS `invition_code`;
CREATE TABLE `invition_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '医生或者管理员的id',
  `invition_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邀请码',
  `inviter` bigint NULL DEFAULT NULL COMMENT '邀请者的id',
  `assistant_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '助理邀请码，用于邀请助理注册',
  `group_id` bigint NOT NULL COMMENT '助理归属于的医生的id，可以一个小组的id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_invition_code`(`invition_code` ASC) USING BTREE,
  INDEX `fk_userId_13`(`user_id` ASC) USING BTREE,
  INDEX `fk_userId_13_2`(`inviter` ASC) USING BTREE,
  CONSTRAINT `fk_userId_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId_13_2` FOREIGN KEY (`inviter`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用于管理后台管理端的用户，通过邀请码注册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invition_code
-- ----------------------------
INSERT INTO `invition_code` VALUES (1, 1, '710129', 1, '710130', 1);

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `file_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `log_date` date NOT NULL,
  `log_time` time NOT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `infer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `infer_cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_audo_userid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_depressionvideo_userid` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 1, 'depression-video', '2021-09-17', '17:56:18', '111', NULL, NULL);
INSERT INTO `media` VALUES (2, 1, 'depression-video', '2021-09-17', '17:56:45', '/depression-video/1_depression-video_20210917_a6aa5111-1e6a-4c40-b829-7b3c1498f0f6.jpg', NULL, NULL);
INSERT INTO `media` VALUES (3, 1, 'depression-video', '2021-10-09', '23:38:58', '/depression-video/1_depression-video_20211009_9a8aca8a-5a1f-4b60-af65-bad1c5aa6046.mp4', '5', 1984.00);
INSERT INTO `media` VALUES (4, 1, 'depression-video', '2021-10-09', '23:40:41', '/depression-video/1_depression-video_20211009_bd71e14f-f9ed-4d65-8707-ae4f5ba6fa7d.mp4', '5', 1867.00);
INSERT INTO `media` VALUES (5, 1, 'depression-video', '2021-10-09', '23:43:58', '/depression-video/1_depression-video_20211009_6b59c01e-0be0-494d-9c4e-b78325d3c82e.mp4', '5', 1894.00);
INSERT INTO `media` VALUES (6, 1, 'depression-video', '2021-10-09', '23:45:23', '/depression-video/1_depression-video_20211009_96ac84a7-53d0-4944-a7ec-645a12ba8377.mp4', '5', 1902.00);
INSERT INTO `media` VALUES (7, 1, 'depression-video', '2021-10-09', '23:50:13', '/depression-video/1_depression-video_20211009_607a96e4-ef2d-46b1-9143-c48d4fc3184c.mp4', '7', 26650.00);
INSERT INTO `media` VALUES (8, 1, 'depression-video', '2021-10-09', '23:51:04', '/depression-video/1_depression-video_20211009_16fc1b1b-cd60-4c1f-9fcd-fc1d9557a0af.mp4', '9', 185196.00);
INSERT INTO `media` VALUES (9, 1, 'depression-video', '2021-10-09', '23:54:42', '/depression-video/1_depression-video_20211009_769944d9-c8fe-45ac-a788-0ce283007391.mp4', '8', 18202.00);
INSERT INTO `media` VALUES (10, 1, 'depression-video', '2021-10-09', '23:55:40', '/depression-video/1_depression-video_20211009_51dccedd-b2c6-43c1-b98c-32fb0f5142fd.mp4', '9', 41655.00);
INSERT INTO `media` VALUES (11, 1, 'depression-video', '2021-10-09', '23:57:39', '/depression-video/1_depression-video_20211009_31e084fc-503b-4455-b92f-55cea95e00db.mp4', '5', 106553.00);
INSERT INTO `media` VALUES (12, 1, 'depression-video', '2021-10-10', '00:01:24', '/depression-video/1_depression-video_20211010_e850f4ce-f332-48db-8fa6-970d321351ee.mp4', '5', 115411.00);

-- ----------------------------
-- Table structure for nwpu_user_info
-- ----------------------------
DROP TABLE IF EXISTS `nwpu_user_info`;
CREATE TABLE `nwpu_user_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `nwpu_id` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户学号/工号',
  `college` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '所属学院/单位名字',
  `grade` smallint NOT NULL DEFAULT 0 COMMENT '用户所在年级，入学/校年份',
  `type` enum('未知','本科生','硕士生','博士生','教职工') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '未知' COMMENT '用户类型，未知（0），本科生（1），硕士（2），博士（3），教职工（4）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_nwpu_id`(`nwpu_id` ASC) USING BTREE COMMENT '学号/工号唯一',
  UNIQUE INDEX `u_user_id_3`(`user_id` ASC) USING BTREE,
  INDEX `fk_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '西北工业大学用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nwpu_user_info
-- ----------------------------
INSERT INTO `nwpu_user_info` VALUES (4, 2, '2019001234', '计算机学院', 2019, '硕士生', '2020-10-26 16:49:03', NULL);
INSERT INTO `nwpu_user_info` VALUES (5, 20, '2017xx1234', '计算机学院', 2017, '本科生', '2020-11-02 01:11:56', '2020-11-02 01:26:37');
INSERT INTO `nwpu_user_info` VALUES (6, 45, '2000991234', '计算机学院', 2000, '本科生', '2020-12-03 22:28:25', '2020-12-03 22:28:29');
INSERT INTO `nwpu_user_info` VALUES (7, 1, '2017302297', '计算机学院', 2017, '本科生', '2020-12-04 22:42:46', '2020-12-04 22:43:09');
INSERT INTO `nwpu_user_info` VALUES (8, 77, '2017000000', '计算机学院', 2017, '硕士生', '2020-12-08 16:00:04', '2020-12-08 16:01:29');

-- ----------------------------
-- Table structure for perceived_stress_scale
-- ----------------------------
DROP TABLE IF EXISTS `perceived_stress_scale`;
CREATE TABLE `perceived_stress_scale`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL,
  `pss_q1` tinyint NOT NULL DEFAULT 0 COMMENT '一些无法预期的事情发生而感到心烦意乱',
  `pss_q2` tinyint NOT NULL DEFAULT 0 COMMENT '感觉无法控制自己生活中重要的事情',
  `pss_q3` tinyint NOT NULL DEFAULT 0 COMMENT '感到紧张不安和压力',
  `pss_q4` tinyint NOT NULL DEFAULT 0 COMMENT '成功地处理恼人的生活麻烦',
  `pss_q5` tinyint NOT NULL DEFAULT 0 COMMENT '感到自己是有效地处理生活中所发生的重要改变',
  `pss_q6` tinyint NOT NULL DEFAULT 0 COMMENT '对于有能力处理自己私人的问题感到很有信心 ',
  `pss_q7` tinyint NOT NULL DEFAULT 0 COMMENT '感到事情顺心如意',
  `pss_q8` tinyint NOT NULL DEFAULT 0 COMMENT '发现自己无法处理所有自己必须做的事情',
  `pss_q9` tinyint NOT NULL DEFAULT 0 COMMENT '有办法控制生活中恼人的事情',
  `pss_q10` tinyint NOT NULL DEFAULT 0 COMMENT '常觉得自己是驾驭事情的主人',
  `pss_q11` tinyint NOT NULL DEFAULT 0 COMMENT '常生气，因为很多事情的发生是超出自己所能控制的',
  `pss_q12` tinyint NOT NULL DEFAULT 0 COMMENT '.经常想到有些事情是自己必须完成的',
  `pss_q13` tinyint NOT NULL DEFAULT 0 COMMENT '常能掌握时间安排方式',
  `pss_q14` tinyint NOT NULL DEFAULT 0 COMMENT '常感到困难的事情堆积如山，而自己无法克服它们',
  `score` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_logdate_8`(`user_id` ASC, `log_date` ASC) USING BTREE,
  INDEX `k_log_date_8`(`log_date` ASC) USING BTREE,
  CONSTRAINT `fk_user_id_8` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '这份量表是在询问在最近一个月来，您个人的感受和想法，请您于每一个题项上作答时，去指出您感受或想到某一特定想法的频率。虽然有些问题看是相似，实则是有所差异，所以每一题均需作答。\r\n而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的压力知觉状况。而每一题项皆有下列五种选择。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of perceived_stress_scale
-- ----------------------------
INSERT INTO `perceived_stress_scale` VALUES (1, 3, '2020-11-08', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 28);
INSERT INTO `perceived_stress_scale` VALUES (2, 3, '2020-11-09', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 28);
INSERT INTO `perceived_stress_scale` VALUES (3, 3, '2020-11-10', 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 27);
INSERT INTO `perceived_stress_scale` VALUES (4, 1, '2020-11-11', 2, 1, 0, 2, 1, 2, 1, 3, 1, 4, 1, 2, 2, 1, 25);
INSERT INTO `perceived_stress_scale` VALUES (5, 1, '2020-11-12', 2, 2, 1, 4, 3, 2, 3, 1, 2, 1, 4, 1, 0, 3, 27);
INSERT INTO `perceived_stress_scale` VALUES (6, 1, '2020-11-16', 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 27);
INSERT INTO `perceived_stress_scale` VALUES (7, 1, '2020-11-18', 4, 1, 0, 1, 4, 0, 1, 0, 0, 0, 0, 0, 1, 0, 26);
INSERT INTO `perceived_stress_scale` VALUES (8, 1, '2020-11-19', 0, 1, 3, 1, 1, 0, 1, 1, 3, 2, 1, 2, 3, 1, 26);
INSERT INTO `perceived_stress_scale` VALUES (9, 1, '2020-11-26', 2, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 2, 0, 0, 32);
INSERT INTO `perceived_stress_scale` VALUES (10, 1, '2020-11-28', 0, 0, 0, 3, 4, 2, 1, 2, 1, 1, 1, 3, 4, 3, 21);
INSERT INTO `perceived_stress_scale` VALUES (11, 1, '2020-12-07', 2, 2, 1, 4, 4, 3, 1, 3, 3, 2, 3, 1, 2, 2, 23);
INSERT INTO `perceived_stress_scale` VALUES (12, 1, '2020-12-14', 3, 1, 1, 4, 3, 3, 4, 2, 3, 2, 1, 2, 2, 2, 19);
INSERT INTO `perceived_stress_scale` VALUES (13, 1, '2020-12-18', 1, 1, 2, 2, 3, 4, 3, 3, 3, 3, 3, 2, 3, 2, 21);
INSERT INTO `perceived_stress_scale` VALUES (14, 1, '2021-01-08', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28);
INSERT INTO `perceived_stress_scale` VALUES (15, 3, '2021-03-04', 0, 0, 0, 0, 3, 3, 4, 0, 4, 0, 1, 2, 3, 3, 17);
INSERT INTO `perceived_stress_scale` VALUES (26, 1, '2021-03-17', 3, 1, 1, 0, 1, 4, 3, 3, 2, 1, 1, 1, 0, 1, 28);

-- ----------------------------
-- Table structure for phq9
-- ----------------------------
DROP TABLE IF EXISTS `phq9`;
CREATE TABLE `phq9`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL,
  `phq9_q1` tinyint NOT NULL DEFAULT 0,
  `phq9_q2` tinyint NOT NULL DEFAULT 0,
  `phq9_q3` tinyint NOT NULL DEFAULT 0,
  `phq9_q4` tinyint NOT NULL DEFAULT 0,
  `phq9_q5` tinyint NOT NULL DEFAULT 0,
  `phq9_q6` tinyint NOT NULL DEFAULT 0,
  `phq9_q7` tinyint NOT NULL DEFAULT 0,
  `phq9_q8` tinyint NOT NULL DEFAULT 0,
  `phq9_q9` tinyint NOT NULL DEFAULT 0,
  `score` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_7`(`user_id` ASC, `log_date` ASC) USING BTREE,
  INDEX `k_log_date_7`(`log_date` ASC) USING BTREE,
  CONSTRAINT `fk_user_id_7` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phq9
-- ----------------------------
INSERT INTO `phq9` VALUES (1, 3, '2020-11-12', 4, 1, 2, 2, 1, 1, 1, 1, 1, 14);
INSERT INTO `phq9` VALUES (9, 1, '2020-10-01', 2, 0, 3, 3, 2, 2, 2, 2, 2, 18);
INSERT INTO `phq9` VALUES (10, 1, '2020-10-15', 2, 2, 4, 3, 1, 2, 4, 3, 2, 25);
INSERT INTO `phq9` VALUES (11, 1, '2020-10-29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 9);
INSERT INTO `phq9` VALUES (12, 1, '2020-11-12', 2, 2, 3, 3, 4, 4, 1, 1, 2, 22);
INSERT INTO `phq9` VALUES (13, 1, '2020-12-10', 0, 0, 0, 0, 0, 0, 2, 1, 0, 3);
INSERT INTO `phq9` VALUES (14, 1, '2020-12-24', 3, 3, 2, 4, 4, 4, 3, 3, 4, 30);
INSERT INTO `phq9` VALUES (15, 1, '2020-12-31', 2, 2, 2, 4, 3, 2, 2, 2, 2, 21);
INSERT INTO `phq9` VALUES (16, 1, '2020-11-19', 0, 0, 0, 0, 0, 0, 2, 1, 0, 3);
INSERT INTO `phq9` VALUES (19, 1, '2020-11-26', 3, 3, 3, 3, 3, 3, 3, 3, 3, 27);
INSERT INTO `phq9` VALUES (20, 1, '2020-11-27', 3, 3, 3, 3, 3, 3, 3, 3, 3, 27);
INSERT INTO `phq9` VALUES (21, 1, '2020-11-28', 3, 0, 2, 1, 1, 1, 0, 1, 1, 0);
INSERT INTO `phq9` VALUES (22, 1, '2020-12-14', 0, 3, 2, 3, 1, 1, 2, 1, 1, 14);
INSERT INTO `phq9` VALUES (23, 1, '2020-12-19', 2, 1, 1, 2, 3, 0, 3, 1, 1, 14);
INSERT INTO `phq9` VALUES (24, 1, '2021-01-08', 3, 3, 3, 3, 3, 3, 3, 3, 3, 27);
INSERT INTO `phq9` VALUES (25, 1, '2021-01-20', 1, 1, 0, 1, 0, 0, 0, 0, 0, 3);
INSERT INTO `phq9` VALUES (26, 1, '2021-03-03', 3, 2, 3, 3, 2, 1, 3, 3, 1, 21);
INSERT INTO `phq9` VALUES (27, 3, '2021-03-04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `role` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户角色，‘user’，‘doctor’，‘admin’',
  `permission` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户权限（暂时用不到），‘normal’，‘vip’',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '这一部分设计是为了后端结合shiro框架，更好地进行权限控制' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 'user', 'normal');
INSERT INTO `role_permission` VALUES (2, 'doctor', 'vip');
INSERT INTO `role_permission` VALUES (3, 'admin', 'vip');

-- ----------------------------
-- Table structure for speak_anytime
-- ----------------------------
DROP TABLE IF EXISTS `speak_anytime`;
CREATE TABLE `speak_anytime`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `log_date` date NULL DEFAULT NULL COMMENT '记录日期',
  `log_time` time NULL DEFAULT NULL COMMENT '记录时间',
  `speech_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '上传地语音文件地链接地址',
  `inference` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `infer_cost` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_5`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id_5` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '随时说文件地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of speak_anytime
-- ----------------------------
INSERT INTO `speak_anytime` VALUES (111, 1, '2021-09-17', '18:41:48', '/audio/1_audio_20210403_7c671cea-3e3b-49bd-b28c-76d30526064f.mp3', 'Sad', 3607);
INSERT INTO `speak_anytime` VALUES (112, 1, '2021-09-17', '18:44:28', '/audio/1_audio_20210403_5c4139c5-858b-46a1-afbb-17aa6666c47b.mp3', 'Neutral', 3608);
INSERT INTO `speak_anytime` VALUES (113, 1, '2021-09-17', '18:44:51', '/audio/1_audio_20210403_2e58d45c-3569-428c-9b90-f6ce692c942b.mp3', 'Neutral', 3609);
INSERT INTO `speak_anytime` VALUES (114, 1, '2021-10-10', '00:17:23', '/audio/1_audio_20211010_cb870cf4-3ed9-4b5e-b32a-15dd1d773a54.mp3', 'Neutral', 11513);
INSERT INTO `speak_anytime` VALUES (115, 1, '2023-04-23', '13:03:45', '/audio/1_audio_20230423_6ab0b0c2-7449-4f13-8e39-e8c5f909da0e.mp3', NULL, NULL);
INSERT INTO `speak_anytime` VALUES (116, 1, '2023-04-23', '13:12:03', '/audio/1_audio_20230423_95cc51af-325f-4364-b17a-f211a0d99a18.mp3', NULL, NULL);
INSERT INTO `speak_anytime` VALUES (117, 1, '2023-04-23', '13:33:59', '/audio/1_audio_20230423_cd510b05-ffcc-457b-96a3-f3f8fa1ba679.mp3', NULL, NULL);
INSERT INTO `speak_anytime` VALUES (118, 1, '2023-04-23', '13:34:43', '/audio/1_audio_20230423_1d380d08-0fc5-42b8-8d7d-5bd0516b96c0.mp3', NULL, NULL);
INSERT INTO `speak_anytime` VALUES (119, 1, '2023-04-23', '13:35:27', '/audio/1_audio_20230423_75ce55c5-1738-405e-8314-886e0e2c7bbd.mp3', NULL, NULL);
INSERT INTO `speak_anytime` VALUES (120, 1, '2023-04-23', '13:36:06', '/audio/1_audio_20230423_a04bad84-468d-48b3-8dbf-04e8ed4f66a0.mp3', NULL, NULL);

-- ----------------------------
-- Table structure for user_health_info
-- ----------------------------
DROP TABLE IF EXISTS `user_health_info`;
CREATE TABLE `user_health_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id，外键',
  `sex` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `birth_date` date NOT NULL COMMENT '出生时间',
  `height` int NOT NULL DEFAULT 0 COMMENT '身高，单位：厘米（整数）',
  `weight` double(10, 1) NOT NULL DEFAULT 0.0 COMMENT '体重，单位：千克，保留小数点后一位',
  `doctor_id` bigint NOT NULL COMMENT '属于哪位医生',
  `depressed` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '（真实标签）抑郁程度标注、诊断结果（格式应为指定的几种级别，如高危、重度、中度和轻度）',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '（真实标签）备注信息（医生对病人的备注信息，格式无要求）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_id_2`(`user_id` ASC) USING BTREE,
  INDEX `fk_user_id_2`(`user_id` ASC) USING BTREE,
  INDEX `fk_doctor_id`(`doctor_id` ASC) USING BTREE,
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户健康信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_health_info
-- ----------------------------
INSERT INTO `user_health_info` VALUES (2, 3, '男', '2020-10-19', 170, 60.0, 1, '待标注', '待说明', '2020-10-26 16:44:21', '2020-12-14 22:48:08');
INSERT INTO `user_health_info` VALUES (3, 4, '女', '2020-10-19', 170, 60.0, 1, '待标注', '待说明', '2020-10-26 16:44:49', '2020-12-14 22:48:08');
INSERT INTO `user_health_info` VALUES (13, 1, '男', '2020-10-01', 175, 49.0, 1, '待标注1', '待说明', '2020-11-02 16:55:24', '2021-03-10 12:22:07');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '手机号码、唯一',
  `user_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名、唯一',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '数据库不存储原始密码，存MD5散列值，校验的时候判断的是密码散列值是否相同',
  `role` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：用户（0）、医生（1）、管理员（2）',
  `permission` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'normal' COMMENT '用户权限',
  `real_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `identity_number` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户身份证号，唯一',
  `city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `province` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `country` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `nwpu` tinyint NOT NULL DEFAULT 0 COMMENT '用于标注是否npwu用户，默认0（false），1（true）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `u_phone`(`phone` ASC) USING BTREE COMMENT '手机号码唯一',
  UNIQUE INDEX `u_user_name`(`user_name` ASC) USING BTREE COMMENT '用户名唯一',
  UNIQUE INDEX `u_identity_number`(`identity_number` ASC) USING BTREE COMMENT '身份证号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '17795831864', 'czw', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'czw22211', '350100200012011236', '福州市', '福建省', '中国', '/img/1_img_20201203_538911c2-937d-44f8-a4b4-53ec2bb29e83.jpg', 1, '2020-10-26 15:50:36', '2021-03-05 21:24:23');
INSERT INTO `user_info` VALUES (2, '17712341001', 'ljr', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'vip', '', NULL, '', '', '', '', 1, '2020-10-26 15:50:54', '2020-10-27 22:13:07');
INSERT INTO `user_info` VALUES (3, '17712341002', 'ls', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '小明434355', '123456200010101236', '西安市', '陕西省', '', '', 1, '2020-10-26 15:51:07', '2023-04-23 15:25:14');
INSERT INTO `user_info` VALUES (4, '17712341003', 'wzw', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 1, '2020-10-26 15:51:21', '2020-10-27 22:13:04');
INSERT INTO `user_info` VALUES (5, '17712341004', 'ywz', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 1, '2020-10-26 15:52:00', '2020-10-27 22:13:02');
INSERT INTO `user_info` VALUES (6, '17712341005', 'unknown', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-10-26 16:12:18', '2020-10-27 22:13:01');
INSERT INTO `user_info` VALUES (7, '17795831100', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '111', '123456200010101234', '西安市', '陕西省', '中国', '', 0, '2020-10-27 20:56:54', '2020-12-02 21:23:33');
INSERT INTO `user_info` VALUES (13, '17795831111', 'test2', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-10-27 22:15:26', NULL);
INSERT INTO `user_info` VALUES (17, '17712340002', '小明1号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '小明222222', NULL, '深圳市', '广东省', '中国', '', 0, '2020-11-02 00:52:25', '2020-12-05 11:35:56');
INSERT INTO `user_info` VALUES (18, '17712340003', '小明2号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 00:54:38', NULL);
INSERT INTO `user_info` VALUES (20, '17712340004', '小明3号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '小明222222', NULL, '西安市', '陕西省', '中国', '', 1, '2020-11-02 01:04:46', '2020-12-02 21:23:30');
INSERT INTO `user_info` VALUES (23, '17712340001', '小明4号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 01:12:58', NULL);
INSERT INTO `user_info` VALUES (29, '17712340006', '小明5号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 12:59:13', NULL);
INSERT INTO `user_info` VALUES (31, '17712340007', '小明6号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 13:20:37', NULL);
INSERT INTO `user_info` VALUES (32, '17712340008', '小明7号', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 13:27:39', NULL);
INSERT INTO `user_info` VALUES (34, '17700011234', 'ls2', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 15:27:43', NULL);
INSERT INTO `user_info` VALUES (35, '17700001239', '小茗1', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 21:05:28', NULL);
INSERT INTO `user_info` VALUES (36, '15902981070', '小杨1', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '西安市', '陕西省', '中国', '', 0, '2020-11-02 21:29:16', '2020-12-02 21:23:28');
INSERT INTO `user_info` VALUES (37, '15902981071', '小杨2', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-02 21:36:26', NULL);
INSERT INTO `user_info` VALUES (38, '15902981072', '小杨3', '202cb962ac59075b964b07152d234b70', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-03 11:22:36', NULL);
INSERT INTO `user_info` VALUES (39, '15902981073', '小杨4', '202cb962ac59075b964b07152d234b70', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-03 11:26:59', NULL);
INSERT INTO `user_info` VALUES (40, '15902981074', '小杨5', '202cb962ac59075b964b07152d234b70', 'user', 'normal', '', NULL, '', '', '', '', 0, '2020-11-03 11:28:06', NULL);
INSERT INTO `user_info` VALUES (41, '15902981078', '小杨9', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '小杨9', NULL, '', '', '', '', 0, '2020-11-04 21:20:40', NULL);
INSERT INTO `user_info` VALUES (45, '1779583184', 'cz0w', 'd41d8cd98f00b204e9800998ecf8427e', 'user', 'normal', '小明new', '123456200012340000', '青岛市', '山东省', '中国', '/img/1.jpg', 1, '2020-11-05 14:01:46', '2020-12-03 22:27:24');
INSERT INTO `user_info` VALUES (46, '1542326565', '123456zzz', '202cb962ac59075b964b07152d234b70', 'user', 'normal', 'zxc', NULL, '', '', '', '', 0, '2020-11-05 14:04:58', NULL);
INSERT INTO `user_info` VALUES (54, '15902981060', '小杨55', '202cb962ac59075b964b07152d234b70', 'user', 'normal', '小杨55', NULL, '', '', '', '', 0, '2020-11-07 11:22:49', NULL);
INSERT INTO `user_info` VALUES (55, '112233', '112233', '202cb962ac59075b964b07152d234b70', 'user', 'normal', '112233', NULL, '', '', '', '', 0, '2020-11-07 15:38:45', NULL);
INSERT INTO `user_info` VALUES (57, '17700001234', '小明12号', 'd41d8cd98f00b204e9800998ecf8427e', 'user', 'normal', '小明', '12345620001234xxxx', '西安', '陕西', '中国', '', 1, '2020-12-05 19:37:04', NULL);
INSERT INTO `user_info` VALUES (61, '17700001254', '小明121号', 'd41d8cd98f00b204e9800998ecf8427e', 'user', 'normal', '小明', '12345620001234xxx1', '西安', '陕西', '中国', '', 1, '2020-12-05 19:40:29', NULL);
INSERT INTO `user_info` VALUES (73, '17795831861', 'cs', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜233', NULL, '深圳市', '广东省', '中国', '', 1, '2020-12-05 20:12:44', NULL);
INSERT INTO `user_info` VALUES (74, '17795831862', 'cs1', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '深圳市', '广东省', '中国', '', 1, '2020-12-05 20:13:24', NULL);
INSERT INTO `user_info` VALUES (76, '17795831865', 'csss', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '深圳市', '广东省', '中国', '', 1, '2020-12-05 20:23:30', NULL);
INSERT INTO `user_info` VALUES (77, '17795831866', '新人1', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜234', '331022200011220124', '宁波市', '浙江省', '中国', '', 1, '2020-12-08 15:55:37', '2020-12-08 16:00:04');
INSERT INTO `user_info` VALUES (78, '17795831888', 'sdsd', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '深圳市', '广东省', '中国', '', 1, '2021-01-05 17:40:52', NULL);
INSERT INTO `user_info` VALUES (79, '17795831890', 'sd ', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '深圳市', '广东省', '中国', '', 1, '2021-01-05 17:59:19', NULL);
INSERT INTO `user_info` VALUES (82, '17795831855', 'czw453', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', '陈志炜', '32123120001332111x', '', '', '中国', '', 0, '2021-02-02 18:49:24', '2021-02-02 18:49:24');
INSERT INTO `user_info` VALUES (89, '12345678901', '123456a', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '哒哒哒', NULL, '', '', '', '', 0, '2021-03-03 10:32:18', NULL);
INSERT INTO `user_info` VALUES (100, '17795832233', 'czw4567', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'czw222', '321231200013324445', '', '', '中国', '', 0, '2021-03-03 14:06:09', '2021-03-03 14:06:09');
INSERT INTO `user_info` VALUES (101, '12345678990', 'czw12345', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'czw345', NULL, '', '', '', '', 0, '2021-03-03 14:12:55', NULL);
INSERT INTO `user_info` VALUES (102, '13669199394', 'ximin', 'c4ca4238a0b923820dcc509a6f75849b', 'doctor', 'vip', '席敏', '61012119860513048X', '', '', '中国', '', 0, '2021-03-04 13:58:19', '2021-03-04 13:58:19');
INSERT INTO `user_info` VALUES (109, '13092985566', '小明同学', '2572e70e5e2b2be77079bb5fe92d3c89', 'user', 'normal', '张明敏', NULL, '', '', '', '', 0, '2021-03-04 15:24:37', NULL);
INSERT INTO `user_info` VALUES (110, '18392968132', 'ZHSHY', 'e19ab8525628e2bc47647ec2ef80a310', 'user', 'normal', '周邵一', NULL, '', '', '', '', 0, '2021-03-04 15:31:02', NULL);
INSERT INTO `user_info` VALUES (111, '15291693269', '呜呼', '3c73098a4f30c42cf4883c3bc9906f7f', 'user', 'normal', '马卓恒', NULL, '', '', '', '', 0, '2021-03-04 15:31:51', NULL);
INSERT INTO `user_info` VALUES (112, '18161737393', '沙拉', '44217056f339bbcfccdf219bfb49e681', 'user', 'normal', '张薇', NULL, '', '', '', '', 0, '2021-03-04 15:42:38', NULL);
INSERT INTO `user_info` VALUES (113, '13201410622', '心有大爱', 'da5a68bf1f8cd67b905d3afe6c030ff8', 'user', 'normal', '熊子珺', NULL, '', '', '', '', 0, '2021-03-04 15:56:03', NULL);
INSERT INTO `user_info` VALUES (114, '13259798380', 'lunzi5', '7a05cabffc77755c212deabce3a116f9', 'user', 'normal', '曹琳琳', NULL, '', '', '', '', 0, '2021-03-04 16:01:01', NULL);
INSERT INTO `user_info` VALUES (115, '15009266745', 'pinglucy', '60c8def2970d5b86c435c938ef0185e5', 'user', 'normal', '李萍', NULL, '', '', '', '', 0, '2021-03-04 16:22:12', NULL);
INSERT INTO `user_info` VALUES (116, '18161967225', 'felsda', '02b3b466be5066864b1660ce4142ed0d', 'user', 'normal', '李娜', NULL, '', '', '', '', 0, '2021-03-04 16:37:06', NULL);
INSERT INTO `user_info` VALUES (117, '11111111113', 'lssuser', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'lishuai3', NULL, '深圳市', '广东省', '中国', '', 1, '2021-03-04 18:00:37', NULL);
INSERT INTO `user_info` VALUES (118, '15712876916', '我你他', '9cbfe75037506d9ae02e6dedcd27960e', 'user', 'normal', '姜圆', NULL, '', '', '', '', 0, '2021-03-04 18:29:27', NULL);
INSERT INTO `user_info` VALUES (119, '18700880790', 'Asbcn', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '姜雯', NULL, '', '', '', '', 0, '2021-03-04 18:31:35', NULL);
INSERT INTO `user_info` VALUES (120, '18996826033', 'tyz', 'f6d9a28f5d55eeccfe2805c5479ebcd7', 'user', 'normal', '谭钰蓁', NULL, '', '', '', '', 0, '2021-03-04 18:50:28', NULL);
INSERT INTO `user_info` VALUES (122, '15840871373', '早早', 'ccd91ff85c835f0388293501b15f8b51', 'user', 'normal', '李昀晓', NULL, '', '', '', '', 0, '2021-03-05 11:00:08', NULL);
INSERT INTO `user_info` VALUES (123, '17795830909', 'czw222333', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', '陈志炜', '321231200013323456', '', '', '中国', '', 0, '2021-03-05 21:14:02', '2021-03-05 21:14:02');
INSERT INTO `user_info` VALUES (124, '12345678906', 'czw44', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '', '', '', '', 0, '2021-03-05 21:20:27', NULL);
INSERT INTO `user_info` VALUES (125, '13572463572', 'chinajiulong', 'e02ac25cb11c90c57ff9abb632e51777', 'user', 'normal', '张九龙', NULL, '', '', '', '', 0, '2021-03-05 21:26:28', NULL);
INSERT INTO `user_info` VALUES (126, '18629261129', '杨少婷', 'a1b04cf930ff7dbb6c2b39f161a9740f', 'doctor', 'vip', '杨少婷', '142702198602141223', '', '', '中国', '', 0, '2021-03-09 11:15:49', '2021-03-09 11:15:50');
INSERT INTO `user_info` VALUES (127, '17795834071', 'czw的助理', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', '陈志炜', '321231200011302467', '', '', '中国', '', 0, '2021-03-09 21:39:25', '2021-03-09 21:40:54');
INSERT INTO `user_info` VALUES (128, '15991278237', 'LZY', 'acadb5fc1967ffae61ddf01059cef7a0', 'user', 'normal', '刘智勇', NULL, '', '', '', '', 0, '2021-03-10 12:06:24', NULL);
INSERT INTO `user_info` VALUES (129, '18821782702', 'cyy', '96afc27eaede61594c3a45bcdaa2b025', 'doctor', 'vip', '陈瑛琰', '411325199811140421', '', '', '中国', '', 0, '2021-03-15 15:13:22', '2021-03-15 15:13:22');
INSERT INTO `user_info` VALUES (130, '18392758151', '容儿', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '李锦瑢', NULL, '', '', '', '', 0, '2021-03-15 15:15:22', NULL);
INSERT INTO `user_info` VALUES (131, '18829566569', '快进', 'f25416ccb0b073a5ec556f322ebebbd1', 'user', 'normal', '二倍速', NULL, '', '', '', '', 0, '2021-03-15 15:40:36', NULL);
INSERT INTO `user_info` VALUES (132, '15289485878', '一筐鱼', 'c6b25ffbe8af1484bf8e21edffec35b4', 'user', 'normal', 'YKY', NULL, '', '', '', '', 0, '2021-03-15 15:42:12', NULL);
INSERT INTO `user_info` VALUES (134, '16627638737', 'ls207', 'ec8fb1c06db56b6096fb976696ba2e84', 'user', 'normal', '连胜', NULL, '', '', '', '', 0, '2021-03-15 15:42:25', NULL);
INSERT INTO `user_info` VALUES (135, '18220172625', '听心', '69adc1e107f7f7d035d7baf04342e1ca', 'user', 'normal', '听心', NULL, '', '', '', '', 0, '2021-03-15 15:43:46', NULL);
INSERT INTO `user_info` VALUES (136, '18309229066', '123', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', 'normal', '456', NULL, '', '', '', '', 0, '2021-03-15 15:44:15', NULL);
INSERT INTO `user_info` VALUES (137, '13331216970', '王子雯', 'e61e7de603852182385da5e907b4b232', 'user', 'normal', '王子雯', NULL, '', '', '', '', 0, '2021-03-15 15:44:26', NULL);
INSERT INTO `user_info` VALUES (138, '15091896802', '啊哈哈', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', 'normal', '口天日天', NULL, '', '', '', '', 0, '2021-03-15 15:44:37', NULL);
INSERT INTO `user_info` VALUES (139, '18156717537', 'Yan', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '李岩', NULL, '', '', '', '', 0, '2021-03-15 15:45:22', NULL);
INSERT INTO `user_info` VALUES (140, '17355902377', '279', '083e40bd5cd5960a090f54bc9c76420e', 'user', 'normal', '大怪兽', NULL, '', '', '', '', 0, '2021-03-15 15:54:40', NULL);
INSERT INTO `user_info` VALUES (141, '13681500820', 'lzz', '80ed248b2f5db24395d439aae97db4f6', 'user', 'normal', '刘转转', NULL, '', '', '', '', 0, '2021-03-15 16:13:32', NULL);
INSERT INTO `user_info` VALUES (142, '17795833017', '阿炜', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '陈志炜', NULL, '西安市', '陕西省', '中国', '', 0, '2021-03-15 16:36:33', '2021-03-15 17:22:03');
INSERT INTO `user_info` VALUES (143, '17691180548', '芜湖起飞', '2341837f8c4c4349a901a14a9ae50903', 'user', 'normal', '吴昊', NULL, '', '', '', '', 0, '2021-03-15 16:49:43', NULL);
INSERT INTO `user_info` VALUES (144, '15934814086', 'Crisyi', 'e511b21f59cdd268c8884e13d4328317', 'user', 'normal', '王逸轩', NULL, '', '', '', '', 0, '2021-03-15 17:13:33', NULL);
INSERT INTO `user_info` VALUES (145, '13468855422', 'freestylekite', '0b2952b0d93576dd24b49dcb66a9c7d8', 'user', 'normal', '小明', NULL, '', '', '', '', 0, '2021-03-15 17:18:29', NULL);
INSERT INTO `user_info` VALUES (147, '15511076465', '芜湖', '89d2c2b797f14138feaced91ce7b5084', 'user', 'normal', '啦啦啦', NULL, '', '', '', '', 0, '2021-03-16 09:27:21', NULL);
INSERT INTO `user_info` VALUES (152, '15902981075', '0316', '670b14728ad9902aecba32e22fa4f6bd', 'user', 'normal', '杨昭昭', NULL, '', '', '', '', 0, '2021-03-16 09:47:24', NULL);
INSERT INTO `user_info` VALUES (153, '17795832904', 'ythuo', '9fdd20fb76741ca60766186ee3d07d41', 'user', 'normal', 'ythuo', NULL, '', '', '', '', 0, '2021-03-16 16:12:05', NULL);
INSERT INTO `user_info` VALUES (154, '18291836062', 'happy', 'a7e7b60d01ac05c300bb1486617f529a', 'user', 'normal', 'jjj', NULL, '', '', '', '', 0, '2021-03-17 16:46:56', NULL);
INSERT INTO `user_info` VALUES (155, '15906552939', '史文倩', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '史文倩', NULL, '', '', '', '', 0, '2021-03-17 17:20:28', NULL);
INSERT INTO `user_info` VALUES (156, '15929446369', 'Rabbit', '202cb962ac59075b964b07152d234b70', 'user', 'normal', 'Rabbit', NULL, '', '', '', '', 0, '2021-03-17 17:49:31', NULL);
INSERT INTO `user_info` VALUES (157, '15902981077', '0317', '670b14728ad9902aecba32e22fa4f6bd', 'user', 'normal', '杨炜昭', NULL, '', '', '', '', 0, '2021-03-17 20:17:08', NULL);
INSERT INTO `user_info` VALUES (161, '15902981080', '0318', '670b14728ad9902aecba32e22fa4f6bd', 'user', 'normal', '杨炜昭', NULL, '', '', '', '', 0, '2021-03-17 20:20:24', NULL);
INSERT INTO `user_info` VALUES (162, '18829235733', '小荔枝', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '邓艺凡', NULL, '', '', '', '', 0, '2021-03-19 09:35:02', NULL);
INSERT INTO `user_info` VALUES (165, '18292496162', '何以解忧？唯有暴富！', '12e4aa81f517d5341a406d7a700bf16a', 'user', 'normal', '郑某人', NULL, '', '', '', '', 0, '2021-03-26 13:42:09', NULL);
INSERT INTO `user_info` VALUES (168, '19821664671', '一方通行', '2d82c6dd5b58f667a1ed2b6b8f33e7f0', 'user', 'normal', '杨光毅', NULL, '', '', '', '', 0, '2021-04-07 08:46:38', NULL);
INSERT INTO `user_info` VALUES (169, '18504319009', 'zjyhala', 'bda1bade30fb9773ddff595dc941771f', 'user', 'normal', 'zjy', NULL, '', '', '', '', 0, '2021-04-15 09:45:34', NULL);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `log_date` date NULL DEFAULT NULL,
  `log_time` time NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `inference` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `infer_cost` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_userid_video`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_userid_video` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (2, 1, '2021-03-05', '21:34:33', '/video/1_video_20210305_d28ff0f8-2470-48f3-b5c8-d58e2cabec65.mp4', NULL, NULL);
INSERT INTO `video` VALUES (3, 1, '2021-03-06', '11:02:35', '/video/1_video_20210306_fb9f4f63-0c15-4a96-9ebb-f7a27e5be380.mp4', NULL, NULL);
INSERT INTO `video` VALUES (4, 1, '2021-03-06', '11:03:39', '/video/1_video_20210306_d62ae321-5f2b-42b7-a872-622c8eb2864b.mp4', NULL, NULL);
INSERT INTO `video` VALUES (5, 1, '2021-03-06', '11:17:57', '/video/1_video_20210306_85ce3ab0-2f9d-4fe9-8886-4f262870e8ab.mp4', NULL, NULL);
INSERT INTO `video` VALUES (6, 1, '2021-03-06', '11:20:25', '/video/1_video_20210306_663b996c-3fbc-4706-9f69-428555e1b187.mp4', NULL, NULL);
INSERT INTO `video` VALUES (7, 1, '2021-03-06', '11:20:33', '/video/1_video_20210306_6d19e873-6fdb-4343-835d-fe94bcd98085.mp4', NULL, NULL);
INSERT INTO `video` VALUES (8, 1, '2021-03-06', '13:32:28', '/video/1_video_20210306_e4c212e0-81c7-4cfc-a0d8-fd9f50cebb8d.mp4', NULL, NULL);
INSERT INTO `video` VALUES (9, 1, '2021-03-08', '14:54:24', '/video/1_video_20210308_84dda521-3dbb-4dd9-9214-eaec00bcc8e4.mp4', NULL, NULL);
INSERT INTO `video` VALUES (10, 1, '2021-03-08', '15:45:44', '/video/1_video_20210308_38f88655-b7af-4082-b5ab-070a46c06b07.mp4', NULL, NULL);
INSERT INTO `video` VALUES (11, 1, '2021-03-08', '15:46:15', '/video/1_video_20210308_aff1ca32-fe7d-4324-bd30-08ce101e424c.mp4', NULL, NULL);
INSERT INTO `video` VALUES (12, 1, '2021-03-10', '17:09:04', '/video/1_video_20210310_d3a463f3-12e7-4dbd-9f14-4bb1fed8795a.webm', NULL, NULL);
INSERT INTO `video` VALUES (13, 1, '2021-03-11', '15:00:41', '/video/1_video_20210311_31097cc3-3038-4654-a526-299d78c46ea8.webm', NULL, NULL);
INSERT INTO `video` VALUES (14, 1, '2021-03-11', '15:35:23', '/video/1_video_20210311_514f6713-a304-4cf5-9dad-991904cd28c4.webm', NULL, NULL);
INSERT INTO `video` VALUES (15, 1, '2021-03-11', '15:50:28', '/video/1_video_20210311_9c3a9536-fee8-4575-aac7-e783ddbd6d8f.webm', NULL, NULL);
INSERT INTO `video` VALUES (16, 1, '2021-03-11', '15:50:51', '/video/1_video_20210311_1b8c04a5-c6f4-4d55-b085-d8a653173b63.webm', NULL, NULL);
INSERT INTO `video` VALUES (17, 1, '2021-09-17', '01:53:00', '/video/1_video_20210311_682c12c1-bf15-4b49-820c-f309816e04aa.webm', 'Angry', 3600);
INSERT INTO `video` VALUES (18, 1, '2021-09-17', '02:15:05', '/video/1_video_20210311_11e921f4-fb45-4898-ad68-6d1a1a34f06c.webm', 'Sad', 3601);
INSERT INTO `video` VALUES (19, 1, '2021-09-17', '03:15:24', '/video/1_video_20210311_5b5dedbe-7ffb-4d49-b894-6055b6caad99.webm', 'Happy', 3602);
INSERT INTO `video` VALUES (20, 1, '2021-09-17', '04:06:38', '/video/1_video_20210312_d24572af-3c11-48e1-a91e-ad51ca967e80.webm', 'Anxious', 3603);
INSERT INTO `video` VALUES (21, 154, '2021-03-17', '17:01:58', '/video/154_video_20210317_36c0a8d5-1dae-4bd7-97ba-dc5dd6a15e54.mp4', NULL, NULL);
INSERT INTO `video` VALUES (22, 1, '2021-09-17', '18:42:12', '/video/1_video_20210403_9084fe2a-0550-45d9-8f9d-4c92533f5226.mp4', 'Happy', 3604);
INSERT INTO `video` VALUES (23, 1, '2021-10-10', '00:06:39', '/video/1_video_20211010_eea3f59e-cfef-41b6-a471-a6f737c07ad4.mp4', 'Python 3.7.5', 6729);
INSERT INTO `video` VALUES (24, 1, '2021-10-10', '00:10:52', '/video/1_video_20211010_2b02c8e7-3887-49cf-be95-252e7321accf.mp4', NULL, NULL);
INSERT INTO `video` VALUES (25, 1, '2021-10-10', '00:12:19', '/video/1_video_20211010_c98659de-60dd-46f6-9fbc-e1f9721a7010.mp4', NULL, NULL);
INSERT INTO `video` VALUES (26, 1, '2021-10-10', '00:16:04', '/video/1_video_20211010_dfecc8ac-9c92-4af0-974d-8170216097aa.mp4', 'Neutral', 6603);

-- ----------------------------
-- Triggers structure for table answer
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_log_date_5`;
delimiter ;;
CREATE TRIGGER `tri_log_date_5` BEFORE INSERT ON `answer` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table everyday_status
-- ----------------------------
DROP TRIGGER IF EXISTS `log_date`;
delimiter ;;
CREATE TRIGGER `log_date` BEFORE INSERT ON `everyday_status` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table media
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_audio_datetime`;
delimiter ;;
CREATE TRIGGER `tri_audio_datetime` BEFORE INSERT ON `media` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table perceived_stress_scale
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_log_date_8`;
delimiter ;;
CREATE TRIGGER `tri_log_date_8` BEFORE INSERT ON `perceived_stress_scale` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table phq9
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_log_date_7`;
delimiter ;;
CREATE TRIGGER `tri_log_date_7` BEFORE INSERT ON `phq9` FOR EACH ROW BEGIN
	set new.log_date=CURRENT_DATE;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table speak_anytime
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_date_time_2`;
delimiter ;;
CREATE TRIGGER `tri_date_time_2` BEFORE INSERT ON `speak_anytime` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table video
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_date_time_11`;
delimiter ;;
CREATE TRIGGER `tri_date_time_11` BEFORE INSERT ON `video` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
