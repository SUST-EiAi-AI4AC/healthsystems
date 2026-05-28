/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : healthsystem

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 15/03/2024 22:56:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id，外键',
  `log_date` date NOT NULL COMMENT '填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。同时还可以在数据库层面完成限制：一个用户一天只有一条记录',
  `sports_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运动信息，如慢跑、走路、游泳等，这里不应限制运动方式数量，可以存储多种，每一种方式以字符‘|’隔开',
  `sports_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运动时间，单位分钟，与上面对应用‘|’隔开',
  `diet_info` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态',
  `medicine` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否按时服药：未知（0）（有些人可能不用服药），未按时服药（1），按时服药（2）',
  `sleep_info` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '入睡困难、睡不安、睡得多',
  `sleep_time` double(10, 1) NOT NULL DEFAULT 0.0 COMMENT '睡眠时间，单位分钟',
  `sleep_time_start` time(0) NULL DEFAULT NULL,
  `sleep_time_end` time(0) NULL DEFAULT NULL,
  `statement_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址',
  `add_timestamp_mils` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_logdate`(`user_id`, `log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 681 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日一次的填报记录（睡眠时间、运动时间、服药等信息）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ema_answer
-- ----------------------------
DROP TABLE IF EXISTS `ema_answer`;
CREATE TABLE `ema_answer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL COMMENT '记录日期',
  `log_time` time(0) NOT NULL COMMENT '记录时间',
  `mood` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'happy, sad, angry, fear/worrying, neutral, annoying,stress',
  `moodlevel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心境程度，a little bit, somewhat, very much, extremely',
  `stresslevel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压力程度，A little stressed, Definitely stressed, Stressed out, Feeling good, Feeling great\n\n',
  `speech_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上传地语音文件地链接地址',
  `pam` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'pam：前端的图片对应的情绪标签，通过用户选择图片，得到情绪标签，值是afraid、tense、excited等字符串，具体见《PAM.pptx》',
  `valence` tinyint(255) NULL DEFAULT NULL,
  `arousal` tinyint(255) NULL DEFAULT NULL,
  `pam_score` tinyint(255) NOT NULL COMMENT 'pam Score 1-16',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_log_date`(`log_date`) USING BTREE,
  INDEX `fk_user_id_4`(`user_id`) USING BTREE,
  CONSTRAINT `ema_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 630 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生态瞬间评估法（Ecological Momentary Assessment,简称 EMA ），包含情绪和压力信息以及pam信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invition_code
-- ----------------------------
DROP TABLE IF EXISTS `invition_code`;
CREATE TABLE `invition_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '医生或者管理员的id',
  `invition_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邀请码',
  `inviter` bigint(20) NULL DEFAULT NULL COMMENT '邀请者的id',
  `assistant_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '助理邀请码，用于邀请助理注册',
  `group_id` bigint(20) NOT NULL COMMENT '助理归属于的医生的id，可以一个小组的id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_invition_code`(`invition_code`) USING BTREE,
  INDEX `fk_userId_13`(`user_id`) USING BTREE,
  INDEX `fk_userId_13_2`(`inviter`) USING BTREE,
  CONSTRAINT `fk_userId_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId_13_2` FOREIGN KEY (`inviter`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用于管理后台管理端的用户，通过邀请码注册' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `log_date` date NOT NULL,
  `log_time` time(0) NOT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `infer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `infer_cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_audo_userid`(`user_id`) USING BTREE,
  CONSTRAINT `fk_depressionvideo_userid` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nwpu_user_info
-- ----------------------------
DROP TABLE IF EXISTS `nwpu_user_info`;
CREATE TABLE `nwpu_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nwpu_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户学号/工号',
  `college` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属学院/单位名字',
  `grade` smallint(6) NOT NULL DEFAULT 0 COMMENT '用户所在年级，入学/校年份',
  `type` enum('未知','本科生','硕士生','博士生','教职工') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未知' COMMENT '用户类型，未知（0），本科生（1），硕士（2），博士（3），教职工（4）',
  `add_timestamp_mils` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_nwpu_id`(`nwpu_id`) USING BTREE COMMENT '学号/工号唯一',
  UNIQUE INDEX `u_user_id_3`(`user_id`) USING BTREE,
  INDEX `fk_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '西北工业大学用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for perceived_stress_scale
-- ----------------------------
DROP TABLE IF EXISTS `perceived_stress_scale`;
CREATE TABLE `perceived_stress_scale`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `pss_q1` tinyint(255) NOT NULL DEFAULT 0 COMMENT '一些无法预期的事情发生而感到心烦意乱',
  `pss_q2` tinyint(255) NOT NULL DEFAULT 0 COMMENT '感觉无法控制自己生活中重要的事情',
  `pss_q3` tinyint(255) NOT NULL DEFAULT 0 COMMENT '感到紧张不安和压力',
  `pss_q4` tinyint(255) NOT NULL DEFAULT 0 COMMENT '成功地处理恼人的生活麻烦',
  `pss_q5` tinyint(255) NOT NULL DEFAULT 0 COMMENT '感到自己是有效地处理生活中所发生的重要改变',
  `pss_q6` tinyint(255) NOT NULL DEFAULT 0 COMMENT '对于有能力处理自己私人的问题感到很有信心 ',
  `pss_q7` tinyint(255) NOT NULL DEFAULT 0 COMMENT '感到事情顺心如意',
  `pss_q8` tinyint(255) NOT NULL DEFAULT 0 COMMENT '发现自己无法处理所有自己必须做的事情',
  `pss_q9` tinyint(255) NOT NULL DEFAULT 0 COMMENT '有办法控制生活中恼人的事情',
  `pss_q10` tinyint(255) NOT NULL DEFAULT 0 COMMENT '常觉得自己是驾驭事情的主人',
  `pss_q11` tinyint(255) NOT NULL DEFAULT 0 COMMENT '常生气，因为很多事情的发生是超出自己所能控制的',
  `pss_q12` tinyint(255) NOT NULL DEFAULT 0 COMMENT '.经常想到有些事情是自己必须完成的',
  `pss_q13` tinyint(255) NOT NULL DEFAULT 0 COMMENT '常能掌握时间安排方式',
  `pss_q14` tinyint(255) NOT NULL DEFAULT 0 COMMENT '常感到困难的事情堆积如山，而自己无法克服它们',
  `score` tinyint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_logdate_8`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_8`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_8` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '这份量表是在询问在最近一个月来，您个人的感受和想法，请您于每一个题项上作答时，去指出您感受或想到某一特定想法的频率。虽然有些问题看是相似，实则是有所差异，所以每一题均需作答。\r\n而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的压力知觉状况。而每一题项皆有下列五种选择。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for phq9
-- ----------------------------
DROP TABLE IF EXISTS `phq9`;
CREATE TABLE `phq9`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `phq9_q1` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q2` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q3` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q4` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q5` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q6` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q7` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q8` tinyint(255) NOT NULL DEFAULT 0,
  `phq9_q9` tinyint(255) NOT NULL DEFAULT 0,
  `score` tinyint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_7`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_7`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_7` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scl90
-- ----------------------------
DROP TABLE IF EXISTS `scl90`;
CREATE TABLE `scl90`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` tinyint(4) NOT NULL DEFAULT 0,
  `q4` tinyint(4) NOT NULL DEFAULT 0,
  `q5` tinyint(4) NOT NULL DEFAULT 0,
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` tinyint(4) NOT NULL DEFAULT 0,
  `q8` tinyint(4) NOT NULL DEFAULT 0,
  `q9` tinyint(4) NOT NULL DEFAULT 0,
  `q10` tinyint(4) NOT NULL DEFAULT 0,
  `q11` tinyint(4) NOT NULL DEFAULT 0,
  `q12` tinyint(4) NOT NULL DEFAULT 0,
  `q13` tinyint(4) NOT NULL DEFAULT 0,
  `q14` tinyint(4) NOT NULL DEFAULT 0,
  `q15` tinyint(4) NOT NULL DEFAULT 0,
  `q16` tinyint(4) NOT NULL DEFAULT 0,
  `q17` tinyint(4) NOT NULL DEFAULT 0,
  `q18` tinyint(4) NOT NULL DEFAULT 0,
  `q19` tinyint(4) NOT NULL DEFAULT 0,
  `q20` tinyint(4) NOT NULL DEFAULT 0,
  `q21` tinyint(4) NOT NULL DEFAULT 0,
  `q22` tinyint(4) NOT NULL DEFAULT 0,
  `q23` tinyint(4) NOT NULL DEFAULT 0,
  `q24` tinyint(4) NOT NULL DEFAULT 0,
  `q25` tinyint(4) NOT NULL DEFAULT 0,
  `q26` tinyint(4) NOT NULL DEFAULT 0,
  `q27` tinyint(4) NOT NULL DEFAULT 0,
  `q28` tinyint(4) NOT NULL DEFAULT 0,
  `q29` tinyint(4) NOT NULL DEFAULT 0,
  `q30` tinyint(4) NOT NULL DEFAULT 0,
  `q31` tinyint(4) NOT NULL DEFAULT 0,
  `q32` tinyint(4) NOT NULL DEFAULT 0,
  `q33` tinyint(4) NOT NULL DEFAULT 0,
  `q34` tinyint(4) NOT NULL DEFAULT 0,
  `q35` tinyint(4) NOT NULL DEFAULT 0,
  `q36` tinyint(4) NOT NULL DEFAULT 0,
  `q37` tinyint(4) NOT NULL DEFAULT 0,
  `q38` tinyint(4) NOT NULL DEFAULT 0,
  `q39` tinyint(4) NOT NULL DEFAULT 0,
  `q40` tinyint(4) NOT NULL DEFAULT 0,
  `q41` tinyint(4) NOT NULL DEFAULT 0,
  `q42` tinyint(4) NOT NULL DEFAULT 0,
  `q43` tinyint(4) NOT NULL DEFAULT 0,
  `q44` tinyint(4) NOT NULL DEFAULT 0,
  `q45` tinyint(4) NOT NULL DEFAULT 0,
  `q46` tinyint(4) NOT NULL DEFAULT 0,
  `q47` tinyint(4) NOT NULL DEFAULT 0,
  `q48` tinyint(4) NOT NULL DEFAULT 0,
  `q49` tinyint(4) NOT NULL DEFAULT 0,
  `q50` tinyint(4) NOT NULL DEFAULT 0,
  `q51` tinyint(4) NOT NULL DEFAULT 0,
  `q52` tinyint(4) NOT NULL DEFAULT 0,
  `q53` tinyint(4) NOT NULL DEFAULT 0,
  `q54` tinyint(4) NOT NULL DEFAULT 0,
  `q55` tinyint(4) NOT NULL DEFAULT 0,
  `q56` tinyint(4) NOT NULL DEFAULT 0,
  `q57` tinyint(4) NOT NULL DEFAULT 0,
  `q58` tinyint(4) NOT NULL DEFAULT 0,
  `q59` tinyint(4) NOT NULL DEFAULT 0,
  `q60` tinyint(4) NOT NULL DEFAULT 0,
  `q61` tinyint(4) NOT NULL DEFAULT 0,
  `q62` tinyint(4) NOT NULL DEFAULT 0,
  `q63` tinyint(4) NOT NULL DEFAULT 0,
  `q64` tinyint(4) NOT NULL DEFAULT 0,
  `q65` tinyint(4) NOT NULL DEFAULT 0,
  `q66` tinyint(4) NOT NULL DEFAULT 0,
  `q67` tinyint(4) NOT NULL DEFAULT 0,
  `q68` tinyint(4) NOT NULL DEFAULT 0,
  `q69` tinyint(4) NOT NULL DEFAULT 0,
  `q70` tinyint(4) NOT NULL DEFAULT 0,
  `q71` tinyint(4) NOT NULL DEFAULT 0,
  `q72` tinyint(4) NOT NULL DEFAULT 0,
  `q73` tinyint(4) NOT NULL DEFAULT 0,
  `q74` tinyint(4) NOT NULL DEFAULT 0,
  `q75` tinyint(4) NOT NULL DEFAULT 0,
  `q76` tinyint(4) NOT NULL DEFAULT 0,
  `q77` tinyint(4) NOT NULL DEFAULT 0,
  `q78` tinyint(4) NOT NULL DEFAULT 0,
  `q79` tinyint(4) NOT NULL DEFAULT 0,
  `q80` tinyint(4) NOT NULL DEFAULT 0,
  `q81` tinyint(4) NOT NULL DEFAULT 0,
  `q82` tinyint(4) NOT NULL DEFAULT 0,
  `q83` tinyint(4) NOT NULL DEFAULT 0,
  `q84` tinyint(4) NOT NULL DEFAULT 0,
  `q85` tinyint(4) NOT NULL DEFAULT 0,
  `q86` tinyint(4) NOT NULL DEFAULT 0,
  `q87` tinyint(4) NOT NULL DEFAULT 0,
  `q88` tinyint(4) NOT NULL DEFAULT 0,
  `q89` tinyint(4) NOT NULL DEFAULT 0,
  `q90` tinyint(4) NOT NULL DEFAULT 0,
  `score` smallint(6) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_scl90`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_scl90`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_scl90` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SCL-90 症状自评量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipaq
-- ----------------------------
DROP TABLE IF EXISTS `ipaq`;
CREATE TABLE `ipaq`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1_days` tinyint(4) NOT NULL DEFAULT 0,
  `q1_hours` smallint(6) NOT NULL DEFAULT 0,
  `q1_minutes` smallint(6) NOT NULL DEFAULT 0,
  `q2_days` tinyint(4) NOT NULL DEFAULT 0,
  `q2_hours` smallint(6) NOT NULL DEFAULT 0,
  `q2_minutes` smallint(6) NOT NULL DEFAULT 0,
  `q3_days` tinyint(4) NOT NULL DEFAULT 0,
  `q3_hours` smallint(6) NOT NULL DEFAULT 0,
  `q3_minutes` smallint(6) NOT NULL DEFAULT 0,
  `q4_hours` smallint(6) NOT NULL DEFAULT 0,
  `q4_minutes` smallint(6) NOT NULL DEFAULT 0,
  `q5_hours` smallint(6) NOT NULL DEFAULT 0,
  `q5_minutes` smallint(6) NOT NULL DEFAULT 0,
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_ipaq`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_ipaq`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_ipaq` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'IPAQ 国际体力活动量表（短卷）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pars3
-- ----------------------------
DROP TABLE IF EXISTS `pars3`;
CREATE TABLE `pars3`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` tinyint(4) NOT NULL DEFAULT 0,
  `q4_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `q5` tinyint(4) NOT NULL DEFAULT 0,
  `score` smallint(6) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_pars3`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_pars3`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_pars3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PARS-3 体育活动等级量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for maia2
-- ----------------------------
DROP TABLE IF EXISTS `maia2`;
CREATE TABLE `maia2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` tinyint(4) NOT NULL DEFAULT 0,
  `q4` tinyint(4) NOT NULL DEFAULT 0,
  `q5` tinyint(4) NOT NULL DEFAULT 0,
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` tinyint(4) NOT NULL DEFAULT 0,
  `q8` tinyint(4) NOT NULL DEFAULT 0,
  `q9` tinyint(4) NOT NULL DEFAULT 0,
  `q10` tinyint(4) NOT NULL DEFAULT 0,
  `q11` tinyint(4) NOT NULL DEFAULT 0,
  `q12` tinyint(4) NOT NULL DEFAULT 0,
  `q13` tinyint(4) NOT NULL DEFAULT 0,
  `q14` tinyint(4) NOT NULL DEFAULT 0,
  `q15` tinyint(4) NOT NULL DEFAULT 0,
  `q16` tinyint(4) NOT NULL DEFAULT 0,
  `q17` tinyint(4) NOT NULL DEFAULT 0,
  `q18` tinyint(4) NOT NULL DEFAULT 0,
  `q19` tinyint(4) NOT NULL DEFAULT 0,
  `q20` tinyint(4) NOT NULL DEFAULT 0,
  `q21` tinyint(4) NOT NULL DEFAULT 0,
  `q22` tinyint(4) NOT NULL DEFAULT 0,
  `q23` tinyint(4) NOT NULL DEFAULT 0,
  `q24` tinyint(4) NOT NULL DEFAULT 0,
  `q25` tinyint(4) NOT NULL DEFAULT 0,
  `q26` tinyint(4) NOT NULL DEFAULT 0,
  `q27` tinyint(4) NOT NULL DEFAULT 0,
  `q28` tinyint(4) NOT NULL DEFAULT 0,
  `q29` tinyint(4) NOT NULL DEFAULT 0,
  `q30` tinyint(4) NOT NULL DEFAULT 0,
  `q31` tinyint(4) NOT NULL DEFAULT 0,
  `q32` tinyint(4) NOT NULL DEFAULT 0,
  `q33` tinyint(4) NOT NULL DEFAULT 0,
  `q34` tinyint(4) NOT NULL DEFAULT 0,
  `q35` tinyint(4) NOT NULL DEFAULT 0,
  `q36` tinyint(4) NOT NULL DEFAULT 0,
  `q37` tinyint(4) NOT NULL DEFAULT 0,
  `score` smallint(6) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_maia2`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_maia2`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_maia2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'MAIA-2 多维度内感受意识量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cdrisc
-- ----------------------------
DROP TABLE IF EXISTS `cdrisc`;
CREATE TABLE `cdrisc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` tinyint(4) NOT NULL DEFAULT 0,
  `q4` tinyint(4) NOT NULL DEFAULT 0,
  `q5` tinyint(4) NOT NULL DEFAULT 0,
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` tinyint(4) NOT NULL DEFAULT 0,
  `q8` tinyint(4) NOT NULL DEFAULT 0,
  `q9` tinyint(4) NOT NULL DEFAULT 0,
  `q10` tinyint(4) NOT NULL DEFAULT 0,
  `q11` tinyint(4) NOT NULL DEFAULT 0,
  `q12` tinyint(4) NOT NULL DEFAULT 0,
  `q13` tinyint(4) NOT NULL DEFAULT 0,
  `q14` tinyint(4) NOT NULL DEFAULT 0,
  `q15` tinyint(4) NOT NULL DEFAULT 0,
  `q16` tinyint(4) NOT NULL DEFAULT 0,
  `q17` tinyint(4) NOT NULL DEFAULT 0,
  `q18` tinyint(4) NOT NULL DEFAULT 0,
  `q19` tinyint(4) NOT NULL DEFAULT 0,
  `q20` tinyint(4) NOT NULL DEFAULT 0,
  `q21` tinyint(4) NOT NULL DEFAULT 0,
  `q22` tinyint(4) NOT NULL DEFAULT 0,
  `q23` tinyint(4) NOT NULL DEFAULT 0,
  `q24` tinyint(4) NOT NULL DEFAULT 0,
  `q25` tinyint(4) NOT NULL DEFAULT 0,
  `score` smallint(6) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_cdrisc`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_cdrisc`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_cdrisc` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CD-RISC 心理弹性量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ocean
-- ----------------------------
DROP TABLE IF EXISTS `ocean`;
CREATE TABLE `ocean`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(4) NOT NULL DEFAULT 0,
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` tinyint(4) NOT NULL DEFAULT 0,
  `q4` tinyint(4) NOT NULL DEFAULT 0,
  `q5` tinyint(4) NOT NULL DEFAULT 0,
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` tinyint(4) NOT NULL DEFAULT 0,
  `q8` tinyint(4) NOT NULL DEFAULT 0,
  `q9` tinyint(4) NOT NULL DEFAULT 0,
  `q10` tinyint(4) NOT NULL DEFAULT 0,
  `q11` tinyint(4) NOT NULL DEFAULT 0,
  `q12` tinyint(4) NOT NULL DEFAULT 0,
  `q13` tinyint(4) NOT NULL DEFAULT 0,
  `q14` tinyint(4) NOT NULL DEFAULT 0,
  `q15` tinyint(4) NOT NULL DEFAULT 0,
  `q16` tinyint(4) NOT NULL DEFAULT 0,
  `q17` tinyint(4) NOT NULL DEFAULT 0,
  `q18` tinyint(4) NOT NULL DEFAULT 0,
  `q19` tinyint(4) NOT NULL DEFAULT 0,
  `q20` tinyint(4) NOT NULL DEFAULT 0,
  `q21` tinyint(4) NOT NULL DEFAULT 0,
  `q22` tinyint(4) NOT NULL DEFAULT 0,
  `q23` tinyint(4) NOT NULL DEFAULT 0,
  `q24` tinyint(4) NOT NULL DEFAULT 0,
  `q25` tinyint(4) NOT NULL DEFAULT 0,
  `q26` tinyint(4) NOT NULL DEFAULT 0,
  `q27` tinyint(4) NOT NULL DEFAULT 0,
  `q28` tinyint(4) NOT NULL DEFAULT 0,
  `q29` tinyint(4) NOT NULL DEFAULT 0,
  `q30` tinyint(4) NOT NULL DEFAULT 0,
  `q31` tinyint(4) NOT NULL DEFAULT 0,
  `q32` tinyint(4) NOT NULL DEFAULT 0,
  `q33` tinyint(4) NOT NULL DEFAULT 0,
  `q34` tinyint(4) NOT NULL DEFAULT 0,
  `q35` tinyint(4) NOT NULL DEFAULT 0,
  `q36` tinyint(4) NOT NULL DEFAULT 0,
  `q37` tinyint(4) NOT NULL DEFAULT 0,
  `q38` tinyint(4) NOT NULL DEFAULT 0,
  `q39` tinyint(4) NOT NULL DEFAULT 0,
  `q40` tinyint(4) NOT NULL DEFAULT 0,
  `q41` tinyint(4) NOT NULL DEFAULT 0,
  `q42` tinyint(4) NOT NULL DEFAULT 0,
  `q43` tinyint(4) NOT NULL DEFAULT 0,
  `q44` tinyint(4) NOT NULL DEFAULT 0,
  `q45` tinyint(4) NOT NULL DEFAULT 0,
  `q46` tinyint(4) NOT NULL DEFAULT 0,
  `q47` tinyint(4) NOT NULL DEFAULT 0,
  `q48` tinyint(4) NOT NULL DEFAULT 0,
  `q49` tinyint(4) NOT NULL DEFAULT 0,
  `q50` tinyint(4) NOT NULL DEFAULT 0,
  `q51` tinyint(4) NOT NULL DEFAULT 0,
  `q52` tinyint(4) NOT NULL DEFAULT 0,
  `q53` tinyint(4) NOT NULL DEFAULT 0,
  `q54` tinyint(4) NOT NULL DEFAULT 0,
  `q55` tinyint(4) NOT NULL DEFAULT 0,
  `q56` tinyint(4) NOT NULL DEFAULT 0,
  `q57` tinyint(4) NOT NULL DEFAULT 0,
  `q58` tinyint(4) NOT NULL DEFAULT 0,
  `q59` tinyint(4) NOT NULL DEFAULT 0,
  `q60` tinyint(4) NOT NULL DEFAULT 0,
  `score` smallint(6) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_ocean`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_ocean`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_ocean` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'OCEAN 大五人格量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for psqi
-- ----------------------------
DROP TABLE IF EXISTS `psqi`;
CREATE TABLE `psqi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `q2` tinyint(4) NOT NULL DEFAULT 0,
  `q3` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `q4` tinyint(4) NOT NULL DEFAULT 0,
  `q5a` tinyint(4) NOT NULL DEFAULT 0,
  `q5b` tinyint(4) NOT NULL DEFAULT 0,
  `q5c` tinyint(4) NOT NULL DEFAULT 0,
  `q5d` tinyint(4) NOT NULL DEFAULT 0,
  `q5e` tinyint(4) NOT NULL DEFAULT 0,
  `q5f` tinyint(4) NOT NULL DEFAULT 0,
  `q5g` tinyint(4) NOT NULL DEFAULT 0,
  `q5h` tinyint(4) NOT NULL DEFAULT 0,
  `q5i` tinyint(4) NOT NULL DEFAULT 0,
  `q5j` tinyint(4) NOT NULL DEFAULT 0,
  `q5j_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `q6` tinyint(4) NOT NULL DEFAULT 0,
  `q7` tinyint(4) NOT NULL DEFAULT 0,
  `q8` tinyint(4) NOT NULL DEFAULT 0,
  `q9` tinyint(4) NOT NULL DEFAULT 0,
  `score` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_psqi`(`user_id`, `log_date`) USING BTREE,
  INDEX `k_log_date_psqi`(`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_psqi` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PSQI 匹兹堡睡眠质量指数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色，‘user’，‘doctor’，‘admin’',
  `permission` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户权限（暂时用不到），‘normal’，‘vip’',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '这一部分设计是为了后端结合shiro框架，更好地进行权限控制' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speak_anytime
-- ----------------------------
DROP TABLE IF EXISTS `speak_anytime`;
CREATE TABLE `speak_anytime`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `log_date` date NULL DEFAULT NULL COMMENT '记录日期',
  `log_time` time(0) NULL DEFAULT NULL COMMENT '记录时间',
  `speech_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上传地语音文件地链接地址',
  `inference` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `infer_cost` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_5`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id_5` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '随时说文件地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_health_info
-- ----------------------------
DROP TABLE IF EXISTS `user_health_info`;
CREATE TABLE `user_health_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id，外键',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `birth_date` date NOT NULL COMMENT '出生时间',
  `height` int(11) NOT NULL DEFAULT 0 COMMENT '身高，单位：厘米（整数）',
  `weight` double(10, 1) NOT NULL DEFAULT 0.0 COMMENT '体重，单位：千克，保留小数点后一位',
  `doctor_id` bigint(20) NOT NULL COMMENT '属于哪位医生',
  `depressed` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '（真实标签）抑郁程度标注、诊断结果（格式应为指定的几种级别，如高危、重度、中度和轻度）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '（真实标签）备注信息（医生对病人的备注信息，格式无要求）',
  `add_timestamp_mils` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_id_2`(`user_id`) USING BTREE,
  INDEX `fk_user_id_2`(`user_id`) USING BTREE,
  INDEX `fk_doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户健康信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码、唯一',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名、唯一',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库不存储原始密码，存MD5散列值，校验的时候判断的是密码散列值是否相同',
  `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：用户（0）、医生（1）、管理员（2）',
  `permission` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '用户权限',
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `identity_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户身份证号，唯一',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `nwpu` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用于标注是否npwu用户，默认0（false），1（true）',
  `add_timestamp_mils` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间戳',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `u_phone`(`phone`) USING BTREE COMMENT '手机号码唯一',
  UNIQUE INDEX `u_user_name`(`user_name`) USING BTREE COMMENT '用户名唯一',
  UNIQUE INDEX `u_identity_number`(`identity_number`) USING BTREE COMMENT '身份证号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `log_date` date NULL DEFAULT NULL,
  `log_time` time(0) NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `inference` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `infer_cost` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_userid_video`(`user_id`) USING BTREE,
  CONSTRAINT `fk_userid_video` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
-- Triggers structure for table ema_answer
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_log_date_3`;
delimiter ;;
CREATE TRIGGER `tri_log_date_3` BEFORE INSERT ON `ema_answer` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
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
