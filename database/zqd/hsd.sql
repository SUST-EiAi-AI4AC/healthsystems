/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : hsd

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 29/07/2025 15:03:39
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, '2025-03-07 00:00:00', '12115795', 2812, 847, 1965, 2812, NULL, NULL, NULL, 11016, NULL, 8048, 8048, 847, 847, '12115795', '2025-03-07 00:00:00', '2', 'private', '27bb803bc3fd42f99be947144f1b6f0b', '7740', '2025-03-06 16:00:00', '2025-03-07 00:00:00', '2025-03-07 16:00:00', '2025-03-08 00:00:00', '24h', NULL, '2h37min', '39min', '14h18min', '6h24min', 'True', 'False', 'False', 'False', '10', '5', NULL, NULL, NULL, NULL, '150', '10', '55', '134', '57', '60', 'GARMIN', '41', '99', '11h50min', '7h', '3h59min', '57min', '23h46min', '4h24min', '4h42min', '2h44min', '49.79', '29.45', '16.76', '4.0', '18.51', '19.78', '11.5', 'STRESSFUL', '16h27min', '6h22min', NULL, '55', '127', 74, 75, 80, 5, 5, '75', 80, '3.0', NULL, '95.0', '85', '90', '2025-03-07 15:59:00', '2025-03-07 23:59:00', NULL, NULL, 16, 25, 9, 15, '2025-03-07 15:59:00', '100');
INSERT INTO `activity` VALUES (2, '2025-03-08 00:00:00', '12115795', 2952, 987, 1965, 2952, NULL, NULL, NULL, 6124, NULL, 23300, 4549, 987, 987, '12115795', '2025-03-08 00:00:00', '2', 'private', '004b3cb7594a4b6e8b9425e7b66af2e3', '8400', '2025-03-07 16:00:00', '2025-03-08 00:00:00', '2025-03-08 16:00:00', '2025-03-09 00:00:00', '24h', NULL, '1h17min', '41min', '15h2min', '6h58min', 'True', 'True', 'False', 'False', '52', '23', NULL, NULL, NULL, NULL, '150', '10', '51', '147', '54', '59', 'GARMIN', '36', '99', '9h33min', '7h47min', '3h47min', '2h39min', '23h46min', '3h35min', '4h19min', '1h39min', '40.18', '32.75', '15.92', '11.15', '15.08', '18.16', '6.94', 'STRESSFUL', '14h21min', '6h46min', NULL, '51', '142', 76, 76, 81, 5, 5, '76', 81, '3.0', NULL, '96.0', '82', '99', '2025-03-08 16:00:00', '2025-03-09 00:00:00', NULL, 110, 17, 25, 9, 14, '2025-03-08 16:00:00', '100');
INSERT INTO `activity` VALUES (3, '2025-03-09 00:00:00', '12115795', 2723, 758, 1965, 2723, NULL, NULL, NULL, 15464, NULL, 10540, 10540, 758, 758, '12115795', '2025-03-09 00:00:00', '2', 'private', '3e052ac6222644b9b697e6fe96f4990c', '8180', '2025-03-08 16:00:00', '2025-03-09 00:00:00', '2025-03-09 16:00:00', '2025-03-10 00:00:00', '24h', NULL, '1h42min', '1h37min', '13h34min', '7h6min', 'True', 'True', 'False', 'False', '71', '8', NULL, NULL, NULL, NULL, '150', '10', '53', '165', '58', '59', 'GARMIN', '34', '99', '9h7min', '9h17min', '3h56min', '1h31min', '23h51min', '4h15min', '3h14min', '1h38min', '38.23', '38.92', '16.49', '6.36', '17.82', '13.56', '6.85', 'BALANCED', '15h54min', '6h26min', NULL, '54', '154', 78, 74, 83, 5, 9, '76', 81, '3.0', NULL, '95.0', '79', '94', '2025-03-09 16:00:00', '2025-03-10 00:00:00', NULL, 103, 17, 28, 8, 19, '2025-03-09 16:00:00', '100');
INSERT INTO `activity` VALUES (4, '2025-03-10 00:00:00', '12115795', 2694, 729, 1965, 2694, NULL, NULL, NULL, 9626, NULL, 7246, 7246, 729, 729, '12115795', '2025-03-10 00:00:00', '2', 'private', 'cf1cecbfd70441669347e0be1f1375d1', '8910', '2025-03-09 16:00:00', '2025-03-10 00:00:00', '2025-03-10 16:00:00', '2025-03-11 00:00:00', '24h', NULL, '2h50min', '1h7min', '12h48min', '7h13min', 'True', 'False', 'False', 'False', '6', '2', NULL, NULL, NULL, NULL, '150', '10', '52', '133', '54', '58', 'GARMIN', '39', '99', '11h11min', '8h23min', '3h58min', '28min', '24h', '3h38min', '4h1min', '3h32min', '46.6', '34.93', '16.53', '1.94', '15.14', '16.74', '14.72', 'STRESSFUL', '17h2min', '6h30min', NULL, '52', '129', 90, 94, 94, 5, 5, '84', 93, '3.0', NULL, '96.0', '76', '96', '2025-03-10 16:00:00', '2025-03-11 00:00:00', NULL, NULL, 16, 24, 8, 19, '2025-03-10 16:00:00', '100');
INSERT INTO `activity` VALUES (5, '2025-03-11 00:00:00', '12115795', 2168, 203, 1965, 2168, NULL, NULL, NULL, 2879, NULL, 2148, 2148, 203, 203, '12115795', '2025-03-11 00:00:00', '2', 'private', 'c4707cc17fb049caa5b532dd873e4cc6', '9060', '2025-03-10 16:00:00', '2025-03-11 00:00:00', '2025-03-11 16:00:00', '2025-03-12 00:00:00', '24h', NULL, '44min', '10min', '16h2min', '7h2min', 'True', 'False', 'False', 'False', '1', '0', NULL, NULL, NULL, NULL, '150', '10', '54', '127', '58', '58', 'GARMIN', '37', '99', '8h16min', '7h38min', '1h8min', '6h58min', '24h', '2h22min', '3h47min', '2h7min', '34.44', '31.81', '4.72', '29.03', '9.86', '15.76', '8.82', 'BALANCED', '9h59min', '7h3min', NULL, '55', '126', 72, 50, 72, 5, 11, '65', 70, '3.0', NULL, '96.0', '89', '94', '2025-03-11 16:00:00', '2025-03-12 00:00:00', NULL, NULL, 17, 24, 8, 19, '2025-03-11 16:00:00', '100');
INSERT INTO `activity` VALUES (6, '2025-03-12 00:00:00', '12115795', 2530, 565, 1965, 2530, NULL, NULL, NULL, 12195, NULL, 8572, 8572, 565, 565, '12115795', '2025-03-12 00:00:00', '2', 'private', '9db85a5923dc4ec993799759b8721875', '8450', '2025-03-11 16:00:00', '2025-03-12 00:00:00', '2025-03-12 16:00:00', '2025-03-13 00:00:00', '24h', NULL, '2h45min', '40min', '13h48min', '6h45min', 'True', 'False', 'False', 'False', '21', '2', NULL, NULL, NULL, NULL, '150', '10', '53', '133', '56', '56', 'GARMIN', '36', '97', '10h50min', '9h22min', '3h33min', '15min', '24h', '4h19min', '4h6min', '2h25min', '45.14', '39.03', '14.79', '1.04', '17.99', '17.08', '10.07', 'BALANCED', '17h', '6h45min', NULL, '54', '132', 85, 89, 96, 7, 7, '90', 96, '3.0', NULL, '97.0', '86', '95', '2025-03-12 16:00:00', '2025-03-13 00:00:00', NULL, NULL, 16, 24, 8, 21, '2025-03-12 16:00:00', '100');
INSERT INTO `activity` VALUES (7, '2025-03-13 00:00:00', '12115795', 2448, 483, 1965, 2448, NULL, NULL, NULL, 9899, NULL, 7102, 7102, 483, 483, '12115795', '2025-03-13 00:00:00', '2', 'private', '72d0211536bd435fa94db7d04ba7e74f', '8830', '2025-03-12 16:00:00', '2025-03-13 00:00:00', '2025-03-13 16:00:00', '2025-03-14 00:00:00', '24h', NULL, '2h1min', '55min', '14h4min', '6h58min', 'True', 'False', 'False', 'False', '11', '0', NULL, NULL, NULL, NULL, '150', '10', '52', '138', '55', '56', 'GARMIN', '42', '99', '12h3min', '7h27min', '3h46min', '39min', '23h55min', '3h20min', '5h6min', '3h37min', '50.38', '31.15', '15.75', '2.72', '13.94', '21.32', '15.12', 'STRESSFUL', '16h39min', '6h37min', NULL, '53', '135', 80, 82, 87, 5, 5, '80', 87, '3.0', NULL, '96.0', '87', '97', '2025-03-13 16:00:00', '2025-03-14 00:00:00', NULL, NULL, 17, 24, 8, 17, '2025-03-13 16:00:00', '100');
INSERT INTO `activity` VALUES (8, '2025-03-14 00:00:00', '12115795', 2387, 422, 1965, 2387, NULL, NULL, NULL, 8829, NULL, 6371, 6371, 422, 422, '12115795', '2025-03-14 00:00:00', '2', 'private', '159763019cc54ff29bc2c0cf60662090', '9050', '2025-03-13 16:00:00', '2025-03-14 00:00:00', '2025-03-14 16:00:00', '2025-03-15 00:00:00', '24h', NULL, '1h38min', '19min', '15h6min', '6h56min', 'True', 'False', 'False', 'False', '27', '3', NULL, NULL, NULL, NULL, '150', '10', '51', '146', '54', '56', 'GARMIN', '37', '98', '12h4min', '9h5min', '2h20min', '27min', '23h56min', '4h33min', '5h28min', '2h3min', '50.42', '37.95', '9.75', '1.88', '19.01', '22.84', '8.57', 'STRESSFUL', '16h59min', '6h30min', NULL, '52', '134', 81, 76, 79, 5, 10, '73', 78, '3.0', NULL, '96.0', '87', '98', '2025-03-14 16:00:00', '2025-03-15 00:00:00', NULL, NULL, 17, 25, 8, 14, '2025-03-14 16:00:00', '200');
INSERT INTO `activity` VALUES (9, '2025-03-15 00:00:00', '12115795', 2320, 355, 1965, 2320, NULL, NULL, NULL, 5283, NULL, 4037, 4037, 355, 355, '12115795', '2025-03-15 00:00:00', '2', 'private', '3ec6935cd22f4f4d94d115057abc1b3a', '9030', '2025-03-14 16:00:00', '2025-03-15 00:00:00', '2025-03-15 16:00:00', '2025-03-16 00:00:00', '24h', NULL, '1h17min', '31min', '16h24min', '5h46min', 'True', 'False', 'False', 'False', '4', '1', NULL, NULL, NULL, NULL, '150', '10', '52', '158', '56', '56', 'GARMIN', '37', '96', '12h30min', '7h21min', '2h12min', '1h53min', '23h56min', '5h47min', '5h13min', '1h30min', '52.23', '30.71', '9.19', '7.87', '24.16', '21.8', '6.27', 'STRESSFUL', '16h17min', '5h46min', NULL, '54', '135', 74, 79, 84, 5, 5, '72', 83, '3.0', NULL, '96.0', '92', '95', '2025-03-15 16:00:00', '2025-03-16 00:00:00', NULL, NULL, 17, 25, 9, 16, '2025-03-15 16:00:00', '200');
INSERT INTO `activity` VALUES (10, '2025-03-16 00:00:00', '12115795', 2669, 704, 1965, 2669, NULL, NULL, NULL, 11425, NULL, 8123, 8123, 704, 704, '12115795', '2025-03-16 00:00:00', '2', 'private', 'b314b091abbc4180a325bcf08458b728', '8280', '2025-03-15 16:00:00', '2025-03-16 00:00:00', '2025-03-16 16:00:00', '2025-03-17 00:00:00', '24h', NULL, '1h50min', '2h13min', '14h48min', '5h6min', 'True', 'True', 'False', 'False', '19', '1', NULL, NULL, NULL, NULL, '150', '10', '56', '140', '60', '56', 'GARMIN', '42', '99', '9h10min', '8h2min', '6h10min', '30min', '23h52min', '2h40min', '3h7min', '3h23min', '38.41', '33.66', '25.84', '2.09', '11.17', '13.06', '14.18', 'BALANCED', '18h15min', '5h7min', NULL, '57', '126', 52, 52, 56, 5, 5, '48', 53, '3.0', NULL, '95.0', '88', '96', '2025-03-16 16:00:00', '2025-03-17 00:00:00', NULL, 17, 16, 24, 9, 19, '2025-03-16 16:00:00', '200');
INSERT INTO `activity` VALUES (11, '2025-03-17 00:00:00', '12115795', 2418, 453, 1965, 2418, NULL, NULL, NULL, 10458, NULL, 6817, 6817, 453, 453, '12115795', '2025-03-17 00:00:00', '2', 'private', 'ee4af13d59484e699f181472c604ac09', '8600', '2025-03-16 16:00:00', '2025-03-17 00:00:00', '2025-03-17 16:00:00', '2025-03-18 00:00:00', '24h', NULL, '1h31min', '46min', '14h47min', '6h53min', 'True', 'True', 'False', 'False', '35', '3', NULL, NULL, NULL, NULL, '150', '10', '52', '129', '55', '56', 'GARMIN', '32', '97', '9h38min', '10h32min', '3h14min', '21min', '23h45min', '5h', '3h14min', '1h24min', '40.56', '44.35', '13.61', '1.47', '21.05', '13.61', '5.89', 'BALANCED', '16h40min', '6h44min', NULL, '53', '128', 76, 69, 77, 5, 12, '72', 77, '3.0', NULL, '97.0', '91', '97', '2025-03-17 16:00:00', '2025-03-18 00:00:00', NULL, 21, 16, 24, 8, 19, '2025-03-17 16:00:00', '200');
INSERT INTO `activity` VALUES (12, '2025-03-18 00:00:00', '12115795', 2686, 721, 1965, 2686, NULL, NULL, NULL, 9860, NULL, 7469, 7469, 721, 721, '12115795', '2025-03-18 00:00:00', '2', 'private', '64559a881a93493ea250f46f6ef77a01', '8980', '2025-03-17 16:00:00', '2025-03-18 00:00:00', '2025-03-18 16:00:00', '2025-03-19 00:00:00', '24h', NULL, '2h23min', '1h31min', '13h21min', '6h43min', 'True', 'False', 'False', 'False', '10', '7', NULL, NULL, NULL, NULL, '150', '10', '54', '152', '57', '56', 'GARMIN', '47', '100', '11h34min', '6h55min', '4h10min', '1h7min', '23h46min', '2h44min', '4h11min', '4h39min', '48.67', '29.1', '17.53', '4.7', '11.5', '17.6', '19.57', 'STRESSFUL', '15h56min', '6h43min', NULL, '54', '148', 61, 68, 73, 5, 5, '63', 73, '3.0', NULL, '96.0', '88', '96', '2025-03-18 16:00:00', '2025-03-19 00:00:00', NULL, NULL, 16, 24, 7, 19, '2025-03-18 16:00:00', '200');
INSERT INTO `activity` VALUES (13, '2025-03-19 00:00:00', '12115795', 2475, 510, 1965, 2475, NULL, NULL, NULL, 8107, NULL, 5903, 5903, 510, 510, '12115795', '2025-03-19 00:00:00', '2', 'private', '373485fcffc7495abbe239f575aebe1a', '9160', '2025-03-18 16:00:00', '2025-03-19 00:00:00', '2025-03-19 16:00:00', '2025-03-20 00:00:00', '24h', NULL, '1h41min', '45min', '15h21min', '6h11min', 'True', 'False', 'False', 'False', '9', '4', NULL, NULL, NULL, NULL, '150', '10', '55', '145', '59', '57', 'GARMIN', '38', '97', '12h21min', '7h13min', '3h1min', '1h9min', '23h44min', '6h23min', '4h10min', '1h48min', '52.04', '30.41', '12.71', '4.85', '26.9', '17.56', '7.58', 'STRESSFUL', '16h34min', '6h1min', NULL, '56', '141', 51, 51, 56, 5, 5, '50', 55, '3.0', NULL, '97.0', '86', '97', '2025-03-19 16:00:00', '2025-03-20 00:00:00', NULL, NULL, 16, 24, 8, 20, '2025-03-19 16:00:00', '200');
INSERT INTO `activity` VALUES (14, '2025-03-20 00:00:00', '12115795', 2553, 588, 1965, 2553, NULL, NULL, NULL, 8192, NULL, 6054, 6054, 588, 588, '12115795', '2025-03-20 00:00:00', '2', 'private', 'e8800da8e80b4a8d8d5b606fc3817a15', '9060', '2025-03-19 16:00:00', '2025-03-20 00:00:00', '2025-03-20 16:00:00', '2025-03-21 00:00:00', '24h', NULL, '1h51min', '34min', '14h57min', '6h36min', 'True', 'False', 'False', 'False', '9', '8', NULL, NULL, NULL, NULL, '150', '10', '54', '153', '57', '57', 'GARMIN', '42', '99', '11h17min', '7h2min', '2h56min', '2h29min', '23h44min', '4h12min', '4h6min', '2h59min', '47.54', '29.63', '12.36', '10.46', '17.7', '17.28', '12.57', 'STRESSFUL', '14h56min', '6h19min', NULL, '56', '145', 71, 71, 76, 5, 5, '71', 76, '3.0', NULL, '97.0', '85', '96', '2025-03-20 15:58:00', '2025-03-20 23:58:00', NULL, NULL, 17, 26, 6, 18, '2025-03-20 15:58:00', '200');
INSERT INTO `activity` VALUES (15, '2025-03-21 00:00:00', '12115795', 2377, 412, 1965, 2377, NULL, NULL, NULL, 7651, NULL, 5544, 5544, 412, 412, '12115795', '2025-03-21 00:00:00', '2', 'private', '01a0609050014e11874368bc8482892c', '8890', '2025-03-20 16:00:00', '2025-03-21 00:00:00', '2025-03-21 16:00:00', '2025-03-22 00:00:00', '24h', NULL, '1h40min', '48min', '16h15min', '5h16min', 'True', 'False', 'False', 'False', '7', '2', NULL, NULL, NULL, NULL, '150', '10', '56', '132', '62', '58', 'GARMIN', '39', '98', '12h52min', '7h37min', '2h42min', '27min', '23h38min', '6h37min', '4h42min', '1h33min', '54.44', '32.23', '11.42', '1.9', '28.0', '19.89', '6.56', 'STRESSFUL', '18h6min', '5h5min', NULL, '58', '131', 39, 39, 44, 5, 5, '39', 44, '3.0', NULL, '97.0', '87', '96', '2025-03-21 16:00:00', '2025-03-22 00:00:00', NULL, NULL, 16, 25, 8, 20, '2025-03-21 16:00:00', '200');
INSERT INTO `activity` VALUES (16, '2025-03-22 00:00:00', '12115795', 2234, 269, 1965, 2234, NULL, NULL, NULL, 5581, NULL, 4077, 4077, 269, 269, '12115795', '2025-03-22 00:00:00', '2', 'private', '7add4ce16b00491899633143f131a629', '8650', '2025-03-21 16:00:00', '2025-03-22 00:00:00', '2025-03-22 16:00:00', '2025-03-23 00:00:00', '24h', NULL, '1h1min', '18min', '15h58min', '6h41min', 'True', 'False', 'False', 'False', '10', '0', NULL, NULL, NULL, NULL, '150', '10', '53', '133', '57', '58', 'GARMIN', '38', '98', '12h54min', '8h20min', '1h38min', '44min', '23h36min', '5h24min', '5h22min', '2h8min', '54.66', '35.31', '6.92', '3.11', '22.88', '22.74', '9.04', 'STRESSFUL', '16h12min', '6h40min', NULL, '54', '131', 72, 72, 77, 5, 5, '72', 77, '3.0', NULL, '97.0', '89', '92', '2025-03-22 15:59:00', '2025-03-22 23:59:00', NULL, NULL, 16, 23, 9, 20, '2025-03-22 16:00:00', '200');
INSERT INTO `activity` VALUES (17, '2025-03-23 00:00:00', '12115795', 2293, 328, 1965, 2293, NULL, NULL, NULL, 5157, NULL, 3822, 3822, 328, 328, '12115795', '2025-03-23 00:00:00', '2', 'private', '9b0c5ecb42114383b0aaa9b3b1016df9', '8040', '2025-03-22 16:00:00', '2025-03-23 00:00:00', '2025-03-23 16:00:00', '2025-03-24 00:00:00', '24h', NULL, '1h6min', '29min', '16h13min', '6h11min', 'True', 'False', 'False', 'False', '3', '1', NULL, NULL, NULL, NULL, '150', '10', '57', '138', '62', '58', 'GARMIN', '35', '97', '12h41min', '8h16min', '2h24min', '33min', '23h54min', '8h14min', '3h28min', '59min', '53.07', '34.59', '10.04', '2.3', '34.45', '14.5', '4.11', 'STRESSFUL', '17h14min', '6h7min', NULL, '58', '130', 54, 51, 57, 5, 8, '49', 54, '3.0', NULL, '97.0', '90', '96', '2025-03-23 16:00:00', '2025-03-24 00:00:00', NULL, NULL, 16, 23, 8, 20, '2025-03-23 16:00:00', '200');
INSERT INTO `activity` VALUES (18, '2025-03-24 00:00:00', '12115795', 2287, 322, 1965, 2287, NULL, NULL, NULL, 4697, NULL, 3493, 3493, 322, 322, '12115795', '2025-03-24 00:00:00', '2', 'private', 'a186f8a15a19412b88a770251f3370c1', '7470', '2025-03-23 16:00:00', '2025-03-24 00:00:00', '2025-03-24 16:00:00', '2025-03-25 00:00:00', '24h', NULL, '1h', '38min', '15h51min', '6h29min', 'True', 'False', 'False', 'False', '1', '2', NULL, NULL, NULL, NULL, '150', '10', '55', '127', '59', '59', 'GARMIN', '40', '99', '13h15min', '6h51min', '2h15min', '1h27min', '23h48min', '7h5min', '3h26min', '2h44min', '55.67', '28.78', '9.45', '6.09', '29.76', '14.43', '11.48', 'STRESSFUL', '15h21min', '7h', NULL, '56', '121', 57, 60, 64, 5, 5, '57', 64, '3.0', NULL, '97.0', '90', '93', '2025-03-24 16:00:00', '2025-03-25 00:00:00', NULL, NULL, 16, 23, 8, 19, '2025-03-24 16:00:00', '200');
INSERT INTO `activity` VALUES (19, '2025-03-25 00:00:00', '12115795', 2315, 350, 1965, 2315, NULL, NULL, NULL, 4146, NULL, 3014, 3014, 350, 350, '12115795', '2025-03-25 00:00:00', '2', 'private', 'aa6d519f3aae47f1badd17a651c5308a', '6920', '2025-03-24 16:00:00', '2025-03-25 00:00:00', '2025-03-25 16:00:00', '2025-03-26 00:00:00', '24h', NULL, '1h', '24min', '22h25min', '10min', 'True', 'False', 'False', 'False', '6', '3', NULL, NULL, NULL, NULL, '150', '10', '53', '145', '59', '59', 'GARMIN', '43', '96', '15h4min', '6h18min', '1h41min', '51min', '23h54min', '6h33min', '6h18min', '2h13min', '63.04', '26.36', '7.04', '3.56', '27.41', '26.36', '9.27', 'BALANCED_AWAKE', '22h53min', '10min', NULL, '56', '133', 58, 58, 63, 5, 5, '0', 5, '3.0', NULL, '96.0', '88', '98', '2025-03-25 15:58:00', '2025-03-25 23:58:00', NULL, NULL, 17, 23, 11, 17, '2025-03-25 15:58:00', '200');
INSERT INTO `activity` VALUES (20, '2025-03-26 00:00:00', '12115795', 2411, 446, 1965, 2411, NULL, NULL, NULL, 5315, NULL, 3893, 3893, 446, 446, '12115795', '2025-03-26 00:00:00', '2', 'private', 'a5e849ca1fe9476ca35f0970df49ffc6', '6370', '2025-03-25 16:00:00', '2025-03-26 00:00:00', '2025-03-26 16:00:00', '2025-03-27 00:00:00', '24h', NULL, '1h4min', '42min', '16h33min', '5h40min', 'True', 'False', 'False', 'False', '6', '2', NULL, NULL, NULL, NULL, '150', '10', '58', '146', '61', '60', 'GARMIN', '39', '99', '11h57min', '6h57min', '2h31min', '2h27min', '23h52min', '6h41min', '3h19min', '1h57min', '50.07', '29.12', '10.54', '10.27', '28.0', '13.9', '8.17', 'STRESSFUL', '15h45min', '5h40min', NULL, '60', '135', 51, 51, 54, 5, 5, '49', 54, '3.0', NULL, '97.0', '91', '97', '2025-03-26 16:00:00', '2025-03-27 00:00:00', NULL, NULL, 16, 23, 9, 22, '2025-03-26 16:00:00', '200');
INSERT INTO `activity` VALUES (21, '2025-03-27 00:00:00', '12115795', 2302, 337, 1965, 2302, NULL, NULL, NULL, 4643, NULL, 3473, 3473, 337, 337, '12115795', '2025-03-27 00:00:00', '2', 'private', 'bad38eb45d22479c96a0f65ca66a13f4', '6160', '2025-03-26 16:00:00', '2025-03-27 00:00:00', '2025-03-27 16:00:00', '2025-03-28 00:00:00', '24h', NULL, '54min', '19min', '16h3min', '6h43min', 'True', 'False', 'False', 'False', '4', '1', NULL, NULL, NULL, NULL, '150', '10', '57', '143', '61', '60', 'GARMIN', '40', '98', '14h15min', '7h30min', '1h39min', '29min', '23h53min', '6h54min', '5h48min', '1h33min', '59.67', '31.4', '6.91', '2.02', '28.89', '24.28', '6.49', 'STRESSFUL', '16h41min', '6h43min', NULL, '58', '132', 52, 52, 57, 5, 5, '52', 57, '3.0', NULL, '97.0', '92', '99', '2025-03-27 16:00:00', '2025-03-28 00:00:00', NULL, NULL, 17, 29, 7, 18, '2025-03-27 16:00:00', '200');
INSERT INTO `activity` VALUES (22, '2025-03-28 00:00:00', '12115795', 2371, 406, 1965, 2371, NULL, NULL, NULL, 7727, NULL, 5447, 5447, 406, 406, '12115795', '2025-03-28 00:00:00', '2', 'private', '1771663069b442c2943dffdddf7ebe0c', '5860', '2025-03-27 16:00:00', '2025-03-28 00:00:00', '2025-03-28 16:00:00', '2025-03-29 00:00:00', '24h', NULL, '1h16min', '26min', '15h3min', '7h13min', 'True', 'True', 'False', 'False', '21', '2', NULL, NULL, NULL, NULL, '150', '10', '53', '142', '57', '59', 'GARMIN', '38', '98', '12h43min', '8h29min', '2h18min', '12min', '23h42min', '5h27min', '5h33min', '1h43min', '53.66', '35.79', '9.7', '0.84', '23.0', '23.42', '7.24', 'STRESSFUL', '16h17min', '7h13min', NULL, '54', '129', 77, 75, 81, 5, 7, '76', 81, '3.0', NULL, '98.0', '93', '97', '2025-03-28 16:00:00', '2025-03-29 00:00:00', NULL, 17, 16, 28, 8, 15, '2025-03-28 16:00:00', '200');
INSERT INTO `activity` VALUES (23, '2025-03-29 00:00:00', '12115795', 2202, 237, 1965, 2202, NULL, NULL, NULL, 4209, NULL, 3128, 3128, 237, 237, '12115795', '2025-03-29 00:00:00', '2', 'private', 'ec93a2599f2b444a8479936307f90197', '6050', '2025-03-28 16:00:00', '2025-03-29 00:00:00', '2025-03-29 16:00:00', '2025-03-30 00:00:00', '24h', NULL, '40min', '24min', '15h46min', '7h8min', 'True', 'False', 'False', 'False', '2', '1', NULL, NULL, NULL, NULL, '150', '10', '54', '127', '56', '59', 'GARMIN', '38', '96', '11h37min', '7h38min', '1h18min', '2h59min', '23h32min', '4h11min', '6h16min', '1h10min', '49.36', '32.44', '5.52', '12.68', '17.78', '26.63', '4.96', 'STRESSFUL', '13h25min', '7h8min', NULL, '55', '125', 74, 73, 81, 7, 8, '74', 81, '3.0', NULL, '96.0', '91', '95', '2025-03-29 16:00:00', '2025-03-30 00:00:00', NULL, NULL, 17, 24, 9, 15, '2025-03-29 16:00:00', '200');
INSERT INTO `activity` VALUES (24, '2025-03-30 00:00:00', '12115795', 2066, 101, 1965, 2066, NULL, NULL, NULL, 2436, NULL, 1838, 1838, 101, 101, '12115795', '2025-03-30 00:00:00', '2', 'private', '659eaac413bc4042abe106dfe423824b', '5870', '2025-03-29 16:00:00', '2025-03-30 00:00:00', '2025-03-30 16:00:00', '2025-03-31 00:00:00', '24h', NULL, '25min', '13min', '16h45min', '6h36min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '115', '59', '59', 'GARMIN', '32', '96', '12h7min', '9h52min', '1h10min', '45min', '23h54min', '7h58min', '3h32min', '37min', '50.7', '41.28', '4.88', '3.14', '33.33', '14.78', '2.58', 'STRESSFUL', '16h48min', '6h21min', NULL, '57', '114', 66, 56, 73, 7, 18, '64', 72, '3.0', NULL, '97.0', '91', '99', '2025-03-30 16:00:00', '2025-03-31 00:00:00', NULL, NULL, 16, 25, 9, 23, '2025-03-30 16:00:00', '200');
INSERT INTO `activity` VALUES (25, '2025-03-31 00:00:00', '12115795', 2290, 325, 1965, 2290, NULL, NULL, NULL, 4909, NULL, 3577, 3577, 325, 325, '12115795', '2025-03-31 00:00:00', '2', 'private', '289a7315d356438ca6c74d62bc000cc0', '5190', '2025-03-30 16:00:00', '2025-03-31 00:00:00', '2025-03-31 16:00:00', '2025-04-01 00:00:00', '24h', NULL, '50min', '35min', '15h55min', '6h37min', 'True', 'False', 'False', 'False', '10', '1', NULL, NULL, NULL, NULL, '150', '10', '55', '138', '58', '59', 'GARMIN', '44', '97', '13h15min', '6h', '2h20min', '2h17min', '23h52min', '4h58min', '6h7min', '2h10min', '55.52', '25.14', '9.78', '9.57', '20.81', '25.63', '9.08', 'STRESSFUL', '16h25min', '5h10min', NULL, '55', '132', 63, 76, 77, 5, 5, '58', 77, '3.0', NULL, '97.0', '94', '96', '2025-03-31 16:00:00', '2025-04-01 00:00:00', NULL, NULL, 16, 24, 8, 18, '2025-03-31 16:00:00', '200');
INSERT INTO `activity` VALUES (26, '2025-04-01 00:00:00', '12115795', 2509, 544, 1965, 2509, NULL, NULL, NULL, 6425, NULL, 4527, 4527, 544, 544, '12115795', '2025-04-01 00:00:00', '2', 'private', 'ce6553a75a4a412cbb9d8571f448bbf0', '5140', '2025-03-31 16:00:00', '2025-04-01 00:00:00', '2025-04-01 16:00:00', '2025-04-02 00:00:00', '24h', NULL, '1h17min', '59min', '14h35min', '7h7min', 'True', 'False', 'False', 'False', '14', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '131', '59', '59', 'GARMIN', '42', '98', '13h28min', '6h44min', '3h4min', '31min', '23h47min', '5h45min', '5h24min', '2h19min', '56.62', '28.31', '12.89', '2.17', '24.18', '22.7', '9.74', 'STRESSFUL', '16h20min', '6h56min', NULL, '56', '129', 57, 57, 62, 5, 5, '57', 62, '3.0', NULL, '97.0', '94', '97', '2025-04-01 16:00:00', '2025-04-02 00:00:00', NULL, NULL, 15, 24, 7, 14, '2025-04-01 16:00:00', '200');
INSERT INTO `activity` VALUES (27, '2025-04-02 00:00:00', '12115795', 908, 109, 799, 908, NULL, NULL, NULL, 1851, NULL, 1386, 1386, 109, 109, '12115795', '2025-04-02 00:00:00', '2', 'private', '6e83fadee1e54067b54ee1fa27a0becc', '5270', '2025-04-01 16:00:00', '2025-04-02 00:00:00', '2025-04-02 01:46:00', '2025-04-02 09:46:00', '9h46min', NULL, '27min', '15min', '3h7min', '5h56min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '118', '57', '58', 'GARMIN', '18', '88', '1h30min', '6h33min', '42min', '40min', '9h25min', '1h11min', '15min', '4min', '15.93', '69.56', '7.43', '7.08', '12.57', '2.65', '0.71', 'UNKNOWN', '2h58min', '5h47min', NULL, '56', '117', 64, 11, 69, 5, 58, '61', 66, '3.0', NULL, '98.0', '93', '96', '2025-04-02 01:46:00', '2025-04-02 09:46:00', NULL, NULL, 16, 24, 10, 22, '2025-04-02 01:46:00', '200');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of body_battery
-- ----------------------------
INSERT INTO `body_battery` VALUES (1, '2025-03-07 00:00:00', '74', '75', '2025-03-06 16:00:00', '2025-03-07 16:00:00', '2025-03-07 00:00:00', '2025-03-08 00:00:00');
INSERT INTO `body_battery` VALUES (2, '2025-03-08 00:00:00', '76', '76', '2025-03-07 16:00:00', '2025-03-08 16:00:00', '2025-03-08 00:00:00', '2025-03-09 00:00:00');
INSERT INTO `body_battery` VALUES (3, '2025-03-09 00:00:00', '78', '74', '2025-03-08 16:00:00', '2025-03-09 16:00:00', '2025-03-09 00:00:00', '2025-03-10 00:00:00');
INSERT INTO `body_battery` VALUES (4, '2025-03-10 00:00:00', '90', '94', '2025-03-09 16:00:00', '2025-03-10 16:00:00', '2025-03-10 00:00:00', '2025-03-11 00:00:00');
INSERT INTO `body_battery` VALUES (5, '2025-03-11 00:00:00', '72', '50', '2025-03-10 16:00:00', '2025-03-11 16:00:00', '2025-03-11 00:00:00', '2025-03-12 00:00:00');
INSERT INTO `body_battery` VALUES (6, '2025-03-12 00:00:00', '85', '89', '2025-03-11 16:00:00', '2025-03-12 16:00:00', '2025-03-12 00:00:00', '2025-03-13 00:00:00');
INSERT INTO `body_battery` VALUES (7, '2025-03-13 00:00:00', '80', '82', '2025-03-12 16:00:00', '2025-03-13 16:00:00', '2025-03-13 00:00:00', '2025-03-14 00:00:00');
INSERT INTO `body_battery` VALUES (8, '2025-03-14 00:00:00', '81', '76', '2025-03-13 16:00:00', '2025-03-14 16:00:00', '2025-03-14 00:00:00', '2025-03-15 00:00:00');
INSERT INTO `body_battery` VALUES (9, '2025-03-15 00:00:00', '74', '79', '2025-03-14 16:00:00', '2025-03-15 16:00:00', '2025-03-15 00:00:00', '2025-03-16 00:00:00');
INSERT INTO `body_battery` VALUES (10, '2025-03-16 00:00:00', '52', '52', '2025-03-15 16:00:00', '2025-03-16 16:00:00', '2025-03-16 00:00:00', '2025-03-17 00:00:00');
INSERT INTO `body_battery` VALUES (11, '2025-03-17 00:00:00', '76', '69', '2025-03-16 16:00:00', '2025-03-17 16:00:00', '2025-03-17 00:00:00', '2025-03-18 00:00:00');
INSERT INTO `body_battery` VALUES (12, '2025-03-18 00:00:00', '61', '68', '2025-03-17 16:00:00', '2025-03-18 16:00:00', '2025-03-18 00:00:00', '2025-03-19 00:00:00');
INSERT INTO `body_battery` VALUES (13, '2025-03-19 00:00:00', '51', '51', '2025-03-18 16:00:00', '2025-03-19 16:00:00', '2025-03-19 00:00:00', '2025-03-20 00:00:00');
INSERT INTO `body_battery` VALUES (14, '2025-03-20 00:00:00', '71', '71', '2025-03-19 16:00:00', '2025-03-20 16:00:00', '2025-03-20 00:00:00', '2025-03-21 00:00:00');
INSERT INTO `body_battery` VALUES (15, '2025-03-21 00:00:00', '39', '39', '2025-03-20 16:00:00', '2025-03-21 16:00:00', '2025-03-21 00:00:00', '2025-03-22 00:00:00');
INSERT INTO `body_battery` VALUES (16, '2025-03-22 00:00:00', '72', '72', '2025-03-21 16:00:00', '2025-03-22 16:00:00', '2025-03-22 00:00:00', '2025-03-23 00:00:00');
INSERT INTO `body_battery` VALUES (17, '2025-03-23 00:00:00', '54', '51', '2025-03-22 16:00:00', '2025-03-23 16:00:00', '2025-03-23 00:00:00', '2025-03-24 00:00:00');
INSERT INTO `body_battery` VALUES (18, '2025-03-24 00:00:00', '57', '60', '2025-03-23 16:00:00', '2025-03-24 16:00:00', '2025-03-24 00:00:00', '2025-03-25 00:00:00');
INSERT INTO `body_battery` VALUES (19, '2025-03-25 00:00:00', '58', '58', '2025-03-24 16:00:00', '2025-03-25 16:00:00', '2025-03-25 00:00:00', '2025-03-26 00:00:00');
INSERT INTO `body_battery` VALUES (20, '2025-03-26 00:00:00', '51', '51', '2025-03-25 16:00:00', '2025-03-26 16:00:00', '2025-03-26 00:00:00', '2025-03-27 00:00:00');
INSERT INTO `body_battery` VALUES (21, '2025-03-27 00:00:00', '52', '52', '2025-03-26 16:00:00', '2025-03-27 16:00:00', '2025-03-27 00:00:00', '2025-03-28 00:00:00');
INSERT INTO `body_battery` VALUES (22, '2025-03-28 00:00:00', '77', '75', '2025-03-27 16:00:00', '2025-03-28 16:00:00', '2025-03-28 00:00:00', '2025-03-29 00:00:00');
INSERT INTO `body_battery` VALUES (23, '2025-03-29 00:00:00', '74', '73', '2025-03-28 16:00:00', '2025-03-29 16:00:00', '2025-03-29 00:00:00', '2025-03-30 00:00:00');
INSERT INTO `body_battery` VALUES (24, '2025-03-30 00:00:00', '66', '56', '2025-03-29 16:00:00', '2025-03-30 16:00:00', '2025-03-30 00:00:00', '2025-03-31 00:00:00');
INSERT INTO `body_battery` VALUES (25, '2025-03-31 00:00:00', '63', '76', '2025-03-30 16:00:00', '2025-03-31 16:00:00', '2025-03-31 00:00:00', '2025-04-01 00:00:00');
INSERT INTO `body_battery` VALUES (26, '2025-04-01 00:00:00', '57', '57', '2025-03-31 16:00:00', '2025-04-01 16:00:00', '2025-04-01 00:00:00', '2025-04-02 00:00:00');
INSERT INTO `body_battery` VALUES (27, '2025-04-02 00:00:00', '64', '11', '2025-04-01 16:00:00', '2025-04-02 01:46:00', '2025-04-02 00:00:00', '2025-04-02 09:46:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1088 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csv_file_paths
-- ----------------------------
INSERT INTO `csv_file_paths` VALUES (1, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-07\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (2, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-07\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (3, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-08\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (4, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-08\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (5, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-09\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (6, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-09\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (7, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-10\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (8, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-10\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (9, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-11\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (10, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-11\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (11, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-12\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (12, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-12\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (13, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-13\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (14, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-13\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (15, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-14\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (16, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-14\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (17, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-15\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (18, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-15\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (19, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-16\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (20, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-16\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (21, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-17\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (22, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-17\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (23, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-18\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (24, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-18\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (25, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-19\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (26, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-19\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (27, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-20\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (28, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-20\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (29, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-21\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (30, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-21\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (31, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-22\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (32, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-22\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (33, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-23\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (34, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-23\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (35, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-24\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (36, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-24\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (37, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-25\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (38, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-25\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (39, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-26\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (40, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-26\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (41, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-27\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (42, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-27\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (43, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-28\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (44, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-28\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (45, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-29\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (46, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-29\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (47, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-30\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (48, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-30\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (49, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-31\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (50, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-03-31\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (51, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-04-01\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (52, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-04-01\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (53, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-04-02\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (54, 'activity', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\activity\\2025-04-02\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (55, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\body_battery_activity_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (56, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\body_battery_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (57, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\body_battery_feedback_events.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (58, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\body_battery_values.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (59, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\body_battery_value_descriptors.csv', '2025-07-29 15:02:28');
INSERT INTO `csv_file_paths` VALUES (60, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (61, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (62, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (63, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-07\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (64, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (65, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (66, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (67, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (68, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (69, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (70, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (71, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (72, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-08\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (73, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (74, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (75, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (76, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (77, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (78, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (79, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (80, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (81, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-09\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (82, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (83, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (84, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (85, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (86, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (87, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (88, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (89, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (90, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-10\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (91, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (92, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (93, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (94, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (95, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (96, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (97, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (98, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (99, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-11\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (100, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (101, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (102, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (103, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (104, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (105, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (106, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (107, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (108, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-12\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (109, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (110, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (111, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (112, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (113, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (114, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (115, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (116, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (117, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-13\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (118, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (119, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (120, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (121, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (122, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (123, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (124, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (125, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (126, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-14\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (127, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (128, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (129, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (130, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (131, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (132, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (133, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (134, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (135, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-15\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (136, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (137, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (138, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (139, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (140, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (141, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (142, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (143, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (144, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-16\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (145, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (146, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (147, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (148, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (149, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (150, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (151, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (152, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (153, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-17\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (154, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (155, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (156, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (157, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (158, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (159, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (160, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (161, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (162, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-18\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (163, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (164, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (165, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (166, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (167, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (168, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (169, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (170, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (171, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-19\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (172, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (173, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (174, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (175, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (176, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (177, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (178, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (179, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (180, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-20\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (181, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (182, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (183, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (184, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (185, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (186, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (187, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (188, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (189, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-21\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (190, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (191, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (192, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (193, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (194, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (195, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (196, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (197, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (198, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-22\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (199, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (200, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (201, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (202, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (203, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (204, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (205, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (206, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (207, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-23\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (208, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (209, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (210, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (211, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (212, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (213, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (214, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (215, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (216, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-24\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (217, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (218, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (219, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (220, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (221, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (222, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (223, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (224, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (225, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-25\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (226, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (227, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (228, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (229, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (230, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (231, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (232, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (233, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (234, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-26\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (235, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (236, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (237, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (238, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (239, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (240, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (241, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (242, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (243, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-27\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (244, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (245, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (246, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (247, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (248, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (249, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (250, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (251, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (252, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-28\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (253, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (254, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (255, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (256, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (257, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (258, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (259, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (260, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (261, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-29\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (262, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (263, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (264, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (265, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (266, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (267, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (268, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (269, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (270, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-30\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (271, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (272, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (273, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (274, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (275, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (276, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (277, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (278, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (279, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-03-31\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (280, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (281, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (282, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (283, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (284, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (285, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (286, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (287, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (288, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-01\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (289, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\body_battery_activity_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (290, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\body_battery_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (291, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\body_battery_feedback_events.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (292, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (293, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\body_battery_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (294, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\event_body_battery_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (295, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\event_body_battery_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (296, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\event_stress_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (297, 'body_battery', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\body_battery\\2025-04-02\\stress_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (298, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-07\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (299, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-08\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (300, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-09\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (301, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-10\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (302, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-11\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (303, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-12\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (304, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-13\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (305, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-14\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (306, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-15\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (307, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-16\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (308, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-17\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (309, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-18\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (310, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-19\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (311, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-20\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (312, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-21\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (313, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-22\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (314, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-23\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (315, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-24\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (316, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-25\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (317, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-26\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (318, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-27\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (319, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-28\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (320, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-29\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (321, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-30\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (322, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-03-31\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (323, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-04-01\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (324, 'fitness_age', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\fitness_age\\2025-04-02\\fitness_age_components.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (325, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-07\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (326, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-07\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (327, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-08\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (328, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-08\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (329, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-09\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (330, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-09\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (331, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-10\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (332, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-10\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (333, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-11\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (334, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-11\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (335, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-12\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (336, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-12\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (337, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-13\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (338, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-13\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (339, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-14\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (340, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-14\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (341, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-15\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (342, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-15\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (343, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-16\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (344, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-16\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (345, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-17\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (346, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-17\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (347, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-18\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (348, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-18\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (349, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-19\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (350, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-19\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (351, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-20\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (352, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-20\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (353, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-21\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (354, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-21\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (355, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-22\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (356, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-22\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (357, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-23\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (358, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-23\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (359, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-24\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (360, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-24\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (361, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-25\\heart_rate_values.csv', '2025-07-29 15:02:29');
INSERT INTO `csv_file_paths` VALUES (362, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-25\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (363, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-26\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (364, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-26\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (365, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-27\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (366, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-27\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (367, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-28\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (368, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-28\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (369, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-29\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (370, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-29\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (371, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-30\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (372, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-30\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (373, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-31\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (374, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-03-31\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (375, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-04-01\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (376, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-04-01\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (377, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-04-02\\heart_rate_values.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (378, 'heart_rate', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\heart_rate\\2025-04-02\\heart_rate_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (379, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-07\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (380, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-07\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (381, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-08\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (382, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-08\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (383, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-09\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (384, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-09\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (385, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-10\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (386, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-10\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (387, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-11\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (388, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-11\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (389, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-12\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (390, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-12\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (391, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-13\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (392, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-13\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (393, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-14\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (394, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-14\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (395, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-25\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (396, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-25\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (397, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-26\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (398, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-26\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (399, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-27\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (400, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-27\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (401, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-28\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (402, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-28\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (403, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-29\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (404, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-29\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (405, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-30\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (406, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-30\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (407, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-31\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (408, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-03-31\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (409, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-04-01\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (410, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-04-01\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (411, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-04-02\\hrv_baseline.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (412, 'hrv', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\hrv\\2025-04-02\\hrv_readings.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (413, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-07\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (414, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-07\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (415, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-07\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (416, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-07\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (417, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-08\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (418, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-08\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (419, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-08\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (420, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-08\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (421, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-09\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (422, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-09\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (423, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-09\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (424, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-09\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (425, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-10\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (426, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-10\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (427, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-10\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (428, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-10\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (429, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-11\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (430, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-11\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (431, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-11\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (432, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-11\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (433, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-12\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (434, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-12\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (435, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-12\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (436, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-12\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (437, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-13\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (438, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-13\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (439, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-13\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (440, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-13\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (441, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-14\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (442, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-14\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (443, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-14\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (444, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-14\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (445, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-15\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (446, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-15\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (447, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-15\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (448, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-15\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (449, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-16\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (450, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-16\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (451, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-16\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (452, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-16\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (453, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-17\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (454, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-17\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (455, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-17\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (456, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-17\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (457, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-18\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (458, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-18\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (459, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-18\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (460, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-18\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (461, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-19\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (462, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-19\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (463, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-19\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (464, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-19\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (465, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-20\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (466, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-20\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (467, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-20\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (468, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-20\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (469, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-21\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (470, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-21\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (471, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-21\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (472, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-21\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (473, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-22\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (474, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-22\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (475, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-22\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (476, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-22\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (477, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-23\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (478, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-23\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (479, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-23\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (480, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-23\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (481, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-24\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (482, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-24\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (483, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-24\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (484, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-24\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (485, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-25\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (486, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-25\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (487, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-25\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (488, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-25\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (489, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-26\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (490, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-26\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (491, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-26\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (492, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-26\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (493, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-27\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (494, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-27\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (495, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-27\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (496, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-27\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (497, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-28\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (498, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-28\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (499, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-28\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (500, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-28\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (501, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-29\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (502, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-29\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (503, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-29\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (504, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-29\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (505, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-30\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (506, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-30\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (507, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-30\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (508, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-30\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (509, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-31\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (510, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-31\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (511, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-31\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (512, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-03-31\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (513, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-01\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (514, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-01\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (515, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-01\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (516, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-01\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (517, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-02\\respiration_averages_valuesarray.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (518, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-02\\respiration_averages_value_descriptor.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (519, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-02\\respiration_values_array.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (520, 'respiration', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\respiration\\2025-04-02\\respiration_value_descriptors.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (521, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (522, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (523, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (524, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (525, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (526, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (527, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (528, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (529, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (530, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (531, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (532, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (533, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (534, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (535, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (536, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-07\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (537, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (538, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (539, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (540, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (541, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (542, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (543, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (544, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (545, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (546, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (547, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (548, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (549, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (550, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (551, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (552, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-08\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (553, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (554, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (555, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (556, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (557, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (558, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (559, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (560, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (561, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (562, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (563, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (564, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (565, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (566, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (567, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (568, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-09\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (569, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (570, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (571, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (572, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (573, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (574, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (575, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (576, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (577, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (578, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (579, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (580, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (581, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (582, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (583, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (584, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-10\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (585, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (586, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (587, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (588, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (589, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (590, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (591, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (592, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (593, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (594, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (595, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (596, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (597, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (598, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (599, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (600, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-11\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (601, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (602, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (603, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (604, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (605, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (606, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (607, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (608, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (609, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (610, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (611, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (612, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (613, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (614, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (615, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (616, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-12\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (617, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (618, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (619, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (620, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (621, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (622, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (623, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (624, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (625, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (626, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (627, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (628, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (629, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (630, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (631, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (632, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-13\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (633, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (634, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (635, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (636, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (637, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (638, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (639, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (640, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (641, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (642, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (643, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (644, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (645, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (646, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (647, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (648, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-14\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (649, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (650, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (651, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (652, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (653, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (654, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (655, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (656, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (657, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (658, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (659, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_scores.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (660, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\sleep_stress.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (661, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\wellness_epoch_respiration.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (662, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (663, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\wellness_epoch_spo2.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (664, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-15\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (665, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\daily_nap_dtos.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (666, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\hrv_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (667, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\next_sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (668, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\rem_sleep_data.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (669, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_body_battery.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (670, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_heart_rate.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (671, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_levels.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (672, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_movement.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (673, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_need.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (674, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_restless_moments.csv', '2025-07-29 15:02:30');
INSERT INTO `csv_file_paths` VALUES (675, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (676, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (677, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (678, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (679, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (680, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-16\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (681, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (682, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (683, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (684, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (685, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (686, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (687, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (688, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (689, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (690, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (691, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (692, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (693, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (694, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (695, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (696, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-17\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (697, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (698, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (699, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (700, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (701, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (702, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (703, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (704, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (705, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (706, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (707, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (708, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (709, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (710, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (711, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (712, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-18\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (713, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (714, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (715, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (716, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (717, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (718, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (719, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (720, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (721, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (722, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (723, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (724, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (725, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (726, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (727, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (728, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-19\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (729, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (730, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (731, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (732, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (733, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (734, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (735, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (736, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (737, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (738, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (739, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (740, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (741, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (742, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (743, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (744, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-20\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (745, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (746, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (747, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (748, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (749, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (750, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (751, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (752, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (753, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (754, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (755, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (756, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (757, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (758, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (759, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (760, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-21\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (761, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (762, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (763, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (764, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (765, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (766, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (767, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (768, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (769, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (770, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (771, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (772, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (773, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (774, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (775, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (776, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-22\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (777, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (778, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (779, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (780, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (781, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (782, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (783, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (784, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (785, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (786, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (787, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (788, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (789, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (790, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (791, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (792, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-23\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (793, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (794, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (795, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (796, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (797, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (798, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (799, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (800, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (801, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (802, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (803, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (804, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (805, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (806, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (807, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (808, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-24\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (809, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (810, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (811, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (812, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (813, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (814, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (815, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (816, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (817, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (818, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (819, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (820, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (821, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (822, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (823, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (824, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-25\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (825, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (826, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (827, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (828, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (829, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (830, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (831, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (832, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (833, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (834, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (835, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (836, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (837, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (838, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (839, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (840, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-26\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (841, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (842, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (843, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (844, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (845, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (846, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (847, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (848, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (849, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (850, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (851, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (852, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (853, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (854, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (855, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (856, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-27\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (857, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (858, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (859, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (860, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (861, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (862, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (863, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (864, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (865, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (866, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (867, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (868, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (869, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (870, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (871, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (872, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-28\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (873, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (874, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (875, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (876, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (877, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (878, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (879, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (880, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (881, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (882, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (883, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (884, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (885, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (886, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (887, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (888, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-29\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (889, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (890, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (891, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (892, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (893, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (894, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (895, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (896, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (897, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (898, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (899, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (900, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (901, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (902, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (903, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (904, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-30\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (905, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (906, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (907, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (908, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (909, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (910, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (911, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (912, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (913, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (914, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (915, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (916, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (917, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (918, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (919, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (920, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-03-31\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (921, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (922, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (923, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (924, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (925, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (926, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (927, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (928, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (929, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (930, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (931, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (932, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (933, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (934, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (935, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (936, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-01\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (937, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\daily_nap_dtos.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (938, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\hrv_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (939, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\next_sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (940, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\rem_sleep_data.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (941, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_body_battery.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (942, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_heart_rate.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (943, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_levels.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (944, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_movement.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (945, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_need.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (946, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_restless_moments.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (947, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_scores.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (948, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\sleep_stress.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (949, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\wellness_epoch_respiration.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (950, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\wellness_epoch_respiration_averages.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (951, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\wellness_epoch_spo2.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (952, 'sleep', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\sleep\\2025-04-02\\wellness_spo2_sleep_detail.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (953, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-07\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (954, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-07\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (955, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-07\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (956, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-08\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (957, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-08\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (958, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-08\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (959, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-09\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (960, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-09\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (961, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-09\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (962, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-10\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (963, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-10\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (964, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-10\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (965, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-11\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (966, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-11\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (967, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-11\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (968, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-12\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (969, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-12\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (970, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-12\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (971, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-13\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (972, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-13\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (973, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-13\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (974, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-14\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (975, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-14\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (976, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-14\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (977, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-15\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (978, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-15\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (979, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-15\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (980, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-16\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (981, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-16\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (982, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-16\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (983, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-17\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (984, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-17\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (985, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-17\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (986, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-18\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (987, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-18\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (988, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-18\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (989, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-19\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (990, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-19\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (991, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-19\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (992, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-20\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (993, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-20\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (994, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-20\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (995, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-21\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (996, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-21\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (997, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-21\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (998, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-22\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (999, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-22\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1000, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-22\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1001, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-23\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1002, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-23\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1003, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-23\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1004, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-24\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1005, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-24\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1006, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-24\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1007, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-25\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1008, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-25\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1009, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-25\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1010, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-26\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1011, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-26\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1012, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-26\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1013, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-27\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1014, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-27\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1015, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-27\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1016, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-28\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1017, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-28\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1018, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-28\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1019, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-29\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1020, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-29\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1021, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-29\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1022, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-30\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1023, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-30\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1024, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-30\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1025, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-31\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1026, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-31\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1027, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-03-31\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1028, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-01\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1029, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-01\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1030, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-01\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1031, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-02\\spo2_continuous_readings.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1032, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-02\\spo2_descriptors.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1033, 'spo2', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\spo2\\2025-04-02\\spo2_hourly.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1034, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-07\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1035, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-08\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1036, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-09\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1037, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-10\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1038, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-11\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1039, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-12\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1040, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-13\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1041, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-14\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1042, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-15\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1043, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-16\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1044, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-17\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1045, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-18\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1046, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-19\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1047, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-20\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1048, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-21\\body_battery_events.csv', '2025-07-29 15:02:31');
INSERT INTO `csv_file_paths` VALUES (1049, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-22\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1050, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-23\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1051, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-24\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1052, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-25\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1053, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-26\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1054, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-27\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1055, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-28\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1056, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-29\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1057, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-30\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1058, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-03-31\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1059, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-04-01\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1060, 'stats_body_composition', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stats_body_composition\\2025-04-02\\body_battery_events.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1061, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-07\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1062, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-08\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1063, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-09\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1064, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-10\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1065, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-11\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1066, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-12\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1067, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-13\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1068, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-14\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1069, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-15\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1070, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-16\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1071, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-17\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1072, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-18\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1073, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-19\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1074, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-20\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1075, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-21\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1076, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-22\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1077, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-23\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1078, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-24\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1079, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-25\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1080, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-26\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1081, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-27\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1082, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-28\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1083, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-29\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1084, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-30\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1085, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-03-31\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1086, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-04-01\\stress_timeseries.csv', '2025-07-29 15:02:32');
INSERT INTO `csv_file_paths` VALUES (1087, 'stress', 'E:/learn/garmin/data/csv_data/2998681550_qq.com\\stress\\2025-04-02\\stress_timeseries.csv', '2025-07-29 15:02:32');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_steps
-- ----------------------------
INSERT INTO `daily_steps` VALUES (1, '2025-03-07 00:00:00', '2025-03-07 00:00:00', 11016, 8048, '7740');
INSERT INTO `daily_steps` VALUES (2, '2025-03-08 00:00:00', '2025-03-08 00:00:00', 6124, 4549, '8400');
INSERT INTO `daily_steps` VALUES (3, '2025-03-09 00:00:00', '2025-03-09 00:00:00', 15464, 10540, '8180');
INSERT INTO `daily_steps` VALUES (4, '2025-03-10 00:00:00', '2025-03-10 00:00:00', 9626, 7246, '8910');
INSERT INTO `daily_steps` VALUES (5, '2025-03-11 00:00:00', '2025-03-11 00:00:00', 2879, 2148, '9060');
INSERT INTO `daily_steps` VALUES (6, '2025-03-12 00:00:00', '2025-03-12 00:00:00', 12195, 8572, '8450');
INSERT INTO `daily_steps` VALUES (7, '2025-03-13 00:00:00', '2025-03-13 00:00:00', 9899, 7102, '8830');
INSERT INTO `daily_steps` VALUES (8, '2025-03-14 00:00:00', '2025-03-14 00:00:00', 8829, 6371, '9050');
INSERT INTO `daily_steps` VALUES (9, '2025-03-15 00:00:00', '2025-03-15 00:00:00', 5283, 4037, '9030');
INSERT INTO `daily_steps` VALUES (10, '2025-03-16 00:00:00', '2025-03-16 00:00:00', 11425, 8123, '8280');
INSERT INTO `daily_steps` VALUES (11, '2025-03-17 00:00:00', '2025-03-17 00:00:00', 10458, 6817, '8600');
INSERT INTO `daily_steps` VALUES (12, '2025-03-18 00:00:00', '2025-03-18 00:00:00', 9860, 7469, '8980');
INSERT INTO `daily_steps` VALUES (13, '2025-03-19 00:00:00', '2025-03-19 00:00:00', 8107, 5903, '9160');
INSERT INTO `daily_steps` VALUES (14, '2025-03-20 00:00:00', '2025-03-20 00:00:00', 8192, 6054, '9060');
INSERT INTO `daily_steps` VALUES (15, '2025-03-21 00:00:00', '2025-03-21 00:00:00', 7651, 5544, '8890');
INSERT INTO `daily_steps` VALUES (16, '2025-03-22 00:00:00', '2025-03-22 00:00:00', 5581, 4077, '8650');
INSERT INTO `daily_steps` VALUES (17, '2025-03-23 00:00:00', '2025-03-23 00:00:00', 5157, 3822, '8040');
INSERT INTO `daily_steps` VALUES (18, '2025-03-24 00:00:00', '2025-03-24 00:00:00', 4697, 3493, '7470');
INSERT INTO `daily_steps` VALUES (19, '2025-03-25 00:00:00', '2025-03-25 00:00:00', 4146, 3014, '6920');
INSERT INTO `daily_steps` VALUES (20, '2025-03-26 00:00:00', '2025-03-26 00:00:00', 5315, 3893, '6370');
INSERT INTO `daily_steps` VALUES (21, '2025-03-27 00:00:00', '2025-03-27 00:00:00', 4643, 3473, '6160');
INSERT INTO `daily_steps` VALUES (22, '2025-03-28 00:00:00', '2025-03-28 00:00:00', 7727, 5447, '5860');
INSERT INTO `daily_steps` VALUES (23, '2025-03-29 00:00:00', '2025-03-29 00:00:00', 4209, 3128, '6050');
INSERT INTO `daily_steps` VALUES (24, '2025-03-30 00:00:00', '2025-03-30 00:00:00', 2436, 1838, '5870');
INSERT INTO `daily_steps` VALUES (25, '2025-03-31 00:00:00', '2025-03-31 00:00:00', 4909, 3577, '5190');
INSERT INTO `daily_steps` VALUES (26, '2025-04-01 00:00:00', '2025-04-01 00:00:00', 6425, 4527, '5140');
INSERT INTO `daily_steps` VALUES (27, '2025-04-02 00:00:00', '2025-04-02 00:00:00', 1851, 1386, '5270');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fitness_age
-- ----------------------------
INSERT INTO `fitness_age` VALUES (1, '2025-03-07 00:00:00', '23', '21.466296010453053', '18.0', '21.594494211698247', '2025-03-07 00:00:00');
INSERT INTO `fitness_age` VALUES (2, '2025-03-08 00:00:00', '23', '21.338097809207863', '18.0', '21.466296010453053', '2025-03-08 00:00:00');
INSERT INTO `fitness_age` VALUES (3, '2025-03-09 00:00:00', '23', '21.209899607962665', '18.0', '21.338097809207863', '2025-03-09 00:00:00');
INSERT INTO `fitness_age` VALUES (4, '2025-03-10 00:00:00', '23', '21.081701406717478', '18.0', '21.209899607962665', '2025-03-10 00:00:00');
INSERT INTO `fitness_age` VALUES (5, '2025-03-11 00:00:00', '23', '21.081701406717478', '18.0', '21.081701406717478', '2025-03-11 00:00:00');
INSERT INTO `fitness_age` VALUES (6, '2025-03-12 00:00:00', '23', '20.950106684769533', '18.0', '21.081701406717478', '2025-03-12 00:00:00');
INSERT INTO `fitness_age` VALUES (7, '2025-03-13 00:00:00', '23', '20.950106684769533', '18.0', '20.950106684769533', '2025-03-13 00:00:00');
INSERT INTO `fitness_age` VALUES (8, '2025-03-14 00:00:00', '23', '20.950106684769533', '18.0', '20.950106684769533', '2025-03-14 00:00:00');
INSERT INTO `fitness_age` VALUES (9, '2025-03-15 00:00:00', '23', '20.812543798302322', '18.0', '20.950106684769533', '2025-03-15 00:00:00');
INSERT INTO `fitness_age` VALUES (10, '2025-03-16 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-16 00:00:00');
INSERT INTO `fitness_age` VALUES (11, '2025-03-17 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-17 00:00:00');
INSERT INTO `fitness_age` VALUES (12, '2025-03-18 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-18 00:00:00');
INSERT INTO `fitness_age` VALUES (13, '2025-03-19 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-19 00:00:00');
INSERT INTO `fitness_age` VALUES (14, '2025-03-20 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-20 00:00:00');
INSERT INTO `fitness_age` VALUES (15, '2025-03-21 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-21 00:00:00');
INSERT INTO `fitness_age` VALUES (16, '2025-03-22 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-22 00:00:00');
INSERT INTO `fitness_age` VALUES (17, '2025-03-23 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-23 00:00:00');
INSERT INTO `fitness_age` VALUES (18, '2025-03-24 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-24 00:00:00');
INSERT INTO `fitness_age` VALUES (19, '2025-03-25 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-25 00:00:00');
INSERT INTO `fitness_age` VALUES (20, '2025-03-26 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-26 00:00:00');
INSERT INTO `fitness_age` VALUES (21, '2025-03-27 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-27 00:00:00');
INSERT INTO `fitness_age` VALUES (22, '2025-03-28 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-28 00:00:00');
INSERT INTO `fitness_age` VALUES (23, '2025-03-29 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-29 00:00:00');
INSERT INTO `fitness_age` VALUES (24, '2025-03-30 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-30 00:00:00');
INSERT INTO `fitness_age` VALUES (25, '2025-03-31 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-03-31 00:00:00');
INSERT INTO `fitness_age` VALUES (26, '2025-04-01 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-04-01 00:00:00');
INSERT INTO `fitness_age` VALUES (27, '2025-04-02 00:00:00', '23', '20.812543798302322', '18.0', '20.812543798302322', '2025-04-02 00:00:00');

-- ----------------------------
-- Table structure for heart_rate
-- ----------------------------
DROP TABLE IF EXISTS `heart_rate`;
CREATE TABLE `heart_rate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heart_rate
-- ----------------------------
INSERT INTO `heart_rate` VALUES (1, '2025-03-07 00:00:00', '12115795', '2025-03-07 00:00:00', '2025-03-06 16:00:00', '2025-03-07 16:00:00', '2025-03-07 00:00:00', '2025-03-08 00:00:00', '127', '55', '57', '60');
INSERT INTO `heart_rate` VALUES (2, '2025-03-08 00:00:00', '12115795', '2025-03-08 00:00:00', '2025-03-07 16:00:00', '2025-03-08 16:00:00', '2025-03-08 00:00:00', '2025-03-09 00:00:00', '142', '51', '54', '59');
INSERT INTO `heart_rate` VALUES (3, '2025-03-09 00:00:00', '12115795', '2025-03-09 00:00:00', '2025-03-08 16:00:00', '2025-03-09 16:00:00', '2025-03-09 00:00:00', '2025-03-10 00:00:00', '154', '54', '58', '59');
INSERT INTO `heart_rate` VALUES (4, '2025-03-10 00:00:00', '12115795', '2025-03-10 00:00:00', '2025-03-09 16:00:00', '2025-03-10 16:00:00', '2025-03-10 00:00:00', '2025-03-11 00:00:00', '129', '52', '54', '58');
INSERT INTO `heart_rate` VALUES (5, '2025-03-11 00:00:00', '12115795', '2025-03-11 00:00:00', '2025-03-10 16:00:00', '2025-03-11 16:00:00', '2025-03-11 00:00:00', '2025-03-12 00:00:00', '126', '55', '58', '58');
INSERT INTO `heart_rate` VALUES (6, '2025-03-12 00:00:00', '12115795', '2025-03-12 00:00:00', '2025-03-11 16:00:00', '2025-03-12 16:00:00', '2025-03-12 00:00:00', '2025-03-13 00:00:00', '132', '54', '56', '56');
INSERT INTO `heart_rate` VALUES (7, '2025-03-13 00:00:00', '12115795', '2025-03-13 00:00:00', '2025-03-12 16:00:00', '2025-03-13 16:00:00', '2025-03-13 00:00:00', '2025-03-14 00:00:00', '135', '53', '55', '56');
INSERT INTO `heart_rate` VALUES (8, '2025-03-14 00:00:00', '12115795', '2025-03-14 00:00:00', '2025-03-13 16:00:00', '2025-03-14 16:00:00', '2025-03-14 00:00:00', '2025-03-15 00:00:00', '134', '52', '54', '56');
INSERT INTO `heart_rate` VALUES (9, '2025-03-15 00:00:00', '12115795', '2025-03-15 00:00:00', '2025-03-14 16:00:00', '2025-03-15 16:00:00', '2025-03-15 00:00:00', '2025-03-16 00:00:00', '135', '54', '56', '56');
INSERT INTO `heart_rate` VALUES (10, '2025-03-16 00:00:00', '12115795', '2025-03-16 00:00:00', '2025-03-15 16:00:00', '2025-03-16 16:00:00', '2025-03-16 00:00:00', '2025-03-17 00:00:00', '126', '57', '60', '56');
INSERT INTO `heart_rate` VALUES (11, '2025-03-17 00:00:00', '12115795', '2025-03-17 00:00:00', '2025-03-16 16:00:00', '2025-03-17 16:00:00', '2025-03-17 00:00:00', '2025-03-18 00:00:00', '128', '53', '55', '56');
INSERT INTO `heart_rate` VALUES (12, '2025-03-18 00:00:00', '12115795', '2025-03-18 00:00:00', '2025-03-17 16:00:00', '2025-03-18 16:00:00', '2025-03-18 00:00:00', '2025-03-19 00:00:00', '148', '54', '57', '56');
INSERT INTO `heart_rate` VALUES (13, '2025-03-19 00:00:00', '12115795', '2025-03-19 00:00:00', '2025-03-18 16:00:00', '2025-03-19 16:00:00', '2025-03-19 00:00:00', '2025-03-20 00:00:00', '141', '56', '59', '57');
INSERT INTO `heart_rate` VALUES (14, '2025-03-20 00:00:00', '12115795', '2025-03-20 00:00:00', '2025-03-19 16:00:00', '2025-03-20 16:00:00', '2025-03-20 00:00:00', '2025-03-21 00:00:00', '145', '56', '57', '57');
INSERT INTO `heart_rate` VALUES (15, '2025-03-21 00:00:00', '12115795', '2025-03-21 00:00:00', '2025-03-20 16:00:00', '2025-03-21 16:00:00', '2025-03-21 00:00:00', '2025-03-22 00:00:00', '131', '58', '62', '58');
INSERT INTO `heart_rate` VALUES (16, '2025-03-22 00:00:00', '12115795', '2025-03-22 00:00:00', '2025-03-21 16:00:00', '2025-03-22 16:00:00', '2025-03-22 00:00:00', '2025-03-23 00:00:00', '131', '54', '57', '58');
INSERT INTO `heart_rate` VALUES (17, '2025-03-23 00:00:00', '12115795', '2025-03-23 00:00:00', '2025-03-22 16:00:00', '2025-03-23 16:00:00', '2025-03-23 00:00:00', '2025-03-24 00:00:00', '130', '58', '62', '58');
INSERT INTO `heart_rate` VALUES (18, '2025-03-24 00:00:00', '12115795', '2025-03-24 00:00:00', '2025-03-23 16:00:00', '2025-03-24 16:00:00', '2025-03-24 00:00:00', '2025-03-25 00:00:00', '121', '56', '59', '59');
INSERT INTO `heart_rate` VALUES (19, '2025-03-25 00:00:00', '12115795', '2025-03-25 00:00:00', '2025-03-24 16:00:00', '2025-03-25 16:00:00', '2025-03-25 00:00:00', '2025-03-26 00:00:00', '133', '56', '59', '59');
INSERT INTO `heart_rate` VALUES (20, '2025-03-26 00:00:00', '12115795', '2025-03-26 00:00:00', '2025-03-25 16:00:00', '2025-03-26 16:00:00', '2025-03-26 00:00:00', '2025-03-27 00:00:00', '135', '60', '61', '60');
INSERT INTO `heart_rate` VALUES (21, '2025-03-27 00:00:00', '12115795', '2025-03-27 00:00:00', '2025-03-26 16:00:00', '2025-03-27 16:00:00', '2025-03-27 00:00:00', '2025-03-28 00:00:00', '132', '58', '61', '60');
INSERT INTO `heart_rate` VALUES (22, '2025-03-28 00:00:00', '12115795', '2025-03-28 00:00:00', '2025-03-27 16:00:00', '2025-03-28 16:00:00', '2025-03-28 00:00:00', '2025-03-29 00:00:00', '129', '54', '57', '59');
INSERT INTO `heart_rate` VALUES (23, '2025-03-29 00:00:00', '12115795', '2025-03-29 00:00:00', '2025-03-28 16:00:00', '2025-03-29 16:00:00', '2025-03-29 00:00:00', '2025-03-30 00:00:00', '125', '55', '56', '59');
INSERT INTO `heart_rate` VALUES (24, '2025-03-30 00:00:00', '12115795', '2025-03-30 00:00:00', '2025-03-29 16:00:00', '2025-03-30 16:00:00', '2025-03-30 00:00:00', '2025-03-31 00:00:00', '114', '57', '59', '59');
INSERT INTO `heart_rate` VALUES (25, '2025-03-31 00:00:00', '12115795', '2025-03-31 00:00:00', '2025-03-30 16:00:00', '2025-03-31 16:00:00', '2025-03-31 00:00:00', '2025-04-01 00:00:00', '132', '55', '58', '59');
INSERT INTO `heart_rate` VALUES (26, '2025-04-01 00:00:00', '12115795', '2025-04-01 00:00:00', '2025-03-31 16:00:00', '2025-04-01 16:00:00', '2025-04-01 00:00:00', '2025-04-02 00:00:00', '129', '56', '59', '59');
INSERT INTO `heart_rate` VALUES (27, '2025-04-02 00:00:00', '12115795', '2025-04-02 00:00:00', '2025-04-01 16:00:00', '2025-04-02 01:46:00', '2025-04-02 00:00:00', '2025-04-03 00:00:00', '117', '56', '57', '58');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hrv
-- ----------------------------
INSERT INTO `hrv` VALUES (1, '2025-03-07 00:00:00', '12115795', '2025-03-06 15:49:35', '2025-03-06 22:19:37', '2025-03-06 23:49:35', '2025-03-07 06:19:37', '2025-03-06 15:49:35', '2025-03-06 22:24:35', '2025-03-06 23:49:35', '2025-03-07 06:24:35', '2025-03-07 00:00:00', NULL, '58', '96', 'NONE', 'ONBOARDING_1', '2025-03-07 03:19:45');
INSERT INTO `hrv` VALUES (2, '2025-03-08 00:00:00', '12115795', '2025-03-07 16:18:35', '2025-03-07 23:14:37', '2025-03-08 00:18:35', '2025-03-08 07:14:37', '2025-03-07 16:18:35', '2025-03-07 23:16:35', '2025-03-08 00:18:35', '2025-03-08 07:16:35', '2025-03-08 00:00:00', NULL, '64', '105', 'NONE', 'ONBOARDING_1', '2025-03-08 01:24:29');
INSERT INTO `hrv` VALUES (3, '2025-03-09 00:00:00', '12115795', '2025-03-08 16:38:23', '2025-03-08 23:04:37', '2025-03-09 00:38:23', '2025-03-09 07:04:37', '2025-03-08 16:38:23', '2025-03-08 23:44:23', '2025-03-09 00:38:23', '2025-03-09 07:44:23', '2025-03-09 00:00:00', '59', '64', '106', 'NONE', 'ONBOARDING_1', '2025-03-09 08:12:23');
INSERT INTO `hrv` VALUES (4, '2025-03-10 00:00:00', '12115795', '2025-03-09 16:27:30', '2025-03-09 22:59:36', '2025-03-10 00:27:30', '2025-03-10 06:59:36', '2025-03-09 16:27:30', '2025-03-09 23:00:30', '2025-03-10 00:27:30', '2025-03-10 07:00:30', '2025-03-10 00:00:00', '62', '74', '117', 'NONE', 'ONBOARDING_1', '2025-03-14 08:14:18');
INSERT INTO `hrv` VALUES (5, '2025-03-11 00:00:00', '12115795', '2025-03-10 16:20:44', '2025-03-10 22:34:36', '2025-03-11 00:20:44', '2025-03-11 06:34:36', '2025-03-10 16:20:44', '2025-03-10 22:38:44', '2025-03-11 00:20:44', '2025-03-11 06:38:44', '2025-03-11 00:00:00', '62', '62', '87', 'NONE', 'ONBOARDING_1', '2025-03-14 08:14:29');
INSERT INTO `hrv` VALUES (6, '2025-03-12 00:00:00', '12115795', '2025-03-11 15:15:29', '2025-03-11 22:44:36', '2025-03-11 23:15:29', '2025-03-12 06:44:36', '2025-03-11 15:15:29', '2025-03-11 22:45:29', '2025-03-11 23:15:29', '2025-03-12 06:45:29', '2025-03-12 00:00:00', '63', '69', '107', 'NONE', 'ONBOARDING_1', '2025-03-14 08:14:35');
INSERT INTO `hrv` VALUES (7, '2025-03-13 00:00:00', '12115795', '2025-03-12 16:13:46', '2025-03-12 22:49:36', '2025-03-13 00:13:46', '2025-03-13 06:49:36', '2025-03-12 16:13:46', '2025-03-12 22:53:46', '2025-03-13 00:13:46', '2025-03-13 06:53:46', '2025-03-13 00:00:00', '65', '69', '116', 'NONE', 'ONBOARDING_1', '2025-03-14 08:14:43');
INSERT INTO `hrv` VALUES (8, '2025-03-14 00:00:00', '12115795', '2025-03-13 16:29:29', '2025-03-13 22:54:36', '2025-03-14 00:29:29', '2025-03-14 06:54:36', '2025-03-13 16:29:29', '2025-03-13 22:59:29', '2025-03-14 00:29:29', '2025-03-14 06:59:29', '2025-03-14 00:00:00', '67', '65', '109', 'NONE', 'ONBOARDING_1', '2025-03-14 08:14:54');
INSERT INTO `hrv` VALUES (9, '2025-03-25 00:00:00', '12115795', '2025-03-24 15:06:14', '2025-03-24 21:59:35', '2025-03-24 23:06:14', '2025-03-25 05:59:35', '2025-03-25 15:02:49', '2025-03-25 15:12:49', '2025-03-25 23:02:49', '2025-03-25 23:12:49', '2025-03-25 00:00:00', '51', '48', '89', 'LOW', 'HRV_LOW_7', '2025-04-02 01:24:30');
INSERT INTO `hrv` VALUES (10, '2025-03-26 00:00:00', '12115795', '2025-03-25 15:02:49', '2025-03-25 15:09:35', '2025-03-25 23:02:49', '2025-03-25 23:09:35', '2025-03-25 17:09:36', '2025-03-25 22:49:36', '2025-03-26 01:09:36', '2025-03-26 06:49:36', '2025-03-26 00:00:00', '51', NULL, '50', 'LOW', 'HRV_LOW_7', '2025-04-02 01:46:39');
INSERT INTO `hrv` VALUES (11, '2025-03-27 00:00:00', '12115795', '2025-03-26 17:15:35', '2025-03-26 23:54:35', '2025-03-27 01:15:35', '2025-03-27 07:54:35', '2025-03-26 17:15:35', '2025-03-26 23:58:35', '2025-03-27 01:15:35', '2025-03-27 07:58:35', '2025-03-27 00:00:00', '48', '46', '74', 'LOW', 'HRV_LOW_7', '2025-04-02 01:45:36');
INSERT INTO `hrv` VALUES (12, '2025-03-28 00:00:00', '12115795', '2025-03-27 16:02:14', '2025-03-27 23:14:35', '2025-03-28 00:02:14', '2025-03-28 07:14:35', '2025-03-27 16:02:14', '2025-03-27 23:15:14', '2025-03-28 00:02:14', '2025-03-28 07:15:14', '2025-03-28 00:00:00', '50', '55', '102', 'LOW', 'HRV_LOW_6', '2025-04-02 01:45:44');
INSERT INTO `hrv` VALUES (13, '2025-03-29 00:00:00', '12115795', '2025-03-28 16:19:35', '2025-03-28 23:24:34', '2025-03-29 00:19:35', '2025-03-29 07:24:34', '2025-03-28 16:19:35', '2025-03-28 23:27:35', '2025-03-29 00:19:35', '2025-03-29 07:27:35', '2025-03-29 00:00:00', '49', '56', '92', 'LOW', 'HRV_LOW_5', '2025-04-02 01:45:54');
INSERT INTO `hrv` VALUES (14, '2025-03-30 00:00:00', '12115795', '2025-03-29 16:30:45', '2025-03-29 22:49:34', '2025-03-30 00:30:45', '2025-03-30 06:49:34', '2025-03-29 16:30:45', '2025-03-29 23:06:45', '2025-03-30 00:30:45', '2025-03-30 07:06:45', '2025-03-30 00:00:00', '50', '55', '96', 'LOW', 'HRV_LOW_6', '2025-04-02 01:46:00');
INSERT INTO `hrv` VALUES (15, '2025-03-31 00:00:00', '12115795', '2025-03-30 17:00:46', '2025-03-30 22:29:34', '2025-03-31 01:00:46', '2025-03-31 06:29:34', '2025-03-30 17:00:46', '2025-03-30 23:38:33', '2025-03-31 01:00:46', '2025-03-31 07:38:33', '2025-03-31 00:00:00', '51', '59', '118', 'UNBALANCED', 'HRV_UNBALANCED_11', '2025-04-02 01:46:08');
INSERT INTO `hrv` VALUES (16, '2025-04-01 00:00:00', '12115795', '2025-03-31 16:43:33', '2025-03-31 23:49:34', '2025-04-01 00:43:33', '2025-04-01 07:49:34', '2025-03-31 16:43:33', '2025-03-31 23:50:33', '2025-04-01 00:43:33', '2025-04-01 07:50:33', '2025-04-01 00:00:00', '52', '51', '93', 'UNBALANCED', 'HRV_UNBALANCED_12', '2025-04-02 01:46:45');
INSERT INTO `hrv` VALUES (17, '2025-04-02 00:00:00', '12115795', '2025-04-01 17:23:52', '2025-04-01 23:19:34', '2025-04-02 01:23:52', '2025-04-02 07:19:34', '2025-04-01 17:23:52', '2025-04-01 23:19:52', '2025-04-02 01:23:52', '2025-04-02 07:19:52', '2025-04-02 00:00:00', '54', '56', '91', 'BALANCED', 'HRV_BALANCED_4', '2025-04-02 01:46:52');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of respiration
-- ----------------------------
INSERT INTO `respiration` VALUES (1, '2025-03-07 00:00:00', '12115795', '2025-03-07 00:00:00', '2025-03-06 16:00:00', '2025-03-07 16:00:00', '2025-03-07 00:00:00', '2025-03-08 00:00:00', '2025-03-06 15:49:35', '2025-03-06 22:24:35', '2025-03-06 23:49:35', '2025-03-07 06:24:35', '2025-03-07 16:18:35', '2025-03-07 23:16:35', '2025-03-08 00:18:35', '2025-03-08 07:16:35', 9, 25, 16, 19, 18, '200');
INSERT INTO `respiration` VALUES (2, '2025-03-08 00:00:00', '12115795', '2025-03-08 00:00:00', '2025-03-07 16:00:00', '2025-03-08 16:00:00', '2025-03-08 00:00:00', '2025-03-09 00:00:00', '2025-03-07 16:18:35', '2025-03-07 23:16:35', '2025-03-08 00:18:35', '2025-03-08 07:16:35', '2025-03-08 16:38:23', '2025-03-08 23:44:23', '2025-03-09 00:38:23', '2025-03-09 07:44:23', 9, 25, 17, 18, 19, '200');
INSERT INTO `respiration` VALUES (3, '2025-03-09 00:00:00', '12115795', '2025-03-09 00:00:00', '2025-03-08 16:00:00', '2025-03-09 16:00:00', '2025-03-09 00:00:00', '2025-03-10 00:00:00', '2025-03-08 16:38:23', '2025-03-08 23:44:23', '2025-03-09 00:38:23', '2025-03-09 07:44:23', '2025-03-09 16:27:30', '2025-03-09 23:00:30', '2025-03-10 00:27:30', '2025-03-10 07:00:30', 8, 28, 17, 19, 18, '200');
INSERT INTO `respiration` VALUES (4, '2025-03-10 00:00:00', '12115795', '2025-03-10 00:00:00', '2025-03-09 16:00:00', '2025-03-10 16:00:00', '2025-03-10 00:00:00', '2025-03-11 00:00:00', '2025-03-09 16:27:30', '2025-03-09 23:00:30', '2025-03-10 00:27:30', '2025-03-10 07:00:30', '2025-03-10 16:20:44', '2025-03-10 22:38:44', '2025-03-11 00:20:44', '2025-03-11 06:38:44', 8, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (5, '2025-03-11 00:00:00', '12115795', '2025-03-11 00:00:00', '2025-03-10 16:00:00', '2025-03-11 16:00:00', '2025-03-11 00:00:00', '2025-03-12 00:00:00', '2025-03-10 16:20:44', '2025-03-10 22:38:44', '2025-03-11 00:20:44', '2025-03-11 06:38:44', '2025-03-11 15:15:29', '2025-03-11 22:45:29', '2025-03-11 23:15:29', '2025-03-12 06:45:29', 8, 24, 17, 18, 18, '200');
INSERT INTO `respiration` VALUES (6, '2025-03-12 00:00:00', '12115795', '2025-03-12 00:00:00', '2025-03-11 16:00:00', '2025-03-12 16:00:00', '2025-03-12 00:00:00', '2025-03-13 00:00:00', '2025-03-11 15:15:29', '2025-03-11 22:45:29', '2025-03-11 23:15:29', '2025-03-12 06:45:29', '2025-03-12 16:13:46', '2025-03-12 22:53:46', '2025-03-13 00:13:46', '2025-03-13 06:53:46', 8, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (7, '2025-03-13 00:00:00', '12115795', '2025-03-13 00:00:00', '2025-03-12 16:00:00', '2025-03-13 16:00:00', '2025-03-13 00:00:00', '2025-03-14 00:00:00', '2025-03-12 16:13:46', '2025-03-12 22:53:46', '2025-03-13 00:13:46', '2025-03-13 06:53:46', '2025-03-13 16:29:29', '2025-03-13 22:59:29', '2025-03-14 00:29:29', '2025-03-14 06:59:29', 8, 24, 17, 18, 19, '200');
INSERT INTO `respiration` VALUES (8, '2025-03-14 00:00:00', '12115795', '2025-03-14 00:00:00', '2025-03-13 16:00:00', '2025-03-14 16:00:00', '2025-03-14 00:00:00', '2025-03-15 00:00:00', '2025-03-13 16:29:29', '2025-03-13 22:59:29', '2025-03-14 00:29:29', '2025-03-14 06:59:29', '2025-03-14 16:30:16', '2025-03-14 22:16:16', '2025-03-15 00:30:16', '2025-03-15 06:16:16', 8, 25, 17, 19, 18, '200');
INSERT INTO `respiration` VALUES (9, '2025-03-15 00:00:00', '12115795', '2025-03-15 00:00:00', '2025-03-14 16:00:00', '2025-03-15 16:00:00', '2025-03-15 00:00:00', '2025-03-16 00:00:00', '2025-03-14 16:30:16', '2025-03-14 22:16:16', '2025-03-15 00:30:16', '2025-03-15 06:16:16', '2025-03-15 17:05:07', '2025-03-15 22:06:07', '2025-03-16 01:05:07', '2025-03-16 06:06:07', 9, 25, 17, 18, 18, '200');
INSERT INTO `respiration` VALUES (10, '2025-03-16 00:00:00', '12115795', '2025-03-16 00:00:00', '2025-03-15 16:00:00', '2025-03-16 16:00:00', '2025-03-16 00:00:00', '2025-03-17 00:00:00', '2025-03-15 17:05:07', '2025-03-15 22:06:07', '2025-03-16 01:05:07', '2025-03-16 06:06:07', '2025-03-16 15:54:27', '2025-03-16 22:42:27', '2025-03-16 23:54:27', '2025-03-17 06:42:27', 9, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (11, '2025-03-17 00:00:00', '12115795', '2025-03-17 00:00:00', '2025-03-16 16:00:00', '2025-03-17 16:00:00', '2025-03-17 00:00:00', '2025-03-18 00:00:00', '2025-03-16 15:54:27', '2025-03-16 22:42:27', '2025-03-16 23:54:27', '2025-03-17 06:42:27', '2025-03-17 15:48:29', '2025-03-17 22:43:21', '2025-03-17 23:48:29', '2025-03-18 06:43:21', 8, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (12, '2025-03-18 00:00:00', '12115795', '2025-03-18 00:00:00', '2025-03-17 16:00:00', '2025-03-18 16:00:00', '2025-03-18 00:00:00', '2025-03-19 00:00:00', '2025-03-17 15:48:29', '2025-03-17 22:43:21', '2025-03-17 23:48:29', '2025-03-18 06:43:21', '2025-03-18 16:52:21', '2025-03-18 22:50:21', '2025-03-19 00:52:21', '2025-03-19 06:50:21', 7, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (13, '2025-03-19 00:00:00', '12115795', '2025-03-19 00:00:00', '2025-03-18 16:00:00', '2025-03-19 16:00:00', '2025-03-19 00:00:00', '2025-03-20 00:00:00', '2025-03-18 16:52:21', '2025-03-18 22:50:21', '2025-03-19 00:52:21', '2025-03-19 06:50:21', '2025-03-19 15:46:44', '2025-03-19 22:36:44', '2025-03-19 23:46:44', '2025-03-20 06:36:44', 8, 24, 16, 18, 17, '200');
INSERT INTO `respiration` VALUES (14, '2025-03-20 00:00:00', '12115795', '2025-03-20 00:00:00', '2025-03-19 16:00:00', '2025-03-20 16:00:00', '2025-03-20 00:00:00', '2025-03-21 00:00:00', '2025-03-19 15:46:44', '2025-03-19 22:36:44', '2025-03-19 23:46:44', '2025-03-20 06:36:44', '2025-03-20 17:56:23', '2025-03-20 23:01:23', '2025-03-21 01:56:23', '2025-03-21 07:01:23', 6, 26, 17, 17, 18, '200');
INSERT INTO `respiration` VALUES (15, '2025-03-21 00:00:00', '12115795', '2025-03-21 00:00:00', '2025-03-20 16:00:00', '2025-03-21 16:00:00', '2025-03-21 00:00:00', '2025-03-22 00:00:00', '2025-03-20 17:56:23', '2025-03-20 23:01:23', '2025-03-21 01:56:23', '2025-03-21 07:01:23', '2025-03-21 15:48:48', '2025-03-21 22:41:48', '2025-03-21 23:48:48', '2025-03-22 06:41:48', 8, 25, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (16, '2025-03-22 00:00:00', '12115795', '2025-03-22 00:00:00', '2025-03-21 16:00:00', '2025-03-22 16:00:00', '2025-03-22 00:00:00', '2025-03-23 00:00:00', '2025-03-21 15:48:48', '2025-03-21 22:41:48', '2025-03-21 23:48:48', '2025-03-22 06:41:48', '2025-03-22 16:32:23', '2025-03-22 22:43:23', '2025-03-23 00:32:23', '2025-03-23 06:43:23', 9, 23, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (17, '2025-03-23 00:00:00', '12115795', '2025-03-23 00:00:00', '2025-03-22 16:00:00', '2025-03-23 16:00:00', '2025-03-23 00:00:00', '2025-03-24 00:00:00', '2025-03-22 16:32:23', '2025-03-22 22:43:23', '2025-03-23 00:32:23', '2025-03-23 06:43:23', '2025-03-23 16:26:39', '2025-03-23 22:55:39', '2025-03-24 00:26:39', '2025-03-24 06:55:39', 8, 23, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (18, '2025-03-24 00:00:00', '12115795', '2025-03-24 00:00:00', '2025-03-23 16:00:00', '2025-03-24 16:00:00', '2025-03-24 00:00:00', '2025-03-25 00:00:00', '2025-03-23 16:26:39', '2025-03-23 22:55:39', '2025-03-24 00:26:39', '2025-03-24 06:55:39', '2025-03-25 15:02:49', '2025-03-25 15:12:49', '2025-03-25 23:02:49', '2025-03-25 23:12:49', 8, 23, 16, 18, 14, '200');
INSERT INTO `respiration` VALUES (19, '2025-03-25 00:00:00', '12115795', '2025-03-25 00:00:00', '2025-03-24 16:00:00', '2025-03-25 16:00:00', '2025-03-25 00:00:00', '2025-03-26 00:00:00', '2025-03-25 15:02:49', '2025-03-25 15:12:49', '2025-03-25 23:02:49', '2025-03-25 23:12:49', '2025-03-25 17:09:36', '2025-03-25 22:49:36', '2025-03-26 01:09:36', '2025-03-26 06:49:36', 9, 24, 17, 14, 18, '200');
INSERT INTO `respiration` VALUES (20, '2025-03-26 00:00:00', '12115795', '2025-03-26 00:00:00', '2025-03-25 16:00:00', '2025-03-26 16:00:00', '2025-03-26 00:00:00', '2025-03-27 00:00:00', '2025-03-25 17:09:36', '2025-03-25 22:49:36', '2025-03-26 01:09:36', '2025-03-26 06:49:36', '2025-03-26 17:15:35', '2025-03-26 23:58:35', '2025-03-27 01:15:35', '2025-03-27 07:58:35', 9, 23, 16, 18, 19, '200');
INSERT INTO `respiration` VALUES (21, '2025-03-27 00:00:00', '12115795', '2025-03-27 00:00:00', '2025-03-26 16:00:00', '2025-03-27 16:00:00', '2025-03-27 00:00:00', '2025-03-28 00:00:00', '2025-03-26 17:15:35', '2025-03-26 23:58:35', '2025-03-27 01:15:35', '2025-03-27 07:58:35', '2025-03-27 16:02:14', '2025-03-27 23:15:14', '2025-03-28 00:02:14', '2025-03-28 07:15:14', 7, 29, 17, 19, 19, '200');
INSERT INTO `respiration` VALUES (22, '2025-03-28 00:00:00', '12115795', '2025-03-28 00:00:00', '2025-03-27 16:00:00', '2025-03-28 16:00:00', '2025-03-28 00:00:00', '2025-03-29 00:00:00', '2025-03-27 16:02:14', '2025-03-27 23:15:14', '2025-03-28 00:02:14', '2025-03-28 07:15:14', '2025-03-28 16:19:35', '2025-03-28 23:27:35', '2025-03-29 00:19:35', '2025-03-29 07:27:35', 8, 28, 16, 19, 18, '200');
INSERT INTO `respiration` VALUES (23, '2025-03-29 00:00:00', '12115795', '2025-03-29 00:00:00', '2025-03-28 16:00:00', '2025-03-29 16:00:00', '2025-03-29 00:00:00', '2025-03-30 00:00:00', '2025-03-28 16:19:35', '2025-03-28 23:27:35', '2025-03-29 00:19:35', '2025-03-29 07:27:35', '2025-03-29 16:30:45', '2025-03-29 23:06:45', '2025-03-30 00:30:45', '2025-03-30 07:06:45', 9, 24, 17, 18, 18, '200');
INSERT INTO `respiration` VALUES (24, '2025-03-30 00:00:00', '12115795', '2025-03-30 00:00:00', '2025-03-29 16:00:00', '2025-03-30 16:00:00', '2025-03-30 00:00:00', '2025-03-31 00:00:00', '2025-03-29 16:30:45', '2025-03-29 23:06:45', '2025-03-30 00:30:45', '2025-03-30 07:06:45', '2025-03-30 17:00:46', '2025-03-30 23:38:33', '2025-03-31 01:00:46', '2025-03-31 07:38:33', 8, 25, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (25, '2025-03-31 00:00:00', '12115795', '2025-03-31 00:00:00', '2025-03-30 16:00:00', '2025-03-31 16:00:00', '2025-03-31 00:00:00', '2025-04-01 00:00:00', '2025-03-30 17:00:46', '2025-03-30 23:38:33', '2025-03-31 01:00:46', '2025-03-31 07:38:33', '2025-03-31 16:43:33', '2025-03-31 23:50:33', '2025-04-01 00:43:33', '2025-04-01 07:50:33', 8, 24, 16, 18, 18, '200');
INSERT INTO `respiration` VALUES (26, '2025-04-01 00:00:00', '12115795', '2025-04-01 00:00:00', '2025-03-31 16:00:00', '2025-04-01 16:00:00', '2025-04-01 00:00:00', '2025-04-02 00:00:00', '2025-03-31 16:43:33', '2025-03-31 23:50:33', '2025-04-01 00:43:33', '2025-04-01 07:50:33', '2025-04-01 17:23:52', '2025-04-01 23:19:52', '2025-04-02 01:23:52', '2025-04-02 07:19:52', 7, 24, 15, 18, 18, '200');
INSERT INTO `respiration` VALUES (27, '2025-04-02 00:00:00', '12115795', '2025-04-02 00:00:00', '2025-04-01 16:00:00', '2025-04-02 01:46:00', '2025-04-02 00:00:00', '2025-04-02 09:46:00', '2025-04-01 17:23:52', '2025-04-01 23:19:52', '2025-04-02 01:23:52', '2025-04-02 07:19:52', NULL, NULL, NULL, NULL, 10, 24, 16, 18, NULL, '200');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resting_heart_rate
-- ----------------------------
INSERT INTO `resting_heart_rate` VALUES (1, '2025-03-07 00:00:00', '12115795', '2025-03-07 00:00:00', '2025-03-07 00:00:00', 57, '2025-03-07 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (2, '2025-03-08 00:00:00', '12115795', '2025-03-08 00:00:00', '2025-03-08 00:00:00', 54, '2025-03-08 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (3, '2025-03-09 00:00:00', '12115795', '2025-03-09 00:00:00', '2025-03-09 00:00:00', 58, '2025-03-09 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (4, '2025-03-10 00:00:00', '12115795', '2025-03-10 00:00:00', '2025-03-10 00:00:00', 54, '2025-03-10 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (5, '2025-03-11 00:00:00', '12115795', '2025-03-11 00:00:00', '2025-03-11 00:00:00', 58, '2025-03-11 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (6, '2025-03-12 00:00:00', '12115795', '2025-03-12 00:00:00', '2025-03-12 00:00:00', 56, '2025-03-12 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (7, '2025-03-13 00:00:00', '12115795', '2025-03-13 00:00:00', '2025-03-13 00:00:00', 55, '2025-03-13 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (8, '2025-03-14 00:00:00', '12115795', '2025-03-14 00:00:00', '2025-03-14 00:00:00', 54, '2025-03-14 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (9, '2025-03-15 00:00:00', '12115795', '2025-03-15 00:00:00', '2025-03-15 00:00:00', 56, '2025-03-15 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (10, '2025-03-16 00:00:00', '12115795', '2025-03-16 00:00:00', '2025-03-16 00:00:00', 60, '2025-03-16 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (11, '2025-03-17 00:00:00', '12115795', '2025-03-17 00:00:00', '2025-03-17 00:00:00', 55, '2025-03-17 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (12, '2025-03-18 00:00:00', '12115795', '2025-03-18 00:00:00', '2025-03-18 00:00:00', 57, '2025-03-18 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (13, '2025-03-19 00:00:00', '12115795', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 59, '2025-03-19 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (14, '2025-03-20 00:00:00', '12115795', '2025-03-20 00:00:00', '2025-03-20 00:00:00', 57, '2025-03-20 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (15, '2025-03-21 00:00:00', '12115795', '2025-03-21 00:00:00', '2025-03-21 00:00:00', 62, '2025-03-21 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (16, '2025-03-22 00:00:00', '12115795', '2025-03-22 00:00:00', '2025-03-22 00:00:00', 57, '2025-03-22 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (17, '2025-03-23 00:00:00', '12115795', '2025-03-23 00:00:00', '2025-03-23 00:00:00', 62, '2025-03-23 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (18, '2025-03-24 00:00:00', '12115795', '2025-03-24 00:00:00', '2025-03-24 00:00:00', 59, '2025-03-24 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (19, '2025-03-25 00:00:00', '12115795', '2025-03-25 00:00:00', '2025-03-25 00:00:00', 59, '2025-03-25 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (20, '2025-03-26 00:00:00', '12115795', '2025-03-26 00:00:00', '2025-03-26 00:00:00', 61, '2025-03-26 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (21, '2025-03-27 00:00:00', '12115795', '2025-03-27 00:00:00', '2025-03-27 00:00:00', 61, '2025-03-27 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (22, '2025-03-28 00:00:00', '12115795', '2025-03-28 00:00:00', '2025-03-28 00:00:00', 57, '2025-03-28 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (23, '2025-03-29 00:00:00', '12115795', '2025-03-29 00:00:00', '2025-03-29 00:00:00', 56, '2025-03-29 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (24, '2025-03-30 00:00:00', '12115795', '2025-03-30 00:00:00', '2025-03-30 00:00:00', 59, '2025-03-30 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (25, '2025-03-31 00:00:00', '12115795', '2025-03-31 00:00:00', '2025-03-31 00:00:00', 58, '2025-03-31 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (26, '2025-04-01 00:00:00', '12115795', '2025-04-01 00:00:00', '2025-04-01 00:00:00', 59, '2025-04-01 00:00:00');
INSERT INTO `resting_heart_rate` VALUES (27, '2025-04-02 00:00:00', '12115795', '2025-04-02 00:00:00', '2025-04-02 00:00:00', 57, '2025-04-02 00:00:00');

-- ----------------------------
-- Table structure for sleep
-- ----------------------------
DROP TABLE IF EXISTS `sleep`;
CREATE TABLE `sleep`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NULL DEFAULT NULL,
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
  `restlessMomentsCount` int NULL DEFAULT NULL,
  `respirationVersion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avgOvernightHrv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hrvStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bodyBatteryChange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `restingHeartRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remSleepDataExists` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sleep
-- ----------------------------
INSERT INTO `sleep` VALUES (1, '2025-03-07 00:00:00', '1741276175000', '12115795', '2025-03-07 00:00:00', '5h56min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-06 23:49:35', '2025-03-07 06:24:35', '2025-03-07 07:49:35', '2025-03-07 14:24:35', NULL, NULL, NULL, NULL, '0min', '1h22min', '3h40min', '54min', '39min', 'True', 'False', 'True', 95, 85, 100, '62.0', 19, 13, 22, 3, '15.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 33, '200', '58.0', 'NONE', '75', '57', 'True');
INSERT INTO `sleep` VALUES (2, '2025-03-08 00:00:00', '1741364315000', '12115795', '2025-03-08 00:00:00', '6h57min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-08 00:18:35', '2025-03-08 07:16:35', '2025-03-08 08:18:35', '2025-03-08 15:16:35', NULL, NULL, NULL, NULL, '0min', '1h13min', '3h49min', '1h55min', '1min', 'True', 'False', 'True', 96, 82, 100, '61.0', 18, 10, 22, 0, '14.0', 'ADULT', 'POSITIVE_REFRESHING', 'NONE', 'STRESS_POS_EXCELLENT_OR_GOOD_SLEEP_VERY_STRESSFUL_DAY', '2', 36, '200', '64.0', 'NONE', '76', '54', 'True');
INSERT INTO `sleep` VALUES (3, '2025-03-09 00:00:00', '1741451903000', '12115795', '2025-03-09 00:00:00', '5h50min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-09 00:38:23', '2025-03-09 07:44:23', '2025-03-09 08:38:23', '2025-03-09 15:44:23', NULL, NULL, NULL, NULL, '39min', '1h', '3h46min', '1h4min', '37min', 'True', 'False', 'True', 95, 79, 100, '58.0', 19, 14, 24, 2, '12.0', 'ADULT', 'POSITIVE_RECOVERING', 'POSITIVE_LATE_BED_TIME', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 30, '200', '64.0', 'NONE', '77', '58', 'True');
INSERT INTO `sleep` VALUES (4, '2025-03-10 00:00:00', '1741537650000', '12115795', '2025-03-10 00:00:00', '6h32min', '40min', 'True', 'enhanced_confirmed_final', '2025-03-10 00:27:30', '2025-03-10 07:00:30', '2025-03-10 08:27:30', '2025-03-10 15:00:30', NULL, NULL, NULL, NULL, '0min', '58min', '4h16min', '1h18min', '1min', 'True', 'False', 'True', 94, 76, 100, '59.0', 18, 10, 22, 0, '7.0', 'ADULT', 'POSITIVE_RECOVERING', 'POSITIVE_LATE_BED_TIME', 'MOD_EXERCISE_POS_EXCELLENT_OR_GOOD_SLEEP_MODERATE_DURING_DAY_OUTDOOR', '2', 29, '200', '74.0', 'NONE', '84', '54', 'True');
INSERT INTO `sleep` VALUES (5, '2025-03-11 00:00:00', '1741623644000', '12115795', '2025-03-11 00:00:00', '6h5min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-11 00:20:44', '2025-03-11 06:38:44', '2025-03-11 08:20:44', '2025-03-11 14:38:44', NULL, NULL, NULL, NULL, '0min', '1h11min', '4h5min', '49min', '13min', 'True', 'False', 'True', 96, 89, 100, '61.0', 18, 11, 23, 2, '16.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_STRESSFUL_DAY', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 31, '200', '62.0', 'NONE', '65', '58', 'True');
INSERT INTO `sleep` VALUES (6, '2025-03-12 00:00:00', '1741706129000', '12115795', '2025-03-12 00:00:00', '7h28min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-11 23:15:29', '2025-03-12 06:45:29', '2025-03-12 07:15:29', '2025-03-12 14:45:29', NULL, NULL, NULL, NULL, '0min', '1h33min', '4h11min', '1h44min', '2min', 'True', 'False', 'True', 96, 86, 100, '61.0', 18, 13, 24, 0, '11.0', 'ADULT', 'POSITIVE_OPTIMAL_STRUCTURE', 'NONE', 'STRESS_POS_EXCELLENT_OR_GOOD_SLEEP_VERY_STRESSFUL_DAY', '2', 39, '200', '69.0', 'NONE', '90', '56', 'True');
INSERT INTO `sleep` VALUES (7, '2025-03-13 00:00:00', '1741796026000', '12115795', '2025-03-13 00:00:00', '6h36min', '18min', 'True', 'enhanced_confirmed_final', '2025-03-13 00:13:46', '2025-03-13 06:53:46', '2025-03-13 08:13:46', '2025-03-13 14:53:46', NULL, NULL, NULL, NULL, '0min', '1h20min', '3h39min', '1h37min', '4min', 'True', 'False', 'True', 96, 87, 100, '59.0', 18, 12, 21, 0, '16.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'RHYTHM_POS_GOOD_SLEEP_EXCELLENT_TIMING', '2', 30, '200', '69.0', 'NONE', '80', '55', 'True');
INSERT INTO `sleep` VALUES (8, '2025-03-14 00:00:00', '1741883369000', '12115795', '2025-03-14 00:00:00', '6h30min', '26min', 'True', 'enhanced_confirmed_final', '2025-03-14 00:29:29', '2025-03-14 06:59:29', '2025-03-14 08:29:29', '2025-03-14 14:59:29', NULL, NULL, NULL, NULL, '0min', '1h38min', '3h28min', '1h24min', '0min', 'True', 'False', 'True', 97, 87, 100, '59.0', 19, 15, 23, 0, '10.0', 'ADULT', 'POSITIVE_RECOVERING', 'POSITIVE_STRESSFUL_DAY', 'STRESS_POS_EXCELLENT_OR_GOOD_SLEEP_VERY_STRESSFUL_DAY', '2', 24, '200', '65.0', 'NONE', '73', '54', 'True');
INSERT INTO `sleep` VALUES (9, '2025-03-15 00:00:00', '1741969816000', '12115795', '2025-03-15 00:00:00', '5h35min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-15 00:30:16', '2025-03-15 06:16:16', '2025-03-15 08:30:16', '2025-03-15 14:16:16', NULL, NULL, NULL, NULL, '0min', '1h32min', '3h13min', '50min', '11min', 'True', 'False', 'True', 96, 92, 99, '59.0', 18, 12, 22, 1, '9.0', 'ADULT', 'POSITIVE_RECOVERING', 'POSITIVE_LATE_BED_TIME', 'STRESS_POS_FAIR_OR_POOR_SLEEP_RESTFUL_EVENING', '2', 24, '200', NULL, NULL, '72', '56', 'True');
INSERT INTO `sleep` VALUES (10, '2025-03-16 00:00:00', '1742058307000', '12115795', '2025-03-16 00:00:00', '4h57min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-16 01:05:07', '2025-03-16 06:06:07', '2025-03-16 09:05:07', '2025-03-16 14:06:07', NULL, NULL, NULL, NULL, '0min', '1h2min', '2h22min', '1h33min', '4min', 'True', 'False', 'True', 95, 88, 99, '64.0', 18, 11, 23, 0, '16.0', 'ADULT', 'POSITIVE_SHORT_BUT_DEEP', 'NONE', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 20, '200', NULL, NULL, '48', '60', 'True');
INSERT INTO `sleep` VALUES (11, '2025-03-17 00:00:00', '1742140467000', '12115795', '2025-03-17 00:00:00', '6h36min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-16 23:54:27', '2025-03-17 06:42:27', '2025-03-17 07:54:27', '2025-03-17 14:42:27', NULL, NULL, NULL, NULL, '0min', '1h30min', '3h54min', '1h12min', '12min', 'True', 'False', 'True', 96, 91, 99, '60.0', 18, 11, 22, 1, '21.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'STRESS_POS_FAIR_OR_POOR_SLEEP_RESTFUL_EVENING', '2', 33, '200', NULL, NULL, '72', '55', 'True');
INSERT INTO `sleep` VALUES (12, '2025-03-18 00:00:00', '1742226509000', '12115795', '2025-03-18 00:00:00', '6h35min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-17 23:48:29', '2025-03-18 06:43:21', '2025-03-18 07:48:29', '2025-03-18 14:43:21', NULL, NULL, NULL, NULL, '0min', '1h20min', '3h46min', '1h30min', '19min', 'True', 'False', 'True', 96, 88, 99, '65.0', 18, 11, 23, 1, '18.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_RESTFUL_EVENING', 'RHYTHM_POS_FAIR_OR_POOR_SLEEP_GOOD_TIMING', '2', 25, '200', NULL, NULL, '63', '57', 'True');
INSERT INTO `sleep` VALUES (13, '2025-03-19 00:00:00', '1742316741000', '12115795', '2025-03-19 00:00:00', '5h57min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-19 00:52:21', '2025-03-19 06:50:21', '2025-03-19 08:52:21', '2025-03-19 14:50:21', NULL, NULL, NULL, NULL, '0min', '1h5min', '3h48min', '1h4min', '1min', 'True', 'False', 'True', 96, 86, 99, '63.0', 18, 12, 21, 0, '25.0', 'ADULT', 'POSITIVE_CONTINUOUS', 'POSITIVE_STRESSFUL_DAY', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 31, '200', NULL, NULL, '51', '59', 'True');
INSERT INTO `sleep` VALUES (14, '2025-03-20 00:00:00', '1742399204000', '12115795', '2025-03-20 00:00:00', '6h37min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-19 23:46:44', '2025-03-20 06:36:44', '2025-03-20 07:46:44', '2025-03-20 14:36:44', NULL, NULL, NULL, NULL, '12min', '1h', '3h51min', '1h46min', '1min', 'True', 'False', 'True', 96, 85, 100, '62.0', 17, 8, 22, 0, '13.0', 'ADULT', 'POSITIVE_REFRESHING', 'NONE', 'GENERAL_POS_EXCELLENT_OR_GOOD_SLEEP', '2', 36, '200', NULL, NULL, '71', '57', 'True');
INSERT INTO `sleep` VALUES (15, '2025-03-21 00:00:00', '1742493383000', '12115795', '2025-03-21 00:00:00', '4h51min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-21 01:56:23', '2025-03-21 07:01:23', '2025-03-21 09:56:23', '2025-03-21 15:01:23', NULL, NULL, NULL, NULL, '13min', '1h38min', '2h28min', '45min', '1min', 'True', 'False', 'True', 96, 87, 100, '62.0', 18, 11, 21, 0, '18.0', 'ADULT', 'POSITIVE_SHORT_BUT_DEEP', 'POSITIVE_LATE_BED_TIME', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 29, '200', NULL, NULL, '39', '62', 'True');
INSERT INTO `sleep` VALUES (16, '2025-03-22 00:00:00', '1742572128000', '12115795', '2025-03-22 00:00:00', '6h48min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-21 23:48:48', '2025-03-22 06:41:48', '2025-03-22 07:48:48', '2025-03-22 14:41:48', NULL, NULL, NULL, NULL, '0min', '1h27min', '4h13min', '1h8min', '5min', 'True', 'False', 'True', 96, 89, 99, '62.0', 18, 12, 23, 0, '17.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 36, '200', NULL, NULL, '72', '57', 'True');
INSERT INTO `sleep` VALUES (17, '2025-03-23 00:00:00', '1742661143000', '12115795', '2025-03-23 00:00:00', '6h10min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-23 00:32:23', '2025-03-23 06:43:23', '2025-03-23 08:32:23', '2025-03-23 14:43:23', NULL, NULL, NULL, NULL, '0min', '1h33min', '3h2min', '1h35min', '1min', 'True', 'False', 'True', 96, 90, 99, '67.0', 18, 9, 21, 0, '20.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_LATE_BED_TIME', 'RHYTHM_POS_FAIR_OR_POOR_SLEEP_EXCELLENT_TIMING', '2', 31, '200', NULL, NULL, '50', '62', 'True');
INSERT INTO `sleep` VALUES (18, '2025-03-24 00:00:00', '1742747199000', '12115795', '2025-03-24 00:00:00', '5h58min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-24 00:26:39', '2025-03-24 06:55:39', '2025-03-24 08:26:39', '2025-03-24 14:55:39', NULL, NULL, NULL, NULL, '30min', '53min', '3h6min', '1h59min', '1min', 'True', 'False', 'True', 96, 90, 99, '65.0', 18, 11, 22, 0, '22.0', 'ADULT', 'POSITIVE_CONTINUOUS', 'NONE', 'RHYTHM_POS_FAIR_OR_POOR_SLEEP_EXCELLENT_TIMING', '2', 34, '200', NULL, NULL, '57', '59', 'True');
INSERT INTO `sleep` VALUES (19, '2025-03-25 00:00:00', '1742914969000', '12115795', '2025-03-25 00:00:00', '10min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-25 23:02:49', '2025-03-25 23:12:49', '2025-03-26 07:02:49', '2025-03-26 07:12:49', NULL, NULL, NULL, NULL, '0min', '0min', '10min', '0min', '0min', 'True', 'False', 'True', 98, 98, 98, '74.0', 14, 12, 15, 0, '59.0', 'ADULT', 'NEGATIVE_SHORT_AND_POOR_QUALITY', 'NEGATIVE_STRESSFUL_DAY', 'NOT_AVAILABLE', '2', 5, '200', '48.0', 'LOW', '57', '59', 'True');
INSERT INTO `sleep` VALUES (20, '2025-03-26 00:00:00', '1742922576000', '12115795', '2025-03-26 00:00:00', '5h39min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-26 01:09:36', '2025-03-26 06:49:36', '2025-03-26 09:09:36', '2025-03-26 14:49:36', NULL, NULL, NULL, NULL, '0min', '1h24min', '2h54min', '1h21min', '1min', 'True', 'False', 'True', 96, 93, 99, '66.0', 18, 14, 21, 0, '18.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_LATE_BED_TIME', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 28, '200', NULL, 'LOW', '49', '61', 'True');
INSERT INTO `sleep` VALUES (21, '2025-03-27 00:00:00', '1743009335000', '12115795', '2025-03-27 00:00:00', '6h42min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-27 01:15:35', '2025-03-27 07:58:35', '2025-03-27 09:15:35', '2025-03-27 15:58:35', NULL, NULL, NULL, NULL, '0min', '59min', '4h11min', '1h32min', '1min', 'True', 'False', 'True', 97, 92, 99, '66.0', 19, 13, 23, 0, '22.0', 'ADULT', 'POSITIVE_CONTINUOUS', 'POSITIVE_LATE_BED_TIME', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 35, '200', '46.0', 'LOW', '52', '61', 'True');
INSERT INTO `sleep` VALUES (22, '2025-03-28 00:00:00', '1743091334000', '12115795', '2025-03-28 00:00:00', '7h7min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-28 00:02:14', '2025-03-28 07:15:14', '2025-03-28 08:02:14', '2025-03-28 15:15:14', NULL, NULL, NULL, NULL, '0min', '1h41min', '3h47min', '1h39min', '6min', 'True', 'False', 'True', 97, 93, 100, '63.0', 19, 12, 23, 1, '13.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'RHYTHM_POS_GOOD_SLEEP_GOOD_TIMING', '2', 32, '200', '55.0', 'LOW', '76', '57', 'True');
INSERT INTO `sleep` VALUES (23, '2025-03-29 00:00:00', '1743178775000', '12115795', '2025-03-29 00:00:00', '7h3min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-29 00:19:35', '2025-03-29 07:27:35', '2025-03-29 08:19:35', '2025-03-29 15:27:35', NULL, NULL, NULL, NULL, '0min', '57min', '4h15min', '1h51min', '5min', 'True', 'False', 'True', 96, 91, 100, '62.0', 18, 10, 22, 0, '18.0', 'ADULT', 'POSITIVE_REFRESHING', 'NONE', 'RHYTHM_POS_GOOD_SLEEP_EXCELLENT_TIMING', '2', 49, '200', '56.0', 'LOW', '74', '56', 'True');
INSERT INTO `sleep` VALUES (24, '2025-03-30 00:00:00', '1743265845000', '12115795', '2025-03-30 00:00:00', '6h9min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-30 00:30:45', '2025-03-30 07:06:45', '2025-03-30 08:30:45', '2025-03-30 15:06:45', NULL, NULL, NULL, NULL, '13min', '1h9min', '4h10min', '50min', '14min', 'True', 'False', 'True', 97, 91, 99, '61.0', 18, 10, 23, 1, '15.0', 'ADULT', 'POSITIVE_DEEP', 'POSITIVE_LATE_BED_TIME', 'RHYTHM_POS_FAIR_OR_POOR_SLEEP_EXCELLENT_TIMING', '2', 41, '200', '55.0', 'LOW', '64', '59', 'True');
INSERT INTO `sleep` VALUES (25, '2025-03-31 00:00:00', '1743354046000', '12115795', '2025-03-31 00:00:00', '5h29min', '0min', 'True', 'enhanced_confirmed_final', '2025-03-31 01:00:46', '2025-03-31 07:38:33', '2025-03-31 09:00:46', '2025-03-31 15:38:33', NULL, NULL, NULL, NULL, '1h7min', '1h42min', '2h59min', '49min', '1min', 'True', 'False', 'True', 97, 95, 99, '56.0', 18, 9, 22, 0, '17.0', 'ADULT', 'POSITIVE_SHORT_BUT_DEEP', 'POSITIVE_LATE_BED_TIME', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 23, '200', '59.0', 'UNBALANCED', '58', '58', 'True');
INSERT INTO `sleep` VALUES (26, '2025-04-01 00:00:00', '1743439413000', '12115795', '2025-04-01 00:00:00', '6h28min', '0min', 'True', 'enhanced_confirmed_final', '2025-04-01 00:43:33', '2025-04-01 07:50:33', '2025-04-01 08:43:33', '2025-04-01 15:50:33', NULL, NULL, NULL, NULL, '0min', '1h13min', '4h9min', '1h6min', '39min', 'True', 'False', 'True', 97, 94, 99, '64.0', 18, 12, 21, 1, '29.0', 'ADULT', 'NEGATIVE_NOT_RESTORATIVE', 'NEGATIVE_STRESSFUL_DAY', 'MOD_EXERCISE_NEG_FAIR_OR_POOR_SLEEP_INACTIVITY', '2', 38, '200', '51.0', 'UNBALANCED', '57', '59', 'True');
INSERT INTO `sleep` VALUES (27, '2025-04-02 00:00:00', '1743528232000', '12115795', '2025-04-02 00:00:00', '5h56min', '0min', 'True', 'enhanced_confirmed_final', '2025-04-02 01:23:52', '2025-04-02 07:19:52', '2025-04-02 09:23:52', '2025-04-02 15:19:52', NULL, NULL, NULL, NULL, '0min', '1h31min', '2h57min', '1h28min', '0min', 'True', 'False', 'True', 97, 93, 99, '63.0', 18, 15, 24, 0, '13.0', 'ADULT', 'POSITIVE_DEEP', 'NONE', 'GENERAL_POS_FAIR_OR_POOR_SLEEP', '2', 25, '200', '56.0', 'BALANCED', '62', '57', 'True');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spo2
-- ----------------------------
INSERT INTO `spo2` VALUES (1, '2025-03-07 00:00:00', '12115795', '2025-03-07 00:00:00', '2025-03-06 16:00:00', '2025-03-07 16:00:00', '2025-03-07 00:00:00', '2025-03-08 00:00:00', '2025-03-06 15:49:35', '2025-03-06 22:24:35', '2025-03-06 23:49:35', '2025-03-07 06:24:35', '2025-03-07 16:18:35', '2025-03-07 23:16:35', '2025-03-08 00:18:35', '2025-03-08 07:16:35', '95.0', '85', '96.0', '90', '2025-03-07 15:59:00', '2025-03-07 23:59:00', '95.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (2, '2025-03-08 00:00:00', '12115795', '2025-03-08 00:00:00', '2025-03-07 16:00:00', '2025-03-08 16:00:00', '2025-03-08 00:00:00', '2025-03-09 00:00:00', '2025-03-07 16:18:35', '2025-03-07 23:16:35', '2025-03-08 00:18:35', '2025-03-08 07:16:35', '2025-03-08 16:38:23', '2025-03-08 23:44:23', '2025-03-09 00:38:23', '2025-03-09 07:44:23', '96.0', '82', '96.0', '99', '2025-03-08 16:00:00', '2025-03-09 00:00:00', '96.0', '95.0', NULL);
INSERT INTO `spo2` VALUES (3, '2025-03-09 00:00:00', '12115795', '2025-03-09 00:00:00', '2025-03-08 16:00:00', '2025-03-09 16:00:00', '2025-03-09 00:00:00', '2025-03-10 00:00:00', '2025-03-08 16:38:23', '2025-03-08 23:44:23', '2025-03-09 00:38:23', '2025-03-09 07:44:23', '2025-03-09 16:27:30', '2025-03-09 23:00:30', '2025-03-10 00:27:30', '2025-03-10 07:00:30', '95.0', '79', '95.8', '94', '2025-03-09 16:00:00', '2025-03-10 00:00:00', '95.0', '94.0', NULL);
INSERT INTO `spo2` VALUES (4, '2025-03-10 00:00:00', '12115795', '2025-03-10 00:00:00', '2025-03-09 16:00:00', '2025-03-10 16:00:00', '2025-03-10 00:00:00', '2025-03-11 00:00:00', '2025-03-09 16:27:30', '2025-03-09 23:00:30', '2025-03-10 00:27:30', '2025-03-10 07:00:30', '2025-03-10 16:20:44', '2025-03-10 22:38:44', '2025-03-11 00:20:44', '2025-03-11 06:38:44', '96.0', '76', '95.83333333333333', '96', '2025-03-10 16:00:00', '2025-03-11 00:00:00', '94.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (5, '2025-03-11 00:00:00', '12115795', '2025-03-11 00:00:00', '2025-03-10 16:00:00', '2025-03-11 16:00:00', '2025-03-11 00:00:00', '2025-03-12 00:00:00', '2025-03-10 16:20:44', '2025-03-10 22:38:44', '2025-03-11 00:20:44', '2025-03-11 06:38:44', '2025-03-11 15:15:29', '2025-03-11 22:45:29', '2025-03-11 23:15:29', '2025-03-12 06:45:29', '96.0', '89', '95.85714285714286', '94', '2025-03-11 16:00:00', '2025-03-12 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (6, '2025-03-12 00:00:00', '12115795', '2025-03-12 00:00:00', '2025-03-11 16:00:00', '2025-03-12 16:00:00', '2025-03-12 00:00:00', '2025-03-13 00:00:00', '2025-03-11 15:15:29', '2025-03-11 22:45:29', '2025-03-11 23:15:29', '2025-03-12 06:45:29', '2025-03-12 16:13:46', '2025-03-12 22:53:46', '2025-03-13 00:13:46', '2025-03-13 06:53:46', '97.0', '86', '95.85714285714286', '95', '2025-03-12 16:00:00', '2025-03-13 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (7, '2025-03-13 00:00:00', '12115795', '2025-03-13 00:00:00', '2025-03-12 16:00:00', '2025-03-13 16:00:00', '2025-03-13 00:00:00', '2025-03-14 00:00:00', '2025-03-12 16:13:46', '2025-03-12 22:53:46', '2025-03-13 00:13:46', '2025-03-13 06:53:46', '2025-03-13 16:29:29', '2025-03-13 22:59:29', '2025-03-14 00:29:29', '2025-03-14 06:59:29', '96.0', '87', '95.85714285714286', '97', '2025-03-13 16:00:00', '2025-03-14 00:00:00', '96.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (8, '2025-03-14 00:00:00', '12115795', '2025-03-14 00:00:00', '2025-03-13 16:00:00', '2025-03-14 16:00:00', '2025-03-14 00:00:00', '2025-03-15 00:00:00', '2025-03-13 16:29:29', '2025-03-13 22:59:29', '2025-03-14 00:29:29', '2025-03-14 06:59:29', '2025-03-14 16:30:16', '2025-03-14 22:16:16', '2025-03-15 00:30:16', '2025-03-15 06:16:16', '96.0', '87', '96.0', '98', '2025-03-14 16:00:00', '2025-03-15 00:00:00', '97.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (9, '2025-03-15 00:00:00', '12115795', '2025-03-15 00:00:00', '2025-03-14 16:00:00', '2025-03-15 16:00:00', '2025-03-15 00:00:00', '2025-03-16 00:00:00', '2025-03-14 16:30:16', '2025-03-14 22:16:16', '2025-03-15 00:30:16', '2025-03-15 06:16:16', '2025-03-15 17:05:07', '2025-03-15 22:06:07', '2025-03-16 01:05:07', '2025-03-16 06:06:07', '96.0', '92', '96.0', '95', '2025-03-15 16:00:00', '2025-03-16 00:00:00', '96.0', '95.0', NULL);
INSERT INTO `spo2` VALUES (10, '2025-03-16 00:00:00', '12115795', '2025-03-16 00:00:00', '2025-03-15 16:00:00', '2025-03-16 16:00:00', '2025-03-16 00:00:00', '2025-03-17 00:00:00', '2025-03-15 17:05:07', '2025-03-15 22:06:07', '2025-03-16 01:05:07', '2025-03-16 06:06:07', '2025-03-16 15:54:27', '2025-03-16 22:42:27', '2025-03-16 23:54:27', '2025-03-17 06:42:27', '95.0', '88', '96.0', '96', '2025-03-16 16:00:00', '2025-03-17 00:00:00', '95.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (11, '2025-03-17 00:00:00', '12115795', '2025-03-17 00:00:00', '2025-03-16 16:00:00', '2025-03-17 16:00:00', '2025-03-17 00:00:00', '2025-03-18 00:00:00', '2025-03-16 15:54:27', '2025-03-16 22:42:27', '2025-03-16 23:54:27', '2025-03-17 06:42:27', '2025-03-17 15:48:29', '2025-03-17 22:43:21', '2025-03-17 23:48:29', '2025-03-18 06:43:21', '97.0', '91', '96.14285714285714', '97', '2025-03-17 16:00:00', '2025-03-18 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (12, '2025-03-18 00:00:00', '12115795', '2025-03-18 00:00:00', '2025-03-17 16:00:00', '2025-03-18 16:00:00', '2025-03-18 00:00:00', '2025-03-19 00:00:00', '2025-03-17 15:48:29', '2025-03-17 22:43:21', '2025-03-17 23:48:29', '2025-03-18 06:43:21', '2025-03-18 16:52:21', '2025-03-18 22:50:21', '2025-03-19 00:52:21', '2025-03-19 06:50:21', '96.0', '88', '96.14285714285714', '96', '2025-03-18 16:00:00', '2025-03-19 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (13, '2025-03-19 00:00:00', '12115795', '2025-03-19 00:00:00', '2025-03-18 16:00:00', '2025-03-19 16:00:00', '2025-03-19 00:00:00', '2025-03-20 00:00:00', '2025-03-18 16:52:21', '2025-03-18 22:50:21', '2025-03-19 00:52:21', '2025-03-19 06:50:21', '2025-03-19 15:46:44', '2025-03-19 22:36:44', '2025-03-19 23:46:44', '2025-03-20 06:36:44', '97.0', '86', '96.14285714285714', '97', '2025-03-19 16:00:00', '2025-03-20 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (14, '2025-03-20 00:00:00', '12115795', '2025-03-20 00:00:00', '2025-03-19 16:00:00', '2025-03-20 16:00:00', '2025-03-20 00:00:00', '2025-03-21 00:00:00', '2025-03-19 15:46:44', '2025-03-19 22:36:44', '2025-03-19 23:46:44', '2025-03-20 06:36:44', '2025-03-20 17:56:23', '2025-03-20 23:01:23', '2025-03-21 01:56:23', '2025-03-21 07:01:23', '97.0', '85', '96.28571428571429', '96', '2025-03-20 15:58:00', '2025-03-20 23:58:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (15, '2025-03-21 00:00:00', '12115795', '2025-03-21 00:00:00', '2025-03-20 16:00:00', '2025-03-21 16:00:00', '2025-03-21 00:00:00', '2025-03-22 00:00:00', '2025-03-20 17:56:23', '2025-03-20 23:01:23', '2025-03-21 01:56:23', '2025-03-21 07:01:23', '2025-03-21 15:48:48', '2025-03-21 22:41:48', '2025-03-21 23:48:48', '2025-03-22 06:41:48', '97.0', '87', '96.42857142857143', '96', '2025-03-21 16:00:00', '2025-03-22 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (16, '2025-03-22 00:00:00', '12115795', '2025-03-22 00:00:00', '2025-03-21 16:00:00', '2025-03-22 16:00:00', '2025-03-22 00:00:00', '2025-03-23 00:00:00', '2025-03-21 15:48:48', '2025-03-21 22:41:48', '2025-03-21 23:48:48', '2025-03-22 06:41:48', '2025-03-22 16:32:23', '2025-03-22 22:43:23', '2025-03-23 00:32:23', '2025-03-23 06:43:23', '97.0', '89', '96.57142857142857', '92', '2025-03-22 15:59:00', '2025-03-22 23:59:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (17, '2025-03-23 00:00:00', '12115795', '2025-03-23 00:00:00', '2025-03-22 16:00:00', '2025-03-23 16:00:00', '2025-03-23 00:00:00', '2025-03-24 00:00:00', '2025-03-22 16:32:23', '2025-03-22 22:43:23', '2025-03-23 00:32:23', '2025-03-23 06:43:23', '2025-03-23 16:26:39', '2025-03-23 22:55:39', '2025-03-24 00:26:39', '2025-03-24 06:55:39', '97.0', '90', '96.85714285714286', '96', '2025-03-23 16:00:00', '2025-03-24 00:00:00', '96.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (18, '2025-03-24 00:00:00', '12115795', '2025-03-24 00:00:00', '2025-03-23 16:00:00', '2025-03-24 16:00:00', '2025-03-24 00:00:00', '2025-03-25 00:00:00', '2025-03-23 16:26:39', '2025-03-23 22:55:39', '2025-03-24 00:26:39', '2025-03-24 06:55:39', '2025-03-25 15:02:49', '2025-03-25 15:12:49', '2025-03-25 23:02:49', '2025-03-25 23:12:49', '97.0', '90', '96.85714285714286', '93', '2025-03-24 16:00:00', '2025-03-25 00:00:00', '96.0', '98.0', NULL);
INSERT INTO `spo2` VALUES (19, '2025-03-25 00:00:00', '12115795', '2025-03-25 00:00:00', '2025-03-24 16:00:00', '2025-03-25 16:00:00', '2025-03-25 00:00:00', '2025-03-26 00:00:00', '2025-03-25 15:02:49', '2025-03-25 15:12:49', '2025-03-25 23:02:49', '2025-03-25 23:12:49', '2025-03-25 17:09:36', '2025-03-25 22:49:36', '2025-03-26 01:09:36', '2025-03-26 06:49:36', '96.0', '88', '96.85714285714286', '98', '2025-03-25 15:58:00', '2025-03-25 23:58:00', '98.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (20, '2025-03-26 00:00:00', '12115795', '2025-03-26 00:00:00', '2025-03-25 16:00:00', '2025-03-26 16:00:00', '2025-03-26 00:00:00', '2025-03-27 00:00:00', '2025-03-25 17:09:36', '2025-03-25 22:49:36', '2025-03-26 01:09:36', '2025-03-26 06:49:36', '2025-03-26 17:15:35', '2025-03-26 23:58:35', '2025-03-27 01:15:35', '2025-03-27 07:58:35', '97.0', '91', '96.85714285714286', '97', '2025-03-26 16:00:00', '2025-03-27 00:00:00', '96.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (21, '2025-03-27 00:00:00', '12115795', '2025-03-27 00:00:00', '2025-03-26 16:00:00', '2025-03-27 16:00:00', '2025-03-27 00:00:00', '2025-03-28 00:00:00', '2025-03-26 17:15:35', '2025-03-26 23:58:35', '2025-03-27 01:15:35', '2025-03-27 07:58:35', '2025-03-27 16:02:14', '2025-03-27 23:15:14', '2025-03-28 00:02:14', '2025-03-28 07:15:14', '97.0', '92', '96.85714285714286', '99', '2025-03-27 16:00:00', '2025-03-28 00:00:00', '97.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (22, '2025-03-28 00:00:00', '12115795', '2025-03-28 00:00:00', '2025-03-27 16:00:00', '2025-03-28 16:00:00', '2025-03-28 00:00:00', '2025-03-29 00:00:00', '2025-03-27 16:02:14', '2025-03-27 23:15:14', '2025-03-28 00:02:14', '2025-03-28 07:15:14', '2025-03-28 16:19:35', '2025-03-28 23:27:35', '2025-03-29 00:19:35', '2025-03-29 07:27:35', '98.0', '93', '97.0', '97', '2025-03-28 16:00:00', '2025-03-29 00:00:00', '97.0', '96.0', NULL);
INSERT INTO `spo2` VALUES (23, '2025-03-29 00:00:00', '12115795', '2025-03-29 00:00:00', '2025-03-28 16:00:00', '2025-03-29 16:00:00', '2025-03-29 00:00:00', '2025-03-30 00:00:00', '2025-03-28 16:19:35', '2025-03-28 23:27:35', '2025-03-29 00:19:35', '2025-03-29 07:27:35', '2025-03-29 16:30:45', '2025-03-29 23:06:45', '2025-03-30 00:30:45', '2025-03-30 07:06:45', '96.0', '91', '96.85714285714286', '95', '2025-03-29 16:00:00', '2025-03-30 00:00:00', '96.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (24, '2025-03-30 00:00:00', '12115795', '2025-03-30 00:00:00', '2025-03-29 16:00:00', '2025-03-30 16:00:00', '2025-03-30 00:00:00', '2025-03-31 00:00:00', '2025-03-29 16:30:45', '2025-03-29 23:06:45', '2025-03-30 00:30:45', '2025-03-30 07:06:45', '2025-03-30 17:00:46', '2025-03-30 23:38:33', '2025-03-31 01:00:46', '2025-03-31 07:38:33', '97.0', '91', '96.85714285714286', '99', '2025-03-30 16:00:00', '2025-03-31 00:00:00', '97.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (25, '2025-03-31 00:00:00', '12115795', '2025-03-31 00:00:00', '2025-03-30 16:00:00', '2025-03-31 16:00:00', '2025-03-31 00:00:00', '2025-04-01 00:00:00', '2025-03-30 17:00:46', '2025-03-30 23:38:33', '2025-03-31 01:00:46', '2025-03-31 07:38:33', '2025-03-31 16:43:33', '2025-03-31 23:50:33', '2025-04-01 00:43:33', '2025-04-01 07:50:33', '97.0', '94', '96.85714285714286', '96', '2025-03-31 16:00:00', '2025-04-01 00:00:00', '97.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (26, '2025-04-01 00:00:00', '12115795', '2025-04-01 00:00:00', '2025-03-31 16:00:00', '2025-04-01 16:00:00', '2025-04-01 00:00:00', '2025-04-02 00:00:00', '2025-03-31 16:43:33', '2025-03-31 23:50:33', '2025-04-01 00:43:33', '2025-04-01 07:50:33', '2025-04-01 17:23:52', '2025-04-01 23:19:52', '2025-04-02 01:23:52', '2025-04-02 07:19:52', '97.0', '94', '97.0', '97', '2025-04-01 16:00:00', '2025-04-02 00:00:00', '97.0', '97.0', NULL);
INSERT INTO `spo2` VALUES (27, '2025-04-02 00:00:00', '12115795', '2025-04-02 00:00:00', '2025-04-01 16:00:00', '2025-04-02 01:46:00', '2025-04-02 00:00:00', '2025-04-02 09:46:00', '2025-04-01 17:23:52', '2025-04-01 23:19:52', '2025-04-02 01:23:52', '2025-04-02 07:19:52', NULL, NULL, NULL, NULL, '98.0', '93', '97.14285714285714', '96', '2025-04-02 01:46:00', '2025-04-02 09:46:00', '97.0', NULL, NULL);

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stats_body_composition
-- ----------------------------
INSERT INTO `stats_body_composition` VALUES (1, '2025-03-07 00:00:00', '12115795', 2812, 847, 1965, 2812, NULL, NULL, NULL, 11016, NULL, 8048, 8048, 847, 847, '12115795', '2025-03-07 00:00:00', '2', 'private', '27bb803bc3fd42f99be947144f1b6f0b', '7740', '2025-03-06 16:00:00', '2025-03-07 00:00:00', '2025-03-07 16:00:00', '2025-03-08 00:00:00', '24h', NULL, '2h37min', '39min', '14h18min', '6h24min', 'True', 'False', 'False', 'False', '10', '5', NULL, NULL, NULL, NULL, '150', '10', '55', '134', '57', '60', 'GARMIN', '41', '99', '11h50min', '7h', '3h59min', '57min', '23h46min', '4h24min', '4h42min', '2h44min', '49.79', '29.45', '16.76', '4.0', '18.51', '19.78', '11.5', 'STRESSFUL', '16h27min', '6h22min', NULL, '55', '127', 74, 75, 80, 5, 5, '75', 80, '3.0', NULL, '95.0', '85', '90', '2025-03-07 15:59:00', '2025-03-07 23:59:00', NULL, NULL, '2025-03-07 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-07 15:25:50', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 25, 9, 15, '2025-03-07 15:59:00', '100', '2025-03-07T00:00:00+00:00', '2025-03-07T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (2, '2025-03-08 00:00:00', '12115795', 2952, 987, 1965, 2952, NULL, NULL, NULL, 6124, NULL, 23300, 4549, 987, 987, '12115795', '2025-03-08 00:00:00', '2', 'private', '004b3cb7594a4b6e8b9425e7b66af2e3', '8400', '2025-03-07 16:00:00', '2025-03-08 00:00:00', '2025-03-08 16:00:00', '2025-03-09 00:00:00', '24h', NULL, '1h17min', '41min', '15h2min', '6h58min', 'True', 'True', 'False', 'False', '52', '23', NULL, NULL, NULL, NULL, '150', '10', '51', '147', '54', '59', 'GARMIN', '36', '99', '9h33min', '7h47min', '3h47min', '2h39min', '23h46min', '3h35min', '4h19min', '1h39min', '40.18', '32.75', '15.92', '11.15', '15.08', '18.16', '6.94', 'STRESSFUL', '14h21min', '6h46min', NULL, '51', '142', 76, 76, 81, 5, 5, '76', 81, '3.0', NULL, '96.0', '82', '99', '2025-03-08 16:00:00', '2025-03-09 00:00:00', NULL, 110, '2025-03-08 15:40:36', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE_AND_BB_LOW', '2025-03-07 18:28:42', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 17, 25, 9, 14, '2025-03-08 16:00:00', '100', '2025-03-08T00:00:00+00:00', '2025-03-08T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (3, '2025-03-09 00:00:00', '12115795', 2723, 758, 1965, 2723, NULL, NULL, NULL, 15464, NULL, 10540, 10540, 758, 758, '12115795', '2025-03-09 00:00:00', '2', 'private', '3e052ac6222644b9b697e6fe96f4990c', '8180', '2025-03-08 16:00:00', '2025-03-09 00:00:00', '2025-03-09 16:00:00', '2025-03-10 00:00:00', '24h', NULL, '1h42min', '1h37min', '13h34min', '7h6min', 'True', 'True', 'False', 'False', '71', '8', NULL, NULL, NULL, NULL, '150', '10', '53', '165', '58', '59', 'GARMIN', '34', '99', '9h7min', '9h17min', '3h56min', '1h31min', '23h51min', '4h15min', '3h14min', '1h38min', '38.23', '38.92', '16.49', '6.36', '17.82', '13.56', '6.85', 'BALANCED', '15h54min', '6h26min', NULL, '54', '154', 78, 74, 83, 5, 9, '76', 81, '3.0', NULL, '95.0', '79', '94', '2025-03-09 16:00:00', '2025-03-10 00:00:00', NULL, 103, '2025-03-09 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE_AND_BB_LOW', '2025-03-08 18:53:10', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 17, 28, 8, 19, '2025-03-09 16:00:00', '100', '2025-03-09T00:00:00+00:00', '2025-03-09T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (4, '2025-03-10 00:00:00', '12115795', 2694, 729, 1965, 2694, NULL, NULL, NULL, 9626, NULL, 7246, 7246, 729, 729, '12115795', '2025-03-10 00:00:00', '2', 'private', 'cf1cecbfd70441669347e0be1f1375d1', '8910', '2025-03-09 16:00:00', '2025-03-10 00:00:00', '2025-03-10 16:00:00', '2025-03-11 00:00:00', '24h', NULL, '2h50min', '1h7min', '12h48min', '7h13min', 'True', 'False', 'False', 'False', '6', '2', NULL, NULL, NULL, NULL, '150', '10', '52', '133', '54', '58', 'GARMIN', '39', '99', '11h11min', '8h23min', '3h58min', '28min', '24h', '3h38min', '4h1min', '3h32min', '46.6', '34.93', '16.53', '1.94', '15.14', '16.74', '14.72', 'STRESSFUL', '17h2min', '6h30min', NULL, '52', '129', 90, 94, 94, 5, 5, '84', 93, '3.0', NULL, '96.0', '76', '96', '2025-03-10 16:00:00', '2025-03-11 00:00:00', NULL, NULL, '2025-03-10 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-09 17:48:08', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 16, 24, 8, 19, '2025-03-10 16:00:00', '100', '2025-03-10T00:00:00+00:00', '2025-03-10T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (5, '2025-03-11 00:00:00', '12115795', 2168, 203, 1965, 2168, NULL, NULL, NULL, 2879, NULL, 2148, 2148, 203, 203, '12115795', '2025-03-11 00:00:00', '2', 'private', 'c4707cc17fb049caa5b532dd873e4cc6', '9060', '2025-03-10 16:00:00', '2025-03-11 00:00:00', '2025-03-11 16:00:00', '2025-03-12 00:00:00', '24h', NULL, '44min', '10min', '16h2min', '7h2min', 'True', 'False', 'False', 'False', '1', '0', NULL, NULL, NULL, NULL, '150', '10', '54', '127', '58', '58', 'GARMIN', '37', '99', '8h16min', '7h38min', '1h8min', '6h58min', '24h', '2h22min', '3h47min', '2h7min', '34.44', '31.81', '4.72', '29.03', '9.86', '15.76', '8.82', 'BALANCED', '9h59min', '7h3min', NULL, '55', '126', 72, 50, 72, 5, 11, '65', 70, '3.0', NULL, '96.0', '89', '94', '2025-03-11 16:00:00', '2025-03-12 00:00:00', NULL, NULL, '2025-03-11 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-11 15:39:02', 'LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 17, 24, 8, 19, '2025-03-11 16:00:00', '100', '2025-03-11T00:00:00+00:00', '2025-03-11T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (6, '2025-03-12 00:00:00', '12115795', 2530, 565, 1965, 2530, NULL, NULL, NULL, 12195, NULL, 8572, 8572, 565, 565, '12115795', '2025-03-12 00:00:00', '2', 'private', '9db85a5923dc4ec993799759b8721875', '8450', '2025-03-11 16:00:00', '2025-03-12 00:00:00', '2025-03-12 16:00:00', '2025-03-13 00:00:00', '24h', NULL, '2h45min', '40min', '13h48min', '6h45min', 'True', 'False', 'False', 'False', '21', '2', NULL, NULL, NULL, NULL, '150', '10', '53', '133', '56', '56', 'GARMIN', '36', '97', '10h50min', '9h22min', '3h33min', '15min', '24h', '4h19min', '4h6min', '2h25min', '45.14', '39.03', '14.79', '1.04', '17.99', '17.08', '10.07', 'BALANCED', '17h', '6h45min', NULL, '54', '132', 85, 89, 96, 7, 7, '90', 96, '3.0', NULL, '97.0', '86', '95', '2025-03-12 16:00:00', '2025-03-13 00:00:00', NULL, NULL, '2025-03-12 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-12 15:47:01', 'LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 24, 8, 21, '2025-03-12 16:00:00', '100', '2025-03-12T00:00:00+00:00', '2025-03-12T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (7, '2025-03-13 00:00:00', '12115795', 2448, 483, 1965, 2448, NULL, NULL, NULL, 9899, NULL, 7102, 7102, 483, 483, '12115795', '2025-03-13 00:00:00', '2', 'private', '72d0211536bd435fa94db7d04ba7e74f', '8830', '2025-03-12 16:00:00', '2025-03-13 00:00:00', '2025-03-13 16:00:00', '2025-03-14 00:00:00', '24h', NULL, '2h1min', '55min', '14h4min', '6h58min', 'True', 'False', 'False', 'False', '11', '0', NULL, NULL, NULL, NULL, '150', '10', '52', '138', '55', '56', 'GARMIN', '42', '99', '12h3min', '7h27min', '3h46min', '39min', '23h55min', '3h20min', '5h6min', '3h37min', '50.38', '31.15', '15.75', '2.72', '13.94', '21.32', '15.12', 'STRESSFUL', '16h39min', '6h37min', NULL, '53', '135', 80, 82, 87, 5, 5, '80', 87, '3.0', NULL, '96.0', '87', '97', '2025-03-13 16:00:00', '2025-03-14 00:00:00', NULL, NULL, '2025-03-13 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-13 15:55:03', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 17, 24, 8, 17, '2025-03-13 16:00:00', '100', '2025-03-13T00:00:00+00:00', '2025-03-13T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (8, '2025-03-14 00:00:00', '12115795', 2387, 422, 1965, 2387, NULL, NULL, NULL, 8829, NULL, 6371, 6371, 422, 422, '12115795', '2025-03-14 00:00:00', '2', 'private', '159763019cc54ff29bc2c0cf60662090', '9050', '2025-03-13 16:00:00', '2025-03-14 00:00:00', '2025-03-14 16:00:00', '2025-03-15 00:00:00', '24h', NULL, '1h38min', '19min', '15h6min', '6h56min', 'True', 'False', 'False', 'False', '27', '3', NULL, NULL, NULL, NULL, '150', '10', '51', '146', '54', '56', 'GARMIN', '37', '98', '12h4min', '9h5min', '2h20min', '27min', '23h56min', '4h33min', '5h28min', '2h3min', '50.42', '37.95', '9.75', '1.88', '19.01', '22.84', '8.57', 'STRESSFUL', '16h59min', '6h30min', NULL, '52', '134', 81, 76, 79, 5, 10, '73', 78, '3.0', NULL, '96.0', '87', '98', '2025-03-14 16:00:00', '2025-03-15 00:00:00', NULL, NULL, '2025-03-14 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-13 18:58:53', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 17, 25, 8, 14, '2025-03-14 16:00:00', '200', '2025-03-14T00:00:00+00:00', '2025-03-14T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (9, '2025-03-15 00:00:00', '12115795', 2320, 355, 1965, 2320, NULL, NULL, NULL, 5283, NULL, 4037, 4037, 355, 355, '12115795', '2025-03-15 00:00:00', '2', 'private', '3ec6935cd22f4f4d94d115057abc1b3a', '9030', '2025-03-14 16:00:00', '2025-03-15 00:00:00', '2025-03-15 16:00:00', '2025-03-16 00:00:00', '24h', NULL, '1h17min', '31min', '16h24min', '5h46min', 'True', 'False', 'False', 'False', '4', '1', NULL, NULL, NULL, NULL, '150', '10', '52', '158', '56', '56', 'GARMIN', '37', '96', '12h30min', '7h21min', '2h12min', '1h53min', '23h56min', '5h47min', '5h13min', '1h30min', '52.23', '30.71', '9.19', '7.87', '24.16', '21.8', '6.27', 'STRESSFUL', '16h17min', '5h46min', NULL, '54', '135', 74, 79, 84, 5, 5, '72', 83, '3.0', NULL, '96.0', '92', '95', '2025-03-15 16:00:00', '2025-03-16 00:00:00', NULL, NULL, '2025-03-15 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-15 15:16:59', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 17, 25, 9, 16, '2025-03-15 16:00:00', '200', '2025-03-15T00:00:00+00:00', '2025-03-15T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (10, '2025-03-16 00:00:00', '12115795', 2669, 704, 1965, 2669, NULL, NULL, NULL, 11425, NULL, 8123, 8123, 704, 704, '12115795', '2025-03-16 00:00:00', '2', 'private', 'b314b091abbc4180a325bcf08458b728', '8280', '2025-03-15 16:00:00', '2025-03-16 00:00:00', '2025-03-16 16:00:00', '2025-03-17 00:00:00', '24h', NULL, '1h50min', '2h13min', '14h48min', '5h6min', 'True', 'True', 'False', 'False', '19', '1', NULL, NULL, NULL, NULL, '150', '10', '56', '140', '60', '56', 'GARMIN', '42', '99', '9h10min', '8h2min', '6h10min', '30min', '23h52min', '2h40min', '3h7min', '3h23min', '38.41', '33.66', '25.84', '2.09', '11.17', '13.06', '14.18', 'BALANCED', '18h15min', '5h7min', NULL, '57', '126', 52, 52, 56, 5, 5, '48', 53, '3.0', NULL, '95.0', '88', '96', '2025-03-16 16:00:00', '2025-03-17 00:00:00', NULL, 17, '2025-03-16 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE_AND_BB_LOW', '2025-03-16 15:06:43', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE_AND_BB_LOW', 16, 24, 9, 19, '2025-03-16 16:00:00', '200', '2025-03-16T00:00:00+00:00', '2025-03-16T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (11, '2025-03-17 00:00:00', '12115795', 2418, 453, 1965, 2418, NULL, NULL, NULL, 10458, NULL, 6817, 6817, 453, 453, '12115795', '2025-03-17 00:00:00', '2', 'private', 'ee4af13d59484e699f181472c604ac09', '8600', '2025-03-16 16:00:00', '2025-03-17 00:00:00', '2025-03-17 16:00:00', '2025-03-18 00:00:00', '24h', NULL, '1h31min', '46min', '14h47min', '6h53min', 'True', 'True', 'False', 'False', '35', '3', NULL, NULL, NULL, NULL, '150', '10', '52', '129', '55', '56', 'GARMIN', '32', '97', '9h38min', '10h32min', '3h14min', '21min', '23h45min', '5h', '3h14min', '1h24min', '40.56', '44.35', '13.61', '1.47', '21.05', '13.61', '5.89', 'BALANCED', '16h40min', '6h44min', NULL, '53', '128', 76, 69, 77, 5, 12, '72', 77, '3.0', NULL, '97.0', '91', '97', '2025-03-17 16:00:00', '2025-03-18 00:00:00', NULL, 21, '2025-03-17 14:35:00', 'LOW', 'SLEEP_PREPARATION_BALANCED_AND_EXERCISE', 'SLEEP_PREPARATION_BALANCED_AND_EXERCISE_AND_BB_LOW', '2025-03-17 15:42:47', 'LOW', 'SLEEP_TIME_PASSED_BALANCED_AND_EXERCISE', 'SLEEP_TIME_PASSED_BALANCED_AND_EXERCISE_AND_BB_LOW', 16, 24, 8, 19, '2025-03-17 16:00:00', '200', '2025-03-17T00:00:00+00:00', '2025-03-17T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (12, '2025-03-18 00:00:00', '12115795', 2686, 721, 1965, 2686, NULL, NULL, NULL, 9860, NULL, 7469, 7469, 721, 721, '12115795', '2025-03-18 00:00:00', '2', 'private', '64559a881a93493ea250f46f6ef77a01', '8980', '2025-03-17 16:00:00', '2025-03-18 00:00:00', '2025-03-18 16:00:00', '2025-03-19 00:00:00', '24h', NULL, '2h23min', '1h31min', '13h21min', '6h43min', 'True', 'False', 'False', 'False', '10', '7', NULL, NULL, NULL, NULL, '150', '10', '54', '152', '57', '56', 'GARMIN', '47', '100', '11h34min', '6h55min', '4h10min', '1h7min', '23h46min', '2h44min', '4h11min', '4h39min', '48.67', '29.1', '17.53', '4.7', '11.5', '17.6', '19.57', 'STRESSFUL', '15h56min', '6h43min', NULL, '54', '148', 61, 68, 73, 5, 5, '63', 73, '3.0', NULL, '96.0', '88', '96', '2025-03-18 16:00:00', '2025-03-19 00:00:00', NULL, NULL, '2025-03-18 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-18 15:44:18', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 24, 7, 19, '2025-03-18 16:00:00', '200', '2025-03-18T00:00:00+00:00', '2025-03-18T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (13, '2025-03-19 00:00:00', '12115795', 2475, 510, 1965, 2475, NULL, NULL, NULL, 8107, NULL, 5903, 5903, 510, 510, '12115795', '2025-03-19 00:00:00', '2', 'private', '373485fcffc7495abbe239f575aebe1a', '9160', '2025-03-18 16:00:00', '2025-03-19 00:00:00', '2025-03-19 16:00:00', '2025-03-20 00:00:00', '24h', NULL, '1h41min', '45min', '15h21min', '6h11min', 'True', 'False', 'False', 'False', '9', '4', NULL, NULL, NULL, NULL, '150', '10', '55', '145', '59', '57', 'GARMIN', '38', '97', '12h21min', '7h13min', '3h1min', '1h9min', '23h44min', '6h23min', '4h10min', '1h48min', '52.04', '30.41', '12.71', '4.85', '26.9', '17.56', '7.58', 'STRESSFUL', '16h34min', '6h1min', NULL, '56', '141', 51, 51, 56, 5, 5, '50', 55, '3.0', NULL, '97.0', '86', '97', '2025-03-19 16:00:00', '2025-03-20 00:00:00', NULL, NULL, '2025-03-19 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-19 15:51:07', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 24, 8, 20, '2025-03-19 16:00:00', '200', '2025-03-19T00:00:00+00:00', '2025-03-19T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (14, '2025-03-20 00:00:00', '12115795', 2553, 588, 1965, 2553, NULL, NULL, NULL, 8192, NULL, 6054, 6054, 588, 588, '12115795', '2025-03-20 00:00:00', '2', 'private', 'e8800da8e80b4a8d8d5b606fc3817a15', '9060', '2025-03-19 16:00:00', '2025-03-20 00:00:00', '2025-03-20 16:00:00', '2025-03-21 00:00:00', '24h', NULL, '1h51min', '34min', '14h57min', '6h36min', 'True', 'False', 'False', 'False', '9', '8', NULL, NULL, NULL, NULL, '150', '10', '54', '153', '57', '57', 'GARMIN', '42', '99', '11h17min', '7h2min', '2h56min', '2h29min', '23h44min', '4h12min', '4h6min', '2h59min', '47.54', '29.63', '12.36', '10.46', '17.7', '17.28', '12.57', 'STRESSFUL', '14h56min', '6h19min', NULL, '56', '145', 71, 71, 76, 5, 5, '71', 76, '3.0', NULL, '97.0', '85', '96', '2025-03-20 15:58:00', '2025-03-20 23:58:00', NULL, NULL, '2025-03-20 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-20 15:37:40', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 17, 26, 6, 18, '2025-03-20 15:58:00', '200', '2025-03-20T00:00:00+00:00', '2025-03-20T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (15, '2025-03-21 00:00:00', '12115795', 2377, 412, 1965, 2377, NULL, NULL, NULL, 7651, NULL, 5544, 5544, 412, 412, '12115795', '2025-03-21 00:00:00', '2', 'private', '01a0609050014e11874368bc8482892c', '8890', '2025-03-20 16:00:00', '2025-03-21 00:00:00', '2025-03-21 16:00:00', '2025-03-22 00:00:00', '24h', NULL, '1h40min', '48min', '16h15min', '5h16min', 'True', 'False', 'False', 'False', '7', '2', NULL, NULL, NULL, NULL, '150', '10', '56', '132', '62', '58', 'GARMIN', '39', '98', '12h52min', '7h37min', '2h42min', '27min', '23h38min', '6h37min', '4h42min', '1h33min', '54.44', '32.23', '11.42', '1.9', '28.0', '19.89', '6.56', 'STRESSFUL', '18h6min', '5h5min', NULL, '58', '131', 39, 39, 44, 5, 5, '39', 44, '3.0', NULL, '97.0', '87', '96', '2025-03-21 16:00:00', '2025-03-22 00:00:00', NULL, NULL, '2025-03-21 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-20 19:59:26', 'MODERATE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 16, 25, 8, 20, '2025-03-21 16:00:00', '200', '2025-03-21T00:00:00+00:00', '2025-03-21T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (16, '2025-03-22 00:00:00', '12115795', 2234, 269, 1965, 2234, NULL, NULL, NULL, 5581, NULL, 4077, 4077, 269, 269, '12115795', '2025-03-22 00:00:00', '2', 'private', '7add4ce16b00491899633143f131a629', '8650', '2025-03-21 16:00:00', '2025-03-22 00:00:00', '2025-03-22 16:00:00', '2025-03-23 00:00:00', '24h', NULL, '1h1min', '18min', '15h58min', '6h41min', 'True', 'False', 'False', 'False', '10', '0', NULL, NULL, NULL, NULL, '150', '10', '53', '133', '57', '58', 'GARMIN', '38', '98', '12h54min', '8h20min', '1h38min', '44min', '23h36min', '5h24min', '5h22min', '2h8min', '54.66', '35.31', '6.92', '3.11', '22.88', '22.74', '9.04', 'STRESSFUL', '16h12min', '6h40min', NULL, '54', '131', 72, 72, 77, 5, 5, '72', 77, '3.0', NULL, '97.0', '89', '92', '2025-03-22 15:59:00', '2025-03-22 23:59:00', NULL, NULL, '2025-03-22 15:20:27', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-22 15:42:24', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 23, 9, 20, '2025-03-22 16:00:00', '200', '2025-03-22T00:00:00+00:00', '2025-03-22T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (17, '2025-03-23 00:00:00', '12115795', 2293, 328, 1965, 2293, NULL, NULL, NULL, 5157, NULL, 3822, 3822, 328, 328, '12115795', '2025-03-23 00:00:00', '2', 'private', '9b0c5ecb42114383b0aaa9b3b1016df9', '8040', '2025-03-22 16:00:00', '2025-03-23 00:00:00', '2025-03-23 16:00:00', '2025-03-24 00:00:00', '24h', NULL, '1h6min', '29min', '16h13min', '6h11min', 'True', 'False', 'False', 'False', '3', '1', NULL, NULL, NULL, NULL, '150', '10', '57', '138', '62', '58', 'GARMIN', '35', '97', '12h41min', '8h16min', '2h24min', '33min', '23h54min', '8h14min', '3h28min', '59min', '53.07', '34.59', '10.04', '2.3', '34.45', '14.5', '4.11', 'STRESSFUL', '17h14min', '6h7min', NULL, '58', '130', 54, 51, 57, 5, 8, '49', 54, '3.0', NULL, '97.0', '90', '96', '2025-03-23 16:00:00', '2025-03-24 00:00:00', NULL, NULL, '2025-03-23 15:36:35', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-23 15:43:58', 'LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 23, 8, 20, '2025-03-23 16:00:00', '200', '2025-03-23T00:00:00+00:00', '2025-03-23T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (18, '2025-03-24 00:00:00', '12115795', 2287, 322, 1965, 2287, NULL, NULL, NULL, 4697, NULL, 3493, 3493, 322, 322, '12115795', '2025-03-24 00:00:00', '2', 'private', 'a186f8a15a19412b88a770251f3370c1', '7470', '2025-03-23 16:00:00', '2025-03-24 00:00:00', '2025-03-24 16:00:00', '2025-03-25 00:00:00', '24h', NULL, '1h', '38min', '15h51min', '6h29min', 'True', 'False', 'False', 'False', '1', '2', NULL, NULL, NULL, NULL, '150', '10', '55', '127', '59', '59', 'GARMIN', '40', '99', '13h15min', '6h51min', '2h15min', '1h27min', '23h48min', '7h5min', '3h26min', '2h44min', '55.67', '28.78', '9.45', '6.09', '29.76', '14.43', '11.48', 'STRESSFUL', '15h21min', '7h', NULL, '56', '121', 57, 60, 64, 5, 5, '57', 64, '3.0', NULL, '97.0', '90', '93', '2025-03-24 16:00:00', '2025-03-25 00:00:00', NULL, NULL, '2025-03-24 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-24 15:56:02', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 23, 8, 19, '2025-03-24 16:00:00', '200', '2025-03-24T00:00:00+00:00', '2025-03-24T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (19, '2025-03-25 00:00:00', '12115795', 2315, 350, 1965, 2315, NULL, NULL, NULL, 4146, NULL, 3014, 3014, 350, 350, '12115795', '2025-03-25 00:00:00', '2', 'private', 'aa6d519f3aae47f1badd17a651c5308a', '6920', '2025-03-24 16:00:00', '2025-03-25 00:00:00', '2025-03-25 16:00:00', '2025-03-26 00:00:00', '24h', NULL, '1h', '24min', '22h25min', '10min', 'True', 'False', 'False', 'False', '6', '3', NULL, NULL, NULL, NULL, '150', '10', '53', '145', '59', '59', 'GARMIN', '43', '96', '15h4min', '6h18min', '1h41min', '51min', '23h54min', '6h33min', '6h18min', '2h13min', '63.04', '26.36', '7.04', '3.56', '27.41', '26.36', '9.27', 'BALANCED_AWAKE', '22h53min', '10min', NULL, '56', '133', 58, 58, 63, 5, 5, '0', 5, '3.0', NULL, '96.0', '88', '98', '2025-03-25 15:58:00', '2025-03-25 23:58:00', NULL, NULL, '2025-03-25 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-25 15:01:43', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 17, 23, 11, 17, '2025-03-25 15:58:00', '200', '2025-03-25T00:00:00+00:00', '2025-03-25T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (20, '2025-03-26 00:00:00', '12115795', 2411, 446, 1965, 2411, NULL, NULL, NULL, 5315, NULL, 3893, 3893, 446, 446, '12115795', '2025-03-26 00:00:00', '2', 'private', 'a5e849ca1fe9476ca35f0970df49ffc6', '6370', '2025-03-25 16:00:00', '2025-03-26 00:00:00', '2025-03-26 16:00:00', '2025-03-27 00:00:00', '24h', NULL, '1h4min', '42min', '16h33min', '5h40min', 'True', 'False', 'False', 'False', '6', '2', NULL, NULL, NULL, NULL, '150', '10', '58', '146', '61', '60', 'GARMIN', '39', '99', '11h57min', '6h57min', '2h31min', '2h27min', '23h52min', '6h41min', '3h19min', '1h57min', '50.07', '29.12', '10.54', '10.27', '28.0', '13.9', '8.17', 'STRESSFUL', '15h45min', '5h40min', NULL, '60', '135', 51, 51, 54, 5, 5, '49', 54, '3.0', NULL, '97.0', '91', '97', '2025-03-26 16:00:00', '2025-03-27 00:00:00', NULL, NULL, '2025-03-26 14:58:11', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-26 15:50:09', 'VERY_LOW', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE_AND_BB_LOW', 16, 23, 9, 22, '2025-03-26 16:00:00', '200', '2025-03-26T00:00:00+00:00', '2025-03-26T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (21, '2025-03-27 00:00:00', '12115795', 2302, 337, 1965, 2302, NULL, NULL, NULL, 4643, NULL, 3473, 3473, 337, 337, '12115795', '2025-03-27 00:00:00', '2', 'private', 'bad38eb45d22479c96a0f65ca66a13f4', '6160', '2025-03-26 16:00:00', '2025-03-27 00:00:00', '2025-03-27 16:00:00', '2025-03-28 00:00:00', '24h', NULL, '54min', '19min', '16h3min', '6h43min', 'True', 'False', 'False', 'False', '4', '1', NULL, NULL, NULL, NULL, '150', '10', '57', '143', '61', '60', 'GARMIN', '40', '98', '14h15min', '7h30min', '1h39min', '29min', '23h53min', '6h54min', '5h48min', '1h33min', '59.67', '31.4', '6.91', '2.02', '28.89', '24.28', '6.49', 'STRESSFUL', '16h41min', '6h43min', NULL, '58', '132', 52, 52, 57, 5, 5, '52', 57, '3.0', NULL, '97.0', '92', '99', '2025-03-27 16:00:00', '2025-03-28 00:00:00', NULL, NULL, '2025-03-27 15:04:44', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-26 19:58:13', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 17, 29, 7, 18, '2025-03-27 16:00:00', '200', '2025-03-27T00:00:00+00:00', '2025-03-27T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (22, '2025-03-28 00:00:00', '12115795', 2371, 406, 1965, 2371, NULL, NULL, NULL, 7727, NULL, 5447, 5447, 406, 406, '12115795', '2025-03-28 00:00:00', '2', 'private', '1771663069b442c2943dffdddf7ebe0c', '5860', '2025-03-27 16:00:00', '2025-03-28 00:00:00', '2025-03-28 16:00:00', '2025-03-29 00:00:00', '24h', NULL, '1h16min', '26min', '15h3min', '7h13min', 'True', 'True', 'False', 'False', '21', '2', NULL, NULL, NULL, NULL, '150', '10', '53', '142', '57', '59', 'GARMIN', '38', '98', '12h43min', '8h29min', '2h18min', '12min', '23h42min', '5h27min', '5h33min', '1h43min', '53.66', '35.79', '9.7', '0.84', '23.0', '23.42', '7.24', 'STRESSFUL', '16h17min', '7h13min', NULL, '54', '129', 77, 75, 81, 5, 7, '76', 81, '3.0', NULL, '98.0', '93', '97', '2025-03-28 16:00:00', '2025-03-29 00:00:00', NULL, 17, '2025-03-28 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE', 'SLEEP_PREPARATION_STRESSFUL_AND_EXERCISE_AND_BB_LOW', '2025-03-27 17:51:59', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 16, 28, 8, 15, '2025-03-28 16:00:00', '200', '2025-03-28T00:00:00+00:00', '2025-03-28T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (23, '2025-03-29 00:00:00', '12115795', 2202, 237, 1965, 2202, NULL, NULL, NULL, 4209, NULL, 3128, 3128, 237, 237, '12115795', '2025-03-29 00:00:00', '2', 'private', 'ec93a2599f2b444a8479936307f90197', '6050', '2025-03-28 16:00:00', '2025-03-29 00:00:00', '2025-03-29 16:00:00', '2025-03-30 00:00:00', '24h', NULL, '40min', '24min', '15h46min', '7h8min', 'True', 'False', 'False', 'False', '2', '1', NULL, NULL, NULL, NULL, '150', '10', '54', '127', '56', '59', 'GARMIN', '38', '96', '11h37min', '7h38min', '1h18min', '2h59min', '23h32min', '4h11min', '6h16min', '1h10min', '49.36', '32.44', '5.52', '12.68', '17.78', '26.63', '4.96', 'STRESSFUL', '13h25min', '7h8min', NULL, '55', '125', 74, 73, 81, 7, 8, '74', 81, '3.0', NULL, '96.0', '91', '95', '2025-03-29 16:00:00', '2025-03-30 00:00:00', NULL, NULL, '2025-03-29 14:35:00', 'LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-28 18:02:28', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_EXERCISE', 17, 24, 9, 15, '2025-03-29 16:00:00', '200', '2025-03-29T00:00:00+00:00', '2025-03-29T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (24, '2025-03-30 00:00:00', '12115795', 2066, 101, 1965, 2066, NULL, NULL, NULL, 2436, NULL, 1838, 1838, 101, 101, '12115795', '2025-03-30 00:00:00', '2', 'private', '659eaac413bc4042abe106dfe423824b', '5870', '2025-03-29 16:00:00', '2025-03-30 00:00:00', '2025-03-30 16:00:00', '2025-03-31 00:00:00', '24h', NULL, '25min', '13min', '16h45min', '6h36min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '115', '59', '59', 'GARMIN', '32', '96', '12h7min', '9h52min', '1h10min', '45min', '23h54min', '7h58min', '3h32min', '37min', '50.7', '41.28', '4.88', '3.14', '33.33', '14.78', '2.58', 'STRESSFUL', '16h48min', '6h21min', NULL, '57', '114', 66, 56, 73, 7, 18, '64', 72, '3.0', NULL, '97.0', '91', '99', '2025-03-30 16:00:00', '2025-03-31 00:00:00', NULL, NULL, '2025-03-30 14:35:00', 'MODERATE', 'SLEEP_PREPARATION_BALANCED_AND_INACTIVE', 'SLEEP_PREPARATION_BALANCED_AND_INACTIVE', '2025-03-29 18:37:32', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 16, 25, 9, 23, '2025-03-30 16:00:00', '200', '2025-03-30T00:00:00+00:00', '2025-03-30T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (25, '2025-03-31 00:00:00', '12115795', 2290, 325, 1965, 2290, NULL, NULL, NULL, 4909, NULL, 3577, 3577, 325, 325, '12115795', '2025-03-31 00:00:00', '2', 'private', '289a7315d356438ca6c74d62bc000cc0', '5190', '2025-03-30 16:00:00', '2025-03-31 00:00:00', '2025-03-31 16:00:00', '2025-04-01 00:00:00', '24h', NULL, '50min', '35min', '15h55min', '6h37min', 'True', 'False', 'False', 'False', '10', '1', NULL, NULL, NULL, NULL, '150', '10', '55', '138', '58', '59', 'GARMIN', '44', '97', '13h15min', '6h', '2h20min', '2h17min', '23h52min', '4h58min', '6h7min', '2h10min', '55.52', '25.14', '9.78', '9.57', '20.81', '25.63', '9.08', 'STRESSFUL', '16h25min', '5h10min', NULL, '55', '132', 63, 76, 77, 5, 5, '58', 77, '3.0', NULL, '97.0', '94', '96', '2025-03-31 16:00:00', '2025-04-01 00:00:00', NULL, NULL, '2025-03-31 14:43:01', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-30 18:26:14', 'HIGH', 'SLEEP_TIME_PASSED_BALANCED_AND_INACTIVE', 'SLEEP_TIME_PASSED_BALANCED_AND_INACTIVE', 16, 24, 8, 18, '2025-03-31 16:00:00', '200', '2025-03-31T00:00:00+00:00', '2025-03-31T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (26, '2025-04-01 00:00:00', '12115795', 2509, 544, 1965, 2509, NULL, NULL, NULL, 6425, NULL, 4527, 4527, 544, 544, '12115795', '2025-04-01 00:00:00', '2', 'private', 'ce6553a75a4a412cbb9d8571f448bbf0', '5140', '2025-03-31 16:00:00', '2025-04-01 00:00:00', '2025-04-01 16:00:00', '2025-04-02 00:00:00', '24h', NULL, '1h17min', '59min', '14h35min', '7h7min', 'True', 'False', 'False', 'False', '14', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '131', '59', '59', 'GARMIN', '42', '98', '13h28min', '6h44min', '3h4min', '31min', '23h47min', '5h45min', '5h24min', '2h19min', '56.62', '28.31', '12.89', '2.17', '24.18', '22.7', '9.74', 'STRESSFUL', '16h20min', '6h56min', NULL, '56', '129', 57, 57, 62, 5, 5, '57', 62, '3.0', NULL, '97.0', '94', '97', '2025-04-01 16:00:00', '2025-04-02 00:00:00', NULL, NULL, '2025-04-01 14:35:00', 'VERY_LOW', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE', 'SLEEP_PREPARATION_STRESSFUL_AND_INACTIVE_AND_BB_LOW', '2025-03-31 19:36:13', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 15, 24, 7, 14, '2025-04-01 16:00:00', '200', '2025-04-01T00:00:00+00:00', '2025-04-01T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stats_body_composition` VALUES (27, '2025-04-02 00:00:00', '12115795', 908, 109, 799, 908, NULL, NULL, NULL, 1851, NULL, 1386, 1386, 109, 109, '12115795', '2025-04-02 00:00:00', '2', 'private', '6e83fadee1e54067b54ee1fa27a0becc', '5270', '2025-04-01 16:00:00', '2025-04-02 00:00:00', '2025-04-02 01:46:00', '2025-04-02 09:46:00', '9h46min', NULL, '27min', '15min', '3h7min', '5h56min', 'True', 'False', 'False', 'False', '0', '0', NULL, NULL, NULL, NULL, '150', '10', '55', '118', '57', '58', 'GARMIN', '18', '88', '1h30min', '6h33min', '42min', '40min', '9h25min', '1h11min', '15min', '4min', '15.93', '69.56', '7.43', '7.08', '12.57', '2.65', '0.71', 'UNKNOWN', '2h58min', '5h47min', NULL, '56', '117', 64, 11, 69, 5, 58, '61', 66, '3.0', NULL, '98.0', '93', '96', '2025-04-02 01:46:00', '2025-04-02 09:46:00', NULL, NULL, '2025-04-02 01:28:21', 'MODERATE', 'MORNING_STRESSFUL_AND_INACTIVE', 'MORNING_STRESSFUL_AND_INACTIVE', '2025-04-01 20:06:55', 'HIGH', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 'SLEEP_TIME_PASSED_STRESSFUL_AND_INACTIVE', 16, 24, 10, 22, '2025-04-02 01:46:00', '200', '2025-04-02T00:00:00+00:00', '2025-04-02T23:59:59.999000+00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`date` ASC, `startGMT` ASC, `endGMT` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2537 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steps
-- ----------------------------
INSERT INTO `steps` VALUES (1, '2025-03-07 00:00:00', '2025-03-06T16:00:00.0', '2025-03-06T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2, '2025-03-07 00:00:00', '2025-03-06T16:15:00.0', '2025-03-06T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (3, '2025-03-07 00:00:00', '2025-03-06T16:30:00.0', '2025-03-06T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (4, '2025-03-07 00:00:00', '2025-03-06T16:45:00.0', '2025-03-06T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (5, '2025-03-07 00:00:00', '2025-03-06T17:00:00.0', '2025-03-06T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (6, '2025-03-07 00:00:00', '2025-03-06T17:15:00.0', '2025-03-06T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (7, '2025-03-07 00:00:00', '2025-03-06T17:30:00.0', '2025-03-06T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (8, '2025-03-07 00:00:00', '2025-03-06T17:45:00.0', '2025-03-06T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (9, '2025-03-07 00:00:00', '2025-03-06T18:00:00.0', '2025-03-06T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (10, '2025-03-07 00:00:00', '2025-03-06T18:15:00.0', '2025-03-06T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (11, '2025-03-07 00:00:00', '2025-03-06T18:30:00.0', '2025-03-06T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (12, '2025-03-07 00:00:00', '2025-03-06T18:45:00.0', '2025-03-06T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (13, '2025-03-07 00:00:00', '2025-03-06T19:00:00.0', '2025-03-06T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (14, '2025-03-07 00:00:00', '2025-03-06T19:15:00.0', '2025-03-06T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (15, '2025-03-07 00:00:00', '2025-03-06T19:30:00.0', '2025-03-06T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (16, '2025-03-07 00:00:00', '2025-03-06T19:45:00.0', '2025-03-06T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (17, '2025-03-07 00:00:00', '2025-03-06T20:00:00.0', '2025-03-06T20:15:00.0', 17, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (18, '2025-03-07 00:00:00', '2025-03-06T20:15:00.0', '2025-03-06T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (19, '2025-03-07 00:00:00', '2025-03-06T20:30:00.0', '2025-03-06T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (20, '2025-03-07 00:00:00', '2025-03-06T20:45:00.0', '2025-03-06T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (21, '2025-03-07 00:00:00', '2025-03-06T21:00:00.0', '2025-03-06T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (22, '2025-03-07 00:00:00', '2025-03-06T21:15:00.0', '2025-03-06T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (23, '2025-03-07 00:00:00', '2025-03-06T21:30:00.0', '2025-03-06T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (24, '2025-03-07 00:00:00', '2025-03-06T21:45:00.0', '2025-03-06T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (25, '2025-03-07 00:00:00', '2025-03-06T22:00:00.0', '2025-03-06T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (26, '2025-03-07 00:00:00', '2025-03-06T22:15:00.0', '2025-03-06T22:30:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (27, '2025-03-07 00:00:00', '2025-03-06T22:30:00.0', '2025-03-06T22:45:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (28, '2025-03-07 00:00:00', '2025-03-06T22:45:00.0', '2025-03-06T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (29, '2025-03-07 00:00:00', '2025-03-06T23:00:00.0', '2025-03-06T23:15:00.0', 424, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (30, '2025-03-07 00:00:00', '2025-03-06T23:15:00.0', '2025-03-06T23:30:00.0', 489, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (31, '2025-03-07 00:00:00', '2025-03-06T23:30:00.0', '2025-03-06T23:45:00.0', 548, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (32, '2025-03-07 00:00:00', '2025-03-06T23:45:00.0', '2025-03-07T00:00:00.0', 476, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (33, '2025-03-07 00:00:00', '2025-03-07T00:00:00.0', '2025-03-07T00:15:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (34, '2025-03-07 00:00:00', '2025-03-07T00:15:00.0', '2025-03-07T00:30:00.0', 10, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (35, '2025-03-07 00:00:00', '2025-03-07T00:30:00.0', '2025-03-07T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (36, '2025-03-07 00:00:00', '2025-03-07T00:45:00.0', '2025-03-07T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (37, '2025-03-07 00:00:00', '2025-03-07T01:00:00.0', '2025-03-07T01:15:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (38, '2025-03-07 00:00:00', '2025-03-07T01:15:00.0', '2025-03-07T01:30:00.0', 112, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (39, '2025-03-07 00:00:00', '2025-03-07T01:30:00.0', '2025-03-07T01:45:00.0', 47, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (40, '2025-03-07 00:00:00', '2025-03-07T01:45:00.0', '2025-03-07T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (41, '2025-03-07 00:00:00', '2025-03-07T02:00:00.0', '2025-03-07T02:15:00.0', 36, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (42, '2025-03-07 00:00:00', '2025-03-07T02:15:00.0', '2025-03-07T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (43, '2025-03-07 00:00:00', '2025-03-07T02:30:00.0', '2025-03-07T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (44, '2025-03-07 00:00:00', '2025-03-07T02:45:00.0', '2025-03-07T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (45, '2025-03-07 00:00:00', '2025-03-07T03:00:00.0', '2025-03-07T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (46, '2025-03-07 00:00:00', '2025-03-07T03:15:00.0', '2025-03-07T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (47, '2025-03-07 00:00:00', '2025-03-07T03:30:00.0', '2025-03-07T03:45:00.0', 120, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (48, '2025-03-07 00:00:00', '2025-03-07T03:45:00.0', '2025-03-07T04:00:00.0', 58, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (49, '2025-03-07 00:00:00', '2025-03-07T04:00:00.0', '2025-03-07T04:15:00.0', 511, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (50, '2025-03-07 00:00:00', '2025-03-07T04:15:00.0', '2025-03-07T04:30:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (51, '2025-03-07 00:00:00', '2025-03-07T04:30:00.0', '2025-03-07T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (52, '2025-03-07 00:00:00', '2025-03-07T04:45:00.0', '2025-03-07T05:00:00.0', 414, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (53, '2025-03-07 00:00:00', '2025-03-07T05:00:00.0', '2025-03-07T05:15:00.0', 335, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (54, '2025-03-07 00:00:00', '2025-03-07T05:15:00.0', '2025-03-07T05:30:00.0', 299, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (55, '2025-03-07 00:00:00', '2025-03-07T05:30:00.0', '2025-03-07T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (56, '2025-03-07 00:00:00', '2025-03-07T05:45:00.0', '2025-03-07T06:00:00.0', 127, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (57, '2025-03-07 00:00:00', '2025-03-07T06:00:00.0', '2025-03-07T06:15:00.0', 317, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (58, '2025-03-07 00:00:00', '2025-03-07T06:15:00.0', '2025-03-07T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (59, '2025-03-07 00:00:00', '2025-03-07T06:30:00.0', '2025-03-07T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (60, '2025-03-07 00:00:00', '2025-03-07T06:45:00.0', '2025-03-07T07:00:00.0', 20, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (61, '2025-03-07 00:00:00', '2025-03-07T07:00:00.0', '2025-03-07T07:15:00.0', 740, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (62, '2025-03-07 00:00:00', '2025-03-07T07:15:00.0', '2025-03-07T07:30:00.0', 961, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (63, '2025-03-07 00:00:00', '2025-03-07T07:30:00.0', '2025-03-07T07:45:00.0', 589, '0', 'active', 'False');
INSERT INTO `steps` VALUES (64, '2025-03-07 00:00:00', '2025-03-07T07:45:00.0', '2025-03-07T08:00:00.0', 129, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (65, '2025-03-07 00:00:00', '2025-03-07T08:00:00.0', '2025-03-07T08:15:00.0', 641, '0', 'active', 'False');
INSERT INTO `steps` VALUES (66, '2025-03-07 00:00:00', '2025-03-07T08:15:00.0', '2025-03-07T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (67, '2025-03-07 00:00:00', '2025-03-07T08:30:00.0', '2025-03-07T08:45:00.0', 241, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (68, '2025-03-07 00:00:00', '2025-03-07T08:45:00.0', '2025-03-07T09:00:00.0', 318, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (69, '2025-03-07 00:00:00', '2025-03-07T09:00:00.0', '2025-03-07T09:15:00.0', 28, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (70, '2025-03-07 00:00:00', '2025-03-07T09:15:00.0', '2025-03-07T09:30:00.0', 78, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (71, '2025-03-07 00:00:00', '2025-03-07T09:30:00.0', '2025-03-07T09:45:00.0', 265, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (72, '2025-03-07 00:00:00', '2025-03-07T09:45:00.0', '2025-03-07T10:00:00.0', 34, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (73, '2025-03-07 00:00:00', '2025-03-07T10:00:00.0', '2025-03-07T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (74, '2025-03-07 00:00:00', '2025-03-07T10:15:00.0', '2025-03-07T10:30:00.0', 23, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (75, '2025-03-07 00:00:00', '2025-03-07T10:30:00.0', '2025-03-07T10:45:00.0', 319, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (76, '2025-03-07 00:00:00', '2025-03-07T10:45:00.0', '2025-03-07T11:00:00.0', 886, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (77, '2025-03-07 00:00:00', '2025-03-07T11:00:00.0', '2025-03-07T11:15:00.0', 343, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (78, '2025-03-07 00:00:00', '2025-03-07T11:15:00.0', '2025-03-07T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (79, '2025-03-07 00:00:00', '2025-03-07T11:30:00.0', '2025-03-07T11:45:00.0', 89, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (80, '2025-03-07 00:00:00', '2025-03-07T11:45:00.0', '2025-03-07T12:00:00.0', 101, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (81, '2025-03-07 00:00:00', '2025-03-07T12:00:00.0', '2025-03-07T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (82, '2025-03-07 00:00:00', '2025-03-07T12:15:00.0', '2025-03-07T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (83, '2025-03-07 00:00:00', '2025-03-07T12:30:00.0', '2025-03-07T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (84, '2025-03-07 00:00:00', '2025-03-07T12:45:00.0', '2025-03-07T13:00:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (85, '2025-03-07 00:00:00', '2025-03-07T13:00:00.0', '2025-03-07T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (86, '2025-03-07 00:00:00', '2025-03-07T13:15:00.0', '2025-03-07T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (87, '2025-03-07 00:00:00', '2025-03-07T13:30:00.0', '2025-03-07T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (88, '2025-03-07 00:00:00', '2025-03-07T13:45:00.0', '2025-03-07T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (89, '2025-03-07 00:00:00', '2025-03-07T14:00:00.0', '2025-03-07T14:15:00.0', 67, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (90, '2025-03-07 00:00:00', '2025-03-07T14:15:00.0', '2025-03-07T14:30:00.0', 23, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (91, '2025-03-07 00:00:00', '2025-03-07T14:30:00.0', '2025-03-07T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (92, '2025-03-07 00:00:00', '2025-03-07T14:45:00.0', '2025-03-07T15:00:00.0', 496, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (93, '2025-03-07 00:00:00', '2025-03-07T15:00:00.0', '2025-03-07T15:15:00.0', 52, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (94, '2025-03-07 00:00:00', '2025-03-07T15:15:00.0', '2025-03-07T15:30:00.0', 6, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (95, '2025-03-07 00:00:00', '2025-03-07T15:30:00.0', '2025-03-07T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (96, '2025-03-07 00:00:00', '2025-03-07T15:45:00.0', '2025-03-07T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (97, '2025-03-08 00:00:00', '2025-03-07T16:00:00.0', '2025-03-07T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (98, '2025-03-08 00:00:00', '2025-03-07T16:15:00.0', '2025-03-07T16:30:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (99, '2025-03-08 00:00:00', '2025-03-07T16:30:00.0', '2025-03-07T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (100, '2025-03-08 00:00:00', '2025-03-07T16:45:00.0', '2025-03-07T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (101, '2025-03-08 00:00:00', '2025-03-07T17:00:00.0', '2025-03-07T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (102, '2025-03-08 00:00:00', '2025-03-07T17:15:00.0', '2025-03-07T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (103, '2025-03-08 00:00:00', '2025-03-07T17:30:00.0', '2025-03-07T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (104, '2025-03-08 00:00:00', '2025-03-07T17:45:00.0', '2025-03-07T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (105, '2025-03-08 00:00:00', '2025-03-07T18:00:00.0', '2025-03-07T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (106, '2025-03-08 00:00:00', '2025-03-07T18:15:00.0', '2025-03-07T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (107, '2025-03-08 00:00:00', '2025-03-07T18:30:00.0', '2025-03-07T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (108, '2025-03-08 00:00:00', '2025-03-07T18:45:00.0', '2025-03-07T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (109, '2025-03-08 00:00:00', '2025-03-07T19:00:00.0', '2025-03-07T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (110, '2025-03-08 00:00:00', '2025-03-07T19:15:00.0', '2025-03-07T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (111, '2025-03-08 00:00:00', '2025-03-07T19:30:00.0', '2025-03-07T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (112, '2025-03-08 00:00:00', '2025-03-07T19:45:00.0', '2025-03-07T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (113, '2025-03-08 00:00:00', '2025-03-07T20:00:00.0', '2025-03-07T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (114, '2025-03-08 00:00:00', '2025-03-07T20:15:00.0', '2025-03-07T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (115, '2025-03-08 00:00:00', '2025-03-07T20:30:00.0', '2025-03-07T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (116, '2025-03-08 00:00:00', '2025-03-07T20:45:00.0', '2025-03-07T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (117, '2025-03-08 00:00:00', '2025-03-07T21:00:00.0', '2025-03-07T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (118, '2025-03-08 00:00:00', '2025-03-07T21:15:00.0', '2025-03-07T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (119, '2025-03-08 00:00:00', '2025-03-07T21:30:00.0', '2025-03-07T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (120, '2025-03-08 00:00:00', '2025-03-07T21:45:00.0', '2025-03-07T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (121, '2025-03-08 00:00:00', '2025-03-07T22:00:00.0', '2025-03-07T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (122, '2025-03-08 00:00:00', '2025-03-07T22:15:00.0', '2025-03-07T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (123, '2025-03-08 00:00:00', '2025-03-07T22:30:00.0', '2025-03-07T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (124, '2025-03-08 00:00:00', '2025-03-07T22:45:00.0', '2025-03-07T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (125, '2025-03-08 00:00:00', '2025-03-07T23:00:00.0', '2025-03-07T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (126, '2025-03-08 00:00:00', '2025-03-07T23:15:00.0', '2025-03-07T23:30:00.0', 81, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (127, '2025-03-08 00:00:00', '2025-03-07T23:30:00.0', '2025-03-07T23:45:00.0', 169, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (128, '2025-03-08 00:00:00', '2025-03-07T23:45:00.0', '2025-03-08T00:00:00.0', 172, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (129, '2025-03-08 00:00:00', '2025-03-08T00:00:00.0', '2025-03-08T00:15:00.0', 294, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (130, '2025-03-08 00:00:00', '2025-03-08T00:15:00.0', '2025-03-08T00:30:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (131, '2025-03-08 00:00:00', '2025-03-08T00:30:00.0', '2025-03-08T00:45:00.0', 75, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (132, '2025-03-08 00:00:00', '2025-03-08T00:45:00.0', '2025-03-08T01:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (133, '2025-03-08 00:00:00', '2025-03-08T01:00:00.0', '2025-03-08T01:15:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (134, '2025-03-08 00:00:00', '2025-03-08T01:15:00.0', '2025-03-08T01:30:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (135, '2025-03-08 00:00:00', '2025-03-08T01:30:00.0', '2025-03-08T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (136, '2025-03-08 00:00:00', '2025-03-08T01:45:00.0', '2025-03-08T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (137, '2025-03-08 00:00:00', '2025-03-08T02:00:00.0', '2025-03-08T02:15:00.0', 10, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (138, '2025-03-08 00:00:00', '2025-03-08T02:15:00.0', '2025-03-08T02:30:00.0', 55, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (139, '2025-03-08 00:00:00', '2025-03-08T02:30:00.0', '2025-03-08T02:45:00.0', 181, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (140, '2025-03-08 00:00:00', '2025-03-08T02:45:00.0', '2025-03-08T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (141, '2025-03-08 00:00:00', '2025-03-08T03:00:00.0', '2025-03-08T03:15:00.0', 103, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (142, '2025-03-08 00:00:00', '2025-03-08T03:15:00.0', '2025-03-08T03:30:00.0', 196, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (143, '2025-03-08 00:00:00', '2025-03-08T03:30:00.0', '2025-03-08T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (144, '2025-03-08 00:00:00', '2025-03-08T03:45:00.0', '2025-03-08T04:00:00.0', 764, '0', 'active', 'False');
INSERT INTO `steps` VALUES (145, '2025-03-08 00:00:00', '2025-03-08T04:00:00.0', '2025-03-08T04:15:00.0', 205, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (146, '2025-03-08 00:00:00', '2025-03-08T04:15:00.0', '2025-03-08T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (147, '2025-03-08 00:00:00', '2025-03-08T04:30:00.0', '2025-03-08T04:45:00.0', 624, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (148, '2025-03-08 00:00:00', '2025-03-08T04:45:00.0', '2025-03-08T05:00:00.0', 115, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (149, '2025-03-08 00:00:00', '2025-03-08T05:00:00.0', '2025-03-08T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (150, '2025-03-08 00:00:00', '2025-03-08T05:15:00.0', '2025-03-08T05:30:00.0', 38, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (151, '2025-03-08 00:00:00', '2025-03-08T05:30:00.0', '2025-03-08T05:45:00.0', 121, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (152, '2025-03-08 00:00:00', '2025-03-08T05:45:00.0', '2025-03-08T06:00:00.0', 85, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (153, '2025-03-08 00:00:00', '2025-03-08T06:00:00.0', '2025-03-08T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (154, '2025-03-08 00:00:00', '2025-03-08T06:15:00.0', '2025-03-08T06:30:00.0', 91, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (155, '2025-03-08 00:00:00', '2025-03-08T06:30:00.0', '2025-03-08T06:45:00.0', 161, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (156, '2025-03-08 00:00:00', '2025-03-08T06:45:00.0', '2025-03-08T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (157, '2025-03-08 00:00:00', '2025-03-08T07:00:00.0', '2025-03-08T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (158, '2025-03-08 00:00:00', '2025-03-08T07:15:00.0', '2025-03-08T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (159, '2025-03-08 00:00:00', '2025-03-08T07:30:00.0', '2025-03-08T07:45:00.0', 143, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (160, '2025-03-08 00:00:00', '2025-03-08T07:45:00.0', '2025-03-08T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (161, '2025-03-08 00:00:00', '2025-03-08T08:00:00.0', '2025-03-08T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (162, '2025-03-08 00:00:00', '2025-03-08T08:15:00.0', '2025-03-08T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (163, '2025-03-08 00:00:00', '2025-03-08T08:30:00.0', '2025-03-08T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (164, '2025-03-08 00:00:00', '2025-03-08T08:45:00.0', '2025-03-08T09:00:00.0', 105, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (165, '2025-03-08 00:00:00', '2025-03-08T09:00:00.0', '2025-03-08T09:15:00.0', 65, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (166, '2025-03-08 00:00:00', '2025-03-08T09:15:00.0', '2025-03-08T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (167, '2025-03-08 00:00:00', '2025-03-08T09:30:00.0', '2025-03-08T09:45:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (168, '2025-03-08 00:00:00', '2025-03-08T09:45:00.0', '2025-03-08T10:00:00.0', 39, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (169, '2025-03-08 00:00:00', '2025-03-08T10:00:00.0', '2025-03-08T10:15:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (170, '2025-03-08 00:00:00', '2025-03-08T10:15:00.0', '2025-03-08T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (171, '2025-03-08 00:00:00', '2025-03-08T10:30:00.0', '2025-03-08T10:45:00.0', 133, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (172, '2025-03-08 00:00:00', '2025-03-08T10:45:00.0', '2025-03-08T11:00:00.0', 212, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (173, '2025-03-08 00:00:00', '2025-03-08T11:00:00.0', '2025-03-08T11:15:00.0', 0, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (174, '2025-03-08 00:00:00', '2025-03-08T11:15:00.0', '2025-03-08T11:30:00.0', 0, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (175, '2025-03-08 00:00:00', '2025-03-08T11:30:00.0', '2025-03-08T11:45:00.0', 0, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (176, '2025-03-08 00:00:00', '2025-03-08T11:45:00.0', '2025-03-08T12:00:00.0', 0, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (177, '2025-03-08 00:00:00', '2025-03-08T12:00:00.0', '2025-03-08T12:15:00.0', 27, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (178, '2025-03-08 00:00:00', '2025-03-08T12:15:00.0', '2025-03-08T12:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (179, '2025-03-08 00:00:00', '2025-03-08T12:30:00.0', '2025-03-08T12:45:00.0', 0, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (180, '2025-03-08 00:00:00', '2025-03-08T12:45:00.0', '2025-03-08T13:00:00.0', 225, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (181, '2025-03-08 00:00:00', '2025-03-08T13:00:00.0', '2025-03-08T13:15:00.0', 9, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (182, '2025-03-08 00:00:00', '2025-03-08T13:15:00.0', '2025-03-08T13:30:00.0', 434, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (183, '2025-03-08 00:00:00', '2025-03-08T13:30:00.0', '2025-03-08T13:45:00.0', 5, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (184, '2025-03-08 00:00:00', '2025-03-08T13:45:00.0', '2025-03-08T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (185, '2025-03-08 00:00:00', '2025-03-08T14:00:00.0', '2025-03-08T14:15:00.0', 432, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (186, '2025-03-08 00:00:00', '2025-03-08T14:15:00.0', '2025-03-08T14:30:00.0', 202, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (187, '2025-03-08 00:00:00', '2025-03-08T14:30:00.0', '2025-03-08T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (188, '2025-03-08 00:00:00', '2025-03-08T14:45:00.0', '2025-03-08T15:00:00.0', 423, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (189, '2025-03-08 00:00:00', '2025-03-08T15:00:00.0', '2025-03-08T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (190, '2025-03-08 00:00:00', '2025-03-08T15:15:00.0', '2025-03-08T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (191, '2025-03-08 00:00:00', '2025-03-08T15:30:00.0', '2025-03-08T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (192, '2025-03-08 00:00:00', '2025-03-08T15:45:00.0', '2025-03-08T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (193, '2025-03-09 00:00:00', '2025-03-08T16:00:00.0', '2025-03-08T16:15:00.0', 100, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (194, '2025-03-09 00:00:00', '2025-03-08T16:15:00.0', '2025-03-08T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (195, '2025-03-09 00:00:00', '2025-03-08T16:30:00.0', '2025-03-08T16:45:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (196, '2025-03-09 00:00:00', '2025-03-08T16:45:00.0', '2025-03-08T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (197, '2025-03-09 00:00:00', '2025-03-08T17:00:00.0', '2025-03-08T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (198, '2025-03-09 00:00:00', '2025-03-08T17:15:00.0', '2025-03-08T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (199, '2025-03-09 00:00:00', '2025-03-08T17:30:00.0', '2025-03-08T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (200, '2025-03-09 00:00:00', '2025-03-08T17:45:00.0', '2025-03-08T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (201, '2025-03-09 00:00:00', '2025-03-08T18:00:00.0', '2025-03-08T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (202, '2025-03-09 00:00:00', '2025-03-08T18:15:00.0', '2025-03-08T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (203, '2025-03-09 00:00:00', '2025-03-08T18:30:00.0', '2025-03-08T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (204, '2025-03-09 00:00:00', '2025-03-08T18:45:00.0', '2025-03-08T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (205, '2025-03-09 00:00:00', '2025-03-08T19:00:00.0', '2025-03-08T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (206, '2025-03-09 00:00:00', '2025-03-08T19:15:00.0', '2025-03-08T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (207, '2025-03-09 00:00:00', '2025-03-08T19:30:00.0', '2025-03-08T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (208, '2025-03-09 00:00:00', '2025-03-08T19:45:00.0', '2025-03-08T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (209, '2025-03-09 00:00:00', '2025-03-08T20:00:00.0', '2025-03-08T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (210, '2025-03-09 00:00:00', '2025-03-08T20:15:00.0', '2025-03-08T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (211, '2025-03-09 00:00:00', '2025-03-08T20:30:00.0', '2025-03-08T20:45:00.0', 12, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (212, '2025-03-09 00:00:00', '2025-03-08T20:45:00.0', '2025-03-08T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (213, '2025-03-09 00:00:00', '2025-03-08T21:00:00.0', '2025-03-08T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (214, '2025-03-09 00:00:00', '2025-03-08T21:15:00.0', '2025-03-08T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (215, '2025-03-09 00:00:00', '2025-03-08T21:30:00.0', '2025-03-08T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (216, '2025-03-09 00:00:00', '2025-03-08T21:45:00.0', '2025-03-08T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (217, '2025-03-09 00:00:00', '2025-03-08T22:00:00.0', '2025-03-08T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (218, '2025-03-09 00:00:00', '2025-03-08T22:15:00.0', '2025-03-08T22:30:00.0', 13, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (219, '2025-03-09 00:00:00', '2025-03-08T22:30:00.0', '2025-03-08T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (220, '2025-03-09 00:00:00', '2025-03-08T22:45:00.0', '2025-03-08T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (221, '2025-03-09 00:00:00', '2025-03-08T23:00:00.0', '2025-03-08T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (222, '2025-03-09 00:00:00', '2025-03-08T23:15:00.0', '2025-03-08T23:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (223, '2025-03-09 00:00:00', '2025-03-08T23:30:00.0', '2025-03-08T23:45:00.0', 11, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (224, '2025-03-09 00:00:00', '2025-03-08T23:45:00.0', '2025-03-09T00:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (225, '2025-03-09 00:00:00', '2025-03-09T00:00:00.0', '2025-03-09T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (226, '2025-03-09 00:00:00', '2025-03-09T00:15:00.0', '2025-03-09T00:30:00.0', 56, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (227, '2025-03-09 00:00:00', '2025-03-09T00:30:00.0', '2025-03-09T00:45:00.0', 152, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (228, '2025-03-09 00:00:00', '2025-03-09T00:45:00.0', '2025-03-09T01:00:00.0', 303, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (229, '2025-03-09 00:00:00', '2025-03-09T01:00:00.0', '2025-03-09T01:15:00.0', 289, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (230, '2025-03-09 00:00:00', '2025-03-09T01:15:00.0', '2025-03-09T01:30:00.0', 232, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (231, '2025-03-09 00:00:00', '2025-03-09T01:30:00.0', '2025-03-09T01:45:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (232, '2025-03-09 00:00:00', '2025-03-09T01:45:00.0', '2025-03-09T02:00:00.0', 1276, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (233, '2025-03-09 00:00:00', '2025-03-09T02:00:00.0', '2025-03-09T02:15:00.0', 1702, '0', 'active', 'True');
INSERT INTO `steps` VALUES (234, '2025-03-09 00:00:00', '2025-03-09T02:15:00.0', '2025-03-09T02:30:00.0', 1310, '0', 'active', 'True');
INSERT INTO `steps` VALUES (235, '2025-03-09 00:00:00', '2025-03-09T02:30:00.0', '2025-03-09T02:45:00.0', 1132, '0', 'active', 'False');
INSERT INTO `steps` VALUES (236, '2025-03-09 00:00:00', '2025-03-09T02:45:00.0', '2025-03-09T03:00:00.0', 1136, '0', 'active', 'True');
INSERT INTO `steps` VALUES (237, '2025-03-09 00:00:00', '2025-03-09T03:00:00.0', '2025-03-09T03:15:00.0', 73, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (238, '2025-03-09 00:00:00', '2025-03-09T03:15:00.0', '2025-03-09T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (239, '2025-03-09 00:00:00', '2025-03-09T03:30:00.0', '2025-03-09T03:45:00.0', 794, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (240, '2025-03-09 00:00:00', '2025-03-09T03:45:00.0', '2025-03-09T04:00:00.0', 1641, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (241, '2025-03-09 00:00:00', '2025-03-09T04:00:00.0', '2025-03-09T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (242, '2025-03-09 00:00:00', '2025-03-09T04:15:00.0', '2025-03-09T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (243, '2025-03-09 00:00:00', '2025-03-09T04:30:00.0', '2025-03-09T04:45:00.0', 6, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (244, '2025-03-09 00:00:00', '2025-03-09T04:45:00.0', '2025-03-09T05:00:00.0', 1046, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (245, '2025-03-09 00:00:00', '2025-03-09T05:00:00.0', '2025-03-09T05:15:00.0', 120, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (246, '2025-03-09 00:00:00', '2025-03-09T05:15:00.0', '2025-03-09T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (247, '2025-03-09 00:00:00', '2025-03-09T05:30:00.0', '2025-03-09T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (248, '2025-03-09 00:00:00', '2025-03-09T05:45:00.0', '2025-03-09T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (249, '2025-03-09 00:00:00', '2025-03-09T06:00:00.0', '2025-03-09T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (250, '2025-03-09 00:00:00', '2025-03-09T06:15:00.0', '2025-03-09T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (251, '2025-03-09 00:00:00', '2025-03-09T06:30:00.0', '2025-03-09T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (252, '2025-03-09 00:00:00', '2025-03-09T06:45:00.0', '2025-03-09T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (253, '2025-03-09 00:00:00', '2025-03-09T07:00:00.0', '2025-03-09T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (254, '2025-03-09 00:00:00', '2025-03-09T07:15:00.0', '2025-03-09T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (255, '2025-03-09 00:00:00', '2025-03-09T07:30:00.0', '2025-03-09T07:45:00.0', 116, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (256, '2025-03-09 00:00:00', '2025-03-09T07:45:00.0', '2025-03-09T08:00:00.0', 431, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (257, '2025-03-09 00:00:00', '2025-03-09T08:00:00.0', '2025-03-09T08:15:00.0', 323, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (258, '2025-03-09 00:00:00', '2025-03-09T08:15:00.0', '2025-03-09T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (259, '2025-03-09 00:00:00', '2025-03-09T08:30:00.0', '2025-03-09T08:45:00.0', 248, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (260, '2025-03-09 00:00:00', '2025-03-09T08:45:00.0', '2025-03-09T09:00:00.0', 242, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (261, '2025-03-09 00:00:00', '2025-03-09T09:00:00.0', '2025-03-09T09:15:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (262, '2025-03-09 00:00:00', '2025-03-09T09:15:00.0', '2025-03-09T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (263, '2025-03-09 00:00:00', '2025-03-09T09:30:00.0', '2025-03-09T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (264, '2025-03-09 00:00:00', '2025-03-09T09:45:00.0', '2025-03-09T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (265, '2025-03-09 00:00:00', '2025-03-09T10:00:00.0', '2025-03-09T10:15:00.0', 95, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (266, '2025-03-09 00:00:00', '2025-03-09T10:15:00.0', '2025-03-09T10:30:00.0', 87, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (267, '2025-03-09 00:00:00', '2025-03-09T10:30:00.0', '2025-03-09T10:45:00.0', 450, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (268, '2025-03-09 00:00:00', '2025-03-09T10:45:00.0', '2025-03-09T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (269, '2025-03-09 00:00:00', '2025-03-09T11:00:00.0', '2025-03-09T11:15:00.0', 38, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (270, '2025-03-09 00:00:00', '2025-03-09T11:15:00.0', '2025-03-09T11:30:00.0', 13, '0', 'generic', 'True');
INSERT INTO `steps` VALUES (271, '2025-03-09 00:00:00', '2025-03-09T11:30:00.0', '2025-03-09T11:45:00.0', 761, '0', 'active', 'True');
INSERT INTO `steps` VALUES (272, '2025-03-09 00:00:00', '2025-03-09T11:45:00.0', '2025-03-09T12:00:00.0', 24, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (273, '2025-03-09 00:00:00', '2025-03-09T12:00:00.0', '2025-03-09T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (274, '2025-03-09 00:00:00', '2025-03-09T12:15:00.0', '2025-03-09T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (275, '2025-03-09 00:00:00', '2025-03-09T12:30:00.0', '2025-03-09T12:45:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (276, '2025-03-09 00:00:00', '2025-03-09T12:45:00.0', '2025-03-09T13:00:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (277, '2025-03-09 00:00:00', '2025-03-09T13:00:00.0', '2025-03-09T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (278, '2025-03-09 00:00:00', '2025-03-09T13:15:00.0', '2025-03-09T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (279, '2025-03-09 00:00:00', '2025-03-09T13:30:00.0', '2025-03-09T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (280, '2025-03-09 00:00:00', '2025-03-09T13:45:00.0', '2025-03-09T14:00:00.0', 489, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (281, '2025-03-09 00:00:00', '2025-03-09T14:00:00.0', '2025-03-09T14:15:00.0', 15, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (282, '2025-03-09 00:00:00', '2025-03-09T14:15:00.0', '2025-03-09T14:30:00.0', 94, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (283, '2025-03-09 00:00:00', '2025-03-09T14:30:00.0', '2025-03-09T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (284, '2025-03-09 00:00:00', '2025-03-09T14:45:00.0', '2025-03-09T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (285, '2025-03-09 00:00:00', '2025-03-09T15:00:00.0', '2025-03-09T15:15:00.0', 391, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (286, '2025-03-09 00:00:00', '2025-03-09T15:15:00.0', '2025-03-09T15:30:00.0', 156, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (287, '2025-03-09 00:00:00', '2025-03-09T15:30:00.0', '2025-03-09T15:45:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (288, '2025-03-09 00:00:00', '2025-03-09T15:45:00.0', '2025-03-09T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (289, '2025-03-10 00:00:00', '2025-03-09T16:00:00.0', '2025-03-09T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (290, '2025-03-10 00:00:00', '2025-03-09T16:15:00.0', '2025-03-09T16:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (291, '2025-03-10 00:00:00', '2025-03-09T16:30:00.0', '2025-03-09T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (292, '2025-03-10 00:00:00', '2025-03-09T16:45:00.0', '2025-03-09T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (293, '2025-03-10 00:00:00', '2025-03-09T17:00:00.0', '2025-03-09T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (294, '2025-03-10 00:00:00', '2025-03-09T17:15:00.0', '2025-03-09T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (295, '2025-03-10 00:00:00', '2025-03-09T17:30:00.0', '2025-03-09T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (296, '2025-03-10 00:00:00', '2025-03-09T17:45:00.0', '2025-03-09T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (297, '2025-03-10 00:00:00', '2025-03-09T18:00:00.0', '2025-03-09T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (298, '2025-03-10 00:00:00', '2025-03-09T18:15:00.0', '2025-03-09T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (299, '2025-03-10 00:00:00', '2025-03-09T18:30:00.0', '2025-03-09T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (300, '2025-03-10 00:00:00', '2025-03-09T18:45:00.0', '2025-03-09T19:00:00.0', 17, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (301, '2025-03-10 00:00:00', '2025-03-09T19:00:00.0', '2025-03-09T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (302, '2025-03-10 00:00:00', '2025-03-09T19:15:00.0', '2025-03-09T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (303, '2025-03-10 00:00:00', '2025-03-09T19:30:00.0', '2025-03-09T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (304, '2025-03-10 00:00:00', '2025-03-09T19:45:00.0', '2025-03-09T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (305, '2025-03-10 00:00:00', '2025-03-09T20:00:00.0', '2025-03-09T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (306, '2025-03-10 00:00:00', '2025-03-09T20:15:00.0', '2025-03-09T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (307, '2025-03-10 00:00:00', '2025-03-09T20:30:00.0', '2025-03-09T20:45:00.0', 13, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (308, '2025-03-10 00:00:00', '2025-03-09T20:45:00.0', '2025-03-09T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (309, '2025-03-10 00:00:00', '2025-03-09T21:00:00.0', '2025-03-09T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (310, '2025-03-10 00:00:00', '2025-03-09T21:15:00.0', '2025-03-09T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (311, '2025-03-10 00:00:00', '2025-03-09T21:30:00.0', '2025-03-09T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (312, '2025-03-10 00:00:00', '2025-03-09T21:45:00.0', '2025-03-09T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (313, '2025-03-10 00:00:00', '2025-03-09T22:00:00.0', '2025-03-09T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (314, '2025-03-10 00:00:00', '2025-03-09T22:15:00.0', '2025-03-09T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (315, '2025-03-10 00:00:00', '2025-03-09T22:30:00.0', '2025-03-09T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (316, '2025-03-10 00:00:00', '2025-03-09T22:45:00.0', '2025-03-09T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (317, '2025-03-10 00:00:00', '2025-03-09T23:00:00.0', '2025-03-09T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (318, '2025-03-10 00:00:00', '2025-03-09T23:15:00.0', '2025-03-09T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (319, '2025-03-10 00:00:00', '2025-03-09T23:30:00.0', '2025-03-09T23:45:00.0', 115, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (320, '2025-03-10 00:00:00', '2025-03-09T23:45:00.0', '2025-03-10T00:00:00.0', 153, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (321, '2025-03-10 00:00:00', '2025-03-10T00:00:00.0', '2025-03-10T00:15:00.0', 155, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (322, '2025-03-10 00:00:00', '2025-03-10T00:15:00.0', '2025-03-10T00:30:00.0', 320, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (323, '2025-03-10 00:00:00', '2025-03-10T00:30:00.0', '2025-03-10T00:45:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (324, '2025-03-10 00:00:00', '2025-03-10T00:45:00.0', '2025-03-10T01:00:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (325, '2025-03-10 00:00:00', '2025-03-10T01:00:00.0', '2025-03-10T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (326, '2025-03-10 00:00:00', '2025-03-10T01:15:00.0', '2025-03-10T01:30:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (327, '2025-03-10 00:00:00', '2025-03-10T01:30:00.0', '2025-03-10T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (328, '2025-03-10 00:00:00', '2025-03-10T01:45:00.0', '2025-03-10T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (329, '2025-03-10 00:00:00', '2025-03-10T02:00:00.0', '2025-03-10T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (330, '2025-03-10 00:00:00', '2025-03-10T02:15:00.0', '2025-03-10T02:30:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (331, '2025-03-10 00:00:00', '2025-03-10T02:30:00.0', '2025-03-10T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (332, '2025-03-10 00:00:00', '2025-03-10T02:45:00.0', '2025-03-10T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (333, '2025-03-10 00:00:00', '2025-03-10T03:00:00.0', '2025-03-10T03:15:00.0', 30, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (334, '2025-03-10 00:00:00', '2025-03-10T03:15:00.0', '2025-03-10T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (335, '2025-03-10 00:00:00', '2025-03-10T03:30:00.0', '2025-03-10T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (336, '2025-03-10 00:00:00', '2025-03-10T03:45:00.0', '2025-03-10T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (337, '2025-03-10 00:00:00', '2025-03-10T04:00:00.0', '2025-03-10T04:15:00.0', 369, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (338, '2025-03-10 00:00:00', '2025-03-10T04:15:00.0', '2025-03-10T04:30:00.0', 208, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (339, '2025-03-10 00:00:00', '2025-03-10T04:30:00.0', '2025-03-10T04:45:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (340, '2025-03-10 00:00:00', '2025-03-10T04:45:00.0', '2025-03-10T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (341, '2025-03-10 00:00:00', '2025-03-10T05:00:00.0', '2025-03-10T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (342, '2025-03-10 00:00:00', '2025-03-10T05:15:00.0', '2025-03-10T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (343, '2025-03-10 00:00:00', '2025-03-10T05:30:00.0', '2025-03-10T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (344, '2025-03-10 00:00:00', '2025-03-10T05:45:00.0', '2025-03-10T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (345, '2025-03-10 00:00:00', '2025-03-10T06:00:00.0', '2025-03-10T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (346, '2025-03-10 00:00:00', '2025-03-10T06:15:00.0', '2025-03-10T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (347, '2025-03-10 00:00:00', '2025-03-10T06:30:00.0', '2025-03-10T06:45:00.0', 550, '0', 'active', 'False');
INSERT INTO `steps` VALUES (348, '2025-03-10 00:00:00', '2025-03-10T06:45:00.0', '2025-03-10T07:00:00.0', 36, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (349, '2025-03-10 00:00:00', '2025-03-10T07:00:00.0', '2025-03-10T07:15:00.0', 655, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (350, '2025-03-10 00:00:00', '2025-03-10T07:15:00.0', '2025-03-10T07:30:00.0', 510, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (351, '2025-03-10 00:00:00', '2025-03-10T07:30:00.0', '2025-03-10T07:45:00.0', 202, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (352, '2025-03-10 00:00:00', '2025-03-10T07:45:00.0', '2025-03-10T08:00:00.0', 262, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (353, '2025-03-10 00:00:00', '2025-03-10T08:00:00.0', '2025-03-10T08:15:00.0', 247, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (354, '2025-03-10 00:00:00', '2025-03-10T08:15:00.0', '2025-03-10T08:30:00.0', 360, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (355, '2025-03-10 00:00:00', '2025-03-10T08:30:00.0', '2025-03-10T08:45:00.0', 510, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (356, '2025-03-10 00:00:00', '2025-03-10T08:45:00.0', '2025-03-10T09:00:00.0', 213, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (357, '2025-03-10 00:00:00', '2025-03-10T09:00:00.0', '2025-03-10T09:15:00.0', 303, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (358, '2025-03-10 00:00:00', '2025-03-10T09:15:00.0', '2025-03-10T09:30:00.0', 153, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (359, '2025-03-10 00:00:00', '2025-03-10T09:30:00.0', '2025-03-10T09:45:00.0', 270, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (360, '2025-03-10 00:00:00', '2025-03-10T09:45:00.0', '2025-03-10T10:00:00.0', 220, '0', 'active', 'False');
INSERT INTO `steps` VALUES (361, '2025-03-10 00:00:00', '2025-03-10T10:00:00.0', '2025-03-10T10:15:00.0', 54, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (362, '2025-03-10 00:00:00', '2025-03-10T10:15:00.0', '2025-03-10T10:30:00.0', 337, '0', 'active', 'False');
INSERT INTO `steps` VALUES (363, '2025-03-10 00:00:00', '2025-03-10T10:30:00.0', '2025-03-10T10:45:00.0', 273, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (364, '2025-03-10 00:00:00', '2025-03-10T10:45:00.0', '2025-03-10T11:00:00.0', 233, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (365, '2025-03-10 00:00:00', '2025-03-10T11:00:00.0', '2025-03-10T11:15:00.0', 61, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (366, '2025-03-10 00:00:00', '2025-03-10T11:15:00.0', '2025-03-10T11:30:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (367, '2025-03-10 00:00:00', '2025-03-10T11:30:00.0', '2025-03-10T11:45:00.0', 131, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (368, '2025-03-10 00:00:00', '2025-03-10T11:45:00.0', '2025-03-10T12:00:00.0', 169, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (369, '2025-03-10 00:00:00', '2025-03-10T12:00:00.0', '2025-03-10T12:15:00.0', 66, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (370, '2025-03-10 00:00:00', '2025-03-10T12:15:00.0', '2025-03-10T12:30:00.0', 68, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (371, '2025-03-10 00:00:00', '2025-03-10T12:30:00.0', '2025-03-10T12:45:00.0', 758, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (372, '2025-03-10 00:00:00', '2025-03-10T12:45:00.0', '2025-03-10T13:00:00.0', 669, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (373, '2025-03-10 00:00:00', '2025-03-10T13:00:00.0', '2025-03-10T13:15:00.0', 279, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (374, '2025-03-10 00:00:00', '2025-03-10T13:15:00.0', '2025-03-10T13:30:00.0', 207, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (375, '2025-03-10 00:00:00', '2025-03-10T13:30:00.0', '2025-03-10T13:45:00.0', 26, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (376, '2025-03-10 00:00:00', '2025-03-10T13:45:00.0', '2025-03-10T14:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (377, '2025-03-10 00:00:00', '2025-03-10T14:00:00.0', '2025-03-10T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (378, '2025-03-10 00:00:00', '2025-03-10T14:15:00.0', '2025-03-10T14:30:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (379, '2025-03-10 00:00:00', '2025-03-10T14:30:00.0', '2025-03-10T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (380, '2025-03-10 00:00:00', '2025-03-10T14:45:00.0', '2025-03-10T15:00:00.0', 40, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (381, '2025-03-10 00:00:00', '2025-03-10T15:00:00.0', '2025-03-10T15:15:00.0', 138, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (382, '2025-03-10 00:00:00', '2025-03-10T15:15:00.0', '2025-03-10T15:30:00.0', 123, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (383, '2025-03-10 00:00:00', '2025-03-10T15:30:00.0', '2025-03-10T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (384, '2025-03-10 00:00:00', '2025-03-10T15:45:00.0', '2025-03-10T16:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (385, '2025-03-11 00:00:00', '2025-03-10T16:00:00.0', '2025-03-10T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (386, '2025-03-11 00:00:00', '2025-03-10T16:15:00.0', '2025-03-10T16:30:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (387, '2025-03-11 00:00:00', '2025-03-10T16:30:00.0', '2025-03-10T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (388, '2025-03-11 00:00:00', '2025-03-10T16:45:00.0', '2025-03-10T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (389, '2025-03-11 00:00:00', '2025-03-10T17:00:00.0', '2025-03-10T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (390, '2025-03-11 00:00:00', '2025-03-10T17:15:00.0', '2025-03-10T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (391, '2025-03-11 00:00:00', '2025-03-10T17:30:00.0', '2025-03-10T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (392, '2025-03-11 00:00:00', '2025-03-10T17:45:00.0', '2025-03-10T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (393, '2025-03-11 00:00:00', '2025-03-10T18:00:00.0', '2025-03-10T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (394, '2025-03-11 00:00:00', '2025-03-10T18:15:00.0', '2025-03-10T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (395, '2025-03-11 00:00:00', '2025-03-10T18:30:00.0', '2025-03-10T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (396, '2025-03-11 00:00:00', '2025-03-10T18:45:00.0', '2025-03-10T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (397, '2025-03-11 00:00:00', '2025-03-10T19:00:00.0', '2025-03-10T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (398, '2025-03-11 00:00:00', '2025-03-10T19:15:00.0', '2025-03-10T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (399, '2025-03-11 00:00:00', '2025-03-10T19:30:00.0', '2025-03-10T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (400, '2025-03-11 00:00:00', '2025-03-10T19:45:00.0', '2025-03-10T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (401, '2025-03-11 00:00:00', '2025-03-10T20:00:00.0', '2025-03-10T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (402, '2025-03-11 00:00:00', '2025-03-10T20:15:00.0', '2025-03-10T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (403, '2025-03-11 00:00:00', '2025-03-10T20:30:00.0', '2025-03-10T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (404, '2025-03-11 00:00:00', '2025-03-10T20:45:00.0', '2025-03-10T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (405, '2025-03-11 00:00:00', '2025-03-10T21:00:00.0', '2025-03-10T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (406, '2025-03-11 00:00:00', '2025-03-10T21:15:00.0', '2025-03-10T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (407, '2025-03-11 00:00:00', '2025-03-10T21:30:00.0', '2025-03-10T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (408, '2025-03-11 00:00:00', '2025-03-10T21:45:00.0', '2025-03-10T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (409, '2025-03-11 00:00:00', '2025-03-10T22:00:00.0', '2025-03-10T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (410, '2025-03-11 00:00:00', '2025-03-10T22:15:00.0', '2025-03-10T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (411, '2025-03-11 00:00:00', '2025-03-10T22:30:00.0', '2025-03-10T22:45:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (412, '2025-03-11 00:00:00', '2025-03-10T22:45:00.0', '2025-03-10T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (413, '2025-03-11 00:00:00', '2025-03-10T23:00:00.0', '2025-03-10T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (414, '2025-03-11 00:00:00', '2025-03-10T23:15:00.0', '2025-03-10T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (415, '2025-03-11 00:00:00', '2025-03-10T23:30:00.0', '2025-03-10T23:45:00.0', 96, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (416, '2025-03-11 00:00:00', '2025-03-10T23:45:00.0', '2025-03-11T00:00:00.0', 170, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (417, '2025-03-11 00:00:00', '2025-03-11T00:00:00.0', '2025-03-11T00:15:00.0', 293, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (418, '2025-03-11 00:00:00', '2025-03-11T00:15:00.0', '2025-03-11T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (419, '2025-03-11 00:00:00', '2025-03-11T00:30:00.0', '2025-03-11T00:45:00.0', 185, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (420, '2025-03-11 00:00:00', '2025-03-11T00:45:00.0', '2025-03-11T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (421, '2025-03-11 00:00:00', '2025-03-11T01:00:00.0', '2025-03-11T01:15:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (422, '2025-03-11 00:00:00', '2025-03-11T01:15:00.0', '2025-03-11T01:30:00.0', 139, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (423, '2025-03-11 00:00:00', '2025-03-11T01:30:00.0', '2025-03-11T01:45:00.0', 52, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (424, '2025-03-11 00:00:00', '2025-03-11T01:45:00.0', '2025-03-11T02:00:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (425, '2025-03-11 00:00:00', '2025-03-11T02:00:00.0', '2025-03-11T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (426, '2025-03-11 00:00:00', '2025-03-11T02:15:00.0', '2025-03-11T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (427, '2025-03-11 00:00:00', '2025-03-11T02:30:00.0', '2025-03-11T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (428, '2025-03-11 00:00:00', '2025-03-11T02:45:00.0', '2025-03-11T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (429, '2025-03-11 00:00:00', '2025-03-11T03:00:00.0', '2025-03-11T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (430, '2025-03-11 00:00:00', '2025-03-11T03:15:00.0', '2025-03-11T03:30:00.0', 131, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (431, '2025-03-11 00:00:00', '2025-03-11T03:30:00.0', '2025-03-11T03:45:00.0', 81, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (432, '2025-03-11 00:00:00', '2025-03-11T03:45:00.0', '2025-03-11T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (433, '2025-03-11 00:00:00', '2025-03-11T04:00:00.0', '2025-03-11T04:15:00.0', 317, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (434, '2025-03-11 00:00:00', '2025-03-11T04:15:00.0', '2025-03-11T04:30:00.0', 215, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (435, '2025-03-11 00:00:00', '2025-03-11T04:30:00.0', '2025-03-11T04:45:00.0', 121, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (436, '2025-03-11 00:00:00', '2025-03-11T04:45:00.0', '2025-03-11T05:00:00.0', 453, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (437, '2025-03-11 00:00:00', '2025-03-11T05:00:00.0', '2025-03-11T05:15:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (438, '2025-03-11 00:00:00', '2025-03-11T05:15:00.0', '2025-03-11T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (439, '2025-03-11 00:00:00', '2025-03-11T05:30:00.0', '2025-03-11T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (440, '2025-03-11 00:00:00', '2025-03-11T05:45:00.0', '2025-03-11T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (441, '2025-03-11 00:00:00', '2025-03-11T06:00:00.0', '2025-03-11T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (442, '2025-03-11 00:00:00', '2025-03-11T06:15:00.0', '2025-03-11T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (443, '2025-03-11 00:00:00', '2025-03-11T06:30:00.0', '2025-03-11T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (444, '2025-03-11 00:00:00', '2025-03-11T06:45:00.0', '2025-03-11T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (445, '2025-03-11 00:00:00', '2025-03-11T07:00:00.0', '2025-03-11T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (446, '2025-03-11 00:00:00', '2025-03-11T07:15:00.0', '2025-03-11T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (447, '2025-03-11 00:00:00', '2025-03-11T07:30:00.0', '2025-03-11T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (448, '2025-03-11 00:00:00', '2025-03-11T07:45:00.0', '2025-03-11T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (449, '2025-03-11 00:00:00', '2025-03-11T08:00:00.0', '2025-03-11T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (450, '2025-03-11 00:00:00', '2025-03-11T08:15:00.0', '2025-03-11T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (451, '2025-03-11 00:00:00', '2025-03-11T08:30:00.0', '2025-03-11T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (452, '2025-03-11 00:00:00', '2025-03-11T08:45:00.0', '2025-03-11T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (453, '2025-03-11 00:00:00', '2025-03-11T09:00:00.0', '2025-03-11T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (454, '2025-03-11 00:00:00', '2025-03-11T09:15:00.0', '2025-03-11T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (455, '2025-03-11 00:00:00', '2025-03-11T09:30:00.0', '2025-03-11T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (456, '2025-03-11 00:00:00', '2025-03-11T09:45:00.0', '2025-03-11T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (457, '2025-03-11 00:00:00', '2025-03-11T10:00:00.0', '2025-03-11T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (458, '2025-03-11 00:00:00', '2025-03-11T10:15:00.0', '2025-03-11T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (459, '2025-03-11 00:00:00', '2025-03-11T10:30:00.0', '2025-03-11T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (460, '2025-03-11 00:00:00', '2025-03-11T10:45:00.0', '2025-03-11T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (461, '2025-03-11 00:00:00', '2025-03-11T11:00:00.0', '2025-03-11T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (462, '2025-03-11 00:00:00', '2025-03-11T11:15:00.0', '2025-03-11T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (463, '2025-03-11 00:00:00', '2025-03-11T11:30:00.0', '2025-03-11T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (464, '2025-03-11 00:00:00', '2025-03-11T11:45:00.0', '2025-03-11T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (465, '2025-03-11 00:00:00', '2025-03-11T12:00:00.0', '2025-03-11T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (466, '2025-03-11 00:00:00', '2025-03-11T12:15:00.0', '2025-03-11T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (467, '2025-03-11 00:00:00', '2025-03-11T12:30:00.0', '2025-03-11T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (468, '2025-03-11 00:00:00', '2025-03-11T12:45:00.0', '2025-03-11T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (469, '2025-03-11 00:00:00', '2025-03-11T13:00:00.0', '2025-03-11T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (470, '2025-03-11 00:00:00', '2025-03-11T13:15:00.0', '2025-03-11T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (471, '2025-03-11 00:00:00', '2025-03-11T13:30:00.0', '2025-03-11T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (472, '2025-03-11 00:00:00', '2025-03-11T13:45:00.0', '2025-03-11T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (473, '2025-03-11 00:00:00', '2025-03-11T14:00:00.0', '2025-03-11T14:15:00.0', 376, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (474, '2025-03-11 00:00:00', '2025-03-11T14:15:00.0', '2025-03-11T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (475, '2025-03-11 00:00:00', '2025-03-11T14:30:00.0', '2025-03-11T14:45:00.0', 207, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (476, '2025-03-11 00:00:00', '2025-03-11T14:45:00.0', '2025-03-11T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (477, '2025-03-11 00:00:00', '2025-03-11T15:00:00.0', '2025-03-11T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (478, '2025-03-11 00:00:00', '2025-03-11T15:15:00.0', '2025-03-11T15:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (479, '2025-03-11 00:00:00', '2025-03-11T15:30:00.0', '2025-03-11T15:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (480, '2025-03-11 00:00:00', '2025-03-11T15:45:00.0', '2025-03-11T16:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (481, '2025-03-12 00:00:00', '2025-03-11T16:00:00.0', '2025-03-11T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (482, '2025-03-12 00:00:00', '2025-03-11T16:15:00.0', '2025-03-11T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (483, '2025-03-12 00:00:00', '2025-03-11T16:30:00.0', '2025-03-11T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (484, '2025-03-12 00:00:00', '2025-03-11T16:45:00.0', '2025-03-11T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (485, '2025-03-12 00:00:00', '2025-03-11T17:00:00.0', '2025-03-11T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (486, '2025-03-12 00:00:00', '2025-03-11T17:15:00.0', '2025-03-11T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (487, '2025-03-12 00:00:00', '2025-03-11T17:30:00.0', '2025-03-11T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (488, '2025-03-12 00:00:00', '2025-03-11T17:45:00.0', '2025-03-11T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (489, '2025-03-12 00:00:00', '2025-03-11T18:00:00.0', '2025-03-11T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (490, '2025-03-12 00:00:00', '2025-03-11T18:15:00.0', '2025-03-11T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (491, '2025-03-12 00:00:00', '2025-03-11T18:30:00.0', '2025-03-11T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (492, '2025-03-12 00:00:00', '2025-03-11T18:45:00.0', '2025-03-11T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (493, '2025-03-12 00:00:00', '2025-03-11T19:00:00.0', '2025-03-11T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (494, '2025-03-12 00:00:00', '2025-03-11T19:15:00.0', '2025-03-11T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (495, '2025-03-12 00:00:00', '2025-03-11T19:30:00.0', '2025-03-11T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (496, '2025-03-12 00:00:00', '2025-03-11T19:45:00.0', '2025-03-11T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (497, '2025-03-12 00:00:00', '2025-03-11T20:00:00.0', '2025-03-11T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (498, '2025-03-12 00:00:00', '2025-03-11T20:15:00.0', '2025-03-11T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (499, '2025-03-12 00:00:00', '2025-03-11T20:30:00.0', '2025-03-11T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (500, '2025-03-12 00:00:00', '2025-03-11T20:45:00.0', '2025-03-11T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (501, '2025-03-12 00:00:00', '2025-03-11T21:00:00.0', '2025-03-11T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (502, '2025-03-12 00:00:00', '2025-03-11T21:15:00.0', '2025-03-11T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (503, '2025-03-12 00:00:00', '2025-03-11T21:30:00.0', '2025-03-11T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (504, '2025-03-12 00:00:00', '2025-03-11T21:45:00.0', '2025-03-11T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (505, '2025-03-12 00:00:00', '2025-03-11T22:00:00.0', '2025-03-11T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (506, '2025-03-12 00:00:00', '2025-03-11T22:15:00.0', '2025-03-11T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (507, '2025-03-12 00:00:00', '2025-03-11T22:30:00.0', '2025-03-11T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (508, '2025-03-12 00:00:00', '2025-03-11T22:45:00.0', '2025-03-11T23:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (509, '2025-03-12 00:00:00', '2025-03-11T23:00:00.0', '2025-03-11T23:15:00.0', 117, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (510, '2025-03-12 00:00:00', '2025-03-11T23:15:00.0', '2025-03-11T23:30:00.0', 158, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (511, '2025-03-12 00:00:00', '2025-03-11T23:30:00.0', '2025-03-11T23:45:00.0', 160, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (512, '2025-03-12 00:00:00', '2025-03-11T23:45:00.0', '2025-03-12T00:00:00.0', 86, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (513, '2025-03-12 00:00:00', '2025-03-12T00:00:00.0', '2025-03-12T00:15:00.0', 373, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (514, '2025-03-12 00:00:00', '2025-03-12T00:15:00.0', '2025-03-12T00:30:00.0', 135, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (515, '2025-03-12 00:00:00', '2025-03-12T00:30:00.0', '2025-03-12T00:45:00.0', 88, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (516, '2025-03-12 00:00:00', '2025-03-12T00:45:00.0', '2025-03-12T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (517, '2025-03-12 00:00:00', '2025-03-12T01:00:00.0', '2025-03-12T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (518, '2025-03-12 00:00:00', '2025-03-12T01:15:00.0', '2025-03-12T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (519, '2025-03-12 00:00:00', '2025-03-12T01:30:00.0', '2025-03-12T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (520, '2025-03-12 00:00:00', '2025-03-12T01:45:00.0', '2025-03-12T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (521, '2025-03-12 00:00:00', '2025-03-12T02:00:00.0', '2025-03-12T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (522, '2025-03-12 00:00:00', '2025-03-12T02:15:00.0', '2025-03-12T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (523, '2025-03-12 00:00:00', '2025-03-12T02:30:00.0', '2025-03-12T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (524, '2025-03-12 00:00:00', '2025-03-12T02:45:00.0', '2025-03-12T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (525, '2025-03-12 00:00:00', '2025-03-12T03:00:00.0', '2025-03-12T03:15:00.0', 326, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (526, '2025-03-12 00:00:00', '2025-03-12T03:15:00.0', '2025-03-12T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (527, '2025-03-12 00:00:00', '2025-03-12T03:30:00.0', '2025-03-12T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (528, '2025-03-12 00:00:00', '2025-03-12T03:45:00.0', '2025-03-12T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (529, '2025-03-12 00:00:00', '2025-03-12T04:00:00.0', '2025-03-12T04:15:00.0', 368, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (530, '2025-03-12 00:00:00', '2025-03-12T04:15:00.0', '2025-03-12T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (531, '2025-03-12 00:00:00', '2025-03-12T04:30:00.0', '2025-03-12T04:45:00.0', 515, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (532, '2025-03-12 00:00:00', '2025-03-12T04:45:00.0', '2025-03-12T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (533, '2025-03-12 00:00:00', '2025-03-12T05:00:00.0', '2025-03-12T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (534, '2025-03-12 00:00:00', '2025-03-12T05:15:00.0', '2025-03-12T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (535, '2025-03-12 00:00:00', '2025-03-12T05:30:00.0', '2025-03-12T05:45:00.0', 22, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (536, '2025-03-12 00:00:00', '2025-03-12T05:45:00.0', '2025-03-12T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (537, '2025-03-12 00:00:00', '2025-03-12T06:00:00.0', '2025-03-12T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (538, '2025-03-12 00:00:00', '2025-03-12T06:15:00.0', '2025-03-12T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (539, '2025-03-12 00:00:00', '2025-03-12T06:30:00.0', '2025-03-12T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (540, '2025-03-12 00:00:00', '2025-03-12T06:45:00.0', '2025-03-12T07:00:00.0', 530, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (541, '2025-03-12 00:00:00', '2025-03-12T07:00:00.0', '2025-03-12T07:15:00.0', 411, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (542, '2025-03-12 00:00:00', '2025-03-12T07:15:00.0', '2025-03-12T07:30:00.0', 64, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (543, '2025-03-12 00:00:00', '2025-03-12T07:30:00.0', '2025-03-12T07:45:00.0', 436, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (544, '2025-03-12 00:00:00', '2025-03-12T07:45:00.0', '2025-03-12T08:00:00.0', 604, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (545, '2025-03-12 00:00:00', '2025-03-12T08:00:00.0', '2025-03-12T08:15:00.0', 62, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (546, '2025-03-12 00:00:00', '2025-03-12T08:15:00.0', '2025-03-12T08:30:00.0', 257, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (547, '2025-03-12 00:00:00', '2025-03-12T08:30:00.0', '2025-03-12T08:45:00.0', 91, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (548, '2025-03-12 00:00:00', '2025-03-12T08:45:00.0', '2025-03-12T09:00:00.0', 387, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (549, '2025-03-12 00:00:00', '2025-03-12T09:00:00.0', '2025-03-12T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (550, '2025-03-12 00:00:00', '2025-03-12T09:15:00.0', '2025-03-12T09:30:00.0', 8, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (551, '2025-03-12 00:00:00', '2025-03-12T09:30:00.0', '2025-03-12T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (552, '2025-03-12 00:00:00', '2025-03-12T09:45:00.0', '2025-03-12T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (553, '2025-03-12 00:00:00', '2025-03-12T10:00:00.0', '2025-03-12T10:15:00.0', 938, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (554, '2025-03-12 00:00:00', '2025-03-12T10:15:00.0', '2025-03-12T10:30:00.0', 568, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (555, '2025-03-12 00:00:00', '2025-03-12T10:30:00.0', '2025-03-12T10:45:00.0', 1344, '0', 'active', 'False');
INSERT INTO `steps` VALUES (556, '2025-03-12 00:00:00', '2025-03-12T10:45:00.0', '2025-03-12T11:00:00.0', 24, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (557, '2025-03-12 00:00:00', '2025-03-12T11:00:00.0', '2025-03-12T11:15:00.0', 1054, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (558, '2025-03-12 00:00:00', '2025-03-12T11:15:00.0', '2025-03-12T11:30:00.0', 1152, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (559, '2025-03-12 00:00:00', '2025-03-12T11:30:00.0', '2025-03-12T11:45:00.0', 454, '0', 'active', 'False');
INSERT INTO `steps` VALUES (560, '2025-03-12 00:00:00', '2025-03-12T11:45:00.0', '2025-03-12T12:00:00.0', 27, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (561, '2025-03-12 00:00:00', '2025-03-12T12:00:00.0', '2025-03-12T12:15:00.0', 331, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (562, '2025-03-12 00:00:00', '2025-03-12T12:15:00.0', '2025-03-12T12:30:00.0', 251, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (563, '2025-03-12 00:00:00', '2025-03-12T12:30:00.0', '2025-03-12T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (564, '2025-03-12 00:00:00', '2025-03-12T12:45:00.0', '2025-03-12T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (565, '2025-03-12 00:00:00', '2025-03-12T13:00:00.0', '2025-03-12T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (566, '2025-03-12 00:00:00', '2025-03-12T13:15:00.0', '2025-03-12T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (567, '2025-03-12 00:00:00', '2025-03-12T13:30:00.0', '2025-03-12T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (568, '2025-03-12 00:00:00', '2025-03-12T13:45:00.0', '2025-03-12T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (569, '2025-03-12 00:00:00', '2025-03-12T14:00:00.0', '2025-03-12T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (570, '2025-03-12 00:00:00', '2025-03-12T14:15:00.0', '2025-03-12T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (571, '2025-03-12 00:00:00', '2025-03-12T14:30:00.0', '2025-03-12T14:45:00.0', 349, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (572, '2025-03-12 00:00:00', '2025-03-12T14:45:00.0', '2025-03-12T15:00:00.0', 99, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (573, '2025-03-12 00:00:00', '2025-03-12T15:00:00.0', '2025-03-12T15:15:00.0', 103, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (574, '2025-03-12 00:00:00', '2025-03-12T15:15:00.0', '2025-03-12T15:30:00.0', 275, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (575, '2025-03-12 00:00:00', '2025-03-12T15:30:00.0', '2025-03-12T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (576, '2025-03-12 00:00:00', '2025-03-12T15:45:00.0', '2025-03-12T16:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (577, '2025-03-13 00:00:00', '2025-03-12T16:00:00.0', '2025-03-12T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (578, '2025-03-13 00:00:00', '2025-03-12T16:15:00.0', '2025-03-12T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (579, '2025-03-13 00:00:00', '2025-03-12T16:30:00.0', '2025-03-12T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (580, '2025-03-13 00:00:00', '2025-03-12T16:45:00.0', '2025-03-12T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (581, '2025-03-13 00:00:00', '2025-03-12T17:00:00.0', '2025-03-12T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (582, '2025-03-13 00:00:00', '2025-03-12T17:15:00.0', '2025-03-12T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (583, '2025-03-13 00:00:00', '2025-03-12T17:30:00.0', '2025-03-12T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (584, '2025-03-13 00:00:00', '2025-03-12T17:45:00.0', '2025-03-12T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (585, '2025-03-13 00:00:00', '2025-03-12T18:00:00.0', '2025-03-12T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (586, '2025-03-13 00:00:00', '2025-03-12T18:15:00.0', '2025-03-12T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (587, '2025-03-13 00:00:00', '2025-03-12T18:30:00.0', '2025-03-12T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (588, '2025-03-13 00:00:00', '2025-03-12T18:45:00.0', '2025-03-12T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (589, '2025-03-13 00:00:00', '2025-03-12T19:00:00.0', '2025-03-12T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (590, '2025-03-13 00:00:00', '2025-03-12T19:15:00.0', '2025-03-12T19:30:00.0', 29, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (591, '2025-03-13 00:00:00', '2025-03-12T19:30:00.0', '2025-03-12T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (592, '2025-03-13 00:00:00', '2025-03-12T19:45:00.0', '2025-03-12T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (593, '2025-03-13 00:00:00', '2025-03-12T20:00:00.0', '2025-03-12T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (594, '2025-03-13 00:00:00', '2025-03-12T20:15:00.0', '2025-03-12T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (595, '2025-03-13 00:00:00', '2025-03-12T20:30:00.0', '2025-03-12T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (596, '2025-03-13 00:00:00', '2025-03-12T20:45:00.0', '2025-03-12T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (597, '2025-03-13 00:00:00', '2025-03-12T21:00:00.0', '2025-03-12T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (598, '2025-03-13 00:00:00', '2025-03-12T21:15:00.0', '2025-03-12T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (599, '2025-03-13 00:00:00', '2025-03-12T21:30:00.0', '2025-03-12T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (600, '2025-03-13 00:00:00', '2025-03-12T21:45:00.0', '2025-03-12T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (601, '2025-03-13 00:00:00', '2025-03-12T22:00:00.0', '2025-03-12T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (602, '2025-03-13 00:00:00', '2025-03-12T22:15:00.0', '2025-03-12T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (603, '2025-03-13 00:00:00', '2025-03-12T22:30:00.0', '2025-03-12T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (604, '2025-03-13 00:00:00', '2025-03-12T22:45:00.0', '2025-03-12T23:00:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (605, '2025-03-13 00:00:00', '2025-03-12T23:00:00.0', '2025-03-12T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (606, '2025-03-13 00:00:00', '2025-03-12T23:15:00.0', '2025-03-12T23:30:00.0', 173, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (607, '2025-03-13 00:00:00', '2025-03-12T23:30:00.0', '2025-03-12T23:45:00.0', 390, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (608, '2025-03-13 00:00:00', '2025-03-12T23:45:00.0', '2025-03-13T00:00:00.0', 519, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (609, '2025-03-13 00:00:00', '2025-03-13T00:00:00.0', '2025-03-13T00:15:00.0', 513, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (610, '2025-03-13 00:00:00', '2025-03-13T00:15:00.0', '2025-03-13T00:30:00.0', 250, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (611, '2025-03-13 00:00:00', '2025-03-13T00:30:00.0', '2025-03-13T00:45:00.0', 663, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (612, '2025-03-13 00:00:00', '2025-03-13T00:45:00.0', '2025-03-13T01:00:00.0', 40, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (613, '2025-03-13 00:00:00', '2025-03-13T01:00:00.0', '2025-03-13T01:15:00.0', 70, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (614, '2025-03-13 00:00:00', '2025-03-13T01:15:00.0', '2025-03-13T01:30:00.0', 137, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (615, '2025-03-13 00:00:00', '2025-03-13T01:30:00.0', '2025-03-13T01:45:00.0', 35, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (616, '2025-03-13 00:00:00', '2025-03-13T01:45:00.0', '2025-03-13T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (617, '2025-03-13 00:00:00', '2025-03-13T02:00:00.0', '2025-03-13T02:15:00.0', 129, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (618, '2025-03-13 00:00:00', '2025-03-13T02:15:00.0', '2025-03-13T02:30:00.0', 265, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (619, '2025-03-13 00:00:00', '2025-03-13T02:30:00.0', '2025-03-13T02:45:00.0', 798, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (620, '2025-03-13 00:00:00', '2025-03-13T02:45:00.0', '2025-03-13T03:00:00.0', 392, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (621, '2025-03-13 00:00:00', '2025-03-13T03:00:00.0', '2025-03-13T03:15:00.0', 490, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (622, '2025-03-13 00:00:00', '2025-03-13T03:15:00.0', '2025-03-13T03:30:00.0', 623, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (623, '2025-03-13 00:00:00', '2025-03-13T03:30:00.0', '2025-03-13T03:45:00.0', 185, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (624, '2025-03-13 00:00:00', '2025-03-13T03:45:00.0', '2025-03-13T04:00:00.0', 56, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (625, '2025-03-13 00:00:00', '2025-03-13T04:00:00.0', '2025-03-13T04:15:00.0', 68, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (626, '2025-03-13 00:00:00', '2025-03-13T04:15:00.0', '2025-03-13T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (627, '2025-03-13 00:00:00', '2025-03-13T04:30:00.0', '2025-03-13T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (628, '2025-03-13 00:00:00', '2025-03-13T04:45:00.0', '2025-03-13T05:00:00.0', 58, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (629, '2025-03-13 00:00:00', '2025-03-13T05:00:00.0', '2025-03-13T05:15:00.0', 61, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (630, '2025-03-13 00:00:00', '2025-03-13T05:15:00.0', '2025-03-13T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (631, '2025-03-13 00:00:00', '2025-03-13T05:30:00.0', '2025-03-13T05:45:00.0', 107, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (632, '2025-03-13 00:00:00', '2025-03-13T05:45:00.0', '2025-03-13T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (633, '2025-03-13 00:00:00', '2025-03-13T06:00:00.0', '2025-03-13T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (634, '2025-03-13 00:00:00', '2025-03-13T06:15:00.0', '2025-03-13T06:30:00.0', 72, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (635, '2025-03-13 00:00:00', '2025-03-13T06:30:00.0', '2025-03-13T06:45:00.0', 436, '0', 'active', 'False');
INSERT INTO `steps` VALUES (636, '2025-03-13 00:00:00', '2025-03-13T06:45:00.0', '2025-03-13T07:00:00.0', 50, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (637, '2025-03-13 00:00:00', '2025-03-13T07:00:00.0', '2025-03-13T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (638, '2025-03-13 00:00:00', '2025-03-13T07:15:00.0', '2025-03-13T07:30:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (639, '2025-03-13 00:00:00', '2025-03-13T07:30:00.0', '2025-03-13T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (640, '2025-03-13 00:00:00', '2025-03-13T07:45:00.0', '2025-03-13T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (641, '2025-03-13 00:00:00', '2025-03-13T08:00:00.0', '2025-03-13T08:15:00.0', 257, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (642, '2025-03-13 00:00:00', '2025-03-13T08:15:00.0', '2025-03-13T08:30:00.0', 451, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (643, '2025-03-13 00:00:00', '2025-03-13T08:30:00.0', '2025-03-13T08:45:00.0', 85, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (644, '2025-03-13 00:00:00', '2025-03-13T08:45:00.0', '2025-03-13T09:00:00.0', 37, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (645, '2025-03-13 00:00:00', '2025-03-13T09:00:00.0', '2025-03-13T09:15:00.0', 120, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (646, '2025-03-13 00:00:00', '2025-03-13T09:15:00.0', '2025-03-13T09:30:00.0', 63, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (647, '2025-03-13 00:00:00', '2025-03-13T09:30:00.0', '2025-03-13T09:45:00.0', 109, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (648, '2025-03-13 00:00:00', '2025-03-13T09:45:00.0', '2025-03-13T10:00:00.0', 54, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (649, '2025-03-13 00:00:00', '2025-03-13T10:00:00.0', '2025-03-13T10:15:00.0', 98, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (650, '2025-03-13 00:00:00', '2025-03-13T10:15:00.0', '2025-03-13T10:30:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (651, '2025-03-13 00:00:00', '2025-03-13T10:30:00.0', '2025-03-13T10:45:00.0', 138, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (652, '2025-03-13 00:00:00', '2025-03-13T10:45:00.0', '2025-03-13T11:00:00.0', 307, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (653, '2025-03-13 00:00:00', '2025-03-13T11:00:00.0', '2025-03-13T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (654, '2025-03-13 00:00:00', '2025-03-13T11:15:00.0', '2025-03-13T11:30:00.0', 95, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (655, '2025-03-13 00:00:00', '2025-03-13T11:30:00.0', '2025-03-13T11:45:00.0', 87, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (656, '2025-03-13 00:00:00', '2025-03-13T11:45:00.0', '2025-03-13T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (657, '2025-03-13 00:00:00', '2025-03-13T12:00:00.0', '2025-03-13T12:15:00.0', 330, '0', 'active', 'False');
INSERT INTO `steps` VALUES (658, '2025-03-13 00:00:00', '2025-03-13T12:15:00.0', '2025-03-13T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (659, '2025-03-13 00:00:00', '2025-03-13T12:30:00.0', '2025-03-13T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (660, '2025-03-13 00:00:00', '2025-03-13T12:45:00.0', '2025-03-13T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (661, '2025-03-13 00:00:00', '2025-03-13T13:00:00.0', '2025-03-13T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (662, '2025-03-13 00:00:00', '2025-03-13T13:15:00.0', '2025-03-13T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (663, '2025-03-13 00:00:00', '2025-03-13T13:30:00.0', '2025-03-13T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (664, '2025-03-13 00:00:00', '2025-03-13T13:45:00.0', '2025-03-13T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (665, '2025-03-13 00:00:00', '2025-03-13T14:00:00.0', '2025-03-13T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (666, '2025-03-13 00:00:00', '2025-03-13T14:15:00.0', '2025-03-13T14:30:00.0', 358, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (667, '2025-03-13 00:00:00', '2025-03-13T14:30:00.0', '2025-03-13T14:45:00.0', 258, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (668, '2025-03-13 00:00:00', '2025-03-13T14:45:00.0', '2025-03-13T15:00:00.0', 100, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (669, '2025-03-13 00:00:00', '2025-03-13T15:00:00.0', '2025-03-13T15:15:00.0', 260, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (670, '2025-03-13 00:00:00', '2025-03-13T15:15:00.0', '2025-03-13T15:30:00.0', 34, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (671, '2025-03-13 00:00:00', '2025-03-13T15:30:00.0', '2025-03-13T15:45:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (672, '2025-03-13 00:00:00', '2025-03-13T15:45:00.0', '2025-03-13T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (673, '2025-03-14 00:00:00', '2025-03-13T16:00:00.0', '2025-03-13T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (674, '2025-03-14 00:00:00', '2025-03-13T16:15:00.0', '2025-03-13T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (675, '2025-03-14 00:00:00', '2025-03-13T16:30:00.0', '2025-03-13T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (676, '2025-03-14 00:00:00', '2025-03-13T16:45:00.0', '2025-03-13T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (677, '2025-03-14 00:00:00', '2025-03-13T17:00:00.0', '2025-03-13T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (678, '2025-03-14 00:00:00', '2025-03-13T17:15:00.0', '2025-03-13T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (679, '2025-03-14 00:00:00', '2025-03-13T17:30:00.0', '2025-03-13T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (680, '2025-03-14 00:00:00', '2025-03-13T17:45:00.0', '2025-03-13T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (681, '2025-03-14 00:00:00', '2025-03-13T18:00:00.0', '2025-03-13T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (682, '2025-03-14 00:00:00', '2025-03-13T18:15:00.0', '2025-03-13T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (683, '2025-03-14 00:00:00', '2025-03-13T18:30:00.0', '2025-03-13T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (684, '2025-03-14 00:00:00', '2025-03-13T18:45:00.0', '2025-03-13T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (685, '2025-03-14 00:00:00', '2025-03-13T19:00:00.0', '2025-03-13T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (686, '2025-03-14 00:00:00', '2025-03-13T19:15:00.0', '2025-03-13T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (687, '2025-03-14 00:00:00', '2025-03-13T19:30:00.0', '2025-03-13T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (688, '2025-03-14 00:00:00', '2025-03-13T19:45:00.0', '2025-03-13T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (689, '2025-03-14 00:00:00', '2025-03-13T20:00:00.0', '2025-03-13T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (690, '2025-03-14 00:00:00', '2025-03-13T20:15:00.0', '2025-03-13T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (691, '2025-03-14 00:00:00', '2025-03-13T20:30:00.0', '2025-03-13T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (692, '2025-03-14 00:00:00', '2025-03-13T20:45:00.0', '2025-03-13T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (693, '2025-03-14 00:00:00', '2025-03-13T21:00:00.0', '2025-03-13T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (694, '2025-03-14 00:00:00', '2025-03-13T21:15:00.0', '2025-03-13T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (695, '2025-03-14 00:00:00', '2025-03-13T21:30:00.0', '2025-03-13T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (696, '2025-03-14 00:00:00', '2025-03-13T21:45:00.0', '2025-03-13T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (697, '2025-03-14 00:00:00', '2025-03-13T22:00:00.0', '2025-03-13T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (698, '2025-03-14 00:00:00', '2025-03-13T22:15:00.0', '2025-03-13T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (699, '2025-03-14 00:00:00', '2025-03-13T22:30:00.0', '2025-03-13T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (700, '2025-03-14 00:00:00', '2025-03-13T22:45:00.0', '2025-03-13T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (701, '2025-03-14 00:00:00', '2025-03-13T23:00:00.0', '2025-03-13T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (702, '2025-03-14 00:00:00', '2025-03-13T23:15:00.0', '2025-03-13T23:30:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (703, '2025-03-14 00:00:00', '2025-03-13T23:30:00.0', '2025-03-13T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (704, '2025-03-14 00:00:00', '2025-03-13T23:45:00.0', '2025-03-14T00:00:00.0', 316, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (705, '2025-03-14 00:00:00', '2025-03-14T00:00:00.0', '2025-03-14T00:15:00.0', 352, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (706, '2025-03-14 00:00:00', '2025-03-14T00:15:00.0', '2025-03-14T00:30:00.0', 454, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (707, '2025-03-14 00:00:00', '2025-03-14T00:30:00.0', '2025-03-14T00:45:00.0', 287, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (708, '2025-03-14 00:00:00', '2025-03-14T00:45:00.0', '2025-03-14T01:00:00.0', 238, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (709, '2025-03-14 00:00:00', '2025-03-14T01:00:00.0', '2025-03-14T01:15:00.0', 985, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (710, '2025-03-14 00:00:00', '2025-03-14T01:15:00.0', '2025-03-14T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (711, '2025-03-14 00:00:00', '2025-03-14T01:30:00.0', '2025-03-14T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (712, '2025-03-14 00:00:00', '2025-03-14T01:45:00.0', '2025-03-14T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (713, '2025-03-14 00:00:00', '2025-03-14T02:00:00.0', '2025-03-14T02:15:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (714, '2025-03-14 00:00:00', '2025-03-14T02:15:00.0', '2025-03-14T02:30:00.0', 391, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (715, '2025-03-14 00:00:00', '2025-03-14T02:30:00.0', '2025-03-14T02:45:00.0', 538, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (716, '2025-03-14 00:00:00', '2025-03-14T02:45:00.0', '2025-03-14T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (717, '2025-03-14 00:00:00', '2025-03-14T03:00:00.0', '2025-03-14T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (718, '2025-03-14 00:00:00', '2025-03-14T03:15:00.0', '2025-03-14T03:30:00.0', 22, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (719, '2025-03-14 00:00:00', '2025-03-14T03:30:00.0', '2025-03-14T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (720, '2025-03-14 00:00:00', '2025-03-14T03:45:00.0', '2025-03-14T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (721, '2025-03-14 00:00:00', '2025-03-14T04:00:00.0', '2025-03-14T04:15:00.0', 44, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (722, '2025-03-14 00:00:00', '2025-03-14T04:15:00.0', '2025-03-14T04:30:00.0', 1159, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (723, '2025-03-14 00:00:00', '2025-03-14T04:30:00.0', '2025-03-14T04:45:00.0', 17, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (724, '2025-03-14 00:00:00', '2025-03-14T04:45:00.0', '2025-03-14T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (725, '2025-03-14 00:00:00', '2025-03-14T05:00:00.0', '2025-03-14T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (726, '2025-03-14 00:00:00', '2025-03-14T05:15:00.0', '2025-03-14T05:30:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (727, '2025-03-14 00:00:00', '2025-03-14T05:30:00.0', '2025-03-14T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (728, '2025-03-14 00:00:00', '2025-03-14T05:45:00.0', '2025-03-14T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (729, '2025-03-14 00:00:00', '2025-03-14T06:00:00.0', '2025-03-14T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (730, '2025-03-14 00:00:00', '2025-03-14T06:15:00.0', '2025-03-14T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (731, '2025-03-14 00:00:00', '2025-03-14T06:30:00.0', '2025-03-14T06:45:00.0', 160, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (732, '2025-03-14 00:00:00', '2025-03-14T06:45:00.0', '2025-03-14T07:00:00.0', 185, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (733, '2025-03-14 00:00:00', '2025-03-14T07:00:00.0', '2025-03-14T07:15:00.0', 95, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (734, '2025-03-14 00:00:00', '2025-03-14T07:15:00.0', '2025-03-14T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (735, '2025-03-14 00:00:00', '2025-03-14T07:30:00.0', '2025-03-14T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (736, '2025-03-14 00:00:00', '2025-03-14T07:45:00.0', '2025-03-14T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (737, '2025-03-14 00:00:00', '2025-03-14T08:00:00.0', '2025-03-14T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (738, '2025-03-14 00:00:00', '2025-03-14T08:15:00.0', '2025-03-14T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (739, '2025-03-14 00:00:00', '2025-03-14T08:30:00.0', '2025-03-14T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (740, '2025-03-14 00:00:00', '2025-03-14T08:45:00.0', '2025-03-14T09:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (741, '2025-03-14 00:00:00', '2025-03-14T09:00:00.0', '2025-03-14T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (742, '2025-03-14 00:00:00', '2025-03-14T09:15:00.0', '2025-03-14T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (743, '2025-03-14 00:00:00', '2025-03-14T09:30:00.0', '2025-03-14T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (744, '2025-03-14 00:00:00', '2025-03-14T09:45:00.0', '2025-03-14T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (745, '2025-03-14 00:00:00', '2025-03-14T10:00:00.0', '2025-03-14T10:15:00.0', 219, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (746, '2025-03-14 00:00:00', '2025-03-14T10:15:00.0', '2025-03-14T10:30:00.0', 1211, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (747, '2025-03-14 00:00:00', '2025-03-14T10:30:00.0', '2025-03-14T10:45:00.0', 460, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (748, '2025-03-14 00:00:00', '2025-03-14T10:45:00.0', '2025-03-14T11:00:00.0', 855, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (749, '2025-03-14 00:00:00', '2025-03-14T11:00:00.0', '2025-03-14T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (750, '2025-03-14 00:00:00', '2025-03-14T11:15:00.0', '2025-03-14T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (751, '2025-03-14 00:00:00', '2025-03-14T11:30:00.0', '2025-03-14T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (752, '2025-03-14 00:00:00', '2025-03-14T11:45:00.0', '2025-03-14T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (753, '2025-03-14 00:00:00', '2025-03-14T12:00:00.0', '2025-03-14T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (754, '2025-03-14 00:00:00', '2025-03-14T12:15:00.0', '2025-03-14T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (755, '2025-03-14 00:00:00', '2025-03-14T12:30:00.0', '2025-03-14T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (756, '2025-03-14 00:00:00', '2025-03-14T12:45:00.0', '2025-03-14T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (757, '2025-03-14 00:00:00', '2025-03-14T13:00:00.0', '2025-03-14T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (758, '2025-03-14 00:00:00', '2025-03-14T13:15:00.0', '2025-03-14T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (759, '2025-03-14 00:00:00', '2025-03-14T13:30:00.0', '2025-03-14T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (760, '2025-03-14 00:00:00', '2025-03-14T13:45:00.0', '2025-03-14T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (761, '2025-03-14 00:00:00', '2025-03-14T14:00:00.0', '2025-03-14T14:15:00.0', 348, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (762, '2025-03-14 00:00:00', '2025-03-14T14:15:00.0', '2025-03-14T14:30:00.0', 128, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (763, '2025-03-14 00:00:00', '2025-03-14T14:30:00.0', '2025-03-14T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (764, '2025-03-14 00:00:00', '2025-03-14T14:45:00.0', '2025-03-14T15:00:00.0', 128, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (765, '2025-03-14 00:00:00', '2025-03-14T15:00:00.0', '2025-03-14T15:15:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (766, '2025-03-14 00:00:00', '2025-03-14T15:15:00.0', '2025-03-14T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (767, '2025-03-14 00:00:00', '2025-03-14T15:30:00.0', '2025-03-14T15:45:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (768, '2025-03-14 00:00:00', '2025-03-14T15:45:00.0', '2025-03-14T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (769, '2025-03-15 00:00:00', '2025-03-14T16:00:00.0', '2025-03-14T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (770, '2025-03-15 00:00:00', '2025-03-14T16:15:00.0', '2025-03-14T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (771, '2025-03-15 00:00:00', '2025-03-14T16:30:00.0', '2025-03-14T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (772, '2025-03-15 00:00:00', '2025-03-14T16:45:00.0', '2025-03-14T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (773, '2025-03-15 00:00:00', '2025-03-14T17:00:00.0', '2025-03-14T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (774, '2025-03-15 00:00:00', '2025-03-14T17:15:00.0', '2025-03-14T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (775, '2025-03-15 00:00:00', '2025-03-14T17:30:00.0', '2025-03-14T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (776, '2025-03-15 00:00:00', '2025-03-14T17:45:00.0', '2025-03-14T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (777, '2025-03-15 00:00:00', '2025-03-14T18:00:00.0', '2025-03-14T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (778, '2025-03-15 00:00:00', '2025-03-14T18:15:00.0', '2025-03-14T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (779, '2025-03-15 00:00:00', '2025-03-14T18:30:00.0', '2025-03-14T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (780, '2025-03-15 00:00:00', '2025-03-14T18:45:00.0', '2025-03-14T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (781, '2025-03-15 00:00:00', '2025-03-14T19:00:00.0', '2025-03-14T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (782, '2025-03-15 00:00:00', '2025-03-14T19:15:00.0', '2025-03-14T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (783, '2025-03-15 00:00:00', '2025-03-14T19:30:00.0', '2025-03-14T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (784, '2025-03-15 00:00:00', '2025-03-14T19:45:00.0', '2025-03-14T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (785, '2025-03-15 00:00:00', '2025-03-14T20:00:00.0', '2025-03-14T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (786, '2025-03-15 00:00:00', '2025-03-14T20:15:00.0', '2025-03-14T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (787, '2025-03-15 00:00:00', '2025-03-14T20:30:00.0', '2025-03-14T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (788, '2025-03-15 00:00:00', '2025-03-14T20:45:00.0', '2025-03-14T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (789, '2025-03-15 00:00:00', '2025-03-14T21:00:00.0', '2025-03-14T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (790, '2025-03-15 00:00:00', '2025-03-14T21:15:00.0', '2025-03-14T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (791, '2025-03-15 00:00:00', '2025-03-14T21:30:00.0', '2025-03-14T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (792, '2025-03-15 00:00:00', '2025-03-14T21:45:00.0', '2025-03-14T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (793, '2025-03-15 00:00:00', '2025-03-14T22:00:00.0', '2025-03-14T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (794, '2025-03-15 00:00:00', '2025-03-14T22:15:00.0', '2025-03-14T22:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (795, '2025-03-15 00:00:00', '2025-03-14T22:30:00.0', '2025-03-14T22:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (796, '2025-03-15 00:00:00', '2025-03-14T22:45:00.0', '2025-03-14T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (797, '2025-03-15 00:00:00', '2025-03-14T23:00:00.0', '2025-03-14T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (798, '2025-03-15 00:00:00', '2025-03-14T23:15:00.0', '2025-03-14T23:30:00.0', 171, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (799, '2025-03-15 00:00:00', '2025-03-14T23:30:00.0', '2025-03-14T23:45:00.0', 55, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (800, '2025-03-15 00:00:00', '2025-03-14T23:45:00.0', '2025-03-15T00:00:00.0', 303, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (801, '2025-03-15 00:00:00', '2025-03-15T00:00:00.0', '2025-03-15T00:15:00.0', 188, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (802, '2025-03-15 00:00:00', '2025-03-15T00:15:00.0', '2025-03-15T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (803, '2025-03-15 00:00:00', '2025-03-15T00:30:00.0', '2025-03-15T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (804, '2025-03-15 00:00:00', '2025-03-15T00:45:00.0', '2025-03-15T01:00:00.0', 91, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (805, '2025-03-15 00:00:00', '2025-03-15T01:00:00.0', '2025-03-15T01:15:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (806, '2025-03-15 00:00:00', '2025-03-15T01:15:00.0', '2025-03-15T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (807, '2025-03-15 00:00:00', '2025-03-15T01:30:00.0', '2025-03-15T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (808, '2025-03-15 00:00:00', '2025-03-15T01:45:00.0', '2025-03-15T02:00:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (809, '2025-03-15 00:00:00', '2025-03-15T02:00:00.0', '2025-03-15T02:15:00.0', 50, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (810, '2025-03-15 00:00:00', '2025-03-15T02:15:00.0', '2025-03-15T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (811, '2025-03-15 00:00:00', '2025-03-15T02:30:00.0', '2025-03-15T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (812, '2025-03-15 00:00:00', '2025-03-15T02:45:00.0', '2025-03-15T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (813, '2025-03-15 00:00:00', '2025-03-15T03:00:00.0', '2025-03-15T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (814, '2025-03-15 00:00:00', '2025-03-15T03:15:00.0', '2025-03-15T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (815, '2025-03-15 00:00:00', '2025-03-15T03:30:00.0', '2025-03-15T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (816, '2025-03-15 00:00:00', '2025-03-15T03:45:00.0', '2025-03-15T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (817, '2025-03-15 00:00:00', '2025-03-15T04:00:00.0', '2025-03-15T04:15:00.0', 79, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (818, '2025-03-15 00:00:00', '2025-03-15T04:15:00.0', '2025-03-15T04:30:00.0', 582, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (819, '2025-03-15 00:00:00', '2025-03-15T04:30:00.0', '2025-03-15T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (820, '2025-03-15 00:00:00', '2025-03-15T04:45:00.0', '2025-03-15T05:00:00.0', 151, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (821, '2025-03-15 00:00:00', '2025-03-15T05:00:00.0', '2025-03-15T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (822, '2025-03-15 00:00:00', '2025-03-15T05:15:00.0', '2025-03-15T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (823, '2025-03-15 00:00:00', '2025-03-15T05:30:00.0', '2025-03-15T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (824, '2025-03-15 00:00:00', '2025-03-15T05:45:00.0', '2025-03-15T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (825, '2025-03-15 00:00:00', '2025-03-15T06:00:00.0', '2025-03-15T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (826, '2025-03-15 00:00:00', '2025-03-15T06:15:00.0', '2025-03-15T06:30:00.0', 152, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (827, '2025-03-15 00:00:00', '2025-03-15T06:30:00.0', '2025-03-15T06:45:00.0', 492, '0', 'active', 'False');
INSERT INTO `steps` VALUES (828, '2025-03-15 00:00:00', '2025-03-15T06:45:00.0', '2025-03-15T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (829, '2025-03-15 00:00:00', '2025-03-15T07:00:00.0', '2025-03-15T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (830, '2025-03-15 00:00:00', '2025-03-15T07:15:00.0', '2025-03-15T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (831, '2025-03-15 00:00:00', '2025-03-15T07:30:00.0', '2025-03-15T07:45:00.0', 60, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (832, '2025-03-15 00:00:00', '2025-03-15T07:45:00.0', '2025-03-15T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (833, '2025-03-15 00:00:00', '2025-03-15T08:00:00.0', '2025-03-15T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (834, '2025-03-15 00:00:00', '2025-03-15T08:15:00.0', '2025-03-15T08:30:00.0', 16, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (835, '2025-03-15 00:00:00', '2025-03-15T08:30:00.0', '2025-03-15T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (836, '2025-03-15 00:00:00', '2025-03-15T08:45:00.0', '2025-03-15T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (837, '2025-03-15 00:00:00', '2025-03-15T09:00:00.0', '2025-03-15T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (838, '2025-03-15 00:00:00', '2025-03-15T09:15:00.0', '2025-03-15T09:30:00.0', 778, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (839, '2025-03-15 00:00:00', '2025-03-15T09:30:00.0', '2025-03-15T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (840, '2025-03-15 00:00:00', '2025-03-15T09:45:00.0', '2025-03-15T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (841, '2025-03-15 00:00:00', '2025-03-15T10:00:00.0', '2025-03-15T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (842, '2025-03-15 00:00:00', '2025-03-15T10:15:00.0', '2025-03-15T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (843, '2025-03-15 00:00:00', '2025-03-15T10:30:00.0', '2025-03-15T10:45:00.0', 321, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (844, '2025-03-15 00:00:00', '2025-03-15T10:45:00.0', '2025-03-15T11:00:00.0', 146, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (845, '2025-03-15 00:00:00', '2025-03-15T11:00:00.0', '2025-03-15T11:15:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (846, '2025-03-15 00:00:00', '2025-03-15T11:15:00.0', '2025-03-15T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (847, '2025-03-15 00:00:00', '2025-03-15T11:30:00.0', '2025-03-15T11:45:00.0', 96, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (848, '2025-03-15 00:00:00', '2025-03-15T11:45:00.0', '2025-03-15T12:00:00.0', 129, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (849, '2025-03-15 00:00:00', '2025-03-15T12:00:00.0', '2025-03-15T12:15:00.0', 432, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (850, '2025-03-15 00:00:00', '2025-03-15T12:15:00.0', '2025-03-15T12:30:00.0', 93, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (851, '2025-03-15 00:00:00', '2025-03-15T12:30:00.0', '2025-03-15T12:45:00.0', 105, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (852, '2025-03-15 00:00:00', '2025-03-15T12:45:00.0', '2025-03-15T13:00:00.0', 63, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (853, '2025-03-15 00:00:00', '2025-03-15T13:00:00.0', '2025-03-15T13:15:00.0', 100, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (854, '2025-03-15 00:00:00', '2025-03-15T13:15:00.0', '2025-03-15T13:30:00.0', 394, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (855, '2025-03-15 00:00:00', '2025-03-15T13:30:00.0', '2025-03-15T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (856, '2025-03-15 00:00:00', '2025-03-15T13:45:00.0', '2025-03-15T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (857, '2025-03-15 00:00:00', '2025-03-15T14:00:00.0', '2025-03-15T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (858, '2025-03-15 00:00:00', '2025-03-15T14:15:00.0', '2025-03-15T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (859, '2025-03-15 00:00:00', '2025-03-15T14:30:00.0', '2025-03-15T14:45:00.0', 39, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (860, '2025-03-15 00:00:00', '2025-03-15T14:45:00.0', '2025-03-15T15:00:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (861, '2025-03-15 00:00:00', '2025-03-15T15:00:00.0', '2025-03-15T15:15:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (862, '2025-03-15 00:00:00', '2025-03-15T15:15:00.0', '2025-03-15T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (863, '2025-03-15 00:00:00', '2025-03-15T15:30:00.0', '2025-03-15T15:45:00.0', 94, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (864, '2025-03-15 00:00:00', '2025-03-15T15:45:00.0', '2025-03-15T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (865, '2025-03-16 00:00:00', '2025-03-15T16:00:00.0', '2025-03-15T16:15:00.0', 217, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (866, '2025-03-16 00:00:00', '2025-03-15T16:15:00.0', '2025-03-15T16:30:00.0', 314, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (867, '2025-03-16 00:00:00', '2025-03-15T16:30:00.0', '2025-03-15T16:45:00.0', 72, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (868, '2025-03-16 00:00:00', '2025-03-15T16:45:00.0', '2025-03-15T17:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (869, '2025-03-16 00:00:00', '2025-03-15T17:00:00.0', '2025-03-15T17:15:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (870, '2025-03-16 00:00:00', '2025-03-15T17:15:00.0', '2025-03-15T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (871, '2025-03-16 00:00:00', '2025-03-15T17:30:00.0', '2025-03-15T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (872, '2025-03-16 00:00:00', '2025-03-15T17:45:00.0', '2025-03-15T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (873, '2025-03-16 00:00:00', '2025-03-15T18:00:00.0', '2025-03-15T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (874, '2025-03-16 00:00:00', '2025-03-15T18:15:00.0', '2025-03-15T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (875, '2025-03-16 00:00:00', '2025-03-15T18:30:00.0', '2025-03-15T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (876, '2025-03-16 00:00:00', '2025-03-15T18:45:00.0', '2025-03-15T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (877, '2025-03-16 00:00:00', '2025-03-15T19:00:00.0', '2025-03-15T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (878, '2025-03-16 00:00:00', '2025-03-15T19:15:00.0', '2025-03-15T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (879, '2025-03-16 00:00:00', '2025-03-15T19:30:00.0', '2025-03-15T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (880, '2025-03-16 00:00:00', '2025-03-15T19:45:00.0', '2025-03-15T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (881, '2025-03-16 00:00:00', '2025-03-15T20:00:00.0', '2025-03-15T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (882, '2025-03-16 00:00:00', '2025-03-15T20:15:00.0', '2025-03-15T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (883, '2025-03-16 00:00:00', '2025-03-15T20:30:00.0', '2025-03-15T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (884, '2025-03-16 00:00:00', '2025-03-15T20:45:00.0', '2025-03-15T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (885, '2025-03-16 00:00:00', '2025-03-15T21:00:00.0', '2025-03-15T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (886, '2025-03-16 00:00:00', '2025-03-15T21:15:00.0', '2025-03-15T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (887, '2025-03-16 00:00:00', '2025-03-15T21:30:00.0', '2025-03-15T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (888, '2025-03-16 00:00:00', '2025-03-15T21:45:00.0', '2025-03-15T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (889, '2025-03-16 00:00:00', '2025-03-15T22:00:00.0', '2025-03-15T22:15:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (890, '2025-03-16 00:00:00', '2025-03-15T22:15:00.0', '2025-03-15T22:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (891, '2025-03-16 00:00:00', '2025-03-15T22:30:00.0', '2025-03-15T22:45:00.0', 90, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (892, '2025-03-16 00:00:00', '2025-03-15T22:45:00.0', '2025-03-15T23:00:00.0', 65, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (893, '2025-03-16 00:00:00', '2025-03-15T23:00:00.0', '2025-03-15T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (894, '2025-03-16 00:00:00', '2025-03-15T23:15:00.0', '2025-03-15T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (895, '2025-03-16 00:00:00', '2025-03-15T23:30:00.0', '2025-03-15T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (896, '2025-03-16 00:00:00', '2025-03-15T23:45:00.0', '2025-03-16T00:00:00.0', 8, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (897, '2025-03-16 00:00:00', '2025-03-16T00:00:00.0', '2025-03-16T00:15:00.0', 523, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (898, '2025-03-16 00:00:00', '2025-03-16T00:15:00.0', '2025-03-16T00:30:00.0', 950, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (899, '2025-03-16 00:00:00', '2025-03-16T00:30:00.0', '2025-03-16T00:45:00.0', 67, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (900, '2025-03-16 00:00:00', '2025-03-16T00:45:00.0', '2025-03-16T01:00:00.0', 89, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (901, '2025-03-16 00:00:00', '2025-03-16T01:00:00.0', '2025-03-16T01:15:00.0', 68, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (902, '2025-03-16 00:00:00', '2025-03-16T01:15:00.0', '2025-03-16T01:30:00.0', 39, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (903, '2025-03-16 00:00:00', '2025-03-16T01:30:00.0', '2025-03-16T01:45:00.0', 29, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (904, '2025-03-16 00:00:00', '2025-03-16T01:45:00.0', '2025-03-16T02:00:00.0', 81, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (905, '2025-03-16 00:00:00', '2025-03-16T02:00:00.0', '2025-03-16T02:15:00.0', 62, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (906, '2025-03-16 00:00:00', '2025-03-16T02:15:00.0', '2025-03-16T02:30:00.0', 117, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (907, '2025-03-16 00:00:00', '2025-03-16T02:30:00.0', '2025-03-16T02:45:00.0', 921, '0', 'active', 'True');
INSERT INTO `steps` VALUES (908, '2025-03-16 00:00:00', '2025-03-16T02:45:00.0', '2025-03-16T03:00:00.0', 1317, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (909, '2025-03-16 00:00:00', '2025-03-16T03:00:00.0', '2025-03-16T03:15:00.0', 163, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (910, '2025-03-16 00:00:00', '2025-03-16T03:15:00.0', '2025-03-16T03:30:00.0', 116, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (911, '2025-03-16 00:00:00', '2025-03-16T03:30:00.0', '2025-03-16T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (912, '2025-03-16 00:00:00', '2025-03-16T03:45:00.0', '2025-03-16T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (913, '2025-03-16 00:00:00', '2025-03-16T04:00:00.0', '2025-03-16T04:15:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (914, '2025-03-16 00:00:00', '2025-03-16T04:15:00.0', '2025-03-16T04:30:00.0', 96, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (915, '2025-03-16 00:00:00', '2025-03-16T04:30:00.0', '2025-03-16T04:45:00.0', 25, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (916, '2025-03-16 00:00:00', '2025-03-16T04:45:00.0', '2025-03-16T05:00:00.0', 198, '0', 'active', 'False');
INSERT INTO `steps` VALUES (917, '2025-03-16 00:00:00', '2025-03-16T05:00:00.0', '2025-03-16T05:15:00.0', 156, '0', 'active', 'False');
INSERT INTO `steps` VALUES (918, '2025-03-16 00:00:00', '2025-03-16T05:15:00.0', '2025-03-16T05:30:00.0', 103, '0', 'active', 'False');
INSERT INTO `steps` VALUES (919, '2025-03-16 00:00:00', '2025-03-16T05:30:00.0', '2025-03-16T05:45:00.0', 26, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (920, '2025-03-16 00:00:00', '2025-03-16T05:45:00.0', '2025-03-16T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (921, '2025-03-16 00:00:00', '2025-03-16T06:00:00.0', '2025-03-16T06:15:00.0', 33, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (922, '2025-03-16 00:00:00', '2025-03-16T06:15:00.0', '2025-03-16T06:30:00.0', 34, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (923, '2025-03-16 00:00:00', '2025-03-16T06:30:00.0', '2025-03-16T06:45:00.0', 65, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (924, '2025-03-16 00:00:00', '2025-03-16T06:45:00.0', '2025-03-16T07:00:00.0', 117, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (925, '2025-03-16 00:00:00', '2025-03-16T07:00:00.0', '2025-03-16T07:15:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (926, '2025-03-16 00:00:00', '2025-03-16T07:15:00.0', '2025-03-16T07:30:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (927, '2025-03-16 00:00:00', '2025-03-16T07:30:00.0', '2025-03-16T07:45:00.0', 98, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (928, '2025-03-16 00:00:00', '2025-03-16T07:45:00.0', '2025-03-16T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (929, '2025-03-16 00:00:00', '2025-03-16T08:00:00.0', '2025-03-16T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (930, '2025-03-16 00:00:00', '2025-03-16T08:15:00.0', '2025-03-16T08:30:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (931, '2025-03-16 00:00:00', '2025-03-16T08:30:00.0', '2025-03-16T08:45:00.0', 152, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (932, '2025-03-16 00:00:00', '2025-03-16T08:45:00.0', '2025-03-16T09:00:00.0', 176, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (933, '2025-03-16 00:00:00', '2025-03-16T09:00:00.0', '2025-03-16T09:15:00.0', 185, '0', 'active', 'False');
INSERT INTO `steps` VALUES (934, '2025-03-16 00:00:00', '2025-03-16T09:15:00.0', '2025-03-16T09:30:00.0', 214, '0', 'active', 'False');
INSERT INTO `steps` VALUES (935, '2025-03-16 00:00:00', '2025-03-16T09:30:00.0', '2025-03-16T09:45:00.0', 91, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (936, '2025-03-16 00:00:00', '2025-03-16T09:45:00.0', '2025-03-16T10:00:00.0', 107, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (937, '2025-03-16 00:00:00', '2025-03-16T10:00:00.0', '2025-03-16T10:15:00.0', 238, '0', 'active', 'False');
INSERT INTO `steps` VALUES (938, '2025-03-16 00:00:00', '2025-03-16T10:15:00.0', '2025-03-16T10:30:00.0', 136, '0', 'active', 'False');
INSERT INTO `steps` VALUES (939, '2025-03-16 00:00:00', '2025-03-16T10:30:00.0', '2025-03-16T10:45:00.0', 271, '0', 'active', 'False');
INSERT INTO `steps` VALUES (940, '2025-03-16 00:00:00', '2025-03-16T10:45:00.0', '2025-03-16T11:00:00.0', 824, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (941, '2025-03-16 00:00:00', '2025-03-16T11:00:00.0', '2025-03-16T11:15:00.0', 629, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (942, '2025-03-16 00:00:00', '2025-03-16T11:15:00.0', '2025-03-16T11:30:00.0', 243, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (943, '2025-03-16 00:00:00', '2025-03-16T11:30:00.0', '2025-03-16T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (944, '2025-03-16 00:00:00', '2025-03-16T11:45:00.0', '2025-03-16T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (945, '2025-03-16 00:00:00', '2025-03-16T12:00:00.0', '2025-03-16T12:15:00.0', 12, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (946, '2025-03-16 00:00:00', '2025-03-16T12:15:00.0', '2025-03-16T12:30:00.0', 95, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (947, '2025-03-16 00:00:00', '2025-03-16T12:30:00.0', '2025-03-16T12:45:00.0', 87, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (948, '2025-03-16 00:00:00', '2025-03-16T12:45:00.0', '2025-03-16T13:00:00.0', 97, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (949, '2025-03-16 00:00:00', '2025-03-16T13:00:00.0', '2025-03-16T13:15:00.0', 58, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (950, '2025-03-16 00:00:00', '2025-03-16T13:15:00.0', '2025-03-16T13:30:00.0', 176, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (951, '2025-03-16 00:00:00', '2025-03-16T13:30:00.0', '2025-03-16T13:45:00.0', 132, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (952, '2025-03-16 00:00:00', '2025-03-16T13:45:00.0', '2025-03-16T14:00:00.0', 395, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (953, '2025-03-16 00:00:00', '2025-03-16T14:00:00.0', '2025-03-16T14:15:00.0', 486, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (954, '2025-03-16 00:00:00', '2025-03-16T14:15:00.0', '2025-03-16T14:30:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (955, '2025-03-16 00:00:00', '2025-03-16T14:30:00.0', '2025-03-16T14:45:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (956, '2025-03-16 00:00:00', '2025-03-16T14:45:00.0', '2025-03-16T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (957, '2025-03-16 00:00:00', '2025-03-16T15:00:00.0', '2025-03-16T15:15:00.0', 170, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (958, '2025-03-16 00:00:00', '2025-03-16T15:15:00.0', '2025-03-16T15:30:00.0', 30, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (959, '2025-03-16 00:00:00', '2025-03-16T15:30:00.0', '2025-03-16T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (960, '2025-03-16 00:00:00', '2025-03-16T15:45:00.0', '2025-03-16T16:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (961, '2025-03-17 00:00:00', '2025-03-16T16:00:00.0', '2025-03-16T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (962, '2025-03-17 00:00:00', '2025-03-16T16:15:00.0', '2025-03-16T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (963, '2025-03-17 00:00:00', '2025-03-16T16:30:00.0', '2025-03-16T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (964, '2025-03-17 00:00:00', '2025-03-16T16:45:00.0', '2025-03-16T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (965, '2025-03-17 00:00:00', '2025-03-16T17:00:00.0', '2025-03-16T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (966, '2025-03-17 00:00:00', '2025-03-16T17:15:00.0', '2025-03-16T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (967, '2025-03-17 00:00:00', '2025-03-16T17:30:00.0', '2025-03-16T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (968, '2025-03-17 00:00:00', '2025-03-16T17:45:00.0', '2025-03-16T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (969, '2025-03-17 00:00:00', '2025-03-16T18:00:00.0', '2025-03-16T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (970, '2025-03-17 00:00:00', '2025-03-16T18:15:00.0', '2025-03-16T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (971, '2025-03-17 00:00:00', '2025-03-16T18:30:00.0', '2025-03-16T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (972, '2025-03-17 00:00:00', '2025-03-16T18:45:00.0', '2025-03-16T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (973, '2025-03-17 00:00:00', '2025-03-16T19:00:00.0', '2025-03-16T19:15:00.0', 15, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (974, '2025-03-17 00:00:00', '2025-03-16T19:15:00.0', '2025-03-16T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (975, '2025-03-17 00:00:00', '2025-03-16T19:30:00.0', '2025-03-16T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (976, '2025-03-17 00:00:00', '2025-03-16T19:45:00.0', '2025-03-16T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (977, '2025-03-17 00:00:00', '2025-03-16T20:00:00.0', '2025-03-16T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (978, '2025-03-17 00:00:00', '2025-03-16T20:15:00.0', '2025-03-16T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (979, '2025-03-17 00:00:00', '2025-03-16T20:30:00.0', '2025-03-16T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (980, '2025-03-17 00:00:00', '2025-03-16T20:45:00.0', '2025-03-16T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (981, '2025-03-17 00:00:00', '2025-03-16T21:00:00.0', '2025-03-16T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (982, '2025-03-17 00:00:00', '2025-03-16T21:15:00.0', '2025-03-16T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (983, '2025-03-17 00:00:00', '2025-03-16T21:30:00.0', '2025-03-16T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (984, '2025-03-17 00:00:00', '2025-03-16T21:45:00.0', '2025-03-16T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (985, '2025-03-17 00:00:00', '2025-03-16T22:00:00.0', '2025-03-16T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (986, '2025-03-17 00:00:00', '2025-03-16T22:15:00.0', '2025-03-16T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (987, '2025-03-17 00:00:00', '2025-03-16T22:30:00.0', '2025-03-16T22:45:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (988, '2025-03-17 00:00:00', '2025-03-16T22:45:00.0', '2025-03-16T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (989, '2025-03-17 00:00:00', '2025-03-16T23:00:00.0', '2025-03-16T23:15:00.0', 108, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (990, '2025-03-17 00:00:00', '2025-03-16T23:15:00.0', '2025-03-16T23:30:00.0', 211, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (991, '2025-03-17 00:00:00', '2025-03-16T23:30:00.0', '2025-03-16T23:45:00.0', 396, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (992, '2025-03-17 00:00:00', '2025-03-16T23:45:00.0', '2025-03-17T00:00:00.0', 339, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (993, '2025-03-17 00:00:00', '2025-03-17T00:00:00.0', '2025-03-17T00:15:00.0', 18, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (994, '2025-03-17 00:00:00', '2025-03-17T00:15:00.0', '2025-03-17T00:30:00.0', 431, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (995, '2025-03-17 00:00:00', '2025-03-17T00:30:00.0', '2025-03-17T00:45:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (996, '2025-03-17 00:00:00', '2025-03-17T00:45:00.0', '2025-03-17T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (997, '2025-03-17 00:00:00', '2025-03-17T01:00:00.0', '2025-03-17T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (998, '2025-03-17 00:00:00', '2025-03-17T01:15:00.0', '2025-03-17T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (999, '2025-03-17 00:00:00', '2025-03-17T01:30:00.0', '2025-03-17T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1000, '2025-03-17 00:00:00', '2025-03-17T01:45:00.0', '2025-03-17T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1001, '2025-03-17 00:00:00', '2025-03-17T02:00:00.0', '2025-03-17T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1002, '2025-03-17 00:00:00', '2025-03-17T02:15:00.0', '2025-03-17T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1003, '2025-03-17 00:00:00', '2025-03-17T02:30:00.0', '2025-03-17T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1004, '2025-03-17 00:00:00', '2025-03-17T02:45:00.0', '2025-03-17T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1005, '2025-03-17 00:00:00', '2025-03-17T03:00:00.0', '2025-03-17T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1006, '2025-03-17 00:00:00', '2025-03-17T03:15:00.0', '2025-03-17T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1007, '2025-03-17 00:00:00', '2025-03-17T03:30:00.0', '2025-03-17T03:45:00.0', 44, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1008, '2025-03-17 00:00:00', '2025-03-17T03:45:00.0', '2025-03-17T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1009, '2025-03-17 00:00:00', '2025-03-17T04:00:00.0', '2025-03-17T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1010, '2025-03-17 00:00:00', '2025-03-17T04:15:00.0', '2025-03-17T04:30:00.0', 415, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1011, '2025-03-17 00:00:00', '2025-03-17T04:30:00.0', '2025-03-17T04:45:00.0', 1557, '0', 'highlyActive', 'True');
INSERT INTO `steps` VALUES (1012, '2025-03-17 00:00:00', '2025-03-17T04:45:00.0', '2025-03-17T05:00:00.0', 61, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1013, '2025-03-17 00:00:00', '2025-03-17T05:00:00.0', '2025-03-17T05:15:00.0', 1020, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1014, '2025-03-17 00:00:00', '2025-03-17T05:15:00.0', '2025-03-17T05:30:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1015, '2025-03-17 00:00:00', '2025-03-17T05:30:00.0', '2025-03-17T05:45:00.0', 31, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1016, '2025-03-17 00:00:00', '2025-03-17T05:45:00.0', '2025-03-17T06:00:00.0', 473, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1017, '2025-03-17 00:00:00', '2025-03-17T06:00:00.0', '2025-03-17T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1018, '2025-03-17 00:00:00', '2025-03-17T06:15:00.0', '2025-03-17T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1019, '2025-03-17 00:00:00', '2025-03-17T06:30:00.0', '2025-03-17T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1020, '2025-03-17 00:00:00', '2025-03-17T06:45:00.0', '2025-03-17T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1021, '2025-03-17 00:00:00', '2025-03-17T07:00:00.0', '2025-03-17T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1022, '2025-03-17 00:00:00', '2025-03-17T07:15:00.0', '2025-03-17T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1023, '2025-03-17 00:00:00', '2025-03-17T07:30:00.0', '2025-03-17T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1024, '2025-03-17 00:00:00', '2025-03-17T07:45:00.0', '2025-03-17T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1025, '2025-03-17 00:00:00', '2025-03-17T08:00:00.0', '2025-03-17T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1026, '2025-03-17 00:00:00', '2025-03-17T08:15:00.0', '2025-03-17T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1027, '2025-03-17 00:00:00', '2025-03-17T08:30:00.0', '2025-03-17T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1028, '2025-03-17 00:00:00', '2025-03-17T08:45:00.0', '2025-03-17T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1029, '2025-03-17 00:00:00', '2025-03-17T09:00:00.0', '2025-03-17T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1030, '2025-03-17 00:00:00', '2025-03-17T09:15:00.0', '2025-03-17T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1031, '2025-03-17 00:00:00', '2025-03-17T09:30:00.0', '2025-03-17T09:45:00.0', 569, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1032, '2025-03-17 00:00:00', '2025-03-17T09:45:00.0', '2025-03-17T10:00:00.0', 143, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1033, '2025-03-17 00:00:00', '2025-03-17T10:00:00.0', '2025-03-17T10:15:00.0', 125, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1034, '2025-03-17 00:00:00', '2025-03-17T10:15:00.0', '2025-03-17T10:30:00.0', 1175, '0', 'active', 'True');
INSERT INTO `steps` VALUES (1035, '2025-03-17 00:00:00', '2025-03-17T10:30:00.0', '2025-03-17T10:45:00.0', 1004, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1036, '2025-03-17 00:00:00', '2025-03-17T10:45:00.0', '2025-03-17T11:00:00.0', 298, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1037, '2025-03-17 00:00:00', '2025-03-17T11:00:00.0', '2025-03-17T11:15:00.0', 35, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1038, '2025-03-17 00:00:00', '2025-03-17T11:15:00.0', '2025-03-17T11:30:00.0', 135, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1039, '2025-03-17 00:00:00', '2025-03-17T11:30:00.0', '2025-03-17T11:45:00.0', 426, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1040, '2025-03-17 00:00:00', '2025-03-17T11:45:00.0', '2025-03-17T12:00:00.0', 255, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1041, '2025-03-17 00:00:00', '2025-03-17T12:00:00.0', '2025-03-17T12:15:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1042, '2025-03-17 00:00:00', '2025-03-17T12:15:00.0', '2025-03-17T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1043, '2025-03-17 00:00:00', '2025-03-17T12:30:00.0', '2025-03-17T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1044, '2025-03-17 00:00:00', '2025-03-17T12:45:00.0', '2025-03-17T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1045, '2025-03-17 00:00:00', '2025-03-17T13:00:00.0', '2025-03-17T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1046, '2025-03-17 00:00:00', '2025-03-17T13:15:00.0', '2025-03-17T13:30:00.0', 23, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1047, '2025-03-17 00:00:00', '2025-03-17T13:30:00.0', '2025-03-17T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1048, '2025-03-17 00:00:00', '2025-03-17T13:45:00.0', '2025-03-17T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1049, '2025-03-17 00:00:00', '2025-03-17T14:00:00.0', '2025-03-17T14:15:00.0', 88, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1050, '2025-03-17 00:00:00', '2025-03-17T14:15:00.0', '2025-03-17T14:30:00.0', 825, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1051, '2025-03-17 00:00:00', '2025-03-17T14:30:00.0', '2025-03-17T14:45:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1052, '2025-03-17 00:00:00', '2025-03-17T14:45:00.0', '2025-03-17T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1053, '2025-03-17 00:00:00', '2025-03-17T15:00:00.0', '2025-03-17T15:15:00.0', 161, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1054, '2025-03-17 00:00:00', '2025-03-17T15:15:00.0', '2025-03-17T15:30:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1055, '2025-03-17 00:00:00', '2025-03-17T15:30:00.0', '2025-03-17T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1056, '2025-03-17 00:00:00', '2025-03-17T15:45:00.0', '2025-03-17T16:00:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1057, '2025-03-18 00:00:00', '2025-03-17T16:00:00.0', '2025-03-17T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1058, '2025-03-18 00:00:00', '2025-03-17T16:15:00.0', '2025-03-17T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1059, '2025-03-18 00:00:00', '2025-03-17T16:30:00.0', '2025-03-17T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1060, '2025-03-18 00:00:00', '2025-03-17T16:45:00.0', '2025-03-17T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1061, '2025-03-18 00:00:00', '2025-03-17T17:00:00.0', '2025-03-17T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1062, '2025-03-18 00:00:00', '2025-03-17T17:15:00.0', '2025-03-17T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1063, '2025-03-18 00:00:00', '2025-03-17T17:30:00.0', '2025-03-17T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1064, '2025-03-18 00:00:00', '2025-03-17T17:45:00.0', '2025-03-17T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1065, '2025-03-18 00:00:00', '2025-03-17T18:00:00.0', '2025-03-17T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1066, '2025-03-18 00:00:00', '2025-03-17T18:15:00.0', '2025-03-17T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1067, '2025-03-18 00:00:00', '2025-03-17T18:30:00.0', '2025-03-17T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1068, '2025-03-18 00:00:00', '2025-03-17T18:45:00.0', '2025-03-17T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1069, '2025-03-18 00:00:00', '2025-03-17T19:00:00.0', '2025-03-17T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1070, '2025-03-18 00:00:00', '2025-03-17T19:15:00.0', '2025-03-17T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1071, '2025-03-18 00:00:00', '2025-03-17T19:30:00.0', '2025-03-17T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1072, '2025-03-18 00:00:00', '2025-03-17T19:45:00.0', '2025-03-17T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1073, '2025-03-18 00:00:00', '2025-03-17T20:00:00.0', '2025-03-17T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1074, '2025-03-18 00:00:00', '2025-03-17T20:15:00.0', '2025-03-17T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1075, '2025-03-18 00:00:00', '2025-03-17T20:30:00.0', '2025-03-17T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1076, '2025-03-18 00:00:00', '2025-03-17T20:45:00.0', '2025-03-17T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1077, '2025-03-18 00:00:00', '2025-03-17T21:00:00.0', '2025-03-17T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1078, '2025-03-18 00:00:00', '2025-03-17T21:15:00.0', '2025-03-17T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1079, '2025-03-18 00:00:00', '2025-03-17T21:30:00.0', '2025-03-17T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1080, '2025-03-18 00:00:00', '2025-03-17T21:45:00.0', '2025-03-17T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1081, '2025-03-18 00:00:00', '2025-03-17T22:00:00.0', '2025-03-17T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1082, '2025-03-18 00:00:00', '2025-03-17T22:15:00.0', '2025-03-17T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1083, '2025-03-18 00:00:00', '2025-03-17T22:30:00.0', '2025-03-17T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1084, '2025-03-18 00:00:00', '2025-03-17T22:45:00.0', '2025-03-17T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1085, '2025-03-18 00:00:00', '2025-03-17T23:00:00.0', '2025-03-17T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1086, '2025-03-18 00:00:00', '2025-03-17T23:15:00.0', '2025-03-17T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1087, '2025-03-18 00:00:00', '2025-03-17T23:30:00.0', '2025-03-17T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1088, '2025-03-18 00:00:00', '2025-03-17T23:45:00.0', '2025-03-18T00:00:00.0', 161, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1089, '2025-03-18 00:00:00', '2025-03-18T00:00:00.0', '2025-03-18T00:15:00.0', 319, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1090, '2025-03-18 00:00:00', '2025-03-18T00:15:00.0', '2025-03-18T00:30:00.0', 22, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1091, '2025-03-18 00:00:00', '2025-03-18T00:30:00.0', '2025-03-18T00:45:00.0', 58, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1092, '2025-03-18 00:00:00', '2025-03-18T00:45:00.0', '2025-03-18T01:00:00.0', 34, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1093, '2025-03-18 00:00:00', '2025-03-18T01:00:00.0', '2025-03-18T01:15:00.0', 537, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1094, '2025-03-18 00:00:00', '2025-03-18T01:15:00.0', '2025-03-18T01:30:00.0', 119, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1095, '2025-03-18 00:00:00', '2025-03-18T01:30:00.0', '2025-03-18T01:45:00.0', 146, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1096, '2025-03-18 00:00:00', '2025-03-18T01:45:00.0', '2025-03-18T02:00:00.0', 178, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1097, '2025-03-18 00:00:00', '2025-03-18T02:00:00.0', '2025-03-18T02:15:00.0', 210, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1098, '2025-03-18 00:00:00', '2025-03-18T02:15:00.0', '2025-03-18T02:30:00.0', 134, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1099, '2025-03-18 00:00:00', '2025-03-18T02:30:00.0', '2025-03-18T02:45:00.0', 185, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1100, '2025-03-18 00:00:00', '2025-03-18T02:45:00.0', '2025-03-18T03:00:00.0', 164, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1101, '2025-03-18 00:00:00', '2025-03-18T03:00:00.0', '2025-03-18T03:15:00.0', 337, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1102, '2025-03-18 00:00:00', '2025-03-18T03:15:00.0', '2025-03-18T03:30:00.0', 449, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1103, '2025-03-18 00:00:00', '2025-03-18T03:30:00.0', '2025-03-18T03:45:00.0', 722, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1104, '2025-03-18 00:00:00', '2025-03-18T03:45:00.0', '2025-03-18T04:00:00.0', 275, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1105, '2025-03-18 00:00:00', '2025-03-18T04:00:00.0', '2025-03-18T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1106, '2025-03-18 00:00:00', '2025-03-18T04:15:00.0', '2025-03-18T04:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1107, '2025-03-18 00:00:00', '2025-03-18T04:30:00.0', '2025-03-18T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1108, '2025-03-18 00:00:00', '2025-03-18T04:45:00.0', '2025-03-18T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1109, '2025-03-18 00:00:00', '2025-03-18T05:00:00.0', '2025-03-18T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1110, '2025-03-18 00:00:00', '2025-03-18T05:15:00.0', '2025-03-18T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1111, '2025-03-18 00:00:00', '2025-03-18T05:30:00.0', '2025-03-18T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1112, '2025-03-18 00:00:00', '2025-03-18T05:45:00.0', '2025-03-18T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1113, '2025-03-18 00:00:00', '2025-03-18T06:00:00.0', '2025-03-18T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1114, '2025-03-18 00:00:00', '2025-03-18T06:15:00.0', '2025-03-18T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1115, '2025-03-18 00:00:00', '2025-03-18T06:30:00.0', '2025-03-18T06:45:00.0', 524, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1116, '2025-03-18 00:00:00', '2025-03-18T06:45:00.0', '2025-03-18T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1117, '2025-03-18 00:00:00', '2025-03-18T07:00:00.0', '2025-03-18T07:15:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1118, '2025-03-18 00:00:00', '2025-03-18T07:15:00.0', '2025-03-18T07:30:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1119, '2025-03-18 00:00:00', '2025-03-18T07:30:00.0', '2025-03-18T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1120, '2025-03-18 00:00:00', '2025-03-18T07:45:00.0', '2025-03-18T08:00:00.0', 599, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1121, '2025-03-18 00:00:00', '2025-03-18T08:00:00.0', '2025-03-18T08:15:00.0', 574, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1122, '2025-03-18 00:00:00', '2025-03-18T08:15:00.0', '2025-03-18T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1123, '2025-03-18 00:00:00', '2025-03-18T08:30:00.0', '2025-03-18T08:45:00.0', 195, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1124, '2025-03-18 00:00:00', '2025-03-18T08:45:00.0', '2025-03-18T09:00:00.0', 41, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1125, '2025-03-18 00:00:00', '2025-03-18T09:00:00.0', '2025-03-18T09:15:00.0', 415, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1126, '2025-03-18 00:00:00', '2025-03-18T09:15:00.0', '2025-03-18T09:30:00.0', 247, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1127, '2025-03-18 00:00:00', '2025-03-18T09:30:00.0', '2025-03-18T09:45:00.0', 638, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1128, '2025-03-18 00:00:00', '2025-03-18T09:45:00.0', '2025-03-18T10:00:00.0', 142, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1129, '2025-03-18 00:00:00', '2025-03-18T10:00:00.0', '2025-03-18T10:15:00.0', 59, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1130, '2025-03-18 00:00:00', '2025-03-18T10:15:00.0', '2025-03-18T10:30:00.0', 307, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1131, '2025-03-18 00:00:00', '2025-03-18T10:30:00.0', '2025-03-18T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1132, '2025-03-18 00:00:00', '2025-03-18T10:45:00.0', '2025-03-18T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1133, '2025-03-18 00:00:00', '2025-03-18T11:00:00.0', '2025-03-18T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1134, '2025-03-18 00:00:00', '2025-03-18T11:15:00.0', '2025-03-18T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1135, '2025-03-18 00:00:00', '2025-03-18T11:30:00.0', '2025-03-18T11:45:00.0', 67, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1136, '2025-03-18 00:00:00', '2025-03-18T11:45:00.0', '2025-03-18T12:00:00.0', 423, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1137, '2025-03-18 00:00:00', '2025-03-18T12:00:00.0', '2025-03-18T12:15:00.0', 319, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1138, '2025-03-18 00:00:00', '2025-03-18T12:15:00.0', '2025-03-18T12:30:00.0', 128, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1139, '2025-03-18 00:00:00', '2025-03-18T12:30:00.0', '2025-03-18T12:45:00.0', 108, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1140, '2025-03-18 00:00:00', '2025-03-18T12:45:00.0', '2025-03-18T13:00:00.0', 45, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1141, '2025-03-18 00:00:00', '2025-03-18T13:00:00.0', '2025-03-18T13:15:00.0', 196, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1142, '2025-03-18 00:00:00', '2025-03-18T13:15:00.0', '2025-03-18T13:30:00.0', 40, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1143, '2025-03-18 00:00:00', '2025-03-18T13:30:00.0', '2025-03-18T13:45:00.0', 54, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1144, '2025-03-18 00:00:00', '2025-03-18T13:45:00.0', '2025-03-18T14:00:00.0', 60, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1145, '2025-03-18 00:00:00', '2025-03-18T14:00:00.0', '2025-03-18T14:15:00.0', 65, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1146, '2025-03-18 00:00:00', '2025-03-18T14:15:00.0', '2025-03-18T14:30:00.0', 61, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1147, '2025-03-18 00:00:00', '2025-03-18T14:30:00.0', '2025-03-18T14:45:00.0', 75, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1148, '2025-03-18 00:00:00', '2025-03-18T14:45:00.0', '2025-03-18T15:00:00.0', 265, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1149, '2025-03-18 00:00:00', '2025-03-18T15:00:00.0', '2025-03-18T15:15:00.0', 92, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1150, '2025-03-18 00:00:00', '2025-03-18T15:15:00.0', '2025-03-18T15:30:00.0', 41, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1151, '2025-03-18 00:00:00', '2025-03-18T15:30:00.0', '2025-03-18T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1152, '2025-03-18 00:00:00', '2025-03-18T15:45:00.0', '2025-03-18T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1153, '2025-03-19 00:00:00', '2025-03-18T16:00:00.0', '2025-03-18T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1154, '2025-03-19 00:00:00', '2025-03-18T16:15:00.0', '2025-03-18T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1155, '2025-03-19 00:00:00', '2025-03-18T16:30:00.0', '2025-03-18T16:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1156, '2025-03-19 00:00:00', '2025-03-18T16:45:00.0', '2025-03-18T17:00:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1157, '2025-03-19 00:00:00', '2025-03-18T17:00:00.0', '2025-03-18T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1158, '2025-03-19 00:00:00', '2025-03-18T17:15:00.0', '2025-03-18T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1159, '2025-03-19 00:00:00', '2025-03-18T17:30:00.0', '2025-03-18T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1160, '2025-03-19 00:00:00', '2025-03-18T17:45:00.0', '2025-03-18T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1161, '2025-03-19 00:00:00', '2025-03-18T18:00:00.0', '2025-03-18T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1162, '2025-03-19 00:00:00', '2025-03-18T18:15:00.0', '2025-03-18T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1163, '2025-03-19 00:00:00', '2025-03-18T18:30:00.0', '2025-03-18T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1164, '2025-03-19 00:00:00', '2025-03-18T18:45:00.0', '2025-03-18T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1165, '2025-03-19 00:00:00', '2025-03-18T19:00:00.0', '2025-03-18T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1166, '2025-03-19 00:00:00', '2025-03-18T19:15:00.0', '2025-03-18T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1167, '2025-03-19 00:00:00', '2025-03-18T19:30:00.0', '2025-03-18T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1168, '2025-03-19 00:00:00', '2025-03-18T19:45:00.0', '2025-03-18T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1169, '2025-03-19 00:00:00', '2025-03-18T20:00:00.0', '2025-03-18T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1170, '2025-03-19 00:00:00', '2025-03-18T20:15:00.0', '2025-03-18T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1171, '2025-03-19 00:00:00', '2025-03-18T20:30:00.0', '2025-03-18T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1172, '2025-03-19 00:00:00', '2025-03-18T20:45:00.0', '2025-03-18T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1173, '2025-03-19 00:00:00', '2025-03-18T21:00:00.0', '2025-03-18T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1174, '2025-03-19 00:00:00', '2025-03-18T21:15:00.0', '2025-03-18T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1175, '2025-03-19 00:00:00', '2025-03-18T21:30:00.0', '2025-03-18T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1176, '2025-03-19 00:00:00', '2025-03-18T21:45:00.0', '2025-03-18T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1177, '2025-03-19 00:00:00', '2025-03-18T22:00:00.0', '2025-03-18T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1178, '2025-03-19 00:00:00', '2025-03-18T22:15:00.0', '2025-03-18T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1179, '2025-03-19 00:00:00', '2025-03-18T22:30:00.0', '2025-03-18T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1180, '2025-03-19 00:00:00', '2025-03-18T22:45:00.0', '2025-03-18T23:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1181, '2025-03-19 00:00:00', '2025-03-18T23:00:00.0', '2025-03-18T23:15:00.0', 244, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1182, '2025-03-19 00:00:00', '2025-03-18T23:15:00.0', '2025-03-18T23:30:00.0', 247, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1183, '2025-03-19 00:00:00', '2025-03-18T23:30:00.0', '2025-03-18T23:45:00.0', 91, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1184, '2025-03-19 00:00:00', '2025-03-18T23:45:00.0', '2025-03-19T00:00:00.0', 143, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1185, '2025-03-19 00:00:00', '2025-03-19T00:00:00.0', '2025-03-19T00:15:00.0', 517, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1186, '2025-03-19 00:00:00', '2025-03-19T00:15:00.0', '2025-03-19T00:30:00.0', 703, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1187, '2025-03-19 00:00:00', '2025-03-19T00:30:00.0', '2025-03-19T00:45:00.0', 248, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1188, '2025-03-19 00:00:00', '2025-03-19T00:45:00.0', '2025-03-19T01:00:00.0', 133, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1189, '2025-03-19 00:00:00', '2025-03-19T01:00:00.0', '2025-03-19T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1190, '2025-03-19 00:00:00', '2025-03-19T01:15:00.0', '2025-03-19T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1191, '2025-03-19 00:00:00', '2025-03-19T01:30:00.0', '2025-03-19T01:45:00.0', 20, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1192, '2025-03-19 00:00:00', '2025-03-19T01:45:00.0', '2025-03-19T02:00:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1193, '2025-03-19 00:00:00', '2025-03-19T02:00:00.0', '2025-03-19T02:15:00.0', 34, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1194, '2025-03-19 00:00:00', '2025-03-19T02:15:00.0', '2025-03-19T02:30:00.0', 46, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1195, '2025-03-19 00:00:00', '2025-03-19T02:30:00.0', '2025-03-19T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1196, '2025-03-19 00:00:00', '2025-03-19T02:45:00.0', '2025-03-19T03:00:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1197, '2025-03-19 00:00:00', '2025-03-19T03:00:00.0', '2025-03-19T03:15:00.0', 41, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1198, '2025-03-19 00:00:00', '2025-03-19T03:15:00.0', '2025-03-19T03:30:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1199, '2025-03-19 00:00:00', '2025-03-19T03:30:00.0', '2025-03-19T03:45:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1200, '2025-03-19 00:00:00', '2025-03-19T03:45:00.0', '2025-03-19T04:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1201, '2025-03-19 00:00:00', '2025-03-19T04:00:00.0', '2025-03-19T04:15:00.0', 579, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1202, '2025-03-19 00:00:00', '2025-03-19T04:15:00.0', '2025-03-19T04:30:00.0', 250, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1203, '2025-03-19 00:00:00', '2025-03-19T04:30:00.0', '2025-03-19T04:45:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1204, '2025-03-19 00:00:00', '2025-03-19T04:45:00.0', '2025-03-19T05:00:00.0', 565, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1205, '2025-03-19 00:00:00', '2025-03-19T05:00:00.0', '2025-03-19T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1206, '2025-03-19 00:00:00', '2025-03-19T05:15:00.0', '2025-03-19T05:30:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1207, '2025-03-19 00:00:00', '2025-03-19T05:30:00.0', '2025-03-19T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1208, '2025-03-19 00:00:00', '2025-03-19T05:45:00.0', '2025-03-19T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1209, '2025-03-19 00:00:00', '2025-03-19T06:00:00.0', '2025-03-19T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1210, '2025-03-19 00:00:00', '2025-03-19T06:15:00.0', '2025-03-19T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1211, '2025-03-19 00:00:00', '2025-03-19T06:30:00.0', '2025-03-19T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1212, '2025-03-19 00:00:00', '2025-03-19T06:45:00.0', '2025-03-19T07:00:00.0', 406, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1213, '2025-03-19 00:00:00', '2025-03-19T07:00:00.0', '2025-03-19T07:15:00.0', 21, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1214, '2025-03-19 00:00:00', '2025-03-19T07:15:00.0', '2025-03-19T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1215, '2025-03-19 00:00:00', '2025-03-19T07:30:00.0', '2025-03-19T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1216, '2025-03-19 00:00:00', '2025-03-19T07:45:00.0', '2025-03-19T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1217, '2025-03-19 00:00:00', '2025-03-19T08:00:00.0', '2025-03-19T08:15:00.0', 930, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1218, '2025-03-19 00:00:00', '2025-03-19T08:15:00.0', '2025-03-19T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1219, '2025-03-19 00:00:00', '2025-03-19T08:30:00.0', '2025-03-19T08:45:00.0', 20, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1220, '2025-03-19 00:00:00', '2025-03-19T08:45:00.0', '2025-03-19T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1221, '2025-03-19 00:00:00', '2025-03-19T09:00:00.0', '2025-03-19T09:15:00.0', 555, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1222, '2025-03-19 00:00:00', '2025-03-19T09:15:00.0', '2025-03-19T09:30:00.0', 245, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1223, '2025-03-19 00:00:00', '2025-03-19T09:30:00.0', '2025-03-19T09:45:00.0', 218, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1224, '2025-03-19 00:00:00', '2025-03-19T09:45:00.0', '2025-03-19T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1225, '2025-03-19 00:00:00', '2025-03-19T10:00:00.0', '2025-03-19T10:15:00.0', 10, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1226, '2025-03-19 00:00:00', '2025-03-19T10:15:00.0', '2025-03-19T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1227, '2025-03-19 00:00:00', '2025-03-19T10:30:00.0', '2025-03-19T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1228, '2025-03-19 00:00:00', '2025-03-19T10:45:00.0', '2025-03-19T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1229, '2025-03-19 00:00:00', '2025-03-19T11:00:00.0', '2025-03-19T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1230, '2025-03-19 00:00:00', '2025-03-19T11:15:00.0', '2025-03-19T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1231, '2025-03-19 00:00:00', '2025-03-19T11:30:00.0', '2025-03-19T11:45:00.0', 296, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1232, '2025-03-19 00:00:00', '2025-03-19T11:45:00.0', '2025-03-19T12:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1233, '2025-03-19 00:00:00', '2025-03-19T12:00:00.0', '2025-03-19T12:15:00.0', 214, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1234, '2025-03-19 00:00:00', '2025-03-19T12:15:00.0', '2025-03-19T12:30:00.0', 267, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1235, '2025-03-19 00:00:00', '2025-03-19T12:30:00.0', '2025-03-19T12:45:00.0', 156, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1236, '2025-03-19 00:00:00', '2025-03-19T12:45:00.0', '2025-03-19T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1237, '2025-03-19 00:00:00', '2025-03-19T13:00:00.0', '2025-03-19T13:15:00.0', 445, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1238, '2025-03-19 00:00:00', '2025-03-19T13:15:00.0', '2025-03-19T13:30:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1239, '2025-03-19 00:00:00', '2025-03-19T13:30:00.0', '2025-03-19T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1240, '2025-03-19 00:00:00', '2025-03-19T13:45:00.0', '2025-03-19T14:00:00.0', 35, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1241, '2025-03-19 00:00:00', '2025-03-19T14:00:00.0', '2025-03-19T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1242, '2025-03-19 00:00:00', '2025-03-19T14:15:00.0', '2025-03-19T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1243, '2025-03-19 00:00:00', '2025-03-19T14:30:00.0', '2025-03-19T14:45:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1244, '2025-03-19 00:00:00', '2025-03-19T14:45:00.0', '2025-03-19T15:00:00.0', 131, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1245, '2025-03-19 00:00:00', '2025-03-19T15:00:00.0', '2025-03-19T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1246, '2025-03-19 00:00:00', '2025-03-19T15:15:00.0', '2025-03-19T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1247, '2025-03-19 00:00:00', '2025-03-19T15:30:00.0', '2025-03-19T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1248, '2025-03-19 00:00:00', '2025-03-19T15:45:00.0', '2025-03-19T16:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1249, '2025-03-20 00:00:00', '2025-03-19T16:00:00.0', '2025-03-19T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1250, '2025-03-20 00:00:00', '2025-03-19T16:15:00.0', '2025-03-19T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1251, '2025-03-20 00:00:00', '2025-03-19T16:30:00.0', '2025-03-19T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1252, '2025-03-20 00:00:00', '2025-03-19T16:45:00.0', '2025-03-19T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1253, '2025-03-20 00:00:00', '2025-03-19T17:00:00.0', '2025-03-19T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1254, '2025-03-20 00:00:00', '2025-03-19T17:15:00.0', '2025-03-19T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1255, '2025-03-20 00:00:00', '2025-03-19T17:30:00.0', '2025-03-19T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1256, '2025-03-20 00:00:00', '2025-03-19T17:45:00.0', '2025-03-19T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1257, '2025-03-20 00:00:00', '2025-03-19T18:00:00.0', '2025-03-19T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1258, '2025-03-20 00:00:00', '2025-03-19T18:15:00.0', '2025-03-19T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1259, '2025-03-20 00:00:00', '2025-03-19T18:30:00.0', '2025-03-19T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1260, '2025-03-20 00:00:00', '2025-03-19T18:45:00.0', '2025-03-19T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1261, '2025-03-20 00:00:00', '2025-03-19T19:00:00.0', '2025-03-19T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1262, '2025-03-20 00:00:00', '2025-03-19T19:15:00.0', '2025-03-19T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1263, '2025-03-20 00:00:00', '2025-03-19T19:30:00.0', '2025-03-19T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1264, '2025-03-20 00:00:00', '2025-03-19T19:45:00.0', '2025-03-19T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1265, '2025-03-20 00:00:00', '2025-03-19T20:00:00.0', '2025-03-19T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1266, '2025-03-20 00:00:00', '2025-03-19T20:15:00.0', '2025-03-19T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1267, '2025-03-20 00:00:00', '2025-03-19T20:30:00.0', '2025-03-19T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1268, '2025-03-20 00:00:00', '2025-03-19T20:45:00.0', '2025-03-19T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1269, '2025-03-20 00:00:00', '2025-03-19T21:00:00.0', '2025-03-19T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1270, '2025-03-20 00:00:00', '2025-03-19T21:15:00.0', '2025-03-19T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1271, '2025-03-20 00:00:00', '2025-03-19T21:30:00.0', '2025-03-19T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1272, '2025-03-20 00:00:00', '2025-03-19T21:45:00.0', '2025-03-19T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1273, '2025-03-20 00:00:00', '2025-03-19T22:00:00.0', '2025-03-19T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1274, '2025-03-20 00:00:00', '2025-03-19T22:15:00.0', '2025-03-19T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1275, '2025-03-20 00:00:00', '2025-03-19T22:30:00.0', '2025-03-19T22:45:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1276, '2025-03-20 00:00:00', '2025-03-19T22:45:00.0', '2025-03-19T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1277, '2025-03-20 00:00:00', '2025-03-19T23:00:00.0', '2025-03-19T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1278, '2025-03-20 00:00:00', '2025-03-19T23:15:00.0', '2025-03-19T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1279, '2025-03-20 00:00:00', '2025-03-19T23:30:00.0', '2025-03-19T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1280, '2025-03-20 00:00:00', '2025-03-19T23:45:00.0', '2025-03-20T00:00:00.0', 130, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1281, '2025-03-20 00:00:00', '2025-03-20T00:00:00.0', '2025-03-20T00:15:00.0', 323, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1282, '2025-03-20 00:00:00', '2025-03-20T00:15:00.0', '2025-03-20T00:30:00.0', 976, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1283, '2025-03-20 00:00:00', '2025-03-20T00:30:00.0', '2025-03-20T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1284, '2025-03-20 00:00:00', '2025-03-20T00:45:00.0', '2025-03-20T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1285, '2025-03-20 00:00:00', '2025-03-20T01:00:00.0', '2025-03-20T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1286, '2025-03-20 00:00:00', '2025-03-20T01:15:00.0', '2025-03-20T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1287, '2025-03-20 00:00:00', '2025-03-20T01:30:00.0', '2025-03-20T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1288, '2025-03-20 00:00:00', '2025-03-20T01:45:00.0', '2025-03-20T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1289, '2025-03-20 00:00:00', '2025-03-20T02:00:00.0', '2025-03-20T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1290, '2025-03-20 00:00:00', '2025-03-20T02:15:00.0', '2025-03-20T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1291, '2025-03-20 00:00:00', '2025-03-20T02:30:00.0', '2025-03-20T02:45:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1292, '2025-03-20 00:00:00', '2025-03-20T02:45:00.0', '2025-03-20T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1293, '2025-03-20 00:00:00', '2025-03-20T03:00:00.0', '2025-03-20T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1294, '2025-03-20 00:00:00', '2025-03-20T03:15:00.0', '2025-03-20T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1295, '2025-03-20 00:00:00', '2025-03-20T03:30:00.0', '2025-03-20T03:45:00.0', 356, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1296, '2025-03-20 00:00:00', '2025-03-20T03:45:00.0', '2025-03-20T04:00:00.0', 338, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1297, '2025-03-20 00:00:00', '2025-03-20T04:00:00.0', '2025-03-20T04:15:00.0', 607, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1298, '2025-03-20 00:00:00', '2025-03-20T04:15:00.0', '2025-03-20T04:30:00.0', 0, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1299, '2025-03-20 00:00:00', '2025-03-20T04:30:00.0', '2025-03-20T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1300, '2025-03-20 00:00:00', '2025-03-20T04:45:00.0', '2025-03-20T05:00:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1301, '2025-03-20 00:00:00', '2025-03-20T05:00:00.0', '2025-03-20T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1302, '2025-03-20 00:00:00', '2025-03-20T05:15:00.0', '2025-03-20T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1303, '2025-03-20 00:00:00', '2025-03-20T05:30:00.0', '2025-03-20T05:45:00.0', 195, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1304, '2025-03-20 00:00:00', '2025-03-20T05:45:00.0', '2025-03-20T06:00:00.0', 371, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1305, '2025-03-20 00:00:00', '2025-03-20T06:00:00.0', '2025-03-20T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1306, '2025-03-20 00:00:00', '2025-03-20T06:15:00.0', '2025-03-20T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1307, '2025-03-20 00:00:00', '2025-03-20T06:30:00.0', '2025-03-20T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1308, '2025-03-20 00:00:00', '2025-03-20T06:45:00.0', '2025-03-20T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1309, '2025-03-20 00:00:00', '2025-03-20T07:00:00.0', '2025-03-20T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1310, '2025-03-20 00:00:00', '2025-03-20T07:15:00.0', '2025-03-20T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1311, '2025-03-20 00:00:00', '2025-03-20T07:30:00.0', '2025-03-20T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1312, '2025-03-20 00:00:00', '2025-03-20T07:45:00.0', '2025-03-20T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1313, '2025-03-20 00:00:00', '2025-03-20T08:00:00.0', '2025-03-20T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1314, '2025-03-20 00:00:00', '2025-03-20T08:15:00.0', '2025-03-20T08:30:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1315, '2025-03-20 00:00:00', '2025-03-20T08:30:00.0', '2025-03-20T08:45:00.0', 58, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1316, '2025-03-20 00:00:00', '2025-03-20T08:45:00.0', '2025-03-20T09:00:00.0', 83, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1317, '2025-03-20 00:00:00', '2025-03-20T09:00:00.0', '2025-03-20T09:15:00.0', 425, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1318, '2025-03-20 00:00:00', '2025-03-20T09:15:00.0', '2025-03-20T09:30:00.0', 358, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1319, '2025-03-20 00:00:00', '2025-03-20T09:30:00.0', '2025-03-20T09:45:00.0', 120, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1320, '2025-03-20 00:00:00', '2025-03-20T09:45:00.0', '2025-03-20T10:00:00.0', 165, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1321, '2025-03-20 00:00:00', '2025-03-20T10:00:00.0', '2025-03-20T10:15:00.0', 515, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1322, '2025-03-20 00:00:00', '2025-03-20T10:15:00.0', '2025-03-20T10:30:00.0', 257, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1323, '2025-03-20 00:00:00', '2025-03-20T10:30:00.0', '2025-03-20T10:45:00.0', 377, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1324, '2025-03-20 00:00:00', '2025-03-20T10:45:00.0', '2025-03-20T11:00:00.0', 157, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1325, '2025-03-20 00:00:00', '2025-03-20T11:00:00.0', '2025-03-20T11:15:00.0', 548, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1326, '2025-03-20 00:00:00', '2025-03-20T11:15:00.0', '2025-03-20T11:30:00.0', 486, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1327, '2025-03-20 00:00:00', '2025-03-20T11:30:00.0', '2025-03-20T11:45:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1328, '2025-03-20 00:00:00', '2025-03-20T11:45:00.0', '2025-03-20T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1329, '2025-03-20 00:00:00', '2025-03-20T12:00:00.0', '2025-03-20T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1330, '2025-03-20 00:00:00', '2025-03-20T12:15:00.0', '2025-03-20T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1331, '2025-03-20 00:00:00', '2025-03-20T12:30:00.0', '2025-03-20T12:45:00.0', 164, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1332, '2025-03-20 00:00:00', '2025-03-20T12:45:00.0', '2025-03-20T13:00:00.0', 25, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1333, '2025-03-20 00:00:00', '2025-03-20T13:00:00.0', '2025-03-20T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1334, '2025-03-20 00:00:00', '2025-03-20T13:15:00.0', '2025-03-20T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1335, '2025-03-20 00:00:00', '2025-03-20T13:30:00.0', '2025-03-20T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1336, '2025-03-20 00:00:00', '2025-03-20T13:45:00.0', '2025-03-20T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1337, '2025-03-20 00:00:00', '2025-03-20T14:00:00.0', '2025-03-20T14:15:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1338, '2025-03-20 00:00:00', '2025-03-20T14:15:00.0', '2025-03-20T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1339, '2025-03-20 00:00:00', '2025-03-20T14:30:00.0', '2025-03-20T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1340, '2025-03-20 00:00:00', '2025-03-20T14:45:00.0', '2025-03-20T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1341, '2025-03-20 00:00:00', '2025-03-20T15:00:00.0', '2025-03-20T15:15:00.0', 303, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1342, '2025-03-20 00:00:00', '2025-03-20T15:15:00.0', '2025-03-20T15:30:00.0', 381, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1343, '2025-03-20 00:00:00', '2025-03-20T15:30:00.0', '2025-03-20T15:45:00.0', 191, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1344, '2025-03-20 00:00:00', '2025-03-20T15:45:00.0', '2025-03-20T16:00:00.0', 86, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1345, '2025-03-21 00:00:00', '2025-03-20T16:00:00.0', '2025-03-20T16:15:00.0', 69, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1346, '2025-03-21 00:00:00', '2025-03-20T16:15:00.0', '2025-03-20T16:30:00.0', 47, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1347, '2025-03-21 00:00:00', '2025-03-20T16:30:00.0', '2025-03-20T16:45:00.0', 37, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1348, '2025-03-21 00:00:00', '2025-03-20T16:45:00.0', '2025-03-20T17:00:00.0', 462, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1349, '2025-03-21 00:00:00', '2025-03-20T17:00:00.0', '2025-03-20T17:15:00.0', 82, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1350, '2025-03-21 00:00:00', '2025-03-20T17:15:00.0', '2025-03-20T17:30:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1351, '2025-03-21 00:00:00', '2025-03-20T17:30:00.0', '2025-03-20T17:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1352, '2025-03-21 00:00:00', '2025-03-20T17:45:00.0', '2025-03-20T18:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1353, '2025-03-21 00:00:00', '2025-03-20T18:00:00.0', '2025-03-20T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1354, '2025-03-21 00:00:00', '2025-03-20T18:15:00.0', '2025-03-20T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1355, '2025-03-21 00:00:00', '2025-03-20T18:30:00.0', '2025-03-20T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1356, '2025-03-21 00:00:00', '2025-03-20T18:45:00.0', '2025-03-20T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1357, '2025-03-21 00:00:00', '2025-03-20T19:00:00.0', '2025-03-20T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1358, '2025-03-21 00:00:00', '2025-03-20T19:15:00.0', '2025-03-20T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1359, '2025-03-21 00:00:00', '2025-03-20T19:30:00.0', '2025-03-20T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1360, '2025-03-21 00:00:00', '2025-03-20T19:45:00.0', '2025-03-20T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1361, '2025-03-21 00:00:00', '2025-03-20T20:00:00.0', '2025-03-20T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1362, '2025-03-21 00:00:00', '2025-03-20T20:15:00.0', '2025-03-20T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1363, '2025-03-21 00:00:00', '2025-03-20T20:30:00.0', '2025-03-20T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1364, '2025-03-21 00:00:00', '2025-03-20T20:45:00.0', '2025-03-20T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1365, '2025-03-21 00:00:00', '2025-03-20T21:00:00.0', '2025-03-20T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1366, '2025-03-21 00:00:00', '2025-03-20T21:15:00.0', '2025-03-20T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1367, '2025-03-21 00:00:00', '2025-03-20T21:30:00.0', '2025-03-20T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1368, '2025-03-21 00:00:00', '2025-03-20T21:45:00.0', '2025-03-20T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1369, '2025-03-21 00:00:00', '2025-03-20T22:00:00.0', '2025-03-20T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1370, '2025-03-21 00:00:00', '2025-03-20T22:15:00.0', '2025-03-20T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1371, '2025-03-21 00:00:00', '2025-03-20T22:30:00.0', '2025-03-20T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1372, '2025-03-21 00:00:00', '2025-03-20T22:45:00.0', '2025-03-20T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1373, '2025-03-21 00:00:00', '2025-03-20T23:00:00.0', '2025-03-20T23:15:00.0', 79, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1374, '2025-03-21 00:00:00', '2025-03-20T23:15:00.0', '2025-03-20T23:30:00.0', 207, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1375, '2025-03-21 00:00:00', '2025-03-20T23:30:00.0', '2025-03-20T23:45:00.0', 64, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1376, '2025-03-21 00:00:00', '2025-03-20T23:45:00.0', '2025-03-21T00:00:00.0', 269, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1377, '2025-03-21 00:00:00', '2025-03-21T00:00:00.0', '2025-03-21T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1378, '2025-03-21 00:00:00', '2025-03-21T00:15:00.0', '2025-03-21T00:30:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1379, '2025-03-21 00:00:00', '2025-03-21T00:30:00.0', '2025-03-21T00:45:00.0', 176, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1380, '2025-03-21 00:00:00', '2025-03-21T00:45:00.0', '2025-03-21T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1381, '2025-03-21 00:00:00', '2025-03-21T01:00:00.0', '2025-03-21T01:15:00.0', 91, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1382, '2025-03-21 00:00:00', '2025-03-21T01:15:00.0', '2025-03-21T01:30:00.0', 391, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1383, '2025-03-21 00:00:00', '2025-03-21T01:30:00.0', '2025-03-21T01:45:00.0', 304, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1384, '2025-03-21 00:00:00', '2025-03-21T01:45:00.0', '2025-03-21T02:00:00.0', 219, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1385, '2025-03-21 00:00:00', '2025-03-21T02:00:00.0', '2025-03-21T02:15:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1386, '2025-03-21 00:00:00', '2025-03-21T02:15:00.0', '2025-03-21T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1387, '2025-03-21 00:00:00', '2025-03-21T02:30:00.0', '2025-03-21T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1388, '2025-03-21 00:00:00', '2025-03-21T02:45:00.0', '2025-03-21T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1389, '2025-03-21 00:00:00', '2025-03-21T03:00:00.0', '2025-03-21T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1390, '2025-03-21 00:00:00', '2025-03-21T03:15:00.0', '2025-03-21T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1391, '2025-03-21 00:00:00', '2025-03-21T03:30:00.0', '2025-03-21T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1392, '2025-03-21 00:00:00', '2025-03-21T03:45:00.0', '2025-03-21T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1393, '2025-03-21 00:00:00', '2025-03-21T04:00:00.0', '2025-03-21T04:15:00.0', 420, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1394, '2025-03-21 00:00:00', '2025-03-21T04:15:00.0', '2025-03-21T04:30:00.0', 179, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1395, '2025-03-21 00:00:00', '2025-03-21T04:30:00.0', '2025-03-21T04:45:00.0', 87, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1396, '2025-03-21 00:00:00', '2025-03-21T04:45:00.0', '2025-03-21T05:00:00.0', 398, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1397, '2025-03-21 00:00:00', '2025-03-21T05:00:00.0', '2025-03-21T05:15:00.0', 97, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1398, '2025-03-21 00:00:00', '2025-03-21T05:15:00.0', '2025-03-21T05:30:00.0', 73, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1399, '2025-03-21 00:00:00', '2025-03-21T05:30:00.0', '2025-03-21T05:45:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1400, '2025-03-21 00:00:00', '2025-03-21T05:45:00.0', '2025-03-21T06:00:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1401, '2025-03-21 00:00:00', '2025-03-21T06:00:00.0', '2025-03-21T06:15:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1402, '2025-03-21 00:00:00', '2025-03-21T06:15:00.0', '2025-03-21T06:30:00.0', 268, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1403, '2025-03-21 00:00:00', '2025-03-21T06:30:00.0', '2025-03-21T06:45:00.0', 341, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1404, '2025-03-21 00:00:00', '2025-03-21T06:45:00.0', '2025-03-21T07:00:00.0', 184, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1405, '2025-03-21 00:00:00', '2025-03-21T07:00:00.0', '2025-03-21T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1406, '2025-03-21 00:00:00', '2025-03-21T07:15:00.0', '2025-03-21T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1407, '2025-03-21 00:00:00', '2025-03-21T07:30:00.0', '2025-03-21T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1408, '2025-03-21 00:00:00', '2025-03-21T07:45:00.0', '2025-03-21T08:00:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1409, '2025-03-21 00:00:00', '2025-03-21T08:00:00.0', '2025-03-21T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1410, '2025-03-21 00:00:00', '2025-03-21T08:15:00.0', '2025-03-21T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1411, '2025-03-21 00:00:00', '2025-03-21T08:30:00.0', '2025-03-21T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1412, '2025-03-21 00:00:00', '2025-03-21T08:45:00.0', '2025-03-21T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1413, '2025-03-21 00:00:00', '2025-03-21T09:00:00.0', '2025-03-21T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1414, '2025-03-21 00:00:00', '2025-03-21T09:15:00.0', '2025-03-21T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1415, '2025-03-21 00:00:00', '2025-03-21T09:30:00.0', '2025-03-21T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1416, '2025-03-21 00:00:00', '2025-03-21T09:45:00.0', '2025-03-21T10:00:00.0', 87, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1417, '2025-03-21 00:00:00', '2025-03-21T10:00:00.0', '2025-03-21T10:15:00.0', 871, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1418, '2025-03-21 00:00:00', '2025-03-21T10:15:00.0', '2025-03-21T10:30:00.0', 388, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1419, '2025-03-21 00:00:00', '2025-03-21T10:30:00.0', '2025-03-21T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1420, '2025-03-21 00:00:00', '2025-03-21T10:45:00.0', '2025-03-21T11:00:00.0', 14, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1421, '2025-03-21 00:00:00', '2025-03-21T11:00:00.0', '2025-03-21T11:15:00.0', 566, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1422, '2025-03-21 00:00:00', '2025-03-21T11:15:00.0', '2025-03-21T11:30:00.0', 189, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1423, '2025-03-21 00:00:00', '2025-03-21T11:30:00.0', '2025-03-21T11:45:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1424, '2025-03-21 00:00:00', '2025-03-21T11:45:00.0', '2025-03-21T12:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1425, '2025-03-21 00:00:00', '2025-03-21T12:00:00.0', '2025-03-21T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1426, '2025-03-21 00:00:00', '2025-03-21T12:15:00.0', '2025-03-21T12:30:00.0', 207, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1427, '2025-03-21 00:00:00', '2025-03-21T12:30:00.0', '2025-03-21T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1428, '2025-03-21 00:00:00', '2025-03-21T12:45:00.0', '2025-03-21T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1429, '2025-03-21 00:00:00', '2025-03-21T13:00:00.0', '2025-03-21T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1430, '2025-03-21 00:00:00', '2025-03-21T13:15:00.0', '2025-03-21T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1431, '2025-03-21 00:00:00', '2025-03-21T13:30:00.0', '2025-03-21T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1432, '2025-03-21 00:00:00', '2025-03-21T13:45:00.0', '2025-03-21T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1433, '2025-03-21 00:00:00', '2025-03-21T14:00:00.0', '2025-03-21T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1434, '2025-03-21 00:00:00', '2025-03-21T14:15:00.0', '2025-03-21T14:30:00.0', 523, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1435, '2025-03-21 00:00:00', '2025-03-21T14:30:00.0', '2025-03-21T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1436, '2025-03-21 00:00:00', '2025-03-21T14:45:00.0', '2025-03-21T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1437, '2025-03-21 00:00:00', '2025-03-21T15:00:00.0', '2025-03-21T15:15:00.0', 108, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1438, '2025-03-21 00:00:00', '2025-03-21T15:15:00.0', '2025-03-21T15:30:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1439, '2025-03-21 00:00:00', '2025-03-21T15:30:00.0', '2025-03-21T15:45:00.0', 33, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1440, '2025-03-21 00:00:00', '2025-03-21T15:45:00.0', '2025-03-21T16:00:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1441, '2025-03-22 00:00:00', '2025-03-21T16:00:00.0', '2025-03-21T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1442, '2025-03-22 00:00:00', '2025-03-21T16:15:00.0', '2025-03-21T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1443, '2025-03-22 00:00:00', '2025-03-21T16:30:00.0', '2025-03-21T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1444, '2025-03-22 00:00:00', '2025-03-21T16:45:00.0', '2025-03-21T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1445, '2025-03-22 00:00:00', '2025-03-21T17:00:00.0', '2025-03-21T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1446, '2025-03-22 00:00:00', '2025-03-21T17:15:00.0', '2025-03-21T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1447, '2025-03-22 00:00:00', '2025-03-21T17:30:00.0', '2025-03-21T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1448, '2025-03-22 00:00:00', '2025-03-21T17:45:00.0', '2025-03-21T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1449, '2025-03-22 00:00:00', '2025-03-21T18:00:00.0', '2025-03-21T18:15:00.0', 17, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1450, '2025-03-22 00:00:00', '2025-03-21T18:15:00.0', '2025-03-21T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1451, '2025-03-22 00:00:00', '2025-03-21T18:30:00.0', '2025-03-21T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1452, '2025-03-22 00:00:00', '2025-03-21T18:45:00.0', '2025-03-21T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1453, '2025-03-22 00:00:00', '2025-03-21T19:00:00.0', '2025-03-21T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1454, '2025-03-22 00:00:00', '2025-03-21T19:15:00.0', '2025-03-21T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1455, '2025-03-22 00:00:00', '2025-03-21T19:30:00.0', '2025-03-21T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1456, '2025-03-22 00:00:00', '2025-03-21T19:45:00.0', '2025-03-21T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1457, '2025-03-22 00:00:00', '2025-03-21T20:00:00.0', '2025-03-21T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1458, '2025-03-22 00:00:00', '2025-03-21T20:15:00.0', '2025-03-21T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1459, '2025-03-22 00:00:00', '2025-03-21T20:30:00.0', '2025-03-21T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1460, '2025-03-22 00:00:00', '2025-03-21T20:45:00.0', '2025-03-21T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1461, '2025-03-22 00:00:00', '2025-03-21T21:00:00.0', '2025-03-21T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1462, '2025-03-22 00:00:00', '2025-03-21T21:15:00.0', '2025-03-21T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1463, '2025-03-22 00:00:00', '2025-03-21T21:30:00.0', '2025-03-21T21:45:00.0', 11, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1464, '2025-03-22 00:00:00', '2025-03-21T21:45:00.0', '2025-03-21T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1465, '2025-03-22 00:00:00', '2025-03-21T22:00:00.0', '2025-03-21T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1466, '2025-03-22 00:00:00', '2025-03-21T22:15:00.0', '2025-03-21T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1467, '2025-03-22 00:00:00', '2025-03-21T22:30:00.0', '2025-03-21T22:45:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1468, '2025-03-22 00:00:00', '2025-03-21T22:45:00.0', '2025-03-21T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1469, '2025-03-22 00:00:00', '2025-03-21T23:00:00.0', '2025-03-21T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1470, '2025-03-22 00:00:00', '2025-03-21T23:15:00.0', '2025-03-21T23:30:00.0', 106, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1471, '2025-03-22 00:00:00', '2025-03-21T23:30:00.0', '2025-03-21T23:45:00.0', 92, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1472, '2025-03-22 00:00:00', '2025-03-21T23:45:00.0', '2025-03-22T00:00:00.0', 164, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1473, '2025-03-22 00:00:00', '2025-03-22T00:00:00.0', '2025-03-22T00:15:00.0', 228, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1474, '2025-03-22 00:00:00', '2025-03-22T00:15:00.0', '2025-03-22T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1475, '2025-03-22 00:00:00', '2025-03-22T00:30:00.0', '2025-03-22T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1476, '2025-03-22 00:00:00', '2025-03-22T00:45:00.0', '2025-03-22T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1477, '2025-03-22 00:00:00', '2025-03-22T01:00:00.0', '2025-03-22T01:15:00.0', 72, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1478, '2025-03-22 00:00:00', '2025-03-22T01:15:00.0', '2025-03-22T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1479, '2025-03-22 00:00:00', '2025-03-22T01:30:00.0', '2025-03-22T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1480, '2025-03-22 00:00:00', '2025-03-22T01:45:00.0', '2025-03-22T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1481, '2025-03-22 00:00:00', '2025-03-22T02:00:00.0', '2025-03-22T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1482, '2025-03-22 00:00:00', '2025-03-22T02:15:00.0', '2025-03-22T02:30:00.0', 67, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1483, '2025-03-22 00:00:00', '2025-03-22T02:30:00.0', '2025-03-22T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1484, '2025-03-22 00:00:00', '2025-03-22T02:45:00.0', '2025-03-22T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1485, '2025-03-22 00:00:00', '2025-03-22T03:00:00.0', '2025-03-22T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1486, '2025-03-22 00:00:00', '2025-03-22T03:15:00.0', '2025-03-22T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1487, '2025-03-22 00:00:00', '2025-03-22T03:30:00.0', '2025-03-22T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1488, '2025-03-22 00:00:00', '2025-03-22T03:45:00.0', '2025-03-22T04:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1489, '2025-03-22 00:00:00', '2025-03-22T04:00:00.0', '2025-03-22T04:15:00.0', 1296, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1490, '2025-03-22 00:00:00', '2025-03-22T04:15:00.0', '2025-03-22T04:30:00.0', 367, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1491, '2025-03-22 00:00:00', '2025-03-22T04:30:00.0', '2025-03-22T04:45:00.0', 1025, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1492, '2025-03-22 00:00:00', '2025-03-22T04:45:00.0', '2025-03-22T05:00:00.0', 519, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1493, '2025-03-22 00:00:00', '2025-03-22T05:00:00.0', '2025-03-22T05:15:00.0', 85, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1494, '2025-03-22 00:00:00', '2025-03-22T05:15:00.0', '2025-03-22T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1495, '2025-03-22 00:00:00', '2025-03-22T05:30:00.0', '2025-03-22T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1496, '2025-03-22 00:00:00', '2025-03-22T05:45:00.0', '2025-03-22T06:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1497, '2025-03-22 00:00:00', '2025-03-22T06:00:00.0', '2025-03-22T06:15:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1498, '2025-03-22 00:00:00', '2025-03-22T06:15:00.0', '2025-03-22T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1499, '2025-03-22 00:00:00', '2025-03-22T06:30:00.0', '2025-03-22T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1500, '2025-03-22 00:00:00', '2025-03-22T06:45:00.0', '2025-03-22T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1501, '2025-03-22 00:00:00', '2025-03-22T07:00:00.0', '2025-03-22T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1502, '2025-03-22 00:00:00', '2025-03-22T07:15:00.0', '2025-03-22T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1503, '2025-03-22 00:00:00', '2025-03-22T07:30:00.0', '2025-03-22T07:45:00.0', 65, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1504, '2025-03-22 00:00:00', '2025-03-22T07:45:00.0', '2025-03-22T08:00:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1505, '2025-03-22 00:00:00', '2025-03-22T08:00:00.0', '2025-03-22T08:15:00.0', 33, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1506, '2025-03-22 00:00:00', '2025-03-22T08:15:00.0', '2025-03-22T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1507, '2025-03-22 00:00:00', '2025-03-22T08:30:00.0', '2025-03-22T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1508, '2025-03-22 00:00:00', '2025-03-22T08:45:00.0', '2025-03-22T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1509, '2025-03-22 00:00:00', '2025-03-22T09:00:00.0', '2025-03-22T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1510, '2025-03-22 00:00:00', '2025-03-22T09:15:00.0', '2025-03-22T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1511, '2025-03-22 00:00:00', '2025-03-22T09:30:00.0', '2025-03-22T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1512, '2025-03-22 00:00:00', '2025-03-22T09:45:00.0', '2025-03-22T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1513, '2025-03-22 00:00:00', '2025-03-22T10:00:00.0', '2025-03-22T10:15:00.0', 28, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1514, '2025-03-22 00:00:00', '2025-03-22T10:15:00.0', '2025-03-22T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1515, '2025-03-22 00:00:00', '2025-03-22T10:30:00.0', '2025-03-22T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1516, '2025-03-22 00:00:00', '2025-03-22T10:45:00.0', '2025-03-22T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1517, '2025-03-22 00:00:00', '2025-03-22T11:00:00.0', '2025-03-22T11:15:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1518, '2025-03-22 00:00:00', '2025-03-22T11:15:00.0', '2025-03-22T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1519, '2025-03-22 00:00:00', '2025-03-22T11:30:00.0', '2025-03-22T11:45:00.0', 257, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1520, '2025-03-22 00:00:00', '2025-03-22T11:45:00.0', '2025-03-22T12:00:00.0', 167, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1521, '2025-03-22 00:00:00', '2025-03-22T12:00:00.0', '2025-03-22T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1522, '2025-03-22 00:00:00', '2025-03-22T12:15:00.0', '2025-03-22T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1523, '2025-03-22 00:00:00', '2025-03-22T12:30:00.0', '2025-03-22T12:45:00.0', 153, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1524, '2025-03-22 00:00:00', '2025-03-22T12:45:00.0', '2025-03-22T13:00:00.0', 146, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1525, '2025-03-22 00:00:00', '2025-03-22T13:00:00.0', '2025-03-22T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1526, '2025-03-22 00:00:00', '2025-03-22T13:15:00.0', '2025-03-22T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1527, '2025-03-22 00:00:00', '2025-03-22T13:30:00.0', '2025-03-22T13:45:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1528, '2025-03-22 00:00:00', '2025-03-22T13:45:00.0', '2025-03-22T14:00:00.0', 155, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1529, '2025-03-22 00:00:00', '2025-03-22T14:00:00.0', '2025-03-22T14:15:00.0', 14, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1530, '2025-03-22 00:00:00', '2025-03-22T14:15:00.0', '2025-03-22T14:30:00.0', 159, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1531, '2025-03-22 00:00:00', '2025-03-22T14:30:00.0', '2025-03-22T14:45:00.0', 277, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1532, '2025-03-22 00:00:00', '2025-03-22T14:45:00.0', '2025-03-22T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1533, '2025-03-22 00:00:00', '2025-03-22T15:00:00.0', '2025-03-22T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1534, '2025-03-22 00:00:00', '2025-03-22T15:15:00.0', '2025-03-22T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1535, '2025-03-22 00:00:00', '2025-03-22T15:30:00.0', '2025-03-22T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1536, '2025-03-22 00:00:00', '2025-03-22T15:45:00.0', '2025-03-22T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1537, '2025-03-23 00:00:00', '2025-03-22T16:00:00.0', '2025-03-22T16:15:00.0', 160, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1538, '2025-03-23 00:00:00', '2025-03-22T16:15:00.0', '2025-03-22T16:30:00.0', 49, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1539, '2025-03-23 00:00:00', '2025-03-22T16:30:00.0', '2025-03-22T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1540, '2025-03-23 00:00:00', '2025-03-22T16:45:00.0', '2025-03-22T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1541, '2025-03-23 00:00:00', '2025-03-22T17:00:00.0', '2025-03-22T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1542, '2025-03-23 00:00:00', '2025-03-22T17:15:00.0', '2025-03-22T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1543, '2025-03-23 00:00:00', '2025-03-22T17:30:00.0', '2025-03-22T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1544, '2025-03-23 00:00:00', '2025-03-22T17:45:00.0', '2025-03-22T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1545, '2025-03-23 00:00:00', '2025-03-22T18:00:00.0', '2025-03-22T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1546, '2025-03-23 00:00:00', '2025-03-22T18:15:00.0', '2025-03-22T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1547, '2025-03-23 00:00:00', '2025-03-22T18:30:00.0', '2025-03-22T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1548, '2025-03-23 00:00:00', '2025-03-22T18:45:00.0', '2025-03-22T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1549, '2025-03-23 00:00:00', '2025-03-22T19:00:00.0', '2025-03-22T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1550, '2025-03-23 00:00:00', '2025-03-22T19:15:00.0', '2025-03-22T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1551, '2025-03-23 00:00:00', '2025-03-22T19:30:00.0', '2025-03-22T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1552, '2025-03-23 00:00:00', '2025-03-22T19:45:00.0', '2025-03-22T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1553, '2025-03-23 00:00:00', '2025-03-22T20:00:00.0', '2025-03-22T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1554, '2025-03-23 00:00:00', '2025-03-22T20:15:00.0', '2025-03-22T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1555, '2025-03-23 00:00:00', '2025-03-22T20:30:00.0', '2025-03-22T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1556, '2025-03-23 00:00:00', '2025-03-22T20:45:00.0', '2025-03-22T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1557, '2025-03-23 00:00:00', '2025-03-22T21:00:00.0', '2025-03-22T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1558, '2025-03-23 00:00:00', '2025-03-22T21:15:00.0', '2025-03-22T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1559, '2025-03-23 00:00:00', '2025-03-22T21:30:00.0', '2025-03-22T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1560, '2025-03-23 00:00:00', '2025-03-22T21:45:00.0', '2025-03-22T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1561, '2025-03-23 00:00:00', '2025-03-22T22:00:00.0', '2025-03-22T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1562, '2025-03-23 00:00:00', '2025-03-22T22:15:00.0', '2025-03-22T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1563, '2025-03-23 00:00:00', '2025-03-22T22:30:00.0', '2025-03-22T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1564, '2025-03-23 00:00:00', '2025-03-22T22:45:00.0', '2025-03-22T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1565, '2025-03-23 00:00:00', '2025-03-22T23:00:00.0', '2025-03-22T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1566, '2025-03-23 00:00:00', '2025-03-22T23:15:00.0', '2025-03-22T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1567, '2025-03-23 00:00:00', '2025-03-22T23:30:00.0', '2025-03-22T23:45:00.0', 63, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1568, '2025-03-23 00:00:00', '2025-03-22T23:45:00.0', '2025-03-23T00:00:00.0', 257, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1569, '2025-03-23 00:00:00', '2025-03-23T00:00:00.0', '2025-03-23T00:15:00.0', 284, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1570, '2025-03-23 00:00:00', '2025-03-23T00:15:00.0', '2025-03-23T00:30:00.0', 107, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1571, '2025-03-23 00:00:00', '2025-03-23T00:30:00.0', '2025-03-23T00:45:00.0', 232, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1572, '2025-03-23 00:00:00', '2025-03-23T00:45:00.0', '2025-03-23T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1573, '2025-03-23 00:00:00', '2025-03-23T01:00:00.0', '2025-03-23T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1574, '2025-03-23 00:00:00', '2025-03-23T01:15:00.0', '2025-03-23T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1575, '2025-03-23 00:00:00', '2025-03-23T01:30:00.0', '2025-03-23T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1576, '2025-03-23 00:00:00', '2025-03-23T01:45:00.0', '2025-03-23T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1577, '2025-03-23 00:00:00', '2025-03-23T02:00:00.0', '2025-03-23T02:15:00.0', 39, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1578, '2025-03-23 00:00:00', '2025-03-23T02:15:00.0', '2025-03-23T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1579, '2025-03-23 00:00:00', '2025-03-23T02:30:00.0', '2025-03-23T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1580, '2025-03-23 00:00:00', '2025-03-23T02:45:00.0', '2025-03-23T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1581, '2025-03-23 00:00:00', '2025-03-23T03:00:00.0', '2025-03-23T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1582, '2025-03-23 00:00:00', '2025-03-23T03:15:00.0', '2025-03-23T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1583, '2025-03-23 00:00:00', '2025-03-23T03:30:00.0', '2025-03-23T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1584, '2025-03-23 00:00:00', '2025-03-23T03:45:00.0', '2025-03-23T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1585, '2025-03-23 00:00:00', '2025-03-23T04:00:00.0', '2025-03-23T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1586, '2025-03-23 00:00:00', '2025-03-23T04:15:00.0', '2025-03-23T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1587, '2025-03-23 00:00:00', '2025-03-23T04:30:00.0', '2025-03-23T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1588, '2025-03-23 00:00:00', '2025-03-23T04:45:00.0', '2025-03-23T05:00:00.0', 234, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1589, '2025-03-23 00:00:00', '2025-03-23T05:00:00.0', '2025-03-23T05:15:00.0', 405, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1590, '2025-03-23 00:00:00', '2025-03-23T05:15:00.0', '2025-03-23T05:30:00.0', 18, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1591, '2025-03-23 00:00:00', '2025-03-23T05:30:00.0', '2025-03-23T05:45:00.0', 353, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1592, '2025-03-23 00:00:00', '2025-03-23T05:45:00.0', '2025-03-23T06:00:00.0', 515, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1593, '2025-03-23 00:00:00', '2025-03-23T06:00:00.0', '2025-03-23T06:15:00.0', 141, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1594, '2025-03-23 00:00:00', '2025-03-23T06:15:00.0', '2025-03-23T06:30:00.0', 92, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1595, '2025-03-23 00:00:00', '2025-03-23T06:30:00.0', '2025-03-23T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1596, '2025-03-23 00:00:00', '2025-03-23T06:45:00.0', '2025-03-23T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1597, '2025-03-23 00:00:00', '2025-03-23T07:00:00.0', '2025-03-23T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1598, '2025-03-23 00:00:00', '2025-03-23T07:15:00.0', '2025-03-23T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1599, '2025-03-23 00:00:00', '2025-03-23T07:30:00.0', '2025-03-23T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1600, '2025-03-23 00:00:00', '2025-03-23T07:45:00.0', '2025-03-23T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1601, '2025-03-23 00:00:00', '2025-03-23T08:00:00.0', '2025-03-23T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1602, '2025-03-23 00:00:00', '2025-03-23T08:15:00.0', '2025-03-23T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1603, '2025-03-23 00:00:00', '2025-03-23T08:30:00.0', '2025-03-23T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1604, '2025-03-23 00:00:00', '2025-03-23T08:45:00.0', '2025-03-23T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1605, '2025-03-23 00:00:00', '2025-03-23T09:00:00.0', '2025-03-23T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1606, '2025-03-23 00:00:00', '2025-03-23T09:15:00.0', '2025-03-23T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1607, '2025-03-23 00:00:00', '2025-03-23T09:30:00.0', '2025-03-23T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1608, '2025-03-23 00:00:00', '2025-03-23T09:45:00.0', '2025-03-23T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1609, '2025-03-23 00:00:00', '2025-03-23T10:00:00.0', '2025-03-23T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1610, '2025-03-23 00:00:00', '2025-03-23T10:15:00.0', '2025-03-23T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1611, '2025-03-23 00:00:00', '2025-03-23T10:30:00.0', '2025-03-23T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1612, '2025-03-23 00:00:00', '2025-03-23T10:45:00.0', '2025-03-23T11:00:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1613, '2025-03-23 00:00:00', '2025-03-23T11:00:00.0', '2025-03-23T11:15:00.0', 243, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1614, '2025-03-23 00:00:00', '2025-03-23T11:15:00.0', '2025-03-23T11:30:00.0', 387, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1615, '2025-03-23 00:00:00', '2025-03-23T11:30:00.0', '2025-03-23T11:45:00.0', 135, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1616, '2025-03-23 00:00:00', '2025-03-23T11:45:00.0', '2025-03-23T12:00:00.0', 413, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1617, '2025-03-23 00:00:00', '2025-03-23T12:00:00.0', '2025-03-23T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1618, '2025-03-23 00:00:00', '2025-03-23T12:15:00.0', '2025-03-23T12:30:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1619, '2025-03-23 00:00:00', '2025-03-23T12:30:00.0', '2025-03-23T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1620, '2025-03-23 00:00:00', '2025-03-23T12:45:00.0', '2025-03-23T13:00:00.0', 192, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1621, '2025-03-23 00:00:00', '2025-03-23T13:00:00.0', '2025-03-23T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1622, '2025-03-23 00:00:00', '2025-03-23T13:15:00.0', '2025-03-23T13:30:00.0', 10, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1623, '2025-03-23 00:00:00', '2025-03-23T13:30:00.0', '2025-03-23T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1624, '2025-03-23 00:00:00', '2025-03-23T13:45:00.0', '2025-03-23T14:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1625, '2025-03-23 00:00:00', '2025-03-23T14:00:00.0', '2025-03-23T14:15:00.0', 118, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1626, '2025-03-23 00:00:00', '2025-03-23T14:15:00.0', '2025-03-23T14:30:00.0', 32, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1627, '2025-03-23 00:00:00', '2025-03-23T14:30:00.0', '2025-03-23T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1628, '2025-03-23 00:00:00', '2025-03-23T14:45:00.0', '2025-03-23T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1629, '2025-03-23 00:00:00', '2025-03-23T15:00:00.0', '2025-03-23T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1630, '2025-03-23 00:00:00', '2025-03-23T15:15:00.0', '2025-03-23T15:30:00.0', 309, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1631, '2025-03-23 00:00:00', '2025-03-23T15:30:00.0', '2025-03-23T15:45:00.0', 322, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1632, '2025-03-23 00:00:00', '2025-03-23T15:45:00.0', '2025-03-23T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1633, '2025-03-24 00:00:00', '2025-03-23T16:00:00.0', '2025-03-23T16:15:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1634, '2025-03-24 00:00:00', '2025-03-23T16:15:00.0', '2025-03-23T16:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1635, '2025-03-24 00:00:00', '2025-03-23T16:30:00.0', '2025-03-23T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1636, '2025-03-24 00:00:00', '2025-03-23T16:45:00.0', '2025-03-23T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1637, '2025-03-24 00:00:00', '2025-03-23T17:00:00.0', '2025-03-23T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1638, '2025-03-24 00:00:00', '2025-03-23T17:15:00.0', '2025-03-23T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1639, '2025-03-24 00:00:00', '2025-03-23T17:30:00.0', '2025-03-23T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1640, '2025-03-24 00:00:00', '2025-03-23T17:45:00.0', '2025-03-23T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1641, '2025-03-24 00:00:00', '2025-03-23T18:00:00.0', '2025-03-23T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1642, '2025-03-24 00:00:00', '2025-03-23T18:15:00.0', '2025-03-23T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1643, '2025-03-24 00:00:00', '2025-03-23T18:30:00.0', '2025-03-23T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1644, '2025-03-24 00:00:00', '2025-03-23T18:45:00.0', '2025-03-23T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1645, '2025-03-24 00:00:00', '2025-03-23T19:00:00.0', '2025-03-23T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1646, '2025-03-24 00:00:00', '2025-03-23T19:15:00.0', '2025-03-23T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1647, '2025-03-24 00:00:00', '2025-03-23T19:30:00.0', '2025-03-23T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1648, '2025-03-24 00:00:00', '2025-03-23T19:45:00.0', '2025-03-23T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1649, '2025-03-24 00:00:00', '2025-03-23T20:00:00.0', '2025-03-23T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1650, '2025-03-24 00:00:00', '2025-03-23T20:15:00.0', '2025-03-23T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1651, '2025-03-24 00:00:00', '2025-03-23T20:30:00.0', '2025-03-23T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1652, '2025-03-24 00:00:00', '2025-03-23T20:45:00.0', '2025-03-23T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1653, '2025-03-24 00:00:00', '2025-03-23T21:00:00.0', '2025-03-23T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1654, '2025-03-24 00:00:00', '2025-03-23T21:15:00.0', '2025-03-23T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1655, '2025-03-24 00:00:00', '2025-03-23T21:30:00.0', '2025-03-23T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1656, '2025-03-24 00:00:00', '2025-03-23T21:45:00.0', '2025-03-23T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1657, '2025-03-24 00:00:00', '2025-03-23T22:00:00.0', '2025-03-23T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1658, '2025-03-24 00:00:00', '2025-03-23T22:15:00.0', '2025-03-23T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1659, '2025-03-24 00:00:00', '2025-03-23T22:30:00.0', '2025-03-23T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1660, '2025-03-24 00:00:00', '2025-03-23T22:45:00.0', '2025-03-23T23:00:00.0', 33, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1661, '2025-03-24 00:00:00', '2025-03-23T23:00:00.0', '2025-03-23T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1662, '2025-03-24 00:00:00', '2025-03-23T23:15:00.0', '2025-03-23T23:30:00.0', 123, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1663, '2025-03-24 00:00:00', '2025-03-23T23:30:00.0', '2025-03-23T23:45:00.0', 80, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1664, '2025-03-24 00:00:00', '2025-03-23T23:45:00.0', '2025-03-24T00:00:00.0', 703, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1665, '2025-03-24 00:00:00', '2025-03-24T00:00:00.0', '2025-03-24T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1666, '2025-03-24 00:00:00', '2025-03-24T00:15:00.0', '2025-03-24T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1667, '2025-03-24 00:00:00', '2025-03-24T00:30:00.0', '2025-03-24T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1668, '2025-03-24 00:00:00', '2025-03-24T00:45:00.0', '2025-03-24T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1669, '2025-03-24 00:00:00', '2025-03-24T01:00:00.0', '2025-03-24T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1670, '2025-03-24 00:00:00', '2025-03-24T01:15:00.0', '2025-03-24T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1671, '2025-03-24 00:00:00', '2025-03-24T01:30:00.0', '2025-03-24T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1672, '2025-03-24 00:00:00', '2025-03-24T01:45:00.0', '2025-03-24T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1673, '2025-03-24 00:00:00', '2025-03-24T02:00:00.0', '2025-03-24T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1674, '2025-03-24 00:00:00', '2025-03-24T02:15:00.0', '2025-03-24T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1675, '2025-03-24 00:00:00', '2025-03-24T02:30:00.0', '2025-03-24T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1676, '2025-03-24 00:00:00', '2025-03-24T02:45:00.0', '2025-03-24T03:00:00.0', 54, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1677, '2025-03-24 00:00:00', '2025-03-24T03:00:00.0', '2025-03-24T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1678, '2025-03-24 00:00:00', '2025-03-24T03:15:00.0', '2025-03-24T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1679, '2025-03-24 00:00:00', '2025-03-24T03:30:00.0', '2025-03-24T03:45:00.0', 53, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1680, '2025-03-24 00:00:00', '2025-03-24T03:45:00.0', '2025-03-24T04:00:00.0', 52, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1681, '2025-03-24 00:00:00', '2025-03-24T04:00:00.0', '2025-03-24T04:15:00.0', 429, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1682, '2025-03-24 00:00:00', '2025-03-24T04:15:00.0', '2025-03-24T04:30:00.0', 259, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1683, '2025-03-24 00:00:00', '2025-03-24T04:30:00.0', '2025-03-24T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1684, '2025-03-24 00:00:00', '2025-03-24T04:45:00.0', '2025-03-24T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1685, '2025-03-24 00:00:00', '2025-03-24T05:00:00.0', '2025-03-24T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1686, '2025-03-24 00:00:00', '2025-03-24T05:15:00.0', '2025-03-24T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1687, '2025-03-24 00:00:00', '2025-03-24T05:30:00.0', '2025-03-24T05:45:00.0', 364, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1688, '2025-03-24 00:00:00', '2025-03-24T05:45:00.0', '2025-03-24T06:00:00.0', 47, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1689, '2025-03-24 00:00:00', '2025-03-24T06:00:00.0', '2025-03-24T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1690, '2025-03-24 00:00:00', '2025-03-24T06:15:00.0', '2025-03-24T06:30:00.0', 47, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1691, '2025-03-24 00:00:00', '2025-03-24T06:30:00.0', '2025-03-24T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1692, '2025-03-24 00:00:00', '2025-03-24T06:45:00.0', '2025-03-24T07:00:00.0', 627, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1693, '2025-03-24 00:00:00', '2025-03-24T07:00:00.0', '2025-03-24T07:15:00.0', 95, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1694, '2025-03-24 00:00:00', '2025-03-24T07:15:00.0', '2025-03-24T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1695, '2025-03-24 00:00:00', '2025-03-24T07:30:00.0', '2025-03-24T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1696, '2025-03-24 00:00:00', '2025-03-24T07:45:00.0', '2025-03-24T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1697, '2025-03-24 00:00:00', '2025-03-24T08:00:00.0', '2025-03-24T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1698, '2025-03-24 00:00:00', '2025-03-24T08:15:00.0', '2025-03-24T08:30:00.0', 6, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1699, '2025-03-24 00:00:00', '2025-03-24T08:30:00.0', '2025-03-24T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1700, '2025-03-24 00:00:00', '2025-03-24T08:45:00.0', '2025-03-24T09:00:00.0', 133, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1701, '2025-03-24 00:00:00', '2025-03-24T09:00:00.0', '2025-03-24T09:15:00.0', 354, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1702, '2025-03-24 00:00:00', '2025-03-24T09:15:00.0', '2025-03-24T09:30:00.0', 119, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1703, '2025-03-24 00:00:00', '2025-03-24T09:30:00.0', '2025-03-24T09:45:00.0', 92, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1704, '2025-03-24 00:00:00', '2025-03-24T09:45:00.0', '2025-03-24T10:00:00.0', 168, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1705, '2025-03-24 00:00:00', '2025-03-24T10:00:00.0', '2025-03-24T10:15:00.0', 111, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1706, '2025-03-24 00:00:00', '2025-03-24T10:15:00.0', '2025-03-24T10:30:00.0', 55, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1707, '2025-03-24 00:00:00', '2025-03-24T10:30:00.0', '2025-03-24T10:45:00.0', 26, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1708, '2025-03-24 00:00:00', '2025-03-24T10:45:00.0', '2025-03-24T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1709, '2025-03-24 00:00:00', '2025-03-24T11:00:00.0', '2025-03-24T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1710, '2025-03-24 00:00:00', '2025-03-24T11:15:00.0', '2025-03-24T11:30:00.0', 141, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1711, '2025-03-24 00:00:00', '2025-03-24T11:30:00.0', '2025-03-24T11:45:00.0', 18, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1712, '2025-03-24 00:00:00', '2025-03-24T11:45:00.0', '2025-03-24T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1713, '2025-03-24 00:00:00', '2025-03-24T12:00:00.0', '2025-03-24T12:15:00.0', 325, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1714, '2025-03-24 00:00:00', '2025-03-24T12:15:00.0', '2025-03-24T12:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1715, '2025-03-24 00:00:00', '2025-03-24T12:30:00.0', '2025-03-24T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1716, '2025-03-24 00:00:00', '2025-03-24T12:45:00.0', '2025-03-24T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1717, '2025-03-24 00:00:00', '2025-03-24T13:00:00.0', '2025-03-24T13:15:00.0', 39, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1718, '2025-03-24 00:00:00', '2025-03-24T13:15:00.0', '2025-03-24T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1719, '2025-03-24 00:00:00', '2025-03-24T13:30:00.0', '2025-03-24T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1720, '2025-03-24 00:00:00', '2025-03-24T13:45:00.0', '2025-03-24T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1721, '2025-03-24 00:00:00', '2025-03-24T14:00:00.0', '2025-03-24T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1722, '2025-03-24 00:00:00', '2025-03-24T14:15:00.0', '2025-03-24T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1723, '2025-03-24 00:00:00', '2025-03-24T14:30:00.0', '2025-03-24T14:45:00.0', 131, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1724, '2025-03-24 00:00:00', '2025-03-24T14:45:00.0', '2025-03-24T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1725, '2025-03-24 00:00:00', '2025-03-24T15:00:00.0', '2025-03-24T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1726, '2025-03-24 00:00:00', '2025-03-24T15:15:00.0', '2025-03-24T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1727, '2025-03-24 00:00:00', '2025-03-24T15:30:00.0', '2025-03-24T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1728, '2025-03-24 00:00:00', '2025-03-24T15:45:00.0', '2025-03-24T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1729, '2025-03-25 00:00:00', '2025-03-24T16:00:00.0', '2025-03-24T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1730, '2025-03-25 00:00:00', '2025-03-24T16:15:00.0', '2025-03-24T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1731, '2025-03-25 00:00:00', '2025-03-24T16:30:00.0', '2025-03-24T16:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1732, '2025-03-25 00:00:00', '2025-03-24T16:45:00.0', '2025-03-24T17:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1733, '2025-03-25 00:00:00', '2025-03-24T17:00:00.0', '2025-03-24T17:15:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1734, '2025-03-25 00:00:00', '2025-03-24T17:15:00.0', '2025-03-24T17:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1735, '2025-03-25 00:00:00', '2025-03-24T17:30:00.0', '2025-03-24T17:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1736, '2025-03-25 00:00:00', '2025-03-24T17:45:00.0', '2025-03-24T18:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1737, '2025-03-25 00:00:00', '2025-03-24T18:00:00.0', '2025-03-24T18:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1738, '2025-03-25 00:00:00', '2025-03-24T18:15:00.0', '2025-03-24T18:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1739, '2025-03-25 00:00:00', '2025-03-24T18:30:00.0', '2025-03-24T18:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1740, '2025-03-25 00:00:00', '2025-03-24T18:45:00.0', '2025-03-24T19:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1741, '2025-03-25 00:00:00', '2025-03-24T19:00:00.0', '2025-03-24T19:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1742, '2025-03-25 00:00:00', '2025-03-24T19:15:00.0', '2025-03-24T19:30:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1743, '2025-03-25 00:00:00', '2025-03-24T19:30:00.0', '2025-03-24T19:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1744, '2025-03-25 00:00:00', '2025-03-24T19:45:00.0', '2025-03-24T20:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1745, '2025-03-25 00:00:00', '2025-03-24T20:00:00.0', '2025-03-24T20:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1746, '2025-03-25 00:00:00', '2025-03-24T20:15:00.0', '2025-03-24T20:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1747, '2025-03-25 00:00:00', '2025-03-24T20:30:00.0', '2025-03-24T20:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1748, '2025-03-25 00:00:00', '2025-03-24T20:45:00.0', '2025-03-24T21:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1749, '2025-03-25 00:00:00', '2025-03-24T21:00:00.0', '2025-03-24T21:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1750, '2025-03-25 00:00:00', '2025-03-24T21:15:00.0', '2025-03-24T21:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1751, '2025-03-25 00:00:00', '2025-03-24T21:30:00.0', '2025-03-24T21:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1752, '2025-03-25 00:00:00', '2025-03-24T21:45:00.0', '2025-03-24T22:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1753, '2025-03-25 00:00:00', '2025-03-24T22:00:00.0', '2025-03-24T22:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1754, '2025-03-25 00:00:00', '2025-03-24T22:15:00.0', '2025-03-24T22:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1755, '2025-03-25 00:00:00', '2025-03-24T22:30:00.0', '2025-03-24T22:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1756, '2025-03-25 00:00:00', '2025-03-24T22:45:00.0', '2025-03-24T23:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1757, '2025-03-25 00:00:00', '2025-03-24T23:00:00.0', '2025-03-24T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1758, '2025-03-25 00:00:00', '2025-03-24T23:15:00.0', '2025-03-24T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1759, '2025-03-25 00:00:00', '2025-03-24T23:30:00.0', '2025-03-24T23:45:00.0', 120, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1760, '2025-03-25 00:00:00', '2025-03-24T23:45:00.0', '2025-03-25T00:00:00.0', 151, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1761, '2025-03-25 00:00:00', '2025-03-25T00:00:00.0', '2025-03-25T00:15:00.0', 195, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1762, '2025-03-25 00:00:00', '2025-03-25T00:15:00.0', '2025-03-25T00:30:00.0', 314, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1763, '2025-03-25 00:00:00', '2025-03-25T00:30:00.0', '2025-03-25T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1764, '2025-03-25 00:00:00', '2025-03-25T00:45:00.0', '2025-03-25T01:00:00.0', 92, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1765, '2025-03-25 00:00:00', '2025-03-25T01:00:00.0', '2025-03-25T01:15:00.0', 73, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1766, '2025-03-25 00:00:00', '2025-03-25T01:15:00.0', '2025-03-25T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1767, '2025-03-25 00:00:00', '2025-03-25T01:30:00.0', '2025-03-25T01:45:00.0', 29, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1768, '2025-03-25 00:00:00', '2025-03-25T01:45:00.0', '2025-03-25T02:00:00.0', 151, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1769, '2025-03-25 00:00:00', '2025-03-25T02:00:00.0', '2025-03-25T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1770, '2025-03-25 00:00:00', '2025-03-25T02:15:00.0', '2025-03-25T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1771, '2025-03-25 00:00:00', '2025-03-25T02:30:00.0', '2025-03-25T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1772, '2025-03-25 00:00:00', '2025-03-25T02:45:00.0', '2025-03-25T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1773, '2025-03-25 00:00:00', '2025-03-25T03:00:00.0', '2025-03-25T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1774, '2025-03-25 00:00:00', '2025-03-25T03:15:00.0', '2025-03-25T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1775, '2025-03-25 00:00:00', '2025-03-25T03:30:00.0', '2025-03-25T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1776, '2025-03-25 00:00:00', '2025-03-25T03:45:00.0', '2025-03-25T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1777, '2025-03-25 00:00:00', '2025-03-25T04:00:00.0', '2025-03-25T04:15:00.0', 279, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1778, '2025-03-25 00:00:00', '2025-03-25T04:15:00.0', '2025-03-25T04:30:00.0', 216, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1779, '2025-03-25 00:00:00', '2025-03-25T04:30:00.0', '2025-03-25T04:45:00.0', 292, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1780, '2025-03-25 00:00:00', '2025-03-25T04:45:00.0', '2025-03-25T05:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1781, '2025-03-25 00:00:00', '2025-03-25T05:00:00.0', '2025-03-25T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1782, '2025-03-25 00:00:00', '2025-03-25T05:15:00.0', '2025-03-25T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1783, '2025-03-25 00:00:00', '2025-03-25T05:30:00.0', '2025-03-25T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1784, '2025-03-25 00:00:00', '2025-03-25T05:45:00.0', '2025-03-25T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1785, '2025-03-25 00:00:00', '2025-03-25T06:00:00.0', '2025-03-25T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1786, '2025-03-25 00:00:00', '2025-03-25T06:15:00.0', '2025-03-25T06:30:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1787, '2025-03-25 00:00:00', '2025-03-25T06:30:00.0', '2025-03-25T06:45:00.0', 318, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1788, '2025-03-25 00:00:00', '2025-03-25T06:45:00.0', '2025-03-25T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1789, '2025-03-25 00:00:00', '2025-03-25T07:00:00.0', '2025-03-25T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1790, '2025-03-25 00:00:00', '2025-03-25T07:15:00.0', '2025-03-25T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1791, '2025-03-25 00:00:00', '2025-03-25T07:30:00.0', '2025-03-25T07:45:00.0', 14, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1792, '2025-03-25 00:00:00', '2025-03-25T07:45:00.0', '2025-03-25T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1793, '2025-03-25 00:00:00', '2025-03-25T08:00:00.0', '2025-03-25T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1794, '2025-03-25 00:00:00', '2025-03-25T08:15:00.0', '2025-03-25T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1795, '2025-03-25 00:00:00', '2025-03-25T08:30:00.0', '2025-03-25T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1796, '2025-03-25 00:00:00', '2025-03-25T08:45:00.0', '2025-03-25T09:00:00.0', 326, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1797, '2025-03-25 00:00:00', '2025-03-25T09:00:00.0', '2025-03-25T09:15:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1798, '2025-03-25 00:00:00', '2025-03-25T09:15:00.0', '2025-03-25T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1799, '2025-03-25 00:00:00', '2025-03-25T09:30:00.0', '2025-03-25T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1800, '2025-03-25 00:00:00', '2025-03-25T09:45:00.0', '2025-03-25T10:00:00.0', 664, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1801, '2025-03-25 00:00:00', '2025-03-25T10:00:00.0', '2025-03-25T10:15:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1802, '2025-03-25 00:00:00', '2025-03-25T10:15:00.0', '2025-03-25T10:30:00.0', 140, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1803, '2025-03-25 00:00:00', '2025-03-25T10:30:00.0', '2025-03-25T10:45:00.0', 105, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1804, '2025-03-25 00:00:00', '2025-03-25T10:45:00.0', '2025-03-25T11:00:00.0', 191, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1805, '2025-03-25 00:00:00', '2025-03-25T11:00:00.0', '2025-03-25T11:15:00.0', 15, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1806, '2025-03-25 00:00:00', '2025-03-25T11:15:00.0', '2025-03-25T11:30:00.0', 178, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1807, '2025-03-25 00:00:00', '2025-03-25T11:30:00.0', '2025-03-25T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1808, '2025-03-25 00:00:00', '2025-03-25T11:45:00.0', '2025-03-25T12:00:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1809, '2025-03-25 00:00:00', '2025-03-25T12:00:00.0', '2025-03-25T12:15:00.0', 20, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1810, '2025-03-25 00:00:00', '2025-03-25T12:15:00.0', '2025-03-25T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1811, '2025-03-25 00:00:00', '2025-03-25T12:30:00.0', '2025-03-25T12:45:00.0', 103, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1812, '2025-03-25 00:00:00', '2025-03-25T12:45:00.0', '2025-03-25T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1813, '2025-03-25 00:00:00', '2025-03-25T13:00:00.0', '2025-03-25T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1814, '2025-03-25 00:00:00', '2025-03-25T13:15:00.0', '2025-03-25T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1815, '2025-03-25 00:00:00', '2025-03-25T13:30:00.0', '2025-03-25T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1816, '2025-03-25 00:00:00', '2025-03-25T13:45:00.0', '2025-03-25T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1817, '2025-03-25 00:00:00', '2025-03-25T14:00:00.0', '2025-03-25T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1818, '2025-03-25 00:00:00', '2025-03-25T14:15:00.0', '2025-03-25T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1819, '2025-03-25 00:00:00', '2025-03-25T14:30:00.0', '2025-03-25T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1820, '2025-03-25 00:00:00', '2025-03-25T14:45:00.0', '2025-03-25T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1821, '2025-03-25 00:00:00', '2025-03-25T15:00:00.0', '2025-03-25T15:15:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (1822, '2025-03-25 00:00:00', '2025-03-25T15:15:00.0', '2025-03-25T15:30:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1823, '2025-03-25 00:00:00', '2025-03-25T15:30:00.0', '2025-03-25T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1824, '2025-03-25 00:00:00', '2025-03-25T15:45:00.0', '2025-03-25T16:00:00.0', 10, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1825, '2025-03-26 00:00:00', '2025-03-25T16:00:00.0', '2025-03-25T16:15:00.0', 100, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1826, '2025-03-26 00:00:00', '2025-03-25T16:15:00.0', '2025-03-25T16:30:00.0', 547, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1827, '2025-03-26 00:00:00', '2025-03-25T16:30:00.0', '2025-03-25T16:45:00.0', 33, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1828, '2025-03-26 00:00:00', '2025-03-25T16:45:00.0', '2025-03-25T17:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1829, '2025-03-26 00:00:00', '2025-03-25T17:00:00.0', '2025-03-25T17:15:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1830, '2025-03-26 00:00:00', '2025-03-25T17:15:00.0', '2025-03-25T17:30:00.0', 17, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1831, '2025-03-26 00:00:00', '2025-03-25T17:30:00.0', '2025-03-25T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1832, '2025-03-26 00:00:00', '2025-03-25T17:45:00.0', '2025-03-25T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1833, '2025-03-26 00:00:00', '2025-03-25T18:00:00.0', '2025-03-25T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1834, '2025-03-26 00:00:00', '2025-03-25T18:15:00.0', '2025-03-25T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1835, '2025-03-26 00:00:00', '2025-03-25T18:30:00.0', '2025-03-25T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1836, '2025-03-26 00:00:00', '2025-03-25T18:45:00.0', '2025-03-25T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1837, '2025-03-26 00:00:00', '2025-03-25T19:00:00.0', '2025-03-25T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1838, '2025-03-26 00:00:00', '2025-03-25T19:15:00.0', '2025-03-25T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1839, '2025-03-26 00:00:00', '2025-03-25T19:30:00.0', '2025-03-25T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1840, '2025-03-26 00:00:00', '2025-03-25T19:45:00.0', '2025-03-25T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1841, '2025-03-26 00:00:00', '2025-03-25T20:00:00.0', '2025-03-25T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1842, '2025-03-26 00:00:00', '2025-03-25T20:15:00.0', '2025-03-25T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1843, '2025-03-26 00:00:00', '2025-03-25T20:30:00.0', '2025-03-25T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1844, '2025-03-26 00:00:00', '2025-03-25T20:45:00.0', '2025-03-25T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1845, '2025-03-26 00:00:00', '2025-03-25T21:00:00.0', '2025-03-25T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1846, '2025-03-26 00:00:00', '2025-03-25T21:15:00.0', '2025-03-25T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1847, '2025-03-26 00:00:00', '2025-03-25T21:30:00.0', '2025-03-25T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1848, '2025-03-26 00:00:00', '2025-03-25T21:45:00.0', '2025-03-25T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1849, '2025-03-26 00:00:00', '2025-03-25T22:00:00.0', '2025-03-25T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1850, '2025-03-26 00:00:00', '2025-03-25T22:15:00.0', '2025-03-25T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1851, '2025-03-26 00:00:00', '2025-03-25T22:30:00.0', '2025-03-25T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1852, '2025-03-26 00:00:00', '2025-03-25T22:45:00.0', '2025-03-25T23:00:00.0', 106, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1853, '2025-03-26 00:00:00', '2025-03-25T23:00:00.0', '2025-03-25T23:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1854, '2025-03-26 00:00:00', '2025-03-25T23:15:00.0', '2025-03-25T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1855, '2025-03-26 00:00:00', '2025-03-25T23:30:00.0', '2025-03-25T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1856, '2025-03-26 00:00:00', '2025-03-25T23:45:00.0', '2025-03-26T00:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1857, '2025-03-26 00:00:00', '2025-03-26T00:00:00.0', '2025-03-26T00:15:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1858, '2025-03-26 00:00:00', '2025-03-26T00:15:00.0', '2025-03-26T00:30:00.0', 391, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1859, '2025-03-26 00:00:00', '2025-03-26T00:30:00.0', '2025-03-26T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1860, '2025-03-26 00:00:00', '2025-03-26T00:45:00.0', '2025-03-26T01:00:00.0', 29, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1861, '2025-03-26 00:00:00', '2025-03-26T01:00:00.0', '2025-03-26T01:15:00.0', 163, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1862, '2025-03-26 00:00:00', '2025-03-26T01:15:00.0', '2025-03-26T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1863, '2025-03-26 00:00:00', '2025-03-26T01:30:00.0', '2025-03-26T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1864, '2025-03-26 00:00:00', '2025-03-26T01:45:00.0', '2025-03-26T02:00:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1865, '2025-03-26 00:00:00', '2025-03-26T02:00:00.0', '2025-03-26T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1866, '2025-03-26 00:00:00', '2025-03-26T02:15:00.0', '2025-03-26T02:30:00.0', 250, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1867, '2025-03-26 00:00:00', '2025-03-26T02:30:00.0', '2025-03-26T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1868, '2025-03-26 00:00:00', '2025-03-26T02:45:00.0', '2025-03-26T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1869, '2025-03-26 00:00:00', '2025-03-26T03:00:00.0', '2025-03-26T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1870, '2025-03-26 00:00:00', '2025-03-26T03:15:00.0', '2025-03-26T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1871, '2025-03-26 00:00:00', '2025-03-26T03:30:00.0', '2025-03-26T03:45:00.0', 135, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1872, '2025-03-26 00:00:00', '2025-03-26T03:45:00.0', '2025-03-26T04:00:00.0', 258, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1873, '2025-03-26 00:00:00', '2025-03-26T04:00:00.0', '2025-03-26T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1874, '2025-03-26 00:00:00', '2025-03-26T04:15:00.0', '2025-03-26T04:30:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1875, '2025-03-26 00:00:00', '2025-03-26T04:30:00.0', '2025-03-26T04:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1876, '2025-03-26 00:00:00', '2025-03-26T04:45:00.0', '2025-03-26T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1877, '2025-03-26 00:00:00', '2025-03-26T05:00:00.0', '2025-03-26T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1878, '2025-03-26 00:00:00', '2025-03-26T05:15:00.0', '2025-03-26T05:30:00.0', 45, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1879, '2025-03-26 00:00:00', '2025-03-26T05:30:00.0', '2025-03-26T05:45:00.0', 505, '0', 'active', 'False');
INSERT INTO `steps` VALUES (1880, '2025-03-26 00:00:00', '2025-03-26T05:45:00.0', '2025-03-26T06:00:00.0', 61, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1881, '2025-03-26 00:00:00', '2025-03-26T06:00:00.0', '2025-03-26T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1882, '2025-03-26 00:00:00', '2025-03-26T06:15:00.0', '2025-03-26T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1883, '2025-03-26 00:00:00', '2025-03-26T06:30:00.0', '2025-03-26T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1884, '2025-03-26 00:00:00', '2025-03-26T06:45:00.0', '2025-03-26T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1885, '2025-03-26 00:00:00', '2025-03-26T07:00:00.0', '2025-03-26T07:15:00.0', 140, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1886, '2025-03-26 00:00:00', '2025-03-26T07:15:00.0', '2025-03-26T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1887, '2025-03-26 00:00:00', '2025-03-26T07:30:00.0', '2025-03-26T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1888, '2025-03-26 00:00:00', '2025-03-26T07:45:00.0', '2025-03-26T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1889, '2025-03-26 00:00:00', '2025-03-26T08:00:00.0', '2025-03-26T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1890, '2025-03-26 00:00:00', '2025-03-26T08:15:00.0', '2025-03-26T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1891, '2025-03-26 00:00:00', '2025-03-26T08:30:00.0', '2025-03-26T08:45:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1892, '2025-03-26 00:00:00', '2025-03-26T08:45:00.0', '2025-03-26T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1893, '2025-03-26 00:00:00', '2025-03-26T09:00:00.0', '2025-03-26T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1894, '2025-03-26 00:00:00', '2025-03-26T09:15:00.0', '2025-03-26T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1895, '2025-03-26 00:00:00', '2025-03-26T09:30:00.0', '2025-03-26T09:45:00.0', 363, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1896, '2025-03-26 00:00:00', '2025-03-26T09:45:00.0', '2025-03-26T10:00:00.0', 150, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1897, '2025-03-26 00:00:00', '2025-03-26T10:00:00.0', '2025-03-26T10:15:00.0', 185, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1898, '2025-03-26 00:00:00', '2025-03-26T10:15:00.0', '2025-03-26T10:30:00.0', 151, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1899, '2025-03-26 00:00:00', '2025-03-26T10:30:00.0', '2025-03-26T10:45:00.0', 179, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1900, '2025-03-26 00:00:00', '2025-03-26T10:45:00.0', '2025-03-26T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1901, '2025-03-26 00:00:00', '2025-03-26T11:00:00.0', '2025-03-26T11:15:00.0', 182, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1902, '2025-03-26 00:00:00', '2025-03-26T11:15:00.0', '2025-03-26T11:30:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1903, '2025-03-26 00:00:00', '2025-03-26T11:30:00.0', '2025-03-26T11:45:00.0', 540, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1904, '2025-03-26 00:00:00', '2025-03-26T11:45:00.0', '2025-03-26T12:00:00.0', 0, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1905, '2025-03-26 00:00:00', '2025-03-26T12:00:00.0', '2025-03-26T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1906, '2025-03-26 00:00:00', '2025-03-26T12:15:00.0', '2025-03-26T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1907, '2025-03-26 00:00:00', '2025-03-26T12:30:00.0', '2025-03-26T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1908, '2025-03-26 00:00:00', '2025-03-26T12:45:00.0', '2025-03-26T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1909, '2025-03-26 00:00:00', '2025-03-26T13:00:00.0', '2025-03-26T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1910, '2025-03-26 00:00:00', '2025-03-26T13:15:00.0', '2025-03-26T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1911, '2025-03-26 00:00:00', '2025-03-26T13:30:00.0', '2025-03-26T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1912, '2025-03-26 00:00:00', '2025-03-26T13:45:00.0', '2025-03-26T14:00:00.0', 6, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1913, '2025-03-26 00:00:00', '2025-03-26T14:00:00.0', '2025-03-26T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1914, '2025-03-26 00:00:00', '2025-03-26T14:15:00.0', '2025-03-26T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1915, '2025-03-26 00:00:00', '2025-03-26T14:30:00.0', '2025-03-26T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1916, '2025-03-26 00:00:00', '2025-03-26T14:45:00.0', '2025-03-26T15:00:00.0', 468, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1917, '2025-03-26 00:00:00', '2025-03-26T15:00:00.0', '2025-03-26T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1918, '2025-03-26 00:00:00', '2025-03-26T15:15:00.0', '2025-03-26T15:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1919, '2025-03-26 00:00:00', '2025-03-26T15:30:00.0', '2025-03-26T15:45:00.0', 113, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1920, '2025-03-26 00:00:00', '2025-03-26T15:45:00.0', '2025-03-26T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1921, '2025-03-27 00:00:00', '2025-03-26T16:00:00.0', '2025-03-26T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1922, '2025-03-27 00:00:00', '2025-03-26T16:15:00.0', '2025-03-26T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1923, '2025-03-27 00:00:00', '2025-03-26T16:30:00.0', '2025-03-26T16:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1924, '2025-03-27 00:00:00', '2025-03-26T16:45:00.0', '2025-03-26T17:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1925, '2025-03-27 00:00:00', '2025-03-26T17:00:00.0', '2025-03-26T17:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1926, '2025-03-27 00:00:00', '2025-03-26T17:15:00.0', '2025-03-26T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1927, '2025-03-27 00:00:00', '2025-03-26T17:30:00.0', '2025-03-26T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1928, '2025-03-27 00:00:00', '2025-03-26T17:45:00.0', '2025-03-26T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1929, '2025-03-27 00:00:00', '2025-03-26T18:00:00.0', '2025-03-26T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1930, '2025-03-27 00:00:00', '2025-03-26T18:15:00.0', '2025-03-26T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1931, '2025-03-27 00:00:00', '2025-03-26T18:30:00.0', '2025-03-26T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1932, '2025-03-27 00:00:00', '2025-03-26T18:45:00.0', '2025-03-26T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1933, '2025-03-27 00:00:00', '2025-03-26T19:00:00.0', '2025-03-26T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1934, '2025-03-27 00:00:00', '2025-03-26T19:15:00.0', '2025-03-26T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1935, '2025-03-27 00:00:00', '2025-03-26T19:30:00.0', '2025-03-26T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1936, '2025-03-27 00:00:00', '2025-03-26T19:45:00.0', '2025-03-26T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1937, '2025-03-27 00:00:00', '2025-03-26T20:00:00.0', '2025-03-26T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1938, '2025-03-27 00:00:00', '2025-03-26T20:15:00.0', '2025-03-26T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1939, '2025-03-27 00:00:00', '2025-03-26T20:30:00.0', '2025-03-26T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1940, '2025-03-27 00:00:00', '2025-03-26T20:45:00.0', '2025-03-26T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1941, '2025-03-27 00:00:00', '2025-03-26T21:00:00.0', '2025-03-26T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1942, '2025-03-27 00:00:00', '2025-03-26T21:15:00.0', '2025-03-26T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1943, '2025-03-27 00:00:00', '2025-03-26T21:30:00.0', '2025-03-26T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1944, '2025-03-27 00:00:00', '2025-03-26T21:45:00.0', '2025-03-26T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1945, '2025-03-27 00:00:00', '2025-03-26T22:00:00.0', '2025-03-26T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1946, '2025-03-27 00:00:00', '2025-03-26T22:15:00.0', '2025-03-26T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1947, '2025-03-27 00:00:00', '2025-03-26T22:30:00.0', '2025-03-26T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1948, '2025-03-27 00:00:00', '2025-03-26T22:45:00.0', '2025-03-26T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1949, '2025-03-27 00:00:00', '2025-03-26T23:00:00.0', '2025-03-26T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1950, '2025-03-27 00:00:00', '2025-03-26T23:15:00.0', '2025-03-26T23:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1951, '2025-03-27 00:00:00', '2025-03-26T23:30:00.0', '2025-03-26T23:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1952, '2025-03-27 00:00:00', '2025-03-26T23:45:00.0', '2025-03-27T00:00:00.0', 57, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (1953, '2025-03-27 00:00:00', '2025-03-27T00:00:00.0', '2025-03-27T00:15:00.0', 285, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1954, '2025-03-27 00:00:00', '2025-03-27T00:15:00.0', '2025-03-27T00:30:00.0', 213, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (1955, '2025-03-27 00:00:00', '2025-03-27T00:30:00.0', '2025-03-27T00:45:00.0', 347, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1956, '2025-03-27 00:00:00', '2025-03-27T00:45:00.0', '2025-03-27T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1957, '2025-03-27 00:00:00', '2025-03-27T01:00:00.0', '2025-03-27T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1958, '2025-03-27 00:00:00', '2025-03-27T01:15:00.0', '2025-03-27T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1959, '2025-03-27 00:00:00', '2025-03-27T01:30:00.0', '2025-03-27T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1960, '2025-03-27 00:00:00', '2025-03-27T01:45:00.0', '2025-03-27T02:00:00.0', 161, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1961, '2025-03-27 00:00:00', '2025-03-27T02:00:00.0', '2025-03-27T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1962, '2025-03-27 00:00:00', '2025-03-27T02:15:00.0', '2025-03-27T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1963, '2025-03-27 00:00:00', '2025-03-27T02:30:00.0', '2025-03-27T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1964, '2025-03-27 00:00:00', '2025-03-27T02:45:00.0', '2025-03-27T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1965, '2025-03-27 00:00:00', '2025-03-27T03:00:00.0', '2025-03-27T03:15:00.0', 173, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1966, '2025-03-27 00:00:00', '2025-03-27T03:15:00.0', '2025-03-27T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1967, '2025-03-27 00:00:00', '2025-03-27T03:30:00.0', '2025-03-27T03:45:00.0', 193, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1968, '2025-03-27 00:00:00', '2025-03-27T03:45:00.0', '2025-03-27T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1969, '2025-03-27 00:00:00', '2025-03-27T04:00:00.0', '2025-03-27T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1970, '2025-03-27 00:00:00', '2025-03-27T04:15:00.0', '2025-03-27T04:30:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1971, '2025-03-27 00:00:00', '2025-03-27T04:30:00.0', '2025-03-27T04:45:00.0', 52, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1972, '2025-03-27 00:00:00', '2025-03-27T04:45:00.0', '2025-03-27T05:00:00.0', 455, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1973, '2025-03-27 00:00:00', '2025-03-27T05:00:00.0', '2025-03-27T05:15:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1974, '2025-03-27 00:00:00', '2025-03-27T05:15:00.0', '2025-03-27T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1975, '2025-03-27 00:00:00', '2025-03-27T05:30:00.0', '2025-03-27T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1976, '2025-03-27 00:00:00', '2025-03-27T05:45:00.0', '2025-03-27T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1977, '2025-03-27 00:00:00', '2025-03-27T06:00:00.0', '2025-03-27T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1978, '2025-03-27 00:00:00', '2025-03-27T06:15:00.0', '2025-03-27T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1979, '2025-03-27 00:00:00', '2025-03-27T06:30:00.0', '2025-03-27T06:45:00.0', 286, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1980, '2025-03-27 00:00:00', '2025-03-27T06:45:00.0', '2025-03-27T07:00:00.0', 149, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1981, '2025-03-27 00:00:00', '2025-03-27T07:00:00.0', '2025-03-27T07:15:00.0', 254, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1982, '2025-03-27 00:00:00', '2025-03-27T07:15:00.0', '2025-03-27T07:30:00.0', 70, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (1983, '2025-03-27 00:00:00', '2025-03-27T07:30:00.0', '2025-03-27T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1984, '2025-03-27 00:00:00', '2025-03-27T07:45:00.0', '2025-03-27T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1985, '2025-03-27 00:00:00', '2025-03-27T08:00:00.0', '2025-03-27T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1986, '2025-03-27 00:00:00', '2025-03-27T08:15:00.0', '2025-03-27T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1987, '2025-03-27 00:00:00', '2025-03-27T08:30:00.0', '2025-03-27T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1988, '2025-03-27 00:00:00', '2025-03-27T08:45:00.0', '2025-03-27T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1989, '2025-03-27 00:00:00', '2025-03-27T09:00:00.0', '2025-03-27T09:15:00.0', 20, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1990, '2025-03-27 00:00:00', '2025-03-27T09:15:00.0', '2025-03-27T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1991, '2025-03-27 00:00:00', '2025-03-27T09:30:00.0', '2025-03-27T09:45:00.0', 545, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1992, '2025-03-27 00:00:00', '2025-03-27T09:45:00.0', '2025-03-27T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1993, '2025-03-27 00:00:00', '2025-03-27T10:00:00.0', '2025-03-27T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1994, '2025-03-27 00:00:00', '2025-03-27T10:15:00.0', '2025-03-27T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1995, '2025-03-27 00:00:00', '2025-03-27T10:30:00.0', '2025-03-27T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1996, '2025-03-27 00:00:00', '2025-03-27T10:45:00.0', '2025-03-27T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1997, '2025-03-27 00:00:00', '2025-03-27T11:00:00.0', '2025-03-27T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (1998, '2025-03-27 00:00:00', '2025-03-27T11:15:00.0', '2025-03-27T11:30:00.0', 582, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (1999, '2025-03-27 00:00:00', '2025-03-27T11:30:00.0', '2025-03-27T11:45:00.0', 162, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2000, '2025-03-27 00:00:00', '2025-03-27T11:45:00.0', '2025-03-27T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2001, '2025-03-27 00:00:00', '2025-03-27T12:00:00.0', '2025-03-27T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2002, '2025-03-27 00:00:00', '2025-03-27T12:15:00.0', '2025-03-27T12:30:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2003, '2025-03-27 00:00:00', '2025-03-27T12:30:00.0', '2025-03-27T12:45:00.0', 39, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2004, '2025-03-27 00:00:00', '2025-03-27T12:45:00.0', '2025-03-27T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2005, '2025-03-27 00:00:00', '2025-03-27T13:00:00.0', '2025-03-27T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2006, '2025-03-27 00:00:00', '2025-03-27T13:15:00.0', '2025-03-27T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2007, '2025-03-27 00:00:00', '2025-03-27T13:30:00.0', '2025-03-27T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2008, '2025-03-27 00:00:00', '2025-03-27T13:45:00.0', '2025-03-27T14:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2009, '2025-03-27 00:00:00', '2025-03-27T14:00:00.0', '2025-03-27T14:15:00.0', 340, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2010, '2025-03-27 00:00:00', '2025-03-27T14:15:00.0', '2025-03-27T14:30:00.0', 81, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2011, '2025-03-27 00:00:00', '2025-03-27T14:30:00.0', '2025-03-27T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2012, '2025-03-27 00:00:00', '2025-03-27T14:45:00.0', '2025-03-27T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2013, '2025-03-27 00:00:00', '2025-03-27T15:00:00.0', '2025-03-27T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2014, '2025-03-27 00:00:00', '2025-03-27T15:15:00.0', '2025-03-27T15:30:00.0', 94, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2015, '2025-03-27 00:00:00', '2025-03-27T15:30:00.0', '2025-03-27T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2016, '2025-03-27 00:00:00', '2025-03-27T15:45:00.0', '2025-03-27T16:00:00.0', 54, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2017, '2025-03-28 00:00:00', '2025-03-27T16:00:00.0', '2025-03-27T16:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2018, '2025-03-28 00:00:00', '2025-03-27T16:15:00.0', '2025-03-27T16:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2019, '2025-03-28 00:00:00', '2025-03-27T16:30:00.0', '2025-03-27T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2020, '2025-03-28 00:00:00', '2025-03-27T16:45:00.0', '2025-03-27T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2021, '2025-03-28 00:00:00', '2025-03-27T17:00:00.0', '2025-03-27T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2022, '2025-03-28 00:00:00', '2025-03-27T17:15:00.0', '2025-03-27T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2023, '2025-03-28 00:00:00', '2025-03-27T17:30:00.0', '2025-03-27T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2024, '2025-03-28 00:00:00', '2025-03-27T17:45:00.0', '2025-03-27T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2025, '2025-03-28 00:00:00', '2025-03-27T18:00:00.0', '2025-03-27T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2026, '2025-03-28 00:00:00', '2025-03-27T18:15:00.0', '2025-03-27T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2027, '2025-03-28 00:00:00', '2025-03-27T18:30:00.0', '2025-03-27T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2028, '2025-03-28 00:00:00', '2025-03-27T18:45:00.0', '2025-03-27T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2029, '2025-03-28 00:00:00', '2025-03-27T19:00:00.0', '2025-03-27T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2030, '2025-03-28 00:00:00', '2025-03-27T19:15:00.0', '2025-03-27T19:30:00.0', 6, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2031, '2025-03-28 00:00:00', '2025-03-27T19:30:00.0', '2025-03-27T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2032, '2025-03-28 00:00:00', '2025-03-27T19:45:00.0', '2025-03-27T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2033, '2025-03-28 00:00:00', '2025-03-27T20:00:00.0', '2025-03-27T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2034, '2025-03-28 00:00:00', '2025-03-27T20:15:00.0', '2025-03-27T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2035, '2025-03-28 00:00:00', '2025-03-27T20:30:00.0', '2025-03-27T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2036, '2025-03-28 00:00:00', '2025-03-27T20:45:00.0', '2025-03-27T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2037, '2025-03-28 00:00:00', '2025-03-27T21:00:00.0', '2025-03-27T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2038, '2025-03-28 00:00:00', '2025-03-27T21:15:00.0', '2025-03-27T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2039, '2025-03-28 00:00:00', '2025-03-27T21:30:00.0', '2025-03-27T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2040, '2025-03-28 00:00:00', '2025-03-27T21:45:00.0', '2025-03-27T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2041, '2025-03-28 00:00:00', '2025-03-27T22:00:00.0', '2025-03-27T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2042, '2025-03-28 00:00:00', '2025-03-27T22:15:00.0', '2025-03-27T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2043, '2025-03-28 00:00:00', '2025-03-27T22:30:00.0', '2025-03-27T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2044, '2025-03-28 00:00:00', '2025-03-27T22:45:00.0', '2025-03-27T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2045, '2025-03-28 00:00:00', '2025-03-27T23:00:00.0', '2025-03-27T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2046, '2025-03-28 00:00:00', '2025-03-27T23:15:00.0', '2025-03-27T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2047, '2025-03-28 00:00:00', '2025-03-27T23:30:00.0', '2025-03-27T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2048, '2025-03-28 00:00:00', '2025-03-27T23:45:00.0', '2025-03-28T00:00:00.0', 188, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2049, '2025-03-28 00:00:00', '2025-03-28T00:00:00.0', '2025-03-28T00:15:00.0', 347, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2050, '2025-03-28 00:00:00', '2025-03-28T00:15:00.0', '2025-03-28T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2051, '2025-03-28 00:00:00', '2025-03-28T00:30:00.0', '2025-03-28T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2052, '2025-03-28 00:00:00', '2025-03-28T00:45:00.0', '2025-03-28T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2053, '2025-03-28 00:00:00', '2025-03-28T01:00:00.0', '2025-03-28T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2054, '2025-03-28 00:00:00', '2025-03-28T01:15:00.0', '2025-03-28T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2055, '2025-03-28 00:00:00', '2025-03-28T01:30:00.0', '2025-03-28T01:45:00.0', 180, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2056, '2025-03-28 00:00:00', '2025-03-28T01:45:00.0', '2025-03-28T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2057, '2025-03-28 00:00:00', '2025-03-28T02:00:00.0', '2025-03-28T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2058, '2025-03-28 00:00:00', '2025-03-28T02:15:00.0', '2025-03-28T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2059, '2025-03-28 00:00:00', '2025-03-28T02:30:00.0', '2025-03-28T02:45:00.0', 167, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2060, '2025-03-28 00:00:00', '2025-03-28T02:45:00.0', '2025-03-28T03:00:00.0', 49, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2061, '2025-03-28 00:00:00', '2025-03-28T03:00:00.0', '2025-03-28T03:15:00.0', 158, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2062, '2025-03-28 00:00:00', '2025-03-28T03:15:00.0', '2025-03-28T03:30:00.0', 670, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2063, '2025-03-28 00:00:00', '2025-03-28T03:30:00.0', '2025-03-28T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2064, '2025-03-28 00:00:00', '2025-03-28T03:45:00.0', '2025-03-28T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2065, '2025-03-28 00:00:00', '2025-03-28T04:00:00.0', '2025-03-28T04:15:00.0', 975, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2066, '2025-03-28 00:00:00', '2025-03-28T04:15:00.0', '2025-03-28T04:30:00.0', 1070, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2067, '2025-03-28 00:00:00', '2025-03-28T04:30:00.0', '2025-03-28T04:45:00.0', 22, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2068, '2025-03-28 00:00:00', '2025-03-28T04:45:00.0', '2025-03-28T05:00:00.0', 229, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2069, '2025-03-28 00:00:00', '2025-03-28T05:00:00.0', '2025-03-28T05:15:00.0', 198, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2070, '2025-03-28 00:00:00', '2025-03-28T05:15:00.0', '2025-03-28T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2071, '2025-03-28 00:00:00', '2025-03-28T05:30:00.0', '2025-03-28T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2072, '2025-03-28 00:00:00', '2025-03-28T05:45:00.0', '2025-03-28T06:00:00.0', 346, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2073, '2025-03-28 00:00:00', '2025-03-28T06:00:00.0', '2025-03-28T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2074, '2025-03-28 00:00:00', '2025-03-28T06:15:00.0', '2025-03-28T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2075, '2025-03-28 00:00:00', '2025-03-28T06:30:00.0', '2025-03-28T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2076, '2025-03-28 00:00:00', '2025-03-28T06:45:00.0', '2025-03-28T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2077, '2025-03-28 00:00:00', '2025-03-28T07:00:00.0', '2025-03-28T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2078, '2025-03-28 00:00:00', '2025-03-28T07:15:00.0', '2025-03-28T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2079, '2025-03-28 00:00:00', '2025-03-28T07:30:00.0', '2025-03-28T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2080, '2025-03-28 00:00:00', '2025-03-28T07:45:00.0', '2025-03-28T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2081, '2025-03-28 00:00:00', '2025-03-28T08:00:00.0', '2025-03-28T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2082, '2025-03-28 00:00:00', '2025-03-28T08:15:00.0', '2025-03-28T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2083, '2025-03-28 00:00:00', '2025-03-28T08:30:00.0', '2025-03-28T08:45:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2084, '2025-03-28 00:00:00', '2025-03-28T08:45:00.0', '2025-03-28T09:00:00.0', 183, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2085, '2025-03-28 00:00:00', '2025-03-28T09:00:00.0', '2025-03-28T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2086, '2025-03-28 00:00:00', '2025-03-28T09:15:00.0', '2025-03-28T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2087, '2025-03-28 00:00:00', '2025-03-28T09:30:00.0', '2025-03-28T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2088, '2025-03-28 00:00:00', '2025-03-28T09:45:00.0', '2025-03-28T10:00:00.0', 475, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2089, '2025-03-28 00:00:00', '2025-03-28T10:00:00.0', '2025-03-28T10:15:00.0', 281, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2090, '2025-03-28 00:00:00', '2025-03-28T10:15:00.0', '2025-03-28T10:30:00.0', 51, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2091, '2025-03-28 00:00:00', '2025-03-28T10:30:00.0', '2025-03-28T10:45:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2092, '2025-03-28 00:00:00', '2025-03-28T10:45:00.0', '2025-03-28T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2093, '2025-03-28 00:00:00', '2025-03-28T11:00:00.0', '2025-03-28T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2094, '2025-03-28 00:00:00', '2025-03-28T11:15:00.0', '2025-03-28T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2095, '2025-03-28 00:00:00', '2025-03-28T11:30:00.0', '2025-03-28T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2096, '2025-03-28 00:00:00', '2025-03-28T11:45:00.0', '2025-03-28T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2097, '2025-03-28 00:00:00', '2025-03-28T12:00:00.0', '2025-03-28T12:15:00.0', 378, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2098, '2025-03-28 00:00:00', '2025-03-28T12:15:00.0', '2025-03-28T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2099, '2025-03-28 00:00:00', '2025-03-28T12:30:00.0', '2025-03-28T12:45:00.0', 57, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2100, '2025-03-28 00:00:00', '2025-03-28T12:45:00.0', '2025-03-28T13:00:00.0', 139, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2101, '2025-03-28 00:00:00', '2025-03-28T13:00:00.0', '2025-03-28T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2102, '2025-03-28 00:00:00', '2025-03-28T13:15:00.0', '2025-03-28T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2103, '2025-03-28 00:00:00', '2025-03-28T13:30:00.0', '2025-03-28T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2104, '2025-03-28 00:00:00', '2025-03-28T13:45:00.0', '2025-03-28T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2105, '2025-03-28 00:00:00', '2025-03-28T14:00:00.0', '2025-03-28T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2106, '2025-03-28 00:00:00', '2025-03-28T14:15:00.0', '2025-03-28T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2107, '2025-03-28 00:00:00', '2025-03-28T14:30:00.0', '2025-03-28T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2108, '2025-03-28 00:00:00', '2025-03-28T14:45:00.0', '2025-03-28T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2109, '2025-03-28 00:00:00', '2025-03-28T15:00:00.0', '2025-03-28T15:15:00.0', 446, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2110, '2025-03-28 00:00:00', '2025-03-28T15:15:00.0', '2025-03-28T15:30:00.0', 900, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2111, '2025-03-28 00:00:00', '2025-03-28T15:30:00.0', '2025-03-28T15:45:00.0', 180, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2112, '2025-03-28 00:00:00', '2025-03-28T15:45:00.0', '2025-03-28T16:00:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2113, '2025-03-29 00:00:00', '2025-03-28T16:00:00.0', '2025-03-28T16:15:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2114, '2025-03-29 00:00:00', '2025-03-28T16:15:00.0', '2025-03-28T16:30:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (2115, '2025-03-29 00:00:00', '2025-03-28T16:30:00.0', '2025-03-28T16:45:00.0', 10, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2116, '2025-03-29 00:00:00', '2025-03-28T16:45:00.0', '2025-03-28T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2117, '2025-03-29 00:00:00', '2025-03-28T17:00:00.0', '2025-03-28T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2118, '2025-03-29 00:00:00', '2025-03-28T17:15:00.0', '2025-03-28T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2119, '2025-03-29 00:00:00', '2025-03-28T17:30:00.0', '2025-03-28T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2120, '2025-03-29 00:00:00', '2025-03-28T17:45:00.0', '2025-03-28T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2121, '2025-03-29 00:00:00', '2025-03-28T18:00:00.0', '2025-03-28T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2122, '2025-03-29 00:00:00', '2025-03-28T18:15:00.0', '2025-03-28T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2123, '2025-03-29 00:00:00', '2025-03-28T18:30:00.0', '2025-03-28T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2124, '2025-03-29 00:00:00', '2025-03-28T18:45:00.0', '2025-03-28T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2125, '2025-03-29 00:00:00', '2025-03-28T19:00:00.0', '2025-03-28T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2126, '2025-03-29 00:00:00', '2025-03-28T19:15:00.0', '2025-03-28T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2127, '2025-03-29 00:00:00', '2025-03-28T19:30:00.0', '2025-03-28T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2128, '2025-03-29 00:00:00', '2025-03-28T19:45:00.0', '2025-03-28T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2129, '2025-03-29 00:00:00', '2025-03-28T20:00:00.0', '2025-03-28T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2130, '2025-03-29 00:00:00', '2025-03-28T20:15:00.0', '2025-03-28T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2131, '2025-03-29 00:00:00', '2025-03-28T20:30:00.0', '2025-03-28T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2132, '2025-03-29 00:00:00', '2025-03-28T20:45:00.0', '2025-03-28T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2133, '2025-03-29 00:00:00', '2025-03-28T21:00:00.0', '2025-03-28T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2134, '2025-03-29 00:00:00', '2025-03-28T21:15:00.0', '2025-03-28T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2135, '2025-03-29 00:00:00', '2025-03-28T21:30:00.0', '2025-03-28T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2136, '2025-03-29 00:00:00', '2025-03-28T21:45:00.0', '2025-03-28T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2137, '2025-03-29 00:00:00', '2025-03-28T22:00:00.0', '2025-03-28T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2138, '2025-03-29 00:00:00', '2025-03-28T22:15:00.0', '2025-03-28T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2139, '2025-03-29 00:00:00', '2025-03-28T22:30:00.0', '2025-03-28T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2140, '2025-03-29 00:00:00', '2025-03-28T22:45:00.0', '2025-03-28T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2141, '2025-03-29 00:00:00', '2025-03-28T23:00:00.0', '2025-03-28T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2142, '2025-03-29 00:00:00', '2025-03-28T23:15:00.0', '2025-03-28T23:30:00.0', 7, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2143, '2025-03-29 00:00:00', '2025-03-28T23:30:00.0', '2025-03-28T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2144, '2025-03-29 00:00:00', '2025-03-28T23:45:00.0', '2025-03-29T00:00:00.0', 33, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2145, '2025-03-29 00:00:00', '2025-03-29T00:00:00.0', '2025-03-29T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2146, '2025-03-29 00:00:00', '2025-03-29T00:15:00.0', '2025-03-29T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2147, '2025-03-29 00:00:00', '2025-03-29T00:30:00.0', '2025-03-29T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2148, '2025-03-29 00:00:00', '2025-03-29T00:45:00.0', '2025-03-29T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2149, '2025-03-29 00:00:00', '2025-03-29T01:00:00.0', '2025-03-29T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2150, '2025-03-29 00:00:00', '2025-03-29T01:15:00.0', '2025-03-29T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2151, '2025-03-29 00:00:00', '2025-03-29T01:30:00.0', '2025-03-29T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2152, '2025-03-29 00:00:00', '2025-03-29T01:45:00.0', '2025-03-29T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2153, '2025-03-29 00:00:00', '2025-03-29T02:00:00.0', '2025-03-29T02:15:00.0', 332, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2154, '2025-03-29 00:00:00', '2025-03-29T02:15:00.0', '2025-03-29T02:30:00.0', 423, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2155, '2025-03-29 00:00:00', '2025-03-29T02:30:00.0', '2025-03-29T02:45:00.0', 308, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2156, '2025-03-29 00:00:00', '2025-03-29T02:45:00.0', '2025-03-29T03:00:00.0', 415, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2157, '2025-03-29 00:00:00', '2025-03-29T03:00:00.0', '2025-03-29T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2158, '2025-03-29 00:00:00', '2025-03-29T03:15:00.0', '2025-03-29T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2159, '2025-03-29 00:00:00', '2025-03-29T03:30:00.0', '2025-03-29T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2160, '2025-03-29 00:00:00', '2025-03-29T03:45:00.0', '2025-03-29T04:00:00.0', 128, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2161, '2025-03-29 00:00:00', '2025-03-29T04:00:00.0', '2025-03-29T04:15:00.0', 19, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2162, '2025-03-29 00:00:00', '2025-03-29T04:15:00.0', '2025-03-29T04:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2163, '2025-03-29 00:00:00', '2025-03-29T04:30:00.0', '2025-03-29T04:45:00.0', 482, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2164, '2025-03-29 00:00:00', '2025-03-29T04:45:00.0', '2025-03-29T05:00:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2165, '2025-03-29 00:00:00', '2025-03-29T05:00:00.0', '2025-03-29T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2166, '2025-03-29 00:00:00', '2025-03-29T05:15:00.0', '2025-03-29T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2167, '2025-03-29 00:00:00', '2025-03-29T05:30:00.0', '2025-03-29T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2168, '2025-03-29 00:00:00', '2025-03-29T05:45:00.0', '2025-03-29T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2169, '2025-03-29 00:00:00', '2025-03-29T06:00:00.0', '2025-03-29T06:15:00.0', 410, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2170, '2025-03-29 00:00:00', '2025-03-29T06:15:00.0', '2025-03-29T06:30:00.0', 389, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2171, '2025-03-29 00:00:00', '2025-03-29T06:30:00.0', '2025-03-29T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2172, '2025-03-29 00:00:00', '2025-03-29T06:45:00.0', '2025-03-29T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2173, '2025-03-29 00:00:00', '2025-03-29T07:00:00.0', '2025-03-29T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2174, '2025-03-29 00:00:00', '2025-03-29T07:15:00.0', '2025-03-29T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2175, '2025-03-29 00:00:00', '2025-03-29T07:30:00.0', '2025-03-29T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2176, '2025-03-29 00:00:00', '2025-03-29T07:45:00.0', '2025-03-29T08:00:00.0', 322, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2177, '2025-03-29 00:00:00', '2025-03-29T08:00:00.0', '2025-03-29T08:15:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2178, '2025-03-29 00:00:00', '2025-03-29T08:15:00.0', '2025-03-29T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2179, '2025-03-29 00:00:00', '2025-03-29T08:30:00.0', '2025-03-29T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2180, '2025-03-29 00:00:00', '2025-03-29T08:45:00.0', '2025-03-29T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2181, '2025-03-29 00:00:00', '2025-03-29T09:00:00.0', '2025-03-29T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2182, '2025-03-29 00:00:00', '2025-03-29T09:15:00.0', '2025-03-29T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2183, '2025-03-29 00:00:00', '2025-03-29T09:30:00.0', '2025-03-29T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2184, '2025-03-29 00:00:00', '2025-03-29T09:45:00.0', '2025-03-29T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2185, '2025-03-29 00:00:00', '2025-03-29T10:00:00.0', '2025-03-29T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2186, '2025-03-29 00:00:00', '2025-03-29T10:15:00.0', '2025-03-29T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2187, '2025-03-29 00:00:00', '2025-03-29T10:30:00.0', '2025-03-29T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2188, '2025-03-29 00:00:00', '2025-03-29T10:45:00.0', '2025-03-29T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2189, '2025-03-29 00:00:00', '2025-03-29T11:00:00.0', '2025-03-29T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2190, '2025-03-29 00:00:00', '2025-03-29T11:15:00.0', '2025-03-29T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2191, '2025-03-29 00:00:00', '2025-03-29T11:30:00.0', '2025-03-29T11:45:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2192, '2025-03-29 00:00:00', '2025-03-29T11:45:00.0', '2025-03-29T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2193, '2025-03-29 00:00:00', '2025-03-29T12:00:00.0', '2025-03-29T12:15:00.0', 82, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2194, '2025-03-29 00:00:00', '2025-03-29T12:15:00.0', '2025-03-29T12:30:00.0', 163, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2195, '2025-03-29 00:00:00', '2025-03-29T12:30:00.0', '2025-03-29T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2196, '2025-03-29 00:00:00', '2025-03-29T12:45:00.0', '2025-03-29T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2197, '2025-03-29 00:00:00', '2025-03-29T13:00:00.0', '2025-03-29T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2198, '2025-03-29 00:00:00', '2025-03-29T13:15:00.0', '2025-03-29T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2199, '2025-03-29 00:00:00', '2025-03-29T13:30:00.0', '2025-03-29T13:45:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2200, '2025-03-29 00:00:00', '2025-03-29T13:45:00.0', '2025-03-29T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2201, '2025-03-29 00:00:00', '2025-03-29T14:00:00.0', '2025-03-29T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2202, '2025-03-29 00:00:00', '2025-03-29T14:15:00.0', '2025-03-29T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2203, '2025-03-29 00:00:00', '2025-03-29T14:30:00.0', '2025-03-29T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2204, '2025-03-29 00:00:00', '2025-03-29T14:45:00.0', '2025-03-29T15:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2205, '2025-03-29 00:00:00', '2025-03-29T15:00:00.0', '2025-03-29T15:15:00.0', 403, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2206, '2025-03-29 00:00:00', '2025-03-29T15:15:00.0', '2025-03-29T15:30:00.0', 186, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2207, '2025-03-29 00:00:00', '2025-03-29T15:30:00.0', '2025-03-29T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2208, '2025-03-29 00:00:00', '2025-03-29T15:45:00.0', '2025-03-29T16:00:00.0', 26, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2209, '2025-03-30 00:00:00', '2025-03-29T16:00:00.0', '2025-03-29T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2210, '2025-03-30 00:00:00', '2025-03-29T16:15:00.0', '2025-03-29T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2211, '2025-03-30 00:00:00', '2025-03-29T16:30:00.0', '2025-03-29T16:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2212, '2025-03-30 00:00:00', '2025-03-29T16:45:00.0', '2025-03-29T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2213, '2025-03-30 00:00:00', '2025-03-29T17:00:00.0', '2025-03-29T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2214, '2025-03-30 00:00:00', '2025-03-29T17:15:00.0', '2025-03-29T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2215, '2025-03-30 00:00:00', '2025-03-29T17:30:00.0', '2025-03-29T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2216, '2025-03-30 00:00:00', '2025-03-29T17:45:00.0', '2025-03-29T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2217, '2025-03-30 00:00:00', '2025-03-29T18:00:00.0', '2025-03-29T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2218, '2025-03-30 00:00:00', '2025-03-29T18:15:00.0', '2025-03-29T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2219, '2025-03-30 00:00:00', '2025-03-29T18:30:00.0', '2025-03-29T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2220, '2025-03-30 00:00:00', '2025-03-29T18:45:00.0', '2025-03-29T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2221, '2025-03-30 00:00:00', '2025-03-29T19:00:00.0', '2025-03-29T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2222, '2025-03-30 00:00:00', '2025-03-29T19:15:00.0', '2025-03-29T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2223, '2025-03-30 00:00:00', '2025-03-29T19:30:00.0', '2025-03-29T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2224, '2025-03-30 00:00:00', '2025-03-29T19:45:00.0', '2025-03-29T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2225, '2025-03-30 00:00:00', '2025-03-29T20:00:00.0', '2025-03-29T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2226, '2025-03-30 00:00:00', '2025-03-29T20:15:00.0', '2025-03-29T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2227, '2025-03-30 00:00:00', '2025-03-29T20:30:00.0', '2025-03-29T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2228, '2025-03-30 00:00:00', '2025-03-29T20:45:00.0', '2025-03-29T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2229, '2025-03-30 00:00:00', '2025-03-29T21:00:00.0', '2025-03-29T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2230, '2025-03-30 00:00:00', '2025-03-29T21:15:00.0', '2025-03-29T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2231, '2025-03-30 00:00:00', '2025-03-29T21:30:00.0', '2025-03-29T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2232, '2025-03-30 00:00:00', '2025-03-29T21:45:00.0', '2025-03-29T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2233, '2025-03-30 00:00:00', '2025-03-29T22:00:00.0', '2025-03-29T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2234, '2025-03-30 00:00:00', '2025-03-29T22:15:00.0', '2025-03-29T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2235, '2025-03-30 00:00:00', '2025-03-29T22:30:00.0', '2025-03-29T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2236, '2025-03-30 00:00:00', '2025-03-29T22:45:00.0', '2025-03-29T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2237, '2025-03-30 00:00:00', '2025-03-29T23:00:00.0', '2025-03-29T23:15:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2238, '2025-03-30 00:00:00', '2025-03-29T23:15:00.0', '2025-03-29T23:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2239, '2025-03-30 00:00:00', '2025-03-29T23:30:00.0', '2025-03-29T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2240, '2025-03-30 00:00:00', '2025-03-29T23:45:00.0', '2025-03-30T00:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2241, '2025-03-30 00:00:00', '2025-03-30T00:00:00.0', '2025-03-30T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2242, '2025-03-30 00:00:00', '2025-03-30T00:15:00.0', '2025-03-30T00:30:00.0', 212, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2243, '2025-03-30 00:00:00', '2025-03-30T00:30:00.0', '2025-03-30T00:45:00.0', 301, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2244, '2025-03-30 00:00:00', '2025-03-30T00:45:00.0', '2025-03-30T01:00:00.0', 71, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2245, '2025-03-30 00:00:00', '2025-03-30T01:00:00.0', '2025-03-30T01:15:00.0', 273, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2246, '2025-03-30 00:00:00', '2025-03-30T01:15:00.0', '2025-03-30T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2247, '2025-03-30 00:00:00', '2025-03-30T01:30:00.0', '2025-03-30T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2248, '2025-03-30 00:00:00', '2025-03-30T01:45:00.0', '2025-03-30T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2249, '2025-03-30 00:00:00', '2025-03-30T02:00:00.0', '2025-03-30T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2250, '2025-03-30 00:00:00', '2025-03-30T02:15:00.0', '2025-03-30T02:30:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2251, '2025-03-30 00:00:00', '2025-03-30T02:30:00.0', '2025-03-30T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2252, '2025-03-30 00:00:00', '2025-03-30T02:45:00.0', '2025-03-30T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2253, '2025-03-30 00:00:00', '2025-03-30T03:00:00.0', '2025-03-30T03:15:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2254, '2025-03-30 00:00:00', '2025-03-30T03:15:00.0', '2025-03-30T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2255, '2025-03-30 00:00:00', '2025-03-30T03:30:00.0', '2025-03-30T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2256, '2025-03-30 00:00:00', '2025-03-30T03:45:00.0', '2025-03-30T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2257, '2025-03-30 00:00:00', '2025-03-30T04:00:00.0', '2025-03-30T04:15:00.0', 87, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2258, '2025-03-30 00:00:00', '2025-03-30T04:15:00.0', '2025-03-30T04:30:00.0', 83, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2259, '2025-03-30 00:00:00', '2025-03-30T04:30:00.0', '2025-03-30T04:45:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2260, '2025-03-30 00:00:00', '2025-03-30T04:45:00.0', '2025-03-30T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2261, '2025-03-30 00:00:00', '2025-03-30T05:00:00.0', '2025-03-30T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2262, '2025-03-30 00:00:00', '2025-03-30T05:15:00.0', '2025-03-30T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2263, '2025-03-30 00:00:00', '2025-03-30T05:30:00.0', '2025-03-30T05:45:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2264, '2025-03-30 00:00:00', '2025-03-30T05:45:00.0', '2025-03-30T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2265, '2025-03-30 00:00:00', '2025-03-30T06:00:00.0', '2025-03-30T06:15:00.0', 198, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2266, '2025-03-30 00:00:00', '2025-03-30T06:15:00.0', '2025-03-30T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2267, '2025-03-30 00:00:00', '2025-03-30T06:30:00.0', '2025-03-30T06:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2268, '2025-03-30 00:00:00', '2025-03-30T06:45:00.0', '2025-03-30T07:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2269, '2025-03-30 00:00:00', '2025-03-30T07:00:00.0', '2025-03-30T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2270, '2025-03-30 00:00:00', '2025-03-30T07:15:00.0', '2025-03-30T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2271, '2025-03-30 00:00:00', '2025-03-30T07:30:00.0', '2025-03-30T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2272, '2025-03-30 00:00:00', '2025-03-30T07:45:00.0', '2025-03-30T08:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2273, '2025-03-30 00:00:00', '2025-03-30T08:00:00.0', '2025-03-30T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2274, '2025-03-30 00:00:00', '2025-03-30T08:15:00.0', '2025-03-30T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2275, '2025-03-30 00:00:00', '2025-03-30T08:30:00.0', '2025-03-30T08:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2276, '2025-03-30 00:00:00', '2025-03-30T08:45:00.0', '2025-03-30T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2277, '2025-03-30 00:00:00', '2025-03-30T09:00:00.0', '2025-03-30T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2278, '2025-03-30 00:00:00', '2025-03-30T09:15:00.0', '2025-03-30T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2279, '2025-03-30 00:00:00', '2025-03-30T09:30:00.0', '2025-03-30T09:45:00.0', 244, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2280, '2025-03-30 00:00:00', '2025-03-30T09:45:00.0', '2025-03-30T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2281, '2025-03-30 00:00:00', '2025-03-30T10:00:00.0', '2025-03-30T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2282, '2025-03-30 00:00:00', '2025-03-30T10:15:00.0', '2025-03-30T10:30:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2283, '2025-03-30 00:00:00', '2025-03-30T10:30:00.0', '2025-03-30T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2284, '2025-03-30 00:00:00', '2025-03-30T10:45:00.0', '2025-03-30T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2285, '2025-03-30 00:00:00', '2025-03-30T11:00:00.0', '2025-03-30T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2286, '2025-03-30 00:00:00', '2025-03-30T11:15:00.0', '2025-03-30T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2287, '2025-03-30 00:00:00', '2025-03-30T11:30:00.0', '2025-03-30T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2288, '2025-03-30 00:00:00', '2025-03-30T11:45:00.0', '2025-03-30T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2289, '2025-03-30 00:00:00', '2025-03-30T12:00:00.0', '2025-03-30T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2290, '2025-03-30 00:00:00', '2025-03-30T12:15:00.0', '2025-03-30T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2291, '2025-03-30 00:00:00', '2025-03-30T12:30:00.0', '2025-03-30T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2292, '2025-03-30 00:00:00', '2025-03-30T12:45:00.0', '2025-03-30T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2293, '2025-03-30 00:00:00', '2025-03-30T13:00:00.0', '2025-03-30T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2294, '2025-03-30 00:00:00', '2025-03-30T13:15:00.0', '2025-03-30T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2295, '2025-03-30 00:00:00', '2025-03-30T13:30:00.0', '2025-03-30T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2296, '2025-03-30 00:00:00', '2025-03-30T13:45:00.0', '2025-03-30T14:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2297, '2025-03-30 00:00:00', '2025-03-30T14:00:00.0', '2025-03-30T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2298, '2025-03-30 00:00:00', '2025-03-30T14:15:00.0', '2025-03-30T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2299, '2025-03-30 00:00:00', '2025-03-30T14:30:00.0', '2025-03-30T14:45:00.0', 294, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2300, '2025-03-30 00:00:00', '2025-03-30T14:45:00.0', '2025-03-30T15:00:00.0', 424, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2301, '2025-03-30 00:00:00', '2025-03-30T15:00:00.0', '2025-03-30T15:15:00.0', 43, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2302, '2025-03-30 00:00:00', '2025-03-30T15:15:00.0', '2025-03-30T15:30:00.0', 127, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2303, '2025-03-30 00:00:00', '2025-03-30T15:30:00.0', '2025-03-30T15:45:00.0', 28, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2304, '2025-03-30 00:00:00', '2025-03-30T15:45:00.0', '2025-03-30T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2305, '2025-03-31 00:00:00', '2025-03-30T16:00:00.0', '2025-03-30T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2306, '2025-03-31 00:00:00', '2025-03-30T16:15:00.0', '2025-03-30T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2307, '2025-03-31 00:00:00', '2025-03-30T16:30:00.0', '2025-03-30T16:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2308, '2025-03-31 00:00:00', '2025-03-30T16:45:00.0', '2025-03-30T17:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2309, '2025-03-31 00:00:00', '2025-03-30T17:00:00.0', '2025-03-30T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2310, '2025-03-31 00:00:00', '2025-03-30T17:15:00.0', '2025-03-30T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2311, '2025-03-31 00:00:00', '2025-03-30T17:30:00.0', '2025-03-30T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2312, '2025-03-31 00:00:00', '2025-03-30T17:45:00.0', '2025-03-30T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2313, '2025-03-31 00:00:00', '2025-03-30T18:00:00.0', '2025-03-30T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2314, '2025-03-31 00:00:00', '2025-03-30T18:15:00.0', '2025-03-30T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2315, '2025-03-31 00:00:00', '2025-03-30T18:30:00.0', '2025-03-30T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2316, '2025-03-31 00:00:00', '2025-03-30T18:45:00.0', '2025-03-30T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2317, '2025-03-31 00:00:00', '2025-03-30T19:00:00.0', '2025-03-30T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2318, '2025-03-31 00:00:00', '2025-03-30T19:15:00.0', '2025-03-30T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2319, '2025-03-31 00:00:00', '2025-03-30T19:30:00.0', '2025-03-30T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2320, '2025-03-31 00:00:00', '2025-03-30T19:45:00.0', '2025-03-30T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2321, '2025-03-31 00:00:00', '2025-03-30T20:00:00.0', '2025-03-30T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2322, '2025-03-31 00:00:00', '2025-03-30T20:15:00.0', '2025-03-30T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2323, '2025-03-31 00:00:00', '2025-03-30T20:30:00.0', '2025-03-30T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2324, '2025-03-31 00:00:00', '2025-03-30T20:45:00.0', '2025-03-30T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2325, '2025-03-31 00:00:00', '2025-03-30T21:00:00.0', '2025-03-30T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2326, '2025-03-31 00:00:00', '2025-03-30T21:15:00.0', '2025-03-30T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2327, '2025-03-31 00:00:00', '2025-03-30T21:30:00.0', '2025-03-30T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2328, '2025-03-31 00:00:00', '2025-03-30T21:45:00.0', '2025-03-30T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2329, '2025-03-31 00:00:00', '2025-03-30T22:00:00.0', '2025-03-30T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2330, '2025-03-31 00:00:00', '2025-03-30T22:15:00.0', '2025-03-30T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2331, '2025-03-31 00:00:00', '2025-03-30T22:30:00.0', '2025-03-30T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2332, '2025-03-31 00:00:00', '2025-03-30T22:45:00.0', '2025-03-30T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2333, '2025-03-31 00:00:00', '2025-03-30T23:00:00.0', '2025-03-30T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2334, '2025-03-31 00:00:00', '2025-03-30T23:15:00.0', '2025-03-30T23:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2335, '2025-03-31 00:00:00', '2025-03-30T23:30:00.0', '2025-03-30T23:45:00.0', 0, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (2336, '2025-03-31 00:00:00', '2025-03-30T23:45:00.0', '2025-03-31T00:00:00.0', 48, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2337, '2025-03-31 00:00:00', '2025-03-31T00:00:00.0', '2025-03-31T00:15:00.0', 469, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2338, '2025-03-31 00:00:00', '2025-03-31T00:15:00.0', '2025-03-31T00:30:00.0', 0, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2339, '2025-03-31 00:00:00', '2025-03-31T00:30:00.0', '2025-03-31T00:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2340, '2025-03-31 00:00:00', '2025-03-31T00:45:00.0', '2025-03-31T01:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2341, '2025-03-31 00:00:00', '2025-03-31T01:00:00.0', '2025-03-31T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2342, '2025-03-31 00:00:00', '2025-03-31T01:15:00.0', '2025-03-31T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2343, '2025-03-31 00:00:00', '2025-03-31T01:30:00.0', '2025-03-31T01:45:00.0', 143, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2344, '2025-03-31 00:00:00', '2025-03-31T01:45:00.0', '2025-03-31T02:00:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2345, '2025-03-31 00:00:00', '2025-03-31T02:00:00.0', '2025-03-31T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2346, '2025-03-31 00:00:00', '2025-03-31T02:15:00.0', '2025-03-31T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2347, '2025-03-31 00:00:00', '2025-03-31T02:30:00.0', '2025-03-31T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2348, '2025-03-31 00:00:00', '2025-03-31T02:45:00.0', '2025-03-31T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2349, '2025-03-31 00:00:00', '2025-03-31T03:00:00.0', '2025-03-31T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2350, '2025-03-31 00:00:00', '2025-03-31T03:15:00.0', '2025-03-31T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2351, '2025-03-31 00:00:00', '2025-03-31T03:30:00.0', '2025-03-31T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2352, '2025-03-31 00:00:00', '2025-03-31T03:45:00.0', '2025-03-31T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2353, '2025-03-31 00:00:00', '2025-03-31T04:00:00.0', '2025-03-31T04:15:00.0', 471, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2354, '2025-03-31 00:00:00', '2025-03-31T04:15:00.0', '2025-03-31T04:30:00.0', 147, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2355, '2025-03-31 00:00:00', '2025-03-31T04:30:00.0', '2025-03-31T04:45:00.0', 24, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2356, '2025-03-31 00:00:00', '2025-03-31T04:45:00.0', '2025-03-31T05:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2357, '2025-03-31 00:00:00', '2025-03-31T05:00:00.0', '2025-03-31T05:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2358, '2025-03-31 00:00:00', '2025-03-31T05:15:00.0', '2025-03-31T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2359, '2025-03-31 00:00:00', '2025-03-31T05:30:00.0', '2025-03-31T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2360, '2025-03-31 00:00:00', '2025-03-31T05:45:00.0', '2025-03-31T06:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2361, '2025-03-31 00:00:00', '2025-03-31T06:00:00.0', '2025-03-31T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2362, '2025-03-31 00:00:00', '2025-03-31T06:15:00.0', '2025-03-31T06:30:00.0', 137, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2363, '2025-03-31 00:00:00', '2025-03-31T06:30:00.0', '2025-03-31T06:45:00.0', 354, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2364, '2025-03-31 00:00:00', '2025-03-31T06:45:00.0', '2025-03-31T07:00:00.0', 54, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2365, '2025-03-31 00:00:00', '2025-03-31T07:00:00.0', '2025-03-31T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2366, '2025-03-31 00:00:00', '2025-03-31T07:15:00.0', '2025-03-31T07:30:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2367, '2025-03-31 00:00:00', '2025-03-31T07:30:00.0', '2025-03-31T07:45:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2368, '2025-03-31 00:00:00', '2025-03-31T07:45:00.0', '2025-03-31T08:00:00.0', 13, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2369, '2025-03-31 00:00:00', '2025-03-31T08:00:00.0', '2025-03-31T08:15:00.0', 53, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2370, '2025-03-31 00:00:00', '2025-03-31T08:15:00.0', '2025-03-31T08:30:00.0', 92, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2371, '2025-03-31 00:00:00', '2025-03-31T08:30:00.0', '2025-03-31T08:45:00.0', 1052, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2372, '2025-03-31 00:00:00', '2025-03-31T08:45:00.0', '2025-03-31T09:00:00.0', 218, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2373, '2025-03-31 00:00:00', '2025-03-31T09:00:00.0', '2025-03-31T09:15:00.0', 25, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2374, '2025-03-31 00:00:00', '2025-03-31T09:15:00.0', '2025-03-31T09:30:00.0', 90, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2375, '2025-03-31 00:00:00', '2025-03-31T09:30:00.0', '2025-03-31T09:45:00.0', 72, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2376, '2025-03-31 00:00:00', '2025-03-31T09:45:00.0', '2025-03-31T10:00:00.0', 318, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2377, '2025-03-31 00:00:00', '2025-03-31T10:00:00.0', '2025-03-31T10:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2378, '2025-03-31 00:00:00', '2025-03-31T10:15:00.0', '2025-03-31T10:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2379, '2025-03-31 00:00:00', '2025-03-31T10:30:00.0', '2025-03-31T10:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2380, '2025-03-31 00:00:00', '2025-03-31T10:45:00.0', '2025-03-31T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2381, '2025-03-31 00:00:00', '2025-03-31T11:00:00.0', '2025-03-31T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2382, '2025-03-31 00:00:00', '2025-03-31T11:15:00.0', '2025-03-31T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2383, '2025-03-31 00:00:00', '2025-03-31T11:30:00.0', '2025-03-31T11:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2384, '2025-03-31 00:00:00', '2025-03-31T11:45:00.0', '2025-03-31T12:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2385, '2025-03-31 00:00:00', '2025-03-31T12:00:00.0', '2025-03-31T12:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2386, '2025-03-31 00:00:00', '2025-03-31T12:15:00.0', '2025-03-31T12:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2387, '2025-03-31 00:00:00', '2025-03-31T12:30:00.0', '2025-03-31T12:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2388, '2025-03-31 00:00:00', '2025-03-31T12:45:00.0', '2025-03-31T13:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2389, '2025-03-31 00:00:00', '2025-03-31T13:00:00.0', '2025-03-31T13:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2390, '2025-03-31 00:00:00', '2025-03-31T13:15:00.0', '2025-03-31T13:30:00.0', 39, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2391, '2025-03-31 00:00:00', '2025-03-31T13:30:00.0', '2025-03-31T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2392, '2025-03-31 00:00:00', '2025-03-31T13:45:00.0', '2025-03-31T14:00:00.0', 21, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2393, '2025-03-31 00:00:00', '2025-03-31T14:00:00.0', '2025-03-31T14:15:00.0', 409, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2394, '2025-03-31 00:00:00', '2025-03-31T14:15:00.0', '2025-03-31T14:30:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2395, '2025-03-31 00:00:00', '2025-03-31T14:30:00.0', '2025-03-31T14:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2396, '2025-03-31 00:00:00', '2025-03-31T14:45:00.0', '2025-03-31T15:00:00.0', 355, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2397, '2025-03-31 00:00:00', '2025-03-31T15:00:00.0', '2025-03-31T15:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2398, '2025-03-31 00:00:00', '2025-03-31T15:15:00.0', '2025-03-31T15:30:00.0', 245, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2399, '2025-03-31 00:00:00', '2025-03-31T15:30:00.0', '2025-03-31T15:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2400, '2025-03-31 00:00:00', '2025-03-31T15:45:00.0', '2025-03-31T16:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2401, '2025-04-01 00:00:00', '2025-03-31T16:00:00.0', '2025-03-31T16:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2402, '2025-04-01 00:00:00', '2025-03-31T16:15:00.0', '2025-03-31T16:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2403, '2025-04-01 00:00:00', '2025-03-31T16:30:00.0', '2025-03-31T16:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2404, '2025-04-01 00:00:00', '2025-03-31T16:45:00.0', '2025-03-31T17:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2405, '2025-04-01 00:00:00', '2025-03-31T17:00:00.0', '2025-03-31T17:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2406, '2025-04-01 00:00:00', '2025-03-31T17:15:00.0', '2025-03-31T17:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2407, '2025-04-01 00:00:00', '2025-03-31T17:30:00.0', '2025-03-31T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2408, '2025-04-01 00:00:00', '2025-03-31T17:45:00.0', '2025-03-31T18:00:00.0', 9, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2409, '2025-04-01 00:00:00', '2025-03-31T18:00:00.0', '2025-03-31T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2410, '2025-04-01 00:00:00', '2025-03-31T18:15:00.0', '2025-03-31T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2411, '2025-04-01 00:00:00', '2025-03-31T18:30:00.0', '2025-03-31T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2412, '2025-04-01 00:00:00', '2025-03-31T18:45:00.0', '2025-03-31T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2413, '2025-04-01 00:00:00', '2025-03-31T19:00:00.0', '2025-03-31T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2414, '2025-04-01 00:00:00', '2025-03-31T19:15:00.0', '2025-03-31T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2415, '2025-04-01 00:00:00', '2025-03-31T19:30:00.0', '2025-03-31T19:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2416, '2025-04-01 00:00:00', '2025-03-31T19:45:00.0', '2025-03-31T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2417, '2025-04-01 00:00:00', '2025-03-31T20:00:00.0', '2025-03-31T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2418, '2025-04-01 00:00:00', '2025-03-31T20:15:00.0', '2025-03-31T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2419, '2025-04-01 00:00:00', '2025-03-31T20:30:00.0', '2025-03-31T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2420, '2025-04-01 00:00:00', '2025-03-31T20:45:00.0', '2025-03-31T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2421, '2025-04-01 00:00:00', '2025-03-31T21:00:00.0', '2025-03-31T21:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2422, '2025-04-01 00:00:00', '2025-03-31T21:15:00.0', '2025-03-31T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2423, '2025-04-01 00:00:00', '2025-03-31T21:30:00.0', '2025-03-31T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2424, '2025-04-01 00:00:00', '2025-03-31T21:45:00.0', '2025-03-31T22:00:00.0', 11, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2425, '2025-04-01 00:00:00', '2025-03-31T22:00:00.0', '2025-03-31T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2426, '2025-04-01 00:00:00', '2025-03-31T22:15:00.0', '2025-03-31T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2427, '2025-04-01 00:00:00', '2025-03-31T22:30:00.0', '2025-03-31T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2428, '2025-04-01 00:00:00', '2025-03-31T22:45:00.0', '2025-03-31T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2429, '2025-04-01 00:00:00', '2025-03-31T23:00:00.0', '2025-03-31T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2430, '2025-04-01 00:00:00', '2025-03-31T23:15:00.0', '2025-03-31T23:30:00.0', 11, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2431, '2025-04-01 00:00:00', '2025-03-31T23:30:00.0', '2025-03-31T23:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2432, '2025-04-01 00:00:00', '2025-03-31T23:45:00.0', '2025-04-01T00:00:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2433, '2025-04-01 00:00:00', '2025-04-01T00:00:00.0', '2025-04-01T00:15:00.0', 117, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2434, '2025-04-01 00:00:00', '2025-04-01T00:15:00.0', '2025-04-01T00:30:00.0', 430, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2435, '2025-04-01 00:00:00', '2025-04-01T00:30:00.0', '2025-04-01T00:45:00.0', 501, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2436, '2025-04-01 00:00:00', '2025-04-01T00:45:00.0', '2025-04-01T01:00:00.0', 760, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2437, '2025-04-01 00:00:00', '2025-04-01T01:00:00.0', '2025-04-01T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2438, '2025-04-01 00:00:00', '2025-04-01T01:15:00.0', '2025-04-01T01:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2439, '2025-04-01 00:00:00', '2025-04-01T01:30:00.0', '2025-04-01T01:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2440, '2025-04-01 00:00:00', '2025-04-01T01:45:00.0', '2025-04-01T02:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2441, '2025-04-01 00:00:00', '2025-04-01T02:00:00.0', '2025-04-01T02:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2442, '2025-04-01 00:00:00', '2025-04-01T02:15:00.0', '2025-04-01T02:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2443, '2025-04-01 00:00:00', '2025-04-01T02:30:00.0', '2025-04-01T02:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2444, '2025-04-01 00:00:00', '2025-04-01T02:45:00.0', '2025-04-01T03:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2445, '2025-04-01 00:00:00', '2025-04-01T03:00:00.0', '2025-04-01T03:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2446, '2025-04-01 00:00:00', '2025-04-01T03:15:00.0', '2025-04-01T03:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2447, '2025-04-01 00:00:00', '2025-04-01T03:30:00.0', '2025-04-01T03:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2448, '2025-04-01 00:00:00', '2025-04-01T03:45:00.0', '2025-04-01T04:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2449, '2025-04-01 00:00:00', '2025-04-01T04:00:00.0', '2025-04-01T04:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2450, '2025-04-01 00:00:00', '2025-04-01T04:15:00.0', '2025-04-01T04:30:00.0', 288, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2451, '2025-04-01 00:00:00', '2025-04-01T04:30:00.0', '2025-04-01T04:45:00.0', 183, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2452, '2025-04-01 00:00:00', '2025-04-01T04:45:00.0', '2025-04-01T05:00:00.0', 255, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2453, '2025-04-01 00:00:00', '2025-04-01T05:00:00.0', '2025-04-01T05:15:00.0', 17, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2454, '2025-04-01 00:00:00', '2025-04-01T05:15:00.0', '2025-04-01T05:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2455, '2025-04-01 00:00:00', '2025-04-01T05:30:00.0', '2025-04-01T05:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2456, '2025-04-01 00:00:00', '2025-04-01T05:45:00.0', '2025-04-01T06:00:00.0', 27, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2457, '2025-04-01 00:00:00', '2025-04-01T06:00:00.0', '2025-04-01T06:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2458, '2025-04-01 00:00:00', '2025-04-01T06:15:00.0', '2025-04-01T06:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2459, '2025-04-01 00:00:00', '2025-04-01T06:30:00.0', '2025-04-01T06:45:00.0', 538, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2460, '2025-04-01 00:00:00', '2025-04-01T06:45:00.0', '2025-04-01T07:00:00.0', 15, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2461, '2025-04-01 00:00:00', '2025-04-01T07:00:00.0', '2025-04-01T07:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2462, '2025-04-01 00:00:00', '2025-04-01T07:15:00.0', '2025-04-01T07:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2463, '2025-04-01 00:00:00', '2025-04-01T07:30:00.0', '2025-04-01T07:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2464, '2025-04-01 00:00:00', '2025-04-01T07:45:00.0', '2025-04-01T08:00:00.0', 139, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2465, '2025-04-01 00:00:00', '2025-04-01T08:00:00.0', '2025-04-01T08:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2466, '2025-04-01 00:00:00', '2025-04-01T08:15:00.0', '2025-04-01T08:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2467, '2025-04-01 00:00:00', '2025-04-01T08:30:00.0', '2025-04-01T08:45:00.0', 598, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2468, '2025-04-01 00:00:00', '2025-04-01T08:45:00.0', '2025-04-01T09:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2469, '2025-04-01 00:00:00', '2025-04-01T09:00:00.0', '2025-04-01T09:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2470, '2025-04-01 00:00:00', '2025-04-01T09:15:00.0', '2025-04-01T09:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2471, '2025-04-01 00:00:00', '2025-04-01T09:30:00.0', '2025-04-01T09:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2472, '2025-04-01 00:00:00', '2025-04-01T09:45:00.0', '2025-04-01T10:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2473, '2025-04-01 00:00:00', '2025-04-01T10:00:00.0', '2025-04-01T10:15:00.0', 116, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2474, '2025-04-01 00:00:00', '2025-04-01T10:15:00.0', '2025-04-01T10:30:00.0', 623, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2475, '2025-04-01 00:00:00', '2025-04-01T10:30:00.0', '2025-04-01T10:45:00.0', 336, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2476, '2025-04-01 00:00:00', '2025-04-01T10:45:00.0', '2025-04-01T11:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2477, '2025-04-01 00:00:00', '2025-04-01T11:00:00.0', '2025-04-01T11:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2478, '2025-04-01 00:00:00', '2025-04-01T11:15:00.0', '2025-04-01T11:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2479, '2025-04-01 00:00:00', '2025-04-01T11:30:00.0', '2025-04-01T11:45:00.0', 321, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2480, '2025-04-01 00:00:00', '2025-04-01T11:45:00.0', '2025-04-01T12:00:00.0', 304, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2481, '2025-04-01 00:00:00', '2025-04-01T12:00:00.0', '2025-04-01T12:15:00.0', 235, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2482, '2025-04-01 00:00:00', '2025-04-01T12:15:00.0', '2025-04-01T12:30:00.0', 151, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2483, '2025-04-01 00:00:00', '2025-04-01T12:30:00.0', '2025-04-01T12:45:00.0', 53, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2484, '2025-04-01 00:00:00', '2025-04-01T12:45:00.0', '2025-04-01T13:00:00.0', 32, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2485, '2025-04-01 00:00:00', '2025-04-01T13:00:00.0', '2025-04-01T13:15:00.0', 7, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2486, '2025-04-01 00:00:00', '2025-04-01T13:15:00.0', '2025-04-01T13:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2487, '2025-04-01 00:00:00', '2025-04-01T13:30:00.0', '2025-04-01T13:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2488, '2025-04-01 00:00:00', '2025-04-01T13:45:00.0', '2025-04-01T14:00:00.0', 41, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2489, '2025-04-01 00:00:00', '2025-04-01T14:00:00.0', '2025-04-01T14:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2490, '2025-04-01 00:00:00', '2025-04-01T14:15:00.0', '2025-04-01T14:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2491, '2025-04-01 00:00:00', '2025-04-01T14:30:00.0', '2025-04-01T14:45:00.0', 80, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2492, '2025-04-01 00:00:00', '2025-04-01T14:45:00.0', '2025-04-01T15:00:00.0', 79, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2493, '2025-04-01 00:00:00', '2025-04-01T15:00:00.0', '2025-04-01T15:15:00.0', 116, '0', 'generic', 'False');
INSERT INTO `steps` VALUES (2494, '2025-04-01 00:00:00', '2025-04-01T15:15:00.0', '2025-04-01T15:30:00.0', 12, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2495, '2025-04-01 00:00:00', '2025-04-01T15:30:00.0', '2025-04-01T15:45:00.0', 9, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2496, '2025-04-01 00:00:00', '2025-04-01T15:45:00.0', '2025-04-01T16:00:00.0', 11, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2497, '2025-04-02 00:00:00', '2025-04-01T16:00:00.0', '2025-04-01T16:15:00.0', 6, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2498, '2025-04-02 00:00:00', '2025-04-01T16:15:00.0', '2025-04-01T16:30:00.0', 142, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2499, '2025-04-02 00:00:00', '2025-04-01T16:30:00.0', '2025-04-01T16:45:00.0', 426, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2500, '2025-04-02 00:00:00', '2025-04-01T16:45:00.0', '2025-04-01T17:00:00.0', 90, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2501, '2025-04-02 00:00:00', '2025-04-01T17:00:00.0', '2025-04-01T17:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2502, '2025-04-02 00:00:00', '2025-04-01T17:15:00.0', '2025-04-01T17:30:00.0', 21, '0', 'sleeping', 'False');
INSERT INTO `steps` VALUES (2503, '2025-04-02 00:00:00', '2025-04-01T17:30:00.0', '2025-04-01T17:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2504, '2025-04-02 00:00:00', '2025-04-01T17:45:00.0', '2025-04-01T18:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2505, '2025-04-02 00:00:00', '2025-04-01T18:00:00.0', '2025-04-01T18:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2506, '2025-04-02 00:00:00', '2025-04-01T18:15:00.0', '2025-04-01T18:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2507, '2025-04-02 00:00:00', '2025-04-01T18:30:00.0', '2025-04-01T18:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2508, '2025-04-02 00:00:00', '2025-04-01T18:45:00.0', '2025-04-01T19:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2509, '2025-04-02 00:00:00', '2025-04-01T19:00:00.0', '2025-04-01T19:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2510, '2025-04-02 00:00:00', '2025-04-01T19:15:00.0', '2025-04-01T19:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2511, '2025-04-02 00:00:00', '2025-04-01T19:30:00.0', '2025-04-01T19:45:00.0', 15, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2512, '2025-04-02 00:00:00', '2025-04-01T19:45:00.0', '2025-04-01T20:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2513, '2025-04-02 00:00:00', '2025-04-01T20:00:00.0', '2025-04-01T20:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2514, '2025-04-02 00:00:00', '2025-04-01T20:15:00.0', '2025-04-01T20:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2515, '2025-04-02 00:00:00', '2025-04-01T20:30:00.0', '2025-04-01T20:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2516, '2025-04-02 00:00:00', '2025-04-01T20:45:00.0', '2025-04-01T21:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2517, '2025-04-02 00:00:00', '2025-04-01T21:00:00.0', '2025-04-01T21:15:00.0', 9, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2518, '2025-04-02 00:00:00', '2025-04-01T21:15:00.0', '2025-04-01T21:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2519, '2025-04-02 00:00:00', '2025-04-01T21:30:00.0', '2025-04-01T21:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2520, '2025-04-02 00:00:00', '2025-04-01T21:45:00.0', '2025-04-01T22:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2521, '2025-04-02 00:00:00', '2025-04-01T22:00:00.0', '2025-04-01T22:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2522, '2025-04-02 00:00:00', '2025-04-01T22:15:00.0', '2025-04-01T22:30:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2523, '2025-04-02 00:00:00', '2025-04-01T22:30:00.0', '2025-04-01T22:45:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2524, '2025-04-02 00:00:00', '2025-04-01T22:45:00.0', '2025-04-01T23:00:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2525, '2025-04-02 00:00:00', '2025-04-01T23:00:00.0', '2025-04-01T23:15:00.0', 0, '0', 'sleeping', 'True');
INSERT INTO `steps` VALUES (2526, '2025-04-02 00:00:00', '2025-04-01T23:15:00.0', '2025-04-01T23:30:00.0', 0, '0', 'sedentary', 'False');
INSERT INTO `steps` VALUES (2527, '2025-04-02 00:00:00', '2025-04-01T23:30:00.0', '2025-04-01T23:45:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2528, '2025-04-02 00:00:00', '2025-04-01T23:45:00.0', '2025-04-02T00:00:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2529, '2025-04-02 00:00:00', '2025-04-02T00:00:00.0', '2025-04-02T00:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2530, '2025-04-02 00:00:00', '2025-04-02T00:15:00.0', '2025-04-02T00:30:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2531, '2025-04-02 00:00:00', '2025-04-02T00:30:00.0', '2025-04-02T00:45:00.0', 698, '0', 'active', 'False');
INSERT INTO `steps` VALUES (2532, '2025-04-02 00:00:00', '2025-04-02T00:45:00.0', '2025-04-02T01:00:00.0', 349, '0', 'highlyActive', 'False');
INSERT INTO `steps` VALUES (2533, '2025-04-02 00:00:00', '2025-04-02T01:00:00.0', '2025-04-02T01:15:00.0', 0, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2534, '2025-04-02 00:00:00', '2025-04-02T01:15:00.0', '2025-04-02T01:30:00.0', 59, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2535, '2025-04-02 00:00:00', '2025-04-02T01:30:00.0', '2025-04-02T01:45:00.0', 36, '0', 'sedentary', 'True');
INSERT INTO `steps` VALUES (2536, '2025-04-02 00:00:00', '2025-04-02T01:45:00.0', '2025-04-02T02:00:00.0', 0, '0', 'sedentary', 'False');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`calendarDate` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stress
-- ----------------------------
INSERT INTO `stress` VALUES (1, '12115795', '2025-03-07 00:00:00', '2025-03-06 16:00:00', '2025-03-07 16:00:00', '99', '41', 1, '-1');
INSERT INTO `stress` VALUES (2, '12115795', '2025-03-08 00:00:00', '2025-03-07 16:00:00', '2025-03-08 16:00:00', '99', '36', 1, '-1');
INSERT INTO `stress` VALUES (3, '12115795', '2025-03-09 00:00:00', '2025-03-08 16:00:00', '2025-03-09 16:00:00', '99', '34', 1, '-1');
INSERT INTO `stress` VALUES (4, '12115795', '2025-03-10 00:00:00', '2025-03-09 16:00:00', '2025-03-10 16:00:00', '99', '39', 1, '-1');
INSERT INTO `stress` VALUES (5, '12115795', '2025-03-11 00:00:00', '2025-03-10 16:00:00', '2025-03-11 16:00:00', '99', '37', 1, '-1');
INSERT INTO `stress` VALUES (6, '12115795', '2025-03-12 00:00:00', '2025-03-11 16:00:00', '2025-03-12 16:00:00', '97', '36', 1, '-1');
INSERT INTO `stress` VALUES (7, '12115795', '2025-03-13 00:00:00', '2025-03-12 16:00:00', '2025-03-13 16:00:00', '99', '42', 1, '-1');
INSERT INTO `stress` VALUES (8, '12115795', '2025-03-14 00:00:00', '2025-03-13 16:00:00', '2025-03-14 16:00:00', '98', '37', 1, '-1');
INSERT INTO `stress` VALUES (9, '12115795', '2025-03-15 00:00:00', '2025-03-14 16:00:00', '2025-03-15 16:00:00', '96', '37', 1, '-1');
INSERT INTO `stress` VALUES (10, '12115795', '2025-03-16 00:00:00', '2025-03-15 16:00:00', '2025-03-16 16:00:00', '99', '42', 1, '-1');
INSERT INTO `stress` VALUES (11, '12115795', '2025-03-17 00:00:00', '2025-03-16 16:00:00', '2025-03-17 16:00:00', '97', '32', 1, '-1');
INSERT INTO `stress` VALUES (12, '12115795', '2025-03-18 00:00:00', '2025-03-17 16:00:00', '2025-03-18 16:00:00', '100', '47', 1, '-1');
INSERT INTO `stress` VALUES (13, '12115795', '2025-03-19 00:00:00', '2025-03-18 16:00:00', '2025-03-19 16:00:00', '97', '38', 1, '-1');
INSERT INTO `stress` VALUES (14, '12115795', '2025-03-20 00:00:00', '2025-03-19 16:00:00', '2025-03-20 16:00:00', '99', '42', 1, '-1');
INSERT INTO `stress` VALUES (15, '12115795', '2025-03-21 00:00:00', '2025-03-20 16:00:00', '2025-03-21 16:00:00', '98', '39', 1, '-1');
INSERT INTO `stress` VALUES (16, '12115795', '2025-03-22 00:00:00', '2025-03-21 16:00:00', '2025-03-22 16:00:00', '98', '38', 1, '-1');
INSERT INTO `stress` VALUES (17, '12115795', '2025-03-23 00:00:00', '2025-03-22 16:00:00', '2025-03-23 16:00:00', '97', '35', 1, '-1');
INSERT INTO `stress` VALUES (18, '12115795', '2025-03-24 00:00:00', '2025-03-23 16:00:00', '2025-03-24 16:00:00', '99', '40', 1, '-1');
INSERT INTO `stress` VALUES (19, '12115795', '2025-03-25 00:00:00', '2025-03-24 16:00:00', '2025-03-25 16:00:00', '96', '43', 1, '-1');
INSERT INTO `stress` VALUES (20, '12115795', '2025-03-26 00:00:00', '2025-03-25 16:00:00', '2025-03-26 16:00:00', '99', '39', 1, '-1');
INSERT INTO `stress` VALUES (21, '12115795', '2025-03-27 00:00:00', '2025-03-26 16:00:00', '2025-03-27 16:00:00', '98', '40', 1, '-1');
INSERT INTO `stress` VALUES (22, '12115795', '2025-03-28 00:00:00', '2025-03-27 16:00:00', '2025-03-28 16:00:00', '98', '38', 1, '-1');
INSERT INTO `stress` VALUES (23, '12115795', '2025-03-29 00:00:00', '2025-03-28 16:00:00', '2025-03-29 16:00:00', '96', '38', 1, '-1');
INSERT INTO `stress` VALUES (24, '12115795', '2025-03-30 00:00:00', '2025-03-29 16:00:00', '2025-03-30 16:00:00', '96', '32', 1, '-1');
INSERT INTO `stress` VALUES (25, '12115795', '2025-03-31 00:00:00', '2025-03-30 16:00:00', '2025-03-31 16:00:00', '97', '44', 1, '-1');
INSERT INTO `stress` VALUES (26, '12115795', '2025-04-01 00:00:00', '2025-03-31 16:00:00', '2025-04-01 16:00:00', '98', '42', 1, '-1');
INSERT INTO `stress` VALUES (27, '12115795', '2025-04-02 00:00:00', '2025-04-01 16:00:00', '2025-04-02 01:46:00', '88', '18', 1, '-1');

SET FOREIGN_KEY_CHECKS = 1;
