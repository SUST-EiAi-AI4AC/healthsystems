/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3306
 Source Schema         : healthsystem-whole

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 07/08/2025 13:28:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfileId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalKilocalories` float NULL DEFAULT NULL,
  `activeKilocalories` float NULL DEFAULT NULL,
  `bmrKilocalories` float NULL DEFAULT NULL,
  `wellnessKilocalories` float NULL DEFAULT NULL,
  `burnedKilocalories` float NULL DEFAULT NULL,
  `consumedKilocalories` float NULL DEFAULT NULL,
  `remainingKilocalories` float NULL DEFAULT NULL,
  `totalSteps` int NULL DEFAULT NULL,
  `netCalorieGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalDistanceMeters` float NULL DEFAULT NULL,
  `wellnessDistanceMeters` float NULL DEFAULT NULL,
  `wellnessActiveKilocalories` float NULL DEFAULT NULL,
  `netRemainingKilocalories` float NULL DEFAULT NULL,
  `userDailySummaryId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `rule_typeId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rule_typeKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dailyStepGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `wellnessStartTimeGmt` datetime NULL DEFAULT NULL,
  `wellnessStartTimeLocal` datetime NULL DEFAULT NULL,
  `wellnessEndTimeGmt` datetime NULL DEFAULT NULL,
  `wellnessEndTimeLocal` datetime NULL DEFAULT NULL,
  `durationInMilliseconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `wellnessDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highlyActiveSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activeSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sedentarySeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepingSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesWellnessData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesActivityData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesCalorieConsumedData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `privacyProtected` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `moderateIntensityMinutes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vigorousIntensityMinutes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsAscendedInMeters` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsDescendedInMeters` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsAscended` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsDescended` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `intensityMinutesGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userFloorsAscendedGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `minHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSevenDaysAvgRestingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `averageStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uncategorizedStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mediumStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uncategorizedStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mediumStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressQualifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `measurableAwakeDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `measurableAsleepDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSyncTimestampGMT` datetime NULL DEFAULT NULL,
  `minAvgHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxAvgHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryChargedValue` int NULL DEFAULT NULL,
  `bodyBatteryDrainedValue` int NULL DEFAULT NULL,
  `bodyBatteryHighestValue` int NULL DEFAULT NULL,
  `bodyBatteryLowestValue` int NULL DEFAULT NULL,
  `bodyBatteryMostRecentValue` int NULL DEFAULT NULL,
  `bodyBatteryDuringSleep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryAtWakeTime` int NULL DEFAULT NULL,
  `bodyBatteryVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `abnormalHeartRateAlertsCount` int NULL DEFAULT NULL,
  `averageSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowestSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpo2ReadingTimeGmt` datetime NULL DEFAULT NULL,
  `latestSpo2ReadingTimeLocal` datetime NULL DEFAULT NULL,
  `averageMonitoringEnvironmentAltitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingCaloriesFromActivity` float NULL DEFAULT NULL,
  `avgWakingRespirationValue` int NULL DEFAULT NULL,
  `highestRespirationValue` int NULL DEFAULT NULL,
  `lowestRespirationValue` int NULL DEFAULT NULL,
  `latestRespirationValue` int NULL DEFAULT NULL,
  `latestRespirationTimeGMT` datetime NULL DEFAULT NULL,
  `respirationAlgorithmVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (28, '2025-07-30 00:00:00', '12372158', 1625, 88, 1537, 1625, NULL, NULL, NULL, 3275, NULL, 2358, 2358, 88, 88, '12372158', '2025-07-30 00:00:00', '2', 'private', 'fce1be8154814f79ae67b7d0b74f1f38', '4720', '2025-07-29 16:00:00', '2025-07-30 00:00:00', '2025-07-30 16:00:00', '2025-07-31 00:00:00', '24h', NULL, '40min', '18min', '14h41min', '8h19min', 'True', 'False', 'False', 'False', '1', '2', NULL, NULL, NULL, NULL, '150', '10', '49', '141', '53', '53', 'GARMIN', '26', '88', '6h56min', '14h39min', '2h14min', '5min', '23h54min', '3h34min', '2h25min', '57min', '29.01', '61.3', '9.34', '0.35', '14.92', '10.11', '3.97', 'BALANCED', '15h30min', '8h19min', NULL, '49', '131', 93, 73, 97, 6, 28, '81', 97, '3.0', NULL, '90.0', '83', '84', '2025-07-30 16:00:00', '2025-07-31 00:00:00', NULL, NULL, 14, 22, 6, 18, '2025-07-30 16:00:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (29, '2025-07-31 00:00:00', '12372158', 1597, 60, 1537, 1597, NULL, NULL, NULL, 3272, NULL, 2316, 2316, 60, 60, '12372158', '2025-07-31 00:00:00', '2', 'private', 'c22987825b2241d7986c13da6944f1e4', '4440', '2025-07-30 16:00:00', '2025-07-31 00:00:00', '2025-07-31 16:00:00', '2025-08-01 00:00:00', '24h', NULL, '33min', '20min', '14h34min', '8h32min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '44', '120', '46', '52', 'GARMIN', '34', '95', '11h54min', '9h2min', '1h30min', '1h23min', '23h49min', '5h57min', '3h29min', '2h28min', '49.97', '37.93', '6.3', '5.81', '24.98', '14.63', '10.36', 'STRESSFUL', '13h54min', '8h32min', NULL, '45', '118', 79, 78, 100, 21, 29, '79', 100, '3.0', NULL, '89.0', '83', '88', '2025-07-31 13:40:00', '2025-07-31 21:40:00', NULL, NULL, 14, 23, 7, 10, '2025-07-31 14:36:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (30, '2025-08-01 00:00:00', '12372158', 1606, 69, 1537, 1606, NULL, NULL, NULL, 4204, NULL, 2999, 2999, 69, 69, '12372158', '2025-08-01 00:00:00', '2', 'private', '878c71baa5f0412198f19867b61e2357', '4210', '2025-07-31 16:00:00', '2025-08-01 00:00:00', '2025-08-01 16:00:00', '2025-08-02 00:00:00', '24h', NULL, '52min', '27min', '15h55min', '6h45min', 'True', 'False', 'False', 'False', '0', '1', NULL, NULL, NULL, NULL, '150', '10', '48', '116', '51', '53', 'GARMIN', '31', '90', '10h7min', '10h15min', '2h31min', '59min', '23h52min', '6h33min', '3h7min', '27min', '42.39', '42.95', '10.54', '4.12', '27.44', '13.06', '1.89', 'BALANCED', '16h8min', '6h45min', NULL, '49', '98', 63, 67, 87, 24, 25, '61', 87, '3.0', NULL, '92.0', '87', '91', '2025-07-31 19:07:00', '2025-08-01 03:07:00', NULL, NULL, 15, 21, 7, 15, '2025-08-01 16:00:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (31, '2025-08-02 00:00:00', '12372158', 1577, 40, 1537, 1577, NULL, NULL, NULL, 1292, NULL, 926, 926, 40, 40, '12372158', '2025-08-02 00:00:00', '2', 'private', '2479f5c0e93646919da681bc79290956', '4210', '2025-08-01 16:00:00', '2025-08-02 00:00:00', '2025-08-02 16:00:00', '2025-08-03 00:00:00', '24h', NULL, '36min', '9min', '23h14min', '0min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '56', '106', '56', '53', 'GARMIN', '53', '92', '10h58min', '1h24min', '1h59min', '1h8min', '15h29min', '3h28min', '6h14min', '1h16min', '70.83', '9.04', '12.81', '7.32', '22.39', '40.26', '8.18', 'STRESSFUL_AWAKE', '14h21min', '0min', NULL, '56', '100', 30, 36, 35, 5, 19, NULL, NULL, '3.0', NULL, '88.0', '88', '88', '2025-08-02 15:59:00', '2025-08-02 23:59:00', NULL, NULL, 16, 24, 9, 17, '2025-08-02 15:59:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (32, '2025-08-03 00:00:00', '12372158', 1603, 66, 1537, 1603, NULL, NULL, NULL, 3592, NULL, 2566, 2566, 66, 66, '12372158', '2025-08-03 00:00:00', '2', 'private', '941de9c2d2f34827b06d071861dda555', '3630', '2025-08-02 16:00:00', '2025-08-03 00:00:00', '2025-08-03 16:00:00', '2025-08-04 00:00:00', '24h', NULL, '37min', '27min', '17h32min', '5h23min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '51', '107', '55', '53', 'GARMIN', '36', '96', '11h25min', '9h38min', '2h36min', '10min', '23h49min', '5h29min', '4h19min', '1h37min', '47.94', '40.45', '10.92', '0.7', '23.02', '18.12', '6.79', 'BALANCED', '18h16min', '5h23min', NULL, '53', '107', 60, 69, 72, 10, 10, '53', 72, '3.0', NULL, '87.0', '79', '86', '2025-08-03 16:00:00', '2025-08-04 00:00:00', NULL, NULL, 15, 23, 8, 14, '2025-08-03 16:00:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (33, '2025-08-04 00:00:00', '12372158', 1579, 42, 1537, 1579, NULL, NULL, NULL, 2049, NULL, 1477, 1477, 42, 42, '12372158', '2025-08-04 00:00:00', '2', 'private', 'c137ad7b48f841789fb33a42901bd115', '3630', '2025-08-03 16:00:00', '2025-08-04 00:00:00', '2025-08-04 16:00:00', '2025-08-05 00:00:00', '24h', NULL, '21min', '24min', '14h4min', '9h10min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '49', '111', '53', '53', 'GARMIN', '33', '92', '12h8min', '9h40min', '2h5min', '4min', '23h57min', '7h57min', '3h31min', '40min', '50.66', '40.36', '8.7', '0.28', '33.19', '14.68', '2.78', 'STRESSFUL', '14h44min', '9h9min', NULL, '50', '105', 75, 62, 80, 5, 23, '75', 80, '3.0', NULL, '89.0', '77', '90', '2025-08-04 16:00:00', '2025-08-05 00:00:00', NULL, NULL, 16, 24, 8, 21, '2025-08-04 16:00:00', '200', 'ccceee00004@163.com');
INSERT INTO `activity` VALUES (34, '2025-08-05 00:00:00', '12372158', 1578, 41, 1537, 1578, NULL, NULL, NULL, 1499, NULL, 1063, 1063, 41, 41, '12372158', '2025-08-05 00:00:00', '2', 'private', '179c9d12f2b4478cb9986f48920e50d2', '3320', '2025-08-04 16:00:00', '2025-08-05 00:00:00', '2025-08-05 16:00:00', '2025-08-06 00:00:00', '24h', NULL, '13min', '16min', '12h53min', '10h37min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '52', '114', '56', '53', 'GARMIN', '30', '93', '8h28min', '11h46min', '1h50min', '1h55min', '23h59min', '5h57min', '1h26min', '1h5min', '35.3', '49.06', '7.64', '7.99', '24.81', '5.98', '4.52', 'BALANCED', '13h27min', '8h37min', NULL, '53', '112', 53, 56, 67, 19, 20, '45', 64, '3.0', NULL, '89.0', '78', '92', '2025-08-05 14:03:00', '2025-08-05 22:03:00', NULL, NULL, 16, 26, 8, 18, '2025-08-05 14:03:00', '200', 'ccceee00004@163.com');

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
) ENGINE = InnoDB AUTO_INCREMENT = 705 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '每日一次的填报记录（睡眠时间、运动时间、服药等信息）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (702, 171, '2025-07-29', '按时吃饭，食欲正常', NULL, '2025-07-29 18:12:51', '制定了清晰的时间表并按时执行', '积极参与交流，享受互动时光', '0', '未工作或学习', '参加喜欢的社交活动', '都没有', '阅读书籍或杂志', '感到充实和满足', '少于30分钟', '少于30分钟', '立刻起床');
INSERT INTO `answer` VALUES (703, 181, '2025-08-07', '按时吃饭，食欲正常', NULL, '2025-08-07 00:01:51', '制定了清晰的时间表但改变了', '积极参与交流，享受互动时光', '0', '未工作或学习', '参加喜欢的社交活动', '都没有', '感到焦虑或不安，难以放松', '感到充实和满足', '少于30分钟', '少于30分钟', '立刻起床');
INSERT INTO `answer` VALUES (704, 171, '2025-08-06', '完全没有食欲', NULL, '2025-08-07 00:18:28', '不知道该如何安排时间', '对交流行为感到抵触，不愿与人接触', '超过8小时', '几乎无法工作或学习', '几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧', '极度心神不宁，焦虑不安', '感到焦虑或不安，难以放松', '感到些许沮丧或失望', '超过2小时', '1.5-2小时', '伸个懒腰，稍作休息后起床');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of basic_info
-- ----------------------------
INSERT INTO `basic_info` VALUES (3, 171, '2024-06-23', '女', '13785369485', '2001-07-01', '硕士研究生', '否', '否', '集体宿舍', '未婚', '灾难', '青少年', '无', '无', '无', '3-5个', '和同学、同事或朋友住在一起', '有些邻居很关心您', '遇到困难可能稍微关心', '朋友', '朋友', '只向关系即为密切的1-2人倾诉', '很少请求别人帮助', '偶尔参加', '一年内,好事,无影响,一年以上', '一年内,坏事,轻度,三月内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '长期性,好事,无影响,一年以上', '长期性,坏事,中度,一年以上', '未发生,null,null,null', '未发生,null,null,null', '长期性,坏事,中度,一年以上', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');
INSERT INTO `basic_info` VALUES (4, 174, '2024-06-21', '女', '13571121019', '2001-08-01', '硕士研究生', '否', '否', '集体宿舍', '未婚', '灾难', NULL, '无', '无', '无', '3-5个', '和同学、同事或朋友住在一起', '遇到困难可能稍微关心', '遇到困难可能稍微关心', '其他家人', '朋友', '只向关系即为密切的1-2人倾诉', '很少请求别人帮助', '从不参加', '一年前,好事,轻度,三月内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');
INSERT INTO `basic_info` VALUES (5, 170, '2024-06-23', '女', '1112233', '2024-06-01', '硕士研究生', '是', '否', '独居', '丧偶', '灾难', '成年后', '有', '有', '无', '3-5个', '住处经常变动，多数时间和陌生人住在一起', '大多数邻居都很关心您', '相互之间从不关心，只是点头之交', '工作单位', '其他家人', '从不向任何人倾诉', '有时请求别人帮助', '偶尔参加', '未发生,null,null,null', '一年前,好事,无影响,半年内', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null', '未发生,null,null,null');

-- ----------------------------
-- Table structure for body_battery
-- ----------------------------
DROP TABLE IF EXISTS `body_battery`;
CREATE TABLE `body_battery`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `charged` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `drained` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `startTimestampLocal` datetime NULL DEFAULT NULL,
  `endTimestampLocal` datetime NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of body_battery
-- ----------------------------
INSERT INTO `body_battery` VALUES (28, '2025-07-30 00:00:00', '93', '73', '2025-07-29 16:00:00', '2025-07-30 16:00:00', '2025-07-30 00:00:00', '2025-07-31 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (29, '2025-07-31 00:00:00', '79', '78', '2025-07-30 16:00:00', '2025-07-31 16:00:00', '2025-07-31 00:00:00', '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (30, '2025-08-01 00:00:00', '63', '67', '2025-07-31 16:00:00', '2025-08-01 16:00:00', '2025-08-01 00:00:00', '2025-08-02 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (31, '2025-08-02 00:00:00', '30', '36', '2025-08-01 16:00:00', '2025-08-02 16:00:00', '2025-08-02 00:00:00', '2025-08-03 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (32, '2025-08-03 00:00:00', '60', '69', '2025-08-02 16:00:00', '2025-08-03 16:00:00', '2025-08-03 00:00:00', '2025-08-04 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (33, '2025-08-04 00:00:00', '75', '62', '2025-08-03 16:00:00', '2025-08-04 16:00:00', '2025-08-04 00:00:00', '2025-08-05 00:00:00', 'ccceee00004@163.com');
INSERT INTO `body_battery` VALUES (34, '2025-08-05 00:00:00', '53', '56', '2025-08-04 16:00:00', '2025-08-05 16:00:00', '2025-08-05 00:00:00', '2025-08-06 00:00:00', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for csv_file_paths
-- ----------------------------
DROP TABLE IF EXISTS `csv_file_paths`;
CREATE TABLE `csv_file_paths`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imported_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_path`(`file_path`(100) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of csv_file_paths
-- ----------------------------
INSERT INTO `csv_file_paths` VALUES (2013, 'activity', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\activity\\2025-07-30\\body_battery_events.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2017, 'activity', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\activity\\2025-08-01\\body_battery_events.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2027, 'body_battery', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\body_battery\\2025-07-30\\body_battery_activity_events.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2090, 'fitness_age', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\fitness_age\\2025-07-30\\fitness_age_components.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2097, 'heart_rate', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\heart_rate\\2025-07-30\\heart_rate_values.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2111, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-07-30\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2113, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-07-31\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2115, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-08-01\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2117, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-08-03\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2119, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-08-04\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2121, 'hrv', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\hrv\\2025-08-05\\hrv_baseline.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2123, 'respiration', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\respiration\\2025-07-30\\respiration_averages_valuesarray.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2151, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-07-30\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2167, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-07-31\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2183, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-08-01\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2199, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-08-02\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2215, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-08-03\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2231, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-08-04\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2247, 'sleep', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\sleep\\2025-08-05\\daily_nap_dtos.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2263, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-07-30\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2266, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-07-31\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2269, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-08-01\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2272, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-08-02\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2275, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-08-03\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2278, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-08-04\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2281, 'spo2', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\spo2\\2025-08-05\\spo2_continuous_readings.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2284, 'stats_body_composition', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\stats_body_composition\\2025-07-30\\body_battery_events.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2291, 'stress', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\stress\\2025-07-30\\stress_timeseries.csv', '2025-08-06 19:08:53');
INSERT INTO `csv_file_paths` VALUES (2293, 'stress', 'healthsystem-backend/src/main/resources/python_scripts/csv_data/ccceee00004_163.com\\stress\\2025-08-01\\stress_timeseries.csv', '2025-08-06 19:08:53');

-- ----------------------------
-- Table structure for daily_steps
-- ----------------------------
DROP TABLE IF EXISTS `daily_steps`;
CREATE TABLE `daily_steps`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `totalSteps` int NULL DEFAULT NULL,
  `totalDistance` float NULL DEFAULT NULL,
  `stepGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userProfilePK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_steps
-- ----------------------------
INSERT INTO `daily_steps` VALUES (29, '2025-07-30 00:00:00', '2025-07-30 00:00:00', 3275, 2358, '4720', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (30, '2025-07-31 00:00:00', '2025-07-31 00:00:00', 3272, 2316, '4440', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (31, '2025-08-01 00:00:00', '2025-08-01 00:00:00', 4204, 2999, '4210', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (32, '2025-08-02 00:00:00', '2025-08-02 00:00:00', 1292, 926, '4210', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (33, '2025-08-03 00:00:00', '2025-08-03 00:00:00', 3592, 2566, '3630', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (34, '2025-08-04 00:00:00', '2025-08-04 00:00:00', 2049, 1477, '3630', NULL, 'ccceee00004@163.com');
INSERT INTO `daily_steps` VALUES (35, '2025-08-05 00:00:00', '2025-08-05 00:00:00', 1499, 1063, '3320', NULL, 'ccceee00004@163.com');

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
-- Table structure for fitness_age
-- ----------------------------
DROP TABLE IF EXISTS `fitness_age`;
CREATE TABLE `fitness_age`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `chronologicalAge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fitnessAge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `achievableFitnessAge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `previousFitnessAge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastUpdated` datetime NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fitness_age
-- ----------------------------
INSERT INTO `fitness_age` VALUES (28, '2025-07-30 00:00:00', '22', '19.712416018201036', '18.0', '19.712416018201036', '2025-07-30 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (29, '2025-07-31 00:00:00', '22', '19.645353393330403', '18.0', '19.712416018201036', '2025-07-31 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (30, '2025-08-01 00:00:00', '22', '19.578290768459773', '18.0', '19.645353393330403', '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (31, '2025-08-02 00:00:00', '22', '19.578290768459773', '18.0', '19.645353393330403', '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (32, '2025-08-03 00:00:00', '22', '19.578290768459773', '18.0', '19.645353393330403', '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (33, '2025-08-04 00:00:00', '22', '19.578290768459773', '18.0', '19.645353393330403', '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `fitness_age` VALUES (34, '2025-08-05 00:00:00', '22', '19.578290768459773', '18.0', '19.645353393330403', '2025-08-01 00:00:00', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for heart_rate
-- ----------------------------
DROP TABLE IF EXISTS `heart_rate`;
CREATE TABLE `heart_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `userProfilePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `startTimestampLocal` datetime NULL DEFAULT NULL,
  `endTimestampLocal` datetime NULL DEFAULT NULL,
  `maxHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `minHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSevenDaysAvgRestingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of heart_rate
-- ----------------------------
INSERT INTO `heart_rate` VALUES (28, '2025-07-30 00:00:00', NULL, '12372158', '2025-07-30 00:00:00', '2025-07-29 16:00:00', '2025-07-30 16:00:00', '2025-07-30 00:00:00', '2025-07-31 00:00:00', '131', '49', '53', '53', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (29, '2025-07-31 00:00:00', NULL, '12372158', '2025-07-31 00:00:00', '2025-07-30 16:00:00', '2025-07-31 16:00:00', '2025-07-31 00:00:00', '2025-08-01 00:00:00', '118', '45', '46', '52', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (30, '2025-08-01 00:00:00', NULL, '12372158', '2025-08-01 00:00:00', '2025-07-31 16:00:00', '2025-08-01 16:00:00', '2025-08-01 00:00:00', '2025-08-02 00:00:00', '98', '49', '51', '53', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (31, '2025-08-02 00:00:00', NULL, '12372158', '2025-08-02 00:00:00', '2025-08-01 16:00:00', '2025-08-02 16:00:00', '2025-08-02 00:00:00', '2025-08-03 00:00:00', '100', '56', '56', '53', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (32, '2025-08-03 00:00:00', NULL, '12372158', '2025-08-03 00:00:00', '2025-08-02 16:00:00', '2025-08-03 16:00:00', '2025-08-03 00:00:00', '2025-08-04 00:00:00', '107', '53', '55', '53', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (33, '2025-08-04 00:00:00', NULL, '12372158', '2025-08-04 00:00:00', '2025-08-03 16:00:00', '2025-08-04 16:00:00', '2025-08-04 00:00:00', '2025-08-05 00:00:00', '105', '50', '53', '53', 'ccceee00004@163.com');
INSERT INTO `heart_rate` VALUES (34, '2025-08-05 00:00:00', NULL, '12372158', '2025-08-05 00:00:00', '2025-08-04 16:00:00', '2025-08-05 16:00:00', '2025-08-05 00:00:00', '2025-08-06 00:00:00', '112', '53', '56', '53', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for hrv
-- ----------------------------
DROP TABLE IF EXISTS `hrv`;
CREATE TABLE `hrv`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfilePk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `startTimestampLocal` datetime NULL DEFAULT NULL,
  `endTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `weeklyAvg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastNightAvg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastNight5MinHigh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `feedbackPhrase` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTimeStamp` datetime NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hrv
-- ----------------------------
INSERT INTO `hrv` VALUES (18, '2025-07-30 00:00:00', '12372158', '2025-07-29 20:15:36', '2025-07-30 04:29:43', '2025-07-30 04:15:36', '2025-07-30 12:29:43', '2025-07-29 20:15:36', '2025-07-30 04:34:36', '2025-07-30 04:15:36', '2025-07-30 12:34:36', '2025-07-30 00:00:00', NULL, '67', '97', 'NONE', 'ONBOARDING_1', '2025-07-31 07:42:09', 'ccceee00004@163.com');
INSERT INTO `hrv` VALUES (19, '2025-07-31 00:00:00', '12372158', '2025-07-30 17:59:41', '2025-07-31 02:29:44', '2025-07-31 01:59:41', '2025-07-31 10:29:44', '2025-07-30 17:59:41', '2025-07-31 02:31:41', '2025-07-31 01:59:41', '2025-07-31 10:31:41', '2025-07-31 00:00:00', NULL, '90', '138', 'NONE', 'ONBOARDING_1', '2025-07-31 07:42:22', 'ccceee00004@163.com');
INSERT INTO `hrv` VALUES (20, '2025-08-01 00:00:00', '12372158', '2025-07-31 19:53:44', '2025-08-01 02:34:43', '2025-08-01 03:53:44', '2025-08-01 10:34:43', '2025-07-31 19:53:44', '2025-08-01 02:38:44', '2025-08-01 03:53:44', '2025-08-01 10:38:44', '2025-08-01 00:00:00', NULL, '65', '90', 'NONE', 'ONBOARDING_1', '2025-08-01 06:21:53', 'ccceee00004@163.com');
INSERT INTO `hrv` VALUES (21, '2025-08-03 00:00:00', '12372158', '2025-08-02 22:38:42', '2025-08-03 03:57:33', '2025-08-03 06:38:42', '2025-08-03 11:57:33', '2025-08-02 22:38:42', '2025-08-03 04:01:42', '2025-08-03 06:38:42', '2025-08-03 12:01:42', '2025-08-03 00:00:00', '68', '54', '72', 'NONE', 'ONBOARDING_1', '2025-08-03 08:35:46', 'ccceee00004@163.com');
INSERT INTO `hrv` VALUES (22, '2025-08-04 00:00:00', '12372158', '2025-08-03 19:03:40', '2025-08-04 04:12:33', '2025-08-04 03:03:40', '2025-08-04 12:12:33', '2025-08-03 19:03:40', '2025-08-04 04:13:40', '2025-08-04 03:03:40', '2025-08-04 12:13:40', '2025-08-04 00:00:00', '65', '54', '82', 'NONE', 'ONBOARDING_1', '2025-08-06 05:05:19', 'ccceee00004@163.com');
INSERT INTO `hrv` VALUES (23, '2025-08-05 00:00:00', '12372158', '2025-08-04 20:16:33', '2025-08-05 04:52:33', '2025-08-05 04:16:33', '2025-08-05 12:52:33', '2025-08-04 20:16:33', '2025-08-05 04:53:33', '2025-08-05 04:16:33', '2025-08-05 12:53:33', '2025-08-05 00:00:00', '62', '51', '79', 'NONE', 'ONBOARDING_1', '2025-08-06 05:05:27', 'ccceee00004@163.com');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用于管理后台管理端的用户，通过邀请码注册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invition_code
-- ----------------------------
INSERT INTO `invition_code` VALUES (2, 2, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (3, 3, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (4, 4, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (5, 171, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (6, 180, NULL, NULL, NULL, 1);
INSERT INTO `invition_code` VALUES (7, 181, NULL, NULL, NULL, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '西北工业大学用户信息' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phq9
-- ----------------------------

-- ----------------------------
-- Table structure for respiration
-- ----------------------------
DROP TABLE IF EXISTS `respiration`;
CREATE TABLE `respiration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfilePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `startTimestampLocal` datetime NULL DEFAULT NULL,
  `endTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `tomorrowSleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `tomorrowSleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `tomorrowSleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `tomorrowSleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `lowestRespirationValue` int NULL DEFAULT NULL,
  `highestRespirationValue` int NULL DEFAULT NULL,
  `avgWakingRespirationValue` int NULL DEFAULT NULL,
  `avgSleepRespirationValue` int NULL DEFAULT NULL,
  `avgTomorrowSleepRespirationValue` int NULL DEFAULT NULL,
  `respirationVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of respiration
-- ----------------------------
INSERT INTO `respiration` VALUES (28, '2025-07-30 00:00:00', '12372158', '2025-07-30 00:00:00', '2025-07-29 16:00:00', '2025-07-30 16:00:00', '2025-07-30 00:00:00', '2025-07-31 00:00:00', '2025-07-29 20:15:36', '2025-07-30 04:34:36', '2025-07-30 04:15:36', '2025-07-30 12:34:36', '2025-07-30 17:59:41', '2025-07-31 02:31:41', '2025-07-31 01:59:41', '2025-07-31 10:31:41', 6, 22, 14, 15, 15, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (29, '2025-07-31 00:00:00', '12372158', '2025-07-31 00:00:00', '2025-07-30 16:00:00', '2025-07-31 16:00:00', '2025-07-31 00:00:00', '2025-08-01 00:00:00', '2025-07-30 17:59:41', '2025-07-31 02:31:41', '2025-07-31 01:59:41', '2025-07-31 10:31:41', '2025-07-31 19:53:44', '2025-08-01 02:38:44', '2025-08-01 03:53:44', '2025-08-01 10:38:44', 7, 23, 14, 15, 14, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (30, '2025-08-01 00:00:00', '12372158', '2025-08-01 00:00:00', '2025-07-31 16:00:00', '2025-08-01 16:00:00', '2025-08-01 00:00:00', '2025-08-02 00:00:00', '2025-07-31 19:53:44', '2025-08-01 02:38:44', '2025-08-01 03:53:44', '2025-08-01 10:38:44', NULL, NULL, NULL, NULL, 7, 21, 15, 14, NULL, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (31, '2025-08-02 00:00:00', '12372158', '2025-08-02 00:00:00', '2025-08-01 16:00:00', '2025-08-02 16:00:00', '2025-08-02 00:00:00', '2025-08-03 00:00:00', NULL, NULL, NULL, NULL, '2025-08-02 22:38:42', '2025-08-03 04:01:42', '2025-08-03 06:38:42', '2025-08-03 12:01:42', 9, 24, 16, NULL, 15, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (32, '2025-08-03 00:00:00', '12372158', '2025-08-03 00:00:00', '2025-08-02 16:00:00', '2025-08-03 16:00:00', '2025-08-03 00:00:00', '2025-08-04 00:00:00', '2025-08-02 22:38:42', '2025-08-03 04:01:42', '2025-08-03 06:38:42', '2025-08-03 12:01:42', '2025-08-03 19:03:40', '2025-08-04 04:13:40', '2025-08-04 03:03:40', '2025-08-04 12:13:40', 8, 23, 15, 15, 15, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (33, '2025-08-04 00:00:00', '12372158', '2025-08-04 00:00:00', '2025-08-03 16:00:00', '2025-08-04 16:00:00', '2025-08-04 00:00:00', '2025-08-05 00:00:00', '2025-08-03 19:03:40', '2025-08-04 04:13:40', '2025-08-04 03:03:40', '2025-08-04 12:13:40', '2025-08-04 20:16:33', '2025-08-05 04:53:33', '2025-08-05 04:16:33', '2025-08-05 12:53:33', 8, 24, 16, 15, 16, '200', 'ccceee00004@163.com');
INSERT INTO `respiration` VALUES (34, '2025-08-05 00:00:00', '12372158', '2025-08-05 00:00:00', '2025-08-04 16:00:00', '2025-08-05 16:00:00', '2025-08-05 00:00:00', '2025-08-06 00:00:00', '2025-08-04 20:16:33', '2025-08-05 04:53:33', '2025-08-05 04:16:33', '2025-08-05 12:53:33', '2025-08-05 21:16:33', '2025-08-06 02:52:33', '2025-08-06 05:16:33', '2025-08-06 10:52:33', 8, 26, 16, 16, 15, '200', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for resting_heart_rate
-- ----------------------------
DROP TABLE IF EXISTS `resting_heart_rate`;
CREATE TABLE `resting_heart_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfileId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `statisticsStartDate` datetime NULL DEFAULT NULL,
  `statisticsEndDate` datetime NULL DEFAULT NULL,
  `value` int NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resting_heart_rate
-- ----------------------------
INSERT INTO `resting_heart_rate` VALUES (28, '2025-07-30 00:00:00', '12372158', '2025-07-30 00:00:00', '2025-07-30 00:00:00', 53, '2025-07-30 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (29, '2025-07-31 00:00:00', '12372158', '2025-07-31 00:00:00', '2025-07-31 00:00:00', 46, '2025-07-31 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (30, '2025-08-01 00:00:00', '12372158', '2025-08-01 00:00:00', '2025-08-01 00:00:00', 51, '2025-08-01 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (31, '2025-08-02 00:00:00', '12372158', '2025-08-02 00:00:00', '2025-08-02 00:00:00', 56, '2025-08-02 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (32, '2025-08-03 00:00:00', '12372158', '2025-08-03 00:00:00', '2025-08-03 00:00:00', 55, '2025-08-03 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (33, '2025-08-04 00:00:00', '12372158', '2025-08-04 00:00:00', '2025-08-04 00:00:00', 53, '2025-08-04 00:00:00', 'ccceee00004@163.com');
INSERT INTO `resting_heart_rate` VALUES (34, '2025-08-05 00:00:00', '12372158', '2025-08-05 00:00:00', '2025-08-05 00:00:00', 56, '2025-08-05 00:00:00', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `role` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户角色，‘user’，‘doctor’，‘admin’',
  `permission` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户权限（暂时用不到），‘normal’，‘vip’',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '这一部分设计是为了后端结合shiro框架，更好地进行权限控制' ROW_FORMAT = DYNAMIC;

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
-- Table structure for sleep
-- ----------------------------
DROP TABLE IF EXISTS `sleep`;
CREATE TABLE `sleep`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleep_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userProfilePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `sleepTimeSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `napTimeSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepWindowConfirmed` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepWindowConfirmationType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `autoSleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `autoSleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepQualityTypePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepResultTypePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unmeasurableSleepSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deepSleepSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lightSleepSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remSleepSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `awakeSleepSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deviceRemCapable` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `retro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepFromDevice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `averageSpO2Value` int NULL DEFAULT NULL,
  `lowestSpO2Value` int NULL DEFAULT NULL,
  `highestSpO2Value` int NULL DEFAULT NULL,
  `averageSpO2HRSleep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `averageRespirationValue` int NULL DEFAULT NULL,
  `lowestRespirationValue` int NULL DEFAULT NULL,
  `highestRespirationValue` int NULL DEFAULT NULL,
  `awakeCount` int NULL DEFAULT NULL,
  `avgSleepStress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ageGroup` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepScoreFeedback` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepScoreInsight` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepScorePersonalizedInsight` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `breathingDisruptionSeverity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restlessMomentsCount` int NULL DEFAULT NULL,
  `respirationVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avgOvernightHrv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hrvStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryChange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remSleepDataExists` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleep_score_overall` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sleep
-- ----------------------------
INSERT INTO `sleep` VALUES (1, '2025-07-30 00:00:00', 'ccceee00004@163.com', '1753820136000', '12372158', '2025-07-30 00:00:00', '7h51min', '0min', 'True', 'enhanced_confirmed_final', '2025-07-30 04:15:36', '2025-07-30 12:34:36', '2025-07-30 12:15:36', '2025-07-30 20:34:36', NULL, NULL, NULL, NULL, '0min', '36min', '6h23min', '52min', '28min', 'True', 'False', 'True', 90, 83, 99, '57.0', 15, 11, 20, 2, '11.0', 'ADULT', 'POSITIVE_LONG_AND_RECOVERING', 'POSITIVE_LATE_BED_TIME', 'STRESS_POS_FAIR_OR_POOR_SLEEP_RESTFUL_EVENING', '2', 'LOW', 52, '200', '67.0', 'NONE', '81', '53', 'True', '79');
INSERT INTO `sleep` VALUES (2, '2025-07-31 00:00:00', 'ccceee00004@163.com', '1753898381000', '12372158', '2025-07-31 00:00:00', '8h15min', '0min', 'True', 'enhanced_confirmed_final', '2025-07-31 01:59:41', '2025-07-31 10:31:41', '2025-07-31 09:59:41', '2025-07-31 18:31:41', NULL, NULL, NULL, NULL, '0min', '1h26min', '4h48min', '2h1min', '17min', 'True', 'False', 'True', 90, 83, 100, '54.0', 15, 11, 21, 1, '9.0', 'ADULT', 'POSITIVE_HIGHLY_RECOVERING', 'NONE', 'GENERAL_POS_EXCELLENT_OR_GOOD_SLEEP', '2', 'LOW', 36, '200', '90.0', 'NONE', '78', '46', 'True', '95');
INSERT INTO `sleep` VALUES (3, '2025-08-01 00:00:00', 'ccceee00004@163.com', '1753991624000', '12372158', '2025-08-01 00:00:00', '6h44min', '0min', 'True', 'enhanced_confirmed_final', '2025-08-01 03:53:44', '2025-08-01 10:38:44', '2025-08-01 11:53:44', '2025-08-01 18:38:44', NULL, NULL, NULL, NULL, '0min', '2h6min', '3h7min', '1h31min', '1min', 'True', 'False', 'True', NULL, NULL, NULL, NULL, 14, 11, 18, 0, '15.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_LATE_BED_TIME', 'STRESS_POS_EXCELLENT_OR_GOOD_SLEEP_RESTFUL_EVENING', '2', NULL, 29, '200', '65.0', 'NONE', '61', '51', 'True', '82');
INSERT INTO `sleep` VALUES (4, '2025-08-02 00:00:00', 'ccceee00004@163.com', NULL, '12372158', '2025-08-02 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'False', 'False', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'True', NULL);
INSERT INTO `sleep` VALUES (5, '2025-08-03 00:00:00', 'ccceee00004@163.com', '1754174322000', '12372158', '2025-08-03 00:00:00', '5h10min', '0min', 'True', 'enhanced_confirmed_final', '2025-08-03 06:38:42', '2025-08-03 12:01:42', '2025-08-03 14:38:42', '2025-08-03 20:01:42', NULL, NULL, NULL, NULL, '0min', '1h17min', '3h15min', '38min', '13min', 'True', 'False', 'True', 87, 80, 95, '59.0', 15, 11, 18, 1, '15.0', 'ADULT', 'POSITIVE_SHORT_BUT_DEEP', 'NONE', 'STRESS_POS_FAIR_OR_POOR_SLEEP_RESTFUL_DAY', '2', 'LOW', 16, '200', '54.0', 'NONE', '53', '55', 'True', '65');
INSERT INTO `sleep` VALUES (6, '2025-08-04 00:00:00', 'ccceee00004@163.com', '1754247820000', '12372158', '2025-08-04 00:00:00', '8h33min', '0min', 'True', 'enhanced_confirmed_final', '2025-08-04 03:03:40', '2025-08-04 12:13:40', '2025-08-04 11:03:40', '2025-08-04 20:13:40', NULL, NULL, NULL, NULL, '0min', '2h9min', '4h27min', '1h57min', '37min', 'True', 'False', 'True', 88, 77, 99, '59.0', 15, 10, 20, 3, '17.0', 'ADULT', 'POSITIVE_LONG_AND_DEEP', 'NONE', 'GENERAL_POS_EXCELLENT_OR_GOOD_SLEEP', '2', 'LOW', 28, '200', '54.0', 'NONE', '75', '53', 'True', '83');
INSERT INTO `sleep` VALUES (7, '2025-08-05 00:00:00', 'ccceee00004@163.com', '1754338593000', '12372158', '2025-08-05 00:00:00', '6h21min', '2h', 'True', 'enhanced_confirmed_final', '2025-08-05 04:16:33', '2025-08-05 12:53:33', '2025-08-05 12:16:33', '2025-08-05 20:53:33', NULL, NULL, NULL, NULL, '0min', '1h51min', '3h29min', '1h1min', '2h16min', 'True', 'False', 'True', 89, 78, 99, '61.0', 16, 9, 20, 2, '19.0', 'ADULT', 'NEGATIVE_DISCONTINUOUS', 'NONE', 'MOD_EXERCISE_NEG_FAIR_OR_POOR_SLEEP_INACTIVITY', '2', 'LOW', 25, '200', '51.0', 'NONE', '45', '56', 'True', '65');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '随时说文件地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of speak_anytime
-- ----------------------------

-- ----------------------------
-- Table structure for spo2
-- ----------------------------
DROP TABLE IF EXISTS `spo2`;
CREATE TABLE `spo2`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfilePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `startTimestampLocal` datetime NULL DEFAULT NULL,
  `endTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `sleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `sleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `tomorrowSleepStartTimestampGMT` datetime NULL DEFAULT NULL,
  `tomorrowSleepEndTimestampGMT` datetime NULL DEFAULT NULL,
  `tomorrowSleepStartTimestampLocal` datetime NULL DEFAULT NULL,
  `tomorrowSleepEndTimestampLocal` datetime NULL DEFAULT NULL,
  `averageSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowestSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSevenDaysAvgSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpO2TimestampGMT` datetime NULL DEFAULT NULL,
  `latestSpO2TimestampLocal` datetime NULL DEFAULT NULL,
  `avgSleepSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avgTomorrowSleepSpO2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spO2SingleValues` int NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spo2
-- ----------------------------
INSERT INTO `spo2` VALUES (28, '2025-07-30 00:00:00', '12372158', '2025-07-30 00:00:00', '2025-07-29 16:00:00', '2025-07-30 16:00:00', '2025-07-30 00:00:00', '2025-07-31 00:00:00', '2025-07-29 20:15:36', '2025-07-30 04:34:36', '2025-07-30 04:15:36', '2025-07-30 12:34:36', '2025-07-30 17:59:41', '2025-07-31 02:31:41', '2025-07-31 01:59:41', '2025-07-31 10:31:41', '90.0', '83', '90.0', '84', '2025-07-30 16:00:00', '2025-07-31 00:00:00', '90.0', '90.0', NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (29, '2025-07-31 00:00:00', '12372158', '2025-07-31 00:00:00', '2025-07-30 16:00:00', '2025-07-31 16:00:00', '2025-07-31 00:00:00', '2025-08-01 00:00:00', '2025-07-30 17:59:41', '2025-07-31 02:31:41', '2025-07-31 01:59:41', '2025-07-31 10:31:41', '2025-07-31 19:53:44', '2025-08-01 02:38:44', '2025-08-01 03:53:44', '2025-08-01 10:38:44', '89.0', '83', '89.66666666666667', '88', '2025-07-31 13:40:00', '2025-07-31 21:40:00', '90.0', NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (30, '2025-08-01 00:00:00', '12372158', '2025-08-01 00:00:00', '2025-07-31 16:00:00', '2025-08-01 16:00:00', '2025-08-01 00:00:00', '2025-08-02 00:00:00', '2025-07-31 19:53:44', '2025-08-01 02:38:44', '2025-08-01 03:53:44', '2025-08-01 10:38:44', NULL, NULL, NULL, NULL, '92.0', '87', '90.25', '91', '2025-07-31 19:07:00', '2025-08-01 03:07:00', NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (31, '2025-08-02 00:00:00', '12372158', '2025-08-02 00:00:00', '2025-08-01 16:00:00', '2025-08-02 16:00:00', '2025-08-02 00:00:00', '2025-08-03 00:00:00', NULL, NULL, NULL, NULL, '2025-08-02 22:38:42', '2025-08-03 04:01:42', '2025-08-03 06:38:42', '2025-08-03 12:01:42', '88.0', '88', '89.8', '88', '2025-08-02 15:59:00', '2025-08-02 23:59:00', NULL, '87.0', NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (32, '2025-08-03 00:00:00', '12372158', '2025-08-03 00:00:00', '2025-08-02 16:00:00', '2025-08-03 16:00:00', '2025-08-03 00:00:00', '2025-08-04 00:00:00', '2025-08-02 22:38:42', '2025-08-03 04:01:42', '2025-08-03 06:38:42', '2025-08-03 12:01:42', '2025-08-03 19:03:40', '2025-08-04 04:13:40', '2025-08-04 03:03:40', '2025-08-04 12:13:40', '87.0', '79', '89.33333333333333', '86', '2025-08-03 16:00:00', '2025-08-04 00:00:00', '87.0', '88.0', NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (33, '2025-08-04 00:00:00', '12372158', '2025-08-04 00:00:00', '2025-08-03 16:00:00', '2025-08-04 16:00:00', '2025-08-04 00:00:00', '2025-08-05 00:00:00', '2025-08-03 19:03:40', '2025-08-04 04:13:40', '2025-08-04 03:03:40', '2025-08-04 12:13:40', '2025-08-04 20:16:33', '2025-08-05 04:53:33', '2025-08-05 04:16:33', '2025-08-05 12:53:33', '89.0', '77', '89.28571428571429', '90', '2025-08-04 16:00:00', '2025-08-05 00:00:00', '88.0', '89.0', NULL, 'ccceee00004@163.com');
INSERT INTO `spo2` VALUES (34, '2025-08-05 00:00:00', '12372158', '2025-08-05 00:00:00', '2025-08-04 16:00:00', '2025-08-05 16:00:00', '2025-08-05 00:00:00', '2025-08-06 00:00:00', '2025-08-04 20:16:33', '2025-08-05 04:53:33', '2025-08-05 04:16:33', '2025-08-05 12:53:33', '2025-08-05 21:16:33', '2025-08-06 02:52:33', '2025-08-06 05:16:33', '2025-08-06 10:52:33', '89.0', '78', '89.14285714285714', '92', '2025-08-05 14:03:00', '2025-08-05 22:03:00', '89.0', '91.0', NULL, 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for stats_body_composition
-- ----------------------------
DROP TABLE IF EXISTS `stats_body_composition`;
CREATE TABLE `stats_body_composition`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `userProfileId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalKilocalories` float NULL DEFAULT NULL,
  `activeKilocalories` float NULL DEFAULT NULL,
  `bmrKilocalories` float NULL DEFAULT NULL,
  `wellnessKilocalories` float NULL DEFAULT NULL,
  `burnedKilocalories` float NULL DEFAULT NULL,
  `consumedKilocalories` float NULL DEFAULT NULL,
  `remainingKilocalories` float NULL DEFAULT NULL,
  `totalSteps` int NULL DEFAULT NULL,
  `netCalorieGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalDistanceMeters` float NULL DEFAULT NULL,
  `wellnessDistanceMeters` float NULL DEFAULT NULL,
  `wellnessActiveKilocalories` float NULL DEFAULT NULL,
  `netRemainingKilocalories` float NULL DEFAULT NULL,
  `userDailySummaryId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `rule_typeId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rule_typeKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dailyStepGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `wellnessStartTimeGmt` datetime NULL DEFAULT NULL,
  `wellnessStartTimeLocal` datetime NULL DEFAULT NULL,
  `wellnessEndTimeGmt` datetime NULL DEFAULT NULL,
  `wellnessEndTimeLocal` datetime NULL DEFAULT NULL,
  `durationInMilliseconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `wellnessDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highlyActiveSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activeSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sedentarySeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleepingSeconds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesWellnessData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesActivityData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `includesCalorieConsumedData` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `privacyProtected` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `moderateIntensityMinutes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vigorousIntensityMinutes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsAscendedInMeters` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsDescendedInMeters` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsAscended` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `floorsDescended` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `intensityMinutesGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userFloorsAscendedGoal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `minHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSevenDaysAvgRestingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `averageStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uncategorizedStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mediumStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highStressDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uncategorizedStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mediumStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `highStressPercentage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressQualifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `measurableAwakeDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `measurableAsleepDuration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastSyncTimestampGMT` datetime NULL DEFAULT NULL,
  `minAvgHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `maxAvgHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryChargedValue` int NULL DEFAULT NULL,
  `bodyBatteryDrainedValue` int NULL DEFAULT NULL,
  `bodyBatteryHighestValue` int NULL DEFAULT NULL,
  `bodyBatteryLowestValue` int NULL DEFAULT NULL,
  `bodyBatteryMostRecentValue` int NULL DEFAULT NULL,
  `bodyBatteryDuringSleep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryAtWakeTime` int NULL DEFAULT NULL,
  `bodyBatteryVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `abnormalHeartRateAlertsCount` int NULL DEFAULT NULL,
  `averageSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lowestSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpo2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latestSpo2ReadingTimeGmt` datetime NULL DEFAULT NULL,
  `latestSpo2ReadingTimeLocal` datetime NULL DEFAULT NULL,
  `averageMonitoringEnvironmentAltitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingCaloriesFromActivity` float NULL DEFAULT NULL,
  `bodyBatteryDynamicFeedbackEvent_eventTimestampGmt` datetime NULL DEFAULT NULL,
  `bodyBatteryDynamicFeedbackEvent_bodyBatteryLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryDynamicFeedbackEvent_feedbackShortType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryDynamicFeedbackEvent_feedbackLongType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `endOfDayBodyBatteryDynamicFeedbackEvent_eventTimestampGmt` datetime NULL DEFAULT NULL,
  `endOfDayBodyBatteryDynamicFeedbackEvent_bodyBatteryLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `endOfDayBodyBatteryDynamicFeedbackEvent_feedbackShortType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `endOfDayBodyBatteryDynamicFeedbackEvent_feedbackLongType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avgWakingRespirationValue` int NULL DEFAULT NULL,
  `highestRespirationValue` int NULL DEFAULT NULL,
  `lowestRespirationValue` int NULL DEFAULT NULL,
  `latestRespirationValue` int NULL DEFAULT NULL,
  `latestRespirationTimeGMT` datetime NULL DEFAULT NULL,
  `respirationAlgorithmVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `until` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bmi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyFat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyWater` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `boneMass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `muscleMass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `physiqueRating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visceralFat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `metabolicAge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stats_body_composition
-- ----------------------------
INSERT INTO `stats_body_composition` VALUES (28, '2025-07-30 00:00:00', '12372158', 1625, 88, 1537, 1625, NULL, NULL, NULL, 3275, NULL, 2358, 2358, 88, 88, '12372158', '2025-07-30 00:00:00', '2', 'private', 'fce1be8154814f79ae67b7d0b74f1f38', '4720', '2025-07-29 16:00:00', '2025-07-30 00:00:00', '2025-07-30 16:00:00', '2025-07-31 00:00:00', '24h', NULL, '40min', '18min', '14h41min', '8h19min', 'True', 'False', 'False', 'False', '1', '2', NULL, NULL, NULL, NULL, '150', '10', '49', '141', '53', '53', 'GARMIN', '26', '88', '6h56min', '14h39min', '2h14min', '5min', '23h54min', '3h34min', '2h25min', '57min', '29.01', '61.3', '9.34', '0.35', '14.92', '10.11', '3.97', 'BALANCED', '15h30min', '8h19min', NULL, '49', '131', 93, 73, 97, 6, 28, '81', 97, '3.0', NULL, '90.0', '83', '84', '2025-07-30 16:00:00', '2025-07-31 00:00:00', NULL, NULL, '2025-07-30 15:28:45', 'MODERATE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', '2025-07-29 21:15:54', 'HIGH', 'SLEEP_TIME_PASSED_RECOVERING_AND_INACTIVE', 'SLEEP_TIME_PASSED_RECOVERING_AND_INACTIVE', 14, 22, 6, 18, '2025-07-30 16:00:00', '200', '2025-07-30T00:00:00+00:00', '2025-07-30T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (29, '2025-07-31 00:00:00', '12372158', 1597, 60, 1537, 1597, NULL, NULL, NULL, 3272, NULL, 2316, 2316, 60, 60, '12372158', '2025-07-31 00:00:00', '2', 'private', 'c22987825b2241d7986c13da6944f1e4', '4440', '2025-07-30 16:00:00', '2025-07-31 00:00:00', '2025-07-31 16:00:00', '2025-08-01 00:00:00', '24h', NULL, '33min', '20min', '14h34min', '8h32min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '44', '120', '46', '52', 'GARMIN', '34', '95', '11h54min', '9h2min', '1h30min', '1h23min', '23h49min', '5h57min', '3h29min', '2h28min', '49.97', '37.93', '6.3', '5.81', '24.98', '14.63', '10.36', 'STRESSFUL', '13h54min', '8h32min', NULL, '45', '118', 79, 78, 100, 21, 29, '79', 100, '3.0', NULL, '89.0', '83', '88', '2025-07-31 13:40:00', '2025-07-31 21:40:00', NULL, NULL, '2025-07-31 15:05:00', 'MODERATE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', '2025-07-30 19:13:57', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 14, 23, 7, 10, '2025-07-31 14:36:00', '200', '2025-07-31T00:00:00+00:00', '2025-07-31T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (30, '2025-08-01 00:00:00', '12372158', 1606, 69, 1537, 1606, NULL, NULL, NULL, 4204, NULL, 2999, 2999, 69, 69, '12372158', '2025-08-01 00:00:00', '2', 'private', '878c71baa5f0412198f19867b61e2357', '4210', '2025-07-31 16:00:00', '2025-08-01 00:00:00', '2025-08-01 16:00:00', '2025-08-02 00:00:00', '24h', NULL, '52min', '27min', '15h55min', '6h45min', 'True', 'False', 'False', 'False', '0', '1', NULL, NULL, NULL, NULL, '150', '10', '48', '116', '51', '53', 'GARMIN', '31', '90', '10h7min', '10h15min', '2h31min', '59min', '23h52min', '6h33min', '3h7min', '27min', '42.39', '42.95', '10.54', '4.12', '27.44', '13.06', '1.89', 'BALANCED', '16h8min', '6h45min', NULL, '49', '98', 63, 67, 87, 24, 25, '61', 87, '3.0', NULL, '92.0', '87', '91', '2025-07-31 19:07:00', '2025-08-01 03:07:00', NULL, NULL, '2025-08-01 15:05:00', 'MODERATE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', '2025-07-31 19:26:20', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 15, 21, 7, 15, '2025-08-01 16:00:00', '200', '2025-08-01T00:00:00+00:00', '2025-08-01T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (31, '2025-08-02 00:00:00', '12372158', 1577, 40, 1537, 1577, NULL, NULL, NULL, 1292, NULL, 926, 926, 40, 40, '12372158', '2025-08-02 00:00:00', '2', 'private', '2479f5c0e93646919da681bc79290956', '4210', '2025-08-01 16:00:00', '2025-08-02 00:00:00', '2025-08-02 16:00:00', '2025-08-03 00:00:00', '24h', NULL, '36min', '9min', '23h14min', '0min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '56', '106', '56', '53', 'GARMIN', '53', '92', '10h58min', '1h24min', '1h59min', '1h8min', '15h29min', '3h28min', '6h14min', '1h16min', '70.83', '9.04', '12.81', '7.32', '22.39', '40.26', '8.18', 'STRESSFUL_AWAKE', '14h21min', '0min', NULL, '56', '100', 30, 36, 35, 5, 19, NULL, NULL, '3.0', NULL, '88.0', '88', '88', '2025-08-02 15:59:00', '2025-08-02 23:59:00', NULL, NULL, '2025-08-02 15:05:01', 'MODERATE', 'NO_DATA', 'NO_DATA', '2025-08-01 22:37:16', 'LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 24, 9, 17, '2025-08-02 15:59:00', '200', '2025-08-02T00:00:00+00:00', '2025-08-02T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (32, '2025-08-03 00:00:00', '12372158', 1603, 66, 1537, 1603, NULL, NULL, NULL, 3592, NULL, 2566, 2566, 66, 66, '12372158', '2025-08-03 00:00:00', '2', 'private', '941de9c2d2f34827b06d071861dda555', '3630', '2025-08-02 16:00:00', '2025-08-03 00:00:00', '2025-08-03 16:00:00', '2025-08-04 00:00:00', '24h', NULL, '37min', '27min', '17h32min', '5h23min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '51', '107', '55', '53', 'GARMIN', '36', '96', '11h25min', '9h38min', '2h36min', '10min', '23h49min', '5h29min', '4h19min', '1h37min', '47.94', '40.45', '10.92', '0.7', '23.02', '18.12', '6.79', 'BALANCED', '18h16min', '5h23min', NULL, '53', '107', 60, 69, 72, 10, 10, '53', 72, '3.0', NULL, '87.0', '79', '86', '2025-08-03 16:00:00', '2025-08-04 00:00:00', NULL, NULL, '2025-08-03 15:05:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-08-02 23:31:23', 'HIGH', 'SLEEP_TIME_PASSED_RECOVERING_AND_INACTIVE', 'SLEEP_TIME_PASSED_RECOVERING_AND_INACTIVE', 15, 23, 8, 14, '2025-08-03 16:00:00', '200', '2025-08-03T00:00:00+00:00', '2025-08-03T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (33, '2025-08-04 00:00:00', '12372158', 1579, 42, 1537, 1579, NULL, NULL, NULL, 2049, NULL, 1477, 1477, 42, 42, '12372158', '2025-08-04 00:00:00', '2', 'private', 'c137ad7b48f841789fb33a42901bd115', '3630', '2025-08-03 16:00:00', '2025-08-04 00:00:00', '2025-08-04 16:00:00', '2025-08-05 00:00:00', '24h', NULL, '21min', '24min', '14h4min', '9h10min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '49', '111', '53', '53', 'GARMIN', '33', '92', '12h8min', '9h40min', '2h5min', '4min', '23h57min', '7h57min', '3h31min', '40min', '50.66', '40.36', '8.7', '0.28', '33.19', '14.68', '2.78', 'STRESSFUL', '14h44min', '9h9min', NULL, '50', '105', 75, 62, 80, 5, 23, '75', 80, '3.0', NULL, '89.0', '77', '90', '2025-08-04 16:00:00', '2025-08-05 00:00:00', NULL, NULL, '2025-08-04 15:55:46', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-08-03 21:55:24', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 16, 24, 8, 21, '2025-08-04 16:00:00', '200', '2025-08-04T00:00:00+00:00', '2025-08-04T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');
INSERT INTO `stats_body_composition` VALUES (34, '2025-08-05 00:00:00', '12372158', 1578, 41, 1537, 1578, NULL, NULL, NULL, 1499, NULL, 1063, 1063, 41, 41, '12372158', '2025-08-05 00:00:00', '2', 'private', '179c9d12f2b4478cb9986f48920e50d2', '3320', '2025-08-04 16:00:00', '2025-08-05 00:00:00', '2025-08-05 16:00:00', '2025-08-06 00:00:00', '24h', NULL, '13min', '16min', '12h53min', '10h37min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '52', '114', '56', '53', 'GARMIN', '30', '93', '8h28min', '11h46min', '1h50min', '1h55min', '23h59min', '5h57min', '1h26min', '1h5min', '35.3', '49.06', '7.64', '7.99', '24.81', '5.98', '4.52', 'BALANCED', '13h27min', '8h37min', NULL, '53', '112', 53, 56, 67, 19, 20, '45', 64, '3.0', NULL, '89.0', '78', '92', '2025-08-05 14:03:00', '2025-08-05 22:03:00', NULL, NULL, '2025-08-05 15:05:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-08-04 21:29:47', 'HIGH', 'SLEEP_TIME_PASSED_BALANCED_AND_INACTIVE', 'SLEEP_TIME_PASSED_BALANCED_AND_INACTIVE', 16, 26, 8, 18, '2025-08-05 14:03:00', '200', '2025-08-05T00:00:00+00:00', '2025-08-05T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for steps
-- ----------------------------
DROP TABLE IF EXISTS `steps`;
CREATE TABLE `steps`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
  `startGMT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `endGMT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `steps` int NULL DEFAULT NULL,
  `pushes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `primaryActivityLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `activityLevelConstant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC, `startGMT` ASC, `endGMT` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5034 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of steps
-- ----------------------------
INSERT INTO `steps` VALUES (1001, '2025-03-17 00:00:00', '2025-03-17T02:00:00.0', '2025-03-17T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1002, '2025-03-17 00:00:00', '2025-03-17T02:15:00.0', '2025-03-17T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1003, '2025-03-17 00:00:00', '2025-03-17T02:30:00.0', '2025-03-17T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1004, '2025-03-17 00:00:00', '2025-03-17T02:45:00.0', '2025-03-17T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1005, '2025-03-17 00:00:00', '2025-03-17T03:00:00.0', '2025-03-17T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1006, '2025-03-17 00:00:00', '2025-03-17T03:15:00.0', '2025-03-17T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1007, '2025-03-17 00:00:00', '2025-03-17T03:30:00.0', '2025-03-17T03:45:00.0', 44, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1008, '2025-03-17 00:00:00', '2025-03-17T03:45:00.0', '2025-03-17T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1009, '2025-03-17 00:00:00', '2025-03-17T04:00:00.0', '2025-03-17T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1010, '2025-03-17 00:00:00', '2025-03-17T04:15:00.0', '2025-03-17T04:30:00.0', 415, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1011, '2025-03-17 00:00:00', '2025-03-17T04:30:00.0', '2025-03-17T04:45:00.0', 1557, '0', 'highlyActive', 'True', NULL);
INSERT INTO `steps` VALUES (1012, '2025-03-17 00:00:00', '2025-03-17T04:45:00.0', '2025-03-17T05:00:00.0', 61, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1013, '2025-03-17 00:00:00', '2025-03-17T05:00:00.0', '2025-03-17T05:15:00.0', 1020, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1014, '2025-03-17 00:00:00', '2025-03-17T05:15:00.0', '2025-03-17T05:30:00.0', 27, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1015, '2025-03-17 00:00:00', '2025-03-17T05:30:00.0', '2025-03-17T05:45:00.0', 31, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1016, '2025-03-17 00:00:00', '2025-03-17T05:45:00.0', '2025-03-17T06:00:00.0', 473, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1017, '2025-03-17 00:00:00', '2025-03-17T06:00:00.0', '2025-03-17T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1018, '2025-03-17 00:00:00', '2025-03-17T06:15:00.0', '2025-03-17T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1019, '2025-03-17 00:00:00', '2025-03-17T06:30:00.0', '2025-03-17T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1020, '2025-03-17 00:00:00', '2025-03-17T06:45:00.0', '2025-03-17T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1021, '2025-03-17 00:00:00', '2025-03-17T07:00:00.0', '2025-03-17T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1022, '2025-03-17 00:00:00', '2025-03-17T07:15:00.0', '2025-03-17T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1023, '2025-03-17 00:00:00', '2025-03-17T07:30:00.0', '2025-03-17T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1024, '2025-03-17 00:00:00', '2025-03-17T07:45:00.0', '2025-03-17T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1025, '2025-03-17 00:00:00', '2025-03-17T08:00:00.0', '2025-03-17T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1026, '2025-03-17 00:00:00', '2025-03-17T08:15:00.0', '2025-03-17T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1027, '2025-03-17 00:00:00', '2025-03-17T08:30:00.0', '2025-03-17T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1028, '2025-03-17 00:00:00', '2025-03-17T08:45:00.0', '2025-03-17T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1029, '2025-03-17 00:00:00', '2025-03-17T09:00:00.0', '2025-03-17T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1030, '2025-03-17 00:00:00', '2025-03-17T09:15:00.0', '2025-03-17T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1031, '2025-03-17 00:00:00', '2025-03-17T09:30:00.0', '2025-03-17T09:45:00.0', 569, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1032, '2025-03-17 00:00:00', '2025-03-17T09:45:00.0', '2025-03-17T10:00:00.0', 143, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1033, '2025-03-17 00:00:00', '2025-03-17T10:00:00.0', '2025-03-17T10:15:00.0', 125, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1034, '2025-03-17 00:00:00', '2025-03-17T10:15:00.0', '2025-03-17T10:30:00.0', 1175, '0', 'active', 'True', NULL);
INSERT INTO `steps` VALUES (1035, '2025-03-17 00:00:00', '2025-03-17T10:30:00.0', '2025-03-17T10:45:00.0', 1004, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1036, '2025-03-17 00:00:00', '2025-03-17T10:45:00.0', '2025-03-17T11:00:00.0', 298, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1037, '2025-03-17 00:00:00', '2025-03-17T11:00:00.0', '2025-03-17T11:15:00.0', 35, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1038, '2025-03-17 00:00:00', '2025-03-17T11:15:00.0', '2025-03-17T11:30:00.0', 135, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1039, '2025-03-17 00:00:00', '2025-03-17T11:30:00.0', '2025-03-17T11:45:00.0', 426, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1040, '2025-03-17 00:00:00', '2025-03-17T11:45:00.0', '2025-03-17T12:00:00.0', 255, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1041, '2025-03-17 00:00:00', '2025-03-17T12:00:00.0', '2025-03-17T12:15:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1042, '2025-03-17 00:00:00', '2025-03-17T12:15:00.0', '2025-03-17T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1043, '2025-03-17 00:00:00', '2025-03-17T12:30:00.0', '2025-03-17T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1044, '2025-03-17 00:00:00', '2025-03-17T12:45:00.0', '2025-03-17T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1045, '2025-03-17 00:00:00', '2025-03-17T13:00:00.0', '2025-03-17T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1046, '2025-03-17 00:00:00', '2025-03-17T13:15:00.0', '2025-03-17T13:30:00.0', 23, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1047, '2025-03-17 00:00:00', '2025-03-17T13:30:00.0', '2025-03-17T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1048, '2025-03-17 00:00:00', '2025-03-17T13:45:00.0', '2025-03-17T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1049, '2025-03-17 00:00:00', '2025-03-17T14:00:00.0', '2025-03-17T14:15:00.0', 88, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1050, '2025-03-17 00:00:00', '2025-03-17T14:15:00.0', '2025-03-17T14:30:00.0', 825, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1051, '2025-03-17 00:00:00', '2025-03-17T14:30:00.0', '2025-03-17T14:45:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1052, '2025-03-17 00:00:00', '2025-03-17T14:45:00.0', '2025-03-17T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1053, '2025-03-17 00:00:00', '2025-03-17T15:00:00.0', '2025-03-17T15:15:00.0', 161, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1054, '2025-03-17 00:00:00', '2025-03-17T15:15:00.0', '2025-03-17T15:30:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1055, '2025-03-17 00:00:00', '2025-03-17T15:30:00.0', '2025-03-17T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1056, '2025-03-17 00:00:00', '2025-03-17T15:45:00.0', '2025-03-17T16:00:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1057, '2025-03-18 00:00:00', '2025-03-17T16:00:00.0', '2025-03-17T16:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1058, '2025-03-18 00:00:00', '2025-03-17T16:15:00.0', '2025-03-17T16:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1059, '2025-03-18 00:00:00', '2025-03-17T16:30:00.0', '2025-03-17T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1060, '2025-03-18 00:00:00', '2025-03-17T16:45:00.0', '2025-03-17T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1061, '2025-03-18 00:00:00', '2025-03-17T17:00:00.0', '2025-03-17T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1062, '2025-03-18 00:00:00', '2025-03-17T17:15:00.0', '2025-03-17T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1063, '2025-03-18 00:00:00', '2025-03-17T17:30:00.0', '2025-03-17T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1064, '2025-03-18 00:00:00', '2025-03-17T17:45:00.0', '2025-03-17T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1065, '2025-03-18 00:00:00', '2025-03-17T18:00:00.0', '2025-03-17T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1066, '2025-03-18 00:00:00', '2025-03-17T18:15:00.0', '2025-03-17T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1067, '2025-03-18 00:00:00', '2025-03-17T18:30:00.0', '2025-03-17T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1068, '2025-03-18 00:00:00', '2025-03-17T18:45:00.0', '2025-03-17T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1069, '2025-03-18 00:00:00', '2025-03-17T19:00:00.0', '2025-03-17T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1070, '2025-03-18 00:00:00', '2025-03-17T19:15:00.0', '2025-03-17T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1071, '2025-03-18 00:00:00', '2025-03-17T19:30:00.0', '2025-03-17T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1072, '2025-03-18 00:00:00', '2025-03-17T19:45:00.0', '2025-03-17T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1073, '2025-03-18 00:00:00', '2025-03-17T20:00:00.0', '2025-03-17T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1074, '2025-03-18 00:00:00', '2025-03-17T20:15:00.0', '2025-03-17T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1075, '2025-03-18 00:00:00', '2025-03-17T20:30:00.0', '2025-03-17T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1076, '2025-03-18 00:00:00', '2025-03-17T20:45:00.0', '2025-03-17T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1077, '2025-03-18 00:00:00', '2025-03-17T21:00:00.0', '2025-03-17T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1078, '2025-03-18 00:00:00', '2025-03-17T21:15:00.0', '2025-03-17T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1079, '2025-03-18 00:00:00', '2025-03-17T21:30:00.0', '2025-03-17T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1080, '2025-03-18 00:00:00', '2025-03-17T21:45:00.0', '2025-03-17T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1081, '2025-03-18 00:00:00', '2025-03-17T22:00:00.0', '2025-03-17T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1082, '2025-03-18 00:00:00', '2025-03-17T22:15:00.0', '2025-03-17T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1083, '2025-03-18 00:00:00', '2025-03-17T22:30:00.0', '2025-03-17T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1084, '2025-03-18 00:00:00', '2025-03-17T22:45:00.0', '2025-03-17T23:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1085, '2025-03-18 00:00:00', '2025-03-17T23:00:00.0', '2025-03-17T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1086, '2025-03-18 00:00:00', '2025-03-17T23:15:00.0', '2025-03-17T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1087, '2025-03-18 00:00:00', '2025-03-17T23:30:00.0', '2025-03-17T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1088, '2025-03-18 00:00:00', '2025-03-17T23:45:00.0', '2025-03-18T00:00:00.0', 161, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1089, '2025-03-18 00:00:00', '2025-03-18T00:00:00.0', '2025-03-18T00:15:00.0', 319, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1090, '2025-03-18 00:00:00', '2025-03-18T00:15:00.0', '2025-03-18T00:30:00.0', 22, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1091, '2025-03-18 00:00:00', '2025-03-18T00:30:00.0', '2025-03-18T00:45:00.0', 58, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1092, '2025-03-18 00:00:00', '2025-03-18T00:45:00.0', '2025-03-18T01:00:00.0', 34, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1093, '2025-03-18 00:00:00', '2025-03-18T01:00:00.0', '2025-03-18T01:15:00.0', 537, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1094, '2025-03-18 00:00:00', '2025-03-18T01:15:00.0', '2025-03-18T01:30:00.0', 119, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1095, '2025-03-18 00:00:00', '2025-03-18T01:30:00.0', '2025-03-18T01:45:00.0', 146, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1096, '2025-03-18 00:00:00', '2025-03-18T01:45:00.0', '2025-03-18T02:00:00.0', 178, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1097, '2025-03-18 00:00:00', '2025-03-18T02:00:00.0', '2025-03-18T02:15:00.0', 210, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1098, '2025-03-18 00:00:00', '2025-03-18T02:15:00.0', '2025-03-18T02:30:00.0', 134, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1099, '2025-03-18 00:00:00', '2025-03-18T02:30:00.0', '2025-03-18T02:45:00.0', 185, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1100, '2025-03-18 00:00:00', '2025-03-18T02:45:00.0', '2025-03-18T03:00:00.0', 164, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1101, '2025-03-18 00:00:00', '2025-03-18T03:00:00.0', '2025-03-18T03:15:00.0', 337, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1102, '2025-03-18 00:00:00', '2025-03-18T03:15:00.0', '2025-03-18T03:30:00.0', 449, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1103, '2025-03-18 00:00:00', '2025-03-18T03:30:00.0', '2025-03-18T03:45:00.0', 722, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1104, '2025-03-18 00:00:00', '2025-03-18T03:45:00.0', '2025-03-18T04:00:00.0', 275, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1105, '2025-03-18 00:00:00', '2025-03-18T04:00:00.0', '2025-03-18T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1106, '2025-03-18 00:00:00', '2025-03-18T04:15:00.0', '2025-03-18T04:30:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1107, '2025-03-18 00:00:00', '2025-03-18T04:30:00.0', '2025-03-18T04:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1108, '2025-03-18 00:00:00', '2025-03-18T04:45:00.0', '2025-03-18T05:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1109, '2025-03-18 00:00:00', '2025-03-18T05:00:00.0', '2025-03-18T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1110, '2025-03-18 00:00:00', '2025-03-18T05:15:00.0', '2025-03-18T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1111, '2025-03-18 00:00:00', '2025-03-18T05:30:00.0', '2025-03-18T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1112, '2025-03-18 00:00:00', '2025-03-18T05:45:00.0', '2025-03-18T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1113, '2025-03-18 00:00:00', '2025-03-18T06:00:00.0', '2025-03-18T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1114, '2025-03-18 00:00:00', '2025-03-18T06:15:00.0', '2025-03-18T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1115, '2025-03-18 00:00:00', '2025-03-18T06:30:00.0', '2025-03-18T06:45:00.0', 524, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1116, '2025-03-18 00:00:00', '2025-03-18T06:45:00.0', '2025-03-18T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1117, '2025-03-18 00:00:00', '2025-03-18T07:00:00.0', '2025-03-18T07:15:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1118, '2025-03-18 00:00:00', '2025-03-18T07:15:00.0', '2025-03-18T07:30:00.0', 19, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1119, '2025-03-18 00:00:00', '2025-03-18T07:30:00.0', '2025-03-18T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1120, '2025-03-18 00:00:00', '2025-03-18T07:45:00.0', '2025-03-18T08:00:00.0', 599, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1121, '2025-03-18 00:00:00', '2025-03-18T08:00:00.0', '2025-03-18T08:15:00.0', 574, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1122, '2025-03-18 00:00:00', '2025-03-18T08:15:00.0', '2025-03-18T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1123, '2025-03-18 00:00:00', '2025-03-18T08:30:00.0', '2025-03-18T08:45:00.0', 195, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1124, '2025-03-18 00:00:00', '2025-03-18T08:45:00.0', '2025-03-18T09:00:00.0', 41, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1125, '2025-03-18 00:00:00', '2025-03-18T09:00:00.0', '2025-03-18T09:15:00.0', 415, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1126, '2025-03-18 00:00:00', '2025-03-18T09:15:00.0', '2025-03-18T09:30:00.0', 247, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1127, '2025-03-18 00:00:00', '2025-03-18T09:30:00.0', '2025-03-18T09:45:00.0', 638, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1128, '2025-03-18 00:00:00', '2025-03-18T09:45:00.0', '2025-03-18T10:00:00.0', 142, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1129, '2025-03-18 00:00:00', '2025-03-18T10:00:00.0', '2025-03-18T10:15:00.0', 59, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1130, '2025-03-18 00:00:00', '2025-03-18T10:15:00.0', '2025-03-18T10:30:00.0', 307, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1131, '2025-03-18 00:00:00', '2025-03-18T10:30:00.0', '2025-03-18T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1132, '2025-03-18 00:00:00', '2025-03-18T10:45:00.0', '2025-03-18T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1133, '2025-03-18 00:00:00', '2025-03-18T11:00:00.0', '2025-03-18T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1134, '2025-03-18 00:00:00', '2025-03-18T11:15:00.0', '2025-03-18T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1135, '2025-03-18 00:00:00', '2025-03-18T11:30:00.0', '2025-03-18T11:45:00.0', 67, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1136, '2025-03-18 00:00:00', '2025-03-18T11:45:00.0', '2025-03-18T12:00:00.0', 423, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1137, '2025-03-18 00:00:00', '2025-03-18T12:00:00.0', '2025-03-18T12:15:00.0', 319, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1138, '2025-03-18 00:00:00', '2025-03-18T12:15:00.0', '2025-03-18T12:30:00.0', 128, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1139, '2025-03-18 00:00:00', '2025-03-18T12:30:00.0', '2025-03-18T12:45:00.0', 108, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1140, '2025-03-18 00:00:00', '2025-03-18T12:45:00.0', '2025-03-18T13:00:00.0', 45, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1141, '2025-03-18 00:00:00', '2025-03-18T13:00:00.0', '2025-03-18T13:15:00.0', 196, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1142, '2025-03-18 00:00:00', '2025-03-18T13:15:00.0', '2025-03-18T13:30:00.0', 40, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1143, '2025-03-18 00:00:00', '2025-03-18T13:30:00.0', '2025-03-18T13:45:00.0', 54, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1144, '2025-03-18 00:00:00', '2025-03-18T13:45:00.0', '2025-03-18T14:00:00.0', 60, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1145, '2025-03-18 00:00:00', '2025-03-18T14:00:00.0', '2025-03-18T14:15:00.0', 65, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1146, '2025-03-18 00:00:00', '2025-03-18T14:15:00.0', '2025-03-18T14:30:00.0', 61, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1147, '2025-03-18 00:00:00', '2025-03-18T14:30:00.0', '2025-03-18T14:45:00.0', 75, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1148, '2025-03-18 00:00:00', '2025-03-18T14:45:00.0', '2025-03-18T15:00:00.0', 265, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1149, '2025-03-18 00:00:00', '2025-03-18T15:00:00.0', '2025-03-18T15:15:00.0', 92, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1150, '2025-03-18 00:00:00', '2025-03-18T15:15:00.0', '2025-03-18T15:30:00.0', 41, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1151, '2025-03-18 00:00:00', '2025-03-18T15:30:00.0', '2025-03-18T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1152, '2025-03-18 00:00:00', '2025-03-18T15:45:00.0', '2025-03-18T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1153, '2025-03-19 00:00:00', '2025-03-18T16:00:00.0', '2025-03-18T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1154, '2025-03-19 00:00:00', '2025-03-18T16:15:00.0', '2025-03-18T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1155, '2025-03-19 00:00:00', '2025-03-18T16:30:00.0', '2025-03-18T16:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1156, '2025-03-19 00:00:00', '2025-03-18T16:45:00.0', '2025-03-18T17:00:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1157, '2025-03-19 00:00:00', '2025-03-18T17:00:00.0', '2025-03-18T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1158, '2025-03-19 00:00:00', '2025-03-18T17:15:00.0', '2025-03-18T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1159, '2025-03-19 00:00:00', '2025-03-18T17:30:00.0', '2025-03-18T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1160, '2025-03-19 00:00:00', '2025-03-18T17:45:00.0', '2025-03-18T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1161, '2025-03-19 00:00:00', '2025-03-18T18:00:00.0', '2025-03-18T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1162, '2025-03-19 00:00:00', '2025-03-18T18:15:00.0', '2025-03-18T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1163, '2025-03-19 00:00:00', '2025-03-18T18:30:00.0', '2025-03-18T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1164, '2025-03-19 00:00:00', '2025-03-18T18:45:00.0', '2025-03-18T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1165, '2025-03-19 00:00:00', '2025-03-18T19:00:00.0', '2025-03-18T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1166, '2025-03-19 00:00:00', '2025-03-18T19:15:00.0', '2025-03-18T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1167, '2025-03-19 00:00:00', '2025-03-18T19:30:00.0', '2025-03-18T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1168, '2025-03-19 00:00:00', '2025-03-18T19:45:00.0', '2025-03-18T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1169, '2025-03-19 00:00:00', '2025-03-18T20:00:00.0', '2025-03-18T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1170, '2025-03-19 00:00:00', '2025-03-18T20:15:00.0', '2025-03-18T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1171, '2025-03-19 00:00:00', '2025-03-18T20:30:00.0', '2025-03-18T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1172, '2025-03-19 00:00:00', '2025-03-18T20:45:00.0', '2025-03-18T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1173, '2025-03-19 00:00:00', '2025-03-18T21:00:00.0', '2025-03-18T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1174, '2025-03-19 00:00:00', '2025-03-18T21:15:00.0', '2025-03-18T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1175, '2025-03-19 00:00:00', '2025-03-18T21:30:00.0', '2025-03-18T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1176, '2025-03-19 00:00:00', '2025-03-18T21:45:00.0', '2025-03-18T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1177, '2025-03-19 00:00:00', '2025-03-18T22:00:00.0', '2025-03-18T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1178, '2025-03-19 00:00:00', '2025-03-18T22:15:00.0', '2025-03-18T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1179, '2025-03-19 00:00:00', '2025-03-18T22:30:00.0', '2025-03-18T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1180, '2025-03-19 00:00:00', '2025-03-18T22:45:00.0', '2025-03-18T23:00:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1181, '2025-03-19 00:00:00', '2025-03-18T23:00:00.0', '2025-03-18T23:15:00.0', 244, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1182, '2025-03-19 00:00:00', '2025-03-18T23:15:00.0', '2025-03-18T23:30:00.0', 247, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1183, '2025-03-19 00:00:00', '2025-03-18T23:30:00.0', '2025-03-18T23:45:00.0', 91, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1184, '2025-03-19 00:00:00', '2025-03-18T23:45:00.0', '2025-03-19T00:00:00.0', 143, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1185, '2025-03-19 00:00:00', '2025-03-19T00:00:00.0', '2025-03-19T00:15:00.0', 517, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1186, '2025-03-19 00:00:00', '2025-03-19T00:15:00.0', '2025-03-19T00:30:00.0', 703, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1187, '2025-03-19 00:00:00', '2025-03-19T00:30:00.0', '2025-03-19T00:45:00.0', 248, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1188, '2025-03-19 00:00:00', '2025-03-19T00:45:00.0', '2025-03-19T01:00:00.0', 133, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1189, '2025-03-19 00:00:00', '2025-03-19T01:00:00.0', '2025-03-19T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1190, '2025-03-19 00:00:00', '2025-03-19T01:15:00.0', '2025-03-19T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1191, '2025-03-19 00:00:00', '2025-03-19T01:30:00.0', '2025-03-19T01:45:00.0', 20, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1192, '2025-03-19 00:00:00', '2025-03-19T01:45:00.0', '2025-03-19T02:00:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1193, '2025-03-19 00:00:00', '2025-03-19T02:00:00.0', '2025-03-19T02:15:00.0', 34, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1194, '2025-03-19 00:00:00', '2025-03-19T02:15:00.0', '2025-03-19T02:30:00.0', 46, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1195, '2025-03-19 00:00:00', '2025-03-19T02:30:00.0', '2025-03-19T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1196, '2025-03-19 00:00:00', '2025-03-19T02:45:00.0', '2025-03-19T03:00:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1197, '2025-03-19 00:00:00', '2025-03-19T03:00:00.0', '2025-03-19T03:15:00.0', 41, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1198, '2025-03-19 00:00:00', '2025-03-19T03:15:00.0', '2025-03-19T03:30:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1199, '2025-03-19 00:00:00', '2025-03-19T03:30:00.0', '2025-03-19T03:45:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1200, '2025-03-19 00:00:00', '2025-03-19T03:45:00.0', '2025-03-19T04:00:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1201, '2025-03-19 00:00:00', '2025-03-19T04:00:00.0', '2025-03-19T04:15:00.0', 579, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1202, '2025-03-19 00:00:00', '2025-03-19T04:15:00.0', '2025-03-19T04:30:00.0', 250, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1203, '2025-03-19 00:00:00', '2025-03-19T04:30:00.0', '2025-03-19T04:45:00.0', 150, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1204, '2025-03-19 00:00:00', '2025-03-19T04:45:00.0', '2025-03-19T05:00:00.0', 565, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1205, '2025-03-19 00:00:00', '2025-03-19T05:00:00.0', '2025-03-19T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1206, '2025-03-19 00:00:00', '2025-03-19T05:15:00.0', '2025-03-19T05:30:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1207, '2025-03-19 00:00:00', '2025-03-19T05:30:00.0', '2025-03-19T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1208, '2025-03-19 00:00:00', '2025-03-19T05:45:00.0', '2025-03-19T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1209, '2025-03-19 00:00:00', '2025-03-19T06:00:00.0', '2025-03-19T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1210, '2025-03-19 00:00:00', '2025-03-19T06:15:00.0', '2025-03-19T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1211, '2025-03-19 00:00:00', '2025-03-19T06:30:00.0', '2025-03-19T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1212, '2025-03-19 00:00:00', '2025-03-19T06:45:00.0', '2025-03-19T07:00:00.0', 406, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1213, '2025-03-19 00:00:00', '2025-03-19T07:00:00.0', '2025-03-19T07:15:00.0', 21, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1214, '2025-03-19 00:00:00', '2025-03-19T07:15:00.0', '2025-03-19T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1215, '2025-03-19 00:00:00', '2025-03-19T07:30:00.0', '2025-03-19T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1216, '2025-03-19 00:00:00', '2025-03-19T07:45:00.0', '2025-03-19T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1217, '2025-03-19 00:00:00', '2025-03-19T08:00:00.0', '2025-03-19T08:15:00.0', 930, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1218, '2025-03-19 00:00:00', '2025-03-19T08:15:00.0', '2025-03-19T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1219, '2025-03-19 00:00:00', '2025-03-19T08:30:00.0', '2025-03-19T08:45:00.0', 20, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1220, '2025-03-19 00:00:00', '2025-03-19T08:45:00.0', '2025-03-19T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1221, '2025-03-19 00:00:00', '2025-03-19T09:00:00.0', '2025-03-19T09:15:00.0', 555, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1222, '2025-03-19 00:00:00', '2025-03-19T09:15:00.0', '2025-03-19T09:30:00.0', 245, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1223, '2025-03-19 00:00:00', '2025-03-19T09:30:00.0', '2025-03-19T09:45:00.0', 218, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1224, '2025-03-19 00:00:00', '2025-03-19T09:45:00.0', '2025-03-19T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1225, '2025-03-19 00:00:00', '2025-03-19T10:00:00.0', '2025-03-19T10:15:00.0', 10, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1226, '2025-03-19 00:00:00', '2025-03-19T10:15:00.0', '2025-03-19T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1227, '2025-03-19 00:00:00', '2025-03-19T10:30:00.0', '2025-03-19T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1228, '2025-03-19 00:00:00', '2025-03-19T10:45:00.0', '2025-03-19T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1229, '2025-03-19 00:00:00', '2025-03-19T11:00:00.0', '2025-03-19T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1230, '2025-03-19 00:00:00', '2025-03-19T11:15:00.0', '2025-03-19T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1231, '2025-03-19 00:00:00', '2025-03-19T11:30:00.0', '2025-03-19T11:45:00.0', 296, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1232, '2025-03-19 00:00:00', '2025-03-19T11:45:00.0', '2025-03-19T12:00:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1233, '2025-03-19 00:00:00', '2025-03-19T12:00:00.0', '2025-03-19T12:15:00.0', 214, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1234, '2025-03-19 00:00:00', '2025-03-19T12:15:00.0', '2025-03-19T12:30:00.0', 267, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1235, '2025-03-19 00:00:00', '2025-03-19T12:30:00.0', '2025-03-19T12:45:00.0', 156, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1236, '2025-03-19 00:00:00', '2025-03-19T12:45:00.0', '2025-03-19T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1237, '2025-03-19 00:00:00', '2025-03-19T13:00:00.0', '2025-03-19T13:15:00.0', 445, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1238, '2025-03-19 00:00:00', '2025-03-19T13:15:00.0', '2025-03-19T13:30:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1239, '2025-03-19 00:00:00', '2025-03-19T13:30:00.0', '2025-03-19T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1240, '2025-03-19 00:00:00', '2025-03-19T13:45:00.0', '2025-03-19T14:00:00.0', 35, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1241, '2025-03-19 00:00:00', '2025-03-19T14:00:00.0', '2025-03-19T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1242, '2025-03-19 00:00:00', '2025-03-19T14:15:00.0', '2025-03-19T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1243, '2025-03-19 00:00:00', '2025-03-19T14:30:00.0', '2025-03-19T14:45:00.0', 43, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1244, '2025-03-19 00:00:00', '2025-03-19T14:45:00.0', '2025-03-19T15:00:00.0', 131, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1245, '2025-03-19 00:00:00', '2025-03-19T15:00:00.0', '2025-03-19T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1246, '2025-03-19 00:00:00', '2025-03-19T15:15:00.0', '2025-03-19T15:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1247, '2025-03-19 00:00:00', '2025-03-19T15:30:00.0', '2025-03-19T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1248, '2025-03-19 00:00:00', '2025-03-19T15:45:00.0', '2025-03-19T16:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1249, '2025-03-20 00:00:00', '2025-03-19T16:00:00.0', '2025-03-19T16:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1250, '2025-03-20 00:00:00', '2025-03-19T16:15:00.0', '2025-03-19T16:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1251, '2025-03-20 00:00:00', '2025-03-19T16:30:00.0', '2025-03-19T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1252, '2025-03-20 00:00:00', '2025-03-19T16:45:00.0', '2025-03-19T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1253, '2025-03-20 00:00:00', '2025-03-19T17:00:00.0', '2025-03-19T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1254, '2025-03-20 00:00:00', '2025-03-19T17:15:00.0', '2025-03-19T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1255, '2025-03-20 00:00:00', '2025-03-19T17:30:00.0', '2025-03-19T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1256, '2025-03-20 00:00:00', '2025-03-19T17:45:00.0', '2025-03-19T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1257, '2025-03-20 00:00:00', '2025-03-19T18:00:00.0', '2025-03-19T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1258, '2025-03-20 00:00:00', '2025-03-19T18:15:00.0', '2025-03-19T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1259, '2025-03-20 00:00:00', '2025-03-19T18:30:00.0', '2025-03-19T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1260, '2025-03-20 00:00:00', '2025-03-19T18:45:00.0', '2025-03-19T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1261, '2025-03-20 00:00:00', '2025-03-19T19:00:00.0', '2025-03-19T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1262, '2025-03-20 00:00:00', '2025-03-19T19:15:00.0', '2025-03-19T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1263, '2025-03-20 00:00:00', '2025-03-19T19:30:00.0', '2025-03-19T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1264, '2025-03-20 00:00:00', '2025-03-19T19:45:00.0', '2025-03-19T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1265, '2025-03-20 00:00:00', '2025-03-19T20:00:00.0', '2025-03-19T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1266, '2025-03-20 00:00:00', '2025-03-19T20:15:00.0', '2025-03-19T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1267, '2025-03-20 00:00:00', '2025-03-19T20:30:00.0', '2025-03-19T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1268, '2025-03-20 00:00:00', '2025-03-19T20:45:00.0', '2025-03-19T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1269, '2025-03-20 00:00:00', '2025-03-19T21:00:00.0', '2025-03-19T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1270, '2025-03-20 00:00:00', '2025-03-19T21:15:00.0', '2025-03-19T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1271, '2025-03-20 00:00:00', '2025-03-19T21:30:00.0', '2025-03-19T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1272, '2025-03-20 00:00:00', '2025-03-19T21:45:00.0', '2025-03-19T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1273, '2025-03-20 00:00:00', '2025-03-19T22:00:00.0', '2025-03-19T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1274, '2025-03-20 00:00:00', '2025-03-19T22:15:00.0', '2025-03-19T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1275, '2025-03-20 00:00:00', '2025-03-19T22:30:00.0', '2025-03-19T22:45:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1276, '2025-03-20 00:00:00', '2025-03-19T22:45:00.0', '2025-03-19T23:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1277, '2025-03-20 00:00:00', '2025-03-19T23:00:00.0', '2025-03-19T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1278, '2025-03-20 00:00:00', '2025-03-19T23:15:00.0', '2025-03-19T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1279, '2025-03-20 00:00:00', '2025-03-19T23:30:00.0', '2025-03-19T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1280, '2025-03-20 00:00:00', '2025-03-19T23:45:00.0', '2025-03-20T00:00:00.0', 130, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1281, '2025-03-20 00:00:00', '2025-03-20T00:00:00.0', '2025-03-20T00:15:00.0', 323, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1282, '2025-03-20 00:00:00', '2025-03-20T00:15:00.0', '2025-03-20T00:30:00.0', 976, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1283, '2025-03-20 00:00:00', '2025-03-20T00:30:00.0', '2025-03-20T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1284, '2025-03-20 00:00:00', '2025-03-20T00:45:00.0', '2025-03-20T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1285, '2025-03-20 00:00:00', '2025-03-20T01:00:00.0', '2025-03-20T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1286, '2025-03-20 00:00:00', '2025-03-20T01:15:00.0', '2025-03-20T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1287, '2025-03-20 00:00:00', '2025-03-20T01:30:00.0', '2025-03-20T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1288, '2025-03-20 00:00:00', '2025-03-20T01:45:00.0', '2025-03-20T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1289, '2025-03-20 00:00:00', '2025-03-20T02:00:00.0', '2025-03-20T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1290, '2025-03-20 00:00:00', '2025-03-20T02:15:00.0', '2025-03-20T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1291, '2025-03-20 00:00:00', '2025-03-20T02:30:00.0', '2025-03-20T02:45:00.0', 19, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1292, '2025-03-20 00:00:00', '2025-03-20T02:45:00.0', '2025-03-20T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1293, '2025-03-20 00:00:00', '2025-03-20T03:00:00.0', '2025-03-20T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1294, '2025-03-20 00:00:00', '2025-03-20T03:15:00.0', '2025-03-20T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1295, '2025-03-20 00:00:00', '2025-03-20T03:30:00.0', '2025-03-20T03:45:00.0', 356, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1296, '2025-03-20 00:00:00', '2025-03-20T03:45:00.0', '2025-03-20T04:00:00.0', 338, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1297, '2025-03-20 00:00:00', '2025-03-20T04:00:00.0', '2025-03-20T04:15:00.0', 607, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1298, '2025-03-20 00:00:00', '2025-03-20T04:15:00.0', '2025-03-20T04:30:00.0', 0, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1299, '2025-03-20 00:00:00', '2025-03-20T04:30:00.0', '2025-03-20T04:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1300, '2025-03-20 00:00:00', '2025-03-20T04:45:00.0', '2025-03-20T05:00:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1301, '2025-03-20 00:00:00', '2025-03-20T05:00:00.0', '2025-03-20T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1302, '2025-03-20 00:00:00', '2025-03-20T05:15:00.0', '2025-03-20T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1303, '2025-03-20 00:00:00', '2025-03-20T05:30:00.0', '2025-03-20T05:45:00.0', 195, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1304, '2025-03-20 00:00:00', '2025-03-20T05:45:00.0', '2025-03-20T06:00:00.0', 371, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1305, '2025-03-20 00:00:00', '2025-03-20T06:00:00.0', '2025-03-20T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1306, '2025-03-20 00:00:00', '2025-03-20T06:15:00.0', '2025-03-20T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1307, '2025-03-20 00:00:00', '2025-03-20T06:30:00.0', '2025-03-20T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1308, '2025-03-20 00:00:00', '2025-03-20T06:45:00.0', '2025-03-20T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1309, '2025-03-20 00:00:00', '2025-03-20T07:00:00.0', '2025-03-20T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1310, '2025-03-20 00:00:00', '2025-03-20T07:15:00.0', '2025-03-20T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1311, '2025-03-20 00:00:00', '2025-03-20T07:30:00.0', '2025-03-20T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1312, '2025-03-20 00:00:00', '2025-03-20T07:45:00.0', '2025-03-20T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1313, '2025-03-20 00:00:00', '2025-03-20T08:00:00.0', '2025-03-20T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1314, '2025-03-20 00:00:00', '2025-03-20T08:15:00.0', '2025-03-20T08:30:00.0', 150, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1315, '2025-03-20 00:00:00', '2025-03-20T08:30:00.0', '2025-03-20T08:45:00.0', 58, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1316, '2025-03-20 00:00:00', '2025-03-20T08:45:00.0', '2025-03-20T09:00:00.0', 83, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1317, '2025-03-20 00:00:00', '2025-03-20T09:00:00.0', '2025-03-20T09:15:00.0', 425, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1318, '2025-03-20 00:00:00', '2025-03-20T09:15:00.0', '2025-03-20T09:30:00.0', 358, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1319, '2025-03-20 00:00:00', '2025-03-20T09:30:00.0', '2025-03-20T09:45:00.0', 120, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1320, '2025-03-20 00:00:00', '2025-03-20T09:45:00.0', '2025-03-20T10:00:00.0', 165, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1321, '2025-03-20 00:00:00', '2025-03-20T10:00:00.0', '2025-03-20T10:15:00.0', 515, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1322, '2025-03-20 00:00:00', '2025-03-20T10:15:00.0', '2025-03-20T10:30:00.0', 257, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1323, '2025-03-20 00:00:00', '2025-03-20T10:30:00.0', '2025-03-20T10:45:00.0', 377, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1324, '2025-03-20 00:00:00', '2025-03-20T10:45:00.0', '2025-03-20T11:00:00.0', 157, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1325, '2025-03-20 00:00:00', '2025-03-20T11:00:00.0', '2025-03-20T11:15:00.0', 548, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1326, '2025-03-20 00:00:00', '2025-03-20T11:15:00.0', '2025-03-20T11:30:00.0', 486, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1327, '2025-03-20 00:00:00', '2025-03-20T11:30:00.0', '2025-03-20T11:45:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1328, '2025-03-20 00:00:00', '2025-03-20T11:45:00.0', '2025-03-20T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1329, '2025-03-20 00:00:00', '2025-03-20T12:00:00.0', '2025-03-20T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1330, '2025-03-20 00:00:00', '2025-03-20T12:15:00.0', '2025-03-20T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1331, '2025-03-20 00:00:00', '2025-03-20T12:30:00.0', '2025-03-20T12:45:00.0', 164, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1332, '2025-03-20 00:00:00', '2025-03-20T12:45:00.0', '2025-03-20T13:00:00.0', 25, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1333, '2025-03-20 00:00:00', '2025-03-20T13:00:00.0', '2025-03-20T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1334, '2025-03-20 00:00:00', '2025-03-20T13:15:00.0', '2025-03-20T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1335, '2025-03-20 00:00:00', '2025-03-20T13:30:00.0', '2025-03-20T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1336, '2025-03-20 00:00:00', '2025-03-20T13:45:00.0', '2025-03-20T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1337, '2025-03-20 00:00:00', '2025-03-20T14:00:00.0', '2025-03-20T14:15:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1338, '2025-03-20 00:00:00', '2025-03-20T14:15:00.0', '2025-03-20T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1339, '2025-03-20 00:00:00', '2025-03-20T14:30:00.0', '2025-03-20T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1340, '2025-03-20 00:00:00', '2025-03-20T14:45:00.0', '2025-03-20T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1341, '2025-03-20 00:00:00', '2025-03-20T15:00:00.0', '2025-03-20T15:15:00.0', 303, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1342, '2025-03-20 00:00:00', '2025-03-20T15:15:00.0', '2025-03-20T15:30:00.0', 381, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1343, '2025-03-20 00:00:00', '2025-03-20T15:30:00.0', '2025-03-20T15:45:00.0', 191, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1344, '2025-03-20 00:00:00', '2025-03-20T15:45:00.0', '2025-03-20T16:00:00.0', 86, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1345, '2025-03-21 00:00:00', '2025-03-20T16:00:00.0', '2025-03-20T16:15:00.0', 69, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1346, '2025-03-21 00:00:00', '2025-03-20T16:15:00.0', '2025-03-20T16:30:00.0', 47, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1347, '2025-03-21 00:00:00', '2025-03-20T16:30:00.0', '2025-03-20T16:45:00.0', 37, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1348, '2025-03-21 00:00:00', '2025-03-20T16:45:00.0', '2025-03-20T17:00:00.0', 462, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1349, '2025-03-21 00:00:00', '2025-03-20T17:00:00.0', '2025-03-20T17:15:00.0', 82, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1350, '2025-03-21 00:00:00', '2025-03-20T17:15:00.0', '2025-03-20T17:30:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1351, '2025-03-21 00:00:00', '2025-03-20T17:30:00.0', '2025-03-20T17:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1352, '2025-03-21 00:00:00', '2025-03-20T17:45:00.0', '2025-03-20T18:00:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1353, '2025-03-21 00:00:00', '2025-03-20T18:00:00.0', '2025-03-20T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1354, '2025-03-21 00:00:00', '2025-03-20T18:15:00.0', '2025-03-20T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1355, '2025-03-21 00:00:00', '2025-03-20T18:30:00.0', '2025-03-20T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1356, '2025-03-21 00:00:00', '2025-03-20T18:45:00.0', '2025-03-20T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1357, '2025-03-21 00:00:00', '2025-03-20T19:00:00.0', '2025-03-20T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1358, '2025-03-21 00:00:00', '2025-03-20T19:15:00.0', '2025-03-20T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1359, '2025-03-21 00:00:00', '2025-03-20T19:30:00.0', '2025-03-20T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1360, '2025-03-21 00:00:00', '2025-03-20T19:45:00.0', '2025-03-20T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1361, '2025-03-21 00:00:00', '2025-03-20T20:00:00.0', '2025-03-20T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1362, '2025-03-21 00:00:00', '2025-03-20T20:15:00.0', '2025-03-20T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1363, '2025-03-21 00:00:00', '2025-03-20T20:30:00.0', '2025-03-20T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1364, '2025-03-21 00:00:00', '2025-03-20T20:45:00.0', '2025-03-20T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1365, '2025-03-21 00:00:00', '2025-03-20T21:00:00.0', '2025-03-20T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1366, '2025-03-21 00:00:00', '2025-03-20T21:15:00.0', '2025-03-20T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1367, '2025-03-21 00:00:00', '2025-03-20T21:30:00.0', '2025-03-20T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1368, '2025-03-21 00:00:00', '2025-03-20T21:45:00.0', '2025-03-20T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1369, '2025-03-21 00:00:00', '2025-03-20T22:00:00.0', '2025-03-20T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1370, '2025-03-21 00:00:00', '2025-03-20T22:15:00.0', '2025-03-20T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1371, '2025-03-21 00:00:00', '2025-03-20T22:30:00.0', '2025-03-20T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1372, '2025-03-21 00:00:00', '2025-03-20T22:45:00.0', '2025-03-20T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1373, '2025-03-21 00:00:00', '2025-03-20T23:00:00.0', '2025-03-20T23:15:00.0', 79, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1374, '2025-03-21 00:00:00', '2025-03-20T23:15:00.0', '2025-03-20T23:30:00.0', 207, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1375, '2025-03-21 00:00:00', '2025-03-20T23:30:00.0', '2025-03-20T23:45:00.0', 64, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1376, '2025-03-21 00:00:00', '2025-03-20T23:45:00.0', '2025-03-21T00:00:00.0', 269, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1377, '2025-03-21 00:00:00', '2025-03-21T00:00:00.0', '2025-03-21T00:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1378, '2025-03-21 00:00:00', '2025-03-21T00:15:00.0', '2025-03-21T00:30:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1379, '2025-03-21 00:00:00', '2025-03-21T00:30:00.0', '2025-03-21T00:45:00.0', 176, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1380, '2025-03-21 00:00:00', '2025-03-21T00:45:00.0', '2025-03-21T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1381, '2025-03-21 00:00:00', '2025-03-21T01:00:00.0', '2025-03-21T01:15:00.0', 91, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1382, '2025-03-21 00:00:00', '2025-03-21T01:15:00.0', '2025-03-21T01:30:00.0', 391, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1383, '2025-03-21 00:00:00', '2025-03-21T01:30:00.0', '2025-03-21T01:45:00.0', 304, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1384, '2025-03-21 00:00:00', '2025-03-21T01:45:00.0', '2025-03-21T02:00:00.0', 219, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1385, '2025-03-21 00:00:00', '2025-03-21T02:00:00.0', '2025-03-21T02:15:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1386, '2025-03-21 00:00:00', '2025-03-21T02:15:00.0', '2025-03-21T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1387, '2025-03-21 00:00:00', '2025-03-21T02:30:00.0', '2025-03-21T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1388, '2025-03-21 00:00:00', '2025-03-21T02:45:00.0', '2025-03-21T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1389, '2025-03-21 00:00:00', '2025-03-21T03:00:00.0', '2025-03-21T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1390, '2025-03-21 00:00:00', '2025-03-21T03:15:00.0', '2025-03-21T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1391, '2025-03-21 00:00:00', '2025-03-21T03:30:00.0', '2025-03-21T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1392, '2025-03-21 00:00:00', '2025-03-21T03:45:00.0', '2025-03-21T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1393, '2025-03-21 00:00:00', '2025-03-21T04:00:00.0', '2025-03-21T04:15:00.0', 420, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1394, '2025-03-21 00:00:00', '2025-03-21T04:15:00.0', '2025-03-21T04:30:00.0', 179, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1395, '2025-03-21 00:00:00', '2025-03-21T04:30:00.0', '2025-03-21T04:45:00.0', 87, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1396, '2025-03-21 00:00:00', '2025-03-21T04:45:00.0', '2025-03-21T05:00:00.0', 398, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1397, '2025-03-21 00:00:00', '2025-03-21T05:00:00.0', '2025-03-21T05:15:00.0', 97, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1398, '2025-03-21 00:00:00', '2025-03-21T05:15:00.0', '2025-03-21T05:30:00.0', 73, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1399, '2025-03-21 00:00:00', '2025-03-21T05:30:00.0', '2025-03-21T05:45:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1400, '2025-03-21 00:00:00', '2025-03-21T05:45:00.0', '2025-03-21T06:00:00.0', 32, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1401, '2025-03-21 00:00:00', '2025-03-21T06:00:00.0', '2025-03-21T06:15:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1402, '2025-03-21 00:00:00', '2025-03-21T06:15:00.0', '2025-03-21T06:30:00.0', 268, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1403, '2025-03-21 00:00:00', '2025-03-21T06:30:00.0', '2025-03-21T06:45:00.0', 341, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1404, '2025-03-21 00:00:00', '2025-03-21T06:45:00.0', '2025-03-21T07:00:00.0', 184, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1405, '2025-03-21 00:00:00', '2025-03-21T07:00:00.0', '2025-03-21T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1406, '2025-03-21 00:00:00', '2025-03-21T07:15:00.0', '2025-03-21T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1407, '2025-03-21 00:00:00', '2025-03-21T07:30:00.0', '2025-03-21T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1408, '2025-03-21 00:00:00', '2025-03-21T07:45:00.0', '2025-03-21T08:00:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1409, '2025-03-21 00:00:00', '2025-03-21T08:00:00.0', '2025-03-21T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1410, '2025-03-21 00:00:00', '2025-03-21T08:15:00.0', '2025-03-21T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1411, '2025-03-21 00:00:00', '2025-03-21T08:30:00.0', '2025-03-21T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1412, '2025-03-21 00:00:00', '2025-03-21T08:45:00.0', '2025-03-21T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1413, '2025-03-21 00:00:00', '2025-03-21T09:00:00.0', '2025-03-21T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1414, '2025-03-21 00:00:00', '2025-03-21T09:15:00.0', '2025-03-21T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1415, '2025-03-21 00:00:00', '2025-03-21T09:30:00.0', '2025-03-21T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1416, '2025-03-21 00:00:00', '2025-03-21T09:45:00.0', '2025-03-21T10:00:00.0', 87, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1417, '2025-03-21 00:00:00', '2025-03-21T10:00:00.0', '2025-03-21T10:15:00.0', 871, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1418, '2025-03-21 00:00:00', '2025-03-21T10:15:00.0', '2025-03-21T10:30:00.0', 388, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1419, '2025-03-21 00:00:00', '2025-03-21T10:30:00.0', '2025-03-21T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1420, '2025-03-21 00:00:00', '2025-03-21T10:45:00.0', '2025-03-21T11:00:00.0', 14, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1421, '2025-03-21 00:00:00', '2025-03-21T11:00:00.0', '2025-03-21T11:15:00.0', 566, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1422, '2025-03-21 00:00:00', '2025-03-21T11:15:00.0', '2025-03-21T11:30:00.0', 189, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1423, '2025-03-21 00:00:00', '2025-03-21T11:30:00.0', '2025-03-21T11:45:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1424, '2025-03-21 00:00:00', '2025-03-21T11:45:00.0', '2025-03-21T12:00:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1425, '2025-03-21 00:00:00', '2025-03-21T12:00:00.0', '2025-03-21T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1426, '2025-03-21 00:00:00', '2025-03-21T12:15:00.0', '2025-03-21T12:30:00.0', 207, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1427, '2025-03-21 00:00:00', '2025-03-21T12:30:00.0', '2025-03-21T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1428, '2025-03-21 00:00:00', '2025-03-21T12:45:00.0', '2025-03-21T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1429, '2025-03-21 00:00:00', '2025-03-21T13:00:00.0', '2025-03-21T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1430, '2025-03-21 00:00:00', '2025-03-21T13:15:00.0', '2025-03-21T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1431, '2025-03-21 00:00:00', '2025-03-21T13:30:00.0', '2025-03-21T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1432, '2025-03-21 00:00:00', '2025-03-21T13:45:00.0', '2025-03-21T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1433, '2025-03-21 00:00:00', '2025-03-21T14:00:00.0', '2025-03-21T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1434, '2025-03-21 00:00:00', '2025-03-21T14:15:00.0', '2025-03-21T14:30:00.0', 523, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1435, '2025-03-21 00:00:00', '2025-03-21T14:30:00.0', '2025-03-21T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1436, '2025-03-21 00:00:00', '2025-03-21T14:45:00.0', '2025-03-21T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1437, '2025-03-21 00:00:00', '2025-03-21T15:00:00.0', '2025-03-21T15:15:00.0', 108, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1438, '2025-03-21 00:00:00', '2025-03-21T15:15:00.0', '2025-03-21T15:30:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1439, '2025-03-21 00:00:00', '2025-03-21T15:30:00.0', '2025-03-21T15:45:00.0', 33, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1440, '2025-03-21 00:00:00', '2025-03-21T15:45:00.0', '2025-03-21T16:00:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1441, '2025-03-22 00:00:00', '2025-03-21T16:00:00.0', '2025-03-21T16:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1442, '2025-03-22 00:00:00', '2025-03-21T16:15:00.0', '2025-03-21T16:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1443, '2025-03-22 00:00:00', '2025-03-21T16:30:00.0', '2025-03-21T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1444, '2025-03-22 00:00:00', '2025-03-21T16:45:00.0', '2025-03-21T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1445, '2025-03-22 00:00:00', '2025-03-21T17:00:00.0', '2025-03-21T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1446, '2025-03-22 00:00:00', '2025-03-21T17:15:00.0', '2025-03-21T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1447, '2025-03-22 00:00:00', '2025-03-21T17:30:00.0', '2025-03-21T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1448, '2025-03-22 00:00:00', '2025-03-21T17:45:00.0', '2025-03-21T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1449, '2025-03-22 00:00:00', '2025-03-21T18:00:00.0', '2025-03-21T18:15:00.0', 17, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1450, '2025-03-22 00:00:00', '2025-03-21T18:15:00.0', '2025-03-21T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1451, '2025-03-22 00:00:00', '2025-03-21T18:30:00.0', '2025-03-21T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1452, '2025-03-22 00:00:00', '2025-03-21T18:45:00.0', '2025-03-21T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1453, '2025-03-22 00:00:00', '2025-03-21T19:00:00.0', '2025-03-21T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1454, '2025-03-22 00:00:00', '2025-03-21T19:15:00.0', '2025-03-21T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1455, '2025-03-22 00:00:00', '2025-03-21T19:30:00.0', '2025-03-21T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1456, '2025-03-22 00:00:00', '2025-03-21T19:45:00.0', '2025-03-21T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1457, '2025-03-22 00:00:00', '2025-03-21T20:00:00.0', '2025-03-21T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1458, '2025-03-22 00:00:00', '2025-03-21T20:15:00.0', '2025-03-21T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1459, '2025-03-22 00:00:00', '2025-03-21T20:30:00.0', '2025-03-21T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1460, '2025-03-22 00:00:00', '2025-03-21T20:45:00.0', '2025-03-21T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1461, '2025-03-22 00:00:00', '2025-03-21T21:00:00.0', '2025-03-21T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1462, '2025-03-22 00:00:00', '2025-03-21T21:15:00.0', '2025-03-21T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1463, '2025-03-22 00:00:00', '2025-03-21T21:30:00.0', '2025-03-21T21:45:00.0', 11, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1464, '2025-03-22 00:00:00', '2025-03-21T21:45:00.0', '2025-03-21T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1465, '2025-03-22 00:00:00', '2025-03-21T22:00:00.0', '2025-03-21T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1466, '2025-03-22 00:00:00', '2025-03-21T22:15:00.0', '2025-03-21T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1467, '2025-03-22 00:00:00', '2025-03-21T22:30:00.0', '2025-03-21T22:45:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1468, '2025-03-22 00:00:00', '2025-03-21T22:45:00.0', '2025-03-21T23:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1469, '2025-03-22 00:00:00', '2025-03-21T23:00:00.0', '2025-03-21T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1470, '2025-03-22 00:00:00', '2025-03-21T23:15:00.0', '2025-03-21T23:30:00.0', 106, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1471, '2025-03-22 00:00:00', '2025-03-21T23:30:00.0', '2025-03-21T23:45:00.0', 92, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1472, '2025-03-22 00:00:00', '2025-03-21T23:45:00.0', '2025-03-22T00:00:00.0', 164, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1473, '2025-03-22 00:00:00', '2025-03-22T00:00:00.0', '2025-03-22T00:15:00.0', 228, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1474, '2025-03-22 00:00:00', '2025-03-22T00:15:00.0', '2025-03-22T00:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1475, '2025-03-22 00:00:00', '2025-03-22T00:30:00.0', '2025-03-22T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1476, '2025-03-22 00:00:00', '2025-03-22T00:45:00.0', '2025-03-22T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1477, '2025-03-22 00:00:00', '2025-03-22T01:00:00.0', '2025-03-22T01:15:00.0', 72, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1478, '2025-03-22 00:00:00', '2025-03-22T01:15:00.0', '2025-03-22T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1479, '2025-03-22 00:00:00', '2025-03-22T01:30:00.0', '2025-03-22T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1480, '2025-03-22 00:00:00', '2025-03-22T01:45:00.0', '2025-03-22T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1481, '2025-03-22 00:00:00', '2025-03-22T02:00:00.0', '2025-03-22T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1482, '2025-03-22 00:00:00', '2025-03-22T02:15:00.0', '2025-03-22T02:30:00.0', 67, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1483, '2025-03-22 00:00:00', '2025-03-22T02:30:00.0', '2025-03-22T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1484, '2025-03-22 00:00:00', '2025-03-22T02:45:00.0', '2025-03-22T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1485, '2025-03-22 00:00:00', '2025-03-22T03:00:00.0', '2025-03-22T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1486, '2025-03-22 00:00:00', '2025-03-22T03:15:00.0', '2025-03-22T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1487, '2025-03-22 00:00:00', '2025-03-22T03:30:00.0', '2025-03-22T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1488, '2025-03-22 00:00:00', '2025-03-22T03:45:00.0', '2025-03-22T04:00:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1489, '2025-03-22 00:00:00', '2025-03-22T04:00:00.0', '2025-03-22T04:15:00.0', 1296, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1490, '2025-03-22 00:00:00', '2025-03-22T04:15:00.0', '2025-03-22T04:30:00.0', 367, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1491, '2025-03-22 00:00:00', '2025-03-22T04:30:00.0', '2025-03-22T04:45:00.0', 1025, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1492, '2025-03-22 00:00:00', '2025-03-22T04:45:00.0', '2025-03-22T05:00:00.0', 519, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1493, '2025-03-22 00:00:00', '2025-03-22T05:00:00.0', '2025-03-22T05:15:00.0', 85, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1494, '2025-03-22 00:00:00', '2025-03-22T05:15:00.0', '2025-03-22T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1495, '2025-03-22 00:00:00', '2025-03-22T05:30:00.0', '2025-03-22T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1496, '2025-03-22 00:00:00', '2025-03-22T05:45:00.0', '2025-03-22T06:00:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1497, '2025-03-22 00:00:00', '2025-03-22T06:00:00.0', '2025-03-22T06:15:00.0', 19, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1498, '2025-03-22 00:00:00', '2025-03-22T06:15:00.0', '2025-03-22T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1499, '2025-03-22 00:00:00', '2025-03-22T06:30:00.0', '2025-03-22T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1500, '2025-03-22 00:00:00', '2025-03-22T06:45:00.0', '2025-03-22T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1501, '2025-03-22 00:00:00', '2025-03-22T07:00:00.0', '2025-03-22T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1502, '2025-03-22 00:00:00', '2025-03-22T07:15:00.0', '2025-03-22T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1503, '2025-03-22 00:00:00', '2025-03-22T07:30:00.0', '2025-03-22T07:45:00.0', 65, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1504, '2025-03-22 00:00:00', '2025-03-22T07:45:00.0', '2025-03-22T08:00:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1505, '2025-03-22 00:00:00', '2025-03-22T08:00:00.0', '2025-03-22T08:15:00.0', 33, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1506, '2025-03-22 00:00:00', '2025-03-22T08:15:00.0', '2025-03-22T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1507, '2025-03-22 00:00:00', '2025-03-22T08:30:00.0', '2025-03-22T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1508, '2025-03-22 00:00:00', '2025-03-22T08:45:00.0', '2025-03-22T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1509, '2025-03-22 00:00:00', '2025-03-22T09:00:00.0', '2025-03-22T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1510, '2025-03-22 00:00:00', '2025-03-22T09:15:00.0', '2025-03-22T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1511, '2025-03-22 00:00:00', '2025-03-22T09:30:00.0', '2025-03-22T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1512, '2025-03-22 00:00:00', '2025-03-22T09:45:00.0', '2025-03-22T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1513, '2025-03-22 00:00:00', '2025-03-22T10:00:00.0', '2025-03-22T10:15:00.0', 28, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1514, '2025-03-22 00:00:00', '2025-03-22T10:15:00.0', '2025-03-22T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1515, '2025-03-22 00:00:00', '2025-03-22T10:30:00.0', '2025-03-22T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1516, '2025-03-22 00:00:00', '2025-03-22T10:45:00.0', '2025-03-22T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1517, '2025-03-22 00:00:00', '2025-03-22T11:00:00.0', '2025-03-22T11:15:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1518, '2025-03-22 00:00:00', '2025-03-22T11:15:00.0', '2025-03-22T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1519, '2025-03-22 00:00:00', '2025-03-22T11:30:00.0', '2025-03-22T11:45:00.0', 257, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1520, '2025-03-22 00:00:00', '2025-03-22T11:45:00.0', '2025-03-22T12:00:00.0', 167, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1521, '2025-03-22 00:00:00', '2025-03-22T12:00:00.0', '2025-03-22T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1522, '2025-03-22 00:00:00', '2025-03-22T12:15:00.0', '2025-03-22T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1523, '2025-03-22 00:00:00', '2025-03-22T12:30:00.0', '2025-03-22T12:45:00.0', 153, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1524, '2025-03-22 00:00:00', '2025-03-22T12:45:00.0', '2025-03-22T13:00:00.0', 146, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1525, '2025-03-22 00:00:00', '2025-03-22T13:00:00.0', '2025-03-22T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1526, '2025-03-22 00:00:00', '2025-03-22T13:15:00.0', '2025-03-22T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1527, '2025-03-22 00:00:00', '2025-03-22T13:30:00.0', '2025-03-22T13:45:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1528, '2025-03-22 00:00:00', '2025-03-22T13:45:00.0', '2025-03-22T14:00:00.0', 155, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1529, '2025-03-22 00:00:00', '2025-03-22T14:00:00.0', '2025-03-22T14:15:00.0', 14, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1530, '2025-03-22 00:00:00', '2025-03-22T14:15:00.0', '2025-03-22T14:30:00.0', 159, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1531, '2025-03-22 00:00:00', '2025-03-22T14:30:00.0', '2025-03-22T14:45:00.0', 277, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1532, '2025-03-22 00:00:00', '2025-03-22T14:45:00.0', '2025-03-22T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1533, '2025-03-22 00:00:00', '2025-03-22T15:00:00.0', '2025-03-22T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1534, '2025-03-22 00:00:00', '2025-03-22T15:15:00.0', '2025-03-22T15:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1535, '2025-03-22 00:00:00', '2025-03-22T15:30:00.0', '2025-03-22T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1536, '2025-03-22 00:00:00', '2025-03-22T15:45:00.0', '2025-03-22T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1537, '2025-03-23 00:00:00', '2025-03-22T16:00:00.0', '2025-03-22T16:15:00.0', 160, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1538, '2025-03-23 00:00:00', '2025-03-22T16:15:00.0', '2025-03-22T16:30:00.0', 49, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1539, '2025-03-23 00:00:00', '2025-03-22T16:30:00.0', '2025-03-22T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1540, '2025-03-23 00:00:00', '2025-03-22T16:45:00.0', '2025-03-22T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1541, '2025-03-23 00:00:00', '2025-03-22T17:00:00.0', '2025-03-22T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1542, '2025-03-23 00:00:00', '2025-03-22T17:15:00.0', '2025-03-22T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1543, '2025-03-23 00:00:00', '2025-03-22T17:30:00.0', '2025-03-22T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1544, '2025-03-23 00:00:00', '2025-03-22T17:45:00.0', '2025-03-22T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1545, '2025-03-23 00:00:00', '2025-03-22T18:00:00.0', '2025-03-22T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1546, '2025-03-23 00:00:00', '2025-03-22T18:15:00.0', '2025-03-22T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1547, '2025-03-23 00:00:00', '2025-03-22T18:30:00.0', '2025-03-22T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1548, '2025-03-23 00:00:00', '2025-03-22T18:45:00.0', '2025-03-22T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1549, '2025-03-23 00:00:00', '2025-03-22T19:00:00.0', '2025-03-22T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1550, '2025-03-23 00:00:00', '2025-03-22T19:15:00.0', '2025-03-22T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1551, '2025-03-23 00:00:00', '2025-03-22T19:30:00.0', '2025-03-22T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1552, '2025-03-23 00:00:00', '2025-03-22T19:45:00.0', '2025-03-22T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1553, '2025-03-23 00:00:00', '2025-03-22T20:00:00.0', '2025-03-22T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1554, '2025-03-23 00:00:00', '2025-03-22T20:15:00.0', '2025-03-22T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1555, '2025-03-23 00:00:00', '2025-03-22T20:30:00.0', '2025-03-22T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1556, '2025-03-23 00:00:00', '2025-03-22T20:45:00.0', '2025-03-22T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1557, '2025-03-23 00:00:00', '2025-03-22T21:00:00.0', '2025-03-22T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1558, '2025-03-23 00:00:00', '2025-03-22T21:15:00.0', '2025-03-22T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1559, '2025-03-23 00:00:00', '2025-03-22T21:30:00.0', '2025-03-22T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1560, '2025-03-23 00:00:00', '2025-03-22T21:45:00.0', '2025-03-22T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1561, '2025-03-23 00:00:00', '2025-03-22T22:00:00.0', '2025-03-22T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1562, '2025-03-23 00:00:00', '2025-03-22T22:15:00.0', '2025-03-22T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1563, '2025-03-23 00:00:00', '2025-03-22T22:30:00.0', '2025-03-22T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1564, '2025-03-23 00:00:00', '2025-03-22T22:45:00.0', '2025-03-22T23:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1565, '2025-03-23 00:00:00', '2025-03-22T23:00:00.0', '2025-03-22T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1566, '2025-03-23 00:00:00', '2025-03-22T23:15:00.0', '2025-03-22T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1567, '2025-03-23 00:00:00', '2025-03-22T23:30:00.0', '2025-03-22T23:45:00.0', 63, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1568, '2025-03-23 00:00:00', '2025-03-22T23:45:00.0', '2025-03-23T00:00:00.0', 257, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1569, '2025-03-23 00:00:00', '2025-03-23T00:00:00.0', '2025-03-23T00:15:00.0', 284, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1570, '2025-03-23 00:00:00', '2025-03-23T00:15:00.0', '2025-03-23T00:30:00.0', 107, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1571, '2025-03-23 00:00:00', '2025-03-23T00:30:00.0', '2025-03-23T00:45:00.0', 232, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1572, '2025-03-23 00:00:00', '2025-03-23T00:45:00.0', '2025-03-23T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1573, '2025-03-23 00:00:00', '2025-03-23T01:00:00.0', '2025-03-23T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1574, '2025-03-23 00:00:00', '2025-03-23T01:15:00.0', '2025-03-23T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1575, '2025-03-23 00:00:00', '2025-03-23T01:30:00.0', '2025-03-23T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1576, '2025-03-23 00:00:00', '2025-03-23T01:45:00.0', '2025-03-23T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1577, '2025-03-23 00:00:00', '2025-03-23T02:00:00.0', '2025-03-23T02:15:00.0', 39, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1578, '2025-03-23 00:00:00', '2025-03-23T02:15:00.0', '2025-03-23T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1579, '2025-03-23 00:00:00', '2025-03-23T02:30:00.0', '2025-03-23T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1580, '2025-03-23 00:00:00', '2025-03-23T02:45:00.0', '2025-03-23T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1581, '2025-03-23 00:00:00', '2025-03-23T03:00:00.0', '2025-03-23T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1582, '2025-03-23 00:00:00', '2025-03-23T03:15:00.0', '2025-03-23T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1583, '2025-03-23 00:00:00', '2025-03-23T03:30:00.0', '2025-03-23T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1584, '2025-03-23 00:00:00', '2025-03-23T03:45:00.0', '2025-03-23T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1585, '2025-03-23 00:00:00', '2025-03-23T04:00:00.0', '2025-03-23T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1586, '2025-03-23 00:00:00', '2025-03-23T04:15:00.0', '2025-03-23T04:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1587, '2025-03-23 00:00:00', '2025-03-23T04:30:00.0', '2025-03-23T04:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1588, '2025-03-23 00:00:00', '2025-03-23T04:45:00.0', '2025-03-23T05:00:00.0', 234, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1589, '2025-03-23 00:00:00', '2025-03-23T05:00:00.0', '2025-03-23T05:15:00.0', 405, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1590, '2025-03-23 00:00:00', '2025-03-23T05:15:00.0', '2025-03-23T05:30:00.0', 18, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1591, '2025-03-23 00:00:00', '2025-03-23T05:30:00.0', '2025-03-23T05:45:00.0', 353, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1592, '2025-03-23 00:00:00', '2025-03-23T05:45:00.0', '2025-03-23T06:00:00.0', 515, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1593, '2025-03-23 00:00:00', '2025-03-23T06:00:00.0', '2025-03-23T06:15:00.0', 141, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1594, '2025-03-23 00:00:00', '2025-03-23T06:15:00.0', '2025-03-23T06:30:00.0', 92, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1595, '2025-03-23 00:00:00', '2025-03-23T06:30:00.0', '2025-03-23T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1596, '2025-03-23 00:00:00', '2025-03-23T06:45:00.0', '2025-03-23T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1597, '2025-03-23 00:00:00', '2025-03-23T07:00:00.0', '2025-03-23T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1598, '2025-03-23 00:00:00', '2025-03-23T07:15:00.0', '2025-03-23T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1599, '2025-03-23 00:00:00', '2025-03-23T07:30:00.0', '2025-03-23T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1600, '2025-03-23 00:00:00', '2025-03-23T07:45:00.0', '2025-03-23T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1601, '2025-03-23 00:00:00', '2025-03-23T08:00:00.0', '2025-03-23T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1602, '2025-03-23 00:00:00', '2025-03-23T08:15:00.0', '2025-03-23T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1603, '2025-03-23 00:00:00', '2025-03-23T08:30:00.0', '2025-03-23T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1604, '2025-03-23 00:00:00', '2025-03-23T08:45:00.0', '2025-03-23T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1605, '2025-03-23 00:00:00', '2025-03-23T09:00:00.0', '2025-03-23T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1606, '2025-03-23 00:00:00', '2025-03-23T09:15:00.0', '2025-03-23T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1607, '2025-03-23 00:00:00', '2025-03-23T09:30:00.0', '2025-03-23T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1608, '2025-03-23 00:00:00', '2025-03-23T09:45:00.0', '2025-03-23T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1609, '2025-03-23 00:00:00', '2025-03-23T10:00:00.0', '2025-03-23T10:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1610, '2025-03-23 00:00:00', '2025-03-23T10:15:00.0', '2025-03-23T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1611, '2025-03-23 00:00:00', '2025-03-23T10:30:00.0', '2025-03-23T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1612, '2025-03-23 00:00:00', '2025-03-23T10:45:00.0', '2025-03-23T11:00:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1613, '2025-03-23 00:00:00', '2025-03-23T11:00:00.0', '2025-03-23T11:15:00.0', 243, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1614, '2025-03-23 00:00:00', '2025-03-23T11:15:00.0', '2025-03-23T11:30:00.0', 387, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1615, '2025-03-23 00:00:00', '2025-03-23T11:30:00.0', '2025-03-23T11:45:00.0', 135, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1616, '2025-03-23 00:00:00', '2025-03-23T11:45:00.0', '2025-03-23T12:00:00.0', 413, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1617, '2025-03-23 00:00:00', '2025-03-23T12:00:00.0', '2025-03-23T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1618, '2025-03-23 00:00:00', '2025-03-23T12:15:00.0', '2025-03-23T12:30:00.0', 21, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1619, '2025-03-23 00:00:00', '2025-03-23T12:30:00.0', '2025-03-23T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1620, '2025-03-23 00:00:00', '2025-03-23T12:45:00.0', '2025-03-23T13:00:00.0', 192, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1621, '2025-03-23 00:00:00', '2025-03-23T13:00:00.0', '2025-03-23T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1622, '2025-03-23 00:00:00', '2025-03-23T13:15:00.0', '2025-03-23T13:30:00.0', 10, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1623, '2025-03-23 00:00:00', '2025-03-23T13:30:00.0', '2025-03-23T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1624, '2025-03-23 00:00:00', '2025-03-23T13:45:00.0', '2025-03-23T14:00:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1625, '2025-03-23 00:00:00', '2025-03-23T14:00:00.0', '2025-03-23T14:15:00.0', 118, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1626, '2025-03-23 00:00:00', '2025-03-23T14:15:00.0', '2025-03-23T14:30:00.0', 32, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1627, '2025-03-23 00:00:00', '2025-03-23T14:30:00.0', '2025-03-23T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1628, '2025-03-23 00:00:00', '2025-03-23T14:45:00.0', '2025-03-23T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1629, '2025-03-23 00:00:00', '2025-03-23T15:00:00.0', '2025-03-23T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1630, '2025-03-23 00:00:00', '2025-03-23T15:15:00.0', '2025-03-23T15:30:00.0', 309, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1631, '2025-03-23 00:00:00', '2025-03-23T15:30:00.0', '2025-03-23T15:45:00.0', 322, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1632, '2025-03-23 00:00:00', '2025-03-23T15:45:00.0', '2025-03-23T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1633, '2025-03-24 00:00:00', '2025-03-23T16:00:00.0', '2025-03-23T16:15:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1634, '2025-03-24 00:00:00', '2025-03-23T16:15:00.0', '2025-03-23T16:30:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1635, '2025-03-24 00:00:00', '2025-03-23T16:30:00.0', '2025-03-23T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1636, '2025-03-24 00:00:00', '2025-03-23T16:45:00.0', '2025-03-23T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1637, '2025-03-24 00:00:00', '2025-03-23T17:00:00.0', '2025-03-23T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1638, '2025-03-24 00:00:00', '2025-03-23T17:15:00.0', '2025-03-23T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1639, '2025-03-24 00:00:00', '2025-03-23T17:30:00.0', '2025-03-23T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1640, '2025-03-24 00:00:00', '2025-03-23T17:45:00.0', '2025-03-23T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1641, '2025-03-24 00:00:00', '2025-03-23T18:00:00.0', '2025-03-23T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1642, '2025-03-24 00:00:00', '2025-03-23T18:15:00.0', '2025-03-23T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1643, '2025-03-24 00:00:00', '2025-03-23T18:30:00.0', '2025-03-23T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1644, '2025-03-24 00:00:00', '2025-03-23T18:45:00.0', '2025-03-23T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1645, '2025-03-24 00:00:00', '2025-03-23T19:00:00.0', '2025-03-23T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1646, '2025-03-24 00:00:00', '2025-03-23T19:15:00.0', '2025-03-23T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1647, '2025-03-24 00:00:00', '2025-03-23T19:30:00.0', '2025-03-23T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1648, '2025-03-24 00:00:00', '2025-03-23T19:45:00.0', '2025-03-23T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1649, '2025-03-24 00:00:00', '2025-03-23T20:00:00.0', '2025-03-23T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1650, '2025-03-24 00:00:00', '2025-03-23T20:15:00.0', '2025-03-23T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1651, '2025-03-24 00:00:00', '2025-03-23T20:30:00.0', '2025-03-23T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1652, '2025-03-24 00:00:00', '2025-03-23T20:45:00.0', '2025-03-23T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1653, '2025-03-24 00:00:00', '2025-03-23T21:00:00.0', '2025-03-23T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1654, '2025-03-24 00:00:00', '2025-03-23T21:15:00.0', '2025-03-23T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1655, '2025-03-24 00:00:00', '2025-03-23T21:30:00.0', '2025-03-23T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1656, '2025-03-24 00:00:00', '2025-03-23T21:45:00.0', '2025-03-23T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1657, '2025-03-24 00:00:00', '2025-03-23T22:00:00.0', '2025-03-23T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1658, '2025-03-24 00:00:00', '2025-03-23T22:15:00.0', '2025-03-23T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1659, '2025-03-24 00:00:00', '2025-03-23T22:30:00.0', '2025-03-23T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1660, '2025-03-24 00:00:00', '2025-03-23T22:45:00.0', '2025-03-23T23:00:00.0', 33, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1661, '2025-03-24 00:00:00', '2025-03-23T23:00:00.0', '2025-03-23T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1662, '2025-03-24 00:00:00', '2025-03-23T23:15:00.0', '2025-03-23T23:30:00.0', 123, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1663, '2025-03-24 00:00:00', '2025-03-23T23:30:00.0', '2025-03-23T23:45:00.0', 80, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1664, '2025-03-24 00:00:00', '2025-03-23T23:45:00.0', '2025-03-24T00:00:00.0', 703, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1665, '2025-03-24 00:00:00', '2025-03-24T00:00:00.0', '2025-03-24T00:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1666, '2025-03-24 00:00:00', '2025-03-24T00:15:00.0', '2025-03-24T00:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1667, '2025-03-24 00:00:00', '2025-03-24T00:30:00.0', '2025-03-24T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1668, '2025-03-24 00:00:00', '2025-03-24T00:45:00.0', '2025-03-24T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1669, '2025-03-24 00:00:00', '2025-03-24T01:00:00.0', '2025-03-24T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1670, '2025-03-24 00:00:00', '2025-03-24T01:15:00.0', '2025-03-24T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1671, '2025-03-24 00:00:00', '2025-03-24T01:30:00.0', '2025-03-24T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1672, '2025-03-24 00:00:00', '2025-03-24T01:45:00.0', '2025-03-24T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1673, '2025-03-24 00:00:00', '2025-03-24T02:00:00.0', '2025-03-24T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1674, '2025-03-24 00:00:00', '2025-03-24T02:15:00.0', '2025-03-24T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1675, '2025-03-24 00:00:00', '2025-03-24T02:30:00.0', '2025-03-24T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1676, '2025-03-24 00:00:00', '2025-03-24T02:45:00.0', '2025-03-24T03:00:00.0', 54, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1677, '2025-03-24 00:00:00', '2025-03-24T03:00:00.0', '2025-03-24T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1678, '2025-03-24 00:00:00', '2025-03-24T03:15:00.0', '2025-03-24T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1679, '2025-03-24 00:00:00', '2025-03-24T03:30:00.0', '2025-03-24T03:45:00.0', 53, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1680, '2025-03-24 00:00:00', '2025-03-24T03:45:00.0', '2025-03-24T04:00:00.0', 52, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1681, '2025-03-24 00:00:00', '2025-03-24T04:00:00.0', '2025-03-24T04:15:00.0', 429, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1682, '2025-03-24 00:00:00', '2025-03-24T04:15:00.0', '2025-03-24T04:30:00.0', 259, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1683, '2025-03-24 00:00:00', '2025-03-24T04:30:00.0', '2025-03-24T04:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1684, '2025-03-24 00:00:00', '2025-03-24T04:45:00.0', '2025-03-24T05:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1685, '2025-03-24 00:00:00', '2025-03-24T05:00:00.0', '2025-03-24T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1686, '2025-03-24 00:00:00', '2025-03-24T05:15:00.0', '2025-03-24T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1687, '2025-03-24 00:00:00', '2025-03-24T05:30:00.0', '2025-03-24T05:45:00.0', 364, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1688, '2025-03-24 00:00:00', '2025-03-24T05:45:00.0', '2025-03-24T06:00:00.0', 47, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1689, '2025-03-24 00:00:00', '2025-03-24T06:00:00.0', '2025-03-24T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1690, '2025-03-24 00:00:00', '2025-03-24T06:15:00.0', '2025-03-24T06:30:00.0', 47, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1691, '2025-03-24 00:00:00', '2025-03-24T06:30:00.0', '2025-03-24T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1692, '2025-03-24 00:00:00', '2025-03-24T06:45:00.0', '2025-03-24T07:00:00.0', 627, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1693, '2025-03-24 00:00:00', '2025-03-24T07:00:00.0', '2025-03-24T07:15:00.0', 95, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1694, '2025-03-24 00:00:00', '2025-03-24T07:15:00.0', '2025-03-24T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1695, '2025-03-24 00:00:00', '2025-03-24T07:30:00.0', '2025-03-24T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1696, '2025-03-24 00:00:00', '2025-03-24T07:45:00.0', '2025-03-24T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1697, '2025-03-24 00:00:00', '2025-03-24T08:00:00.0', '2025-03-24T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1698, '2025-03-24 00:00:00', '2025-03-24T08:15:00.0', '2025-03-24T08:30:00.0', 6, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1699, '2025-03-24 00:00:00', '2025-03-24T08:30:00.0', '2025-03-24T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1700, '2025-03-24 00:00:00', '2025-03-24T08:45:00.0', '2025-03-24T09:00:00.0', 133, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1701, '2025-03-24 00:00:00', '2025-03-24T09:00:00.0', '2025-03-24T09:15:00.0', 354, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1702, '2025-03-24 00:00:00', '2025-03-24T09:15:00.0', '2025-03-24T09:30:00.0', 119, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1703, '2025-03-24 00:00:00', '2025-03-24T09:30:00.0', '2025-03-24T09:45:00.0', 92, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1704, '2025-03-24 00:00:00', '2025-03-24T09:45:00.0', '2025-03-24T10:00:00.0', 168, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1705, '2025-03-24 00:00:00', '2025-03-24T10:00:00.0', '2025-03-24T10:15:00.0', 111, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1706, '2025-03-24 00:00:00', '2025-03-24T10:15:00.0', '2025-03-24T10:30:00.0', 55, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1707, '2025-03-24 00:00:00', '2025-03-24T10:30:00.0', '2025-03-24T10:45:00.0', 26, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1708, '2025-03-24 00:00:00', '2025-03-24T10:45:00.0', '2025-03-24T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1709, '2025-03-24 00:00:00', '2025-03-24T11:00:00.0', '2025-03-24T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1710, '2025-03-24 00:00:00', '2025-03-24T11:15:00.0', '2025-03-24T11:30:00.0', 141, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1711, '2025-03-24 00:00:00', '2025-03-24T11:30:00.0', '2025-03-24T11:45:00.0', 18, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1712, '2025-03-24 00:00:00', '2025-03-24T11:45:00.0', '2025-03-24T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1713, '2025-03-24 00:00:00', '2025-03-24T12:00:00.0', '2025-03-24T12:15:00.0', 325, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1714, '2025-03-24 00:00:00', '2025-03-24T12:15:00.0', '2025-03-24T12:30:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1715, '2025-03-24 00:00:00', '2025-03-24T12:30:00.0', '2025-03-24T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1716, '2025-03-24 00:00:00', '2025-03-24T12:45:00.0', '2025-03-24T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1717, '2025-03-24 00:00:00', '2025-03-24T13:00:00.0', '2025-03-24T13:15:00.0', 39, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1718, '2025-03-24 00:00:00', '2025-03-24T13:15:00.0', '2025-03-24T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1719, '2025-03-24 00:00:00', '2025-03-24T13:30:00.0', '2025-03-24T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1720, '2025-03-24 00:00:00', '2025-03-24T13:45:00.0', '2025-03-24T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1721, '2025-03-24 00:00:00', '2025-03-24T14:00:00.0', '2025-03-24T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1722, '2025-03-24 00:00:00', '2025-03-24T14:15:00.0', '2025-03-24T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1723, '2025-03-24 00:00:00', '2025-03-24T14:30:00.0', '2025-03-24T14:45:00.0', 131, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1724, '2025-03-24 00:00:00', '2025-03-24T14:45:00.0', '2025-03-24T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1725, '2025-03-24 00:00:00', '2025-03-24T15:00:00.0', '2025-03-24T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1726, '2025-03-24 00:00:00', '2025-03-24T15:15:00.0', '2025-03-24T15:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1727, '2025-03-24 00:00:00', '2025-03-24T15:30:00.0', '2025-03-24T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1728, '2025-03-24 00:00:00', '2025-03-24T15:45:00.0', '2025-03-24T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1729, '2025-03-25 00:00:00', '2025-03-24T16:00:00.0', '2025-03-24T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1730, '2025-03-25 00:00:00', '2025-03-24T16:15:00.0', '2025-03-24T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1731, '2025-03-25 00:00:00', '2025-03-24T16:30:00.0', '2025-03-24T16:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1732, '2025-03-25 00:00:00', '2025-03-24T16:45:00.0', '2025-03-24T17:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1733, '2025-03-25 00:00:00', '2025-03-24T17:00:00.0', '2025-03-24T17:15:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1734, '2025-03-25 00:00:00', '2025-03-24T17:15:00.0', '2025-03-24T17:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1735, '2025-03-25 00:00:00', '2025-03-24T17:30:00.0', '2025-03-24T17:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1736, '2025-03-25 00:00:00', '2025-03-24T17:45:00.0', '2025-03-24T18:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1737, '2025-03-25 00:00:00', '2025-03-24T18:00:00.0', '2025-03-24T18:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1738, '2025-03-25 00:00:00', '2025-03-24T18:15:00.0', '2025-03-24T18:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1739, '2025-03-25 00:00:00', '2025-03-24T18:30:00.0', '2025-03-24T18:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1740, '2025-03-25 00:00:00', '2025-03-24T18:45:00.0', '2025-03-24T19:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1741, '2025-03-25 00:00:00', '2025-03-24T19:00:00.0', '2025-03-24T19:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1742, '2025-03-25 00:00:00', '2025-03-24T19:15:00.0', '2025-03-24T19:30:00.0', 21, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1743, '2025-03-25 00:00:00', '2025-03-24T19:30:00.0', '2025-03-24T19:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1744, '2025-03-25 00:00:00', '2025-03-24T19:45:00.0', '2025-03-24T20:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1745, '2025-03-25 00:00:00', '2025-03-24T20:00:00.0', '2025-03-24T20:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1746, '2025-03-25 00:00:00', '2025-03-24T20:15:00.0', '2025-03-24T20:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1747, '2025-03-25 00:00:00', '2025-03-24T20:30:00.0', '2025-03-24T20:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1748, '2025-03-25 00:00:00', '2025-03-24T20:45:00.0', '2025-03-24T21:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1749, '2025-03-25 00:00:00', '2025-03-24T21:00:00.0', '2025-03-24T21:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1750, '2025-03-25 00:00:00', '2025-03-24T21:15:00.0', '2025-03-24T21:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1751, '2025-03-25 00:00:00', '2025-03-24T21:30:00.0', '2025-03-24T21:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1752, '2025-03-25 00:00:00', '2025-03-24T21:45:00.0', '2025-03-24T22:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1753, '2025-03-25 00:00:00', '2025-03-24T22:00:00.0', '2025-03-24T22:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1754, '2025-03-25 00:00:00', '2025-03-24T22:15:00.0', '2025-03-24T22:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1755, '2025-03-25 00:00:00', '2025-03-24T22:30:00.0', '2025-03-24T22:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1756, '2025-03-25 00:00:00', '2025-03-24T22:45:00.0', '2025-03-24T23:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1757, '2025-03-25 00:00:00', '2025-03-24T23:00:00.0', '2025-03-24T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1758, '2025-03-25 00:00:00', '2025-03-24T23:15:00.0', '2025-03-24T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1759, '2025-03-25 00:00:00', '2025-03-24T23:30:00.0', '2025-03-24T23:45:00.0', 120, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1760, '2025-03-25 00:00:00', '2025-03-24T23:45:00.0', '2025-03-25T00:00:00.0', 151, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1761, '2025-03-25 00:00:00', '2025-03-25T00:00:00.0', '2025-03-25T00:15:00.0', 195, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1762, '2025-03-25 00:00:00', '2025-03-25T00:15:00.0', '2025-03-25T00:30:00.0', 314, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1763, '2025-03-25 00:00:00', '2025-03-25T00:30:00.0', '2025-03-25T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1764, '2025-03-25 00:00:00', '2025-03-25T00:45:00.0', '2025-03-25T01:00:00.0', 92, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1765, '2025-03-25 00:00:00', '2025-03-25T01:00:00.0', '2025-03-25T01:15:00.0', 73, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1766, '2025-03-25 00:00:00', '2025-03-25T01:15:00.0', '2025-03-25T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1767, '2025-03-25 00:00:00', '2025-03-25T01:30:00.0', '2025-03-25T01:45:00.0', 29, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1768, '2025-03-25 00:00:00', '2025-03-25T01:45:00.0', '2025-03-25T02:00:00.0', 151, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1769, '2025-03-25 00:00:00', '2025-03-25T02:00:00.0', '2025-03-25T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1770, '2025-03-25 00:00:00', '2025-03-25T02:15:00.0', '2025-03-25T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1771, '2025-03-25 00:00:00', '2025-03-25T02:30:00.0', '2025-03-25T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1772, '2025-03-25 00:00:00', '2025-03-25T02:45:00.0', '2025-03-25T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1773, '2025-03-25 00:00:00', '2025-03-25T03:00:00.0', '2025-03-25T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1774, '2025-03-25 00:00:00', '2025-03-25T03:15:00.0', '2025-03-25T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1775, '2025-03-25 00:00:00', '2025-03-25T03:30:00.0', '2025-03-25T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1776, '2025-03-25 00:00:00', '2025-03-25T03:45:00.0', '2025-03-25T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1777, '2025-03-25 00:00:00', '2025-03-25T04:00:00.0', '2025-03-25T04:15:00.0', 279, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1778, '2025-03-25 00:00:00', '2025-03-25T04:15:00.0', '2025-03-25T04:30:00.0', 216, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1779, '2025-03-25 00:00:00', '2025-03-25T04:30:00.0', '2025-03-25T04:45:00.0', 292, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1780, '2025-03-25 00:00:00', '2025-03-25T04:45:00.0', '2025-03-25T05:00:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1781, '2025-03-25 00:00:00', '2025-03-25T05:00:00.0', '2025-03-25T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1782, '2025-03-25 00:00:00', '2025-03-25T05:15:00.0', '2025-03-25T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1783, '2025-03-25 00:00:00', '2025-03-25T05:30:00.0', '2025-03-25T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1784, '2025-03-25 00:00:00', '2025-03-25T05:45:00.0', '2025-03-25T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1785, '2025-03-25 00:00:00', '2025-03-25T06:00:00.0', '2025-03-25T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1786, '2025-03-25 00:00:00', '2025-03-25T06:15:00.0', '2025-03-25T06:30:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1787, '2025-03-25 00:00:00', '2025-03-25T06:30:00.0', '2025-03-25T06:45:00.0', 318, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1788, '2025-03-25 00:00:00', '2025-03-25T06:45:00.0', '2025-03-25T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1789, '2025-03-25 00:00:00', '2025-03-25T07:00:00.0', '2025-03-25T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1790, '2025-03-25 00:00:00', '2025-03-25T07:15:00.0', '2025-03-25T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1791, '2025-03-25 00:00:00', '2025-03-25T07:30:00.0', '2025-03-25T07:45:00.0', 14, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1792, '2025-03-25 00:00:00', '2025-03-25T07:45:00.0', '2025-03-25T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1793, '2025-03-25 00:00:00', '2025-03-25T08:00:00.0', '2025-03-25T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1794, '2025-03-25 00:00:00', '2025-03-25T08:15:00.0', '2025-03-25T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1795, '2025-03-25 00:00:00', '2025-03-25T08:30:00.0', '2025-03-25T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1796, '2025-03-25 00:00:00', '2025-03-25T08:45:00.0', '2025-03-25T09:00:00.0', 326, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1797, '2025-03-25 00:00:00', '2025-03-25T09:00:00.0', '2025-03-25T09:15:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1798, '2025-03-25 00:00:00', '2025-03-25T09:15:00.0', '2025-03-25T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1799, '2025-03-25 00:00:00', '2025-03-25T09:30:00.0', '2025-03-25T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1800, '2025-03-25 00:00:00', '2025-03-25T09:45:00.0', '2025-03-25T10:00:00.0', 664, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1801, '2025-03-25 00:00:00', '2025-03-25T10:00:00.0', '2025-03-25T10:15:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1802, '2025-03-25 00:00:00', '2025-03-25T10:15:00.0', '2025-03-25T10:30:00.0', 140, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1803, '2025-03-25 00:00:00', '2025-03-25T10:30:00.0', '2025-03-25T10:45:00.0', 105, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1804, '2025-03-25 00:00:00', '2025-03-25T10:45:00.0', '2025-03-25T11:00:00.0', 191, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1805, '2025-03-25 00:00:00', '2025-03-25T11:00:00.0', '2025-03-25T11:15:00.0', 15, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1806, '2025-03-25 00:00:00', '2025-03-25T11:15:00.0', '2025-03-25T11:30:00.0', 178, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1807, '2025-03-25 00:00:00', '2025-03-25T11:30:00.0', '2025-03-25T11:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1808, '2025-03-25 00:00:00', '2025-03-25T11:45:00.0', '2025-03-25T12:00:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1809, '2025-03-25 00:00:00', '2025-03-25T12:00:00.0', '2025-03-25T12:15:00.0', 20, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1810, '2025-03-25 00:00:00', '2025-03-25T12:15:00.0', '2025-03-25T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1811, '2025-03-25 00:00:00', '2025-03-25T12:30:00.0', '2025-03-25T12:45:00.0', 103, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1812, '2025-03-25 00:00:00', '2025-03-25T12:45:00.0', '2025-03-25T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1813, '2025-03-25 00:00:00', '2025-03-25T13:00:00.0', '2025-03-25T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1814, '2025-03-25 00:00:00', '2025-03-25T13:15:00.0', '2025-03-25T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1815, '2025-03-25 00:00:00', '2025-03-25T13:30:00.0', '2025-03-25T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1816, '2025-03-25 00:00:00', '2025-03-25T13:45:00.0', '2025-03-25T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1817, '2025-03-25 00:00:00', '2025-03-25T14:00:00.0', '2025-03-25T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1818, '2025-03-25 00:00:00', '2025-03-25T14:15:00.0', '2025-03-25T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1819, '2025-03-25 00:00:00', '2025-03-25T14:30:00.0', '2025-03-25T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1820, '2025-03-25 00:00:00', '2025-03-25T14:45:00.0', '2025-03-25T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1821, '2025-03-25 00:00:00', '2025-03-25T15:00:00.0', '2025-03-25T15:15:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (1822, '2025-03-25 00:00:00', '2025-03-25T15:15:00.0', '2025-03-25T15:30:00.0', 43, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1823, '2025-03-25 00:00:00', '2025-03-25T15:30:00.0', '2025-03-25T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1824, '2025-03-25 00:00:00', '2025-03-25T15:45:00.0', '2025-03-25T16:00:00.0', 10, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1825, '2025-03-26 00:00:00', '2025-03-25T16:00:00.0', '2025-03-25T16:15:00.0', 100, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1826, '2025-03-26 00:00:00', '2025-03-25T16:15:00.0', '2025-03-25T16:30:00.0', 547, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1827, '2025-03-26 00:00:00', '2025-03-25T16:30:00.0', '2025-03-25T16:45:00.0', 33, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1828, '2025-03-26 00:00:00', '2025-03-25T16:45:00.0', '2025-03-25T17:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1829, '2025-03-26 00:00:00', '2025-03-25T17:00:00.0', '2025-03-25T17:15:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1830, '2025-03-26 00:00:00', '2025-03-25T17:15:00.0', '2025-03-25T17:30:00.0', 17, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1831, '2025-03-26 00:00:00', '2025-03-25T17:30:00.0', '2025-03-25T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1832, '2025-03-26 00:00:00', '2025-03-25T17:45:00.0', '2025-03-25T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1833, '2025-03-26 00:00:00', '2025-03-25T18:00:00.0', '2025-03-25T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1834, '2025-03-26 00:00:00', '2025-03-25T18:15:00.0', '2025-03-25T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1835, '2025-03-26 00:00:00', '2025-03-25T18:30:00.0', '2025-03-25T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1836, '2025-03-26 00:00:00', '2025-03-25T18:45:00.0', '2025-03-25T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1837, '2025-03-26 00:00:00', '2025-03-25T19:00:00.0', '2025-03-25T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1838, '2025-03-26 00:00:00', '2025-03-25T19:15:00.0', '2025-03-25T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1839, '2025-03-26 00:00:00', '2025-03-25T19:30:00.0', '2025-03-25T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1840, '2025-03-26 00:00:00', '2025-03-25T19:45:00.0', '2025-03-25T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1841, '2025-03-26 00:00:00', '2025-03-25T20:00:00.0', '2025-03-25T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1842, '2025-03-26 00:00:00', '2025-03-25T20:15:00.0', '2025-03-25T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1843, '2025-03-26 00:00:00', '2025-03-25T20:30:00.0', '2025-03-25T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1844, '2025-03-26 00:00:00', '2025-03-25T20:45:00.0', '2025-03-25T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1845, '2025-03-26 00:00:00', '2025-03-25T21:00:00.0', '2025-03-25T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1846, '2025-03-26 00:00:00', '2025-03-25T21:15:00.0', '2025-03-25T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1847, '2025-03-26 00:00:00', '2025-03-25T21:30:00.0', '2025-03-25T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1848, '2025-03-26 00:00:00', '2025-03-25T21:45:00.0', '2025-03-25T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1849, '2025-03-26 00:00:00', '2025-03-25T22:00:00.0', '2025-03-25T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1850, '2025-03-26 00:00:00', '2025-03-25T22:15:00.0', '2025-03-25T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1851, '2025-03-26 00:00:00', '2025-03-25T22:30:00.0', '2025-03-25T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1852, '2025-03-26 00:00:00', '2025-03-25T22:45:00.0', '2025-03-25T23:00:00.0', 106, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1853, '2025-03-26 00:00:00', '2025-03-25T23:00:00.0', '2025-03-25T23:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1854, '2025-03-26 00:00:00', '2025-03-25T23:15:00.0', '2025-03-25T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1855, '2025-03-26 00:00:00', '2025-03-25T23:30:00.0', '2025-03-25T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1856, '2025-03-26 00:00:00', '2025-03-25T23:45:00.0', '2025-03-26T00:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1857, '2025-03-26 00:00:00', '2025-03-26T00:00:00.0', '2025-03-26T00:15:00.0', 150, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1858, '2025-03-26 00:00:00', '2025-03-26T00:15:00.0', '2025-03-26T00:30:00.0', 391, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1859, '2025-03-26 00:00:00', '2025-03-26T00:30:00.0', '2025-03-26T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1860, '2025-03-26 00:00:00', '2025-03-26T00:45:00.0', '2025-03-26T01:00:00.0', 29, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1861, '2025-03-26 00:00:00', '2025-03-26T01:00:00.0', '2025-03-26T01:15:00.0', 163, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1862, '2025-03-26 00:00:00', '2025-03-26T01:15:00.0', '2025-03-26T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1863, '2025-03-26 00:00:00', '2025-03-26T01:30:00.0', '2025-03-26T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1864, '2025-03-26 00:00:00', '2025-03-26T01:45:00.0', '2025-03-26T02:00:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1865, '2025-03-26 00:00:00', '2025-03-26T02:00:00.0', '2025-03-26T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1866, '2025-03-26 00:00:00', '2025-03-26T02:15:00.0', '2025-03-26T02:30:00.0', 250, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1867, '2025-03-26 00:00:00', '2025-03-26T02:30:00.0', '2025-03-26T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1868, '2025-03-26 00:00:00', '2025-03-26T02:45:00.0', '2025-03-26T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1869, '2025-03-26 00:00:00', '2025-03-26T03:00:00.0', '2025-03-26T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1870, '2025-03-26 00:00:00', '2025-03-26T03:15:00.0', '2025-03-26T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1871, '2025-03-26 00:00:00', '2025-03-26T03:30:00.0', '2025-03-26T03:45:00.0', 135, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1872, '2025-03-26 00:00:00', '2025-03-26T03:45:00.0', '2025-03-26T04:00:00.0', 258, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1873, '2025-03-26 00:00:00', '2025-03-26T04:00:00.0', '2025-03-26T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1874, '2025-03-26 00:00:00', '2025-03-26T04:15:00.0', '2025-03-26T04:30:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1875, '2025-03-26 00:00:00', '2025-03-26T04:30:00.0', '2025-03-26T04:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1876, '2025-03-26 00:00:00', '2025-03-26T04:45:00.0', '2025-03-26T05:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1877, '2025-03-26 00:00:00', '2025-03-26T05:00:00.0', '2025-03-26T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1878, '2025-03-26 00:00:00', '2025-03-26T05:15:00.0', '2025-03-26T05:30:00.0', 45, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1879, '2025-03-26 00:00:00', '2025-03-26T05:30:00.0', '2025-03-26T05:45:00.0', 505, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (1880, '2025-03-26 00:00:00', '2025-03-26T05:45:00.0', '2025-03-26T06:00:00.0', 61, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1881, '2025-03-26 00:00:00', '2025-03-26T06:00:00.0', '2025-03-26T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1882, '2025-03-26 00:00:00', '2025-03-26T06:15:00.0', '2025-03-26T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1883, '2025-03-26 00:00:00', '2025-03-26T06:30:00.0', '2025-03-26T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1884, '2025-03-26 00:00:00', '2025-03-26T06:45:00.0', '2025-03-26T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1885, '2025-03-26 00:00:00', '2025-03-26T07:00:00.0', '2025-03-26T07:15:00.0', 140, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1886, '2025-03-26 00:00:00', '2025-03-26T07:15:00.0', '2025-03-26T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1887, '2025-03-26 00:00:00', '2025-03-26T07:30:00.0', '2025-03-26T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1888, '2025-03-26 00:00:00', '2025-03-26T07:45:00.0', '2025-03-26T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1889, '2025-03-26 00:00:00', '2025-03-26T08:00:00.0', '2025-03-26T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1890, '2025-03-26 00:00:00', '2025-03-26T08:15:00.0', '2025-03-26T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1891, '2025-03-26 00:00:00', '2025-03-26T08:30:00.0', '2025-03-26T08:45:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1892, '2025-03-26 00:00:00', '2025-03-26T08:45:00.0', '2025-03-26T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1893, '2025-03-26 00:00:00', '2025-03-26T09:00:00.0', '2025-03-26T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1894, '2025-03-26 00:00:00', '2025-03-26T09:15:00.0', '2025-03-26T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1895, '2025-03-26 00:00:00', '2025-03-26T09:30:00.0', '2025-03-26T09:45:00.0', 363, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1896, '2025-03-26 00:00:00', '2025-03-26T09:45:00.0', '2025-03-26T10:00:00.0', 150, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1897, '2025-03-26 00:00:00', '2025-03-26T10:00:00.0', '2025-03-26T10:15:00.0', 185, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1898, '2025-03-26 00:00:00', '2025-03-26T10:15:00.0', '2025-03-26T10:30:00.0', 151, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1899, '2025-03-26 00:00:00', '2025-03-26T10:30:00.0', '2025-03-26T10:45:00.0', 179, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1900, '2025-03-26 00:00:00', '2025-03-26T10:45:00.0', '2025-03-26T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1901, '2025-03-26 00:00:00', '2025-03-26T11:00:00.0', '2025-03-26T11:15:00.0', 182, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1902, '2025-03-26 00:00:00', '2025-03-26T11:15:00.0', '2025-03-26T11:30:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1903, '2025-03-26 00:00:00', '2025-03-26T11:30:00.0', '2025-03-26T11:45:00.0', 540, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1904, '2025-03-26 00:00:00', '2025-03-26T11:45:00.0', '2025-03-26T12:00:00.0', 0, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1905, '2025-03-26 00:00:00', '2025-03-26T12:00:00.0', '2025-03-26T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1906, '2025-03-26 00:00:00', '2025-03-26T12:15:00.0', '2025-03-26T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1907, '2025-03-26 00:00:00', '2025-03-26T12:30:00.0', '2025-03-26T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1908, '2025-03-26 00:00:00', '2025-03-26T12:45:00.0', '2025-03-26T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1909, '2025-03-26 00:00:00', '2025-03-26T13:00:00.0', '2025-03-26T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1910, '2025-03-26 00:00:00', '2025-03-26T13:15:00.0', '2025-03-26T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1911, '2025-03-26 00:00:00', '2025-03-26T13:30:00.0', '2025-03-26T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1912, '2025-03-26 00:00:00', '2025-03-26T13:45:00.0', '2025-03-26T14:00:00.0', 6, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1913, '2025-03-26 00:00:00', '2025-03-26T14:00:00.0', '2025-03-26T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1914, '2025-03-26 00:00:00', '2025-03-26T14:15:00.0', '2025-03-26T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1915, '2025-03-26 00:00:00', '2025-03-26T14:30:00.0', '2025-03-26T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1916, '2025-03-26 00:00:00', '2025-03-26T14:45:00.0', '2025-03-26T15:00:00.0', 468, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1917, '2025-03-26 00:00:00', '2025-03-26T15:00:00.0', '2025-03-26T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1918, '2025-03-26 00:00:00', '2025-03-26T15:15:00.0', '2025-03-26T15:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1919, '2025-03-26 00:00:00', '2025-03-26T15:30:00.0', '2025-03-26T15:45:00.0', 113, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1920, '2025-03-26 00:00:00', '2025-03-26T15:45:00.0', '2025-03-26T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1921, '2025-03-27 00:00:00', '2025-03-26T16:00:00.0', '2025-03-26T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1922, '2025-03-27 00:00:00', '2025-03-26T16:15:00.0', '2025-03-26T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1923, '2025-03-27 00:00:00', '2025-03-26T16:30:00.0', '2025-03-26T16:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1924, '2025-03-27 00:00:00', '2025-03-26T16:45:00.0', '2025-03-26T17:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1925, '2025-03-27 00:00:00', '2025-03-26T17:00:00.0', '2025-03-26T17:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1926, '2025-03-27 00:00:00', '2025-03-26T17:15:00.0', '2025-03-26T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1927, '2025-03-27 00:00:00', '2025-03-26T17:30:00.0', '2025-03-26T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1928, '2025-03-27 00:00:00', '2025-03-26T17:45:00.0', '2025-03-26T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1929, '2025-03-27 00:00:00', '2025-03-26T18:00:00.0', '2025-03-26T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1930, '2025-03-27 00:00:00', '2025-03-26T18:15:00.0', '2025-03-26T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1931, '2025-03-27 00:00:00', '2025-03-26T18:30:00.0', '2025-03-26T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1932, '2025-03-27 00:00:00', '2025-03-26T18:45:00.0', '2025-03-26T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1933, '2025-03-27 00:00:00', '2025-03-26T19:00:00.0', '2025-03-26T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1934, '2025-03-27 00:00:00', '2025-03-26T19:15:00.0', '2025-03-26T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1935, '2025-03-27 00:00:00', '2025-03-26T19:30:00.0', '2025-03-26T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1936, '2025-03-27 00:00:00', '2025-03-26T19:45:00.0', '2025-03-26T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1937, '2025-03-27 00:00:00', '2025-03-26T20:00:00.0', '2025-03-26T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1938, '2025-03-27 00:00:00', '2025-03-26T20:15:00.0', '2025-03-26T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1939, '2025-03-27 00:00:00', '2025-03-26T20:30:00.0', '2025-03-26T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1940, '2025-03-27 00:00:00', '2025-03-26T20:45:00.0', '2025-03-26T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1941, '2025-03-27 00:00:00', '2025-03-26T21:00:00.0', '2025-03-26T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1942, '2025-03-27 00:00:00', '2025-03-26T21:15:00.0', '2025-03-26T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1943, '2025-03-27 00:00:00', '2025-03-26T21:30:00.0', '2025-03-26T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1944, '2025-03-27 00:00:00', '2025-03-26T21:45:00.0', '2025-03-26T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1945, '2025-03-27 00:00:00', '2025-03-26T22:00:00.0', '2025-03-26T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1946, '2025-03-27 00:00:00', '2025-03-26T22:15:00.0', '2025-03-26T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1947, '2025-03-27 00:00:00', '2025-03-26T22:30:00.0', '2025-03-26T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1948, '2025-03-27 00:00:00', '2025-03-26T22:45:00.0', '2025-03-26T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1949, '2025-03-27 00:00:00', '2025-03-26T23:00:00.0', '2025-03-26T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1950, '2025-03-27 00:00:00', '2025-03-26T23:15:00.0', '2025-03-26T23:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1951, '2025-03-27 00:00:00', '2025-03-26T23:30:00.0', '2025-03-26T23:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1952, '2025-03-27 00:00:00', '2025-03-26T23:45:00.0', '2025-03-27T00:00:00.0', 57, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (1953, '2025-03-27 00:00:00', '2025-03-27T00:00:00.0', '2025-03-27T00:15:00.0', 285, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1954, '2025-03-27 00:00:00', '2025-03-27T00:15:00.0', '2025-03-27T00:30:00.0', 213, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (1955, '2025-03-27 00:00:00', '2025-03-27T00:30:00.0', '2025-03-27T00:45:00.0', 347, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1956, '2025-03-27 00:00:00', '2025-03-27T00:45:00.0', '2025-03-27T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1957, '2025-03-27 00:00:00', '2025-03-27T01:00:00.0', '2025-03-27T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1958, '2025-03-27 00:00:00', '2025-03-27T01:15:00.0', '2025-03-27T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1959, '2025-03-27 00:00:00', '2025-03-27T01:30:00.0', '2025-03-27T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1960, '2025-03-27 00:00:00', '2025-03-27T01:45:00.0', '2025-03-27T02:00:00.0', 161, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1961, '2025-03-27 00:00:00', '2025-03-27T02:00:00.0', '2025-03-27T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1962, '2025-03-27 00:00:00', '2025-03-27T02:15:00.0', '2025-03-27T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1963, '2025-03-27 00:00:00', '2025-03-27T02:30:00.0', '2025-03-27T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1964, '2025-03-27 00:00:00', '2025-03-27T02:45:00.0', '2025-03-27T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1965, '2025-03-27 00:00:00', '2025-03-27T03:00:00.0', '2025-03-27T03:15:00.0', 173, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1966, '2025-03-27 00:00:00', '2025-03-27T03:15:00.0', '2025-03-27T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1967, '2025-03-27 00:00:00', '2025-03-27T03:30:00.0', '2025-03-27T03:45:00.0', 193, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1968, '2025-03-27 00:00:00', '2025-03-27T03:45:00.0', '2025-03-27T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1969, '2025-03-27 00:00:00', '2025-03-27T04:00:00.0', '2025-03-27T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1970, '2025-03-27 00:00:00', '2025-03-27T04:15:00.0', '2025-03-27T04:30:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1971, '2025-03-27 00:00:00', '2025-03-27T04:30:00.0', '2025-03-27T04:45:00.0', 52, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1972, '2025-03-27 00:00:00', '2025-03-27T04:45:00.0', '2025-03-27T05:00:00.0', 455, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1973, '2025-03-27 00:00:00', '2025-03-27T05:00:00.0', '2025-03-27T05:15:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1974, '2025-03-27 00:00:00', '2025-03-27T05:15:00.0', '2025-03-27T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1975, '2025-03-27 00:00:00', '2025-03-27T05:30:00.0', '2025-03-27T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1976, '2025-03-27 00:00:00', '2025-03-27T05:45:00.0', '2025-03-27T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1977, '2025-03-27 00:00:00', '2025-03-27T06:00:00.0', '2025-03-27T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1978, '2025-03-27 00:00:00', '2025-03-27T06:15:00.0', '2025-03-27T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1979, '2025-03-27 00:00:00', '2025-03-27T06:30:00.0', '2025-03-27T06:45:00.0', 286, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1980, '2025-03-27 00:00:00', '2025-03-27T06:45:00.0', '2025-03-27T07:00:00.0', 149, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1981, '2025-03-27 00:00:00', '2025-03-27T07:00:00.0', '2025-03-27T07:15:00.0', 254, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1982, '2025-03-27 00:00:00', '2025-03-27T07:15:00.0', '2025-03-27T07:30:00.0', 70, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (1983, '2025-03-27 00:00:00', '2025-03-27T07:30:00.0', '2025-03-27T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1984, '2025-03-27 00:00:00', '2025-03-27T07:45:00.0', '2025-03-27T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1985, '2025-03-27 00:00:00', '2025-03-27T08:00:00.0', '2025-03-27T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1986, '2025-03-27 00:00:00', '2025-03-27T08:15:00.0', '2025-03-27T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1987, '2025-03-27 00:00:00', '2025-03-27T08:30:00.0', '2025-03-27T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1988, '2025-03-27 00:00:00', '2025-03-27T08:45:00.0', '2025-03-27T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1989, '2025-03-27 00:00:00', '2025-03-27T09:00:00.0', '2025-03-27T09:15:00.0', 20, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1990, '2025-03-27 00:00:00', '2025-03-27T09:15:00.0', '2025-03-27T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1991, '2025-03-27 00:00:00', '2025-03-27T09:30:00.0', '2025-03-27T09:45:00.0', 545, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1992, '2025-03-27 00:00:00', '2025-03-27T09:45:00.0', '2025-03-27T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1993, '2025-03-27 00:00:00', '2025-03-27T10:00:00.0', '2025-03-27T10:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1994, '2025-03-27 00:00:00', '2025-03-27T10:15:00.0', '2025-03-27T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1995, '2025-03-27 00:00:00', '2025-03-27T10:30:00.0', '2025-03-27T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1996, '2025-03-27 00:00:00', '2025-03-27T10:45:00.0', '2025-03-27T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1997, '2025-03-27 00:00:00', '2025-03-27T11:00:00.0', '2025-03-27T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (1998, '2025-03-27 00:00:00', '2025-03-27T11:15:00.0', '2025-03-27T11:30:00.0', 582, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (1999, '2025-03-27 00:00:00', '2025-03-27T11:30:00.0', '2025-03-27T11:45:00.0', 162, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2000, '2025-03-27 00:00:00', '2025-03-27T11:45:00.0', '2025-03-27T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2001, '2025-03-27 00:00:00', '2025-03-27T12:00:00.0', '2025-03-27T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2002, '2025-03-27 00:00:00', '2025-03-27T12:15:00.0', '2025-03-27T12:30:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2003, '2025-03-27 00:00:00', '2025-03-27T12:30:00.0', '2025-03-27T12:45:00.0', 39, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2004, '2025-03-27 00:00:00', '2025-03-27T12:45:00.0', '2025-03-27T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2005, '2025-03-27 00:00:00', '2025-03-27T13:00:00.0', '2025-03-27T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2006, '2025-03-27 00:00:00', '2025-03-27T13:15:00.0', '2025-03-27T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2007, '2025-03-27 00:00:00', '2025-03-27T13:30:00.0', '2025-03-27T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2008, '2025-03-27 00:00:00', '2025-03-27T13:45:00.0', '2025-03-27T14:00:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2009, '2025-03-27 00:00:00', '2025-03-27T14:00:00.0', '2025-03-27T14:15:00.0', 340, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2010, '2025-03-27 00:00:00', '2025-03-27T14:15:00.0', '2025-03-27T14:30:00.0', 81, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2011, '2025-03-27 00:00:00', '2025-03-27T14:30:00.0', '2025-03-27T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2012, '2025-03-27 00:00:00', '2025-03-27T14:45:00.0', '2025-03-27T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2013, '2025-03-27 00:00:00', '2025-03-27T15:00:00.0', '2025-03-27T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2014, '2025-03-27 00:00:00', '2025-03-27T15:15:00.0', '2025-03-27T15:30:00.0', 94, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2015, '2025-03-27 00:00:00', '2025-03-27T15:30:00.0', '2025-03-27T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2016, '2025-03-27 00:00:00', '2025-03-27T15:45:00.0', '2025-03-27T16:00:00.0', 54, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2017, '2025-03-28 00:00:00', '2025-03-27T16:00:00.0', '2025-03-27T16:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2018, '2025-03-28 00:00:00', '2025-03-27T16:15:00.0', '2025-03-27T16:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2019, '2025-03-28 00:00:00', '2025-03-27T16:30:00.0', '2025-03-27T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2020, '2025-03-28 00:00:00', '2025-03-27T16:45:00.0', '2025-03-27T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2021, '2025-03-28 00:00:00', '2025-03-27T17:00:00.0', '2025-03-27T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2022, '2025-03-28 00:00:00', '2025-03-27T17:15:00.0', '2025-03-27T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2023, '2025-03-28 00:00:00', '2025-03-27T17:30:00.0', '2025-03-27T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2024, '2025-03-28 00:00:00', '2025-03-27T17:45:00.0', '2025-03-27T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2025, '2025-03-28 00:00:00', '2025-03-27T18:00:00.0', '2025-03-27T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2026, '2025-03-28 00:00:00', '2025-03-27T18:15:00.0', '2025-03-27T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2027, '2025-03-28 00:00:00', '2025-03-27T18:30:00.0', '2025-03-27T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2028, '2025-03-28 00:00:00', '2025-03-27T18:45:00.0', '2025-03-27T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2029, '2025-03-28 00:00:00', '2025-03-27T19:00:00.0', '2025-03-27T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2030, '2025-03-28 00:00:00', '2025-03-27T19:15:00.0', '2025-03-27T19:30:00.0', 6, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2031, '2025-03-28 00:00:00', '2025-03-27T19:30:00.0', '2025-03-27T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2032, '2025-03-28 00:00:00', '2025-03-27T19:45:00.0', '2025-03-27T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2033, '2025-03-28 00:00:00', '2025-03-27T20:00:00.0', '2025-03-27T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2034, '2025-03-28 00:00:00', '2025-03-27T20:15:00.0', '2025-03-27T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2035, '2025-03-28 00:00:00', '2025-03-27T20:30:00.0', '2025-03-27T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2036, '2025-03-28 00:00:00', '2025-03-27T20:45:00.0', '2025-03-27T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2037, '2025-03-28 00:00:00', '2025-03-27T21:00:00.0', '2025-03-27T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2038, '2025-03-28 00:00:00', '2025-03-27T21:15:00.0', '2025-03-27T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2039, '2025-03-28 00:00:00', '2025-03-27T21:30:00.0', '2025-03-27T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2040, '2025-03-28 00:00:00', '2025-03-27T21:45:00.0', '2025-03-27T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2041, '2025-03-28 00:00:00', '2025-03-27T22:00:00.0', '2025-03-27T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2042, '2025-03-28 00:00:00', '2025-03-27T22:15:00.0', '2025-03-27T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2043, '2025-03-28 00:00:00', '2025-03-27T22:30:00.0', '2025-03-27T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2044, '2025-03-28 00:00:00', '2025-03-27T22:45:00.0', '2025-03-27T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2045, '2025-03-28 00:00:00', '2025-03-27T23:00:00.0', '2025-03-27T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2046, '2025-03-28 00:00:00', '2025-03-27T23:15:00.0', '2025-03-27T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2047, '2025-03-28 00:00:00', '2025-03-27T23:30:00.0', '2025-03-27T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2048, '2025-03-28 00:00:00', '2025-03-27T23:45:00.0', '2025-03-28T00:00:00.0', 188, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2049, '2025-03-28 00:00:00', '2025-03-28T00:00:00.0', '2025-03-28T00:15:00.0', 347, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2050, '2025-03-28 00:00:00', '2025-03-28T00:15:00.0', '2025-03-28T00:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2051, '2025-03-28 00:00:00', '2025-03-28T00:30:00.0', '2025-03-28T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2052, '2025-03-28 00:00:00', '2025-03-28T00:45:00.0', '2025-03-28T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2053, '2025-03-28 00:00:00', '2025-03-28T01:00:00.0', '2025-03-28T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2054, '2025-03-28 00:00:00', '2025-03-28T01:15:00.0', '2025-03-28T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2055, '2025-03-28 00:00:00', '2025-03-28T01:30:00.0', '2025-03-28T01:45:00.0', 180, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2056, '2025-03-28 00:00:00', '2025-03-28T01:45:00.0', '2025-03-28T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2057, '2025-03-28 00:00:00', '2025-03-28T02:00:00.0', '2025-03-28T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2058, '2025-03-28 00:00:00', '2025-03-28T02:15:00.0', '2025-03-28T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2059, '2025-03-28 00:00:00', '2025-03-28T02:30:00.0', '2025-03-28T02:45:00.0', 167, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2060, '2025-03-28 00:00:00', '2025-03-28T02:45:00.0', '2025-03-28T03:00:00.0', 49, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2061, '2025-03-28 00:00:00', '2025-03-28T03:00:00.0', '2025-03-28T03:15:00.0', 158, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2062, '2025-03-28 00:00:00', '2025-03-28T03:15:00.0', '2025-03-28T03:30:00.0', 670, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2063, '2025-03-28 00:00:00', '2025-03-28T03:30:00.0', '2025-03-28T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2064, '2025-03-28 00:00:00', '2025-03-28T03:45:00.0', '2025-03-28T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2065, '2025-03-28 00:00:00', '2025-03-28T04:00:00.0', '2025-03-28T04:15:00.0', 975, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2066, '2025-03-28 00:00:00', '2025-03-28T04:15:00.0', '2025-03-28T04:30:00.0', 1070, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2067, '2025-03-28 00:00:00', '2025-03-28T04:30:00.0', '2025-03-28T04:45:00.0', 22, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2068, '2025-03-28 00:00:00', '2025-03-28T04:45:00.0', '2025-03-28T05:00:00.0', 229, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2069, '2025-03-28 00:00:00', '2025-03-28T05:00:00.0', '2025-03-28T05:15:00.0', 198, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2070, '2025-03-28 00:00:00', '2025-03-28T05:15:00.0', '2025-03-28T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2071, '2025-03-28 00:00:00', '2025-03-28T05:30:00.0', '2025-03-28T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2072, '2025-03-28 00:00:00', '2025-03-28T05:45:00.0', '2025-03-28T06:00:00.0', 346, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2073, '2025-03-28 00:00:00', '2025-03-28T06:00:00.0', '2025-03-28T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2074, '2025-03-28 00:00:00', '2025-03-28T06:15:00.0', '2025-03-28T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2075, '2025-03-28 00:00:00', '2025-03-28T06:30:00.0', '2025-03-28T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2076, '2025-03-28 00:00:00', '2025-03-28T06:45:00.0', '2025-03-28T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2077, '2025-03-28 00:00:00', '2025-03-28T07:00:00.0', '2025-03-28T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2078, '2025-03-28 00:00:00', '2025-03-28T07:15:00.0', '2025-03-28T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2079, '2025-03-28 00:00:00', '2025-03-28T07:30:00.0', '2025-03-28T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2080, '2025-03-28 00:00:00', '2025-03-28T07:45:00.0', '2025-03-28T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2081, '2025-03-28 00:00:00', '2025-03-28T08:00:00.0', '2025-03-28T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2082, '2025-03-28 00:00:00', '2025-03-28T08:15:00.0', '2025-03-28T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2083, '2025-03-28 00:00:00', '2025-03-28T08:30:00.0', '2025-03-28T08:45:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2084, '2025-03-28 00:00:00', '2025-03-28T08:45:00.0', '2025-03-28T09:00:00.0', 183, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2085, '2025-03-28 00:00:00', '2025-03-28T09:00:00.0', '2025-03-28T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2086, '2025-03-28 00:00:00', '2025-03-28T09:15:00.0', '2025-03-28T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2087, '2025-03-28 00:00:00', '2025-03-28T09:30:00.0', '2025-03-28T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2088, '2025-03-28 00:00:00', '2025-03-28T09:45:00.0', '2025-03-28T10:00:00.0', 475, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2089, '2025-03-28 00:00:00', '2025-03-28T10:00:00.0', '2025-03-28T10:15:00.0', 281, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2090, '2025-03-28 00:00:00', '2025-03-28T10:15:00.0', '2025-03-28T10:30:00.0', 51, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2091, '2025-03-28 00:00:00', '2025-03-28T10:30:00.0', '2025-03-28T10:45:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2092, '2025-03-28 00:00:00', '2025-03-28T10:45:00.0', '2025-03-28T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2093, '2025-03-28 00:00:00', '2025-03-28T11:00:00.0', '2025-03-28T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2094, '2025-03-28 00:00:00', '2025-03-28T11:15:00.0', '2025-03-28T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2095, '2025-03-28 00:00:00', '2025-03-28T11:30:00.0', '2025-03-28T11:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2096, '2025-03-28 00:00:00', '2025-03-28T11:45:00.0', '2025-03-28T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2097, '2025-03-28 00:00:00', '2025-03-28T12:00:00.0', '2025-03-28T12:15:00.0', 378, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2098, '2025-03-28 00:00:00', '2025-03-28T12:15:00.0', '2025-03-28T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2099, '2025-03-28 00:00:00', '2025-03-28T12:30:00.0', '2025-03-28T12:45:00.0', 57, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2100, '2025-03-28 00:00:00', '2025-03-28T12:45:00.0', '2025-03-28T13:00:00.0', 139, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2101, '2025-03-28 00:00:00', '2025-03-28T13:00:00.0', '2025-03-28T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2102, '2025-03-28 00:00:00', '2025-03-28T13:15:00.0', '2025-03-28T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2103, '2025-03-28 00:00:00', '2025-03-28T13:30:00.0', '2025-03-28T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2104, '2025-03-28 00:00:00', '2025-03-28T13:45:00.0', '2025-03-28T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2105, '2025-03-28 00:00:00', '2025-03-28T14:00:00.0', '2025-03-28T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2106, '2025-03-28 00:00:00', '2025-03-28T14:15:00.0', '2025-03-28T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2107, '2025-03-28 00:00:00', '2025-03-28T14:30:00.0', '2025-03-28T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2108, '2025-03-28 00:00:00', '2025-03-28T14:45:00.0', '2025-03-28T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2109, '2025-03-28 00:00:00', '2025-03-28T15:00:00.0', '2025-03-28T15:15:00.0', 446, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2110, '2025-03-28 00:00:00', '2025-03-28T15:15:00.0', '2025-03-28T15:30:00.0', 900, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2111, '2025-03-28 00:00:00', '2025-03-28T15:30:00.0', '2025-03-28T15:45:00.0', 180, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2112, '2025-03-28 00:00:00', '2025-03-28T15:45:00.0', '2025-03-28T16:00:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2113, '2025-03-29 00:00:00', '2025-03-28T16:00:00.0', '2025-03-28T16:15:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2114, '2025-03-29 00:00:00', '2025-03-28T16:15:00.0', '2025-03-28T16:30:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (2115, '2025-03-29 00:00:00', '2025-03-28T16:30:00.0', '2025-03-28T16:45:00.0', 10, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2116, '2025-03-29 00:00:00', '2025-03-28T16:45:00.0', '2025-03-28T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2117, '2025-03-29 00:00:00', '2025-03-28T17:00:00.0', '2025-03-28T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2118, '2025-03-29 00:00:00', '2025-03-28T17:15:00.0', '2025-03-28T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2119, '2025-03-29 00:00:00', '2025-03-28T17:30:00.0', '2025-03-28T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2120, '2025-03-29 00:00:00', '2025-03-28T17:45:00.0', '2025-03-28T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2121, '2025-03-29 00:00:00', '2025-03-28T18:00:00.0', '2025-03-28T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2122, '2025-03-29 00:00:00', '2025-03-28T18:15:00.0', '2025-03-28T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2123, '2025-03-29 00:00:00', '2025-03-28T18:30:00.0', '2025-03-28T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2124, '2025-03-29 00:00:00', '2025-03-28T18:45:00.0', '2025-03-28T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2125, '2025-03-29 00:00:00', '2025-03-28T19:00:00.0', '2025-03-28T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2126, '2025-03-29 00:00:00', '2025-03-28T19:15:00.0', '2025-03-28T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2127, '2025-03-29 00:00:00', '2025-03-28T19:30:00.0', '2025-03-28T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2128, '2025-03-29 00:00:00', '2025-03-28T19:45:00.0', '2025-03-28T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2129, '2025-03-29 00:00:00', '2025-03-28T20:00:00.0', '2025-03-28T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2130, '2025-03-29 00:00:00', '2025-03-28T20:15:00.0', '2025-03-28T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2131, '2025-03-29 00:00:00', '2025-03-28T20:30:00.0', '2025-03-28T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2132, '2025-03-29 00:00:00', '2025-03-28T20:45:00.0', '2025-03-28T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2133, '2025-03-29 00:00:00', '2025-03-28T21:00:00.0', '2025-03-28T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2134, '2025-03-29 00:00:00', '2025-03-28T21:15:00.0', '2025-03-28T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2135, '2025-03-29 00:00:00', '2025-03-28T21:30:00.0', '2025-03-28T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2136, '2025-03-29 00:00:00', '2025-03-28T21:45:00.0', '2025-03-28T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2137, '2025-03-29 00:00:00', '2025-03-28T22:00:00.0', '2025-03-28T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2138, '2025-03-29 00:00:00', '2025-03-28T22:15:00.0', '2025-03-28T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2139, '2025-03-29 00:00:00', '2025-03-28T22:30:00.0', '2025-03-28T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2140, '2025-03-29 00:00:00', '2025-03-28T22:45:00.0', '2025-03-28T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2141, '2025-03-29 00:00:00', '2025-03-28T23:00:00.0', '2025-03-28T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2142, '2025-03-29 00:00:00', '2025-03-28T23:15:00.0', '2025-03-28T23:30:00.0', 7, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2143, '2025-03-29 00:00:00', '2025-03-28T23:30:00.0', '2025-03-28T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2144, '2025-03-29 00:00:00', '2025-03-28T23:45:00.0', '2025-03-29T00:00:00.0', 33, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2145, '2025-03-29 00:00:00', '2025-03-29T00:00:00.0', '2025-03-29T00:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2146, '2025-03-29 00:00:00', '2025-03-29T00:15:00.0', '2025-03-29T00:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2147, '2025-03-29 00:00:00', '2025-03-29T00:30:00.0', '2025-03-29T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2148, '2025-03-29 00:00:00', '2025-03-29T00:45:00.0', '2025-03-29T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2149, '2025-03-29 00:00:00', '2025-03-29T01:00:00.0', '2025-03-29T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2150, '2025-03-29 00:00:00', '2025-03-29T01:15:00.0', '2025-03-29T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2151, '2025-03-29 00:00:00', '2025-03-29T01:30:00.0', '2025-03-29T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2152, '2025-03-29 00:00:00', '2025-03-29T01:45:00.0', '2025-03-29T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2153, '2025-03-29 00:00:00', '2025-03-29T02:00:00.0', '2025-03-29T02:15:00.0', 332, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2154, '2025-03-29 00:00:00', '2025-03-29T02:15:00.0', '2025-03-29T02:30:00.0', 423, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2155, '2025-03-29 00:00:00', '2025-03-29T02:30:00.0', '2025-03-29T02:45:00.0', 308, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2156, '2025-03-29 00:00:00', '2025-03-29T02:45:00.0', '2025-03-29T03:00:00.0', 415, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2157, '2025-03-29 00:00:00', '2025-03-29T03:00:00.0', '2025-03-29T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2158, '2025-03-29 00:00:00', '2025-03-29T03:15:00.0', '2025-03-29T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2159, '2025-03-29 00:00:00', '2025-03-29T03:30:00.0', '2025-03-29T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2160, '2025-03-29 00:00:00', '2025-03-29T03:45:00.0', '2025-03-29T04:00:00.0', 128, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2161, '2025-03-29 00:00:00', '2025-03-29T04:00:00.0', '2025-03-29T04:15:00.0', 19, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2162, '2025-03-29 00:00:00', '2025-03-29T04:15:00.0', '2025-03-29T04:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2163, '2025-03-29 00:00:00', '2025-03-29T04:30:00.0', '2025-03-29T04:45:00.0', 482, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2164, '2025-03-29 00:00:00', '2025-03-29T04:45:00.0', '2025-03-29T05:00:00.0', 21, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2165, '2025-03-29 00:00:00', '2025-03-29T05:00:00.0', '2025-03-29T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2166, '2025-03-29 00:00:00', '2025-03-29T05:15:00.0', '2025-03-29T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2167, '2025-03-29 00:00:00', '2025-03-29T05:30:00.0', '2025-03-29T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2168, '2025-03-29 00:00:00', '2025-03-29T05:45:00.0', '2025-03-29T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2169, '2025-03-29 00:00:00', '2025-03-29T06:00:00.0', '2025-03-29T06:15:00.0', 410, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2170, '2025-03-29 00:00:00', '2025-03-29T06:15:00.0', '2025-03-29T06:30:00.0', 389, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2171, '2025-03-29 00:00:00', '2025-03-29T06:30:00.0', '2025-03-29T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2172, '2025-03-29 00:00:00', '2025-03-29T06:45:00.0', '2025-03-29T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2173, '2025-03-29 00:00:00', '2025-03-29T07:00:00.0', '2025-03-29T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2174, '2025-03-29 00:00:00', '2025-03-29T07:15:00.0', '2025-03-29T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2175, '2025-03-29 00:00:00', '2025-03-29T07:30:00.0', '2025-03-29T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2176, '2025-03-29 00:00:00', '2025-03-29T07:45:00.0', '2025-03-29T08:00:00.0', 322, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2177, '2025-03-29 00:00:00', '2025-03-29T08:00:00.0', '2025-03-29T08:15:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2178, '2025-03-29 00:00:00', '2025-03-29T08:15:00.0', '2025-03-29T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2179, '2025-03-29 00:00:00', '2025-03-29T08:30:00.0', '2025-03-29T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2180, '2025-03-29 00:00:00', '2025-03-29T08:45:00.0', '2025-03-29T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2181, '2025-03-29 00:00:00', '2025-03-29T09:00:00.0', '2025-03-29T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2182, '2025-03-29 00:00:00', '2025-03-29T09:15:00.0', '2025-03-29T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2183, '2025-03-29 00:00:00', '2025-03-29T09:30:00.0', '2025-03-29T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2184, '2025-03-29 00:00:00', '2025-03-29T09:45:00.0', '2025-03-29T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2185, '2025-03-29 00:00:00', '2025-03-29T10:00:00.0', '2025-03-29T10:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2186, '2025-03-29 00:00:00', '2025-03-29T10:15:00.0', '2025-03-29T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2187, '2025-03-29 00:00:00', '2025-03-29T10:30:00.0', '2025-03-29T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2188, '2025-03-29 00:00:00', '2025-03-29T10:45:00.0', '2025-03-29T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2189, '2025-03-29 00:00:00', '2025-03-29T11:00:00.0', '2025-03-29T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2190, '2025-03-29 00:00:00', '2025-03-29T11:15:00.0', '2025-03-29T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2191, '2025-03-29 00:00:00', '2025-03-29T11:30:00.0', '2025-03-29T11:45:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2192, '2025-03-29 00:00:00', '2025-03-29T11:45:00.0', '2025-03-29T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2193, '2025-03-29 00:00:00', '2025-03-29T12:00:00.0', '2025-03-29T12:15:00.0', 82, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2194, '2025-03-29 00:00:00', '2025-03-29T12:15:00.0', '2025-03-29T12:30:00.0', 163, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2195, '2025-03-29 00:00:00', '2025-03-29T12:30:00.0', '2025-03-29T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2196, '2025-03-29 00:00:00', '2025-03-29T12:45:00.0', '2025-03-29T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2197, '2025-03-29 00:00:00', '2025-03-29T13:00:00.0', '2025-03-29T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2198, '2025-03-29 00:00:00', '2025-03-29T13:15:00.0', '2025-03-29T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2199, '2025-03-29 00:00:00', '2025-03-29T13:30:00.0', '2025-03-29T13:45:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2200, '2025-03-29 00:00:00', '2025-03-29T13:45:00.0', '2025-03-29T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2201, '2025-03-29 00:00:00', '2025-03-29T14:00:00.0', '2025-03-29T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2202, '2025-03-29 00:00:00', '2025-03-29T14:15:00.0', '2025-03-29T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2203, '2025-03-29 00:00:00', '2025-03-29T14:30:00.0', '2025-03-29T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2204, '2025-03-29 00:00:00', '2025-03-29T14:45:00.0', '2025-03-29T15:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2205, '2025-03-29 00:00:00', '2025-03-29T15:00:00.0', '2025-03-29T15:15:00.0', 403, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2206, '2025-03-29 00:00:00', '2025-03-29T15:15:00.0', '2025-03-29T15:30:00.0', 186, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2207, '2025-03-29 00:00:00', '2025-03-29T15:30:00.0', '2025-03-29T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2208, '2025-03-29 00:00:00', '2025-03-29T15:45:00.0', '2025-03-29T16:00:00.0', 26, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2209, '2025-03-30 00:00:00', '2025-03-29T16:00:00.0', '2025-03-29T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2210, '2025-03-30 00:00:00', '2025-03-29T16:15:00.0', '2025-03-29T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2211, '2025-03-30 00:00:00', '2025-03-29T16:30:00.0', '2025-03-29T16:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2212, '2025-03-30 00:00:00', '2025-03-29T16:45:00.0', '2025-03-29T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2213, '2025-03-30 00:00:00', '2025-03-29T17:00:00.0', '2025-03-29T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2214, '2025-03-30 00:00:00', '2025-03-29T17:15:00.0', '2025-03-29T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2215, '2025-03-30 00:00:00', '2025-03-29T17:30:00.0', '2025-03-29T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2216, '2025-03-30 00:00:00', '2025-03-29T17:45:00.0', '2025-03-29T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2217, '2025-03-30 00:00:00', '2025-03-29T18:00:00.0', '2025-03-29T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2218, '2025-03-30 00:00:00', '2025-03-29T18:15:00.0', '2025-03-29T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2219, '2025-03-30 00:00:00', '2025-03-29T18:30:00.0', '2025-03-29T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2220, '2025-03-30 00:00:00', '2025-03-29T18:45:00.0', '2025-03-29T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2221, '2025-03-30 00:00:00', '2025-03-29T19:00:00.0', '2025-03-29T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2222, '2025-03-30 00:00:00', '2025-03-29T19:15:00.0', '2025-03-29T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2223, '2025-03-30 00:00:00', '2025-03-29T19:30:00.0', '2025-03-29T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2224, '2025-03-30 00:00:00', '2025-03-29T19:45:00.0', '2025-03-29T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2225, '2025-03-30 00:00:00', '2025-03-29T20:00:00.0', '2025-03-29T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2226, '2025-03-30 00:00:00', '2025-03-29T20:15:00.0', '2025-03-29T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2227, '2025-03-30 00:00:00', '2025-03-29T20:30:00.0', '2025-03-29T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2228, '2025-03-30 00:00:00', '2025-03-29T20:45:00.0', '2025-03-29T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2229, '2025-03-30 00:00:00', '2025-03-29T21:00:00.0', '2025-03-29T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2230, '2025-03-30 00:00:00', '2025-03-29T21:15:00.0', '2025-03-29T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2231, '2025-03-30 00:00:00', '2025-03-29T21:30:00.0', '2025-03-29T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2232, '2025-03-30 00:00:00', '2025-03-29T21:45:00.0', '2025-03-29T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2233, '2025-03-30 00:00:00', '2025-03-29T22:00:00.0', '2025-03-29T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2234, '2025-03-30 00:00:00', '2025-03-29T22:15:00.0', '2025-03-29T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2235, '2025-03-30 00:00:00', '2025-03-29T22:30:00.0', '2025-03-29T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2236, '2025-03-30 00:00:00', '2025-03-29T22:45:00.0', '2025-03-29T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2237, '2025-03-30 00:00:00', '2025-03-29T23:00:00.0', '2025-03-29T23:15:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2238, '2025-03-30 00:00:00', '2025-03-29T23:15:00.0', '2025-03-29T23:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2239, '2025-03-30 00:00:00', '2025-03-29T23:30:00.0', '2025-03-29T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2240, '2025-03-30 00:00:00', '2025-03-29T23:45:00.0', '2025-03-30T00:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2241, '2025-03-30 00:00:00', '2025-03-30T00:00:00.0', '2025-03-30T00:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2242, '2025-03-30 00:00:00', '2025-03-30T00:15:00.0', '2025-03-30T00:30:00.0', 212, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2243, '2025-03-30 00:00:00', '2025-03-30T00:30:00.0', '2025-03-30T00:45:00.0', 301, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2244, '2025-03-30 00:00:00', '2025-03-30T00:45:00.0', '2025-03-30T01:00:00.0', 71, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2245, '2025-03-30 00:00:00', '2025-03-30T01:00:00.0', '2025-03-30T01:15:00.0', 273, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2246, '2025-03-30 00:00:00', '2025-03-30T01:15:00.0', '2025-03-30T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2247, '2025-03-30 00:00:00', '2025-03-30T01:30:00.0', '2025-03-30T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2248, '2025-03-30 00:00:00', '2025-03-30T01:45:00.0', '2025-03-30T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2249, '2025-03-30 00:00:00', '2025-03-30T02:00:00.0', '2025-03-30T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2250, '2025-03-30 00:00:00', '2025-03-30T02:15:00.0', '2025-03-30T02:30:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2251, '2025-03-30 00:00:00', '2025-03-30T02:30:00.0', '2025-03-30T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2252, '2025-03-30 00:00:00', '2025-03-30T02:45:00.0', '2025-03-30T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2253, '2025-03-30 00:00:00', '2025-03-30T03:00:00.0', '2025-03-30T03:15:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2254, '2025-03-30 00:00:00', '2025-03-30T03:15:00.0', '2025-03-30T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2255, '2025-03-30 00:00:00', '2025-03-30T03:30:00.0', '2025-03-30T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2256, '2025-03-30 00:00:00', '2025-03-30T03:45:00.0', '2025-03-30T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2257, '2025-03-30 00:00:00', '2025-03-30T04:00:00.0', '2025-03-30T04:15:00.0', 87, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2258, '2025-03-30 00:00:00', '2025-03-30T04:15:00.0', '2025-03-30T04:30:00.0', 83, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2259, '2025-03-30 00:00:00', '2025-03-30T04:30:00.0', '2025-03-30T04:45:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2260, '2025-03-30 00:00:00', '2025-03-30T04:45:00.0', '2025-03-30T05:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2261, '2025-03-30 00:00:00', '2025-03-30T05:00:00.0', '2025-03-30T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2262, '2025-03-30 00:00:00', '2025-03-30T05:15:00.0', '2025-03-30T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2263, '2025-03-30 00:00:00', '2025-03-30T05:30:00.0', '2025-03-30T05:45:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2264, '2025-03-30 00:00:00', '2025-03-30T05:45:00.0', '2025-03-30T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2265, '2025-03-30 00:00:00', '2025-03-30T06:00:00.0', '2025-03-30T06:15:00.0', 198, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2266, '2025-03-30 00:00:00', '2025-03-30T06:15:00.0', '2025-03-30T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2267, '2025-03-30 00:00:00', '2025-03-30T06:30:00.0', '2025-03-30T06:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2268, '2025-03-30 00:00:00', '2025-03-30T06:45:00.0', '2025-03-30T07:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2269, '2025-03-30 00:00:00', '2025-03-30T07:00:00.0', '2025-03-30T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2270, '2025-03-30 00:00:00', '2025-03-30T07:15:00.0', '2025-03-30T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2271, '2025-03-30 00:00:00', '2025-03-30T07:30:00.0', '2025-03-30T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2272, '2025-03-30 00:00:00', '2025-03-30T07:45:00.0', '2025-03-30T08:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2273, '2025-03-30 00:00:00', '2025-03-30T08:00:00.0', '2025-03-30T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2274, '2025-03-30 00:00:00', '2025-03-30T08:15:00.0', '2025-03-30T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2275, '2025-03-30 00:00:00', '2025-03-30T08:30:00.0', '2025-03-30T08:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2276, '2025-03-30 00:00:00', '2025-03-30T08:45:00.0', '2025-03-30T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2277, '2025-03-30 00:00:00', '2025-03-30T09:00:00.0', '2025-03-30T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2278, '2025-03-30 00:00:00', '2025-03-30T09:15:00.0', '2025-03-30T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2279, '2025-03-30 00:00:00', '2025-03-30T09:30:00.0', '2025-03-30T09:45:00.0', 244, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2280, '2025-03-30 00:00:00', '2025-03-30T09:45:00.0', '2025-03-30T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2281, '2025-03-30 00:00:00', '2025-03-30T10:00:00.0', '2025-03-30T10:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2282, '2025-03-30 00:00:00', '2025-03-30T10:15:00.0', '2025-03-30T10:30:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2283, '2025-03-30 00:00:00', '2025-03-30T10:30:00.0', '2025-03-30T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2284, '2025-03-30 00:00:00', '2025-03-30T10:45:00.0', '2025-03-30T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2285, '2025-03-30 00:00:00', '2025-03-30T11:00:00.0', '2025-03-30T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2286, '2025-03-30 00:00:00', '2025-03-30T11:15:00.0', '2025-03-30T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2287, '2025-03-30 00:00:00', '2025-03-30T11:30:00.0', '2025-03-30T11:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2288, '2025-03-30 00:00:00', '2025-03-30T11:45:00.0', '2025-03-30T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2289, '2025-03-30 00:00:00', '2025-03-30T12:00:00.0', '2025-03-30T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2290, '2025-03-30 00:00:00', '2025-03-30T12:15:00.0', '2025-03-30T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2291, '2025-03-30 00:00:00', '2025-03-30T12:30:00.0', '2025-03-30T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2292, '2025-03-30 00:00:00', '2025-03-30T12:45:00.0', '2025-03-30T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2293, '2025-03-30 00:00:00', '2025-03-30T13:00:00.0', '2025-03-30T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2294, '2025-03-30 00:00:00', '2025-03-30T13:15:00.0', '2025-03-30T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2295, '2025-03-30 00:00:00', '2025-03-30T13:30:00.0', '2025-03-30T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2296, '2025-03-30 00:00:00', '2025-03-30T13:45:00.0', '2025-03-30T14:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2297, '2025-03-30 00:00:00', '2025-03-30T14:00:00.0', '2025-03-30T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2298, '2025-03-30 00:00:00', '2025-03-30T14:15:00.0', '2025-03-30T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2299, '2025-03-30 00:00:00', '2025-03-30T14:30:00.0', '2025-03-30T14:45:00.0', 294, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2300, '2025-03-30 00:00:00', '2025-03-30T14:45:00.0', '2025-03-30T15:00:00.0', 424, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2301, '2025-03-30 00:00:00', '2025-03-30T15:00:00.0', '2025-03-30T15:15:00.0', 43, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2302, '2025-03-30 00:00:00', '2025-03-30T15:15:00.0', '2025-03-30T15:30:00.0', 127, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2303, '2025-03-30 00:00:00', '2025-03-30T15:30:00.0', '2025-03-30T15:45:00.0', 28, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2304, '2025-03-30 00:00:00', '2025-03-30T15:45:00.0', '2025-03-30T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2305, '2025-03-31 00:00:00', '2025-03-30T16:00:00.0', '2025-03-30T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2306, '2025-03-31 00:00:00', '2025-03-30T16:15:00.0', '2025-03-30T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2307, '2025-03-31 00:00:00', '2025-03-30T16:30:00.0', '2025-03-30T16:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2308, '2025-03-31 00:00:00', '2025-03-30T16:45:00.0', '2025-03-30T17:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2309, '2025-03-31 00:00:00', '2025-03-30T17:00:00.0', '2025-03-30T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2310, '2025-03-31 00:00:00', '2025-03-30T17:15:00.0', '2025-03-30T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2311, '2025-03-31 00:00:00', '2025-03-30T17:30:00.0', '2025-03-30T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2312, '2025-03-31 00:00:00', '2025-03-30T17:45:00.0', '2025-03-30T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2313, '2025-03-31 00:00:00', '2025-03-30T18:00:00.0', '2025-03-30T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2314, '2025-03-31 00:00:00', '2025-03-30T18:15:00.0', '2025-03-30T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2315, '2025-03-31 00:00:00', '2025-03-30T18:30:00.0', '2025-03-30T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2316, '2025-03-31 00:00:00', '2025-03-30T18:45:00.0', '2025-03-30T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2317, '2025-03-31 00:00:00', '2025-03-30T19:00:00.0', '2025-03-30T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2318, '2025-03-31 00:00:00', '2025-03-30T19:15:00.0', '2025-03-30T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2319, '2025-03-31 00:00:00', '2025-03-30T19:30:00.0', '2025-03-30T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2320, '2025-03-31 00:00:00', '2025-03-30T19:45:00.0', '2025-03-30T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2321, '2025-03-31 00:00:00', '2025-03-30T20:00:00.0', '2025-03-30T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2322, '2025-03-31 00:00:00', '2025-03-30T20:15:00.0', '2025-03-30T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2323, '2025-03-31 00:00:00', '2025-03-30T20:30:00.0', '2025-03-30T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2324, '2025-03-31 00:00:00', '2025-03-30T20:45:00.0', '2025-03-30T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2325, '2025-03-31 00:00:00', '2025-03-30T21:00:00.0', '2025-03-30T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2326, '2025-03-31 00:00:00', '2025-03-30T21:15:00.0', '2025-03-30T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2327, '2025-03-31 00:00:00', '2025-03-30T21:30:00.0', '2025-03-30T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2328, '2025-03-31 00:00:00', '2025-03-30T21:45:00.0', '2025-03-30T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2329, '2025-03-31 00:00:00', '2025-03-30T22:00:00.0', '2025-03-30T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2330, '2025-03-31 00:00:00', '2025-03-30T22:15:00.0', '2025-03-30T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2331, '2025-03-31 00:00:00', '2025-03-30T22:30:00.0', '2025-03-30T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2332, '2025-03-31 00:00:00', '2025-03-30T22:45:00.0', '2025-03-30T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2333, '2025-03-31 00:00:00', '2025-03-30T23:00:00.0', '2025-03-30T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2334, '2025-03-31 00:00:00', '2025-03-30T23:15:00.0', '2025-03-30T23:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2335, '2025-03-31 00:00:00', '2025-03-30T23:30:00.0', '2025-03-30T23:45:00.0', 0, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (2336, '2025-03-31 00:00:00', '2025-03-30T23:45:00.0', '2025-03-31T00:00:00.0', 48, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2337, '2025-03-31 00:00:00', '2025-03-31T00:00:00.0', '2025-03-31T00:15:00.0', 469, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2338, '2025-03-31 00:00:00', '2025-03-31T00:15:00.0', '2025-03-31T00:30:00.0', 0, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2339, '2025-03-31 00:00:00', '2025-03-31T00:30:00.0', '2025-03-31T00:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2340, '2025-03-31 00:00:00', '2025-03-31T00:45:00.0', '2025-03-31T01:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2341, '2025-03-31 00:00:00', '2025-03-31T01:00:00.0', '2025-03-31T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2342, '2025-03-31 00:00:00', '2025-03-31T01:15:00.0', '2025-03-31T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2343, '2025-03-31 00:00:00', '2025-03-31T01:30:00.0', '2025-03-31T01:45:00.0', 143, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2344, '2025-03-31 00:00:00', '2025-03-31T01:45:00.0', '2025-03-31T02:00:00.0', 27, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2345, '2025-03-31 00:00:00', '2025-03-31T02:00:00.0', '2025-03-31T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2346, '2025-03-31 00:00:00', '2025-03-31T02:15:00.0', '2025-03-31T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2347, '2025-03-31 00:00:00', '2025-03-31T02:30:00.0', '2025-03-31T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2348, '2025-03-31 00:00:00', '2025-03-31T02:45:00.0', '2025-03-31T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2349, '2025-03-31 00:00:00', '2025-03-31T03:00:00.0', '2025-03-31T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2350, '2025-03-31 00:00:00', '2025-03-31T03:15:00.0', '2025-03-31T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2351, '2025-03-31 00:00:00', '2025-03-31T03:30:00.0', '2025-03-31T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2352, '2025-03-31 00:00:00', '2025-03-31T03:45:00.0', '2025-03-31T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2353, '2025-03-31 00:00:00', '2025-03-31T04:00:00.0', '2025-03-31T04:15:00.0', 471, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2354, '2025-03-31 00:00:00', '2025-03-31T04:15:00.0', '2025-03-31T04:30:00.0', 147, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2355, '2025-03-31 00:00:00', '2025-03-31T04:30:00.0', '2025-03-31T04:45:00.0', 24, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2356, '2025-03-31 00:00:00', '2025-03-31T04:45:00.0', '2025-03-31T05:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2357, '2025-03-31 00:00:00', '2025-03-31T05:00:00.0', '2025-03-31T05:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2358, '2025-03-31 00:00:00', '2025-03-31T05:15:00.0', '2025-03-31T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2359, '2025-03-31 00:00:00', '2025-03-31T05:30:00.0', '2025-03-31T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2360, '2025-03-31 00:00:00', '2025-03-31T05:45:00.0', '2025-03-31T06:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2361, '2025-03-31 00:00:00', '2025-03-31T06:00:00.0', '2025-03-31T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2362, '2025-03-31 00:00:00', '2025-03-31T06:15:00.0', '2025-03-31T06:30:00.0', 137, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2363, '2025-03-31 00:00:00', '2025-03-31T06:30:00.0', '2025-03-31T06:45:00.0', 354, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2364, '2025-03-31 00:00:00', '2025-03-31T06:45:00.0', '2025-03-31T07:00:00.0', 54, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2365, '2025-03-31 00:00:00', '2025-03-31T07:00:00.0', '2025-03-31T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2366, '2025-03-31 00:00:00', '2025-03-31T07:15:00.0', '2025-03-31T07:30:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2367, '2025-03-31 00:00:00', '2025-03-31T07:30:00.0', '2025-03-31T07:45:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2368, '2025-03-31 00:00:00', '2025-03-31T07:45:00.0', '2025-03-31T08:00:00.0', 13, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2369, '2025-03-31 00:00:00', '2025-03-31T08:00:00.0', '2025-03-31T08:15:00.0', 53, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2370, '2025-03-31 00:00:00', '2025-03-31T08:15:00.0', '2025-03-31T08:30:00.0', 92, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2371, '2025-03-31 00:00:00', '2025-03-31T08:30:00.0', '2025-03-31T08:45:00.0', 1052, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2372, '2025-03-31 00:00:00', '2025-03-31T08:45:00.0', '2025-03-31T09:00:00.0', 218, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2373, '2025-03-31 00:00:00', '2025-03-31T09:00:00.0', '2025-03-31T09:15:00.0', 25, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2374, '2025-03-31 00:00:00', '2025-03-31T09:15:00.0', '2025-03-31T09:30:00.0', 90, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2375, '2025-03-31 00:00:00', '2025-03-31T09:30:00.0', '2025-03-31T09:45:00.0', 72, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2376, '2025-03-31 00:00:00', '2025-03-31T09:45:00.0', '2025-03-31T10:00:00.0', 318, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2377, '2025-03-31 00:00:00', '2025-03-31T10:00:00.0', '2025-03-31T10:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2378, '2025-03-31 00:00:00', '2025-03-31T10:15:00.0', '2025-03-31T10:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2379, '2025-03-31 00:00:00', '2025-03-31T10:30:00.0', '2025-03-31T10:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2380, '2025-03-31 00:00:00', '2025-03-31T10:45:00.0', '2025-03-31T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2381, '2025-03-31 00:00:00', '2025-03-31T11:00:00.0', '2025-03-31T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2382, '2025-03-31 00:00:00', '2025-03-31T11:15:00.0', '2025-03-31T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2383, '2025-03-31 00:00:00', '2025-03-31T11:30:00.0', '2025-03-31T11:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2384, '2025-03-31 00:00:00', '2025-03-31T11:45:00.0', '2025-03-31T12:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2385, '2025-03-31 00:00:00', '2025-03-31T12:00:00.0', '2025-03-31T12:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2386, '2025-03-31 00:00:00', '2025-03-31T12:15:00.0', '2025-03-31T12:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2387, '2025-03-31 00:00:00', '2025-03-31T12:30:00.0', '2025-03-31T12:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2388, '2025-03-31 00:00:00', '2025-03-31T12:45:00.0', '2025-03-31T13:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2389, '2025-03-31 00:00:00', '2025-03-31T13:00:00.0', '2025-03-31T13:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2390, '2025-03-31 00:00:00', '2025-03-31T13:15:00.0', '2025-03-31T13:30:00.0', 39, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2391, '2025-03-31 00:00:00', '2025-03-31T13:30:00.0', '2025-03-31T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2392, '2025-03-31 00:00:00', '2025-03-31T13:45:00.0', '2025-03-31T14:00:00.0', 21, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2393, '2025-03-31 00:00:00', '2025-03-31T14:00:00.0', '2025-03-31T14:15:00.0', 409, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2394, '2025-03-31 00:00:00', '2025-03-31T14:15:00.0', '2025-03-31T14:30:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2395, '2025-03-31 00:00:00', '2025-03-31T14:30:00.0', '2025-03-31T14:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2396, '2025-03-31 00:00:00', '2025-03-31T14:45:00.0', '2025-03-31T15:00:00.0', 355, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2397, '2025-03-31 00:00:00', '2025-03-31T15:00:00.0', '2025-03-31T15:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2398, '2025-03-31 00:00:00', '2025-03-31T15:15:00.0', '2025-03-31T15:30:00.0', 245, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2399, '2025-03-31 00:00:00', '2025-03-31T15:30:00.0', '2025-03-31T15:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2400, '2025-03-31 00:00:00', '2025-03-31T15:45:00.0', '2025-03-31T16:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2401, '2025-04-01 00:00:00', '2025-03-31T16:00:00.0', '2025-03-31T16:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2402, '2025-04-01 00:00:00', '2025-03-31T16:15:00.0', '2025-03-31T16:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2403, '2025-04-01 00:00:00', '2025-03-31T16:30:00.0', '2025-03-31T16:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2404, '2025-04-01 00:00:00', '2025-03-31T16:45:00.0', '2025-03-31T17:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2405, '2025-04-01 00:00:00', '2025-03-31T17:00:00.0', '2025-03-31T17:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2406, '2025-04-01 00:00:00', '2025-03-31T17:15:00.0', '2025-03-31T17:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2407, '2025-04-01 00:00:00', '2025-03-31T17:30:00.0', '2025-03-31T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2408, '2025-04-01 00:00:00', '2025-03-31T17:45:00.0', '2025-03-31T18:00:00.0', 9, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2409, '2025-04-01 00:00:00', '2025-03-31T18:00:00.0', '2025-03-31T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2410, '2025-04-01 00:00:00', '2025-03-31T18:15:00.0', '2025-03-31T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2411, '2025-04-01 00:00:00', '2025-03-31T18:30:00.0', '2025-03-31T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2412, '2025-04-01 00:00:00', '2025-03-31T18:45:00.0', '2025-03-31T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2413, '2025-04-01 00:00:00', '2025-03-31T19:00:00.0', '2025-03-31T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2414, '2025-04-01 00:00:00', '2025-03-31T19:15:00.0', '2025-03-31T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2415, '2025-04-01 00:00:00', '2025-03-31T19:30:00.0', '2025-03-31T19:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2416, '2025-04-01 00:00:00', '2025-03-31T19:45:00.0', '2025-03-31T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2417, '2025-04-01 00:00:00', '2025-03-31T20:00:00.0', '2025-03-31T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2418, '2025-04-01 00:00:00', '2025-03-31T20:15:00.0', '2025-03-31T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2419, '2025-04-01 00:00:00', '2025-03-31T20:30:00.0', '2025-03-31T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2420, '2025-04-01 00:00:00', '2025-03-31T20:45:00.0', '2025-03-31T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2421, '2025-04-01 00:00:00', '2025-03-31T21:00:00.0', '2025-03-31T21:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2422, '2025-04-01 00:00:00', '2025-03-31T21:15:00.0', '2025-03-31T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2423, '2025-04-01 00:00:00', '2025-03-31T21:30:00.0', '2025-03-31T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2424, '2025-04-01 00:00:00', '2025-03-31T21:45:00.0', '2025-03-31T22:00:00.0', 11, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2425, '2025-04-01 00:00:00', '2025-03-31T22:00:00.0', '2025-03-31T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2426, '2025-04-01 00:00:00', '2025-03-31T22:15:00.0', '2025-03-31T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2427, '2025-04-01 00:00:00', '2025-03-31T22:30:00.0', '2025-03-31T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2428, '2025-04-01 00:00:00', '2025-03-31T22:45:00.0', '2025-03-31T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2429, '2025-04-01 00:00:00', '2025-03-31T23:00:00.0', '2025-03-31T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2430, '2025-04-01 00:00:00', '2025-03-31T23:15:00.0', '2025-03-31T23:30:00.0', 11, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2431, '2025-04-01 00:00:00', '2025-03-31T23:30:00.0', '2025-03-31T23:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2432, '2025-04-01 00:00:00', '2025-03-31T23:45:00.0', '2025-04-01T00:00:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2433, '2025-04-01 00:00:00', '2025-04-01T00:00:00.0', '2025-04-01T00:15:00.0', 117, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2434, '2025-04-01 00:00:00', '2025-04-01T00:15:00.0', '2025-04-01T00:30:00.0', 430, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2435, '2025-04-01 00:00:00', '2025-04-01T00:30:00.0', '2025-04-01T00:45:00.0', 501, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2436, '2025-04-01 00:00:00', '2025-04-01T00:45:00.0', '2025-04-01T01:00:00.0', 760, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2437, '2025-04-01 00:00:00', '2025-04-01T01:00:00.0', '2025-04-01T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2438, '2025-04-01 00:00:00', '2025-04-01T01:15:00.0', '2025-04-01T01:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2439, '2025-04-01 00:00:00', '2025-04-01T01:30:00.0', '2025-04-01T01:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2440, '2025-04-01 00:00:00', '2025-04-01T01:45:00.0', '2025-04-01T02:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2441, '2025-04-01 00:00:00', '2025-04-01T02:00:00.0', '2025-04-01T02:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2442, '2025-04-01 00:00:00', '2025-04-01T02:15:00.0', '2025-04-01T02:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2443, '2025-04-01 00:00:00', '2025-04-01T02:30:00.0', '2025-04-01T02:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2444, '2025-04-01 00:00:00', '2025-04-01T02:45:00.0', '2025-04-01T03:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2445, '2025-04-01 00:00:00', '2025-04-01T03:00:00.0', '2025-04-01T03:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2446, '2025-04-01 00:00:00', '2025-04-01T03:15:00.0', '2025-04-01T03:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2447, '2025-04-01 00:00:00', '2025-04-01T03:30:00.0', '2025-04-01T03:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2448, '2025-04-01 00:00:00', '2025-04-01T03:45:00.0', '2025-04-01T04:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2449, '2025-04-01 00:00:00', '2025-04-01T04:00:00.0', '2025-04-01T04:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2450, '2025-04-01 00:00:00', '2025-04-01T04:15:00.0', '2025-04-01T04:30:00.0', 288, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2451, '2025-04-01 00:00:00', '2025-04-01T04:30:00.0', '2025-04-01T04:45:00.0', 183, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2452, '2025-04-01 00:00:00', '2025-04-01T04:45:00.0', '2025-04-01T05:00:00.0', 255, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2453, '2025-04-01 00:00:00', '2025-04-01T05:00:00.0', '2025-04-01T05:15:00.0', 17, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2454, '2025-04-01 00:00:00', '2025-04-01T05:15:00.0', '2025-04-01T05:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2455, '2025-04-01 00:00:00', '2025-04-01T05:30:00.0', '2025-04-01T05:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2456, '2025-04-01 00:00:00', '2025-04-01T05:45:00.0', '2025-04-01T06:00:00.0', 27, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2457, '2025-04-01 00:00:00', '2025-04-01T06:00:00.0', '2025-04-01T06:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2458, '2025-04-01 00:00:00', '2025-04-01T06:15:00.0', '2025-04-01T06:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2459, '2025-04-01 00:00:00', '2025-04-01T06:30:00.0', '2025-04-01T06:45:00.0', 538, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2460, '2025-04-01 00:00:00', '2025-04-01T06:45:00.0', '2025-04-01T07:00:00.0', 15, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2461, '2025-04-01 00:00:00', '2025-04-01T07:00:00.0', '2025-04-01T07:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2462, '2025-04-01 00:00:00', '2025-04-01T07:15:00.0', '2025-04-01T07:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2463, '2025-04-01 00:00:00', '2025-04-01T07:30:00.0', '2025-04-01T07:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2464, '2025-04-01 00:00:00', '2025-04-01T07:45:00.0', '2025-04-01T08:00:00.0', 139, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2465, '2025-04-01 00:00:00', '2025-04-01T08:00:00.0', '2025-04-01T08:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2466, '2025-04-01 00:00:00', '2025-04-01T08:15:00.0', '2025-04-01T08:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2467, '2025-04-01 00:00:00', '2025-04-01T08:30:00.0', '2025-04-01T08:45:00.0', 598, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2468, '2025-04-01 00:00:00', '2025-04-01T08:45:00.0', '2025-04-01T09:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2469, '2025-04-01 00:00:00', '2025-04-01T09:00:00.0', '2025-04-01T09:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2470, '2025-04-01 00:00:00', '2025-04-01T09:15:00.0', '2025-04-01T09:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2471, '2025-04-01 00:00:00', '2025-04-01T09:30:00.0', '2025-04-01T09:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2472, '2025-04-01 00:00:00', '2025-04-01T09:45:00.0', '2025-04-01T10:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2473, '2025-04-01 00:00:00', '2025-04-01T10:00:00.0', '2025-04-01T10:15:00.0', 116, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2474, '2025-04-01 00:00:00', '2025-04-01T10:15:00.0', '2025-04-01T10:30:00.0', 623, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2475, '2025-04-01 00:00:00', '2025-04-01T10:30:00.0', '2025-04-01T10:45:00.0', 336, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2476, '2025-04-01 00:00:00', '2025-04-01T10:45:00.0', '2025-04-01T11:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2477, '2025-04-01 00:00:00', '2025-04-01T11:00:00.0', '2025-04-01T11:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2478, '2025-04-01 00:00:00', '2025-04-01T11:15:00.0', '2025-04-01T11:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2479, '2025-04-01 00:00:00', '2025-04-01T11:30:00.0', '2025-04-01T11:45:00.0', 321, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2480, '2025-04-01 00:00:00', '2025-04-01T11:45:00.0', '2025-04-01T12:00:00.0', 304, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2481, '2025-04-01 00:00:00', '2025-04-01T12:00:00.0', '2025-04-01T12:15:00.0', 235, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2482, '2025-04-01 00:00:00', '2025-04-01T12:15:00.0', '2025-04-01T12:30:00.0', 151, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2483, '2025-04-01 00:00:00', '2025-04-01T12:30:00.0', '2025-04-01T12:45:00.0', 53, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2484, '2025-04-01 00:00:00', '2025-04-01T12:45:00.0', '2025-04-01T13:00:00.0', 32, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2485, '2025-04-01 00:00:00', '2025-04-01T13:00:00.0', '2025-04-01T13:15:00.0', 7, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2486, '2025-04-01 00:00:00', '2025-04-01T13:15:00.0', '2025-04-01T13:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2487, '2025-04-01 00:00:00', '2025-04-01T13:30:00.0', '2025-04-01T13:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2488, '2025-04-01 00:00:00', '2025-04-01T13:45:00.0', '2025-04-01T14:00:00.0', 41, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2489, '2025-04-01 00:00:00', '2025-04-01T14:00:00.0', '2025-04-01T14:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2490, '2025-04-01 00:00:00', '2025-04-01T14:15:00.0', '2025-04-01T14:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2491, '2025-04-01 00:00:00', '2025-04-01T14:30:00.0', '2025-04-01T14:45:00.0', 80, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2492, '2025-04-01 00:00:00', '2025-04-01T14:45:00.0', '2025-04-01T15:00:00.0', 79, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2493, '2025-04-01 00:00:00', '2025-04-01T15:00:00.0', '2025-04-01T15:15:00.0', 116, '0', 'generic', 'False', NULL);
INSERT INTO `steps` VALUES (2494, '2025-04-01 00:00:00', '2025-04-01T15:15:00.0', '2025-04-01T15:30:00.0', 12, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2495, '2025-04-01 00:00:00', '2025-04-01T15:30:00.0', '2025-04-01T15:45:00.0', 9, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2496, '2025-04-01 00:00:00', '2025-04-01T15:45:00.0', '2025-04-01T16:00:00.0', 11, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2497, '2025-04-02 00:00:00', '2025-04-01T16:00:00.0', '2025-04-01T16:15:00.0', 6, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2498, '2025-04-02 00:00:00', '2025-04-01T16:15:00.0', '2025-04-01T16:30:00.0', 142, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2499, '2025-04-02 00:00:00', '2025-04-01T16:30:00.0', '2025-04-01T16:45:00.0', 426, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2500, '2025-04-02 00:00:00', '2025-04-01T16:45:00.0', '2025-04-01T17:00:00.0', 90, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2501, '2025-04-02 00:00:00', '2025-04-01T17:00:00.0', '2025-04-01T17:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2502, '2025-04-02 00:00:00', '2025-04-01T17:15:00.0', '2025-04-01T17:30:00.0', 21, '0', 'sleeping', 'False', NULL);
INSERT INTO `steps` VALUES (2503, '2025-04-02 00:00:00', '2025-04-01T17:30:00.0', '2025-04-01T17:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2504, '2025-04-02 00:00:00', '2025-04-01T17:45:00.0', '2025-04-01T18:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2505, '2025-04-02 00:00:00', '2025-04-01T18:00:00.0', '2025-04-01T18:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2506, '2025-04-02 00:00:00', '2025-04-01T18:15:00.0', '2025-04-01T18:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2507, '2025-04-02 00:00:00', '2025-04-01T18:30:00.0', '2025-04-01T18:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2508, '2025-04-02 00:00:00', '2025-04-01T18:45:00.0', '2025-04-01T19:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2509, '2025-04-02 00:00:00', '2025-04-01T19:00:00.0', '2025-04-01T19:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2510, '2025-04-02 00:00:00', '2025-04-01T19:15:00.0', '2025-04-01T19:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2511, '2025-04-02 00:00:00', '2025-04-01T19:30:00.0', '2025-04-01T19:45:00.0', 15, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2512, '2025-04-02 00:00:00', '2025-04-01T19:45:00.0', '2025-04-01T20:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2513, '2025-04-02 00:00:00', '2025-04-01T20:00:00.0', '2025-04-01T20:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2514, '2025-04-02 00:00:00', '2025-04-01T20:15:00.0', '2025-04-01T20:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2515, '2025-04-02 00:00:00', '2025-04-01T20:30:00.0', '2025-04-01T20:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2516, '2025-04-02 00:00:00', '2025-04-01T20:45:00.0', '2025-04-01T21:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2517, '2025-04-02 00:00:00', '2025-04-01T21:00:00.0', '2025-04-01T21:15:00.0', 9, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2518, '2025-04-02 00:00:00', '2025-04-01T21:15:00.0', '2025-04-01T21:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2519, '2025-04-02 00:00:00', '2025-04-01T21:30:00.0', '2025-04-01T21:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2520, '2025-04-02 00:00:00', '2025-04-01T21:45:00.0', '2025-04-01T22:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2521, '2025-04-02 00:00:00', '2025-04-01T22:00:00.0', '2025-04-01T22:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2522, '2025-04-02 00:00:00', '2025-04-01T22:15:00.0', '2025-04-01T22:30:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2523, '2025-04-02 00:00:00', '2025-04-01T22:30:00.0', '2025-04-01T22:45:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2524, '2025-04-02 00:00:00', '2025-04-01T22:45:00.0', '2025-04-01T23:00:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2525, '2025-04-02 00:00:00', '2025-04-01T23:00:00.0', '2025-04-01T23:15:00.0', 0, '0', 'sleeping', 'True', NULL);
INSERT INTO `steps` VALUES (2526, '2025-04-02 00:00:00', '2025-04-01T23:15:00.0', '2025-04-01T23:30:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2527, '2025-04-02 00:00:00', '2025-04-01T23:30:00.0', '2025-04-01T23:45:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2528, '2025-04-02 00:00:00', '2025-04-01T23:45:00.0', '2025-04-02T00:00:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2529, '2025-04-02 00:00:00', '2025-04-02T00:00:00.0', '2025-04-02T00:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2530, '2025-04-02 00:00:00', '2025-04-02T00:15:00.0', '2025-04-02T00:30:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2531, '2025-04-02 00:00:00', '2025-04-02T00:30:00.0', '2025-04-02T00:45:00.0', 698, '0', 'active', 'False', NULL);
INSERT INTO `steps` VALUES (2532, '2025-04-02 00:00:00', '2025-04-02T00:45:00.0', '2025-04-02T01:00:00.0', 349, '0', 'highlyActive', 'False', NULL);
INSERT INTO `steps` VALUES (2533, '2025-04-02 00:00:00', '2025-04-02T01:00:00.0', '2025-04-02T01:15:00.0', 0, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2534, '2025-04-02 00:00:00', '2025-04-02T01:15:00.0', '2025-04-02T01:30:00.0', 59, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2535, '2025-04-02 00:00:00', '2025-04-02T01:30:00.0', '2025-04-02T01:45:00.0', 36, '0', 'sedentary', 'True', NULL);
INSERT INTO `steps` VALUES (2536, '2025-04-02 00:00:00', '2025-04-02T01:45:00.0', '2025-04-02T02:00:00.0', 0, '0', 'sedentary', 'False', NULL);
INSERT INTO `steps` VALUES (2537, '2025-07-30 00:00:00', '2025-07-29T16:00:00.0', '2025-07-29T16:15:00.0', 44, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2538, '2025-07-30 00:00:00', '2025-07-29T16:15:00.0', '2025-07-29T16:30:00.0', 441, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2539, '2025-07-30 00:00:00', '2025-07-29T16:30:00.0', '2025-07-29T16:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2540, '2025-07-30 00:00:00', '2025-07-29T16:45:00.0', '2025-07-29T17:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2541, '2025-07-30 00:00:00', '2025-07-29T17:00:00.0', '2025-07-29T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2542, '2025-07-30 00:00:00', '2025-07-29T17:15:00.0', '2025-07-29T17:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2543, '2025-07-30 00:00:00', '2025-07-29T17:30:00.0', '2025-07-29T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2544, '2025-07-30 00:00:00', '2025-07-29T17:45:00.0', '2025-07-29T18:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2545, '2025-07-30 00:00:00', '2025-07-29T18:00:00.0', '2025-07-29T18:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2546, '2025-07-30 00:00:00', '2025-07-29T18:15:00.0', '2025-07-29T18:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2547, '2025-07-30 00:00:00', '2025-07-29T18:30:00.0', '2025-07-29T18:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2548, '2025-07-30 00:00:00', '2025-07-29T18:45:00.0', '2025-07-29T19:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2549, '2025-07-30 00:00:00', '2025-07-29T19:00:00.0', '2025-07-29T19:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2550, '2025-07-30 00:00:00', '2025-07-29T19:15:00.0', '2025-07-29T19:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2551, '2025-07-30 00:00:00', '2025-07-29T19:30:00.0', '2025-07-29T19:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2552, '2025-07-30 00:00:00', '2025-07-29T19:45:00.0', '2025-07-29T20:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2553, '2025-07-30 00:00:00', '2025-07-29T20:00:00.0', '2025-07-29T20:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2554, '2025-07-30 00:00:00', '2025-07-29T20:15:00.0', '2025-07-29T20:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2555, '2025-07-30 00:00:00', '2025-07-29T20:30:00.0', '2025-07-29T20:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2556, '2025-07-30 00:00:00', '2025-07-29T20:45:00.0', '2025-07-29T21:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2557, '2025-07-30 00:00:00', '2025-07-29T21:00:00.0', '2025-07-29T21:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2558, '2025-07-30 00:00:00', '2025-07-29T21:15:00.0', '2025-07-29T21:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2559, '2025-07-30 00:00:00', '2025-07-29T21:30:00.0', '2025-07-29T21:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2560, '2025-07-30 00:00:00', '2025-07-29T21:45:00.0', '2025-07-29T22:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2561, '2025-07-30 00:00:00', '2025-07-29T22:00:00.0', '2025-07-29T22:15:00.0', 15, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2562, '2025-07-30 00:00:00', '2025-07-29T22:15:00.0', '2025-07-29T22:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2563, '2025-07-30 00:00:00', '2025-07-29T22:30:00.0', '2025-07-29T22:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2564, '2025-07-30 00:00:00', '2025-07-29T22:45:00.0', '2025-07-29T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2565, '2025-07-30 00:00:00', '2025-07-29T23:00:00.0', '2025-07-29T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2566, '2025-07-30 00:00:00', '2025-07-29T23:15:00.0', '2025-07-29T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2567, '2025-07-30 00:00:00', '2025-07-29T23:30:00.0', '2025-07-29T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2568, '2025-07-30 00:00:00', '2025-07-29T23:45:00.0', '2025-07-30T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2569, '2025-07-30 00:00:00', '2025-07-30T00:00:00.0', '2025-07-30T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2570, '2025-07-30 00:00:00', '2025-07-30T00:15:00.0', '2025-07-30T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2571, '2025-07-30 00:00:00', '2025-07-30T00:30:00.0', '2025-07-30T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2572, '2025-07-30 00:00:00', '2025-07-30T00:45:00.0', '2025-07-30T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2573, '2025-07-30 00:00:00', '2025-07-30T01:00:00.0', '2025-07-30T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2574, '2025-07-30 00:00:00', '2025-07-30T01:15:00.0', '2025-07-30T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2575, '2025-07-30 00:00:00', '2025-07-30T01:30:00.0', '2025-07-30T01:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2576, '2025-07-30 00:00:00', '2025-07-30T01:45:00.0', '2025-07-30T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2577, '2025-07-30 00:00:00', '2025-07-30T02:00:00.0', '2025-07-30T02:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2578, '2025-07-30 00:00:00', '2025-07-30T02:15:00.0', '2025-07-30T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2579, '2025-07-30 00:00:00', '2025-07-30T02:30:00.0', '2025-07-30T02:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2580, '2025-07-30 00:00:00', '2025-07-30T02:45:00.0', '2025-07-30T03:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2581, '2025-07-30 00:00:00', '2025-07-30T03:00:00.0', '2025-07-30T03:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2582, '2025-07-30 00:00:00', '2025-07-30T03:15:00.0', '2025-07-30T03:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2583, '2025-07-30 00:00:00', '2025-07-30T03:30:00.0', '2025-07-30T03:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2584, '2025-07-30 00:00:00', '2025-07-30T03:45:00.0', '2025-07-30T04:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2585, '2025-07-30 00:00:00', '2025-07-30T04:00:00.0', '2025-07-30T04:15:00.0', 11, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2586, '2025-07-30 00:00:00', '2025-07-30T04:15:00.0', '2025-07-30T04:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2587, '2025-07-30 00:00:00', '2025-07-30T04:30:00.0', '2025-07-30T04:45:00.0', 0, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2588, '2025-07-30 00:00:00', '2025-07-30T04:45:00.0', '2025-07-30T05:00:00.0', 8, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2589, '2025-07-30 00:00:00', '2025-07-30T05:00:00.0', '2025-07-30T05:15:00.0', 17, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2590, '2025-07-30 00:00:00', '2025-07-30T05:15:00.0', '2025-07-30T05:30:00.0', 105, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2591, '2025-07-30 00:00:00', '2025-07-30T05:30:00.0', '2025-07-30T05:45:00.0', 7, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2592, '2025-07-30 00:00:00', '2025-07-30T05:45:00.0', '2025-07-30T06:00:00.0', 63, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2593, '2025-07-30 00:00:00', '2025-07-30T06:00:00.0', '2025-07-30T06:15:00.0', 673, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2594, '2025-07-30 00:00:00', '2025-07-30T06:15:00.0', '2025-07-30T06:30:00.0', 537, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2595, '2025-07-30 00:00:00', '2025-07-30T06:30:00.0', '2025-07-30T06:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2596, '2025-07-30 00:00:00', '2025-07-30T06:45:00.0', '2025-07-30T07:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2597, '2025-07-30 00:00:00', '2025-07-30T07:00:00.0', '2025-07-30T07:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2598, '2025-07-30 00:00:00', '2025-07-30T07:15:00.0', '2025-07-30T07:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2599, '2025-07-30 00:00:00', '2025-07-30T07:30:00.0', '2025-07-30T07:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2600, '2025-07-30 00:00:00', '2025-07-30T07:45:00.0', '2025-07-30T08:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2601, '2025-07-30 00:00:00', '2025-07-30T08:00:00.0', '2025-07-30T08:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2602, '2025-07-30 00:00:00', '2025-07-30T08:15:00.0', '2025-07-30T08:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2603, '2025-07-30 00:00:00', '2025-07-30T08:30:00.0', '2025-07-30T08:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2604, '2025-07-30 00:00:00', '2025-07-30T08:45:00.0', '2025-07-30T09:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2605, '2025-07-30 00:00:00', '2025-07-30T09:00:00.0', '2025-07-30T09:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2606, '2025-07-30 00:00:00', '2025-07-30T09:15:00.0', '2025-07-30T09:30:00.0', 19, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2607, '2025-07-30 00:00:00', '2025-07-30T09:30:00.0', '2025-07-30T09:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2608, '2025-07-30 00:00:00', '2025-07-30T09:45:00.0', '2025-07-30T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2609, '2025-07-30 00:00:00', '2025-07-30T10:00:00.0', '2025-07-30T10:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2610, '2025-07-30 00:00:00', '2025-07-30T10:15:00.0', '2025-07-30T10:30:00.0', 72, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2611, '2025-07-30 00:00:00', '2025-07-30T10:30:00.0', '2025-07-30T10:45:00.0', 73, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2612, '2025-07-30 00:00:00', '2025-07-30T10:45:00.0', '2025-07-30T11:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2613, '2025-07-30 00:00:00', '2025-07-30T11:00:00.0', '2025-07-30T11:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2614, '2025-07-30 00:00:00', '2025-07-30T11:15:00.0', '2025-07-30T11:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2615, '2025-07-30 00:00:00', '2025-07-30T11:30:00.0', '2025-07-30T11:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2616, '2025-07-30 00:00:00', '2025-07-30T11:45:00.0', '2025-07-30T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2617, '2025-07-30 00:00:00', '2025-07-30T12:00:00.0', '2025-07-30T12:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2618, '2025-07-30 00:00:00', '2025-07-30T12:15:00.0', '2025-07-30T12:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2619, '2025-07-30 00:00:00', '2025-07-30T12:30:00.0', '2025-07-30T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2620, '2025-07-30 00:00:00', '2025-07-30T12:45:00.0', '2025-07-30T13:00:00.0', 289, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2621, '2025-07-30 00:00:00', '2025-07-30T13:00:00.0', '2025-07-30T13:15:00.0', 515, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2622, '2025-07-30 00:00:00', '2025-07-30T13:15:00.0', '2025-07-30T13:30:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2623, '2025-07-30 00:00:00', '2025-07-30T13:30:00.0', '2025-07-30T13:45:00.0', 97, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2624, '2025-07-30 00:00:00', '2025-07-30T13:45:00.0', '2025-07-30T14:00:00.0', 1, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2625, '2025-07-30 00:00:00', '2025-07-30T14:00:00.0', '2025-07-30T14:15:00.0', 28, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2626, '2025-07-30 00:00:00', '2025-07-30T14:15:00.0', '2025-07-30T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2627, '2025-07-30 00:00:00', '2025-07-30T14:30:00.0', '2025-07-30T14:45:00.0', 30, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2628, '2025-07-30 00:00:00', '2025-07-30T14:45:00.0', '2025-07-30T15:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2629, '2025-07-30 00:00:00', '2025-07-30T15:00:00.0', '2025-07-30T15:15:00.0', 26, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2630, '2025-07-30 00:00:00', '2025-07-30T15:15:00.0', '2025-07-30T15:30:00.0', 172, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2631, '2025-07-30 00:00:00', '2025-07-30T15:30:00.0', '2025-07-30T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2632, '2025-07-30 00:00:00', '2025-07-30T15:45:00.0', '2025-07-30T16:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2633, '2025-07-31 00:00:00', '2025-07-30T16:00:00.0', '2025-07-30T16:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2634, '2025-07-31 00:00:00', '2025-07-30T16:15:00.0', '2025-07-30T16:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2635, '2025-07-31 00:00:00', '2025-07-30T16:30:00.0', '2025-07-30T16:45:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2636, '2025-07-31 00:00:00', '2025-07-30T16:45:00.0', '2025-07-30T17:00:00.0', 22, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2637, '2025-07-31 00:00:00', '2025-07-30T17:00:00.0', '2025-07-30T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2638, '2025-07-31 00:00:00', '2025-07-30T17:15:00.0', '2025-07-30T17:30:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2639, '2025-07-31 00:00:00', '2025-07-30T17:30:00.0', '2025-07-30T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2640, '2025-07-31 00:00:00', '2025-07-30T17:45:00.0', '2025-07-30T18:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2641, '2025-07-31 00:00:00', '2025-07-30T18:00:00.0', '2025-07-30T18:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2642, '2025-07-31 00:00:00', '2025-07-30T18:15:00.0', '2025-07-30T18:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2643, '2025-07-31 00:00:00', '2025-07-30T18:30:00.0', '2025-07-30T18:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2644, '2025-07-31 00:00:00', '2025-07-30T18:45:00.0', '2025-07-30T19:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2645, '2025-07-31 00:00:00', '2025-07-30T19:00:00.0', '2025-07-30T19:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2646, '2025-07-31 00:00:00', '2025-07-30T19:15:00.0', '2025-07-30T19:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2647, '2025-07-31 00:00:00', '2025-07-30T19:30:00.0', '2025-07-30T19:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2648, '2025-07-31 00:00:00', '2025-07-30T19:45:00.0', '2025-07-30T20:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2649, '2025-07-31 00:00:00', '2025-07-30T20:00:00.0', '2025-07-30T20:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2650, '2025-07-31 00:00:00', '2025-07-30T20:15:00.0', '2025-07-30T20:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2651, '2025-07-31 00:00:00', '2025-07-30T20:30:00.0', '2025-07-30T20:45:00.0', 6, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2652, '2025-07-31 00:00:00', '2025-07-30T20:45:00.0', '2025-07-30T21:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2653, '2025-07-31 00:00:00', '2025-07-30T21:00:00.0', '2025-07-30T21:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2654, '2025-07-31 00:00:00', '2025-07-30T21:15:00.0', '2025-07-30T21:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2655, '2025-07-31 00:00:00', '2025-07-30T21:30:00.0', '2025-07-30T21:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2656, '2025-07-31 00:00:00', '2025-07-30T21:45:00.0', '2025-07-30T22:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2657, '2025-07-31 00:00:00', '2025-07-30T22:00:00.0', '2025-07-30T22:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2658, '2025-07-31 00:00:00', '2025-07-30T22:15:00.0', '2025-07-30T22:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2659, '2025-07-31 00:00:00', '2025-07-30T22:30:00.0', '2025-07-30T22:45:00.0', 10, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2660, '2025-07-31 00:00:00', '2025-07-30T22:45:00.0', '2025-07-30T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2661, '2025-07-31 00:00:00', '2025-07-30T23:00:00.0', '2025-07-30T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2662, '2025-07-31 00:00:00', '2025-07-30T23:15:00.0', '2025-07-30T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2663, '2025-07-31 00:00:00', '2025-07-30T23:30:00.0', '2025-07-30T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2664, '2025-07-31 00:00:00', '2025-07-30T23:45:00.0', '2025-07-31T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2665, '2025-07-31 00:00:00', '2025-07-31T00:00:00.0', '2025-07-31T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2666, '2025-07-31 00:00:00', '2025-07-31T00:15:00.0', '2025-07-31T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2667, '2025-07-31 00:00:00', '2025-07-31T00:30:00.0', '2025-07-31T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2668, '2025-07-31 00:00:00', '2025-07-31T00:45:00.0', '2025-07-31T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2669, '2025-07-31 00:00:00', '2025-07-31T01:00:00.0', '2025-07-31T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2670, '2025-07-31 00:00:00', '2025-07-31T01:15:00.0', '2025-07-31T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2671, '2025-07-31 00:00:00', '2025-07-31T01:30:00.0', '2025-07-31T01:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2672, '2025-07-31 00:00:00', '2025-07-31T01:45:00.0', '2025-07-31T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2673, '2025-07-31 00:00:00', '2025-07-31T02:00:00.0', '2025-07-31T02:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2674, '2025-07-31 00:00:00', '2025-07-31T02:15:00.0', '2025-07-31T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2675, '2025-07-31 00:00:00', '2025-07-31T02:30:00.0', '2025-07-31T02:45:00.0', 20, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2676, '2025-07-31 00:00:00', '2025-07-31T02:45:00.0', '2025-07-31T03:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2677, '2025-07-31 00:00:00', '2025-07-31T03:00:00.0', '2025-07-31T03:15:00.0', 12, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2678, '2025-07-31 00:00:00', '2025-07-31T03:15:00.0', '2025-07-31T03:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2679, '2025-07-31 00:00:00', '2025-07-31T03:30:00.0', '2025-07-31T03:45:00.0', 601, '0', 'active', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2680, '2025-07-31 00:00:00', '2025-07-31T03:45:00.0', '2025-07-31T04:00:00.0', 599, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2681, '2025-07-31 00:00:00', '2025-07-31T04:00:00.0', '2025-07-31T04:15:00.0', 31, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2682, '2025-07-31 00:00:00', '2025-07-31T04:15:00.0', '2025-07-31T04:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2683, '2025-07-31 00:00:00', '2025-07-31T04:30:00.0', '2025-07-31T04:45:00.0', 8, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2684, '2025-07-31 00:00:00', '2025-07-31T04:45:00.0', '2025-07-31T05:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2685, '2025-07-31 00:00:00', '2025-07-31T05:00:00.0', '2025-07-31T05:15:00.0', 13, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2686, '2025-07-31 00:00:00', '2025-07-31T05:15:00.0', '2025-07-31T05:30:00.0', 13, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2687, '2025-07-31 00:00:00', '2025-07-31T05:30:00.0', '2025-07-31T05:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2688, '2025-07-31 00:00:00', '2025-07-31T05:45:00.0', '2025-07-31T06:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2689, '2025-07-31 00:00:00', '2025-07-31T06:00:00.0', '2025-07-31T06:15:00.0', 222, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2690, '2025-07-31 00:00:00', '2025-07-31T06:15:00.0', '2025-07-31T06:30:00.0', 460, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2691, '2025-07-31 00:00:00', '2025-07-31T06:30:00.0', '2025-07-31T06:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2692, '2025-07-31 00:00:00', '2025-07-31T06:45:00.0', '2025-07-31T07:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2693, '2025-07-31 00:00:00', '2025-07-31T07:00:00.0', '2025-07-31T07:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2694, '2025-07-31 00:00:00', '2025-07-31T07:15:00.0', '2025-07-31T07:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2695, '2025-07-31 00:00:00', '2025-07-31T07:30:00.0', '2025-07-31T07:45:00.0', 180, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2696, '2025-07-31 00:00:00', '2025-07-31T07:45:00.0', '2025-07-31T08:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2697, '2025-07-31 00:00:00', '2025-07-31T08:00:00.0', '2025-07-31T08:15:00.0', 69, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2698, '2025-07-31 00:00:00', '2025-07-31T08:15:00.0', '2025-07-31T08:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2699, '2025-07-31 00:00:00', '2025-07-31T08:30:00.0', '2025-07-31T08:45:00.0', 57, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2700, '2025-07-31 00:00:00', '2025-07-31T08:45:00.0', '2025-07-31T09:00:00.0', 67, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2701, '2025-07-31 00:00:00', '2025-07-31T09:00:00.0', '2025-07-31T09:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2702, '2025-07-31 00:00:00', '2025-07-31T09:15:00.0', '2025-07-31T09:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2703, '2025-07-31 00:00:00', '2025-07-31T09:30:00.0', '2025-07-31T09:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2704, '2025-07-31 00:00:00', '2025-07-31T09:45:00.0', '2025-07-31T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2705, '2025-07-31 00:00:00', '2025-07-31T10:00:00.0', '2025-07-31T10:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2706, '2025-07-31 00:00:00', '2025-07-31T10:15:00.0', '2025-07-31T10:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2707, '2025-07-31 00:00:00', '2025-07-31T10:30:00.0', '2025-07-31T10:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2708, '2025-07-31 00:00:00', '2025-07-31T10:45:00.0', '2025-07-31T11:00:00.0', 55, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2709, '2025-07-31 00:00:00', '2025-07-31T11:00:00.0', '2025-07-31T11:15:00.0', 65, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2710, '2025-07-31 00:00:00', '2025-07-31T11:15:00.0', '2025-07-31T11:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2711, '2025-07-31 00:00:00', '2025-07-31T11:30:00.0', '2025-07-31T11:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2712, '2025-07-31 00:00:00', '2025-07-31T11:45:00.0', '2025-07-31T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2713, '2025-07-31 00:00:00', '2025-07-31T12:00:00.0', '2025-07-31T12:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2714, '2025-07-31 00:00:00', '2025-07-31T12:15:00.0', '2025-07-31T12:30:00.0', 69, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2715, '2025-07-31 00:00:00', '2025-07-31T12:30:00.0', '2025-07-31T12:45:00.0', 74, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2716, '2025-07-31 00:00:00', '2025-07-31T12:45:00.0', '2025-07-31T13:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2717, '2025-07-31 00:00:00', '2025-07-31T13:00:00.0', '2025-07-31T13:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2718, '2025-07-31 00:00:00', '2025-07-31T13:15:00.0', '2025-07-31T13:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2719, '2025-07-31 00:00:00', '2025-07-31T13:30:00.0', '2025-07-31T13:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2720, '2025-07-31 00:00:00', '2025-07-31T13:45:00.0', '2025-07-31T14:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2721, '2025-07-31 00:00:00', '2025-07-31T14:00:00.0', '2025-07-31T14:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2722, '2025-07-31 00:00:00', '2025-07-31T14:15:00.0', '2025-07-31T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2723, '2025-07-31 00:00:00', '2025-07-31T14:30:00.0', '2025-07-31T14:45:00.0', 384, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2724, '2025-07-31 00:00:00', '2025-07-31T14:45:00.0', '2025-07-31T15:00:00.0', 171, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2725, '2025-07-31 00:00:00', '2025-07-31T15:00:00.0', '2025-07-31T15:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2726, '2025-07-31 00:00:00', '2025-07-31T15:15:00.0', '2025-07-31T15:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2727, '2025-07-31 00:00:00', '2025-07-31T15:30:00.0', '2025-07-31T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2728, '2025-07-31 00:00:00', '2025-07-31T15:45:00.0', '2025-07-31T16:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2729, '2025-08-01 00:00:00', '2025-07-31T16:00:00.0', '2025-07-31T16:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2730, '2025-08-01 00:00:00', '2025-07-31T16:15:00.0', '2025-07-31T16:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2731, '2025-08-01 00:00:00', '2025-07-31T16:30:00.0', '2025-07-31T16:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2732, '2025-08-01 00:00:00', '2025-07-31T16:45:00.0', '2025-07-31T17:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2733, '2025-08-01 00:00:00', '2025-07-31T17:00:00.0', '2025-07-31T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2734, '2025-08-01 00:00:00', '2025-07-31T17:15:00.0', '2025-07-31T17:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2735, '2025-08-01 00:00:00', '2025-07-31T17:30:00.0', '2025-07-31T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2736, '2025-08-01 00:00:00', '2025-07-31T17:45:00.0', '2025-07-31T18:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2737, '2025-08-01 00:00:00', '2025-07-31T18:00:00.0', '2025-07-31T18:15:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2738, '2025-08-01 00:00:00', '2025-07-31T18:15:00.0', '2025-07-31T18:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2739, '2025-08-01 00:00:00', '2025-07-31T18:30:00.0', '2025-07-31T18:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2740, '2025-08-01 00:00:00', '2025-07-31T18:45:00.0', '2025-07-31T19:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2741, '2025-08-01 00:00:00', '2025-07-31T19:00:00.0', '2025-07-31T19:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2742, '2025-08-01 00:00:00', '2025-07-31T19:15:00.0', '2025-07-31T19:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2743, '2025-08-01 00:00:00', '2025-07-31T19:30:00.0', '2025-07-31T19:45:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2744, '2025-08-01 00:00:00', '2025-07-31T19:45:00.0', '2025-07-31T20:00:00.0', 0, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2745, '2025-08-01 00:00:00', '2025-07-31T20:00:00.0', '2025-07-31T20:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2746, '2025-08-01 00:00:00', '2025-07-31T20:15:00.0', '2025-07-31T20:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2747, '2025-08-01 00:00:00', '2025-07-31T20:30:00.0', '2025-07-31T20:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2748, '2025-08-01 00:00:00', '2025-07-31T20:45:00.0', '2025-07-31T21:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2749, '2025-08-01 00:00:00', '2025-07-31T21:00:00.0', '2025-07-31T21:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2750, '2025-08-01 00:00:00', '2025-07-31T21:15:00.0', '2025-07-31T21:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2751, '2025-08-01 00:00:00', '2025-07-31T21:30:00.0', '2025-07-31T21:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2752, '2025-08-01 00:00:00', '2025-07-31T21:45:00.0', '2025-07-31T22:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2753, '2025-08-01 00:00:00', '2025-07-31T22:00:00.0', '2025-07-31T22:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2754, '2025-08-01 00:00:00', '2025-07-31T22:15:00.0', '2025-07-31T22:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2755, '2025-08-01 00:00:00', '2025-07-31T22:30:00.0', '2025-07-31T22:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2756, '2025-08-01 00:00:00', '2025-07-31T22:45:00.0', '2025-07-31T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2757, '2025-08-01 00:00:00', '2025-07-31T23:00:00.0', '2025-07-31T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2758, '2025-08-01 00:00:00', '2025-07-31T23:15:00.0', '2025-07-31T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2759, '2025-08-01 00:00:00', '2025-07-31T23:30:00.0', '2025-07-31T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2760, '2025-08-01 00:00:00', '2025-07-31T23:45:00.0', '2025-08-01T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2761, '2025-08-01 00:00:00', '2025-08-01T00:00:00.0', '2025-08-01T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2762, '2025-08-01 00:00:00', '2025-08-01T00:15:00.0', '2025-08-01T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2763, '2025-08-01 00:00:00', '2025-08-01T00:30:00.0', '2025-08-01T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2764, '2025-08-01 00:00:00', '2025-08-01T00:45:00.0', '2025-08-01T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2765, '2025-08-01 00:00:00', '2025-08-01T01:00:00.0', '2025-08-01T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2766, '2025-08-01 00:00:00', '2025-08-01T01:15:00.0', '2025-08-01T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2767, '2025-08-01 00:00:00', '2025-08-01T01:30:00.0', '2025-08-01T01:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2768, '2025-08-01 00:00:00', '2025-08-01T01:45:00.0', '2025-08-01T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2769, '2025-08-01 00:00:00', '2025-08-01T02:00:00.0', '2025-08-01T02:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2770, '2025-08-01 00:00:00', '2025-08-01T02:15:00.0', '2025-08-01T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2771, '2025-08-01 00:00:00', '2025-08-01T02:30:00.0', '2025-08-01T02:45:00.0', 0, '0', 'sleeping', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2772, '2025-08-01 00:00:00', '2025-08-01T02:45:00.0', '2025-08-01T03:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2773, '2025-08-01 00:00:00', '2025-08-01T03:00:00.0', '2025-08-01T03:15:00.0', 20, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2774, '2025-08-01 00:00:00', '2025-08-01T03:15:00.0', '2025-08-01T03:30:00.0', 183, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2775, '2025-08-01 00:00:00', '2025-08-01T03:30:00.0', '2025-08-01T03:45:00.0', 542, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2776, '2025-08-01 00:00:00', '2025-08-01T03:45:00.0', '2025-08-01T04:00:00.0', 46, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2777, '2025-08-01 00:00:00', '2025-08-01T04:00:00.0', '2025-08-01T04:15:00.0', 544, '0', 'active', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2778, '2025-08-01 00:00:00', '2025-08-01T04:15:00.0', '2025-08-01T04:30:00.0', 304, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2779, '2025-08-01 00:00:00', '2025-08-01T04:30:00.0', '2025-08-01T04:45:00.0', 364, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2780, '2025-08-01 00:00:00', '2025-08-01T04:45:00.0', '2025-08-01T05:00:00.0', 309, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2781, '2025-08-01 00:00:00', '2025-08-01T05:00:00.0', '2025-08-01T05:15:00.0', 31, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2782, '2025-08-01 00:00:00', '2025-08-01T05:15:00.0', '2025-08-01T05:30:00.0', 42, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2783, '2025-08-01 00:00:00', '2025-08-01T05:30:00.0', '2025-08-01T05:45:00.0', 18, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2784, '2025-08-01 00:00:00', '2025-08-01T05:45:00.0', '2025-08-01T06:00:00.0', 428, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2785, '2025-08-01 00:00:00', '2025-08-01T06:00:00.0', '2025-08-01T06:15:00.0', 283, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2786, '2025-08-01 00:00:00', '2025-08-01T06:15:00.0', '2025-08-01T06:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2787, '2025-08-01 00:00:00', '2025-08-01T06:30:00.0', '2025-08-01T06:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2788, '2025-08-01 00:00:00', '2025-08-01T06:45:00.0', '2025-08-01T07:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2789, '2025-08-01 00:00:00', '2025-08-01T07:00:00.0', '2025-08-01T07:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2790, '2025-08-01 00:00:00', '2025-08-01T07:15:00.0', '2025-08-01T07:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2791, '2025-08-01 00:00:00', '2025-08-01T07:30:00.0', '2025-08-01T07:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2792, '2025-08-01 00:00:00', '2025-08-01T07:45:00.0', '2025-08-01T08:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2793, '2025-08-01 00:00:00', '2025-08-01T08:00:00.0', '2025-08-01T08:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2794, '2025-08-01 00:00:00', '2025-08-01T08:15:00.0', '2025-08-01T08:30:00.0', 150, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2795, '2025-08-01 00:00:00', '2025-08-01T08:30:00.0', '2025-08-01T08:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2796, '2025-08-01 00:00:00', '2025-08-01T08:45:00.0', '2025-08-01T09:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2797, '2025-08-01 00:00:00', '2025-08-01T09:00:00.0', '2025-08-01T09:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2798, '2025-08-01 00:00:00', '2025-08-01T09:15:00.0', '2025-08-01T09:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2799, '2025-08-01 00:00:00', '2025-08-01T09:30:00.0', '2025-08-01T09:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2800, '2025-08-01 00:00:00', '2025-08-01T09:45:00.0', '2025-08-01T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2801, '2025-08-01 00:00:00', '2025-08-01T10:00:00.0', '2025-08-01T10:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2802, '2025-08-01 00:00:00', '2025-08-01T10:15:00.0', '2025-08-01T10:30:00.0', 115, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2803, '2025-08-01 00:00:00', '2025-08-01T10:30:00.0', '2025-08-01T10:45:00.0', 37, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2804, '2025-08-01 00:00:00', '2025-08-01T10:45:00.0', '2025-08-01T11:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2805, '2025-08-01 00:00:00', '2025-08-01T11:00:00.0', '2025-08-01T11:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2806, '2025-08-01 00:00:00', '2025-08-01T11:15:00.0', '2025-08-01T11:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2807, '2025-08-01 00:00:00', '2025-08-01T11:30:00.0', '2025-08-01T11:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2808, '2025-08-01 00:00:00', '2025-08-01T11:45:00.0', '2025-08-01T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2809, '2025-08-01 00:00:00', '2025-08-01T12:00:00.0', '2025-08-01T12:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2810, '2025-08-01 00:00:00', '2025-08-01T12:15:00.0', '2025-08-01T12:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2811, '2025-08-01 00:00:00', '2025-08-01T12:30:00.0', '2025-08-01T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2812, '2025-08-01 00:00:00', '2025-08-01T12:45:00.0', '2025-08-01T13:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2813, '2025-08-01 00:00:00', '2025-08-01T13:00:00.0', '2025-08-01T13:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2814, '2025-08-01 00:00:00', '2025-08-01T13:15:00.0', '2025-08-01T13:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2815, '2025-08-01 00:00:00', '2025-08-01T13:30:00.0', '2025-08-01T13:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2816, '2025-08-01 00:00:00', '2025-08-01T13:45:00.0', '2025-08-01T14:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2817, '2025-08-01 00:00:00', '2025-08-01T14:00:00.0', '2025-08-01T14:15:00.0', 206, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2818, '2025-08-01 00:00:00', '2025-08-01T14:15:00.0', '2025-08-01T14:30:00.0', 433, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2819, '2025-08-01 00:00:00', '2025-08-01T14:30:00.0', '2025-08-01T14:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2820, '2025-08-01 00:00:00', '2025-08-01T14:45:00.0', '2025-08-01T15:00:00.0', 59, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2821, '2025-08-01 00:00:00', '2025-08-01T15:00:00.0', '2025-08-01T15:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2822, '2025-08-01 00:00:00', '2025-08-01T15:15:00.0', '2025-08-01T15:30:00.0', 61, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2823, '2025-08-01 00:00:00', '2025-08-01T15:30:00.0', '2025-08-01T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2824, '2025-08-01 00:00:00', '2025-08-01T15:45:00.0', '2025-08-01T16:00:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2825, '2025-08-02 00:00:00', '2025-08-01T16:00:00.0', '2025-08-01T16:15:00.0', 156, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2826, '2025-08-02 00:00:00', '2025-08-01T16:15:00.0', '2025-08-01T16:30:00.0', 118, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2827, '2025-08-02 00:00:00', '2025-08-01T16:30:00.0', '2025-08-01T16:45:00.0', 62, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2828, '2025-08-02 00:00:00', '2025-08-01T16:45:00.0', '2025-08-01T17:00:00.0', 23, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2829, '2025-08-02 00:00:00', '2025-08-01T17:00:00.0', '2025-08-01T17:15:00.0', 70, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2830, '2025-08-02 00:00:00', '2025-08-01T17:15:00.0', '2025-08-01T17:30:00.0', 26, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2831, '2025-08-02 00:00:00', '2025-08-01T17:30:00.0', '2025-08-01T17:45:00.0', 84, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2832, '2025-08-02 00:00:00', '2025-08-01T17:45:00.0', '2025-08-01T18:00:00.0', 94, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2833, '2025-08-02 00:00:00', '2025-08-01T18:00:00.0', '2025-08-01T18:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2834, '2025-08-02 00:00:00', '2025-08-01T18:15:00.0', '2025-08-01T18:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2835, '2025-08-02 00:00:00', '2025-08-01T18:30:00.0', '2025-08-01T18:45:00.0', 28, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2836, '2025-08-02 00:00:00', '2025-08-01T18:45:00.0', '2025-08-01T19:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2837, '2025-08-02 00:00:00', '2025-08-01T19:00:00.0', '2025-08-01T19:15:00.0', 127, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2838, '2025-08-02 00:00:00', '2025-08-01T19:15:00.0', '2025-08-01T19:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2839, '2025-08-02 00:00:00', '2025-08-01T19:30:00.0', '2025-08-01T19:45:00.0', 13, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2840, '2025-08-02 00:00:00', '2025-08-01T19:45:00.0', '2025-08-01T20:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2841, '2025-08-02 00:00:00', '2025-08-01T20:00:00.0', '2025-08-01T20:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2842, '2025-08-02 00:00:00', '2025-08-01T20:15:00.0', '2025-08-01T20:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2843, '2025-08-02 00:00:00', '2025-08-01T20:30:00.0', '2025-08-01T20:45:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2844, '2025-08-02 00:00:00', '2025-08-01T20:45:00.0', '2025-08-01T21:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2845, '2025-08-02 00:00:00', '2025-08-01T21:00:00.0', '2025-08-01T21:15:00.0', 27, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2846, '2025-08-02 00:00:00', '2025-08-01T21:15:00.0', '2025-08-01T21:30:00.0', 24, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2847, '2025-08-02 00:00:00', '2025-08-01T21:30:00.0', '2025-08-01T21:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2848, '2025-08-02 00:00:00', '2025-08-01T21:45:00.0', '2025-08-01T22:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2849, '2025-08-02 00:00:00', '2025-08-01T22:00:00.0', '2025-08-01T22:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2850, '2025-08-02 00:00:00', '2025-08-01T22:15:00.0', '2025-08-01T22:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2851, '2025-08-02 00:00:00', '2025-08-01T22:30:00.0', '2025-08-01T22:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2852, '2025-08-02 00:00:00', '2025-08-01T22:45:00.0', '2025-08-01T23:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2853, '2025-08-02 00:00:00', '2025-08-01T23:00:00.0', '2025-08-01T23:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2854, '2025-08-02 00:00:00', '2025-08-01T23:15:00.0', '2025-08-01T23:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2855, '2025-08-02 00:00:00', '2025-08-01T23:30:00.0', '2025-08-01T23:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2856, '2025-08-02 00:00:00', '2025-08-01T23:45:00.0', '2025-08-02T00:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2857, '2025-08-02 00:00:00', '2025-08-02T00:00:00.0', '2025-08-02T00:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2858, '2025-08-02 00:00:00', '2025-08-02T00:15:00.0', '2025-08-02T00:30:00.0', 7, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2859, '2025-08-02 00:00:00', '2025-08-02T00:30:00.0', '2025-08-02T00:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2860, '2025-08-02 00:00:00', '2025-08-02T00:45:00.0', '2025-08-02T01:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2861, '2025-08-02 00:00:00', '2025-08-02T01:00:00.0', '2025-08-02T01:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2862, '2025-08-02 00:00:00', '2025-08-02T01:15:00.0', '2025-08-02T01:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2863, '2025-08-02 00:00:00', '2025-08-02T01:30:00.0', '2025-08-02T01:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2864, '2025-08-02 00:00:00', '2025-08-02T01:45:00.0', '2025-08-02T02:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2865, '2025-08-02 00:00:00', '2025-08-02T02:00:00.0', '2025-08-02T02:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2866, '2025-08-02 00:00:00', '2025-08-02T02:15:00.0', '2025-08-02T02:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2867, '2025-08-02 00:00:00', '2025-08-02T02:30:00.0', '2025-08-02T02:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2868, '2025-08-02 00:00:00', '2025-08-02T02:45:00.0', '2025-08-02T03:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2869, '2025-08-02 00:00:00', '2025-08-02T03:00:00.0', '2025-08-02T03:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2870, '2025-08-02 00:00:00', '2025-08-02T03:15:00.0', '2025-08-02T03:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2871, '2025-08-02 00:00:00', '2025-08-02T03:30:00.0', '2025-08-02T03:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2872, '2025-08-02 00:00:00', '2025-08-02T03:45:00.0', '2025-08-02T04:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2873, '2025-08-02 00:00:00', '2025-08-02T04:00:00.0', '2025-08-02T04:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2874, '2025-08-02 00:00:00', '2025-08-02T04:15:00.0', '2025-08-02T04:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2875, '2025-08-02 00:00:00', '2025-08-02T04:30:00.0', '2025-08-02T04:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2876, '2025-08-02 00:00:00', '2025-08-02T04:45:00.0', '2025-08-02T05:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2877, '2025-08-02 00:00:00', '2025-08-02T05:00:00.0', '2025-08-02T05:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2878, '2025-08-02 00:00:00', '2025-08-02T05:15:00.0', '2025-08-02T05:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2879, '2025-08-02 00:00:00', '2025-08-02T05:30:00.0', '2025-08-02T05:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2880, '2025-08-02 00:00:00', '2025-08-02T05:45:00.0', '2025-08-02T06:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2881, '2025-08-02 00:00:00', '2025-08-02T06:00:00.0', '2025-08-02T06:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2882, '2025-08-02 00:00:00', '2025-08-02T06:15:00.0', '2025-08-02T06:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2883, '2025-08-02 00:00:00', '2025-08-02T06:30:00.0', '2025-08-02T06:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2884, '2025-08-02 00:00:00', '2025-08-02T06:45:00.0', '2025-08-02T07:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2885, '2025-08-02 00:00:00', '2025-08-02T07:00:00.0', '2025-08-02T07:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2886, '2025-08-02 00:00:00', '2025-08-02T07:15:00.0', '2025-08-02T07:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2887, '2025-08-02 00:00:00', '2025-08-02T07:30:00.0', '2025-08-02T07:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2888, '2025-08-02 00:00:00', '2025-08-02T07:45:00.0', '2025-08-02T08:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2889, '2025-08-02 00:00:00', '2025-08-02T08:00:00.0', '2025-08-02T08:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2890, '2025-08-02 00:00:00', '2025-08-02T08:15:00.0', '2025-08-02T08:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2891, '2025-08-02 00:00:00', '2025-08-02T08:30:00.0', '2025-08-02T08:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2892, '2025-08-02 00:00:00', '2025-08-02T08:45:00.0', '2025-08-02T09:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2893, '2025-08-02 00:00:00', '2025-08-02T09:00:00.0', '2025-08-02T09:15:00.0', 0, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2894, '2025-08-02 00:00:00', '2025-08-02T09:15:00.0', '2025-08-02T09:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2895, '2025-08-02 00:00:00', '2025-08-02T09:30:00.0', '2025-08-02T09:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2896, '2025-08-02 00:00:00', '2025-08-02T09:45:00.0', '2025-08-02T10:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2897, '2025-08-02 00:00:00', '2025-08-02T10:00:00.0', '2025-08-02T10:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2898, '2025-08-02 00:00:00', '2025-08-02T10:15:00.0', '2025-08-02T10:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2899, '2025-08-02 00:00:00', '2025-08-02T10:30:00.0', '2025-08-02T10:45:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2900, '2025-08-02 00:00:00', '2025-08-02T10:45:00.0', '2025-08-02T11:00:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2901, '2025-08-02 00:00:00', '2025-08-02T11:00:00.0', '2025-08-02T11:15:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2902, '2025-08-02 00:00:00', '2025-08-02T11:15:00.0', '2025-08-02T11:30:00.0', 0, '0', 'none', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2903, '2025-08-02 00:00:00', '2025-08-02T11:30:00.0', '2025-08-02T11:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2904, '2025-08-02 00:00:00', '2025-08-02T11:45:00.0', '2025-08-02T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2905, '2025-08-02 00:00:00', '2025-08-02T12:00:00.0', '2025-08-02T12:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2906, '2025-08-02 00:00:00', '2025-08-02T12:15:00.0', '2025-08-02T12:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2907, '2025-08-02 00:00:00', '2025-08-02T12:30:00.0', '2025-08-02T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2908, '2025-08-02 00:00:00', '2025-08-02T12:45:00.0', '2025-08-02T13:00:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2909, '2025-08-02 00:00:00', '2025-08-02T13:00:00.0', '2025-08-02T13:15:00.0', 73, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2910, '2025-08-02 00:00:00', '2025-08-02T13:15:00.0', '2025-08-02T13:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2911, '2025-08-02 00:00:00', '2025-08-02T13:30:00.0', '2025-08-02T13:45:00.0', 37, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2912, '2025-08-02 00:00:00', '2025-08-02T13:45:00.0', '2025-08-02T14:00:00.0', 25, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2913, '2025-08-02 00:00:00', '2025-08-02T14:00:00.0', '2025-08-02T14:15:00.0', 16, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2914, '2025-08-02 00:00:00', '2025-08-02T14:15:00.0', '2025-08-02T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2915, '2025-08-02 00:00:00', '2025-08-02T14:30:00.0', '2025-08-02T14:45:00.0', 19, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2916, '2025-08-02 00:00:00', '2025-08-02T14:45:00.0', '2025-08-02T15:00:00.0', 103, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2917, '2025-08-02 00:00:00', '2025-08-02T15:00:00.0', '2025-08-02T15:15:00.0', 58, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2918, '2025-08-02 00:00:00', '2025-08-02T15:15:00.0', '2025-08-02T15:30:00.0', 42, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2919, '2025-08-02 00:00:00', '2025-08-02T15:30:00.0', '2025-08-02T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2920, '2025-08-02 00:00:00', '2025-08-02T15:45:00.0', '2025-08-02T16:00:00.0', 13, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2921, '2025-08-03 00:00:00', '2025-08-02T16:00:00.0', '2025-08-02T16:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2922, '2025-08-03 00:00:00', '2025-08-02T16:15:00.0', '2025-08-02T16:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2923, '2025-08-03 00:00:00', '2025-08-02T16:30:00.0', '2025-08-02T16:45:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2924, '2025-08-03 00:00:00', '2025-08-02T16:45:00.0', '2025-08-02T17:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2925, '2025-08-03 00:00:00', '2025-08-02T17:00:00.0', '2025-08-02T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2926, '2025-08-03 00:00:00', '2025-08-02T17:15:00.0', '2025-08-02T17:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2927, '2025-08-03 00:00:00', '2025-08-02T17:30:00.0', '2025-08-02T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2928, '2025-08-03 00:00:00', '2025-08-02T17:45:00.0', '2025-08-02T18:00:00.0', 100, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2929, '2025-08-03 00:00:00', '2025-08-02T18:00:00.0', '2025-08-02T18:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2930, '2025-08-03 00:00:00', '2025-08-02T18:15:00.0', '2025-08-02T18:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2931, '2025-08-03 00:00:00', '2025-08-02T18:30:00.0', '2025-08-02T18:45:00.0', 96, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2932, '2025-08-03 00:00:00', '2025-08-02T18:45:00.0', '2025-08-02T19:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2933, '2025-08-03 00:00:00', '2025-08-02T19:00:00.0', '2025-08-02T19:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2934, '2025-08-03 00:00:00', '2025-08-02T19:15:00.0', '2025-08-02T19:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2935, '2025-08-03 00:00:00', '2025-08-02T19:30:00.0', '2025-08-02T19:45:00.0', 16, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2936, '2025-08-03 00:00:00', '2025-08-02T19:45:00.0', '2025-08-02T20:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2937, '2025-08-03 00:00:00', '2025-08-02T20:00:00.0', '2025-08-02T20:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2938, '2025-08-03 00:00:00', '2025-08-02T20:15:00.0', '2025-08-02T20:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2939, '2025-08-03 00:00:00', '2025-08-02T20:30:00.0', '2025-08-02T20:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2940, '2025-08-03 00:00:00', '2025-08-02T20:45:00.0', '2025-08-02T21:00:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2941, '2025-08-03 00:00:00', '2025-08-02T21:00:00.0', '2025-08-02T21:15:00.0', 53, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2942, '2025-08-03 00:00:00', '2025-08-02T21:15:00.0', '2025-08-02T21:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2943, '2025-08-03 00:00:00', '2025-08-02T21:30:00.0', '2025-08-02T21:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2944, '2025-08-03 00:00:00', '2025-08-02T21:45:00.0', '2025-08-02T22:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2945, '2025-08-03 00:00:00', '2025-08-02T22:00:00.0', '2025-08-02T22:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2946, '2025-08-03 00:00:00', '2025-08-02T22:15:00.0', '2025-08-02T22:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2947, '2025-08-03 00:00:00', '2025-08-02T22:30:00.0', '2025-08-02T22:45:00.0', 0, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2948, '2025-08-03 00:00:00', '2025-08-02T22:45:00.0', '2025-08-02T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2949, '2025-08-03 00:00:00', '2025-08-02T23:00:00.0', '2025-08-02T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2950, '2025-08-03 00:00:00', '2025-08-02T23:15:00.0', '2025-08-02T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2951, '2025-08-03 00:00:00', '2025-08-02T23:30:00.0', '2025-08-02T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2952, '2025-08-03 00:00:00', '2025-08-02T23:45:00.0', '2025-08-03T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2953, '2025-08-03 00:00:00', '2025-08-03T00:00:00.0', '2025-08-03T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2954, '2025-08-03 00:00:00', '2025-08-03T00:15:00.0', '2025-08-03T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2955, '2025-08-03 00:00:00', '2025-08-03T00:30:00.0', '2025-08-03T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2956, '2025-08-03 00:00:00', '2025-08-03T00:45:00.0', '2025-08-03T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2957, '2025-08-03 00:00:00', '2025-08-03T01:00:00.0', '2025-08-03T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2958, '2025-08-03 00:00:00', '2025-08-03T01:15:00.0', '2025-08-03T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2959, '2025-08-03 00:00:00', '2025-08-03T01:30:00.0', '2025-08-03T01:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2960, '2025-08-03 00:00:00', '2025-08-03T01:45:00.0', '2025-08-03T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2961, '2025-08-03 00:00:00', '2025-08-03T02:00:00.0', '2025-08-03T02:15:00.0', 9, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2962, '2025-08-03 00:00:00', '2025-08-03T02:15:00.0', '2025-08-03T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2963, '2025-08-03 00:00:00', '2025-08-03T02:30:00.0', '2025-08-03T02:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2964, '2025-08-03 00:00:00', '2025-08-03T02:45:00.0', '2025-08-03T03:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2965, '2025-08-03 00:00:00', '2025-08-03T03:00:00.0', '2025-08-03T03:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2966, '2025-08-03 00:00:00', '2025-08-03T03:15:00.0', '2025-08-03T03:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2967, '2025-08-03 00:00:00', '2025-08-03T03:30:00.0', '2025-08-03T03:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2968, '2025-08-03 00:00:00', '2025-08-03T03:45:00.0', '2025-08-03T04:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2969, '2025-08-03 00:00:00', '2025-08-03T04:00:00.0', '2025-08-03T04:15:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2970, '2025-08-03 00:00:00', '2025-08-03T04:15:00.0', '2025-08-03T04:30:00.0', 49, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2971, '2025-08-03 00:00:00', '2025-08-03T04:30:00.0', '2025-08-03T04:45:00.0', 464, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2972, '2025-08-03 00:00:00', '2025-08-03T04:45:00.0', '2025-08-03T05:00:00.0', 640, '0', 'highlyActive', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2973, '2025-08-03 00:00:00', '2025-08-03T05:00:00.0', '2025-08-03T05:15:00.0', 176, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2974, '2025-08-03 00:00:00', '2025-08-03T05:15:00.0', '2025-08-03T05:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2975, '2025-08-03 00:00:00', '2025-08-03T05:30:00.0', '2025-08-03T05:45:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2976, '2025-08-03 00:00:00', '2025-08-03T05:45:00.0', '2025-08-03T06:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2977, '2025-08-03 00:00:00', '2025-08-03T06:00:00.0', '2025-08-03T06:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2978, '2025-08-03 00:00:00', '2025-08-03T06:15:00.0', '2025-08-03T06:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2979, '2025-08-03 00:00:00', '2025-08-03T06:30:00.0', '2025-08-03T06:45:00.0', 66, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2980, '2025-08-03 00:00:00', '2025-08-03T06:45:00.0', '2025-08-03T07:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2981, '2025-08-03 00:00:00', '2025-08-03T07:00:00.0', '2025-08-03T07:15:00.0', 82, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2982, '2025-08-03 00:00:00', '2025-08-03T07:15:00.0', '2025-08-03T07:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2983, '2025-08-03 00:00:00', '2025-08-03T07:30:00.0', '2025-08-03T07:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2984, '2025-08-03 00:00:00', '2025-08-03T07:45:00.0', '2025-08-03T08:00:00.0', 100, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2985, '2025-08-03 00:00:00', '2025-08-03T08:00:00.0', '2025-08-03T08:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2986, '2025-08-03 00:00:00', '2025-08-03T08:15:00.0', '2025-08-03T08:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2987, '2025-08-03 00:00:00', '2025-08-03T08:30:00.0', '2025-08-03T08:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2988, '2025-08-03 00:00:00', '2025-08-03T08:45:00.0', '2025-08-03T09:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2989, '2025-08-03 00:00:00', '2025-08-03T09:00:00.0', '2025-08-03T09:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2990, '2025-08-03 00:00:00', '2025-08-03T09:15:00.0', '2025-08-03T09:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2991, '2025-08-03 00:00:00', '2025-08-03T09:30:00.0', '2025-08-03T09:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2992, '2025-08-03 00:00:00', '2025-08-03T09:45:00.0', '2025-08-03T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2993, '2025-08-03 00:00:00', '2025-08-03T10:00:00.0', '2025-08-03T10:15:00.0', 141, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2994, '2025-08-03 00:00:00', '2025-08-03T10:15:00.0', '2025-08-03T10:30:00.0', 70, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2995, '2025-08-03 00:00:00', '2025-08-03T10:30:00.0', '2025-08-03T10:45:00.0', 170, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2996, '2025-08-03 00:00:00', '2025-08-03T10:45:00.0', '2025-08-03T11:00:00.0', 592, '0', 'active', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2997, '2025-08-03 00:00:00', '2025-08-03T11:00:00.0', '2025-08-03T11:15:00.0', 28, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2998, '2025-08-03 00:00:00', '2025-08-03T11:15:00.0', '2025-08-03T11:30:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (2999, '2025-08-03 00:00:00', '2025-08-03T11:30:00.0', '2025-08-03T11:45:00.0', 38, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3000, '2025-08-03 00:00:00', '2025-08-03T11:45:00.0', '2025-08-03T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3001, '2025-08-03 00:00:00', '2025-08-03T12:00:00.0', '2025-08-03T12:15:00.0', 17, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3002, '2025-08-03 00:00:00', '2025-08-03T12:15:00.0', '2025-08-03T12:30:00.0', 98, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3003, '2025-08-03 00:00:00', '2025-08-03T12:30:00.0', '2025-08-03T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3004, '2025-08-03 00:00:00', '2025-08-03T12:45:00.0', '2025-08-03T13:00:00.0', 62, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3005, '2025-08-03 00:00:00', '2025-08-03T13:00:00.0', '2025-08-03T13:15:00.0', 168, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3006, '2025-08-03 00:00:00', '2025-08-03T13:15:00.0', '2025-08-03T13:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3007, '2025-08-03 00:00:00', '2025-08-03T13:30:00.0', '2025-08-03T13:45:00.0', 27, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3008, '2025-08-03 00:00:00', '2025-08-03T13:45:00.0', '2025-08-03T14:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3009, '2025-08-03 00:00:00', '2025-08-03T14:00:00.0', '2025-08-03T14:15:00.0', 144, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3010, '2025-08-03 00:00:00', '2025-08-03T14:15:00.0', '2025-08-03T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3011, '2025-08-03 00:00:00', '2025-08-03T14:30:00.0', '2025-08-03T14:45:00.0', 89, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3012, '2025-08-03 00:00:00', '2025-08-03T14:45:00.0', '2025-08-03T15:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3013, '2025-08-03 00:00:00', '2025-08-03T15:00:00.0', '2025-08-03T15:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3014, '2025-08-03 00:00:00', '2025-08-03T15:15:00.0', '2025-08-03T15:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3015, '2025-08-03 00:00:00', '2025-08-03T15:30:00.0', '2025-08-03T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3016, '2025-08-03 00:00:00', '2025-08-03T15:45:00.0', '2025-08-03T16:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3017, '2025-08-04 00:00:00', '2025-08-03T16:00:00.0', '2025-08-03T16:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3018, '2025-08-04 00:00:00', '2025-08-03T16:15:00.0', '2025-08-03T16:30:00.0', 49, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3019, '2025-08-04 00:00:00', '2025-08-03T16:30:00.0', '2025-08-03T16:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3020, '2025-08-04 00:00:00', '2025-08-03T16:45:00.0', '2025-08-03T17:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3021, '2025-08-04 00:00:00', '2025-08-03T17:00:00.0', '2025-08-03T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3022, '2025-08-04 00:00:00', '2025-08-03T17:15:00.0', '2025-08-03T17:30:00.0', 37, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3023, '2025-08-04 00:00:00', '2025-08-03T17:30:00.0', '2025-08-03T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3024, '2025-08-04 00:00:00', '2025-08-03T17:45:00.0', '2025-08-03T18:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3025, '2025-08-04 00:00:00', '2025-08-03T18:00:00.0', '2025-08-03T18:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3026, '2025-08-04 00:00:00', '2025-08-03T18:15:00.0', '2025-08-03T18:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3027, '2025-08-04 00:00:00', '2025-08-03T18:30:00.0', '2025-08-03T18:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3028, '2025-08-04 00:00:00', '2025-08-03T18:45:00.0', '2025-08-03T19:00:00.0', 57, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3029, '2025-08-04 00:00:00', '2025-08-03T19:00:00.0', '2025-08-03T19:15:00.0', 0, '0', 'sleeping', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3030, '2025-08-04 00:00:00', '2025-08-03T19:15:00.0', '2025-08-03T19:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3031, '2025-08-04 00:00:00', '2025-08-03T19:30:00.0', '2025-08-03T19:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3032, '2025-08-04 00:00:00', '2025-08-03T19:45:00.0', '2025-08-03T20:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3033, '2025-08-04 00:00:00', '2025-08-03T20:00:00.0', '2025-08-03T20:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3034, '2025-08-04 00:00:00', '2025-08-03T20:15:00.0', '2025-08-03T20:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3035, '2025-08-04 00:00:00', '2025-08-03T20:30:00.0', '2025-08-03T20:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3036, '2025-08-04 00:00:00', '2025-08-03T20:45:00.0', '2025-08-03T21:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3037, '2025-08-04 00:00:00', '2025-08-03T21:00:00.0', '2025-08-03T21:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3038, '2025-08-04 00:00:00', '2025-08-03T21:15:00.0', '2025-08-03T21:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3039, '2025-08-04 00:00:00', '2025-08-03T21:30:00.0', '2025-08-03T21:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3040, '2025-08-04 00:00:00', '2025-08-03T21:45:00.0', '2025-08-03T22:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3041, '2025-08-04 00:00:00', '2025-08-03T22:00:00.0', '2025-08-03T22:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3042, '2025-08-04 00:00:00', '2025-08-03T22:15:00.0', '2025-08-03T22:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3043, '2025-08-04 00:00:00', '2025-08-03T22:30:00.0', '2025-08-03T22:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3044, '2025-08-04 00:00:00', '2025-08-03T22:45:00.0', '2025-08-03T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3045, '2025-08-04 00:00:00', '2025-08-03T23:00:00.0', '2025-08-03T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3046, '2025-08-04 00:00:00', '2025-08-03T23:15:00.0', '2025-08-03T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3047, '2025-08-04 00:00:00', '2025-08-03T23:30:00.0', '2025-08-03T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3048, '2025-08-04 00:00:00', '2025-08-03T23:45:00.0', '2025-08-04T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3049, '2025-08-04 00:00:00', '2025-08-04T00:00:00.0', '2025-08-04T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3050, '2025-08-04 00:00:00', '2025-08-04T00:15:00.0', '2025-08-04T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3051, '2025-08-04 00:00:00', '2025-08-04T00:30:00.0', '2025-08-04T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3052, '2025-08-04 00:00:00', '2025-08-04T00:45:00.0', '2025-08-04T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3053, '2025-08-04 00:00:00', '2025-08-04T01:00:00.0', '2025-08-04T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3054, '2025-08-04 00:00:00', '2025-08-04T01:15:00.0', '2025-08-04T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3055, '2025-08-04 00:00:00', '2025-08-04T01:30:00.0', '2025-08-04T01:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3056, '2025-08-04 00:00:00', '2025-08-04T01:45:00.0', '2025-08-04T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3057, '2025-08-04 00:00:00', '2025-08-04T02:00:00.0', '2025-08-04T02:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3058, '2025-08-04 00:00:00', '2025-08-04T02:15:00.0', '2025-08-04T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3059, '2025-08-04 00:00:00', '2025-08-04T02:30:00.0', '2025-08-04T02:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3060, '2025-08-04 00:00:00', '2025-08-04T02:45:00.0', '2025-08-04T03:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3061, '2025-08-04 00:00:00', '2025-08-04T03:00:00.0', '2025-08-04T03:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3062, '2025-08-04 00:00:00', '2025-08-04T03:15:00.0', '2025-08-04T03:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3063, '2025-08-04 00:00:00', '2025-08-04T03:30:00.0', '2025-08-04T03:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3064, '2025-08-04 00:00:00', '2025-08-04T03:45:00.0', '2025-08-04T04:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3065, '2025-08-04 00:00:00', '2025-08-04T04:00:00.0', '2025-08-04T04:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3066, '2025-08-04 00:00:00', '2025-08-04T04:15:00.0', '2025-08-04T04:30:00.0', 151, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3067, '2025-08-04 00:00:00', '2025-08-04T04:30:00.0', '2025-08-04T04:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3068, '2025-08-04 00:00:00', '2025-08-04T04:45:00.0', '2025-08-04T05:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3069, '2025-08-04 00:00:00', '2025-08-04T05:00:00.0', '2025-08-04T05:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3070, '2025-08-04 00:00:00', '2025-08-04T05:15:00.0', '2025-08-04T05:30:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3071, '2025-08-04 00:00:00', '2025-08-04T05:30:00.0', '2025-08-04T05:45:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3072, '2025-08-04 00:00:00', '2025-08-04T05:45:00.0', '2025-08-04T06:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3073, '2025-08-04 00:00:00', '2025-08-04T06:00:00.0', '2025-08-04T06:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3074, '2025-08-04 00:00:00', '2025-08-04T06:15:00.0', '2025-08-04T06:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3075, '2025-08-04 00:00:00', '2025-08-04T06:30:00.0', '2025-08-04T06:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3076, '2025-08-04 00:00:00', '2025-08-04T06:45:00.0', '2025-08-04T07:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3077, '2025-08-04 00:00:00', '2025-08-04T07:00:00.0', '2025-08-04T07:15:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3078, '2025-08-04 00:00:00', '2025-08-04T07:15:00.0', '2025-08-04T07:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3079, '2025-08-04 00:00:00', '2025-08-04T07:30:00.0', '2025-08-04T07:45:00.0', 118, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3080, '2025-08-04 00:00:00', '2025-08-04T07:45:00.0', '2025-08-04T08:00:00.0', 56, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3081, '2025-08-04 00:00:00', '2025-08-04T08:00:00.0', '2025-08-04T08:15:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3082, '2025-08-04 00:00:00', '2025-08-04T08:15:00.0', '2025-08-04T08:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3083, '2025-08-04 00:00:00', '2025-08-04T08:30:00.0', '2025-08-04T08:45:00.0', 45, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3084, '2025-08-04 00:00:00', '2025-08-04T08:45:00.0', '2025-08-04T09:00:00.0', 60, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3085, '2025-08-04 00:00:00', '2025-08-04T09:00:00.0', '2025-08-04T09:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3086, '2025-08-04 00:00:00', '2025-08-04T09:15:00.0', '2025-08-04T09:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3087, '2025-08-04 00:00:00', '2025-08-04T09:30:00.0', '2025-08-04T09:45:00.0', 38, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3088, '2025-08-04 00:00:00', '2025-08-04T09:45:00.0', '2025-08-04T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3089, '2025-08-04 00:00:00', '2025-08-04T10:00:00.0', '2025-08-04T10:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3090, '2025-08-04 00:00:00', '2025-08-04T10:15:00.0', '2025-08-04T10:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3091, '2025-08-04 00:00:00', '2025-08-04T10:30:00.0', '2025-08-04T10:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3092, '2025-08-04 00:00:00', '2025-08-04T10:45:00.0', '2025-08-04T11:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3093, '2025-08-04 00:00:00', '2025-08-04T11:00:00.0', '2025-08-04T11:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3094, '2025-08-04 00:00:00', '2025-08-04T11:15:00.0', '2025-08-04T11:30:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3095, '2025-08-04 00:00:00', '2025-08-04T11:30:00.0', '2025-08-04T11:45:00.0', 42, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3096, '2025-08-04 00:00:00', '2025-08-04T11:45:00.0', '2025-08-04T12:00:00.0', 678, '0', 'active', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3097, '2025-08-04 00:00:00', '2025-08-04T12:00:00.0', '2025-08-04T12:15:00.0', 373, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3098, '2025-08-04 00:00:00', '2025-08-04T12:15:00.0', '2025-08-04T12:30:00.0', 32, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3099, '2025-08-04 00:00:00', '2025-08-04T12:30:00.0', '2025-08-04T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3100, '2025-08-04 00:00:00', '2025-08-04T12:45:00.0', '2025-08-04T13:00:00.0', 14, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3101, '2025-08-04 00:00:00', '2025-08-04T13:00:00.0', '2025-08-04T13:15:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3102, '2025-08-04 00:00:00', '2025-08-04T13:15:00.0', '2025-08-04T13:30:00.0', 53, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3103, '2025-08-04 00:00:00', '2025-08-04T13:30:00.0', '2025-08-04T13:45:00.0', 32, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3104, '2025-08-04 00:00:00', '2025-08-04T13:45:00.0', '2025-08-04T14:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3105, '2025-08-04 00:00:00', '2025-08-04T14:00:00.0', '2025-08-04T14:15:00.0', 11, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3106, '2025-08-04 00:00:00', '2025-08-04T14:15:00.0', '2025-08-04T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3107, '2025-08-04 00:00:00', '2025-08-04T14:30:00.0', '2025-08-04T14:45:00.0', 9, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3108, '2025-08-04 00:00:00', '2025-08-04T14:45:00.0', '2025-08-04T15:00:00.0', 61, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3109, '2025-08-04 00:00:00', '2025-08-04T15:00:00.0', '2025-08-04T15:15:00.0', 19, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3110, '2025-08-04 00:00:00', '2025-08-04T15:15:00.0', '2025-08-04T15:30:00.0', 13, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3111, '2025-08-04 00:00:00', '2025-08-04T15:30:00.0', '2025-08-04T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3112, '2025-08-04 00:00:00', '2025-08-04T15:45:00.0', '2025-08-04T16:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3113, '2025-08-05 00:00:00', '2025-08-04T16:00:00.0', '2025-08-04T16:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3114, '2025-08-05 00:00:00', '2025-08-04T16:15:00.0', '2025-08-04T16:30:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3115, '2025-08-05 00:00:00', '2025-08-04T16:30:00.0', '2025-08-04T16:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3116, '2025-08-05 00:00:00', '2025-08-04T16:45:00.0', '2025-08-04T17:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3117, '2025-08-05 00:00:00', '2025-08-04T17:00:00.0', '2025-08-04T17:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3118, '2025-08-05 00:00:00', '2025-08-04T17:15:00.0', '2025-08-04T17:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3119, '2025-08-05 00:00:00', '2025-08-04T17:30:00.0', '2025-08-04T17:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3120, '2025-08-05 00:00:00', '2025-08-04T17:45:00.0', '2025-08-04T18:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3121, '2025-08-05 00:00:00', '2025-08-04T18:00:00.0', '2025-08-04T18:15:00.0', 21, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3122, '2025-08-05 00:00:00', '2025-08-04T18:15:00.0', '2025-08-04T18:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3123, '2025-08-05 00:00:00', '2025-08-04T18:30:00.0', '2025-08-04T18:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3124, '2025-08-05 00:00:00', '2025-08-04T18:45:00.0', '2025-08-04T19:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3125, '2025-08-05 00:00:00', '2025-08-04T19:00:00.0', '2025-08-04T19:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3126, '2025-08-05 00:00:00', '2025-08-04T19:15:00.0', '2025-08-04T19:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3127, '2025-08-05 00:00:00', '2025-08-04T19:30:00.0', '2025-08-04T19:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3128, '2025-08-05 00:00:00', '2025-08-04T19:45:00.0', '2025-08-04T20:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3129, '2025-08-05 00:00:00', '2025-08-04T20:00:00.0', '2025-08-04T20:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3130, '2025-08-05 00:00:00', '2025-08-04T20:15:00.0', '2025-08-04T20:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3131, '2025-08-05 00:00:00', '2025-08-04T20:30:00.0', '2025-08-04T20:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3132, '2025-08-05 00:00:00', '2025-08-04T20:45:00.0', '2025-08-04T21:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3133, '2025-08-05 00:00:00', '2025-08-04T21:00:00.0', '2025-08-04T21:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3134, '2025-08-05 00:00:00', '2025-08-04T21:15:00.0', '2025-08-04T21:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3135, '2025-08-05 00:00:00', '2025-08-04T21:30:00.0', '2025-08-04T21:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3136, '2025-08-05 00:00:00', '2025-08-04T21:45:00.0', '2025-08-04T22:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3137, '2025-08-05 00:00:00', '2025-08-04T22:00:00.0', '2025-08-04T22:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3138, '2025-08-05 00:00:00', '2025-08-04T22:15:00.0', '2025-08-04T22:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3139, '2025-08-05 00:00:00', '2025-08-04T22:30:00.0', '2025-08-04T22:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3140, '2025-08-05 00:00:00', '2025-08-04T22:45:00.0', '2025-08-04T23:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3141, '2025-08-05 00:00:00', '2025-08-04T23:00:00.0', '2025-08-04T23:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3142, '2025-08-05 00:00:00', '2025-08-04T23:15:00.0', '2025-08-04T23:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3143, '2025-08-05 00:00:00', '2025-08-04T23:30:00.0', '2025-08-04T23:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3144, '2025-08-05 00:00:00', '2025-08-04T23:45:00.0', '2025-08-05T00:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3145, '2025-08-05 00:00:00', '2025-08-05T00:00:00.0', '2025-08-05T00:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3146, '2025-08-05 00:00:00', '2025-08-05T00:15:00.0', '2025-08-05T00:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3147, '2025-08-05 00:00:00', '2025-08-05T00:30:00.0', '2025-08-05T00:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3148, '2025-08-05 00:00:00', '2025-08-05T00:45:00.0', '2025-08-05T01:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3149, '2025-08-05 00:00:00', '2025-08-05T01:00:00.0', '2025-08-05T01:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3150, '2025-08-05 00:00:00', '2025-08-05T01:15:00.0', '2025-08-05T01:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3151, '2025-08-05 00:00:00', '2025-08-05T01:30:00.0', '2025-08-05T01:45:00.0', 21, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3152, '2025-08-05 00:00:00', '2025-08-05T01:45:00.0', '2025-08-05T02:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3153, '2025-08-05 00:00:00', '2025-08-05T02:00:00.0', '2025-08-05T02:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3154, '2025-08-05 00:00:00', '2025-08-05T02:15:00.0', '2025-08-05T02:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3155, '2025-08-05 00:00:00', '2025-08-05T02:30:00.0', '2025-08-05T02:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3156, '2025-08-05 00:00:00', '2025-08-05T02:45:00.0', '2025-08-05T03:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3157, '2025-08-05 00:00:00', '2025-08-05T03:00:00.0', '2025-08-05T03:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3158, '2025-08-05 00:00:00', '2025-08-05T03:15:00.0', '2025-08-05T03:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3159, '2025-08-05 00:00:00', '2025-08-05T03:30:00.0', '2025-08-05T03:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3160, '2025-08-05 00:00:00', '2025-08-05T03:45:00.0', '2025-08-05T04:00:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3161, '2025-08-05 00:00:00', '2025-08-05T04:00:00.0', '2025-08-05T04:15:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3162, '2025-08-05 00:00:00', '2025-08-05T04:15:00.0', '2025-08-05T04:30:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3163, '2025-08-05 00:00:00', '2025-08-05T04:30:00.0', '2025-08-05T04:45:00.0', 0, '0', 'sleeping', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3164, '2025-08-05 00:00:00', '2025-08-05T04:45:00.0', '2025-08-05T05:00:00.0', 0, '0', 'sleeping', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3165, '2025-08-05 00:00:00', '2025-08-05T05:00:00.0', '2025-08-05T05:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3166, '2025-08-05 00:00:00', '2025-08-05T05:15:00.0', '2025-08-05T05:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3167, '2025-08-05 00:00:00', '2025-08-05T05:30:00.0', '2025-08-05T05:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3168, '2025-08-05 00:00:00', '2025-08-05T05:45:00.0', '2025-08-05T06:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3169, '2025-08-05 00:00:00', '2025-08-05T06:00:00.0', '2025-08-05T06:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3170, '2025-08-05 00:00:00', '2025-08-05T06:15:00.0', '2025-08-05T06:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3171, '2025-08-05 00:00:00', '2025-08-05T06:30:00.0', '2025-08-05T06:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3172, '2025-08-05 00:00:00', '2025-08-05T06:45:00.0', '2025-08-05T07:00:00.0', 212, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3173, '2025-08-05 00:00:00', '2025-08-05T07:00:00.0', '2025-08-05T07:15:00.0', 22, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3174, '2025-08-05 00:00:00', '2025-08-05T07:15:00.0', '2025-08-05T07:30:00.0', 745, '0', 'active', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3175, '2025-08-05 00:00:00', '2025-08-05T07:30:00.0', '2025-08-05T07:45:00.0', 62, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3176, '2025-08-05 00:00:00', '2025-08-05T07:45:00.0', '2025-08-05T08:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3177, '2025-08-05 00:00:00', '2025-08-05T08:00:00.0', '2025-08-05T08:15:00.0', 31, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3178, '2025-08-05 00:00:00', '2025-08-05T08:15:00.0', '2025-08-05T08:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3179, '2025-08-05 00:00:00', '2025-08-05T08:30:00.0', '2025-08-05T08:45:00.0', 27, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3180, '2025-08-05 00:00:00', '2025-08-05T08:45:00.0', '2025-08-05T09:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3181, '2025-08-05 00:00:00', '2025-08-05T09:00:00.0', '2025-08-05T09:15:00.0', 10, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3182, '2025-08-05 00:00:00', '2025-08-05T09:15:00.0', '2025-08-05T09:30:00.0', 144, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3183, '2025-08-05 00:00:00', '2025-08-05T09:30:00.0', '2025-08-05T09:45:00.0', 66, '0', 'sedentary', 'False', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3184, '2025-08-05 00:00:00', '2025-08-05T09:45:00.0', '2025-08-05T10:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3185, '2025-08-05 00:00:00', '2025-08-05T10:00:00.0', '2025-08-05T10:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3186, '2025-08-05 00:00:00', '2025-08-05T10:15:00.0', '2025-08-05T10:30:00.0', 15, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3187, '2025-08-05 00:00:00', '2025-08-05T10:30:00.0', '2025-08-05T10:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3188, '2025-08-05 00:00:00', '2025-08-05T10:45:00.0', '2025-08-05T11:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3189, '2025-08-05 00:00:00', '2025-08-05T11:00:00.0', '2025-08-05T11:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3190, '2025-08-05 00:00:00', '2025-08-05T11:15:00.0', '2025-08-05T11:30:00.0', 25, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3191, '2025-08-05 00:00:00', '2025-08-05T11:30:00.0', '2025-08-05T11:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3192, '2025-08-05 00:00:00', '2025-08-05T11:45:00.0', '2025-08-05T12:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3193, '2025-08-05 00:00:00', '2025-08-05T12:00:00.0', '2025-08-05T12:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3194, '2025-08-05 00:00:00', '2025-08-05T12:15:00.0', '2025-08-05T12:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3195, '2025-08-05 00:00:00', '2025-08-05T12:30:00.0', '2025-08-05T12:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3196, '2025-08-05 00:00:00', '2025-08-05T12:45:00.0', '2025-08-05T13:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3197, '2025-08-05 00:00:00', '2025-08-05T13:00:00.0', '2025-08-05T13:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3198, '2025-08-05 00:00:00', '2025-08-05T13:15:00.0', '2025-08-05T13:30:00.0', 34, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3199, '2025-08-05 00:00:00', '2025-08-05T13:30:00.0', '2025-08-05T13:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3200, '2025-08-05 00:00:00', '2025-08-05T13:45:00.0', '2025-08-05T14:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3201, '2025-08-05 00:00:00', '2025-08-05T14:00:00.0', '2025-08-05T14:15:00.0', 49, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3202, '2025-08-05 00:00:00', '2025-08-05T14:15:00.0', '2025-08-05T14:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3203, '2025-08-05 00:00:00', '2025-08-05T14:30:00.0', '2025-08-05T14:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3204, '2025-08-05 00:00:00', '2025-08-05T14:45:00.0', '2025-08-05T15:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3205, '2025-08-05 00:00:00', '2025-08-05T15:00:00.0', '2025-08-05T15:15:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3206, '2025-08-05 00:00:00', '2025-08-05T15:15:00.0', '2025-08-05T15:30:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3207, '2025-08-05 00:00:00', '2025-08-05T15:30:00.0', '2025-08-05T15:45:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');
INSERT INTO `steps` VALUES (3208, '2025-08-05 00:00:00', '2025-08-05T15:45:00.0', '2025-08-05T16:00:00.0', 0, '0', 'sedentary', 'True', 'ccceee00004@163.com');

-- ----------------------------
-- Table structure for stress
-- ----------------------------
DROP TABLE IF EXISTS `stress`;
CREATE TABLE `stress`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userProfilePK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calendarDate` datetime NULL DEFAULT NULL,
  `startTimestampGMT` datetime NULL DEFAULT NULL,
  `endTimestampGMT` datetime NULL DEFAULT NULL,
  `maxStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avgStressLevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stressChartValueOffset` int NULL DEFAULT NULL,
  `stressChartYAxisOrigin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`calendarDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stress
-- ----------------------------
INSERT INTO `stress` VALUES (28, '12372158', '2025-07-30 00:00:00', '2025-07-29 16:00:00', '2025-07-30 16:00:00', '88', '26', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (29, '12372158', '2025-07-31 00:00:00', '2025-07-30 16:00:00', '2025-07-31 16:00:00', '95', '34', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (30, '12372158', '2025-08-01 00:00:00', '2025-07-31 16:00:00', '2025-08-01 16:00:00', '90', '31', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (31, '12372158', '2025-08-02 00:00:00', '2025-08-01 16:00:00', '2025-08-02 16:00:00', '92', '53', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (32, '12372158', '2025-08-03 00:00:00', '2025-08-02 16:00:00', '2025-08-03 16:00:00', '96', '36', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (33, '12372158', '2025-08-04 00:00:00', '2025-08-03 16:00:00', '2025-08-04 16:00:00', '92', '33', 1, '-1', 'ccceee00004@163.com');
INSERT INTO `stress` VALUES (34, '12372158', '2025-08-05 00:00:00', '2025-08-04 16:00:00', '2025-08-05 16:00:00', '93', '30', 1, '-1', 'ccceee00004@163.com');

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户健康信息' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `user_health_info` VALUES (20, 180, '女', NULL, 0, 0.0, 1, '', '', '2025-07-24 16:05:25', NULL);
INSERT INTO `user_health_info` VALUES (21, 181, '女', NULL, 0, 0.0, 1, '', '', '2025-07-24 16:05:45', NULL);
INSERT INTO `user_health_info` VALUES (22, 182, '男', NULL, 0, 0.0, 1, '', '', '2025-08-07 13:27:23', NULL);
INSERT INTO `user_health_info` VALUES (23, 183, '女', NULL, 0, 0.0, 1, '', '', '2025-08-07 13:27:55', NULL);

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
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户手环登录邮箱',
  `garminPassword` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户手环登录密码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `u_user_name`(`user_name` ASC) USING BTREE COMMENT '用户名唯一',
  UNIQUE INDEX `u_phone`(`phone` ASC) USING BTREE COMMENT '手机号码唯一',
  UNIQUE INDEX `u_identity_number`(`identity_number` ASC) USING BTREE COMMENT '身份证号唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (2, '18392183603', 'chf', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'chf', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2025-08-07 13:25:51', NULL, NULL, '2024-06-23 17:44:28', 'ccceee00002@163.com', '123456789qE');
INSERT INTO `user_info` VALUES (3, '12222222222', 'xm', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'xm', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2025-08-07 13:23:44', NULL, NULL, NULL, '', '');
INSERT INTO `user_info` VALUES (4, '14444444444', 'zyy', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'zyy', NULL, '北京市', '北京市', '12', '', 0, '2020-10-26 15:50:54', '2025-08-07 13:23:45', NULL, NULL, '2024-06-12 18:28:53', '', '');
INSERT INTO `user_info` VALUES (170, '13333333333', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', '测试', NULL, '深圳市', '广东省', '中国', '', 0, '2024-06-10 20:24:16', '2025-08-07 13:23:46', NULL, NULL, '2024-06-23 22:02:44', '', '');
INSERT INTO `user_info` VALUES (171, '13939948323', 'cyk', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'cyk', NULL, '西安市', '陕西省', '中国', '', 0, '2024-06-12 18:47:31', '2025-08-07 13:23:48', NULL, NULL, '2025-08-07 00:18:58', '', '');
INSERT INTO `user_info` VALUES (174, '15236254632', 'lx', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'lx', NULL, '西安市', '陕西省', '中国', '', 1, '2024-06-21 12:52:41', '2025-08-07 13:23:49', NULL, NULL, '2025-07-30 19:33:52', '', '');
INSERT INTO `user_info` VALUES (179, '18735482563', 'whm', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'whm', NULL, '西安市', '陕西省', '中国', '', 1, '2024-06-21 12:57:13', '2025-08-07 13:23:56', NULL, NULL, '2025-07-22 21:42:39', '', '');
INSERT INTO `user_info` VALUES (180, '15291816176', 'mln', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'mln', NULL, '西安市', '陕西省', '中国', '', 1, '2025-07-24 15:58:08', '2025-08-07 13:26:44', NULL, NULL, '2025-08-07 13:25:04', 'ccceee00001@163.com', '123456789qW');
INSERT INTO `user_info` VALUES (181, '11111111111', 'xtt', 'e10adc3949ba59abbe56e057f20f883e', 'doctor', 'vip', 'xtt', NULL, '西安市', '陕西省', '中国', '', 1, '2025-07-24 16:06:38', '2025-08-07 13:01:58', NULL, NULL, '2025-08-07 13:01:58', 'ccceee00004@163.com', 'Password0789.');
INSERT INTO `user_info` VALUES (182, '12345678901', 'hjc', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'hjc', NULL, '西安市', '陕西省', '中国', '', 1, '2025-08-07 13:18:05', '2025-08-07 13:26:08', NULL, NULL, '2025-09-07 13:18:23', 'ccceee00003@163.com', '123456789qR');
INSERT INTO `user_info` VALUES (183, '12233445566', 'wsy', 'e10adc3949ba59abbe56e057f20f883e', 'user', 'normal', 'wsy', NULL, '西安市', '陕西省', '中国', '', 1, '2025-08-07 13:19:48', '2025-08-07 13:26:12', NULL, NULL, '2025-09-07 13:20:01', 'ccceee00005@163.com', 'Sunflower257');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

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
