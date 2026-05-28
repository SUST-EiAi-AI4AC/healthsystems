-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: healthsystem
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `healthsystem`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `healthsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `healthsystem`;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id，外键',
  `log_date` date NOT NULL COMMENT '填报日期，本来已有时间戳，但为了更直观，也为了便于与每日多次填报的数据进行连接。同时还可以在数据库层面完成限制：一个用户一天只有一条记录',
  `sports_info` varchar(255) NOT NULL DEFAULT '' COMMENT '运动信息，如慢跑、走路、游泳等，这里不应限制运动方式数量，可以存储多种，每一种方式以字符‘|’隔开',
  `sports_time` varchar(255) NOT NULL DEFAULT '' COMMENT '运动时间，单位分钟，与上面对应用‘|’隔开',
  `diet_info` varchar(64) NOT NULL DEFAULT '' COMMENT '如暴饮暴食、胃口更差/更好、进食更多/更少；这里可能也不是用一个词就能描述状态（某些状态也并不是互斥的，比如分为胃口和进食多少，胃口好可能不一定进食多?），即可以用‘|’分隔表示状态',
  `medicine` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否按时服药：未知（0）（有些人可能不用服药），未按时服药（1），按时服药（2）',
  `sleep_info` varchar(100) NOT NULL DEFAULT '' COMMENT '入睡困难、睡不安、睡得多',
  `sleep_time` double(10,1) NOT NULL DEFAULT '0.0' COMMENT '睡眠时间，单位分钟',
  `sleep_time_start` time DEFAULT NULL,
  `sleep_time_end` time DEFAULT NULL,
  `statement_url` varchar(255) DEFAULT '' COMMENT '个人阐述，自行补充情况，描述今天遇到的事情、心情、个人状况等等，必须录制语音；存储语音文件地址',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `step_info` varchar(100) DEFAULT NULL,
  `time_management` varchar(100) DEFAULT NULL,
  `social_expression` varchar(100) DEFAULT NULL,
  `study_or_work_time` varchar(100) DEFAULT NULL,
  `study_or_work_state` varchar(100) DEFAULT NULL,
  `free` varchar(100) DEFAULT NULL,
  `free_time` varchar(100) DEFAULT NULL,
  `free_symptom` varchar(100) DEFAULT NULL,
  `yesterday_night` varchar(100) DEFAULT NULL,
  `yesterday_end_feel` varchar(100) DEFAULT NULL,
  `meal_time` varchar(100) DEFAULT NULL,
  `meal_sleep_time` varchar(100) DEFAULT NULL,
  `communicate_time` varchar(100) DEFAULT NULL,
  `activity_info` varchar(100) DEFAULT NULL,
  `dinner_time` varchar(100) DEFAULT NULL,
  `phone_play_time` varchar(100) DEFAULT NULL,
  `weakup_status` varchar(100) DEFAULT NULL,
  `breakfirst_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_user_logdate` (`user_id`,`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='每日一次的填报记录（睡眠时间、运动时间、服药等信息）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (689,171,'2024-06-12','走路','少于30分钟','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',8.0,'01:00:00','09:00:00',NULL,'2024-06-12 20:02:04','2001-4000','没有制定计划，随心情行动','积极参与交流，享受互动时光','1-3小时','大多数时候能集中注意力，但不够高效','休息或放松，做一些简单的娱乐','30分钟-1小时','都没有','听音乐或看电影','感到充实和满足','中午12点到13点','没有午休','30分钟-1小时','没有参与特别的活动','下午18点到20点','30分钟-1小时','伸个懒腰，稍作休息后起床','没吃早饭'),(690,171,'2024-06-13','走路','30分钟-1小时','偶尔错过一餐，但总体还好',0,'我的睡眠情况与平时相比没有变化',7.5,'01:00:00','08:20:00',NULL,'2024-06-13 19:51:03','4001-6000','没有制定计划，随心情行动','较少参与交流活动，更喜欢独处','3-5小时','感觉很疲惫，不想工作或学习','休息或放松，做一些简单的娱乐','30分钟-1小时','都没有','玩电子游戏或上网冲浪','感到一般，但还可以','没吃午饭','没有午休','少于30分钟','没有参与特别的活动','下午18点前','1-1.5小时','伸个懒腰，稍作休息后起床','没吃早饭'),(691,171,'2024-06-15','走路','30分钟-1小时','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',7.0,'01:01:00','08:00:00',NULL,'2024-06-15 00:01:59','4001-6000','有一定的计划但改变了','较少参与交流活动，更喜欢独处','1-3小时','难以集中注意力，经常分心','休息或放松，做一些简单的娱乐','30分钟-1小时','都没有','玩电子游戏或上网冲浪','感到充实和满足','没吃午饭','没有午休','超过2小时','没有参与特别的活动','下午18点到20点','1-1.5小时','继续躺在床上，查看手机或社交媒体','早上9点后'),(693,170,'2024-06-16','跑步,瑜伽,骑车','1-1.5小时','经常忘记吃饭或吃得很少',0,'相比平时，我需要额外一段时间才能入睡',9.0,'23:51:00','08:50:00',NULL,'2024-06-16 21:54:56','6001-8000','不知道该如何安排时间','积极参与交流，享受互动时光','3-5小时','大多数时候能集中注意力，但不够高效','几乎不让自己有空闲时间，空闲时间只会让我感到更加沮丧','30分钟-1小时','极度心神不宁，焦虑不安','玩电子游戏或上网冲浪','感到些许沮丧或失望','中午12点到13点','少于30分钟','1.5-2小时','投入时间学习或练习了某个兴趣爱好','准备吃宵夜','30分钟-1小时','继续躺在床上，查看手机或社交媒体','早上7点到8点'),(694,171,'2024-06-20','没有运动(请您跳过下一题)','0','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',8.0,'00:16:00','08:14:00',NULL,'2024-06-20 20:16:10','4001-6000','制定了清晰的时间表并按时执行','积极参与交流，享受互动时光','3-5小时','大多数时候能集中注意力，但不够高效','休息或放松，做一些简单的娱乐','1.5-2小时','都没有','玩电子游戏或上网冲浪','感到充实和满足','中午12点到13点','没有午休','超过2小时','没有参与特别的活动','下午18点到20点','30分钟-1小时','立刻起床','没吃早饭'),(695,179,'2024-06-21','走路,骑车','少于30分钟','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',9.5,'23:30:00','08:55:00',NULL,'2024-06-21 13:16:33','4001-6000','没有制定计划，随心情行动','积极参与交流，享受互动时光','5-8小时','感觉很疲惫，不想工作或学习','休息或放松，做一些简单的娱乐','1-1.5小时','有些心神不宁','玩电子游戏或上网冲浪','感到些许沮丧或失望','中午12点前','1-2小时','超过2小时','没有参与特别的活动','下午18点到20点','1-1.5小时','伸个懒腰，稍作休息后起床','没吃早饭'),(696,174,'2024-06-21','没有运动(请您跳过下一题)','0','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',7.0,'23:59:00','06:49:00',NULL,'2024-06-21 13:51:29','4001-6000','没有制定计划，随心情行动','积极参与交流，享受互动时光','超过8小时','大多数时候能集中注意力，但不够高效','休息或放松，做一些简单的娱乐','超过2小时','都没有','听音乐或看电影','感到一般，但还可以','中午12点到13点','没有午休','超过2小时','没有参与特别的活动','准备吃宵夜','超过2小时','继续躺在床上，查看手机或社交媒体','没吃早饭'),(697,171,'2024-06-23','没有运动(请您跳过下一题)','0','按时吃饭，食欲正常',0,'我的睡眠情况与平时相比没有变化',10.0,'22:25:00','08:24:00',NULL,'2024-06-23 15:31:00','6001-8000','制定了清晰的时间表并按时执行','积极参与交流，享受互动时光','1-3小时','持续专注且高效','休息或放松，做一些简单的娱乐','超过2小时','都没有','与家人或朋友聊天','感到充实和满足','中午12点到13点','没有午休','超过2小时','没有参与特别的活动','下午18点到20点','超过2小时','继续躺在床上，多睡一会儿','没吃早饭');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_info`
--

DROP TABLE IF EXISTS `basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id，外键',
  `log_date` date NOT NULL,
  `sex` enum('男','女') NOT NULL DEFAULT '男',
  `phone` varchar(16) NOT NULL,
  `birth_date` date NOT NULL,
  `culture` varchar(10) NOT NULL DEFAULT '本科',
  `is_single_parent` enum('是','否') NOT NULL DEFAULT '否',
  `is_abandon` enum('是','否') NOT NULL DEFAULT '否',
  `residential` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `marital` enum('未婚','已婚','离异','再婚','丧偶') NOT NULL DEFAULT '未婚',
  `trauma` varchar(32) NOT NULL,
  `trauma_time` enum('童年期','青少年','成年后') DEFAULT NULL,
  `relative_suicide` enum('无','有') NOT NULL DEFAULT '无',
  `mental_illness` enum('无','有') NOT NULL DEFAULT '无',
  `family_mental_history` enum('无','有') NOT NULL DEFAULT '无',
  `close_rel` varchar(16) NOT NULL,
  `resident` varchar(32) NOT NULL,
  `neighbor_rel` varchar(32) NOT NULL,
  `colleague_rel` varchar(32) NOT NULL,
  `favour` varchar(255) NOT NULL,
  `comfort` varchar(255) NOT NULL,
  `share` varchar(16) NOT NULL,
  `seek_help` varchar(16) NOT NULL,
  `group_activity` varchar(16) NOT NULL,
  `dating_engaged` varchar(64) NOT NULL,
  `dating_lose` varchar(64) NOT NULL,
  `parents_conflict` varchar(64) NOT NULL,
  `family_finance_dif` varchar(64) NOT NULL,
  `debt` varchar(64) NOT NULL,
  `family_ser_inj` varchar(64) NOT NULL,
  `family_die` varchar(64) NOT NULL,
  `ser_inj` varchar(64) NOT NULL,
  `unemployed` varchar(64) NOT NULL,
  `work_pressure` varchar(64) NOT NULL,
  `poor_mark` varchar(64) NOT NULL,
  `roommates_dis` varchar(64) NOT NULL,
  `life_law_change` varchar(64) NOT NULL,
  `friend_ser_inj` varchar(64) NOT NULL,
  `friend_die` varchar(64) NOT NULL,
  `misunderstood` varchar(64) NOT NULL,
  `stolen` varchar(64) NOT NULL,
  `accidental_shock` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_info`
--

LOCK TABLES `basic_info` WRITE;
/*!40000 ALTER TABLE `basic_info` DISABLE KEYS */;
INSERT INTO `basic_info` VALUES (3,171,'2024-06-23','女','13785369485','2001-07-01','硕士研究生','否','否','集体宿舍','未婚','灾难','青少年','无','无','无','3-5个','和同学、同事或朋友住在一起','有些邻居很关心您','遇到困难可能稍微关心','朋友','朋友','只向关系即为密切的1-2人倾诉','很少请求别人帮助','偶尔参加','一年内,好事,无影响,一年以上','一年内,坏事,轻度,三月内','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','长期性,好事,无影响,一年以上','长期性,坏事,中度,一年以上','未发生,null,null,null','未发生,null,null,null','长期性,坏事,中度,一年以上','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null'),(4,174,'2024-06-21','女','13571121019','2001-08-01','硕士研究生','否','否','集体宿舍','未婚','灾难',NULL,'无','无','无','3-5个','和同学、同事或朋友住在一起','遇到困难可能稍微关心','遇到困难可能稍微关心','其他家人','朋友','只向关系即为密切的1-2人倾诉','很少请求别人帮助','从不参加','一年前,好事,轻度,三月内','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null'),(5,170,'2024-06-23','女','1112233','2024-06-01','硕士研究生','是','否','独居','丧偶','灾难','成年后','有','有','无','3-5个','住处经常变动，多数时间和陌生人住在一起','大多数邻居都很关心您','相互之间从不关心，只是点头之交','工作单位','其他家人','从不向任何人倾诉','有时请求别人帮助','偶尔参加','未发生,null,null,null','一年前,好事,无影响,半年内','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null','未发生,null,null,null');
/*!40000 ALTER TABLE `basic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ema_answer`
--

DROP TABLE IF EXISTS `ema_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL COMMENT '记录日期',
  `log_time` time NOT NULL COMMENT '记录时间',
  `mood` varchar(16) NOT NULL COMMENT 'happy, sad, angry, fear/worrying, neutral, annoying,stress',
  `moodlevel` varchar(32) DEFAULT NULL COMMENT '心境程度，a little bit, somewhat, very much, extremely',
  `stresslevel` varchar(32) DEFAULT NULL COMMENT '压力程度，A little stressed, Definitely stressed, Stressed out, Feeling good, Feeling great\n\n',
  `speech_url` varchar(255) NOT NULL COMMENT '上传地语音文件地链接地址',
  `pam` varchar(16) DEFAULT '' COMMENT 'pam：前端的图片对应的情绪标签，通过用户选择图片，得到情绪标签，值是afraid、tense、excited等字符串，具体见《PAM.pptx》',
  `valence` tinyint(255) DEFAULT NULL,
  `arousal` tinyint(255) DEFAULT NULL,
  `pam_score` tinyint(255) NOT NULL COMMENT 'pam Score 1-16',
  `img_datas` text,
  `img_selected` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `k_log_date` (`log_date`) USING BTREE,
  KEY `fk_user_id_4` (`user_id`) USING BTREE,
  CONSTRAINT `ema_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生态瞬间评估法（Ecological Momentary Assessment,简称 EMA ），包含情绪和压力信息以及pam信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ema_answer`
--

LOCK TABLES `ema_answer` WRITE;
/*!40000 ALTER TABLE `ema_answer` DISABLE KEYS */;
INSERT INTO `ema_answer` VALUES (634,171,'2024-06-12','20:03:12','高兴','中等程度','没有压力','','happy',1,1,13,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_2.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_1.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"}'),(635,171,'2024-06-13','14:00:41','中性','中等程度','没有压力','','satisfied',2,-1,12,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_1.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"}'),(636,171,'2024-06-13','19:48:15','中性','中等程度','有一点压力','','satisfied',2,-1,12,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_2.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]','{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"}'),(637,171,'2024-06-14','12:06:35','中性','中等程度','有一点压力','','calm',1,-1,10,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]','{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"}'),(638,171,'2024-06-14','23:56:59','中性','比较多','没有压力','','serene',2,-2,11,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]','{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}'),(639,171,'2024-06-15','00:00:48','中性','中等程度','没有压力','','calm',1,-1,10,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"}'),(640,170,'2024-06-16','21:51:44','生气','有一点','没有压力','','frustrated',-2,1,5,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]','{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"}'),(641,171,'2024-06-20','20:16:42','中性','比较多','有一点压力','','calm',1,-1,10,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_2.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_2.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_1.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"}'),(642,2,'2024-06-21','10:58:48','中性','比较多','有一定程度的压力','','sleepy',1,-2,9,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_1.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_2.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_2.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]','{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"}'),(643,171,'2024-06-21','11:48:12','忧虑','有一点','有一点压力','','satisfied',2,-1,12,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_3.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_2.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_2.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_1.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"}'),(644,179,'2024-06-21','13:17:12','高兴','有一点','有一定程度的压力','','excited',1,2,14,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_3.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"}'),(645,174,'2024-06-21','13:51:57','中性','中等程度','有一点压力','','happy',1,1,13,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_1.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_3.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_2.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_2.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]','{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_2.jpg\",\"alt\":\"happy\"}'),(646,174,'2024-06-21','20:05:27','高兴','中等程度','有一点压力','','glad',2,1,15,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_1.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_2.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_2.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_1.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_1.jpg\",\"alt\":\"serene\"}]','{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"}'),(647,171,'2024-06-23','10:23:23','高兴','有一点','没有压力','','happy',1,1,13,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_2.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_3.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_2.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_2.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_1.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_3.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_3.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_1.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_2.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_1.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_2.jpg\",\"alt\":\"serene\"}]','{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_3.jpg\",\"alt\":\"happy\"}'),(648,171,'2024-06-23','15:33:55','中性','极其多','没有压力','','sleepy',1,-2,9,'[{\"id\":\"1\",\"src\":\"static/images/pam_images/1_afraid/1_1.jpg\",\"alt\":\"afraid\"},{\"id\":\"2\",\"src\":\"static/images/pam_images/2_tense/2_1.jpg\",\"alt\":\"tense\"},{\"id\":\"3\",\"src\":\"static/images/pam_images/3_excited/3_3.jpg\",\"alt\":\"excited\"},{\"id\":\"4\",\"src\":\"static/images/pam_images/4_delighted/4_3.jpg\",\"alt\":\"delighted\"},{\"id\":\"5\",\"src\":\"static/images/pam_images/5_frustrated/5_3.jpg\",\"alt\":\"frustrated\"},{\"id\":\"6\",\"src\":\"static/images/pam_images/6_angry/6_1.jpg\",\"alt\":\"angry\"},{\"id\":\"7\",\"src\":\"static/images/pam_images/7_happy/7_1.jpg\",\"alt\":\"happy\"},{\"id\":\"8\",\"src\":\"static/images/pam_images/8_glad/8_3.jpg\",\"alt\":\"glad\"},{\"id\":\"9\",\"src\":\"static/images/pam_images/9_miserable/9_1.jpg\",\"alt\":\"miserable\"},{\"id\":\"10\",\"src\":\"static/images/pam_images/10_sad/10_1.jpg\",\"alt\":\"sad\"},{\"id\":\"11\",\"src\":\"static/images/pam_images/11_calm/11_3.jpg\",\"alt\":\"calm\"},{\"id\":\"12\",\"src\":\"static/images/pam_images/12_satisfied/12_3.jpg\",\"alt\":\"satisfied\"},{\"id\":\"13\",\"src\":\"static/images/pam_images/13_gloomy/13_2.jpg\",\"alt\":\"gloomy\"},{\"id\":\"14\",\"src\":\"static/images/pam_images/14_tired/14_3.jpg\",\"alt\":\"tired\"},{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"},{\"id\":\"16\",\"src\":\"static/images/pam_images/16_serene/16_3.jpg\",\"alt\":\"serene\"}]','{\"id\":\"15\",\"src\":\"static/images/pam_images/15_sleepy/15_3.jpg\",\"alt\":\"sleepy\"}');
/*!40000 ALTER TABLE `ema_answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_log_date_3` BEFORE INSERT ON `ema_answer` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invition_code`
--

DROP TABLE IF EXISTS `invition_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invition_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '医生或者管理员的id',
  `invition_code` varchar(32) DEFAULT NULL COMMENT '邀请码',
  `inviter` bigint(20) DEFAULT NULL COMMENT '邀请者的id',
  `assistant_code` varchar(32) DEFAULT NULL COMMENT '助理邀请码，用于邀请助理注册',
  `group_id` bigint(20) NOT NULL COMMENT '助理归属于的医生的id，可以一个小组的id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_invition_code` (`invition_code`) USING BTREE,
  KEY `fk_userId_13` (`user_id`) USING BTREE,
  KEY `fk_userId_13_2` (`inviter`) USING BTREE,
  CONSTRAINT `fk_userId_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userId_13_2` FOREIGN KEY (`inviter`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用于管理后台管理端的用户，通过邀请码注册';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invition_code`
--

LOCK TABLES `invition_code` WRITE;
/*!40000 ALTER TABLE `invition_code` DISABLE KEYS */;
INSERT INTO `invition_code` VALUES (2,2,NULL,NULL,NULL,1),(3,3,NULL,NULL,NULL,1),(4,4,NULL,NULL,NULL,1),(5,171,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `invition_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_type` varchar(32) NOT NULL,
  `log_date` date NOT NULL,
  `log_time` time NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `infer` varchar(255) DEFAULT NULL,
  `infer_cost` decimal(10,2) DEFAULT NULL,
  `question_end_time` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_audo_userid` (`user_id`) USING BTREE,
  CONSTRAINT `fk_depressionvideo_userid` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (18,170,'depression-video','2024-06-13','16:48:32','/depression-video/170_depression-video_20240613_7a15edd3-5468-47e4-b77d-372cb84b457b.mp4',NULL,NULL,NULL),(19,170,'depression-video','2024-06-13','18:01:09','/depression-video/170_depression-video_20240613_c238a8dc-7990-4163-9974-c54365e7c0bc.mp4',NULL,NULL,NULL),(20,170,'depression-video','2024-06-14','13:29:56','/depression-video/170_depression-video_20240614_5fba9cb7-c180-42cc-ae9b-31aeb9314ba0.mp4',NULL,NULL,NULL),(21,170,'depression-video','2024-06-14','13:42:37','/depression-video/170_depression-video_20240614_97467cfb-d72f-43c5-848e-d16d9518485b.mp4',NULL,NULL,NULL),(22,170,'depression-video','2024-06-14','13:48:28','/depression-video/170_depression-video_20240614_95f6639b-5cf4-429c-8dc9-57d374665ccc.mp4',NULL,NULL,NULL),(23,171,'depression-video','2024-06-15','00:11:06','/depression-video/171_depression-video_20240615_681402f9-5808-42f6-96a2-37027b7f3c9d.mp4',NULL,NULL,NULL),(24,171,'depression-video','2024-06-15','20:40:59','/depression-video/171_depression-video_20240615_04a5db60-9bef-4af7-ac16-623d1fc52caa.mp4',NULL,NULL,NULL),(25,171,'depression-video','2024-06-15','20:48:33','/depression-video/171_depression-video_20240615_b280db33-8da6-425b-8789-c20454a520aa.mp4',NULL,NULL,NULL),(26,170,'depression-video','2024-06-16','11:40:39','/depression-video/170_depression-video_20240616_03d7d395-c6b3-408e-9424-7e9bcc9d4f8f.mp4',NULL,NULL,NULL),(27,170,'depression-video','2024-06-16','11:59:04','/depression-video/170_depression-video_20240616_15e5a4c2-d045-402d-a3a6-d2479bbe5c58.mp4',NULL,NULL,'526,908,411,72,424,761,604,57,623,52,672'),(28,170,'depression-video','2024-06-16','12:02:53','/depression-video/170_depression-video_20240616_e5e631cc-9680-4832-aac0-3be286083256.mp4',NULL,NULL,'13878,19324,36633,44742,46324,50279,52262,53907,59386,64892,65871'),(29,170,'depression-video','2024-06-16','21:40:29','/depression-video/170_depression-video_20240616_e0e96e81-0bb4-4245-a21d-6231a9b85ff2.mp4',NULL,NULL,'3769,5588,12318,14108,15959,17504,18701,19766,21317,22843,23950,31569'),(30,170,'depression-video','2024-06-16','21:53:07','/depression-video/170_depression-video_20240616_753e31f7-0358-4974-9a3a-681d3b06002c.mp4',NULL,NULL,'5900,8484,11609,12700,25796,28450,31690,33390,36205,38957,40117,43623'),(31,171,'depression-video','2024-06-20','20:04:12','/depression-video/171_depression-video_20240620_7dffd086-b080-4fe3-805e-8719672f9c20.mp4',NULL,NULL,'7265,9009,9831,10886,11277,11678,12137,12723,13478,14210,14588,31311'),(32,170,'depression-video','2024-06-23','21:40:07','/depression-video/170_depression-video_20240623_6c090c43-7c72-471c-827f-455adb9f2ad5.mp4',NULL,NULL,'35885'),(33,170,'depression-video','2024-06-23','21:40:48','/depression-video/170_depression-video_20240623_4d2eeaec-c30f-4791-b18c-216c2beedeef.mp4',NULL,NULL,'26688,27164,27534,27731,27930,28072,32127');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_audio_datetime` BEFORE INSERT ON `media` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nwpu_user_info`
--

DROP TABLE IF EXISTS `nwpu_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nwpu_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nwpu_id` varchar(16) NOT NULL DEFAULT '' COMMENT '用户学号/工号',
  `college` varchar(32) NOT NULL DEFAULT '' COMMENT '所属学院/单位名字',
  `grade` smallint(6) NOT NULL DEFAULT '0' COMMENT '用户所在年级，入学/校年份',
  `type` enum('未知','本科生','硕士生','博士生','教职工') NOT NULL DEFAULT '未知' COMMENT '用户类型，未知（0），本科生（1），硕士（2），博士（3），教职工（4）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_nwpu_id` (`nwpu_id`) USING BTREE COMMENT '学号/工号唯一',
  UNIQUE KEY `u_user_id_3` (`user_id`) USING BTREE,
  KEY `fk_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='西北工业大学用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nwpu_user_info`
--

LOCK TABLES `nwpu_user_info` WRITE;
/*!40000 ALTER TABLE `nwpu_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `nwpu_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perceived_stress_scale`
--

DROP TABLE IF EXISTS `perceived_stress_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perceived_stress_scale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `pss_q1` tinyint(255) NOT NULL DEFAULT '0' COMMENT '一些无法预期的事情发生而感到心烦意乱',
  `pss_q2` tinyint(255) NOT NULL DEFAULT '0' COMMENT '感觉无法控制自己生活中重要的事情',
  `pss_q3` tinyint(255) NOT NULL DEFAULT '0' COMMENT '感到紧张不安和压力',
  `pss_q4` tinyint(255) NOT NULL DEFAULT '0' COMMENT '成功地处理恼人的生活麻烦',
  `pss_q5` tinyint(255) NOT NULL DEFAULT '0' COMMENT '感到自己是有效地处理生活中所发生的重要改变',
  `pss_q6` tinyint(255) NOT NULL DEFAULT '0' COMMENT '对于有能力处理自己私人的问题感到很有信心 ',
  `pss_q7` tinyint(255) NOT NULL DEFAULT '0' COMMENT '感到事情顺心如意',
  `pss_q8` tinyint(255) NOT NULL DEFAULT '0' COMMENT '发现自己无法处理所有自己必须做的事情',
  `pss_q9` tinyint(255) NOT NULL DEFAULT '0' COMMENT '有办法控制生活中恼人的事情',
  `pss_q10` tinyint(255) NOT NULL DEFAULT '0' COMMENT '常觉得自己是驾驭事情的主人',
  `pss_q11` tinyint(255) NOT NULL DEFAULT '0' COMMENT '常生气，因为很多事情的发生是超出自己所能控制的',
  `pss_q12` tinyint(255) NOT NULL DEFAULT '0' COMMENT '.经常想到有些事情是自己必须完成的',
  `pss_q13` tinyint(255) NOT NULL DEFAULT '0' COMMENT '常能掌握时间安排方式',
  `pss_q14` tinyint(255) NOT NULL DEFAULT '0' COMMENT '常感到困难的事情堆积如山，而自己无法克服它们',
  `score` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_user_logdate_8` (`user_id`,`log_date`) USING BTREE,
  KEY `k_log_date_8` (`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_8` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='这份量表是在询问在最近一个月来，您个人的感受和想法，请您于每一个题项上作答时，去指出您感受或想到某一特定想法的频率。虽然有些问题看是相似，实则是有所差异，所以每一题均需作答。\r\n而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的压力知觉状况。而每一题项皆有下列五种选择。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perceived_stress_scale`
--

LOCK TABLES `perceived_stress_scale` WRITE;
/*!40000 ALTER TABLE `perceived_stress_scale` DISABLE KEYS */;
INSERT INTO `perceived_stress_scale` VALUES (31,171,'2024-06-12',4,4,4,4,4,4,4,4,4,4,4,4,4,4,28),(33,170,'2024-06-16',2,2,0,4,2,4,1,2,2,2,2,1,1,1,22),(34,174,'2024-06-21',2,1,1,2,2,3,2,1,4,3,2,3,3,0,19);
/*!40000 ALTER TABLE `perceived_stress_scale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_log_date_8` BEFORE INSERT ON `perceived_stress_scale` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `phq9`
--

DROP TABLE IF EXISTS `phq9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phq9` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `phq9_q1` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q2` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q3` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q4` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q5` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q6` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q7` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q8` tinyint(255) NOT NULL DEFAULT '0',
  `phq9_q9` tinyint(255) NOT NULL DEFAULT '0',
  `score` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_logdate_7` (`user_id`,`log_date`) USING BTREE,
  KEY `k_log_date_7` (`log_date`) USING BTREE,
  CONSTRAINT `fk_user_id_7` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phq9`
--

LOCK TABLES `phq9` WRITE;
/*!40000 ALTER TABLE `phq9` DISABLE KEYS */;
/*!40000 ALTER TABLE `phq9` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_log_date_7` BEFORE INSERT ON `phq9` FOR EACH ROW BEGIN
	set new.log_date=CURRENT_DATE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role` varchar(16) NOT NULL COMMENT '用户角色，‘user’，‘doctor’，‘admin’',
  `permission` varchar(16) NOT NULL COMMENT '用户权限（暂时用不到），‘normal’，‘vip’',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='这一部分设计是为了后端结合shiro框架，更好地进行权限控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,'user','normal'),(2,'doctor','vip'),(3,'admin','vip');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sas`
--

DROP TABLE IF EXISTS `sas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `sas_q1` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q2` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q3` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q4` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q5` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q6` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q7` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q8` tinyint(255) NOT NULL DEFAULT '0',
  `sas_q9` tinyint(255) NOT NULL,
  `sas_q10` tinyint(255) NOT NULL,
  `sas_q11` tinyint(255) NOT NULL,
  `sas_q12` tinyint(255) NOT NULL,
  `sas_q13` tinyint(255) NOT NULL,
  `sas_q14` tinyint(255) NOT NULL,
  `sas_q15` tinyint(255) NOT NULL,
  `sas_q16` tinyint(255) NOT NULL,
  `sas_q17` tinyint(255) NOT NULL,
  `sas_q18` tinyint(255) NOT NULL,
  `sas_q19` tinyint(255) NOT NULL,
  `sas_q20` tinyint(255) NOT NULL,
  `score` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_logdate_7` (`user_id`,`log_date`) USING BTREE,
  KEY `k_log_date_7` (`log_date`) USING BTREE,
  CONSTRAINT `sas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='PHQ-9是国际通用抑郁检测量表之一，共有九个题目。\r\n\r\n在过去的两周里，请根据你生活中出现以下症状的频率回答下面的题目。虽然有些问题看起来相似，但其实对结果都有不同的影响，所以每一题均需作答。而作答方式尽量以快速、不假思索方式填答，亦即不要去思虑计算每一题分数背后之意涵，以期确实反应您真实的状况。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sas`
--

LOCK TABLES `sas` WRITE;
/*!40000 ALTER TABLE `sas` DISABLE KEYS */;
INSERT INTO `sas` VALUES (95,171,'2024-06-12',4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,81),(97,170,'2024-06-16',4,3,3,3,2,3,3,2,3,2,4,1,3,2,3,3,3,2,4,2,62),(98,174,'2024-06-21',2,3,2,1,1,1,1,2,4,2,1,2,3,1,1,3,2,2,1,2,50);
/*!40000 ALTER TABLE `sas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_log_date_7_copy1` BEFORE INSERT ON `sas` FOR EACH ROW BEGIN
	set new.log_date=CURRENT_DATE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sds`
--

DROP TABLE IF EXISTS `sds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `log_date` date NOT NULL,
  `q1` tinyint(255) NOT NULL DEFAULT '0',
  `q2` tinyint(255) NOT NULL DEFAULT '0',
  `q3` tinyint(255) NOT NULL DEFAULT '0',
  `q4` tinyint(255) NOT NULL DEFAULT '0',
  `q5` tinyint(255) NOT NULL DEFAULT '0',
  `q6` tinyint(255) NOT NULL DEFAULT '0',
  `q7` tinyint(255) NOT NULL DEFAULT '0',
  `q8` tinyint(255) NOT NULL DEFAULT '0',
  `q9` tinyint(255) NOT NULL DEFAULT '0',
  `q10` tinyint(255) NOT NULL DEFAULT '0',
  `q11` tinyint(255) NOT NULL DEFAULT '0',
  `q12` tinyint(255) NOT NULL DEFAULT '0',
  `q13` tinyint(255) NOT NULL DEFAULT '0',
  `q14` tinyint(255) NOT NULL DEFAULT '0',
  `q15` tinyint(255) NOT NULL DEFAULT '0',
  `q16` tinyint(255) NOT NULL DEFAULT '0',
  `q17` tinyint(255) NOT NULL DEFAULT '0',
  `q18` tinyint(255) NOT NULL DEFAULT '0',
  `q19` tinyint(255) NOT NULL DEFAULT '0',
  `q20` tinyint(255) NOT NULL DEFAULT '0',
  `score` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_logdate_17` (`user_id`,`log_date`) USING BTREE,
  KEY `k_log_date_17` (`log_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sds`
--

LOCK TABLES `sds` WRITE;
/*!40000 ALTER TABLE `sds` DISABLE KEYS */;
INSERT INTO `sds` VALUES (1,2,'2024-05-27',2,2,2,3,3,1,2,2,2,3,1,3,2,2,2,3,3,3,2,1,55),(2,171,'2024-06-12',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,62),(3,170,'2024-06-16',3,3,3,4,3,3,3,3,4,4,4,2,3,2,3,1,1,1,4,2,77),(4,174,'2024-06-21',1,4,1,3,4,4,1,1,2,2,3,2,1,3,1,2,3,2,1,3,42);
/*!40000 ALTER TABLE `sds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speak_anytime`
--

DROP TABLE IF EXISTS `speak_anytime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speak_anytime` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `log_date` date DEFAULT NULL COMMENT '记录日期',
  `log_time` time DEFAULT NULL COMMENT '记录时间',
  `speech_url` varchar(255) NOT NULL DEFAULT '' COMMENT '上传地语音文件地链接地址',
  `inference` varchar(10) DEFAULT NULL,
  `infer_cost` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_id_5` (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id_5` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='随时说文件地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speak_anytime`
--

LOCK TABLES `speak_anytime` WRITE;
/*!40000 ALTER TABLE `speak_anytime` DISABLE KEYS */;
/*!40000 ALTER TABLE `speak_anytime` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_date_time_2` BEFORE INSERT ON `speak_anytime` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_health_info`
--

DROP TABLE IF EXISTS `user_health_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_health_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id，外键',
  `sex` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `birth_date` date DEFAULT NULL COMMENT '出生时间',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '身高，单位：厘米（整数）',
  `weight` double(10,1) NOT NULL DEFAULT '0.0' COMMENT '体重，单位：千克，保留小数点后一位',
  `doctor_id` bigint(20) NOT NULL COMMENT '属于哪位医生',
  `depressed` varchar(16) NOT NULL DEFAULT '' COMMENT '（真实标签）抑郁程度标注、诊断结果（格式应为指定的几种级别，如高危、重度、中度和轻度）',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '（真实标签）备注信息（医生对病人的备注信息，格式无要求）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_user_id_2` (`user_id`) USING BTREE,
  KEY `fk_user_id_2` (`user_id`) USING BTREE,
  KEY `fk_doctor_id` (`doctor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户健康信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_health_info`
--

LOCK TABLES `user_health_info` WRITE;
/*!40000 ALTER TABLE `user_health_info` DISABLE KEYS */;
INSERT INTO `user_health_info` VALUES (2,3,'男','2020-10-19',170,60.0,1,'待标注','待说明','2020-10-26 16:44:21','2024-06-10 20:25:52'),(3,4,'女','2020-10-19',170,60.0,1,'待标注','待说明','2020-10-26 16:44:49','2024-06-10 20:25:52'),(13,2,'男','2020-10-01',175,49.0,1,'待标注1','待说明','2020-11-02 16:55:24','2024-06-10 20:30:12'),(14,170,'女','2024-06-10',0,0.0,1,'','','2024-06-10 20:24:16','2024-06-10 20:25:52'),(15,171,'女','2001-11-13',0,0.0,1,'','','2024-06-12 18:47:31',NULL),(16,172,'女','2024-05-07',0,0.0,1,'','','2024-06-12 20:33:49',NULL),(17,173,'女',NULL,0,0.0,1,'','','2024-06-17 16:03:41',NULL),(18,174,'女',NULL,0,0.0,1,'','','2024-06-21 12:52:41',NULL),(19,179,'男',NULL,0,0.0,1,'','','2024-06-21 12:57:13',NULL);
/*!40000 ALTER TABLE `user_health_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号码、唯一',
  `user_name` varchar(64) NOT NULL COMMENT '用户名、唯一',
  `password` varchar(64) NOT NULL COMMENT '数据库不存储原始密码，存MD5散列值，校验的时候判断的是密码散列值是否相同',
  `role` varchar(16) NOT NULL DEFAULT 'user' COMMENT '用户角色：用户（0）、医生（1）、管理员（2）',
  `permission` varchar(16) NOT NULL DEFAULT 'normal' COMMENT '用户权限',
  `real_name` varchar(64) DEFAULT '' COMMENT '用户真实姓名',
  `identity_number` varchar(32) DEFAULT NULL COMMENT '用户身份证号，唯一',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `country` varchar(32) NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `nwpu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用于标注是否npwu用户，默认0（false），1（true）',
  `add_timestamp_mils` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间戳',
  `mod_timestamp_mils` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `nwpu_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `push_connected` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `u_user_name` (`user_name`) USING BTREE COMMENT '用户名唯一',
  UNIQUE KEY `u_phone` (`phone`) USING BTREE COMMENT '手机号码唯一',
  UNIQUE KEY `u_identity_number` (`identity_number`) USING BTREE COMMENT '身份证号唯一'
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (2,'18392183603','chf','1852bdfde036dd98511a05eb8608b81e','doctor','vip','chf',NULL,'北京市','北京市','12','',0,'2020-10-26 15:50:54','2024-06-23 17:44:28',NULL,NULL,'2024-06-23 17:44:28'),(3,'12222222222','xm','1852bdfde036dd98511a05eb8608b81e','doctor','vip','xm',NULL,'北京市','北京市','12','',0,'2020-10-26 15:50:54','2024-06-10 20:33:53',NULL,NULL,NULL),(4,'14444444444','zyy','1852bdfde036dd98511a05eb8608b81e','doctor','vip','zyy',NULL,'北京市','北京市','12','',0,'2020-10-26 15:50:54','2024-06-12 18:28:53',NULL,NULL,'2024-06-12 18:28:53'),(170,'13333333333','test','1852bdfde036dd98511a05eb8608b81e','user','normal','测试',NULL,'深圳市','广东省','中国','',0,'2024-06-10 20:24:16','2024-06-23 22:02:44',NULL,NULL,'2024-06-23 22:02:44'),(171,'13939948323','cyk','e10adc3949ba59abbe56e057f20f883e','doctor','vip','cyk',NULL,'西安市','陕西省','中国','',0,'2024-06-12 18:47:31','2024-06-23 15:33:55',NULL,NULL,'2024-06-23 15:33:55'),(174,'15236254632','lx','e10adc3949ba59abbe56e057f20f883e','user','normal','lx',NULL,'西安市','陕西省','中国','',1,'2024-06-21 12:52:41','2024-06-21 20:05:28',NULL,NULL,'2024-06-21 20:05:28'),(179,'18735482563','whm','e10adc3949ba59abbe56e057f20f883e','user','normal','whm',NULL,'西安市','陕西省','中国','',1,'2024-06-21 12:57:13','2024-06-21 13:17:13',NULL,NULL,'2024-06-21 13:17:13');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `log_date` date DEFAULT NULL,
  `log_time` time DEFAULT NULL,
  `video_url` varchar(255) NOT NULL DEFAULT '',
  `inference` varchar(16) DEFAULT NULL,
  `infer_cost` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_userid_video` (`user_id`) USING BTREE,
  CONSTRAINT `fk_userid_video` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_date_time_11` BEFORE INSERT ON `video` FOR EACH ROW BEGIN
	SET new.log_date=CURRENT_DATE;
	SET new.log_time=CURRENT_TIME;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 22:06:02
