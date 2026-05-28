/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3306
 Source Schema         : healthsystem

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 23/07/2025 14:40:25
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
  `diet_info` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态',
  `statement_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址',
  `add_timestamp_mils` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `time_management` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `social_expression` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `study_or_work_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `study_or_work_state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `free` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `free_symptom` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `yesterday_night` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `yesterday_end_feel` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `communicate_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone_play_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `weakup_status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_user_logdate`(`user_id` ASC, `log_date` ASC) USING BTREE,
  CONSTRAINT `fk_user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 698 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '每日一次的填报记录（睡眠时间、运动时间、服药等信息）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (689, 171, '2024-06-12', '按时吃饭，食欲正常', NULL, '2024-06-12 20:02:04', '没有制定计划，随心情行动', '积极参与交流，享受互动时光', '1-3小时', '大多数时候能集中注意力，但不够高效', '休息或放松，做一些简单的娱乐', '都没有', '听音乐或看电影', '感到充实和满足', '30分钟-1小时', '30分钟-1小时', '伸个懒腰，稍作休息后起床');
INSERT INTO `answer` VALUES (690, 171, '2024-06-13', '偶尔错过一餐，但总体还好', NULL, '2024-06-13 19:51:03', '没有制定计划，随心情行动', '较少参与交流活动，更喜欢独处', '3-5小时', '感觉很疲惫，不想工作或学习', '休息或放松，做一些简单的娱乐', '都没有', '玩电子游戏或上网冲浪', '感到一般，但还可以', '少于30分钟', '1-1.5小时', '伸个懒腰，稍作休息后起床');
INSERT INTO `answer` VALUES (691, 171, '2024-06-15', '按时吃饭，食欲正常', NULL, '2024-06-15 00:01:59', '有一定的计划但改变了', '较少参与交流活动，更喜欢独处', '1-3小时', '难以集中注意力，经常分心', '休息或放松，做一些简单的娱乐', '都没有', '玩电子游戏或上网冲浪', '感到充实和满足', '超过2小时', '1-1.5小时', '继续躺在床上，查看手机或社交媒体');
INSERT INTO `answer` VALUES (693, 170, '2024-06-16', '经常忘记吃饭或吃得很少', NULL, '2024-06-16 21:54:56', '不知道该如何安排时间', '积极参与交流，享受互动时光', '3-5小时', '大多数时候能集中注意力，但不够高效', '几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧', '极度心神不宁，焦虑不安', '玩电子游戏或上网冲浪', '感到些许沮丧或失望', '1.5-2小时', '30分钟-1小时', '继续躺在床上，查看手机或社交媒体');
INSERT INTO `answer` VALUES (694, 171, '2024-06-20', '按时吃饭，食欲正常', NULL, '2024-06-20 20:16:10', '制定了清晰的时间表并按时执行', '积极参与交流，享受互动时光', '3-5小时', '大多数时候能集中注意力，但不够高效', '休息或放松，做一些简单的娱乐', '都没有', '玩电子游戏或上网冲浪', '感到充实和满足', '超过2小时', '30分钟-1小时', '立刻起床');
INSERT INTO `answer` VALUES (695, 179, '2024-06-21', '按时吃饭，食欲正常', NULL, '2024-06-21 13:16:33', '没有制定计划，随心情行动', '积极参与交流，享受互动时光', '5-8小时', '感觉很疲惫，不想工作或学习', '休息或放松，做一些简单的娱乐', '有些心神不宁', '玩电子游戏或上网冲浪', '感到些许沮丧或失望', '超过2小时', '1-1.5小时', '伸个懒腰，稍作休息后起床');
INSERT INTO `answer` VALUES (696, 174, '2024-06-21', '按时吃饭，食欲正常', NULL, '2024-06-21 13:51:29', '没有制定计划，随心情行动', '积极参与交流，享受互动时光', '超过8小时', '大多数时候能集中注意力，但不够高效', '休息或放松，做一些简单的娱乐', '都没有', '听音乐或看电影', '感到一般，但还可以', '超过2小时', '超过2小时', '继续躺在床上，查看手机或社交媒体');
INSERT INTO `answer` VALUES (697, 171, '2024-06-23', '按时吃饭，食欲正常', NULL, '2024-06-23 15:31:00', '制定了清晰的时间表并按时执行', '积极参与交流，享受互动时光', '1-3小时', '持续专注且高效', '休息或放松，做一些简单的娱乐', '都没有', '与家人或朋友聊天', '感到充实和满足', '超过2小时', '超过2小时', '继续躺在床上，多睡一会儿');
INSERT INTO `answer` VALUES (698, 171, '2025-07-22', '按时吃饭，食欲正常', NULL, '2025-07-22 18:11:53', '制定了清晰的时间表并按时执行', '积极参与交流，享受互动时光', '0', '未工作或学习', '参加喜欢的社交活动', '都没有', '阅读书籍或杂志', '感到充实和满足', '少于30分钟', '少于30分钟', '立刻起床');
INSERT INTO `answer` VALUES (699, 174, '2025-07-22', '完全没有食欲', NULL, '2025-07-22 21:03:17', '不知道该如何安排时间', '对交流行为感到抵触，不愿与人接触', '5-8小时', '难以集中注意力，经常分心', '几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧', '极度心神不宁，焦虑不安', '感到焦虑或不安，难以放松', '感到有点绝望，对明天毫无期待', '超过2小时', '超过2小时', '继续躺在床上，多睡一会儿');
INSERT INTO `answer` VALUES (700, 179, '2025-07-22', '按时吃饭，食欲正常', NULL, '2025-07-22 21:16:17', '制定了清晰的时间表并按时执行', '积极参与交流，享受互动时光', '少于1小时', '持续专注且高效', '参加喜欢的社交活动', '都没有', '阅读书籍或杂志', '感到充实和满足', '少于30分钟', '少于30分钟', '立刻起床');

-- ----------------------------
-- Table structure for basic_info
-- ----------------------------
DROP TABLE IF EXISTS `basic_info`;
CREATE TABLE `basic_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id，外键',
  `log_date` date NOT NULL,
  `sex` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '男',
  `phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birth_date` date NOT NULL,
  `culture` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '本科',
  `is_single_parent` enum('是','否') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '否',
  `is_abandon` enum('是','否') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '否',
  `residential` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `marital` enum('未婚','已婚','离异','再婚','丧偶') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '未婚',
  `trauma` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trauma_time` enum('童年期','青少年','成年后') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `relative_suicide` enum('无','有') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '无',
  `mental_illness` enum('无','有') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '无',
  `family_mental_history` enum('无','有') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '无',
  `close_rel` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resident` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `neighbor_rel` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `colleague_rel` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `favour` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `comfort` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `share` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `seek_help` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `group_activity` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dating_engaged` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dating_lose` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parents_conflict` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `family_finance_dif` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `debt` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `family_ser_inj` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `family_die` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ser_inj` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `unemployed` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `work_pressure` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `poor_mark` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `roommates_dis` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `life_law_change` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `friend_ser_inj` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `friend_die` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `misunderstood` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `stolen` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accidental_shock` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic_info
-- ----------------------------
INSERT INTO `basic_info` VALUES (3, 171, '2024-06-23', '女', '13785369485', '2001-07-01', '硕士研究生', '否', '否', '集体宿舍', '未婚', '灾难', '青少年', '无', '无', '无', '3-5个', '和同学、同事或朋友住在一起', '有些邻居很关心您', '遇到困难可能稍微关心', '朋友', '朋友', '只向关系即为密切的1-2人倾诉', '很少请求别人帮助', '偶尔参加', '一年内,好事,无影响,一年以上', '一年内,坏事,轻度,三月内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '长期性,好事,无影响,一年以上', '长期性,坏事,中度,一年以上', '未发生,null,null,null', '未发生,null,null,null', '长期性,坏事,中度,一年以上', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');
INSERT INTO `basic_info` VALUES (4, 174, '2024-06-21', '女', '13571121019', '2001-08-01', '硕士研究生', '否', '否', '集体宿舍', '未婚', '灾难', NULL, '无', '无', '无', '3-5个', '和同学、同事或朋友住在一起', '遇到困难可能稍微关心', '遇到困难可能稍微关心', '其他家人', '朋友', '只向关系即为密切的1-2人倾诉', '很少请求别人帮助', '从不参加', '一年前,好事,轻度,三月内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');
INSERT INTO `basic_info` VALUES (5, 170, '2024-06-23', '女', '1112233', '2024-06-01', '硕士研究生', '是', '否', '独居', '丧偶', '灾难', '成年后', '有', '有', '无', '3-5个', '住处经常变动，多数时间和陌生人住在一起', '大多数邻居都很关心您', '相互之间从不关心，只是点头之交', '工作单位', '其他家人', '从不向任何人倾诉', '有时请求别人帮助', '偶尔参加', '未发生,null,null,null', '一年前,好事,无影响,半年内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');

-- ----------------------------
-- Table structure for ema_answer
-- ----------------------------
DROP TABLE IF EXISTS `ema_answer`;
CREATE TABLE `ema_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL COMMENT '记录日期',
  `log_time` time NOT NULL COMMENT '记录时间',
  `mood` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'happy, sad, angry, fear/worrying, neutral, annoying,stress',
  `moodlevel` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '心境程度，a little bit, somewhat, very much, extremely',
  `stresslevel` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '压力程度，A little stressed, Definitely stressed, Stressed out, Feeling good, Feeling great\n\n',
  `speech_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '上传地语音文件地链接地址',
  `pam` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'pam：前端的图片对应的情绪标签，通过用户选择图片，得到情绪标签，值是afraid、tense、excited等字符串，具体见《PAM.pptx》',
  `valence` tinyint NULL DEFAULT NULL,
  `arousal` tinyint NULL DEFAULT NULL,
  `pam_score` tinyint NOT NULL COMMENT 'pam Score 1-16',
  `img_datas` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `img_selected` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_log_date`(`log_date` ASC) USING BTREE,
  INDEX `fk_user_id_4`(`user_id` ASC) USING BTREE,
  CONSTRAINT `ema_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 649 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '生态瞬间评估法（Ecological Momentary Assessment,简称 EMA ），包含情绪和压力信息以及pam信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ema_answer
-- ----------------------------
INSERT INTO `ema_answer` VALUES (634, 171, '2024-06-12', '20:03:12', '高兴', '中等程度', '没有压力', '', 'happy', 1, 1, 13, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_2.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_1.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"}');
INSERT INTO `ema_answer` VALUES (635, 171, '2024-06-13', '14:00:41', '中性', '中等程度', '没有压力', '', 'satisfied', 2, -1, 12, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_1.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"}');
INSERT INTO `ema_answer` VALUES (636, 171, '2024-06-13', '19:48:15', '中性', '中等程度', '有一点压力', '', 'satisfied', 2, -1, 12, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_2.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"}');
INSERT INTO `ema_answer` VALUES (637, 171, '2024-06-14', '12:06:35', '中性', '中等程度', '有一点压力', '', 'calm', 1, -1, 10, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"}');
INSERT INTO `ema_answer` VALUES (638, 171, '2024-06-14', '23:56:59', '中性', '比较多', '没有压力', '', 'serene', 2, -2, 11, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}');
INSERT INTO `ema_answer` VALUES (639, 171, '2024-06-15', '00:00:48', '中性', '中等程度', '没有压力', '', 'calm', 1, -1, 10, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"}');
INSERT INTO `ema_answer` VALUES (640, 170, '2024-06-16', '21:51:44', '生气', '有一点', '没有压力', '', 'frustrated', -2, 1, 5, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"}');
INSERT INTO `ema_answer` VALUES (641, 171, '2024-06-20', '20:16:42', '中性', '比较多', '有一点压力', '', 'calm', 1, -1, 10, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_2.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_2.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"}');
INSERT INTO `ema_answer` VALUES (642, 2, '2024-06-21', '10:58:48', '中性', '比较多', '有一定程度的压力', '', 'sleepy', 1, -2, 9, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_2.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"}');
INSERT INTO `ema_answer` VALUES (643, 171, '2024-06-21', '11:48:12', '忧虑', '有一点', '有一点压力', '', 'satisfied', 2, -1, 12, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_1.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"}');
INSERT INTO `ema_answer` VALUES (644, 179, '2024-06-21', '13:17:12', '高兴', '有一点', '有一定程度的压力', '', 'excited', 1, 2, 14, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"}');
INSERT INTO `ema_answer` VALUES (645, 174, '2024-06-21', '13:51:57', '中性', '中等程度', '有一点压力', '', 'happy', 1, 1, 13, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"}');
INSERT INTO `ema_answer` VALUES (646, 174, '2024-06-21', '20:05:27', '高兴', '中等程度', '有一点压力', '', 'glad', 2, 1, 15, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_1.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"}');
INSERT INTO `ema_answer` VALUES (647, 171, '2024-06-23', '10:23:23', '高兴', '有一点', '没有压力', '', 'happy', 1, 1, 13, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_2.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"}');
INSERT INTO `ema_answer` VALUES (648, 171, '2024-06-23', '15:33:55', '中性', '极其多', '没有压力', '', 'sleepy', 1, -2, 9, '[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]', '{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"}');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用于管理后台管理端的用户，通过邀请码注册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invition_code
-- ----------------------------
INSERT INTO `invition_code` VALUES (2, 2, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (3, 3, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (4, 4, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (5, 171, NULL, NULL, NULL, 1);

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
  `question_end_time` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_audo_userid`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_depressionvideo_userid` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (18, 170, 'depression-video', '2024-06-13', '16:48:32', '/depression-video/170_depression-video_20240613_7a15edd3-5468-47e4-b77d-372cb84b457b.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (19, 170, 'depression-video', '2024-06-13', '18:01:09', '/depression-video/170_depression-video_20240613_c238a8dc-7990-4163-9974-c54365e7c0bc.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (20, 170, 'depression-video', '2024-06-14', '13:29:56', '/depression-video/170_depression-video_20240614_5fba9cb7-c180-42cc-ae9b-31aeb9314ba0.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (21, 170, 'depression-video', '2024-06-14', '13:42:37', '/depression-video/170_depression-video_20240614_97467cfb-d72f-43c5-848e-d16d9518485b.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (22, 170, 'depression-video', '2024-06-14', '13:48:28', '/depression-video/170_depression-video_20240614_95f6639b-5cf4-429c-8dc9-57d374665ccc.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (23, 171, 'depression-video', '2024-06-15', '00:11:06', '/depression-video/171_depression-video_20240615_681402f9-5808-42f6-96a2-37027b7f3c9d.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (24, 171, 'depression-video', '2024-06-15', '20:40:59', '/depression-video/171_depression-video_20240615_04a5db60-9bef-4af7-ac16-623d1fc52caa.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (25, 171, 'depression-video', '2024-06-15', '20:48:33', '/depression-video/171_depression-video_20240615_b280db33-8da6-425b-8789-c20454a520aa.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (26, 170, 'depression-video', '2024-06-16', '11:40:39', '/depression-video/170_depression-video_20240616_03d7d395-c6b3-408e-9424-7e9bcc9d4f8f.mp4', NULL, NULL, NULL);
INSERT INTO `media` VALUES (27, 170, 'depression-video', '2024-06-16', '11:59:04', '/depression-video/170_depression-video_20240616_15e5a4c2-d045-402d-a3a6-d2479bbe5c58.mp4', NULL, NULL, '526,908,411,72,424,761,604,57,623,52,672');
INSERT INTO `media` VALUES (28, 170, 'depression-video', '2024-06-16', '12:02:53', '/depression-video/170_depression-video_20240616_e5e631cc-9680-4832-aac0-3be286083256.mp4', NULL, NULL, '13878,19324,36633,44742,46324,50279,52262,53907,59386,64892,65871');
INSERT INTO `media` VALUES (29, 170, 'depression-video', '2024-06-16', '21:40:29', '/depression-video/170_depression-video_20240616_e0e96e81-0bb4-4245-a21d-6231a9b85ff2.mp4', NULL, NULL, '3769,5588,12318,14108,15959,17504,18701,19766,21317,22843,23950,31569');
INSERT INTO `media` VALUES (30, 170, 'depression-video', '2024-06-16', '21:53:07', '/depression-video/170_depression-video_20240616_753e31f7-0358-4974-9a3a-681d3b06002c.mp4', NULL, NULL, '5900,8484,11609,12700,25796,28450,31690,33390,36205,38957,40117,43623');
INSERT INTO `media` VALUES (31, 171, 'depression-video', '2024-06-20', '20:04:12', '/depression-video/171_depression-video_20240620_7dffd086-b080-4fe3-805e-8719672f9c20.mp4', NULL, NULL, '7265,9009,9831,10886,11277,11678,12137,12723,13478,14210,14588,31311');
INSERT INTO `media` VALUES (32, 170, 'depression-video', '2024-06-23', '21:40:07', '/depression-video/170_depression-video_20240623_6c090c43-7c72-471c-827f-455adb9f2ad5.mp4', NULL, NULL, '35885');
INSERT INTO `media` VALUES (33, 170, 'depression-video', '2024-06-23', '21:40:48', '/depression-video/170_depression-video_20240623_4d2eeaec-c30f-4791-b18c-216c2beedeef.mp4', NULL, NULL, '26688,27164,27534,27731,27930,28072,32127');

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
  INDEX `fk_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '西北工业大学用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nwpu_user_info
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '这份量表是在询问在最近一个月来，您个人的感受和想法，请您于每一个题项上作答时，去指出您感受或想到某一特定想法的频率。虽然有些问题看是相似，实则是有所差异，所以每一题均需作答。\r\n而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的压力知觉状况。而每一题项皆有下列五种选择。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of perceived_stress_scale
-- ----------------------------
INSERT INTO `perceived_stress_scale` VALUES (31, 171, '2024-06-12', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 28);
INSERT INTO `perceived_stress_scale` VALUES (33, 170, '2024-06-16', 2, 2, 0, 4, 2, 4, 1, 2, 2, 2, 2, 1, 1, 1, 22);
INSERT INTO `perceived_stress_scale` VALUES (34, 174, '2024-06-21', 2, 1, 1, 2, 2, 3, 2, 1, 4, 3, 2, 3, 3, 0, 19);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phq9
-- ----------------------------

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
-- Table structure for sas
-- ----------------------------
DROP TABLE IF EXISTS `sas`;
CREATE TABLE `sas`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL,
  `sas_q1` tinyint NOT NULL DEFAULT 0,
  `sas_q2` tinyint NOT NULL DEFAULT 0,
  `sas_q3` tinyint NOT NULL DEFAULT 0,
  `sas_q4` tinyint NOT NULL DEFAULT 0,
  `sas_q5` tinyint NOT NULL DEFAULT 0,
  `sas_q6` tinyint NOT NULL DEFAULT 0,
  `sas_q7` tinyint NOT NULL DEFAULT 0,
  `sas_q8` tinyint NOT NULL DEFAULT 0,
  `sas_q9` tinyint NOT NULL,
  `sas_q10` tinyint NOT NULL,
  `sas_q11` tinyint NOT NULL,
  `sas_q12` tinyint NOT NULL,
  `sas_q13` tinyint NOT NULL,
  `sas_q14` tinyint NOT NULL,
  `sas_q15` tinyint NOT NULL,
  `sas_q16` tinyint NOT NULL,
  `sas_q17` tinyint NOT NULL,
  `sas_q18` tinyint NOT NULL,
  `sas_q19` tinyint NOT NULL,
  `sas_q20` tinyint NOT NULL,
  `score` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_7`(`user_id` ASC, `log_date` ASC) USING BTREE,
  INDEX `k_log_date_7`(`log_date` ASC) USING BTREE,
  CONSTRAINT `sas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sas
-- ----------------------------
INSERT INTO `sas` VALUES (95, 171, '2024-06-12', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 81);
INSERT INTO `sas` VALUES (97, 170, '2024-06-16', 4, 3, 3, 3, 2, 3, 3, 2, 3, 2, 4, 1, 3, 2, 3, 3, 3, 2, 4, 2, 62);
INSERT INTO `sas` VALUES (98, 174, '2024-06-21', 2, 3, 2, 1, 1, 1, 1, 2, 4, 2, 1, 2, 3, 1, 1, 3, 2, 2, 1, 2, 50);

-- ----------------------------
-- Table structure for sds
-- ----------------------------
DROP TABLE IF EXISTS `sds`;
CREATE TABLE `sds`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint NOT NULL DEFAULT 0,
  `q2` tinyint NOT NULL DEFAULT 0,
  `q3` tinyint NOT NULL DEFAULT 0,
  `q4` tinyint NOT NULL DEFAULT 0,
  `q5` tinyint NOT NULL DEFAULT 0,
  `q6` tinyint NOT NULL DEFAULT 0,
  `q7` tinyint NOT NULL DEFAULT 0,
  `q8` tinyint NOT NULL DEFAULT 0,
  `q9` tinyint NOT NULL DEFAULT 0,
  `q10` tinyint NOT NULL DEFAULT 0,
  `q11` tinyint NOT NULL DEFAULT 0,
  `q12` tinyint NOT NULL DEFAULT 0,
  `q13` tinyint NOT NULL DEFAULT 0,
  `q14` tinyint NOT NULL DEFAULT 0,
  `q15` tinyint NOT NULL DEFAULT 0,
  `q16` tinyint NOT NULL DEFAULT 0,
  `q17` tinyint NOT NULL DEFAULT 0,
  `q18` tinyint NOT NULL DEFAULT 0,
  `q19` tinyint NOT NULL DEFAULT 0,
  `q20` tinyint NOT NULL DEFAULT 0,
  `score` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_logdate_17`(`user_id` ASC, `log_date` ASC) USING BTREE,
  INDEX `k_log_date_17`(`log_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sds
-- ----------------------------
INSERT INTO `sds` VALUES (1, 2, '2024-05-27', 2, 2, 2, 3, 3, 1, 2, 2, 2, 3, 1, 3, 2, 2, 2, 3, 3, 3, 2, 1, 55);
INSERT INTO `sds` VALUES (2, 171, '2024-06-12', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62);
INSERT INTO `sds` VALUES (3, 170, '2024-06-16', 3, 3, 3, 4, 3, 3, 3, 3, 4, 4, 4, 2, 3, 2, 3, 1, 1, 1, 4, 2, 77);
INSERT INTO `sds` VALUES (4, 174, '2024-06-21', 1, 4, 1, 3, 4, 4, 1, 1, 2, 2, 3, 2, 1, 3, 1, 2, 3, 2, 1, 3, 42);

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

-- ----------------------------
-- Table structure for user_health_info
-- ----------------------------
DROP TABLE IF EXISTS `user_health_info`;
CREATE TABLE `user_health_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id，外键',
  `sex` enum('男','女') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生时间',
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
  INDEX `fk_doctor_id`(`doctor_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户健康信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_health_info
-- ----------------------------
INSERT INTO `user_health_info` VALUES (2, 3, '男', '2020-10-19', 170, 60.0, 1, '待标注', '待说明', '2020-10-26 16:44:21', '2024-06-10 20:25:52');
INSERT INTO `user_health_info` VALUES (3, 4, '女', '2020-10-19', 170, 60.0, 1, '待标注', '待说明', '2020-10-26 16:44:49', '2024-06-10 20:25:52');
INSERT INTO `user_health_info` VALUES (13, 2, '男', '2020-10-01', 175, 49.0, 1, '待标注1', '待说明', '2020-11-02 16:55:24', '2024-06-10 20:30:12');
INSERT INTO `user_health_info` VALUES (14, 170, '女', '2024-06-10', 0, 0.0, 1, '', '', '2024-06-10 20:24:16', '2024-06-10 20:25:52');
INSERT INTO `user_health_info` VALUES (15, 171, '女', '2001-11-13', 0, 0.0, 1, '', '', '2024-06-12 18:47:31', NULL);
INSERT INTO `user_health_info` VALUES (16, 172, '女', '2024-05-07', 0, 0.0, 1, '', '', '2024-06-12 20:33:49', NULL);
INSERT INTO `user_health_info` VALUES (17, 173, '女', NULL, 0, 0.0, 1, '', '', '2024-06-17 16:03:41', NULL);
INSERT INTO `user_health_info` VALUES (18, 174, '女', NULL, 0, 0.0, 1, '', '', '2024-06-21 12:52:41', NULL);
INSERT INTO `user_health_info` VALUES (19, 179, '男', NULL, 0, 0.0, 1, '', '', '2024-06-21 12:57:13', NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号码、唯一',
  `user_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名、唯一',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '数据库不存储原始密码，存MD5散列值，校验的时候判断的是密码散列值是否相同',
  `role` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：用户（0）、医生（1）、管理员（2）',
  `permission` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'normal' COMMENT '用户权限',
  `real_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户真实姓名',
  `identity_number` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户身份证号，唯一',
  `city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `province` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `country` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `nwpu` tinyint NOT NULL DEFAULT 0 COMMENT '用于标注是否npwu用户，默认0（false），1（true）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `nwpu_id` int NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `push_connected` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `u_user_name`(`user_name` ASC) USING BTREE COMMENT '用户名唯一',
  UNIQUE INDEX `u_phone`(`phone` ASC) USING BTREE COMMENT '手机号码唯一',
  UNIQUE INDEX `u_identity_number`(`identity_number` ASC) USING BTREE COMMENT '身份证号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (2, '18392183603', 'chf', '1852bdfde036dd98511a05eb8608b81e', 'doctor', 'vip', 'chf', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2024-06-23 17:44:28', NULL, NULL, '2024-06-23 17:44:28');
INSERT INTO `user_info` VALUES (3, '12222222222', 'xm', '1852bdfde036dd98511a05eb8608b81e', 'doctor', 'vip', 'xm', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2024-06-10 20:33:53', NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (4, '14444444444', 'zyy', '1852bdfde036dd98511a05eb8608b81e', 'doctor', 'vip', 'zyy', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2024-06-12 18:28:53', NULL, NULL, '2024-06-12 18:28:53');
INSERT INTO `user_info` VALUES (170, '13333333333', 'test', '1852bdfde036dd98511a05eb8608b81e', 'user', 'normal', '测试', NULL, '深圳市', '广东省', '中国', '', 0, '2024-06-10 20:24:16', '2024-06-23 22:02:44', NULL, NULL, '2024-06-23 22:02:44');
INSERT INTO `user_info` VALUES (171, '13939948323', 'cyk', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'cyk', NULL, '西安市', '陕西省', '中国', '', 0, '2024-06-12 18:47:31', '2025-07-22 21:15:05', NULL, NULL, '2025-07-22 21:15:05');
INSERT INTO `user_info` VALUES (174, '15236254632', 'lx', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'lx', NULL, '西安市', '陕西省', '中国', '', 1, '2024-06-21 12:52:41', '2025-07-22 21:04:42', NULL, NULL, '2025-07-22 21:04:42');
INSERT INTO `user_info` VALUES (179, '18735482563', 'whm', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'whm', NULL, '西安市', '陕西省', '中国', '', 1, '2024-06-21 12:57:13', '2025-07-22 21:42:39', NULL, NULL, '2025-07-22 21:42:39');

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
-- Triggers structure for table sas
-- ----------------------------
DROP TRIGGER IF EXISTS `tri_log_date_7_copy1`;
delimiter ;;
CREATE TRIGGER `tri_log_date_7_copy1` BEFORE INSERT ON `sas` FOR EACH ROW BEGIN
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
