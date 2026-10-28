/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: fswy_dev_1
-- ------------------------------------------------------
-- Server version	10.6.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `fswy_dev_1`
--

/*!40000 DROP DATABASE IF EXISTS `fswy_dev_1`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fswy_dev_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `fswy_dev_1`;

--
-- Table structure for table `auth_sfz_cfg`
--

DROP TABLE IF EXISTS `auth_sfz_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sfz_cfg` (
  `platform` varchar(30) NOT NULL COMMENT 'ID编号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道编号',
  `can_charge` tinyint(4) NOT NULL COMMENT '未认证是否能充值(0:否 1:是)',
  `is_nonage` tinyint(4) NOT NULL COMMENT '未成年是否限制充值(0:否 1:是)',
  `charge_limit` int(11) NOT NULL COMMENT '未成年充值额度',
  `is_wallow` tinyint(4) NOT NULL COMMENT '是否开启防沉迷(0:否 1:是)',
  `down_sec` int(11) NOT NULL COMMENT '沉迷时间(秒)',
  `is_show_phone` tinyint(4) NOT NULL COMMENT '是否显示未到账联系方式(0:否 1:是)',
  `is_mail` tinyint(4) NOT NULL COMMENT '充值发送邮件(0:否 1:是)',
  `show_info` varchar(50) NOT NULL COMMENT '联系信息(0:否 1:是)',
  `is_mid_exp` tinyint(4) NOT NULL COMMENT '是否收益减半(0:否 1:是)',
  `is_lev_60` tinyint(4) NOT NULL COMMENT '只针对60级以下(0:否 1:是)',
  `is_need_check` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否开启标签页',
  PRIMARY KEY (`platform`,`channel_reg`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='防沉迷设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sfz_cfg`
--

LOCK TABLES `auth_sfz_cfg` WRITE;
/*!40000 ALTER TABLE `auth_sfz_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sfz_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web`
--

DROP TABLE IF EXISTS `camp_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_id` int(11) NOT NULL COMMENT '活动ID',
  `camp_id` int(11) NOT NULL COMMENT '活动条件ID',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `sec_type` int(11) NOT NULL COMMENT '具体类型',
  `settlement` int(4) NOT NULL COMMENT '结算类型',
  `reward_mod` int(4) NOT NULL COMMENT '奖励模式',
  `reward_num` int(11) NOT NULL COMMENT '最大奖励次数',
  `star` int(11) NOT NULL DEFAULT 2 COMMENT '星级',
  `mail_title` varchar(64) NOT NULL DEFAULT '' COMMENT '信件标题',
  `mail_content` text NOT NULL COMMENT '信件内容',
  `sort_val` int(11) NOT NULL DEFAULT 5 COMMENT '显示排序字段',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(128) NOT NULL DEFAULT '' COMMENT '标题2',
  `title_ico` varchar(64) NOT NULL COMMENT '标题图片',
  `ico` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `type_ico` varchar(32) NOT NULL DEFAULT '' COMMENT '类型图标',
  `total_ico` int(11) NOT NULL DEFAULT 0 COMMENT '独立总图标',
  `top_banner` varchar(64) NOT NULL DEFAULT '' COMMENT '顶部横幅',
  `rule_str` varchar(1024) NOT NULL DEFAULT '' COMMENT '规则描述',
  `time_str` varchar(128) NOT NULL DEFAULT '' COMMENT '时间描述',
  `bottom_alert` varchar(1024) NOT NULL DEFAULT '' COMMENT '底部描述',
  `reward_title` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励表头',
  `panel_type` varchar(128) NOT NULL DEFAULT '' COMMENT '面板类型',
  `reward` varchar(2048) NOT NULL DEFAULT '' COMMENT '子活动奖励',
  `cli_reward` varchar(1024) NOT NULL DEFAULT '' COMMENT '客户端奖励',
  `notice_msg` varchar(512) NOT NULL DEFAULT '' COMMENT '传闻公告',
  `button_text` varchar(48) NOT NULL DEFAULT '' COMMENT '按钮内容',
  `is_button` int(4) NOT NULL DEFAULT 1 COMMENT '是否按钮',
  `web_id` int(11) NOT NULL COMMENT '活动类型编号web端用',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `tran_info` varchar(512) NOT NULL DEFAULT '' COMMENT '跳转内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `camp_id` (`camp_id`),
  KEY `total_id` (`total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台子活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web`
--

LOCK TABLES `camp_web` WRITE;
/*!40000 ALTER TABLE `camp_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web_ico`
--

DROP TABLE IF EXISTS `camp_web_ico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web_ico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `total_id` int(11) NOT NULL COMMENT '总活动ID_唯一值',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '总活动名称',
  `title` varchar(128) DEFAULT '' COMMENT '总活动标题',
  `ico` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动图标',
  `alert` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动提示',
  `gif` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动动画',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `status` int(11) NOT NULL COMMENT '活动状态[1:等待审核 2:审核已发送 3:拒绝]',
  `open_day` int(11) NOT NULL DEFAULT 0 COMMENT '开服多少天后起作用',
  `merge_day` int(11) NOT NULL DEFAULT 0 COMMENT '合服多少天后起作用',
  `login_open` int(4) NOT NULL DEFAULT 0 COMMENT '是否登录打开界面',
  `is_show_time` int(4) NOT NULL DEFAULT 0 COMMENT '是否显示倒计时',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `total_id` (`total_id`),
  KEY `name` (`name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台总活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web_ico`
--

LOCK TABLES `camp_web_ico` WRITE;
/*!40000 ALTER TABLE `camp_web_ico` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web_ico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(120) NOT NULL COMMENT '订单号',
  `type` tinyint(3) unsigned NOT NULL COMMENT '充值类型(0:银行卡, 1:手机充值)',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未收取，1:已收取)',
  `gold` int(11) NOT NULL COMMENT '钻石数',
  `charge_type` int(11) NOT NULL DEFAULT 0 COMMENT '充值类型(0 普通充值 1 礼品充值)',
  `money` decimal(10,2) NOT NULL COMMENT '金额数',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` char(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(60) NOT NULL COMMENT '角色名称',
  `classes` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `lev` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `is_test` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否是测试充值',
  `ts` int(11) unsigned NOT NULL COMMENT '订单插入时间',
  `time_deal` int(11) NOT NULL DEFAULT 0 COMMENT '处理时间',
  `rmb` int(11) NOT NULL DEFAULT 0 COMMENT '充值余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `rid` (`rid`,`name`),
  KEY `account` (`account`),
  KEY `acc_search_idx` (`account`,`platform`,`zone_id`,`status`),
  KEY `rid_search_idx` (`rid`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('unreply','replied') NOT NULL DEFAULT 'unreply' COMMENT '回复状态',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `charge` int(11) NOT NULL COMMENT '累计充值钻石数',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(40) NOT NULL COMMENT '联系方式',
  `post_time` int(10) unsigned NOT NULL COMMENT '留言日期（unix_time）',
  `feedback_ip` char(16) DEFAULT NULL COMMENT '反馈ip',
  `gm_name` varchar(20) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `reply_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`,`rid`),
  KEY `date` (`post_time`,`reply_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_circle_report`
--

DROP TABLE IF EXISTS `friend_circle_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_circle_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned NOT NULL DEFAULT 0 COMMENT '0:动态 1:评论 2:图片',
  `spec_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`report_type`,`spec_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='朋友圈举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_circle_report`
--

LOCK TABLES `friend_circle_report` WRITE;
/*!40000 ALTER TABLE `friend_circle_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_circle_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_moment_wish`
--

DROP TABLE IF EXISTS `friend_moment_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_moment_wish` (
  `id` int(11) unsigned NOT NULL COMMENT '寄语动态id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '动态区号',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '角色平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '角色等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `camp_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
  `theme` varchar(20) NOT NULL COMMENT '活动主题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_photo` tinyint(4) NOT NULL DEFAULT 0 COMMENT '活动主题',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:审核通过 2:不通过',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='庆典寄语表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_moment_wish`
--

LOCK TABLES `friend_moment_wish` WRITE;
/*!40000 ALTER TABLE `friend_moment_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_moment_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodvoice_report`
--

DROP TABLE IF EXISTS `goodvoice_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodvoice_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除录音 2:无效, 3除名',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `filename_1` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_2` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_3` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名3',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='好声音举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodvoice_report`
--

LOCK TABLES `goodvoice_report` WRITE;
/*!40000 ALTER TABLE `goodvoice_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodvoice_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_role`
--

DROP TABLE IF EXISTS `lock_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_role` (
  `id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `lock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间型封号, 2永久封号',
  `lock_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号时间',
  `lock_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '封号过期时间',
  `lock_info` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `silent_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间禁言, 2永久禁言',
  `silent_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '禁言时间',
  `silent_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '禁言过期时间',
  `silent_hide` tinyint(1) DEFAULT 0 COMMENT '是否通知被禁言人,1:不通知,2:通知',
  `silent_info` varchar(200) NOT NULL DEFAULT '' COMMENT '禁言原因',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色封号禁言列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_role`
--

LOCK TABLES `lock_role` WRITE;
/*!40000 ALTER TABLE `lock_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_online`
--

DROP TABLE IF EXISTS `log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道id',
  `ts` int(11) NOT NULL DEFAULT 0 COMMENT '统计时间',
  `role_num` int(10) NOT NULL COMMENT '在线人数',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `channel_reg` (`channel_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='实时在线人数统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_online`
--

LOCK TABLES `log_online` WRITE;
/*!40000 ALTER TABLE `log_online` DISABLE KEYS */;
INSERT INTO `log_online` VALUES (1,0,1619872961,1,'dev',1),(2,0,1619873021,1,'dev',1),(3,0,1619873081,1,'dev',1),(4,0,1619873141,1,'dev',1),(5,0,1619873201,1,'dev',1),(6,0,1619873261,1,'dev',1),(7,0,1619873321,1,'dev',1),(8,0,1619873381,1,'dev',1),(9,0,1619873441,1,'dev',1),(10,0,1619873501,1,'dev',1),(11,0,1619873861,1,'dev',1),(12,0,1619873921,1,'dev',1),(13,0,1619873981,1,'dev',1),(14,0,1619874041,1,'dev',1),(15,0,1619874101,1,'dev',1),(16,0,1619874161,1,'dev',1),(17,0,1619874221,1,'dev',1),(18,0,1619874281,1,'dev',1),(19,0,1619874341,1,'dev',1),(20,0,1619874401,1,'dev',1),(21,0,1619874461,1,'dev',1),(22,0,1619874521,1,'dev',1),(23,0,1619874581,1,'dev',1),(24,0,1619874641,1,'dev',1),(25,0,1619874701,1,'dev',1),(26,0,1619874761,1,'dev',1),(27,0,1619874821,1,'dev',1),(28,0,1619874881,1,'dev',1),(29,0,1619874941,1,'dev',1),(30,0,1619875001,1,'dev',1),(31,0,1619875061,1,'dev',1),(32,0,1619875121,1,'dev',1),(33,0,1619875181,1,'dev',1),(34,0,1619875241,1,'dev',1),(35,0,1619875301,1,'dev',1),(36,0,1619875361,1,'dev',1),(37,0,1619875421,1,'dev',1),(38,0,1619875481,1,'dev',1),(39,0,1619875541,1,'dev',1),(40,0,1619875601,1,'dev',1),(41,0,1619875661,1,'dev',1),(42,0,1619876689,1,'dev',1),(43,0,1619876749,1,'dev',1),(44,0,1619876809,1,'dev',1),(45,0,1619876869,1,'dev',1),(46,0,1619876929,1,'dev',1),(47,0,1619876989,1,'dev',1),(48,0,1619877049,1,'dev',1),(49,0,1619877109,1,'dev',1),(50,0,1619877169,1,'dev',1),(51,0,1619877229,1,'dev',1),(52,0,1619877289,1,'dev',1),(53,0,1619877349,1,'dev',1),(54,0,1619877409,1,'dev',1),(55,0,1619877469,1,'dev',1),(56,0,1619877529,1,'dev',1),(57,0,1619877589,1,'dev',1),(58,0,1619877649,1,'dev',1),(59,0,1619877709,1,'dev',1),(60,0,1619877769,1,'dev',1),(61,0,1619877829,1,'dev',1),(62,0,1619877889,1,'dev',1),(63,0,1619877949,1,'dev',1),(64,0,1619878009,1,'dev',1),(65,0,1619878069,1,'dev',1),(66,0,1619878129,1,'dev',1),(67,0,1619878189,1,'dev',1),(68,0,1619878249,1,'dev',1),(69,0,1619878309,1,'dev',1),(70,0,1619878369,1,'dev',1),(71,0,1793086352,1,'dev',1),(72,0,1793086412,1,'dev',1),(73,0,1793086472,1,'dev',1),(74,0,1793086532,1,'dev',1),(75,0,1793086592,1,'dev',1),(76,0,1793086652,1,'dev',1),(77,0,1793086712,1,'dev',1),(78,0,1793086772,1,'dev',1),(79,0,1793086832,1,'dev',1),(80,0,1793086892,1,'dev',1),(81,0,1793086952,1,'dev',1),(82,0,1793087012,1,'dev',1),(83,0,1793087072,1,'dev',1),(84,0,1793087132,1,'dev',1),(85,0,1793087192,1,'dev',1),(86,0,1793087252,1,'dev',1),(87,0,1793087312,1,'dev',1),(88,0,1793087372,1,'dev',1),(89,0,1793087432,1,'dev',1),(90,0,1793087492,1,'dev',1),(91,0,1793087552,1,'dev',1),(92,0,1793087612,1,'dev',1),(93,0,1793087672,1,'dev',1),(94,0,1793087732,1,'dev',1),(95,0,1793087792,1,'dev',1),(96,0,1793087852,1,'dev',1),(97,0,1793087912,1,'dev',1),(98,0,1793087972,1,'dev',1),(99,0,1793088032,1,'dev',1),(100,0,1793088092,1,'dev',1),(101,0,1793088152,1,'dev',1),(102,0,1793088212,1,'dev',1),(103,0,1793088272,1,'dev',1),(104,0,1793088332,1,'dev',1),(105,0,1793088392,1,'dev',1),(106,0,1793088452,1,'dev',1),(107,0,1793088512,1,'dev',1),(108,0,1793088572,1,'dev',1),(109,0,1793088632,1,'dev',1),(110,0,1793088692,1,'dev',1),(111,0,1793088752,1,'dev',1),(112,0,1793088812,1,'dev',1),(113,0,1793088872,1,'dev',1),(114,0,1793088932,1,'dev',1),(115,0,1793088992,1,'dev',1),(116,0,1793089052,1,'dev',1),(117,0,1793089112,1,'dev',1),(118,0,1793089172,1,'dev',1),(119,0,1793089232,1,'dev',1),(120,0,1793089293,1,'dev',1),(121,0,1793089353,1,'dev',1),(122,0,1793089413,1,'dev',1),(123,0,1793089473,1,'dev',1),(124,0,1793089533,1,'dev',1),(125,0,1793089593,1,'dev',1),(126,0,1793089653,1,'dev',1),(127,0,1793089713,1,'dev',1),(128,0,1793089773,1,'dev',1),(129,0,1793089833,1,'dev',1),(130,0,1793089893,1,'dev',1),(131,0,1793089953,1,'dev',1),(132,0,1793090013,1,'dev',1),(133,0,1793090073,1,'dev',1),(134,0,1793090133,1,'dev',1),(135,0,1793090193,1,'dev',1),(136,0,1793090253,1,'dev',1),(137,0,1793090313,1,'dev',1),(138,0,1793090373,1,'dev',1),(139,0,1793090433,1,'dev',1),(140,0,1793090493,1,'dev',1),(141,0,1793090553,1,'dev',1),(142,0,1793090613,1,'dev',1),(143,0,1793090673,1,'dev',1),(144,0,1793090733,1,'dev',1),(145,0,1793090793,1,'dev',1),(146,0,1793090853,1,'dev',1),(147,0,1793090913,1,'dev',1),(148,0,1793090973,1,'dev',1),(149,0,1793091033,1,'dev',1),(150,0,1793091093,1,'dev',1),(151,0,1793091153,1,'dev',1),(152,0,1793091213,1,'dev',1),(153,0,1793091273,1,'dev',1),(154,0,1793091333,1,'dev',1),(155,0,1793091393,1,'dev',1),(156,0,1793091453,1,'dev',1),(157,0,1793091513,1,'dev',1),(158,0,1793091573,1,'dev',1),(159,0,1793091633,1,'dev',1),(160,0,1793091693,1,'dev',1),(161,0,1793091753,1,'dev',1),(162,0,1793091813,1,'dev',1),(163,0,1793091873,1,'dev',1),(164,0,1793091933,1,'dev',1),(165,0,1793091993,1,'dev',1),(166,0,1793092053,1,'dev',1),(167,0,1793092113,1,'dev',1),(168,0,1793092173,1,'dev',1),(169,0,1793092233,1,'dev',1),(170,0,1793092293,1,'dev',1),(171,0,1793092353,1,'dev',1),(172,0,1793092413,1,'dev',1),(173,0,1793092473,1,'dev',1),(174,0,1793092533,1,'dev',1),(175,0,1793092593,1,'dev',1),(176,0,1793092653,1,'dev',1),(177,0,1793092713,1,'dev',1),(178,0,1793092773,1,'dev',1),(179,0,1793092833,1,'dev',1),(180,0,1793092893,1,'dev',1),(181,0,1793092953,1,'dev',1),(182,0,1793093013,1,'dev',1),(183,0,1793093073,1,'dev',1),(184,0,1793093133,1,'dev',1),(185,0,1793093193,1,'dev',1),(186,0,1793093253,1,'dev',1),(187,0,1793093314,1,'dev',1),(188,0,1793093374,1,'dev',1),(189,0,1793093434,1,'dev',1),(190,0,1793093494,1,'dev',1),(191,0,1793093554,1,'dev',1),(192,0,1793093614,1,'dev',1),(193,0,1793093674,1,'dev',1),(194,0,1793093734,1,'dev',1),(195,0,1793093794,1,'dev',1),(196,0,1793093854,1,'dev',1),(197,0,1793093914,1,'dev',1),(198,0,1793093974,1,'dev',1),(199,0,1793094034,1,'dev',1),(200,0,1793094094,1,'dev',1),(201,0,1793150051,1,'dev',1),(202,0,1793150111,1,'dev',1),(203,0,1793150171,1,'dev',1),(204,0,1793150231,1,'dev',1),(205,0,1793150291,1,'dev',1),(206,0,1793150351,1,'dev',1),(207,0,1793150411,1,'dev',1),(208,0,1793150471,1,'dev',1),(209,0,1793150531,1,'dev',1),(210,0,1793150591,1,'dev',1),(211,0,1793150651,1,'dev',1),(212,0,1793150711,1,'dev',1),(213,0,1793150771,1,'dev',1),(214,0,1793150831,1,'dev',1),(215,0,1793150892,1,'dev',1),(216,0,1793150952,1,'dev',1),(217,0,1793151012,1,'dev',1),(218,0,1793151072,1,'dev',1),(219,0,1793151132,1,'dev',1),(220,0,1793151192,1,'dev',1),(221,0,1793151252,1,'dev',1),(222,0,1793151312,1,'dev',1),(223,0,1793151372,1,'dev',1),(224,0,1793151432,1,'dev',1),(225,0,1793151492,1,'dev',1),(226,0,1793151552,1,'dev',1),(227,0,1793151612,1,'dev',1),(228,0,1793151672,1,'dev',1),(229,0,1793151732,1,'dev',1),(230,0,1793151792,1,'dev',1),(231,0,1793151852,1,'dev',1),(232,0,1793151912,1,'dev',1),(233,0,1793151972,1,'dev',1),(234,0,1793152032,1,'dev',1),(235,0,1793152092,1,'dev',1),(236,0,1793152152,1,'dev',1),(237,0,1793152212,1,'dev',1),(238,0,1793152272,1,'dev',1),(239,0,1793152332,1,'dev',1),(240,0,1793152392,1,'dev',1),(241,0,1793152452,1,'dev',1),(242,0,1793152512,1,'dev',1),(243,0,1793152572,1,'dev',1),(244,0,1793152632,1,'dev',1),(245,0,1793152692,1,'dev',1),(246,0,1793152752,1,'dev',1),(247,0,1793152812,1,'dev',1),(248,0,1793152872,1,'dev',1),(249,0,1793152932,1,'dev',1),(250,0,1793152992,1,'dev',1),(251,0,1793153052,1,'dev',1),(252,0,1793153112,1,'dev',1),(253,0,1793153172,1,'dev',1),(254,0,1793153232,1,'dev',1),(255,0,1793153292,1,'dev',1),(256,0,1793153352,1,'dev',1),(257,0,1793153412,1,'dev',1),(258,0,1793153472,1,'dev',1),(259,0,1793153532,1,'dev',1),(260,0,1793153592,1,'dev',1),(261,0,1793153652,1,'dev',1),(262,0,1793153712,1,'dev',1),(263,0,1793153772,1,'dev',1),(264,0,1793153832,1,'dev',1),(265,0,1793153892,1,'dev',1),(266,0,1793153952,1,'dev',1),(267,0,1793154012,1,'dev',1),(268,0,1793154072,1,'dev',1),(269,0,1793154132,1,'dev',1),(270,0,1793154192,1,'dev',1),(271,0,1793154252,1,'dev',1),(272,0,1793154312,1,'dev',1),(273,0,1793154372,1,'dev',1),(274,0,1793154432,1,'dev',1),(275,0,1793154492,1,'dev',1),(276,0,1793154552,1,'dev',1),(277,0,1793154612,1,'dev',1),(278,0,1793154672,1,'dev',1),(279,0,1793154732,1,'dev',1),(280,0,1793154792,1,'dev',1),(281,0,1793154853,1,'dev',1),(282,0,1793154913,1,'dev',1),(283,0,1793154973,1,'dev',1),(284,0,1793155033,1,'dev',1),(285,0,1793155093,1,'dev',1),(286,0,1793155153,1,'dev',1),(287,0,1793155213,1,'dev',1),(288,0,1793155273,1,'dev',1),(289,0,1793155333,1,'dev',1),(290,0,1793155393,1,'dev',1),(291,0,1793155453,1,'dev',1),(292,0,1793155513,1,'dev',1),(293,0,1793155573,1,'dev',1),(294,0,1793155633,1,'dev',1),(295,0,1793155693,1,'dev',1),(296,0,1793155753,1,'dev',1),(297,0,1793155813,1,'dev',1),(298,0,1793155873,1,'dev',1),(299,0,1793155933,1,'dev',1),(300,0,1793155993,1,'dev',1),(301,0,1793156053,1,'dev',1),(302,0,1793156113,1,'dev',1),(303,0,1793156173,1,'dev',1),(304,0,1793156233,1,'dev',1),(305,0,1793156293,1,'dev',1),(306,0,1793156353,1,'dev',1),(307,0,1793156413,1,'dev',1),(308,0,1793156473,1,'dev',1),(309,0,1793156533,1,'dev',1),(310,0,1793156593,1,'dev',1),(311,0,1793156653,1,'dev',1),(312,0,1793156713,1,'dev',1),(313,0,1793156773,1,'dev',1),(314,0,1793156833,1,'dev',1),(315,0,1793156893,1,'dev',1),(316,0,1793156953,1,'dev',1),(317,0,1793157013,1,'dev',1),(318,0,1793157073,1,'dev',1),(319,0,1793157133,1,'dev',1),(320,0,1793157193,1,'dev',1),(321,0,1793157253,1,'dev',1),(322,0,1793157313,1,'dev',1),(323,0,1793157373,1,'dev',1),(324,0,1793157433,1,'dev',1),(325,0,1793157493,1,'dev',1),(326,0,1793157553,1,'dev',1),(327,0,1793157613,1,'dev',1),(328,0,1793157673,1,'dev',1),(329,0,1793157733,1,'dev',1),(330,0,1793157793,1,'dev',1),(331,0,1793157853,1,'dev',1),(332,0,1793157913,1,'dev',1),(333,0,1793157973,1,'dev',1),(334,0,1793158033,1,'dev',1),(335,0,1793158093,1,'dev',1),(336,0,1793158153,1,'dev',1),(337,0,1793158213,1,'dev',1),(338,0,1793158273,1,'dev',1),(339,0,1793158333,1,'dev',1),(340,0,1793158393,1,'dev',1),(341,0,1793158453,1,'dev',1),(342,0,1793158513,1,'dev',1),(343,0,1793158573,1,'dev',1),(344,0,1793158633,1,'dev',1),(345,0,1793161154,1,'dev',1),(346,0,1793161214,1,'dev',1),(347,0,1793161274,1,'dev',1),(348,0,1793161334,1,'dev',1),(349,0,1793161394,1,'dev',1),(350,0,1793161454,1,'dev',1),(351,0,1793161514,1,'dev',1),(352,0,1793161574,1,'dev',1),(353,0,1793161634,1,'dev',1),(354,0,1793161694,1,'dev',1),(355,0,1793161754,1,'dev',1),(356,0,1793161814,1,'dev',1),(357,0,1793161874,1,'dev',1),(358,0,1793161934,1,'dev',1),(359,0,1793161994,1,'dev',1),(360,0,1793162054,1,'dev',1),(361,0,1793162114,1,'dev',1),(362,0,1793162174,1,'dev',1),(363,0,1793162234,1,'dev',1),(364,0,1793162294,1,'dev',1),(365,0,1793162354,1,'dev',1),(366,0,1793162414,1,'dev',1),(367,0,1793162474,1,'dev',1),(368,0,1793162534,1,'dev',1),(369,0,1793162594,1,'dev',1),(370,0,1793162654,1,'dev',1),(371,0,1793162714,1,'dev',1),(372,0,1793162774,1,'dev',1),(373,0,1793162834,1,'dev',1),(374,0,1793162894,1,'dev',1),(375,0,1793162955,1,'dev',1),(376,0,1793163015,1,'dev',1),(377,0,1793163075,1,'dev',1),(378,0,1793163135,1,'dev',1),(379,0,1793163195,1,'dev',1),(380,0,1793163255,1,'dev',1),(381,0,1793163315,1,'dev',1),(382,0,1793163375,1,'dev',1),(383,0,1793163435,1,'dev',1),(384,0,1793163495,1,'dev',1),(385,0,1793163555,1,'dev',1),(386,0,1793163615,1,'dev',1),(387,0,1793163675,1,'dev',1),(388,0,1793163735,1,'dev',1),(389,0,1793163795,1,'dev',1),(390,0,1793163855,1,'dev',1),(391,0,1793163915,1,'dev',1),(392,0,1793163975,1,'dev',1),(393,0,1793164035,1,'dev',1),(394,0,1793164095,1,'dev',1),(395,0,1793164155,1,'dev',1),(396,0,1793164215,1,'dev',1),(397,0,1793164275,1,'dev',1),(398,0,1793164335,1,'dev',1),(399,0,1793164395,1,'dev',1),(400,0,1793164455,1,'dev',1),(401,0,1793164515,1,'dev',1),(402,0,1793164575,1,'dev',1),(403,0,1793164635,1,'dev',1),(404,0,1793164695,1,'dev',1),(405,0,1793164755,1,'dev',1),(406,0,1793164815,1,'dev',1),(407,0,1793164875,1,'dev',1),(408,0,1793164935,1,'dev',1),(409,0,1793164995,1,'dev',1),(410,0,1793165055,1,'dev',1),(411,0,1793165115,1,'dev',1),(412,0,1793165175,1,'dev',1),(413,0,1793165235,1,'dev',1),(414,0,1793165295,1,'dev',1),(415,0,1793165355,1,'dev',1),(416,0,1793165415,1,'dev',1),(417,0,1793165475,1,'dev',1),(418,0,1793165535,1,'dev',1),(419,0,1793165595,1,'dev',1),(420,0,1793165655,1,'dev',1),(421,0,1793165715,1,'dev',1),(422,0,1793165775,1,'dev',1),(423,0,1793165835,1,'dev',1),(424,0,1793165895,1,'dev',1),(425,0,1793165955,1,'dev',1),(426,0,1793166015,1,'dev',1),(427,0,1793166075,1,'dev',1),(428,0,1793166135,1,'dev',1),(429,0,1793166195,1,'dev',1),(430,0,1793166255,1,'dev',1),(431,0,1793166315,1,'dev',1),(432,0,1793166375,1,'dev',1),(433,0,1793166435,1,'dev',1),(434,0,1793166495,1,'dev',1),(435,0,1793166555,1,'dev',1),(436,0,1793166615,1,'dev',1),(437,0,1793166675,1,'dev',1),(438,0,1793166735,1,'dev',1),(439,0,1793166795,1,'dev',1),(440,0,1793166855,1,'dev',1),(441,0,1793166915,1,'dev',1),(442,0,1793166975,1,'dev',1),(443,0,1793167036,1,'dev',1),(444,0,1793167096,1,'dev',1),(445,0,1793167156,1,'dev',1),(446,0,1793167216,1,'dev',1),(447,0,1793167276,1,'dev',1),(448,0,1793167336,1,'dev',1),(449,0,1793167396,1,'dev',1),(450,0,1793167456,1,'dev',1),(451,0,1793167516,1,'dev',1),(452,0,1793167576,1,'dev',1),(453,0,1793167636,1,'dev',1),(454,0,1793167696,1,'dev',1),(455,0,1793167756,1,'dev',1),(456,0,1793167816,1,'dev',1),(457,0,1793167876,1,'dev',1),(458,0,1793167936,1,'dev',1),(459,0,1793167996,1,'dev',1),(460,0,1793168056,1,'dev',1),(461,0,1793168116,1,'dev',1),(462,0,1793168176,1,'dev',1),(463,0,1793168236,1,'dev',1),(464,0,1793168296,1,'dev',1),(465,0,1793168356,1,'dev',1),(466,0,1793168416,1,'dev',1),(467,0,1793168476,1,'dev',1),(468,0,1793168536,1,'dev',1),(469,0,1793168596,1,'dev',1),(470,0,1793168656,1,'dev',1),(471,0,1793168716,1,'dev',1),(472,0,1793168776,1,'dev',1),(473,0,1793168836,1,'dev',1),(474,0,1793168896,1,'dev',1),(475,0,1793168956,1,'dev',1),(476,0,1793169016,1,'dev',1),(477,0,1793169076,1,'dev',1),(478,0,1793169136,1,'dev',1),(479,0,1793169196,1,'dev',1),(480,0,1793169256,1,'dev',1),(481,0,1793169316,1,'dev',1),(482,0,1793169376,1,'dev',1),(483,0,1793169436,1,'dev',1),(484,0,1793169496,1,'dev',1),(485,0,1793169556,1,'dev',1),(486,0,1793169616,1,'dev',1),(487,0,1793169676,1,'dev',1),(488,0,1793169736,1,'dev',1),(489,0,1793169796,1,'dev',1),(490,0,1793169856,1,'dev',1),(491,0,1793169916,1,'dev',1),(492,0,1793169976,1,'dev',1),(493,0,1793170036,1,'dev',1),(494,0,1793170096,1,'dev',1),(495,0,1793170156,1,'dev',1),(496,0,1793170216,1,'dev',1),(497,0,1793170276,1,'dev',1),(498,0,1793170336,1,'dev',1),(499,0,1793170396,1,'dev',1),(500,0,1793170456,1,'dev',1),(501,0,1793170516,1,'dev',1),(502,0,1793170576,1,'dev',1),(503,0,1793170636,1,'dev',1),(504,0,1793170696,1,'dev',1),(505,0,1793170756,1,'dev',1),(506,0,1793170816,1,'dev',1),(507,0,1793170876,1,'dev',1),(508,0,1793170936,1,'dev',1),(509,0,1793170996,1,'dev',1),(510,0,1793171057,1,'dev',1),(511,0,1793171117,1,'dev',1),(512,0,1793171177,1,'dev',1),(513,0,1793171237,1,'dev',1),(514,0,1793171297,1,'dev',1),(515,0,1793171357,1,'dev',1),(516,0,1793171417,1,'dev',1),(517,0,1793171477,1,'dev',1),(518,0,1793171537,1,'dev',1),(519,0,1793171597,1,'dev',1),(520,0,1793171657,1,'dev',1),(521,0,1793171717,1,'dev',1),(522,0,1793171777,1,'dev',1),(523,0,1793171837,1,'dev',1),(524,0,1793171897,1,'dev',1),(525,0,1793171957,1,'dev',1),(526,0,1793172017,1,'dev',1),(527,0,1793172077,1,'dev',1),(528,0,1793172137,1,'dev',1),(529,0,1793172197,1,'dev',1),(530,0,1793172257,1,'dev',1),(531,0,1793172317,1,'dev',1),(532,0,1793172377,1,'dev',1),(533,0,1793172437,1,'dev',1),(534,0,1793172497,1,'dev',1),(535,0,1793172557,1,'dev',1),(536,0,1793172617,1,'dev',1),(537,0,1793172677,1,'dev',1),(538,0,1793172737,1,'dev',1),(539,0,1793172797,1,'dev',1),(540,0,1793172857,1,'dev',1),(541,0,1793172917,1,'dev',1),(542,0,1793172977,1,'dev',1),(543,0,1793173037,1,'dev',1),(544,0,1793173097,1,'dev',1),(545,0,1793173157,1,'dev',1),(546,0,1793173217,1,'dev',1),(547,0,1793173277,1,'dev',1),(548,0,1793177538,1,'dev',1),(549,0,1793177598,1,'dev',1),(550,0,1793177658,1,'dev',1),(551,0,1793177718,1,'dev',1),(552,0,1793177778,1,'dev',1),(553,0,1793177838,1,'dev',1),(554,0,1793177898,1,'dev',1),(555,0,1793177958,1,'dev',1),(556,0,1793178018,1,'dev',1),(557,0,1793178078,1,'dev',1),(558,0,1793178138,1,'dev',1),(559,0,1793178198,1,'dev',1),(560,0,1793178258,1,'dev',1),(561,0,1793178318,1,'dev',1),(562,0,1793178378,1,'dev',1);
/*!40000 ALTER TABLE `log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card`
--

DROP TABLE IF EXISTS `media_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card` (
  `card_num` varchar(48) NOT NULL COMMENT '卡号',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型编号',
  `batch_num` int(11) NOT NULL DEFAULT 1 COMMENT '批次',
  `rid` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `get_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ctime` int(11) NOT NULL COMMENT '新建时间',
  PRIMARY KEY (`card_num`),
  KEY `role_index` (`type`,`rid`,`platform`,`zone_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card`
--

LOCK TABLES `media_card` WRITE;
/*!40000 ALTER TABLE `media_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card_type`
--

DROP TABLE IF EXISTS `media_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card_type` (
  `id` int(11) NOT NULL COMMENT 'ID编号',
  `name` varchar(22) NOT NULL COMMENT '名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `lev` int(8) NOT NULL COMMENT '等级',
  `num` int(10) NOT NULL COMMENT '次数限制',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:失效 1:启动)',
  `items` varchar(1024) NOT NULL COMMENT '物品奖励({Id,Bind,Num})',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card_type`
--

LOCK TABLES `media_card_type` WRITE;
/*!40000 ALTER TABLE `media_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_mirrors`
--

DROP TABLE IF EXISTS `oms_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `auto_connect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启动后自动连接中央服',
  `nodename` varchar(255) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` varchar(10) NOT NULL DEFAULT 'zone' COMMENT '节点类型，zone:普通游戏区 center:中央服 world:世界主服务器 world_slave:世界从服务器',
  `cookie` varchar(255) NOT NULL DEFAULT '' COMMENT 'erlang节点使用的magic cookie',
  `ver` varchar(30) NOT NULL DEFAULT '' COMMENT '当前版本(此版本号用于标识当前版本，由安装工具自动填写)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`platform`,`zone_id`),
  UNIQUE KEY `nodename` (`nodename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='节点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_mirrors`
--

LOCK TABLES `oms_mirrors` WRITE;
/*!40000 ALTER TABLE `oms_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_log`
--

DROP TABLE IF EXISTS `review_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_log` (
  `id` int(11) unsigned NOT NULL COMMENT '评论id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `log_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '宠物或守护id',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 1 COMMENT '1增加，2删除',
  `base_name` varchar(20) NOT NULL DEFAULT '' COMMENT '宠物或守护名',
  `pro` varchar(20) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`),
  KEY `log_type` (`log_type`,`base_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_log`
--

LOCK TABLES `review_log` WRITE;
/*!40000 ALTER TABLE `review_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_report`
--

DROP TABLE IF EXISTS `review_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_report`
--

LOCK TABLES `review_report` WRITE;
/*!40000 ALTER TABLE `review_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `ver` int(11) NOT NULL COMMENT '版本号',
  `data` mediumblob NOT NULL COMMENT '序列化后的角色数据',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  UNIQUE KEY `name` (`name`,`platform`,`zone_id`),
  UNIQUE KEY `acc` (`account`,`platform`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'dev',1,'2017682741_0',0,'5470','多资源游戏',0,'120.11.121.114',1619872924,'120.11.121.114',1619876660,1619875682,0,1,6,100,76,'{role,76,undefined,2,false,true,{1619876660,1619875682},1619872924,{120,11,121,114},{120,11,121,114},0,{1,[100,101,118],1},[100,101,118],1,0,[53,52,55,48],[56,52,53,102,52,50,55,54,102,55,50,50,98,53,52,56,54,48,51,57,56,102,53,99,57,53,101,53,56,99,52,57],1,[56,54,53,49,54,54,48,50,56,56,57,53,48,54,49],[50,48,49,55,54,56,50,55,52,49,95,48],[22810,36164,28304,28216,25103],0,27122,0,1,6,100,0,260,11445,3556,1,1,1,{assets,41,8221,100437256,190000000,189972878,370054000,0,10000,1800,258,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{attr,3,0,260,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},undefined,{1,[]},{rtimer,undefined,undefined,[]},{pos,10003,[100,101,118],1,{pos_history,50031,[100,101,118],1,1298,888},10003,undefined,undefined,0,974,1649,2},[],0,0,0,0,undefined,0,[],[],false,[38634,12398,26684,26519],0,{m_attr_point,2,[{1,21}],1,1,[{attr_point_plan,1,[],0,0,0,0,0,0,0,4,0,1}],0},{m_combat,3,undefined,undefined,0,[],[],[],0},{m_quest,19,[{quest,41710,[],2,13,0,0,[{quest_progress,0,evt_mount_mange_pet,0,[],0,{evt_mount_mange_pet,80},1,0,[91,57,57,44,49,55,48,53,48,44,52,93],[],[]}],0,0,0,0},{quest,41700,[],2,13,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,79},5,0,[91,57,57,44,49,55,48,53,48,44,50,93],[],[]}],0,0,0,0},{quest,41690,[],2,13,0,0,[{quest_progress,0,evt_own_mount,3,[],0,{evt_own_mount,78},1,0,[91,57,57,44,49,55,48,53,48,93],[],[]}],0,0,0,0},{quest,41680,[],2,13,0,0,[{quest_progress,0,evt_own_mount,1,[],0,{evt_own_mount,77},1,0,[91,57,57,44,49,55,48,53,48,93],[],[]}],0,0,0,0},{quest,41620,[],2,13,0,0,[{quest_progress,0,evt_wing_skill,0,[],0,{evt_wing_skill,76},1,0,[91,57,57,44,49,48,51,48,48,44,51,44,49,93],[],[]}],0,0,0,0},{quest,41380,[],2,13,1,0,[{quest_progress,0,evt_enchant,7,[],1,undefined,8,8,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41370,[],2,13,1,0,[{quest_progress,0,evt_enchant,9,[],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41360,[],2,13,1,0,[{quest_progress,0,evt_enchant,5,[],1,undefined,8,8,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41730,[],2,2,1,0,[],0,0,0,0},{quest,41034,[],2,13,0,0,[{quest_progress,0,evt_dungeon_pass,10165,[],0,{evt_dungeon_pass,75},1,0,[91,57,57,44,49,50,49,51,48,93],[],[]}],0,0,0,0},{quest,41751,[],2,13,0,0,[{quest_progress,0,evt_talisman,0,[num],0,{evt_talisman,74},1,0,[91,57,57,44,49,48,51,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41750,[],2,13,1,0,[],0,0,0,0},{quest,41740,[],2,13,0,0,[{quest_progress,0,evt_child_deliver,0,[],0,{evt_child_deliver,73},1,0,[91,57,56,44,55,49,49,53,48,93],[],[]}],0,0,0,0},{quest,41674,[],2,13,0,0,[{quest_progress,0,evt_family_self_magic_beans,0,[],0,{evt_family_self_magic_beans,72},10,0,[91,57,56,44,50,48,48,56,49,93],[],[]}],0,0,0,0},{quest,41350,[],2,13,1,0,[{quest_progress,0,evt_enchant,7,[],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41340,[],2,13,1,0,[{quest_progress,0,evt_enchant,3,[],1,undefined,8,8,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41304,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,25,25,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41299,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,20,20,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41264,[],2,13,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,5,[],0,{evt_blacksmith_embed_lev,71},1,0,[91,57,57,44,49,48,54,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41013,[],2,13,0,0,[{quest_progress,0,evt_teacher,0,[],0,{evt_teacher,70},1,0,[91,49,44,50,93],[],[]}],0,0,0,0},{quest,41900,[],2,13,1,0,[],0,0,0,0},{quest,41851,[],2,13,0,0,[{quest_progress,0,evt_guard_activate,0,[],0,{evt_guard_activate,69},1,0,[91,57,57,44,49,48,57,48,48,93],[],[]}],0,0,0,0},{quest,41673,[],2,13,0,0,[{quest_progress,0,evt_family_self_magic_beans,0,[],0,{evt_family_self_magic_beans,68},1,0,[91,57,56,44,50,48,48,56,49,93],[],[]}],0,0,0,0},{quest,41672,[],2,13,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,67},4,0,[91,49,44,53,53,93],[],[]}],0,0,0,0},{quest,41671,[],2,13,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,66},3,0,[91,49,44,53,53,93],[],[]}],0,0,0,0},{quest,41670,[],2,13,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,65},1,0,[91,49,44,53,53,93],[],[]}],0,0,0,0},{quest,41490,[],2,13,1,0,[{quest_progress,0,evt_skill_prac_levup,0,[{lev,5}],1,undefined,6,6,[91,57,57,44,49,48,56,48,48,44,50,93],[],[]}],0,0,0,0},{quest,41330,[],2,13,1,0,[{quest_progress,0,evt_enchant,5,[],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41320,[],2,13,1,0,[{quest_progress,0,evt_enchant,3,[],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41294,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,15,15,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41289,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,10,10,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41263,[],2,13,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,3,[],0,{evt_blacksmith_embed_lev,64},1,0,[91,57,57,44,49,48,54,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41245,[],2,13,0,0,[{quest_progress,0,evt_tower_floor,2,[],0,{evt_tower_floor,63},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41032,[],2,13,0,0,[{quest_progress,0,evt_dungeon_pass,10150,[],0,{evt_dungeon_pass,62},1,0,[91,57,57,44,49,50,49,51,48,93],[],[]}],0,0,0,0},{quest,41580,[],2,13,0,0,[{quest_progress,0,evt_guard_embed_gem,0,[],0,{evt_guard_embed_gem,61},1,0,[91,57,57,44,49,48,57,48,48,93],[],[]}],0,0,0,0},{quest,41570,[],2,13,1,0,[{quest_progress,0,evt_guard_upgrade_eqm,0,[],1,undefined,1,1,[91,57,57,44,49,48,57,48,48,93],[],[]}],0,0,0,0},{quest,41560,[],2,13,0,0,[{quest_progress,0,evt_pet_use_item,100,[type],0,{evt_pet_use_item,60},1,0,[91,57,57,44,49,48,53,48,48,44,49,44,50,93],[],[]}],0,0,0,0},{quest,41558,[],2,13,0,0,[{quest_progress,0,evt_get_pet_item_skill_guide,0,[{items,[20140,20141]}],0,{evt_get_pet_item_skill_guide,59},1,0,[91,49,44,51,93],[],[]}],0,0,0,0},{quest,41550,[],2,13,0,0,[{quest_progress,0,evt_pet_stone_upgrade,0,[],0,{evt_pet_stone_upgrade,58},1,0,[91,57,57,44,49,48,53,48,48,93],[],[]}],0,0,0,0},{quest,41450,[],2,13,0,0,[{quest_progress,0,evt_examination,3,[],0,{evt_examination,57},1,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41440,[],2,13,0,0,[{quest_progress,0,evt_examination,2,[],0,{evt_examination,56},1,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41420,[],2,13,0,0,[{quest_progress,0,evt_warrior,0,[],0,{evt_warrior,55},3,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41400,[],2,13,0,0,[{quest_progress,0,evt_fairyland,0,[],0,{evt_fairyland,54},3,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41310,[],2,13,1,0,[{quest_progress,0,evt_enchant,1,[],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41284,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,5,5,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41280,[],2,13,1,0,[{quest_progress,0,evt_glory,0,[],1,undefined,1,1,[91,57,57,44,49,51,56,48,48,93],[],[]}],0,0,0,0},{quest,41271,[],2,13,0,0,[{quest_progress,0,evt_reset_eqm,0,[],0,{evt_reset_eqm,53},1,0,[91,57,57,44,49,48,54,48,48,44,50,93],[],[]}],0,0,0,0},{quest,41262,[],2,13,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,52},8,0,[91,57,57,44,49,48,54,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41261,[],2,13,0,0,[{quest_progress,0,evt_blacksmith_embed,0,[],0,{evt_blacksmith_embed,51},1,0,[91,57,57,44,49,48,54,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41244,[],2,13,0,0,[{quest_progress,0,evt_tower_floor,1,[],0,{evt_tower_floor,50},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41240,[],2,13,0,0,[{quest_progress,0,evt_tower,20001,[],0,{evt_tower,49},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41230,[],2,13,0,0,[{quest_progress,0,evt_kill_npc,0,[{type,6}],0,{evt_kill_npc,48},1,0,[91,57,57,44,49,51,48,48,48,93],[],[]}],0,0,0,0},{quest,41210,[],2,13,0,0,[{quest_progress,0,evt_qualifying_combat,0,[],0,{evt_qualifying_combat,47},1,0,[91,49,44,51,57,93],[],[]}],0,0,0,0},{quest,41021,[],2,13,1,0,[{quest_progress,0,evt_eqm,0,[{eqm_lev,[{lev,40},{num,1}]}],1,undefined,1,1,[91,57,57,44,49,48,54,48,48,93],[],[]}],0,0,0,0},{quest,41850,[],2,13,1,0,[{quest_progress,0,evt_guard,0,[],1,undefined,4,4,[91,57,57,44,49,48,57,48,48,93],[],[]}],0,0,0,0},{quest,41810,[],2,13,1,0,[{quest_progress,0,evt_pet_add_point,0,[],1,undefined,1,1,[91,57,57,44,49,48,53,48,48,93],[],[]}],0,0,0,0},{quest,41780,[],2,13,1,0,[{quest_progress,0,evt_skill_up,30,[],1,undefined,4,4,[91,57,57,44,49,48,56,48,48,93],[],[]}],0,0,0,0},{quest,41510,[],2,13,1,0,[],0,0,0,0},{quest,41480,[],2,13,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,46},5,0,[91,57,57,44,49,49,56,48,48,93],[],[]}],0,0,0,0},{quest,41430,[],2,13,0,0,[{quest_progress,0,evt_examination,1,[],0,{evt_examination,45},1,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41410,[],2,13,0,0,[{quest_progress,0,evt_warrior,0,[],0,{evt_warrior,44},1,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41390,[],2,13,0,0,[{quest_progress,0,evt_fairyland,0,[],0,{evt_fairyland,43},1,0,[91,57,57,44,49,50,48,48,50,44,51,93],[],[]}],0,0,0,0},{quest,41250,[],2,13,1,0,[{quest_progress,0,evt_skill_prac_levup,0,[{lev,1}],1,undefined,1,1,[91,57,57,44,49,48,56,48,48,44,50,93],[],[]}],0,0,0,0},{quest,41200,[],2,13,0,0,[{quest_progress,0,evt_parade,0,[],0,{evt_parade,42},1,0,[91,93],[],[]}],0,0,0,0},{quest,41190,[],2,13,0,0,[{quest_progress,0,evt_maze,0,[],0,{evt_maze,41},1,0,[91,57,57,44,49,56,56,48,48,93],[],[]}],0,0,0,0},{quest,41180,[],2,13,1,0,[],0,0,0,0},{quest,41150,[],2,13,0,0,[{quest_progress,0,evt_trial,0,[],0,{evt_trial,40},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41130,[],2,13,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,39},1,0,[91,49,44,57,93],[],[]}],0,0,0,0},{quest,41120,[],2,13,0,0,[{quest_progress,0,evt_arena_win,0,[],0,{evt_arena_win,38},5,0,[91,57,57,44,49,50,50,48,48,93],[],[]}],0,0,0,0},{quest,41110,[],2,13,0,0,[{quest_progress,0,evt_quest_offer_ring,0,[],0,{evt_quest_offer_ring,37},3,0,[91,49,44,50,53,93],[],[]}],0,0,0,0},{quest,41090,[],2,13,0,0,[{quest_progress,0,evt_kill_guild_robber,0,[],0,{evt_kill_guild_robber,36},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41080,[],2,13,0,0,[{quest_progress,0,evt_commit_quest,0,[{quest_guild,5}],0,{evt_commit_quest,35},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41040,[],2,13,1,0,[{quest_progress,0,evt_guild,0,[],1,undefined,1,1,[91,57,57,44,49,49,49,48,48,93],[],[]}],0,0,0,0},{quest,41030,[],2,13,0,0,[{quest_progress,0,evt_dungeon_pass,10135,[],0,{evt_dungeon_pass,34},1,0,[91,57,57,44,49,50,49,51,48,93],[],[]}],0,0,0,0},{quest,41001,[],2,13,0,0,[{quest_progress,0,evt_quest_offer_ring,0,[],0,{evt_quest_offer_ring,33},1,0,[91,49,44,50,53,93],[],[]}],0,0,0,0},{quest,41830,[],2,13,1,0,[{quest_progress,0,evt_wing_lev,0,[{star_lev,3}],1,undefined,1,1,[91,57,57,44,49,48,51,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41820,[],2,13,0,0,[{quest_progress,0,evt_market_gold_bind_sold,0,[],0,{evt_market_gold_bind_sold,32},1,0,[91,57,57,44,49,50,52,48,48,93],[],[]}],0,0,0,0},{quest,41800,[],2,13,1,0,[{quest_progress,0,evt_pet_add_point,0,[],1,undefined,1,1,[91,57,57,44,49,48,53,48,48,93],[],[]}],0,0,0,0},{quest,41790,[],2,13,0,0,[{quest_progress,0,evt_combat_over,13,[win],0,{evt_combat_over,31},5,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41770,[],2,13,1,0,[{quest_progress,0,evt_skill_up,25,[],1,undefined,4,4,[91,57,57,44,49,48,56,48,48,93],[],[]}],0,0,0,0},{quest,41220,[],2,13,0,0,[{quest_progress,0,evt_market_silver_first_on_sale,0,[],0,{evt_market_silver_first_on_sale,30},1,0,[91,57,57,44,49,50,52,48,49,93],[],[]}],0,0,0,0},{quest,41218,[],2,13,0,0,[{quest_progress,0,evt_skill_life_produce,0,[],0,{evt_skill_life_produce,29},1,0,[91,57,57,44,49,48,56,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41140,[],2,13,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,28},1,0,[91,57,57,44,49,49,56,48,48,93],[],[]}],0,0,0,0},{quest,41012,[],2,13,1,0,[{quest_progress,0,evt_teacher_to_sudent,0,[],1,undefined,1,1,[91,49,44,50,93],[],[]}],0,0,0,0},{quest,41011,[],2,13,0,0,[{quest_progress,0,evt_arena_fight,0,[],0,{evt_arena_fight,27},1,0,[91,57,57,44,49,50,50,48,48,93],[],[]}],0,0,0,0},{quest,41060,[],2,13,0,0,[{quest_progress,0,evt_commit_quest,0,[{quest_classes,10}],0,{evt_commit_quest,26},1,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41702,[],2,13,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,25},15,0,[91,57,57,44,49,55,48,53,48,44,50,93],[],[]}],0,0,0,0},{quest,41701,[],2,13,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,24},10,0,[91,57,57,44,49,55,48,53,48,44,50,93],[],[]}],0,0,0,0},{quest,41660,[],2,13,0,0,[{quest_progress,0,evt_comprehend_eqm,0,[{craft_num,2}],0,{evt_comprehend_eqm,23},1,0,[91,57,57,44,49,48,54,48,48,44,53,93],[],[]}],0,0,0,0},{quest,41650,[],2,13,0,0,[{quest_progress,0,evt_comprehend_eqm,0,[{craft_num,1}],0,{evt_comprehend_eqm,22},8,0,[91,57,57,44,49,48,54,48,48,44,53,93],[],[]}],0,0,0,0},{quest,41640,[],2,13,0,0,[{quest_progress,0,evt_comprehend_eqm,0,[{craft_num,1}],0,{evt_comprehend_eqm,21},1,0,[91,57,57,44,49,48,54,48,48,44,53,93],[],[]}],0,0,0,0},{quest,41630,[],2,13,0,0,[{quest_progress,0,evt_wing_skill,0,[],0,{evt_wing_skill,20},2,0,[91,57,57,44,49,48,51,48,48,44,51,44,49,93],[],[]}],0,0,0,0},{quest,41610,[],2,13,0,0,[{quest_progress,0,evt_kill_npc,52081,[],0,{evt_kill_npc,19},1,0,[91,57,57,44,49,50,48,48,50,44,49,93],[],[]}],0,0,0,0},{quest,41600,[],2,13,0,0,[{quest_progress,0,evt_kill_npc,52041,[],0,{evt_kill_npc,18},1,0,[91,57,57,44,49,50,48,48,50,44,49,93],[],[]}],0,0,0,0},{quest,41590,[],2,13,0,0,[{quest_progress,0,evt_kill_npc,52011,[],0,{evt_kill_npc,17},1,0,[91,57,57,44,49,50,48,48,50,44,49,93],[],[]}],0,0,0,0},{quest,41381,[],2,13,1,0,[{quest_progress,0,evt_enchant,9,[],1,undefined,8,8,[91,57,57,44,49,48,54,48,48,44,52,93],[],[]}],0,0,0,0},{quest,41036,[],2,13,0,0,[{quest_progress,0,evt_dungeon_pass,10180,[],0,{evt_dungeon_pass,16},1,0,[91,57,57,44,49,50,49,51,48,93],[],[]}],0,0,0,0},{quest,41910,[],2,2,1,0,[],0,0,0,0},{quest,22066,[],1,1,0,0,[{quest_progress,0,evt_enter_map,20001,[],1,undefined,1,1,[91,48,44,49,48,48,53,50,93],[],[]},{quest_progress,1,evt_unit_click,41001,[{create_unit,20023,41001,{point,20001,1508,1628},1,[115,116,97,110,100]}],0,{evt_unit_click,13},1,0,[91,48,44,50,48,48,50,51,93],[],[]},{quest_progress,2,evt_unit_click,41046,[{create_unit,20025,41046,{point,20001,809,838},7,[115,116,97,110,100]}],0,{evt_unit_click,14},1,0,[91,48,44,50,48,48,50,53,93],[],[]},{quest_progress,3,evt_fight_unit,41040,[],0,{evt_fight_unit,15},1,0,[91,48,44,50,48,48,50,54,93],[],[]}],0,0,0,0},{quest,41704,[],2,13,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,12},25,0,[91,57,57,44,49,55,48,53,48,44,50,93],[],[]}],0,0,0,0},{quest,41703,[],2,13,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,11},20,0,[91,57,57,44,49,55,48,53,48,44,50,93],[],[]}],0,0,0,0},{quest,44510,[],1,1,1,0,[{quest_progress,0,evt_levup,0,[],1,undefined,90,90,[91,93],[],[]}],0,0,0,0},{quest,44000,[],2,2,1,0,[],0,0,0,0}],[],[41760,44500,22060,40103,22054,22050,22030,22000],[],{quest_classes,0,0,1,0,0,[]},{quest_offer,0,0,0,0,0,0,[]},{quest_prac,1,2,0},{quest_treasure,0,0,0},{quest_guild,0,0,1,0,0,[]},{quest_chain,0,0,0,[],0,0,undefined},{quest_marriage,0,0,0,0,0,#{mid=>0,robot_id=>undefined}},{quest_couple,0,0,0,0,0,undefined,#{mid=>0,partner_name=>[],robot_id=>undefined,triggers=>[]}},{quest_plant,0,0,0,0,0,0,{0,0,0},[]},{quest_teacher,0,0,0,undefined,0,0,[],#{appoint_trigger=>undefined,ask_id=>{<<>>,0,0},ask_start_time=>0}},{quest_shipping,[]},{quest_pursue,0,0,0,1,0,0,[]},2,{quest_child,0,0,0,0,1,0,[]},{quest_pregnancy,0,0,0,0,1,[]},{quest_acquaintance,0,0,0,0,0,[],[],0,0},{quest_king,1,1,[],[],0},{quest_summer,1,[],[],0,[]},{quest_single_dog,1,[],1,#{}},{quest_sign_draw,[],[]},{quest_score_exchange,[],[]},{quest_long_active,[],[]}},{m_pet,2,4,4,[{pet,32,1,1,[27874,27874],94,2146,679,4,0,0,0,3485776,1,10001,{attr,3,0,520,11805,1121,405,4339,1825,2023,1775,0,0,0,0,0,0,0,0,0,809,527,0,0,0,630,630,30,0,0,0,0,0,0,0,0,0,0,525,525,467,188,95,95,95,0},11805,1121,11805,1121,{pet_attr,0,467,188,95,95,95,0,0,0,0,0,0,0,0,0,0,1188,1265,1009,831,1246,1188,1265,1009,831,1246},7785,[],[{pet_skill,60033,1,1,1,33,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0},{pet_skill,60039,1,1,1,39,1,0,0}],1,0,[],[],[],0,0,[{1,[20154,23478,33258,24102,36830,20987,36861,20987,21734,27874,123,102,97,99,101,95,49,44,49,125]},{2,[30475,25105,30340,36830,20987,36861,20987,27969,123,102,97,99,101,95,49,44,51,54,125]},{3,[20307,21147,21152,28857,33021,35753,25105,26356,25239,25549,27874,123,102,97,99,101,95,49,44,32,49,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]},{pet,32,2,1,[33457,33721],15,2108,721,4,0,0,0,1437,0,10003,{attr,3,0,520,1334,932,37,751,470,492,457,0,0,0,0,0,0,0,0,0,630,420,0,0,0,630,630,30,0,0,0,0,0,0,0,0,0,0,525,525,72,30,16,16,16,0},1334,932,1334,932,{pet_attr,0,72,30,16,16,16,0,0,0,0,0,0,0,0,0,0,1188,1365,1093,890,1188,1188,1365,1093,890,1188},8276,[],[{pet_skill,60038,1,1,1,38,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0}],1,0,[],[],[],0,0,[{1,[33258,24102,39640,32423,36830,20987,30340,24378,21147,23456,29289,23601,26159,25105,21862,123,102,97,99,101,95,49,44,50,48,125]},{2,[27599,27425,21319,32423,35760,24471,32473,25105,21152,28857,21734,123,102,97,99,101,95,49,44,32,55,125]},{3,[23567,24515,25105,20027,20154,25549,20320,21734,123,102,97,99,101,95,49,44,32,50,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]},{pet,32,3,1,[27874,27874],1,2075,679,4,0,0,0,864,0,10001,{attr,3,0,520,193,822,2,381,349,351,335,0,0,0,0,0,0,0,0,0,630,420,0,0,0,630,630,30,0,0,0,0,0,0,0,0,0,0,525,525,2,2,2,2,2,0},193,822,193,822,{pet_attr,0,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,1104,1215,1009,817,1181,1104,1215,1009,875,1290},7908,[],[{pet_skill,60033,1,1,1,33,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0},{pet_skill,60039,1,1,1,39,1,0,0}],1,0,[],[],[],0,0,[{1,[20154,23478,33258,24102,36830,20987,36861,20987,21734,27874,123,102,97,99,101,95,49,44,49,125]},{2,[30475,25105,30340,36830,20987,36861,20987,27969,123,102,97,99,101,95,49,44,51,54,125]},{3,[20307,21147,21152,28857,33021,35753,25105,26356,25239,25549,27874,123,102,97,99,101,95,49,44,32,49,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]}],3,5,1619884800},{m_skill,6,[{69001,91},{69002,91},{69004,91},{69003,91},{69005,91},{69006,91},{69007,91},{69008,91}],1,62000,[{skl_prac,62500,4,20,1,[{skl_prac_enhance,1,1}]},{skl_prac,62400,4,20,1,[{skl_prac_enhance,1,1}]},{skl_prac,62300,4,20,1,[{skl_prac_enhance,1,1}]},{skl_prac,62200,1,20,1,[{skl_prac_enhance,2,2},{skl_prac_enhance,1,2}]},{skl_prac,62100,1,20,1,[{skl_prac_enhance,2,2},{skl_prac_enhance,1,2}]},{skl_prac,62000,1,20,1,[{skl_prac_enhance,2,2},{skl_prac_enhance,1,2}]}],[],[],[],[],[],0,100,0,0,[]},{m_var,1,1619872923,1619872923,1619872923,[{27,1},{90,1},{141,[{100,1}]}],[{143,2400}],[{301,1}],1619876660,2460,[{1016,0},{1001,440},{1005,1},{1012,1},{1004,0},{1003,0}],[{2094,1},{2000,{95,0}},{2134,1},{2137,1},{2022,{card_state,0,0,0,0,0,0,1619872924}},{2115,0},{2032,[]},{2110,1},{2102,1},{2118,1},{2105,1},{2136,1},{2123,1},{2124,1},{2125,[{fashion_repaire,1}]},{2082,1},{2005,[{8,100,1620220151,0},{7,90,1620220020,1},{6,80,1620219663,1},{5,70,1620219645,1},{4,60,1620219645,1},{3,50,1620219645,1},{2,40,1620046845,1},{1,30,1619960445,1}]},{2023,[create_1,compensate_2]},{2004,1619960400},{2067,1},{2068,{0,0}},{2087,[]}]},{m_guard,1,[],[1,2,3,4,5,6],[],[{guard,2,1018,5,[20975,24681],[20975,24681],4,1,1,0,[61102,61103,61104,61105],[{guard_eqm,5,43032,19,30,[{attr_base,0,7,14,1,57},{attr_base,0,5,14,1,319},{attr_base,2,104,2091,1,8}],0,[],[],1,0,0,[]},{guard_eqm,5,43034,20,30,[{attr_base,0,6,14,1,23},{attr_base,0,1,14,1,673},{attr_base,2,102,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,43036,18,30,[{attr_base,0,6,14,1,45},{attr_base,0,3,14,1,64},{attr_base,2,104,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,43035,17,30,[{attr_base,0,7,14,1,85},{attr_base,0,2,14,1,487},{attr_base,2,104,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,43033,16,30,[{attr_base,0,6,14,1,155},{attr_base,2,102,4091,1,5},{attr_base,2,103,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,43031,15,30,[{attr_base,0,43,14,1,450},{attr_base,0,5,14,1,172},{attr_base,0,4,14,1,477},{attr_base,2,102,3091,1,11},{attr_base,2,101,3092,1,-3}],0,[],[],1,0,0,[]}],{attr,3,0,0,14735,3688,692,3289,2779,2561,1611,0,0,0,0,0,0,0,0,0,824,614,0,0,0,630,630,0,0,0,0,0,0,0,0,450,0,0,525,525,-3,21,5,18,15,0},572,{guard_astroid,2,[],[],[],500,0}},{guard,2,1012,4,[34013,38639],[34013,38639],2,1,1,0,[61065,61066,61067,61068],[{guard_eqm,5,41031,15,30,[{attr_base,0,43,14,1,450},{attr_base,0,5,14,1,172},{attr_base,0,4,14,1,477},{attr_base,2,103,3091,1,11},{attr_base,2,101,3092,1,-3}],0,[],[],1,0,0,[]},{guard_eqm,5,41033,16,30,[{attr_base,0,6,14,1,155},{attr_base,2,102,4091,1,5},{attr_base,2,103,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,41035,17,30,[{attr_base,0,7,14,1,85},{attr_base,0,2,14,1,487},{attr_base,2,102,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,41036,18,30,[{attr_base,0,6,14,1,45},{attr_base,0,3,14,1,64},{attr_base,2,104,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,41034,20,30,[{attr_base,0,6,14,1,23},{attr_base,0,1,14,1,673},{attr_base,2,102,4091,1,5},{attr_base,2,103,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,41032,19,30,[{attr_base,0,7,14,1,57},{attr_base,0,5,14,1,319},{attr_base,2,105,2091,1,8}],0,[],[],1,0,0,[]}],{attr,3,0,0,8670,3688,246,3031,4418,1811,2558,0,0,0,0,0,0,0,0,0,824,614,0,0,0,630,630,0,0,0,0,0,0,0,0,450,0,0,525,525,-3,15,21,5,18,0},470,{guard_astroid,2,[],[],[],380,0}},{guard,2,1008,3,[29748,38597],[29748,38597],5,1,1,0,[61041,61042,61044,61043],[{guard_eqm,5,44042,19,40,[{attr_base,0,7,14,1,78},{attr_base,0,5,14,1,435},{attr_base,2,104,2091,1,12}],0,[],[],1,0,0,[]},{guard_eqm,5,44044,20,40,[{attr_base,0,6,14,1,31},{attr_base,0,1,14,1,917},{attr_base,2,105,4092,1,7},{attr_base,2,102,4091,1,7}],0,[],[],1,0,0,[]},{guard_eqm,5,44046,18,40,[{attr_base,0,6,14,1,61},{attr_base,0,3,14,1,81},{attr_base,2,105,4092,1,7},{attr_base,2,104,4091,1,7}],0,[],[],1,0,0,[]},{guard_eqm,5,44045,17,40,[{attr_base,0,7,14,1,116},{attr_base,0,2,14,1,568},{attr_base,2,105,4092,1,7},{attr_base,2,104,4091,1,7}],0,[],[],1,0,0,[]},{guard_eqm,5,44043,16,40,[{attr_base,0,6,14,1,212},{attr_base,2,103,4092,1,7},{attr_base,2,102,4091,1,7}],0,[],[],1,0,0,[]},{guard_eqm,5,44041,15,40,[{attr_base,0,43,14,1,615},{attr_base,0,5,14,1,234},{attr_base,0,4,14,1,650},{attr_base,2,101,3092,1,-4},{attr_base,2,102,3091,1,16}],0,[],[],1,0,0,[]}],{attr,3,0,0,14849,3769,544,3330,2863,3180,1613,0,0,0,0,0,0,0,0,0,824,614,0,0,0,630,630,0,0,0,0,0,0,0,0,615,0,0,525,525,-4,30,7,26,21,0},531,{guard_astroid,2,[],[],[],440,0}},{guard,2,1002,2,[33778,38597],[33778,38597],1,1,1,0,[61006,61005,61007,61008],[{guard_eqm,5,40032,19,30,[{attr_base,0,7,14,1,57},{attr_base,0,5,14,1,319},{attr_base,2,104,2091,1,8}],0,[],[],1,0,0,[]},{guard_eqm,5,40034,20,30,[{attr_base,0,6,14,1,23},{attr_base,0,1,14,1,673},{attr_base,2,101,4091,1,5},{attr_base,2,102,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,40036,18,30,[{attr_base,0,6,14,1,45},{attr_base,0,3,14,1,64},{attr_base,2,104,4091,1,5},{attr_base,2,105,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,40035,17,30,[{attr_base,0,7,14,1,85},{attr_base,0,2,14,1,487},{attr_base,2,102,4091,1,5},{attr_base,2,104,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,40033,16,30,[{attr_base,0,6,14,1,155},{attr_base,2,101,4091,1,5},{attr_base,2,102,4092,1,5}],0,[],[],1,0,0,[]},{guard_eqm,5,40031,15,30,[{attr_base,0,43,14,1,450},{attr_base,0,5,14,1,172},{attr_base,0,4,14,1,477},{attr_base,2,101,3091,1,11},{attr_base,2,103,3092,1,-3}],0,[],[],1,0,0,[]}],{attr,3,0,0,8241,3688,395,4193,2448,1655,1435,0,0,0,0,0,0,0,0,0,824,614,0,0,0,630,630,0,0,0,0,0,0,0,0,450,0,0,525,525,21,15,-3,18,5,0},427,{guard_astroid,2,[],[],[],320,0}}]},{m_plot,1,1,[44002,44000,70046,30070,70044,70050,70040,70039,70038,70035,70020,70000,100,70037,70036],[],[{plot,44010,0,0},{plot,11630,0,0},{plot,44580,0,0},{plot,44570,0,0},{plot,44560,0,0},{plot,44550,0,0},{plot,44540,0,0},{plot,44535,0,0},{plot,44531,0,0},{plot,44530,0,0},{plot,44520,0,0},{plot,44510,0,0},{plot,11550,0,0},{plot,70048,1,0},{plot,70140,0,0},{plot,44500,0,0},{plot,30400,0,0},{plot,11470,0,0},{plot,11460,0,0},{plot,11434,0,0},{plot,11404,0,0},{plot,11390,0,0},{plot,11330,0,0},{plot,11260,0,0},{plot,83210,0,0},{plot,83200,0,0},{plot,83190,0,0},{plot,83180,0,0},{plot,83170,0,0},{plot,83165,0,0},{plot,83160,0,0},{plot,83140,0,0},{plot,83130,0,0},{plot,83129,0,0},{plot,83120,0,0},{plot,83110,0,0},{plot,83100,0,0},{plot,83026,0,0},{plot,83025,0,0},{plot,83001,0,0},{plot,83000,0,0},{plot,82003,0,0},{plot,60010,0,0},{plot,60000,0,0},{plot,50112,0,0},{plot,50042,0,0},{plot,50041,0,0},{plot,50040,0,0},{plot,50031,0,0},{plot,50030,0,0},{plot,50021,0,0},{plot,50020,0,0},{plot,50011,0,0},{plot,50010,0,0},{plot,50001,0,0},{plot,50000,0,0},{plot,43212,0,0},{plot,43211,0,0},{plot,43210,0,0},{plot,43170,0,0},{plot,43120,0,0},{plot,43050,0,0},{plot,43000,0,0},{plot,41730,0,0},{plot,30700,0,0},{plot,30600,0,0},{plot,30500,0,0},{plot,30300,0,0},{plot,30200,0,0},{plot,30190,0,0},{plot,30180,0,0},{plot,30170,0,0},{plot,30120,0,0},{plot,30140,0,0},{plot,30100,0,0},{plot,30080,0,0},{plot,30050,0,0},{plot,30040,0,0},{plot,30030,0,0},{plot,30020,0,0},{plot,30000,0,0},{plot,11250,0,0},{plot,11230,0,0},{plot,11200,0,0},{plot,11170,0,0},{plot,11152,0,0},{plot,11130,0,0},{plot,11070,0,0},{plot,11000,0,0},{plot,10940,0,0},{plot,10870,0,0},{plot,10830,0,0},{plot,10740,0,0},{plot,10700,0,0},{plot,10640,0,0},{plot,70347,0,0},{plot,10372,0,0},{plot,30150,0,0},{plot,70176,0,0},{plot,70174,0,0},{plot,70060,0,0},{plot,10046,0,0},{plot,10044,0,0},{plot,10574,0,0},{plot,10510,0,0},{plot,10440,0,0},{plot,70384,0,0},{plot,70300,0,0},{plot,70190,0,0},{plot,70185,0,0},{plot,70180,0,0}],[{plot,70177,0,0},{plot,70010,0,0},{plot,120,0,0},{plot,110,0,0},{plot,101,0,0}],[5],[{plot_unit,20023,[26460,32500],41001,4,1,0,20001,1508,1628,1,[115,116,97,110,100],[],0,22066,1,2,0},{plot_unit,20025,[26519,38647],41046,4,1,0,20001,809,838,7,[115,116,97,110,100],[],0,22066,2,2,0},{plot_unit,10052,[26143,21488],10007,1,1,0,10001,1646,2032,0,[115,116,97,110,100],[],0,0,0,0,0}],[],[],0,0,[],[],0},{m_dungeon,4,0,0,[],[],0},{m_guild,3,{1,[100,101,118],1},[22810,36164,28304],<11159.293.0>,1519874564,3,60,0,10000,[],[],[],0},undefined,{m_option,1,[]},{m_wing,11,4,1,0,20008,0,[],0,0,0,1,1,[{wing_skill_plan,1,[],[],[]}],0,0,[],[20008],0,0,0,[],1,[{wing_group,1,2,[20008],0,0}],100},{m_team,0,undefined,3,[],0,0,0,[1,2,3,4,5],[],0},{m_honor,3,30032,11010,[{honor,32100,0},{honor,11106,0},{honor,30032,0},{honor,11010,0}],0,[],[]},{m_friend,2,[],0,0,1,0,0,0,[],0,1,1,1,[],[],0,0,[],0},{m_wake,0,0,0,0,0,0,0,0,[],[]},{m_arena,1,0,0,1000,0,0,[{arena_graph,1,90012,5,0,1},{arena_graph,2,22400,1,0,1},{arena_graph,3,90012,4,0,1},{arena_graph,4,90012,3,0,1},{arena_graph,5,20020,1,0,2},{arena_graph,6,22400,1,0,2},{arena_graph,7,22400,1,0,2},{arena_graph,8,22400,1,0,2},{arena_graph,9,20088,1,0,3},{arena_graph,10,22400,1,0,3},{arena_graph,11,90012,8,0,3},{arena_graph,12,22400,1,0,3},{arena_graph,13,22400,2,0,4},{arena_graph,14,29006,1,0,4},{arena_graph,15,22400,1,0,4},{arena_graph,16,90012,7,0,4}]},{m_market_silver,1,1619876780,1,[{1,[{market_silver_refresh,1,21522,4,[],222720,0,undefined,0},{market_silver_refresh,2,21521,2,[],203940,0,undefined,0},{market_silver_refresh,3,21524,4,[],210000,0,undefined,0},{market_silver_refresh,4,21524,2,[],250000,0,undefined,0},{market_silver_refresh,5,21521,2,[],213120,0,undefined,0},{market_silver_refresh,6,21521,3,[],223440,0,undefined,0},{market_silver_refresh,7,20042,3,[],786240,0,undefined,0},{market_silver_refresh,8,21521,4,[],216140,0,undefined,0},{market_silver_refresh,9,21524,2,[],207580,0,undefined,0},{market_silver_refresh,10,21522,2,[],201880,0,undefined,0},{market_silver_refresh,11,21525,4,[],204000,0,undefined,0},{market_silver_refresh,12,21525,2,[],202000,0,undefined,0},{market_silver_refresh,13,20042,4,[],751440,0,undefined,0},{market_silver_refresh,14,20042,2,[],727500,0,undefined,0},{market_silver_refresh,15,21525,2,[],264160,0,undefined,0},{market_silver_refresh,16,21525,2,[],253440,0,undefined,0},{market_silver_refresh,17,21521,4,[],238360,0,undefined,0},{market_silver_refresh,18,21524,3,[],214000,0,undefined,0},{market_silver_refresh,19,21525,3,[],215340,0,undefined,0},{market_silver_refresh,20,21525,3,[],201600,0,undefined,0},{market_silver_refresh,21,21521,2,[],245760,0,undefined,0},{market_silver_refresh,22,21525,2,[],220480,0,undefined,0},{market_silver_refresh,23,21522,3,[],210080,0,undefined,0},{market_silver_refresh,24,21522,3,[],215040,0,undefined,0},{market_silver_refresh,25,21524,3,[],222480,0,undefined,0},{market_silver_refresh,26,20042,2,[],648960,0,undefined,0},{market_silver_refresh,27,21524,3,[],239400,0,undefined,0},{market_silver_refresh,28,21522,4,[],238000,0,undefined,0},{market_silver_refresh,29,20042,2,[],704220,0,undefined,0},{market_silver_refresh,30,21522,3,[],254800,0,undefined,0},{market_silver_refresh,31,21521,4,[],246000,0,undefined,0},{market_silver_refresh,32,21521,2,[],207900,0,undefined,0},{market_silver_refresh,33,21525,3,[],206000,0,undefined,0},{market_silver_refresh,34,20042,3,[],756600,0,undefined,0},{market_silver_refresh,35,21522,4,[],222720,0,undefined,0},{market_silver_refresh,36,21522,2,[],203840,0,undefined,0},{market_silver_refresh,37,20042,4,[],661440,0,undefined,0},{market_silver_refresh,38,21521,4,[],235200,0,undefined,0},{market_silver_refresh,39,21524,3,[],220480,0,undefined,0},{market_silver_refresh,40,21524,2,[],204000,0,undefined,0},{market_silver_refresh,41,21525,3,[],268320,0,undefined,0},{market_silver_refresh,42,21522,2,[],228920,0,undefined,0},{market_silver_refresh,43,21525,3,[],199820,0,undefined,0},{market_silver_refresh,44,21525,3,[],246960,0,undefined,0},{market_silver_refresh,45,21524,2,[],215040,0,undefined,0},{market_silver_refresh,46,20042,4,[],726000,0,undefined,0},{market_silver_refresh,47,21521,2,[],216960,0,undefined,0},{market_silver_refresh,48,21521,2,[],220182,0,undefined,0},{market_silver_refresh,49,21522,3,[],224542,0,undefined,0},{market_silver_refresh,50,21521,2,[],256200,0,undefined,0},{market_silver_refresh,51,21524,3,[],240000,0,undefined,0},{market_silver_refresh,52,21522,2,[],246440,0,undefined,0},{market_silver_refresh,53,21522,2,[],211200,0,undefined,0},{market_silver_refresh,54,21524,3,[],255840,0,undefined,0},{market_silver_refresh,55,21525,4,[],214200,0,undefined,0},{market_silver_refresh,56,21521,3,[],236000,0,undefined,0},{market_silver_refresh,57,21524,3,[],252500,0,undefined,0},{market_silver_refresh,58,21525,4,[],222202,0,undefined,0},{market_silver_refresh,59,21524,2,[],203940,0,undefined,0},{market_silver_refresh,60,21521,4,[],243840,0,undefined,0},{market_silver_refresh,61,21522,2,[],236680,0,undefined,0},{market_silver_refresh,62,20042,3,[],686700,0,undefined,0},{market_silver_refresh,63,20042,4,[],693000,0,undefined,0},{market_silver_refresh,64,21525,2,[],237300,0,undefined,0},{market_silver_refresh,65,21521,2,[],215600,0,undefined,0},{market_silver_refresh,66,21525,2,[],232780,0,undefined,0},{market_silver_refresh,67,21522,3,[],256000,0,undefined,0},{market_silver_refresh,68,20042,2,[],715080,0,undefined,0},{market_silver_refresh,69,20042,4,[],772500,0,undefined,0},{market_silver_refresh,70,21522,2,[],257400,0,undefined,0},{market_silver_refresh,71,21521,3,[],241560,0,undefined,0},{market_silver_refresh,72,20042,2,[],648720,0,undefined,0},{market_silver_refresh,73,20042,3,[],717360,0,undefined,0},{market_silver_refresh,74,20042,2,[],650880,0,undefined,0},{market_silver_refresh,75,21524,2,[],219780,0,undefined,0},{market_silver_refresh,76,21522,2,[],236900,0,undefined,0},{market_silver_refresh,77,21525,2,[],250260,0,undefined,0},{market_silver_refresh,78,20042,3,[],744000,0,undefined,0},{market_silver_refresh,79,21524,4,[],245440,0,undefined,0},{market_silver_refresh,80,21524,2,[],250480,0,undefined,0}]},{2,[{market_silver_refresh,1,21406,1,[{1,10}],41861,0,undefined,0},{market_silver_refresh,2,21407,1,[{1,10}],102000,0,undefined,0},{market_silver_refresh,3,21400,1,[],4423,0,undefined,0},{market_silver_refresh,4,21403,1,[{1,10}],43680,0,undefined,0},{market_silver_refresh,5,21402,1,[{1,10}],42432,0,undefined,0},{market_silver_refresh,6,21406,1,[{1,10}],47463,0,undefined,0},{market_silver_refresh,7,21403,1,[{1,10}],40400,0,undefined,0},{market_silver_refresh,8,21407,1,[{1,10}],89601,0,undefined,0},{market_silver_refresh,9,21404,1,[{1,10}],50676,0,undefined,0},{market_silver_refresh,10,21406,1,[{1,10}],39676,0,undefined,0},{market_silver_refresh,11,21400,1,[],4383,0,undefined,0},{market_silver_refresh,12,21407,1,[{1,10}],84032,0,undefined,0},{market_silver_refresh,13,21408,1,[{1,10}],75326,0,undefined,0},{market_silver_refresh,14,21408,1,[{1,10}],67300,0,undefined,0},{market_silver_refresh,15,21403,1,[{1,10}],46512,0,undefined,0},{market_silver_refresh,16,21405,1,[{1,10}],42400,0,undefined,0},{market_silver_refresh,17,21402,1,[{1,10}],46056,0,undefined,0},{market_silver_refresh,18,21406,1,[{1,10}],37670,0,undefined,0},{market_silver_refresh,19,21408,1,[{1,10}],74132,0,undefined,0},{market_silver_refresh,20,21406,1,[{1,10}],35618,0,undefined,0},{market_silver_refresh,21,21400,1,[],4606,0,undefined,0},{market_silver_refresh,22,21408,1,[{1,10}],87318,0,undefined,0},{market_silver_refresh,23,21404,1,[{1,10}],46556,0,undefined,0},{market_silver_refresh,24,21405,1,[{1,10}],42768,0,undefined,0},{market_silver_refresh,25,21401,1,[{1,10}],89250,0,undefined,0},{market_silver_refresh,26,21400,1,[],4327,0,undefined,0},{market_silver_refresh,27,21406,1,[{1,10}],46178,0,undefined,0},{market_silver_refresh,28,21408,1,[{1,10}],78104,0,undefined,0},{market_silver_refresh,29,21403,1,[{1,10}],41128,0,undefined,0},{market_silver_refresh,30,21408,1,[{1,10}],79623,0,undefined,0},{market_silver_refresh,31,21401,1,[{1,10}],98685,0,undefined,0},{market_silver_refresh,32,21400,1,[],3709,0,undefined,0},{market_silver_refresh,33,21404,1,[{1,10}],49980,0,undefined,0},{market_silver_refresh,34,21405,1,[{1,10}],48608,0,undefined,0},{market_silver_refresh,35,21402,1,[{1,10}],41208,0,undefined,0},{market_silver_refresh,36,21408,1,[{1,10}],85992,0,undefined,0},{market_silver_refresh,37,21406,1,[{1,10}],37451,0,undefined,0},{market_silver_refresh,38,21400,1,[],3774,0,undefined,0},{market_silver_refresh,39,21400,1,[],4586,0,undefined,0},{market_silver_refresh,40,21400,1,[],4155,0,undefined,0},{market_silver_refresh,41,21402,1,[{1,10}],53664,0,undefined,0},{market_silver_refresh,42,21407,1,[{1,10}],79992,0,undefined,0},{market_silver_refresh,43,21403,1,[{1,10}],38800,0,undefined,0},{market_silver_refresh,44,21405,1,[{1,10}],49140,0,undefined,0},{market_silver_refresh,45,21402,1,[{1,10}],50592,0,undefined,0},{market_silver_refresh,46,21404,1,[{1,10}],41200,0,undefined,0},{market_silver_refresh,47,21404,1,[{1,10}],48552,0,undefined,0},{market_silver_refresh,48,21401,1,[{1,10}],96960,0,undefined,0},{market_silver_refresh,49,21403,1,[{1,10}],45472,0,undefined,0},{market_silver_refresh,50,21403,1,[{1,10}],47724,0,undefined,0},{market_silver_refresh,51,21405,1,[{1,10}],47724,0,undefined,0},{market_silver_refresh,52,21405,1,[{1,10}],43956,0,undefined,0},{market_silver_refresh,53,21401,1,[{1,10}],80025,0,undefined,0},{market_silver_refresh,54,21406,1,[{1,10}],38160,0,undefined,0},{market_silver_refresh,55,21408,1,[{1,10}],79833,0,undefined,0},{market_silver_refresh,56,21407,1,[{1,10}],80800,0,undefined,0},{market_silver_refresh,57,21407,1,[{1,10}],102480,0,undefined,0},{market_silver_refresh,58,21403,1,[{1,10}],44520,0,undefined,0},{market_silver_refresh,59,21405,1,[{1,10}],40740,0,undefined,0},{market_silver_refresh,60,21407,1,[{1,10}],97344,0,undefined,0},{market_silver_refresh,61,21402,1,[{1,10}],50688,0,undefined,0},{market_silver_refresh,62,21401,1,[{1,10}],75735,0,undefined,0},{market_silver_refresh,63,21404,1,[{1,10}],48000,0,undefined,0},{market_silver_refresh,64,21402,1,[{1,10}],42016,0,undefined,0},{market_silver_refresh,65,21401,1,[{1,10}],78030,0,undefined,0},{market_silver_refresh,66,21404,1,[{1,10}],49600,0,undefined,0},{market_silver_refresh,67,21404,1,[{1,10}],41944,0,undefined,0},{market_silver_refresh,68,21402,1,[{1,10}],42000,0,undefined,0},{market_silver_refresh,69,21405,1,[{1,10}],45784,0,undefined,0},{market_silver_refresh,70,21403,1,[{1,10}],44000,0,undefined,0},{market_silver_refresh,71,21408,1,[{1,10}],66000,0,undefined,0},{market_silver_refresh,72,21401,1,[{1,10}],77175,0,undefined,0},{market_silver_refresh,73,21402,1,[{1,10}],49200,0,undefined,0},{market_silver_refresh,74,21401,1,[{1,10}],74970,0,undefined,0},{market_silver_refresh,75,21406,1,[{1,10}],38564,0,undefined,0},{market_silver_refresh,76,21401,1,[{1,10}],91500,0,undefined,0},{market_silver_refresh,77,21407,1,[{1,10}],102480,0,undefined,0},{market_silver_refresh,78,21405,1,[{1,10}],44064,0,undefined,0},{market_silver_refresh,79,21407,1,[{1,10}],90720,0,undefined,0},{market_silver_refresh,80,21404,1,[{1,10}],46622,0,undefined,0}]},{3,[{market_silver_refresh,1,21359,2,[],85800,0,undefined,0},{market_silver_refresh,2,21313,2,[],86730,0,undefined,0},{market_silver_refresh,3,21305,4,[],80340,0,undefined,0},{market_silver_refresh,4,21356,4,[],89385,0,undefined,0},{market_silver_refresh,5,21359,4,[],89482,0,undefined,0},{market_silver_refresh,6,21309,3,[],121905,0,undefined,0},{market_silver_refresh,7,21311,3,[],160650,0,undefined,0},{market_silver_refresh,8,21309,2,[],105768,0,undefined,0},{market_silver_refresh,9,21359,4,[],81855,0,undefined,0},{market_silver_refresh,10,21314,2,[],248460,0,undefined,0},{market_silver_refresh,11,21309,4,[],96354,0,undefined,0},{market_silver_refresh,12,21352,3,[],63360,0,undefined,0},{market_silver_refresh,13,21313,4,[],88202,0,undefined,0},{market_silver_refresh,14,21314,2,[],241560,0,undefined,0},{market_silver_refresh,15,21355,3,[],72000,0,undefined,0},{market_silver_refresh,16,21303,2,[],49500,0,undefined,0},{market_silver_refresh,17,21307,3,[],78705,0,undefined,0},{market_silver_refresh,18,21353,2,[],59590,0,undefined,0},{market_silver_refresh,19,21314,2,[],243040,0,undefined,0},{market_silver_refresh,20,21303,2,[],52530,0,undefined,0},{market_silver_refresh,21,21311,3,[],157500,0,undefined,0},{market_silver_refresh,22,21355,2,[],59328,0,undefined,0},{market_silver_refresh,23,21307,4,[],96720,0,undefined,0},{market_silver_refresh,24,21303,2,[],61250,0,undefined,0},{market_silver_refresh,25,21360,3,[],87300,0,undefined,0},{market_silver_refresh,26,21356,2,[],85749,0,undefined,0},{market_silver_refresh,27,21356,3,[],79538,0,undefined,0},{market_silver_refresh,28,21314,2,[],241280,0,undefined,0},{market_silver_refresh,29,21360,3,[],102816,0,undefined,0},{market_silver_refresh,30,21353,4,[],56260,0,undefined,0},{market_silver_refresh,31,21351,2,[],32010,0,undefined,0},{market_silver_refresh,32,21356,4,[],94380,0,undefined,0},{market_silver_refresh,33,21352,2,[],56102,0,undefined,0},{market_silver_refresh,34,21358,4,[],107379,0,undefined,0},{market_silver_refresh,35,21351,4,[],38178,0,undefined,0},{market_silver_refresh,36,21360,4,[],92718,0,undefined,0},{market_silver_refresh,37,21303,4,[],62865,0,undefined,0},{market_silver_refresh,38,21353,2,[],63000,0,undefined,0},{market_silver_refresh,39,21311,2,[],156045,0,undefined,0},{market_silver_refresh,40,21360,2,[],111510,0,undefined,0},{market_silver_refresh,41,21356,3,[],87840,0,undefined,0},{market_silver_refresh,42,21355,4,[],63630,0,undefined,0},{market_silver_refresh,43,21309,4,[],118872,0,undefined,0},{market_silver_refresh,44,21358,2,[],95472,0,undefined,0},{market_silver_refresh,45,21357,3,[],81480,0,undefined,0},{market_silver_refresh,46,21311,4,[],165870,0,undefined,0},{market_silver_refresh,47,21305,4,[],57600,0,undefined,0},{market_silver_refresh,48,21358,4,[],117180,0,undefined,0},{market_silver_refresh,49,21359,4,[],95040,0,undefined,0},{market_silver_refresh,50,21351,3,[],32010,0,undefined,0},{market_silver_refresh,51,21307,3,[],95250,0,undefined,0},{market_silver_refresh,52,21357,4,[],85117,0,undefined,0},{market_silver_refresh,53,21357,4,[],78750,0,undefined,0},{market_silver_refresh,54,21313,2,[],97650,0,undefined,0},{market_silver_refresh,55,21314,2,[],232320,0,undefined,0},{market_silver_refresh,56,21307,3,[],73500,0,undefined,0},{market_silver_refresh,57,21352,2,[],60480,0,undefined,0},{market_silver_refresh,58,21352,4,[],52470,0,undefined,0},{market_silver_refresh,59,21357,2,[],91035,0,undefined,0},{market_silver_refresh,60,21305,3,[],68796,0,undefined,0},{market_silver_refresh,61,21355,4,[],70560,0,undefined,0},{market_silver_refresh,62,21357,4,[],72720,0,undefined,0},{market_silver_refresh,63,21305,2,[],64020,0,undefined,0},{market_silver_refresh,64,21360,4,[],100982,0,undefined,0},{market_silver_refresh,65,21354,2,[],56057,0,undefined,0},{market_silver_refresh,66,21305,3,[],72168,0,undefined,0},{market_silver_refresh,67,21311,2,[],161865,0,undefined,0},{market_silver_refresh,68,21358,4,[],87300,0,undefined,0},{market_silver_refresh,69,21354,3,[],56562,0,undefined,0},{market_silver_refresh,70,21358,3,[],117000,0,undefined,0},{market_silver_refresh,71,21354,4,[],53760,0,undefined,0},{market_silver_refresh,72,21354,3,[],52500,0,undefined,0},{market_silver_refresh,73,21355,2,[],73008,0,undefined,0},{market_silver_refresh,74,21309,3,[],100801,0,undefined,0},{market_silver_refresh,75,21313,4,[],81585,0,undefined,0},{market_silver_refresh,76,21359,3,[],86250,0,undefined,0},{market_silver_refresh,77,21354,2,[],51480,0,undefined,0},{market_silver_refresh,78,21313,4,[],93000,0,undefined,0},{market_silver_refresh,79,21351,3,[],38064,0,undefined,0},{market_silver_refresh,80,21353,3,[],62000,0,undefined,0}]},{4,[{market_silver_refresh,1,21300,4,[],12019,0,undefined,0},{market_silver_refresh,2,21306,3,[],112014,0,undefined,0},{market_silver_refresh,3,21304,2,[],45600,0,undefined,0},{market_silver_refresh,4,21409,4,[{1,10}],101626,0,undefined,0},{market_silver_refresh,5,21306,2,[],91800,0,undefined,0},{market_silver_refresh,6,21300,4,[],11808,0,undefined,0},{market_silver_refresh,7,21300,2,[],12177,0,undefined,0},{market_silver_refresh,8,21301,2,[],25600,0,undefined,0},{market_silver_refresh,9,21304,2,[],44544,0,undefined,0},{market_silver_refresh,10,21308,2,[],102900,0,undefined,0},{market_silver_refresh,11,21302,3,[{1,10}],31185,0,undefined,0},{market_silver_refresh,12,21304,2,[],49896,0,undefined,0},{market_silver_refresh,13,21304,3,[],44620,0,undefined,0},{market_silver_refresh,14,21308,2,[],123420,0,undefined,0},{market_silver_refresh,15,21301,4,[],25480,0,undefined,0},{market_silver_refresh,16,21308,4,[],127500,0,undefined,0},{market_silver_refresh,17,21301,4,[],23940,0,undefined,0},{market_silver_refresh,18,21306,3,[],96390,0,undefined,0},{market_silver_refresh,19,21300,4,[],10192,0,undefined,0},{market_silver_refresh,20,21308,2,[],99840,0,undefined,0},{market_silver_refresh,21,21301,3,[],26520,0,undefined,0},{market_silver_refresh,22,21308,2,[],106050,0,undefined,0},{market_silver_refresh,23,21304,4,[],42000,0,undefined,0},{market_silver_refresh,24,21308,3,[],131250,0,undefined,0},{market_silver_refresh,25,21409,2,[{1,10}],87550,0,undefined,0},{market_silver_refresh,26,21300,3,[],12348,0,undefined,0},{market_silver_refresh,27,21304,4,[],48960,0,undefined,0},{market_silver_refresh,28,21409,2,[{1,10}],96900,0,undefined,0},{market_silver_refresh,29,21302,4,[{1,10}],26265,0,undefined,0},{market_silver_refresh,30,21409,2,[{1,10}],97291,0,undefined,0},{market_silver_refresh,31,21409,2,[{1,10}],90100,0,undefined,0},{market_silver_refresh,32,21306,2,[],106722,0,undefined,0},{market_silver_refresh,33,21302,4,[{1,10}],27540,0,undefined,0},{market_silver_refresh,34,21300,3,[],10848,0,undefined,0},{market_silver_refresh,35,21302,4,[{1,10}],27820,0,undefined,0},{market_silver_refresh,36,21308,4,[],105060,0,undefined,0},{market_silver_refresh,37,21306,4,[],90000,0,undefined,0},{market_silver_refresh,38,21409,4,[{1,10}],82416,0,undefined,0},{market_silver_refresh,39,21301,3,[],22260,0,undefined,0},{market_silver_refresh,40,21300,3,[],11904,0,undefined,0},{market_silver_refresh,41,21306,2,[],110484,0,undefined,0},{market_silver_refresh,42,21304,3,[],44160,0,undefined,0},{market_silver_refresh,43,21304,2,[],41600,0,undefined,0},{market_silver_refresh,44,21308,2,[],102960,0,undefined,0},{market_silver_refresh,45,21302,3,[{1,10}],25200,0,undefined,0},{market_silver_refresh,46,21302,2,[{1,10}],32250,0,undefined,0},{market_silver_refresh,47,21301,3,[],22698,0,undefined,0},{market_silver_refresh,48,21300,2,[],12177,0,undefined,0},{market_silver_refresh,49,21409,2,[{1,10}],92820,0,undefined,0},{market_silver_refresh,50,21306,2,[],102717,0,undefined,0},{market_silver_refresh,51,21301,3,[],25200,0,undefined,0},{market_silver_refresh,52,21304,2,[],45936,0,undefined,0},{market_silver_refresh,53,21301,4,[],23100,0,undefined,0},{market_silver_refresh,54,21302,4,[{1,10}],26160,0,undefined,0},{market_silver_refresh,55,21300,2,[],10094,0,undefined,0},{market_silver_refresh,56,21306,4,[],106704,0,undefined,0},{market_silver_refresh,57,21302,4,[{1,10}],28910,0,undefined,0},{market_silver_refresh,58,21302,3,[{1,10}],28342,0,undefined,0},{market_silver_refresh,59,21306,3,[],101900,0,undefined,0},{market_silver_refresh,60,21409,4,[{1,10}],100793,0,undefined,0},{market_silver_refresh,61,21409,2,[{1,10}],81600,0,undefined,0},{market_silver_refresh,62,21302,2,[{1,10}],28307,0,undefined,0},{market_silver_refresh,63,21306,2,[],97119,0,undefined,0},{market_silver_refresh,64,21308,2,[],105930,0,undefined,0},{market_silver_refresh,65,21302,3,[{1,10}],33075,0,undefined,0},{market_silver_refresh,66,21308,3,[],112272,0,undefined,0},{market_silver_refresh,67,21306,3,[],108486,0,undefined,0},{market_silver_refresh,68,21302,2,[{1,10}],30900,0,undefined,0},{market_silver_refresh,69,21300,3,[],12500,0,undefined,0},{market_silver_refresh,70,21301,2,[],23460,0,undefined,0},{market_silver_refresh,71,21301,2,[],27300,0,undefined,0},{market_silver_refresh,72,21301,2,[],23522,0,undefined,0},{market_silver_refresh,73,21304,3,[],52520,0,undefined,0},{market_silver_refresh,74,21301,4,[],22800,0,undefined,0},{market_silver_refresh,75,21308,2,[],111360,0,undefined,0},{market_silver_refresh,76,21409,4,[{1,10}],116025,0,undefined,0},{market_silver_refresh,77,21300,2,[],11232,0,undefined,0},{market_silver_refresh,78,21300,2,[],11856,0,undefined,0},{market_silver_refresh,79,21304,2,[],49920,0,undefined,0},{market_silver_refresh,80,21409,4,[{1,10}],110500,0,undefined,0}]},{5,[]},{6,[]}]},{m_escort,0,32000,0,0,0,0,[],0,0,0,0,0,0,0,0,{0,0},0,0,0,[]},{m_buff,2,[{buff,4,12140,12140,10,0,1,1,1,5024,7200,1,0,1619876660,[],[],0,[],1}],1},{m_formation,1,1,1,[{formation,1,1,0}],[1002,1008,1012,1018]},{m_skill_life,2,[{skill_life,10000,15,0},{skill_life,10001,15,0},{skill_life,10005,0,0},{skill_life,10006,0,0},{skill_life,10007,30,0},{skill_life,10008,0,0},{skill_life,10009,0,0}]},{m_trial,3,0,0,undefined,{trial_unit,0,0,0,[],0,0,0,0,[],0,0,0},0,0,0,2,0,2,0,0,[],[],[]},{m_fashion,5,[],[],[],[],[],[],[{fashion_dress,53057,0,0,1}],0,20,0,[]},{m_satiety,1,0,1,0},{m_agenda,1,[{agenda_prog,1,1000,0,0},{agenda_prog,1,1001,0,0},{agenda_prog,1,1002,0,0},{agenda_prog,1,1004,0,0},{agenda_prog,1,1006,0,0},{agenda_prog,1,1007,0,0},{agenda_prog,1,1008,0,0},{agenda_prog,1,1009,0,0},{agenda_prog,1,1010,0,0},{agenda_prog,1,1013,0,0},{agenda_prog,1,1014,0,0},{agenda_prog,1,1017,0,0},{agenda_prog,1,1018,0,0},{agenda_prog,1,1020,0,0},{agenda_prog,1,1021,0,0},{agenda_prog,1,1022,0,0},{agenda_prog,1,1023,0,0},{agenda_prog,1,1024,0,0},{agenda_prog,1,1025,0,0},{agenda_prog,1,1026,0,0},{agenda_prog,1,1027,0,0},{agenda_prog,1,1028,0,0},{agenda_prog,1,1029,0,0},{agenda_prog,1,1030,0,0},{agenda_prog,1,1031,0,0},{agenda_prog,1,2002,0,0},{agenda_prog,1,2003,0,0},{agenda_prog,1,2004,0,0},{agenda_prog,1,2005,0,0},{agenda_prog,1,2006,0,0},{agenda_prog,1,2007,0,0},{agenda_prog,1,2008,0,0},{agenda_prog,1,2009,0,0},{agenda_prog,1,2010,0,0},{agenda_prog,1,2011,0,0},{agenda_prog,1,2012,0,0},{agenda_prog,1,2013,0,0},{agenda_prog,1,2014,0,0},{agenda_prog,1,2015,0,0},{agenda_prog,1,2016,0,0},{agenda_prog,1,2017,0,0},{agenda_prog,1,2018,0,0},{agenda_prog,1,2019,0,0},{agenda_prog,1,2020,0,0},{agenda_prog,1,2021,0,0},{agenda_prog,1,2022,0,0},{agenda_prog,1,2023,0,0},{agenda_prog,1,2024,0,0},{agenda_prog,1,2025,0,0},{agenda_prog,1,2026,0,0},{agenda_prog,1,2027,0,0},{agenda_prog,1,2028,0,0},{agenda_prog,1,2029,0,0},{agenda_prog,1,2030,0,0},{agenda_prog,1,2031,0,0},{agenda_prog,1,2032,0,0},{agenda_prog,1,2033,0,0},{agenda_prog,1,2034,0,0},{agenda_prog,1,2035,0,0},{agenda_prog,1,2036,0,0},{agenda_prog,1,2038,0,0},{agenda_prog,1,2039,0,0},{agenda_prog,1,2040,0,0},{agenda_prog,1,2041,0,0},{agenda_prog,1,2042,0,0},{agenda_prog,1,2043,0,0},{agenda_prog,1,2044,0,0},{agenda_prog,1,2045,0,0},{agenda_prog,1,2046,0,0},{agenda_prog,1,2047,0,0},{agenda_prog,1,2048,0,0},{agenda_prog,1,2049,0,0},{agenda_prog,1,2050,0,0},{agenda_prog,1,2051,0,0},{agenda_prog,1,2052,0,0},{agenda_prog,1,2053,0,0},{agenda_prog,1,2054,0,0},{agenda_prog,1,2055,0,0},{agenda_prog,1,2056,0,0},{agenda_prog,1,2057,0,0},{agenda_prog,1,2058,0,0},{agenda_prog,1,2059,0,0},{agenda_prog,1,2060,0,0},{agenda_prog,1,2061,0,0},{agenda_prog,1,2062,0,0},{agenda_prog,1,2063,0,0},{agenda_prog,1,2064,0,0},{agenda_prog,1,2065,0,0},{agenda_prog,1,2066,0,0},{agenda_prog,1,2067,0,0},{agenda_prog,1,2068,0,0},{agenda_prog,1,2069,0,0},{agenda_prog,1,2070,0,0},{agenda_prog,1,2071,0,0},{agenda_prog,1,2072,0,0},{agenda_prog,1,2073,0,0},{agenda_prog,1,2074,0,0},{agenda_prog,1,2075,0,0},{agenda_prog,1,2076,0,0},{agenda_prog,1,2077,0,0},{agenda_prog,1,2078,0,0},{agenda_prog,1,2079,0,0},{agenda_prog,1,2080,0,0},{agenda_prog,1,2081,0,0},{agenda_prog,1,2082,0,0},{agenda_prog,1,2083,0,0},{agenda_prog,1,2084,0,0},{agenda_prog,1,2085,0,0},{agenda_prog,1,2086,0,0},{agenda_prog,1,2087,0,0},{agenda_prog,1,2088,0,0},{agenda_prog,1,2089,0,0},{agenda_prog,1,2090,0,0},{agenda_prog,1,2091,0,0},{agenda_prog,1,2092,0,0},{agenda_prog,1,2093,0,0},{agenda_prog,1,2094,0,0},{agenda_prog,1,2095,0,0},{agenda_prog,1,2096,0,0},{agenda_prog,1,2097,0,0},{agenda_prog,1,2098,0,0},{agenda_prog,1,2099,0,0},{agenda_prog,1,2100,0,0},{agenda_prog,1,2101,0,0},{agenda_prog,1,2102,0,0},{agenda_prog,1,2103,0,0},{agenda_prog,1,2104,0,0},{agenda_prog,1,2105,0,0},{agenda_prog,1,2106,0,0},{agenda_prog,1,2107,0,0},{agenda_prog,1,2108,0,0},{agenda_prog,1,2109,0,0},{agenda_prog,1,2110,0,0},{agenda_prog,1,2111,0,0},{agenda_prog,1,2112,0,0},{agenda_prog,1,99,0,0}],50,0,[],1619874262,[1009],1619872924},{m_parade,0,undefined},[{mail,{5,[100,101,118],1},{1,[100,101,118],1},{0,[100,101,118],1},0,[],0,[],1,1,0,<<228,188,154,233,149,191,231,164,188,229,140,133>>,<<231,148,177,228,186,142,232,131,140,229,140,133,229,183,178,230,187,161,44,230,130,168,229,136,155,229,187,186,229,133,172,228,188,154,231,154,132,231,164,188,229,140,133,233,128,154,232,191,135,233,130,174,228,187,182,229,143,145,233,128,129,44,232,175,183,230,159,165,230,148,182>>,[{item,0,0,70053,1,0,111,1,3,0,-1,0,0,0,1,0,0,0,[],[],1,0,2,[],[]}],0,1619874505,1619874505,1619874632},{mail,{4,[100,101,118],1},{1,[100,101,118],1},{0,[100,101,118],1},0,[],0,[],1,1,0,<<232,180,173,228,185,176,231,173,137,231,186,167,231,164,188,229,140,133>>,<<232,180,173,228,185,176,231,173,137,231,186,167,231,164,188,229,140,133,230,151,182,239,188,140,232,131,140,229,140,133,229,183,178,230,187,161>>,[{item,0,0,20401,1,0,0,0,3,0,-1,0,0,0,1,0,0,0,[],[],1,0,2,[],[]},{item,0,0,20405,1,0,0,0,4,0,-1,0,0,0,2,0,0,0,[],[],1,0,2,[],[]},{item,0,0,22311,1,0,111,1,4,0,-1,0,0,0,5,0,0,0,[],[],90,0,2,[],[]},{item,0,0,22306,1,0,111,1,3,0,-1,0,0,0,8,0,0,0,[],[],75,0,2,[],[]},{item,0,0,20022,1,0,0,0,3,0,-1,0,0,0,10,0,0,0,[],[],1,0,2,[],[]}],0,1619874498,1619874498,1619874633},{mail,{3,[100,101,118],1},{1,[100,101,118],1},{0,[100,101,118],1},0,[],0,[],1,1,0,<<232,180,173,228,185,176,231,173,137,231,186,167,231,164,188,229,140,133>>,<<232,180,173,228,185,176,231,173,137,231,186,167,231,164,188,229,140,133,230,151,182,239,188,140,232,131,140,229,140,133,229,183,178,230,187,161>>,[{item,0,0,20114,1,0,100,0,3,0,-1,0,0,0,1,0,0,0,[],[],1,0,2,[],[]},{item,0,0,20022,1,0,0,0,3,0,-1,0,0,0,10,0,0,0,[],[],1,0,2,[],[]},{item,0,0,22556,1,0,111,1,3,0,-1,0,0,0,5,0,0,0,[],[],80,0,2,[],[]},{item,0,0,22306,1,0,111,1,3,0,-1,0,0,0,5,0,0,0,[],[],75,0,2,[],[]},{item,0,0,20006,1,0,0,0,2,0,-1,0,0,0,200,0,0,0,[],[],5,0,2,[],[]}],0,1619874497,1619874497,1619874634}],{m_qualifying,1000,0,0,0,0,[],0,0,0},{m_treasure,0,{treasure_reward,0,0,0,0,[]},{treasure_compass,0,0,0,0,0,0},0},{m_campaign,27,[{1001,1619873044,2400}],[{1001,1619873044,1}],[],{campaign_eggs,0,0,[],0,0,[]},{campaign_bags,0,[],0,0},[],{camp_login,0,0,0,[],[]},{camp_hide_seek,0,0,[],0,[]},{camp_login_roll,0,0,[],[],0,0,0},{camp_series_recharge,1,{2021,5,1},0,[{1,0}],0,0,0,0},{campaign_card,0,0,0,0,[]},0,[],{campaign_card_open,0,0,0,0,[]},{camp_series_recharge,1,0,0,[],0,0,0,0},{camp_wish_flower,1,1,0,0,0},{camp_doll,3,0,1,0,[{camp_doll_data,4,0,1,[]},{camp_doll_data,7,0,1,[]},{camp_doll_data,8,0,1,[]},{camp_doll_data,3,0,1,[]},{camp_doll_data,2,0,1,[]},{camp_doll_data,5,0,1,[]},{camp_doll_data,6,0,1,[]},{camp_doll_data,1,0,1,[]}],0,[],0,0,[]},{camp_sign,{0,0,0},0,0},{camp_exchange,0,0,[],0},{m_animal_chess,1,0,0},{camp_new_flop,1,0,0,[],0},25,{camp_consume_rebate,1,[]},{m_black_white_chess,1,0,0,1},{m_camp_scratch_card,0,[],[]},{camp_new_acc_charge,1,0,[]},{camp_charge_seven_gift,1,0,0,[]},{camp_lucky_tree,0,0,[],[]},{camp_long_active,1,0,0,[],[],0,0},{camp_gift_custom,1,0,[],[],0}},{m_shipping,1,0},{m_checkin,3,[{{2021,5,1},1,1}],{checkin_everyday,3,0,{0,0,0},0,[{{2021,5,1},0}],0,0,0,[],0},[]},{m_tower,[],[]},{m_classes_challenge,2,0,0,[],[],0,0,[],0,[]},{m_fairyland,0,[],[],0,0,[],0,[]},{m_glory,2,0,18,0,60,0,0,60,0,1619872924,0,[],0,0},{m_examination,1,0,0,0,0,0,[],[],0,0,0,[],[]},{m_adm,0},{m_alchemy,0,[{alchemy_shop,1,1,2,[],1},{alchemy_shop,1,2,2,[],1},{alchemy_shop,1,3,2,[],1},{alchemy_shop,1,4,2,[],1}]},{m_pet_store,1,1,[],4},{m_store,1619960400,[{s_item,20095,22,1,0,90002,119,1},{s_item,20064,3,1,0,90002,99,0},{s_item,20006,36,10,0,90003,910,0},{s_item,20066,27,1,0,90003,7600,0},{s_item,21100,17,1,0,90002,67,0},{s_item,20038,21,1,0,90002,237,0},{s_item,20062,1,1,0,90002,102,0},{s_item,20014,28,1,0,90003,22513,0},{s_item,20053,9,1,0,90002,213,0},{s_item,20616,15,1,0,90002,308,0},{s_item,20617,16,1,0,90002,1269,0}]},{m_achievement,3,391,[{610406,1619876660},{610405,1619876660},{610404,1619876660},{610403,1619876660},{610402,1619876660},{420106,1619876660},{420104,1619876660},{420102,1619876660},{410110,1619876660},{410108,1619876660},{410106,1619876660},{410104,1619876660},{120226,1619876660},{120225,1619876660},{120224,1619876660},{120223,1619876660},{120222,1619876660},{120206,1619876660},{120205,1619876660},{120204,1619876660},{120203,1619876660},{120202,1619876660},{420107,1619876660},{420105,1619876660},{420103,1619876660},{420101,1619876660},{610401,1619876660},{150104,1619876660},{120221,1619876660},{120201,1619876660},{150103,1619876660},{410102,1619876660},{150102,1619876660},{150101,1619876660},{140240,1619875169},{640331,1619874578},{110108,1619874551},{150133,1619874526},{150132,1619874521},{150131,1619874521},{150130,1619874521},{510201,1619874505},{510101,1619874505},{110107,1619874420},{120103,1619874420},{120102,1619874420},{120101,1619874420},{120003,1619874420},{640520,1619874262},{130261,1619874315},{130250,1619874304},{510231,1619874262},{510230,1619874262},{220521,1619874209},{220520,1619874209},{120002,1619874075},{120001,1619874075},{110106,1619874063},{310110,1619874052},{110105,1619874045},{110104,1619874045},{110103,1619874045},{110102,1619874045},{110101,1619874045},{130104,1619874045},{130103,1619874045},{130102,1619874045},{130101,1619874045}],[{quest,510232,[],1,1,0,0,[{quest_progress,0,evt_gain_guild,0,[],0,{evt_gain_guild,933},20000,10000,[],[],[]}],0,0,0,0},{quest,410112,[],1,1,0,0,[{quest_progress,0,evt_eqm,0,[{eqm_lev_num,90}],0,{evt_eqm,932},8,5,[],[],[]}],0,0,0,0},{quest,640332,[],1,1,0,0,[{quest_progress,0,evt_fashion,3,[],0,{evt_fashion,931},10,1,[],[],[]}],0,0,0,0},{quest,110121,[],1,1,0,0,[{quest_progress,0,evt_lev_break,0,[],0,{evt_lev_break,930},1,0,[],[],[]}],0,0,0,0},{quest,110120,[],1,1,0,0,[{quest_progress,0,evt_lev_break_active,0,[],0,{evt_lev_break_active,929},1,0,[],[],[]}],0,0,0,0},{quest,110109,[],1,1,0,0,[{quest_progress,0,evt_levup,0,[],0,{evt_levup,928},101,100,[],[],[]}],0,0,0,0},{quest,640660,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,73020,[],0,{evt_kill_npc,927},1,0,[],[],[]}],0,0,0,0},{quest,220522,[],1,1,0,0,[{quest_progress,0,evt_pet_lev,100,[],0,{evt_pet_lev,926},1,0,[],[],[]}],0,0,0,0},{quest,631354,[],1,1,0,0,[{quest_progress,0,evt_oracle_treasure_boss_times,0,[],0,{evt_oracle_treasure_boss_times,925},5,0,[],[],[]}],0,0,0,0},{quest,631351,[],1,1,0,0,[{quest_progress,0,evt_oracle_treasure_boss_wave,1,[],0,{evt_oracle_treasure_boss_wave,924},1,0,[],[],[]}],0,0,0,0},{quest,631350,[],1,1,0,0,[{quest_progress,0,evt_oracle_treasure_offer_star,1,[],0,{evt_oracle_treasure_offer_star,923},1,0,[],[],[]}],0,0,0,0},{quest,420111,[],1,1,0,0,[{quest_progress,0,evt_enchant,15,[],0,{evt_enchant,922},8,0,[],[],[]}],0,0,0,0},{quest,630377,[],1,1,0,0,[{quest_progress,0,evt_constellation,77008,[{lev,14}],0,{evt_constellation,921},14,0,[],[],[]}],0,0,0,0},{quest,630376,[],1,1,0,0,[{quest_progress,0,evt_constellation,77011,[{lev,14}],0,{evt_constellation,920},14,0,[],[],[]}],0,0,0,0},{quest,630375,[],1,1,0,0,[{quest_progress,0,evt_constellation,77009,[{lev,14}],0,{evt_constellation,919},14,0,[],[],[]}],0,0,0,0},{quest,630374,[],1,1,0,0,[{quest_progress,0,evt_constellation,77005,[{lev,14}],0,{evt_constellation,918},14,0,[],[],[]}],0,0,0,0},{quest,630373,[],1,1,0,0,[{quest_progress,0,evt_constellation,77003,[{lev,14}],0,{evt_constellation,917},14,0,[],[],[]}],0,0,0,0},{quest,630372,[],1,1,0,0,[{quest_progress,0,evt_constellation,77002,[{lev,14}],0,{evt_constellation,916},14,0,[],[],[]}],0,0,0,0},{quest,630371,[],1,1,0,0,[{quest_progress,0,evt_constellation,77001,[{lev,14}],0,{evt_constellation,915},14,0,[],[],[]}],0,0,0,0},{quest,661192,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,85040,[],0,{evt_kill_npc,914},5,0,[],[],[]}],0,0,0,0},{quest,661191,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,85020,[],0,{evt_kill_npc,913},5,0,[],[],[]}],0,0,0,0},{quest,661190,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,85001,[],0,{evt_kill_npc,912},5,0,[],[],[]}],0,0,0,0},{quest,120256,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,911},100,0,[],[],[]}],0,0,0,0},{quest,120228,[],1,1,0,0,[{quest_progress,0,evt_skill_prac_levup,0,[{lev,22}],0,{evt_skill_prac_levup,910},6,0,[],[],[]}],0,0,0,0},{quest,620167,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71007,[],0,{evt_boss_first,909},1,0,[],[],[]}],0,0,0,0},{quest,620166,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71006,[],0,{evt_boss_first,908},1,0,[],[],[]}],0,0,0,0},{quest,620165,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71005,[],0,{evt_boss_first,907},1,0,[],[],[]}],0,0,0,0},{quest,420110,[],1,1,0,0,[{quest_progress,0,evt_enchant,14,[],0,{evt_enchant,906},8,0,[],[],[]}],0,0,0,0},{quest,661046,[],1,1,0,0,[{quest_progress,0,evt_mount_dye_diff,0,[{dye_id,2023}],0,{evt_mount_dye_diff,905},3,0,[],[],[]}],0,0,0,0},{quest,661045,[],1,1,0,0,[{quest_progress,0,evt_mount_dye_diff,1,[{dye_id,2023}],0,{evt_mount_dye_diff,904},1,0,[],[],[]}],0,0,0,0},{quest,310111,[],1,1,0,0,[{quest_progress,0,evt_guard,0,[],0,{evt_guard,903},5,4,[],[],[]}],0,0,0,0},{quest,310103,[],1,1,0,0,[{quest_progress,0,evt_guard,1021,[],0,{evt_guard,902},1,0,[],[],[]}],0,0,0,0},{quest,640651,[],1,1,0,0,[{quest_progress,0,evt_mount_lev,0,[],0,{evt_mount_lev,901},15,0,[],[],[]}],0,0,0,0},{quest,640641,[],1,1,0,0,[{quest_progress,0,evt_mount_appearand,0,[],0,{evt_mount_appearand,900},1,0,[],[],[]}],0,0,0,0},{quest,640631,[],1,1,0,0,[{quest_progress,0,evt_mount_mange_pet,0,[],0,{evt_mount_mange_pet,899},1,0,[],[],[]}],0,0,0,0},{quest,640621,[],1,1,0,0,[{quest_progress,0,evt_mount_growth,0,[],0,{evt_mount_growth,898},6,0,[],[],[]}],0,0,0,0},{quest,640611,[],1,1,0,0,[{quest_progress,0,evt_own_mount,3,[],0,{evt_own_mount,897},1,0,[],[],[]}],0,0,0,0},{quest,640530,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,896},5200,201,[],[],[]}],0,0,0,0},{quest,630379,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[{id,630371}],0,{evt_achievement,889},1,0,[],[],[]},{quest_progress,1,evt_achievement,0,[{id,630372}],0,{evt_achievement,890},1,0,[],[],[]},{quest_progress,2,evt_achievement,0,[{id,630373}],0,{evt_achievement,891},1,0,[],[],[]},{quest_progress,3,evt_achievement,0,[{id,630374}],0,{evt_achievement,892},1,0,[],[],[]},{quest_progress,4,evt_achievement,0,[{id,630375}],0,{evt_achievement,893},1,0,[],[],[]},{quest_progress,5,evt_achievement,0,[{id,630376}],0,{evt_achievement,894},1,0,[],[],[]},{quest_progress,6,evt_achievement,0,[{id,630377}],0,{evt_achievement,895},1,0,[],[],[]}],0,0,0,0},{quest,630378,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[{id,630364}],0,{evt_achievement,882},1,0,[],[],[]},{quest_progress,1,evt_achievement,0,[{id,630365}],0,{evt_achievement,883},1,0,[],[],[]},{quest_progress,2,evt_achievement,0,[{id,630366}],0,{evt_achievement,884},1,0,[],[],[]},{quest_progress,3,evt_achievement,0,[{id,630367}],0,{evt_achievement,885},1,0,[],[],[]},{quest_progress,4,evt_achievement,0,[{id,630368}],0,{evt_achievement,886},1,0,[],[],[]},{quest_progress,5,evt_achievement,0,[{id,630369}],0,{evt_achievement,887},1,0,[],[],[]},{quest_progress,6,evt_achievement,0,[{id,630370}],0,{evt_achievement,888},1,0,[],[],[]}],0,0,0,0},{quest,630370,[],1,1,0,0,[{quest_progress,0,evt_constellation,77008,[{lev,13}],0,{evt_constellation,881},13,0,[],[],[]}],0,0,0,0},{quest,630369,[],1,1,0,0,[{quest_progress,0,evt_constellation,77011,[{lev,13}],0,{evt_constellation,880},13,0,[],[],[]}],0,0,0,0},{quest,630368,[],1,1,0,0,[{quest_progress,0,evt_constellation,77009,[{lev,13}],0,{evt_constellation,879},13,0,[],[],[]}],0,0,0,0},{quest,630367,[],1,1,0,0,[{quest_progress,0,evt_constellation,77005,[{lev,13}],0,{evt_constellation,878},13,0,[],[],[]}],0,0,0,0},{quest,630366,[],1,1,0,0,[{quest_progress,0,evt_constellation,77003,[{lev,13}],0,{evt_constellation,877},13,0,[],[],[]}],0,0,0,0},{quest,630365,[],1,1,0,0,[{quest_progress,0,evt_constellation,77002,[{lev,13}],0,{evt_constellation,876},13,0,[],[],[]}],0,0,0,0},{quest,630364,[],1,1,0,0,[{quest_progress,0,evt_constellation,77001,[{lev,13}],0,{evt_constellation,875},13,0,[],[],[]}],0,0,0,0},{quest,641091,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,874},2500,0,[],[],[]}],0,0,0,0},{quest,641081,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,873},2000,0,[],[],[]}],0,0,0,0},{quest,641071,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,872},1600,0,[],[],[]}],0,0,0,0},{quest,641061,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,871},1200,0,[],[],[]}],0,0,0,0},{quest,641051,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,870},900,0,[],[],[]}],0,0,0,0},{quest,641041,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,869},600,0,[],[],[]}],0,0,0,0},{quest,641031,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,868},380,0,[],[],[]}],0,0,0,0},{quest,641021,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,867},220,0,[],[],[]}],0,0,0,0},{quest,641011,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,866},120,0,[],[],[]}],0,0,0,0},{quest,641001,[],1,1,0,0,[{quest_progress,0,evt_gods_duel_score,0,[],0,{evt_gods_duel_score,865},50,0,[],[],[]}],0,0,0,0},{quest,630405,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,52091,[],0,{evt_kill_npc,864},1,0,[],[],[]}],0,0,0,0},{quest,661246,[],1,1,0,0,[{quest_progress,0,evt_canyon_summit_win,0,[],0,{evt_canyon_summit_win,863},1,0,[],[],[]}],0,0,0,0},{quest,661243,[],1,1,0,0,[{quest_progress,0,evt_canyon_summit_cannon,0,[],0,{evt_canyon_summit_cannon,862},1,0,[],[],[]}],0,0,0,0},{quest,661240,[],1,1,0,0,[{quest_progress,0,evt_canyon_summit_join,0,[],0,{evt_canyon_summit_join,861},1,0,[],[],[]}],0,0,0,0},{quest,661088,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,241,[],0,{evt_kingbadge,860},1,0,[],[],[]}],0,0,0,0},{quest,661087,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,240,[],0,{evt_kingbadge,859},1,0,[],[],[]}],0,0,0,0},{quest,661086,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,239,[],0,{evt_kingbadge,858},1,0,[],[],[]}],0,0,0,0},{quest,661085,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,238,[],0,{evt_kingbadge,857},1,0,[],[],[]}],0,0,0,0},{quest,661084,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,237,[],0,{evt_kingbadge,856},1,0,[],[],[]}],0,0,0,0},{quest,661083,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,236,[],0,{evt_kingbadge,855},1,0,[],[],[]}],0,0,0,0},{quest,661082,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,235,[],0,{evt_kingbadge,854},1,0,[],[],[]}],0,0,0,0},{quest,661081,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,234,[],0,{evt_kingbadge,853},1,0,[],[],[]}],0,0,0,0},{quest,661080,[],1,1,0,0,[{quest_progress,0,evt_kingbadge,233,[],0,{evt_kingbadge,852},1,0,[],[],[]}],0,0,0,0},{quest,640529,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,851},4500,201,[],[],[]}],0,0,0,0},{quest,639240,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[awesome_control],0,{evt_tournament,850},1,0,[],[],[]}],0,0,0,0},{quest,639230,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[awesome_heal],0,{evt_tournament,849},1,0,[],[],[]}],0,0,0,0},{quest,639220,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[mvp],0,{evt_tournament,848},1,0,[],[],[]}],0,0,0,0},{quest,639210,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[awesome_kill_num],0,{evt_tournament,847},5,0,[],[],[]}],0,0,0,0},{quest,639200,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[awesome_dmg],0,{evt_tournament,846},3,0,[],[],[]}],0,0,0,0},{quest,639190,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[awesome_kill],0,{evt_tournament,845},1,0,[],[],[]}],0,0,0,0},{quest,639180,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[liked],0,{evt_tournament,844},10,0,[],[],[]}],0,0,0,0},{quest,639170,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[win_count],0,{evt_tournament,843},10,0,[],[],[]}],0,0,0,0},{quest,639167,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,842},11,1,[],[],[]}],0,0,0,0},{quest,639166,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,841},10,1,[],[],[]}],0,0,0,0},{quest,639165,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,840},9,1,[],[],[]}],0,0,0,0},{quest,639164,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,839},8,1,[],[],[]}],0,0,0,0},{quest,639163,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,838},7,1,[],[],[]}],0,0,0,0},{quest,639162,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,837},6,1,[],[],[]}],0,0,0,0},{quest,639161,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,836},5,1,[],[],[]}],0,0,0,0},{quest,631132,[],1,1,0,0,[{quest_progress,0,evt_honor,30122,[],0,{evt_honor,835},1,0,[],[],[]}],0,0,0,0},{quest,631131,[],1,1,0,0,[{quest_progress,0,evt_honor,30121,[],0,{evt_honor,834},1,0,[],[],[]}],0,0,0,0},{quest,631130,[],1,1,0,0,[{quest_progress,0,evt_honor,30120,[],0,{evt_honor,833},1,0,[],[],[]}],0,0,0,0},{quest,631120,[],1,1,0,0,[{quest_progress,0,evt_guild_league_win,0,[],0,{evt_guild_league_win,832},1,0,[],[],[]}],0,0,0,0},{quest,631110,[],1,1,0,0,[{quest_progress,0,evt_guild_league_cannon,0,[],0,{evt_guild_league_cannon,831},1,0,[],[],[]}],0,0,0,0},{quest,631100,[],1,1,0,0,[{quest_progress,0,evt_guild_league_join,0,[],0,{evt_guild_league_join,830},1,0,[],[],[]}],0,0,0,0},{quest,630414,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[9],0,{evt_dun_first,829},1,0,[],[],[]}],0,0,0,0},{quest,630413,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[8],0,{evt_dun_first,828},1,0,[],[],[]}],0,0,0,0},{quest,630412,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[7],0,{evt_dun_first,827},1,0,[],[],[]}],0,0,0,0},{quest,630411,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[6],0,{evt_dun_first,826},1,0,[],[],[]}],0,0,0,0},{quest,630410,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[5],0,{evt_dun_first,825},1,0,[],[],[]}],0,0,0,0},{quest,630404,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,52081,[],0,{evt_kill_npc,824},1,0,[],[],[]}],0,0,0,0},{quest,630363,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,14,[],0,{evt_constellation_first,823},1,0,[],[],[]}],0,0,0,0},{quest,620212,[],1,1,0,0,[{quest_progress,0,endless_challenge_card,0,[],0,{endless_challenge_card,822},100,0,[],[],[]}],0,0,0,0},{quest,620211,[],1,1,0,0,[{quest_progress,0,endless_challenge_card,0,[],0,{endless_challenge_card,821},20,0,[],[],[]}],0,0,0,0},{quest,620210,[],1,1,0,0,[{quest_progress,0,endless_challenge_card,0,[],0,{endless_challenge_card,820},5,0,[],[],[]}],0,0,0,0},{quest,620205,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,819},32,0,[],[],[]}],0,0,0,0},{quest,620204,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,818},28,0,[],[],[]}],0,0,0,0},{quest,620203,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,817},24,0,[],[],[]}],0,0,0,0},{quest,620202,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,816},20,0,[],[],[]}],0,0,0,0},{quest,620201,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,815},16,0,[],[],[]}],0,0,0,0},{quest,639160,[],1,1,0,0,[{quest_progress,0,evt_tournament,0,[rank_lev],0,{evt_tournament,814},4,1,[],[],[]}],0,0,0,0},{quest,630409,[],1,1,0,0,[{quest_progress,0,evt_dun_first,10085,[4],0,{evt_dun_first,813},1,0,[],[],[]}],0,0,0,0},{quest,630401,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,52031,[],0,{evt_kill_npc,812},1,0,[],[],[]}],0,0,0,0},{quest,620164,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71004,[],0,{evt_boss_first,811},1,0,[],[],[]}],0,0,0,0},{quest,420109,[],1,1,0,0,[{quest_progress,0,evt_enchant,13,[],0,{evt_enchant,810},8,0,[],[],[]}],0,0,0,0},{quest,420108,[],1,1,1,0,[{quest_progress,0,evt_enchant,12,[],1,{evt_enchant,837},8,8,[],[],[]}],0,0,1619876660,0},{quest,310102,[],1,1,0,0,[{quest_progress,0,evt_guard,1006,[],0,{evt_guard,809},1,0,[],[],[]}],0,0,0,0},{quest,640528,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,808},3800,201,[],[],[]}],0,0,0,0},{quest,631456,[],1,1,0,0,[{quest_progress,0,evt_guild_dragon_rank,1,[{rank,1}],0,{evt_guild_dragon_rank,807},1,0,[],[],[]}],0,0,0,0},{quest,631453,[],1,1,0,0,[{quest_progress,0,evt_guild_dragon_total_point,0,[],0,{evt_guild_dragon_total_point,806},10000,0,[],[],[]}],0,0,0,0},{quest,631450,[],1,1,0,0,[{quest_progress,0,evt_guild_dragon_times,0,[],0,{evt_guild_dragon_times,805},1,0,[],[],[]}],0,0,0,0},{quest,631401,[],1,1,0,0,[{quest_progress,0,evt_exquisite_shelf_wave,6,[],0,{evt_exquisite_shelf_wave,804},1,0,[],[],[]}],0,0,0,0},{quest,631400,[],1,1,0,0,[{quest_progress,0,evt_exquisite_shelf_wave,9,[],0,{evt_exquisite_shelf_wave,803},1,0,[],[],[]}],0,0,0,0},{quest,631308,[],1,1,0,0,[{quest_progress,0,evt_spirit_treasure_boss_wave,3,[],0,{evt_spirit_treasure_boss_wave,802},30,0,[],[],[]}],0,0,0,0},{quest,631304,[],1,1,0,0,[{quest_progress,0,evt_spirit_treasure_offer_star,5,[],0,{evt_spirit_treasure_offer_star,801},1,0,[],[],[]}],0,0,0,0},{quest,631303,[],1,1,0,0,[{quest_progress,0,evt_spirit_treasure_offer_star,3,[],0,{evt_spirit_treasure_offer_star,800},1,0,[],[],[]}],0,0,0,0},{quest,631302,[],1,1,0,0,[{quest_progress,0,evt_spirit_treasure_first_kill,0,[],0,{evt_spirit_treasure_first_kill,799},1,0,[],[],[]}],0,0,0,0},{quest,631300,[],1,1,0,0,[{quest_progress,0,evt_spirit_treasure_offer_star,1,[],0,{evt_spirit_treasure_offer_star,798},1,0,[],[],[]}],0,0,0,0},{quest,620200,[],1,1,0,0,[{quest_progress,0,endless_challenge_cross,0,[],0,{endless_challenge_cross,797},12,0,[],[],[]}],0,0,0,0},{quest,630322,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,796},12,0,[],[],[]}],0,0,0,0},{quest,661219,[],1,1,0,0,[{quest_progress,0,evt_stars_trial_combat,0,[after_die_done],0,{evt_stars_trial_combat,795},1,0,[],[],[]}],0,0,0,0},{quest,661218,[],1,1,0,0,[{quest_progress,0,evt_stars_trial_combat,15,[die_times],0,{evt_stars_trial_combat,794},1,0,[],[],[]}],0,0,0,0},{quest,661217,[],1,1,0,0,[{quest_progress,0,evt_stars_trial_combat,5,[{use_skill,120001}],0,{evt_stars_trial_combat,793},1,0,[],[],[]}],0,0,0,0},{quest,661216,[],1,1,0,0,[{quest_progress,0,evt_stars_trial_combat_round,5,[{kill_npc,[82501,82502,82503,82504,82505,82506,82507,82508,82509,82510,82511,82512,82513,82514,82515,82516,82517,82518]}],0,{evt_stars_trial_combat_round,792},1,0,[],[],[]}],0,0,0,0},{quest,661215,[],1,1,0,0,[{quest_progress,0,evt_stars_trial_combat_round,5,[{kill_npc,[82001,82002,82003,82004,82005,82006,82007,82008,82009,82010,82011,82012,82013,82014,82015,82016,82017,82018,82019,82020,82021,82022,82023,82024,82025,82026,82027,82028,82029,82030,82031,82032,82033,82034,82035,82036,82037,82038,82039,82040,82041,82042,82043,82044,82045,82046,82047,82048,82049]}],0,{evt_stars_trial_combat_round,791},1,0,[],[],[]}],0,0,0,0},{quest,661214,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,1,[combat_formation],0,{evt_stars_trial,790},1,0,[],[],[]}],0,0,0,0},{quest,661213,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,0,[pet_summon],0,{evt_stars_trial,789},1,0,[],[],[]}],0,0,0,0},{quest,661212,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,5,[self_die],0,{evt_stars_trial,788},1,0,[],[],[]}],0,0,0,0},{quest,661211,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,0,[use_item],0,{evt_stars_trial,787},1,0,[],[],[]}],0,0,0,0},{quest,661210,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,10,[round],0,{evt_stars_trial,786},1,0,[],[],[]}],0,0,0,0},{quest,661209,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82001,[],0,{evt_stars_trial,737},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82002,[],0,{evt_stars_trial,738},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82003,[],0,{evt_stars_trial,739},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82004,[],0,{evt_stars_trial,740},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82005,[],0,{evt_stars_trial,741},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82006,[],0,{evt_stars_trial,742},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82007,[],0,{evt_stars_trial,743},1,0,[],[],[]},{quest_progress,7,evt_stars_trial,82008,[],0,{evt_stars_trial,744},1,0,[],[],[]},{quest_progress,8,evt_stars_trial,82009,[],0,{evt_stars_trial,745},1,0,[],[],[]},{quest_progress,9,evt_stars_trial,82010,[],0,{evt_stars_trial,746},1,0,[],[],[]},{quest_progress,10,evt_stars_trial,82011,[],0,{evt_stars_trial,747},1,0,[],[],[]},{quest_progress,11,evt_stars_trial,82012,[],0,{evt_stars_trial,748},1,0,[],[],[]},{quest_progress,12,evt_stars_trial,82013,[],0,{evt_stars_trial,749},1,0,[],[],[]},{quest_progress,13,evt_stars_trial,82014,[],0,{evt_stars_trial,750},1,0,[],[],[]},{quest_progress,14,evt_stars_trial,82015,[],0,{evt_stars_trial,751},1,0,[],[],[]},{quest_progress,15,evt_stars_trial,82016,[],0,{evt_stars_trial,752},1,0,[],[],[]},{quest_progress,16,evt_stars_trial,82017,[],0,{evt_stars_trial,753},1,0,[],[],[]},{quest_progress,17,evt_stars_trial,82018,[],0,{evt_stars_trial,754},1,0,[],[],[]},{quest_progress,18,evt_stars_trial,82019,[],0,{evt_stars_trial,755},1,0,[],[],[]},{quest_progress,19,evt_stars_trial,82020,[],0,{evt_stars_trial,756},1,0,[],[],[]},{quest_progress,20,evt_stars_trial,82021,[],0,{evt_stars_trial,757},1,0,[],[],[]},{quest_progress,21,evt_stars_trial,82022,[],0,{evt_stars_trial,758},1,0,[],[],[]},{quest_progress,22,evt_stars_trial,82023,[],0,{evt_stars_trial,759},1,0,[],[],[]},{quest_progress,23,evt_stars_trial,82024,[],0,{evt_stars_trial,760},1,0,[],[],[]},{quest_progress,24,evt_stars_trial,82025,[],0,{evt_stars_trial,761},1,0,[],[],[]},{quest_progress,25,evt_stars_trial,82026,[],0,{evt_stars_trial,762},1,0,[],[],[]},{quest_progress,26,evt_stars_trial,82027,[],0,{evt_stars_trial,763},1,0,[],[],[]},{quest_progress,27,evt_stars_trial,82028,[],0,{evt_stars_trial,764},1,0,[],[],[]},{quest_progress,28,evt_stars_trial,82029,[],0,{evt_stars_trial,765},1,0,[],[],[]},{quest_progress,29,evt_stars_trial,82030,[],0,{evt_stars_trial,766},1,0,[],[],[]},{quest_progress,30,evt_stars_trial,82031,[],0,{evt_stars_trial,767},1,0,[],[],[]},{quest_progress,31,evt_stars_trial,82032,[],0,{evt_stars_trial,768},1,0,[],[],[]},{quest_progress,32,evt_stars_trial,82033,[],0,{evt_stars_trial,769},1,0,[],[],[]},{quest_progress,33,evt_stars_trial,82034,[],0,{evt_stars_trial,770},1,0,[],[],[]},{quest_progress,34,evt_stars_trial,82035,[],0,{evt_stars_trial,771},1,0,[],[],[]},{quest_progress,35,evt_stars_trial,82036,[],0,{evt_stars_trial,772},1,0,[],[],[]},{quest_progress,36,evt_stars_trial,82037,[],0,{evt_stars_trial,773},1,0,[],[],[]},{quest_progress,37,evt_stars_trial,82038,[],0,{evt_stars_trial,774},1,0,[],[],[]},{quest_progress,38,evt_stars_trial,82039,[],0,{evt_stars_trial,775},1,0,[],[],[]},{quest_progress,39,evt_stars_trial,82040,[],0,{evt_stars_trial,776},1,0,[],[],[]},{quest_progress,40,evt_stars_trial,82041,[],0,{evt_stars_trial,777},1,0,[],[],[]},{quest_progress,41,evt_stars_trial,82042,[],0,{evt_stars_trial,778},1,0,[],[],[]},{quest_progress,42,evt_stars_trial,82043,[],0,{evt_stars_trial,779},1,0,[],[],[]},{quest_progress,43,evt_stars_trial,82044,[],0,{evt_stars_trial,780},1,0,[],[],[]},{quest_progress,44,evt_stars_trial,82045,[],0,{evt_stars_trial,781},1,0,[],[],[]},{quest_progress,45,evt_stars_trial,82046,[],0,{evt_stars_trial,782},1,0,[],[],[]},{quest_progress,46,evt_stars_trial,82047,[],0,{evt_stars_trial,783},1,0,[],[],[]},{quest_progress,47,evt_stars_trial,82048,[],0,{evt_stars_trial,784},1,0,[],[],[]},{quest_progress,48,evt_stars_trial,82049,[],0,{evt_stars_trial,785},1,0,[],[],[]}],0,0,0,0},{quest,661208,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82043,[],0,{evt_stars_trial,730},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82044,[],0,{evt_stars_trial,731},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82045,[],0,{evt_stars_trial,732},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82046,[],0,{evt_stars_trial,733},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82047,[],0,{evt_stars_trial,734},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82048,[],0,{evt_stars_trial,735},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82049,[],0,{evt_stars_trial,736},1,0,[],[],[]}],0,0,0,0},{quest,661207,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82036,[],0,{evt_stars_trial,723},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82037,[],0,{evt_stars_trial,724},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82038,[],0,{evt_stars_trial,725},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82039,[],0,{evt_stars_trial,726},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82040,[],0,{evt_stars_trial,727},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82041,[],0,{evt_stars_trial,728},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82042,[],0,{evt_stars_trial,729},1,0,[],[],[]}],0,0,0,0},{quest,661206,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82029,[],0,{evt_stars_trial,716},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82030,[],0,{evt_stars_trial,717},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82031,[],0,{evt_stars_trial,718},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82032,[],0,{evt_stars_trial,719},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82033,[],0,{evt_stars_trial,720},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82034,[],0,{evt_stars_trial,721},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82035,[],0,{evt_stars_trial,722},1,0,[],[],[]}],0,0,0,0},{quest,661205,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82022,[],0,{evt_stars_trial,709},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82023,[],0,{evt_stars_trial,710},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82024,[],0,{evt_stars_trial,711},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82025,[],0,{evt_stars_trial,712},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82026,[],0,{evt_stars_trial,713},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82027,[],0,{evt_stars_trial,714},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82028,[],0,{evt_stars_trial,715},1,0,[],[],[]}],0,0,0,0},{quest,661204,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82015,[],0,{evt_stars_trial,702},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82016,[],0,{evt_stars_trial,703},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82017,[],0,{evt_stars_trial,704},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82018,[],0,{evt_stars_trial,705},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82019,[],0,{evt_stars_trial,706},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82020,[],0,{evt_stars_trial,707},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82021,[],0,{evt_stars_trial,708},1,0,[],[],[]}],0,0,0,0},{quest,661203,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82008,[],0,{evt_stars_trial,695},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82009,[],0,{evt_stars_trial,696},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82010,[],0,{evt_stars_trial,697},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82011,[],0,{evt_stars_trial,698},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82012,[],0,{evt_stars_trial,699},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82013,[],0,{evt_stars_trial,700},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82014,[],0,{evt_stars_trial,701},1,0,[],[],[]}],0,0,0,0},{quest,661202,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,82001,[],0,{evt_stars_trial,688},1,0,[],[],[]},{quest_progress,1,evt_stars_trial,82002,[],0,{evt_stars_trial,689},1,0,[],[],[]},{quest_progress,2,evt_stars_trial,82003,[],0,{evt_stars_trial,690},1,0,[],[],[]},{quest_progress,3,evt_stars_trial,82004,[],0,{evt_stars_trial,691},1,0,[],[],[]},{quest_progress,4,evt_stars_trial,82005,[],0,{evt_stars_trial,692},1,0,[],[],[]},{quest_progress,5,evt_stars_trial,82006,[],0,{evt_stars_trial,693},1,0,[],[],[]},{quest_progress,6,evt_stars_trial,82007,[],0,{evt_stars_trial,694},1,0,[],[],[]}],0,0,0,0},{quest,661201,[],1,1,0,0,[{quest_progress,0,evt_stars_trial,0,[],0,{evt_stars_trial,687},1,0,[],[],[]}],0,0,0,0},{quest,651010,[],1,1,0,0,[{quest_progress,0,evt_guild_siege_combat,0,[win],0,{evt_guild_siege_combat,686},1,0,[],[],[]}],0,0,0,0},{quest,651001,[],1,1,0,0,[{quest_progress,0,evt_guild_siege_combat,0,[star],0,{evt_guild_siege_combat,685},10,0,[],[],[]}],0,0,0,0},{quest,640527,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,684},3200,201,[],[],[]}],0,0,0,0},{quest,640320,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21388,[],0,{evt_use_fruit_limit,679},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21389,[],0,{evt_use_fruit_limit,680},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21390,[],0,{evt_use_fruit_limit,681},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21391,[],0,{evt_use_fruit_limit,682},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21392,[],0,{evt_use_fruit_limit,683},1,0,[],[],[]}],0,0,0,0},{quest,630362,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,13,[],0,{evt_constellation_first,678},1,0,[],[],[]}],0,0,0,0},{quest,630361,[],1,1,0,0,[{quest_progress,0,evt_constellation,77008,[{lev,12}],0,{evt_constellation,677},12,0,[],[],[]}],0,0,0,0},{quest,630358,[],1,1,0,0,[{quest_progress,0,evt_constellation,77011,[{lev,12}],0,{evt_constellation,676},12,0,[],[],[]}],0,0,0,0},{quest,630355,[],1,1,0,0,[{quest_progress,0,evt_constellation,77009,[{lev,12}],0,{evt_constellation,675},12,0,[],[],[]}],0,0,0,0},{quest,630352,[],1,1,0,0,[{quest_progress,0,evt_constellation,77005,[{lev,12}],0,{evt_constellation,674},12,0,[],[],[]}],0,0,0,0},{quest,630349,[],1,1,0,0,[{quest_progress,0,evt_constellation,77003,[{lev,12}],0,{evt_constellation,673},12,0,[],[],[]}],0,0,0,0},{quest,630346,[],1,1,0,0,[{quest_progress,0,evt_constellation,77002,[{lev,12}],0,{evt_constellation,672},12,0,[],[],[]}],0,0,0,0},{quest,630343,[],1,1,0,0,[{quest_progress,0,evt_constellation,77001,[{lev,12}],0,{evt_constellation,671},12,0,[],[],[]}],0,0,0,0},{quest,240061,[],1,1,0,0,[{quest_progress,0,evt_child_eat,0,[23830,23831],0,{evt_child_eat,670},10,0,[],[],[]}],0,0,0,0},{quest,240051,[],1,1,0,0,[{quest_progress,0,evt_child_info,0,[talent_skill_sum_lev],0,{evt_child_info,669},8,0,[],[],[]}],0,0,0,0},{quest,240041,[],1,1,0,0,[{quest_progress,0,evt_child_info,0,[talent_skill_max_lev],0,{evt_child_info,668},5,0,[],[],[]}],0,0,0,0},{quest,240031,[],1,1,0,0,[{quest_progress,0,evt_child_info,0,[skill_num],0,{evt_child_info,667},9,0,[],[],[]}],0,0,0,0},{quest,240021,[],1,1,0,0,[{quest_progress,0,evt_child_info,0,[{growth_num,5}],0,{evt_child_info,666},1,0,[],[],[]}],0,0,0,0},{quest,240011,[],1,1,0,0,[{quest_progress,0,evt_child_grow,3,[],0,{evt_child_grow,665},1,0,[],[],[]}],0,0,0,0},{quest,240001,[],1,1,0,0,[{quest_progress,0,evt_child_deliver,0,[],0,{evt_child_deliver,664},1,0,[],[],[]}],0,0,0,0},{quest,620163,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71003,[],0,{evt_boss_first,663},1,0,[],[],[]}],0,0,0,0},{quest,430105,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,10,[],0,{evt_blacksmith_embed_lev,662},16,0,[],[],[]}],0,0,0,0},{quest,330125,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,600,[{guard,4}],0,{evt_combat_statistics,661},1,0,[],[],[]}],0,0,0,0},{quest,620153,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,71003,[],0,{evt_kill_npc,660},200,0,[],[],[]}],0,0,0,0},{quest,620103,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,3}],0,{evt_commit_quest,659},10000,0,[],[],[]}],0,0,0,0},{quest,310101,[],1,1,0,0,[{quest_progress,0,evt_guard,1013,[],0,{evt_guard,658},1,0,[],[],[]}],0,0,0,0},{quest,640050,[],1,1,0,0,[{quest_progress,0,evt_provocation_5v5,0,[],0,{evt_provocation_5v5,657},1,0,[],[],[]}],0,0,0,0},{quest,630340,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,12,[],0,{evt_constellation_first,656},1,0,[],[],[]}],0,0,0,0},{quest,110131,[],1,1,0,0,[{quest_progress,0,evt_classes_modify_times,0,[],0,{evt_classes_modify_times,655},1,0,[],[],[]}],0,0,0,0},{quest,630339,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,11,[],0,{evt_constellation_first,654},1,0,[],[],[]}],0,0,0,0},{quest,630120,[],1,1,0,0,[{quest_progress,0,evt_warrior_fight,1,[],0,{evt_warrior_fight,653},500,0,[],[],[]}],0,0,0,0},{quest,610213,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,652},300,0,[],[],[]}],0,0,0,0},{quest,630338,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,10,[],0,{evt_constellation_first,651},1,0,[],[],[]}],0,0,0,0},{quest,540340,[],1,1,0,0,[{quest_progress,0,evt_family_env,0,[],0,{evt_family_env,650},666,0,[],[],[]}],0,0,0,0},{quest,540335,[],1,1,0,0,[{quest_progress,0,evt_family_help_magic_beans,0,[],0,{evt_family_help_magic_beans,649},20,0,[],[],[]}],0,0,0,0},{quest,540332,[],1,1,0,0,[{quest_progress,0,evt_family_self_magic_beans,0,[],0,{evt_family_self_magic_beans,648},20,0,[],[],[]}],0,0,0,0},{quest,540325,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,647},7,0,[],[],[]}],0,0,0,0},{quest,540324,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,646},6,0,[],[],[]}],0,0,0,0},{quest,540323,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,645},5,0,[],[],[]}],0,0,0,0},{quest,540322,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,644},4,0,[],[],[]}],0,0,0,0},{quest,540321,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,643},3,0,[],[],[]}],0,0,0,0},{quest,540320,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,642},2,0,[],[],[]}],0,0,0,0},{quest,540319,[],1,1,0,0,[{quest_progress,0,evt_family,0,[],0,{evt_family,641},1,0,[],[],[]}],0,0,0,0},{quest,540316,[],1,1,0,0,[{quest_progress,0,evt_family_furnishing,14,[],0,{evt_family_furnishing,640},2,0,[],[],[]}],0,0,0,0},{quest,540313,[],1,1,0,0,[{quest_progress,0,evt_family_furnishing,1,[],0,{evt_family_furnishing,639},8,0,[],[],[]}],0,0,0,0},{quest,540310,[],1,1,0,0,[{quest_progress,0,evt_family_furnishing,8,[],0,{evt_family_furnishing,638},5,0,[],[],[]}],0,0,0,0},{quest,520323,[],1,1,0,0,[{quest_progress,0,evt_teacher_score_sum,0,[],0,{evt_teacher_score_sum,637},9000,0,[],[],[]}],0,0,0,0},{quest,630337,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,9,[],0,{evt_constellation_first,636},1,0,[],[],[]}],0,0,0,0},{quest,610310,[],1,1,0,0,[{quest_progress,0,evt_commit_quest_chain,1,[],0,{evt_commit_quest_chain,635},2000,0,[],[],[]}],0,0,0,0},{quest,540307,[],1,1,0,0,[{quest_progress,0,evt_family_furnishing,6,[],0,{evt_family_furnishing,634},5,0,[],[],[]}],0,0,0,0},{quest,540304,[],1,1,0,0,[{quest_progress,0,evt_family_furnishing,0,[],0,{evt_family_furnishing,633},55,0,[],[],[]}],0,0,0,0},{quest,520322,[],1,1,0,0,[{quest_progress,0,evt_teacher_score_sum,0,[],0,{evt_teacher_score_sum,632},3000,0,[],[],[]}],0,0,0,0},{quest,420203,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_enchant,0,[fail],0,{evt_blacksmith_enchant,631},1000,0,[],[],[]}],0,0,0,0},{quest,640526,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,630},2000,201,[],[],[]}],0,0,0,0},{quest,630336,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,8,[],0,{evt_constellation_first,629},1,0,[],[],[]}],0,0,0,0},{quest,630321,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,628},9,0,[],[],[]}],0,0,0,0},{quest,610605,[],1,1,0,0,[{quest_progress,0,evt_treasure_compass,0,[],0,{evt_treasure_compass,627},50,0,[],[],[]}],0,0,0,0},{quest,610320,[],1,1,0,0,[{quest_progress,0,evt_commit_quest_chain,4,[],0,{evt_commit_quest_chain,626},500,0,[],[],[]}],0,0,0,0},{quest,540303,[],1,1,0,0,[{quest_progress,0,evt_family_update,4,[],0,{evt_family_update,625},5,0,[],[],[]}],0,0,0,0},{quest,540302,[],1,1,0,0,[{quest_progress,0,evt_family_update,3,[],0,{evt_family_update,624},5,0,[],[],[]}],0,0,0,0},{quest,540301,[],1,1,0,0,[{quest_progress,0,evt_family_update,2,[],0,{evt_family_update,623},5,0,[],[],[]}],0,0,0,0},{quest,540300,[],1,1,0,0,[{quest_progress,0,evt_family_update,1,[],0,{evt_family_update,622},5,0,[],[],[]}],0,0,0,0},{quest,520321,[],1,1,0,0,[{quest_progress,0,evt_teacher_score_sum,0,[],0,{evt_teacher_score_sum,621},800,0,[],[],[]}],0,0,0,0},{quest,420202,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_enchant,0,[fail],0,{evt_blacksmith_enchant,620},100,0,[],[],[]}],0,0,0,0},{quest,661230,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_lose_remain_one_color,0,[],0,{evt_black_white_chess_lose_remain_one_color,619},1,0,[],[],[]}],0,0,0,0},{quest,661229,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_win_remain_one_color,0,[],0,{evt_black_white_chess_win_remain_one_color,618},1,0,[],[],[]}],0,0,0,0},{quest,661228,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_more_than_ops_chess,30,[],0,{evt_black_white_chess_more_than_ops_chess,617},1,0,[],[],[]}],0,0,0,0},{quest,661227,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_more_than_ops_chess,64,[],0,{evt_black_white_chess_more_than_ops_chess,616},1,0,[],[],[]}],0,0,0,0},{quest,661226,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_draw_whitout_ask_draw,0,[],0,{evt_black_white_chess_draw_whitout_ask_draw,615},1,0,[],[],[]}],0,0,0,0},{quest,661225,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_lose,0,[],0,{evt_black_white_chess_lose,614},130,0,[],[],[]}],0,0,0,0},{quest,661223,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_win,0,[],0,{evt_black_white_chess_win,613},50,0,[],[],[]}],0,0,0,0},{quest,661220,[],1,1,0,0,[{quest_progress,0,evt_black_white_chess_change_in_round,5,[],0,{evt_black_white_chess_change_in_round,612},1,0,[],[],[]}],0,0,0,0},{quest,661071,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_kill_coach,0,[],0,{evt_animal_chess_kill_coach,611},10,0,[],[],[]}],0,0,0,0},{quest,661070,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_coach_killed,0,[],0,{evt_animal_chess_coach_killed,610},10,0,[],[],[]}],0,0,0,0},{quest,661067,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_kill_soldier,0,[],0,{evt_animal_chess_kill_soldier,609},10,0,[],[],[]}],0,0,0,0},{quest,661064,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_fail,0,[],0,{evt_animal_chess_fail,608},3,0,[],[],[]}],0,0,0,0},{quest,661061,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_soldier,0,[],0,{evt_animal_chess_soldier,607},1,0,[],[],[]}],0,0,0,0},{quest,661058,[],1,1,0,0,[{quest_progress,0,evt_animal_chess_win,0,[],0,{evt_animal_chess_win,606},1,0,[],[],[]}],0,0,0,0},{quest,640319,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21361,[],0,{evt_use_fruit_limit,599},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21362,[],0,{evt_use_fruit_limit,600},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21363,[],0,{evt_use_fruit_limit,601},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21384,[],0,{evt_use_fruit_limit,602},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21385,[],0,{evt_use_fruit_limit,603},1,0,[],[],[]},{quest_progress,5,evt_use_fruit_limit,21386,[],0,{evt_use_fruit_limit,604},1,0,[],[],[]},{quest_progress,6,evt_use_fruit_limit,21387,[],0,{evt_use_fruit_limit,605},1,0,[],[],[]}],0,0,0,0},{quest,640057,[],1,1,0,0,[{quest_progress,0,evt_provocation_duel_win,0,[],0,{evt_provocation_duel_win,598},20,0,[],[],[]}],0,0,0,0},{quest,640056,[],1,1,0,0,[{quest_progress,0,evt_provocation_duel_win,0,[],0,{evt_provocation_duel_win,597},5,0,[],[],[]}],0,0,0,0},{quest,640055,[],1,1,0,0,[{quest_progress,0,evt_provocation_duel_win,0,[],0,{evt_provocation_duel_win,596},1,0,[],[],[]}],0,0,0,0},{quest,630360,[],1,1,0,0,[{quest_progress,0,evt_constellation,77008,[{lev,9}],0,{evt_constellation,595},9,0,[],[],[]}],0,0,0,0},{quest,630357,[],1,1,0,0,[{quest_progress,0,evt_constellation,77011,[{lev,9}],0,{evt_constellation,594},9,0,[],[],[]}],0,0,0,0},{quest,630354,[],1,1,0,0,[{quest_progress,0,evt_constellation,77009,[{lev,9}],0,{evt_constellation,593},9,0,[],[],[]}],0,0,0,0},{quest,630351,[],1,1,0,0,[{quest_progress,0,evt_constellation,77005,[{lev,9}],0,{evt_constellation,592},9,0,[],[],[]}],0,0,0,0},{quest,630348,[],1,1,0,0,[{quest_progress,0,evt_constellation,77003,[{lev,9}],0,{evt_constellation,591},9,0,[],[],[]}],0,0,0,0},{quest,630345,[],1,1,0,0,[{quest_progress,0,evt_constellation,77002,[{lev,9}],0,{evt_constellation,590},9,0,[],[],[]}],0,0,0,0},{quest,630342,[],1,1,0,0,[{quest_progress,0,evt_constellation,77001,[{lev,9}],0,{evt_constellation,589},9,0,[],[],[]}],0,0,0,0},{quest,420220,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_enchant,0,[luck_item],0,{evt_blacksmith_enchant,588},50,0,[],[],[]}],0,0,0,0},{quest,620162,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71002,[],0,{evt_boss_first,587},1,0,[],[],[]}],0,0,0,0},{quest,520441,[],1,1,0,0,[{quest_progress,0,evt_sworn_skill,0,[],0,{evt_sworn_skill,586},1,0,[],[],[]}],0,0,0,0},{quest,520431,[],1,1,0,0,[{quest_progress,0,evt_sworn_defined_name,0,[],0,{evt_sworn_defined_name,585},1,0,[],[],[]}],0,0,0,0},{quest,520421,[],1,1,0,0,[{quest_progress,0,evt_sworn_name,0,[],0,{evt_sworn_name,584},1,0,[],[],[]}],0,0,0,0},{quest,520411,[],1,1,0,0,[{quest_progress,0,evt_sworn_invite,0,[],0,{evt_sworn_invite,583},1,0,[],[],[]}],0,0,0,0},{quest,520401,[],1,1,0,0,[{quest_progress,0,evt_sworn_finish,0,[],0,{evt_sworn_finish,582},1,0,[],[],[]}],0,0,0,0},{quest,520320,[],1,1,0,0,[{quest_progress,0,evt_teacher_score_sum,0,[],0,{evt_teacher_score_sum,581},300,0,[],[],[]}],0,0,0,0},{quest,420210,[],1,1,0,0,[{quest_progress,0,evt_enchant,0,[],0,{evt_enchant,580},20,8,[],[],[]}],0,0,0,0},{quest,420201,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_enchant,0,[fail],0,{evt_blacksmith_enchant,579},1,0,[],[],[]}],0,0,0,0},{quest,320120,[],1,1,0,0,[{quest_progress,0,evt_guard_score,0,[],0,{evt_guard_score,578},600,572,[],[],[]}],0,0,0,0},{quest,620152,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,71002,[],0,{evt_kill_npc,577},200,0,[],[],[]}],0,0,0,0},{quest,610301,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,14}],0,{evt_commit_quest,576},200,0,[],[],[]}],0,0,0,0},{quest,430101,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,3,[],0,{evt_blacksmith_embed_lev,575},8,0,[],[],[]}],0,0,0,0},{quest,620115,[],1,1,0,0,[{quest_progress,0,evt_dungeon_pass,10150,[],0,{evt_dungeon_pass,574},10,0,[],[],[]}],0,0,0,0},{quest,430100,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,573},8,0,[],[],[]}],0,0,0,0},{quest,530120,[],1,1,0,0,[{quest_progress,0,evt_lover_combat,1,[],0,{evt_lover_combat,572},9999,0,[],[],[]}],0,0,0,0},{quest,640203,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,571},2600,201,[],[],[]}],0,0,0,0},{quest,610515,[],1,1,0,0,[{quest_progress,0,evt_shipping_help,0,[],0,{evt_shipping_help,570},200,0,[],[],[]}],0,0,0,0},{quest,210101,[],1,1,0,0,[{quest_progress,0,evt_get_pet,0,[catch_num],0,{evt_get_pet,569},1,0,[],[],[]}],0,0,0,0},{quest,150135,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,10,[],0,{evt_wing_lev,568},1,0,[],[],[]}],0,0,0,0},{quest,150134,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,8,[],0,{evt_wing_lev,567},1,0,[],[],[]}],0,0,0,0},{quest,150105,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[],0,{evt_wing,566},5,4,[],[],[]}],0,0,0,0},{quest,640525,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,565},1500,201,[],[],[]}],0,0,0,0},{quest,630335,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,7,[],0,{evt_constellation_first,564},1,0,[],[],[]}],0,0,0,0},{quest,610212,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,563},50,0,[],[],[]}],0,0,0,0},{quest,640524,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,562},1000,201,[],[],[]}],0,0,0,0},{quest,630334,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,6,[],0,{evt_constellation_first,561},1,0,[],[],[]}],0,0,0,0},{quest,640523,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,560},800,201,[],[],[]}],0,0,0,0},{quest,640212,[],1,1,0,0,[{quest_progress,0,evt_gain_character,0,[],0,{evt_gain_character,559},99999,0,[],[],[]}],0,0,0,0},{quest,630333,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,5,[],0,{evt_constellation_first,558},1,0,[],[],[]}],0,0,0,0},{quest,630320,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,557},6,0,[],[],[]}],0,0,0,0},{quest,630106,[],1,1,0,0,[{quest_progress,0,evt_qualifying_combat_over,1,[],0,{evt_qualifying_combat_over,556},500,0,[],[],[]}],0,0,0,0},{quest,661279,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_cplt,600,[{camp_id,3006}],0,{evt_dragon_boat_cplt,555},1,0,[],[],[]}],0,0,0,0},{quest,661278,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,3006}],0,{evt_dragon_boat_rank,554},3,0,[],[],[]}],0,0,0,0},{quest,661277,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,3006}],0,{evt_dragon_boat_rank,553},1,0,[],[],[]}],0,0,0,0},{quest,661276,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,10,[{camp_id,3006}],0,{evt_dragon_boat_rank,552},1,0,[],[],[]}],0,0,0,0},{quest,661275,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,3006}],0,{evt_dragon_boat,551},5,0,[],[],[]}],0,0,0,0},{quest,661274,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,3006}],0,{evt_dragon_boat,550},1,0,[],[],[]}],0,0,0,0},{quest,661097,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_cplt,600,[{camp_id,836}],0,{evt_dragon_boat_cplt,549},1,0,[],[],[]}],0,0,0,0},{quest,661096,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,836}],0,{evt_dragon_boat_rank,548},3,0,[],[],[]}],0,0,0,0},{quest,661095,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,836}],0,{evt_dragon_boat_rank,547},1,0,[],[],[]}],0,0,0,0},{quest,661094,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,10,[{camp_id,836}],0,{evt_dragon_boat_rank,546},1,0,[],[],[]}],0,0,0,0},{quest,661093,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,836}],0,{evt_dragon_boat,545},5,0,[],[],[]}],0,0,0,0},{quest,661092,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,836}],0,{evt_dragon_boat,544},1,0,[],[],[]}],0,0,0,0},{quest,640380,[],1,1,0,0,[{quest_progress,0,evt_expression,0,[],0,{evt_expression,543},1,0,[],[],[]}],0,0,0,0},{quest,640318,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21316,[],0,{evt_use_fruit_limit,533},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21317,[],0,{evt_use_fruit_limit,534},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21318,[],0,{evt_use_fruit_limit,535},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21319,[],0,{evt_use_fruit_limit,536},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21320,[],0,{evt_use_fruit_limit,537},1,0,[],[],[]},{quest_progress,5,evt_use_fruit_limit,21321,[],0,{evt_use_fruit_limit,538},1,0,[],[],[]},{quest_progress,6,evt_use_fruit_limit,21380,[],0,{evt_use_fruit_limit,539},1,0,[],[],[]},{quest_progress,7,evt_use_fruit_limit,21381,[],0,{evt_use_fruit_limit,540},1,0,[],[],[]},{quest_progress,8,evt_use_fruit_limit,21382,[],0,{evt_use_fruit_limit,541},1,0,[],[],[]},{quest_progress,9,evt_use_fruit_limit,21383,[],0,{evt_use_fruit_limit,542},1,0,[],[],[]}],0,0,0,0},{quest,630359,[],1,1,0,0,[{quest_progress,0,evt_constellation,77008,[{lev,6}],0,{evt_constellation,532},6,0,[],[],[]}],0,0,0,0},{quest,630356,[],1,1,0,0,[{quest_progress,0,evt_constellation,77011,[{lev,6}],0,{evt_constellation,531},6,0,[],[],[]}],0,0,0,0},{quest,630353,[],1,1,0,0,[{quest_progress,0,evt_constellation,77009,[{lev,6}],0,{evt_constellation,530},6,0,[],[],[]}],0,0,0,0},{quest,630350,[],1,1,0,0,[{quest_progress,0,evt_constellation,77005,[{lev,6}],0,{evt_constellation,529},6,0,[],[],[]}],0,0,0,0},{quest,630347,[],1,1,0,0,[{quest_progress,0,evt_constellation,77003,[{lev,6}],0,{evt_constellation,528},6,0,[],[],[]}],0,0,0,0},{quest,630344,[],1,1,0,0,[{quest_progress,0,evt_constellation,77002,[{lev,6}],0,{evt_constellation,527},6,0,[],[],[]}],0,0,0,0},{quest,630341,[],1,1,0,0,[{quest_progress,0,evt_constellation,77001,[{lev,6}],0,{evt_constellation,526},6,0,[],[],[]}],0,0,0,0},{quest,630323,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,525},1,0,[],[],[]}],0,0,0,0},{quest,630132,[],1,1,0,0,[{quest_progress,0,evt_warrior_reward,0,[fail_flag],0,{evt_warrior_reward,524},10,0,[],[],[]}],0,0,0,0},{quest,630131,[],1,1,0,0,[{quest_progress,0,evt_warrior_reward,0,[win_flag],0,{evt_warrior_reward,523},10,0,[],[],[]}],0,0,0,0},{quest,530113,[],1,1,0,0,[{quest_progress,0,evt_wedding_day,0,[],0,{evt_wedding_day,522},30,0,[],[],[]}],0,0,0,0},{quest,639155,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[{id,639132}],0,{evt_achievement,519},1,0,[],[],[]},{quest_progress,1,evt_achievement,0,[{id,639142}],0,{evt_achievement,520},1,0,[],[],[]},{quest_progress,2,evt_achievement,0,[{id,639152}],0,{evt_achievement,521},1,0,[],[],[]}],0,0,0,0},{quest,630332,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,4,[],0,{evt_constellation_first,518},1,0,[],[],[]}],0,0,0,0},{quest,630331,[],1,1,0,0,[{quest_progress,0,evt_constellation_first,3,[],0,{evt_constellation_first,517},1,0,[],[],[]}],0,0,0,0},{quest,630111,[],1,1,0,0,[{quest_progress,0,evt_warrior_reward,0,[score],0,{evt_warrior_reward,516},1000,0,[],[],[]}],0,0,0,0},{quest,630101,[],1,1,0,0,[{quest_progress,0,evt_qualifying_combat,0,[],0,{evt_qualifying_combat,515},10,0,[],[],[]}],0,0,0,0},{quest,620161,[],1,1,0,0,[{quest_progress,0,evt_boss_first,71001,[],0,{evt_boss_first,514},1,0,[],[],[]}],0,0,0,0},{quest,620141,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,0,[{type,6}],0,{evt_kill_npc,513},10,0,[],[],[]}],0,0,0,0},{quest,620131,[],1,1,0,0,[{quest_progress,0,evt_tower,0,[],0,{evt_tower,512},50,0,[],[],[]}],0,0,0,0},{quest,620121,[],1,1,0,0,[{quest_progress,0,evt_tower_floor,0,[],0,{evt_tower_floor,511},1,0,[],[],[]}],0,0,0,0},{quest,520311,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_photo,0,[],0,{evt_friend_zone_photo,510},1,0,[],[],[]}],0,0,0,0},{quest,630110,[],1,1,0,0,[{quest_progress,0,evt_warrior,0,[],0,{evt_warrior,509},1,0,[],[],[]}],0,0,0,0},{quest,630105,[],1,1,0,0,[{quest_progress,0,evt_qualifying,0,[day_win],0,{evt_qualifying,508},8,0,[],[],[]}],0,0,0,0},{quest,630001,[],1,1,0,0,[{quest_progress,0,evt_qualifying,0,[rank_point],0,{evt_qualifying,507},1050,1000,[],[],[]}],0,0,0,0},{quest,620151,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,71001,[],0,{evt_kill_npc,506},200,0,[],[],[]}],0,0,0,0},{quest,120253,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,505},30,0,[],[],[]}],0,0,0,0},{quest,120250,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10006,[],0,{evt_skill_life_levup,504},40,0,[],[],[]}],0,0,0,0},{quest,120247,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10005,[],0,{evt_skill_life_levup,503},40,0,[],[],[]}],0,0,0,0},{quest,639150,[],1,1,0,0,[{quest_progress,0,evt_hide_seek_reward,0,[],0,{evt_hide_seek_reward,502},1,0,[],[],[]}],0,0,0,0},{quest,639140,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,76653,[],0,{evt_kill_npc,501},3,0,[],[],[]}],0,0,0,0},{quest,639135,[],1,1,0,0,[{quest_progress,0,evt_camp_fruit_help,0,[],0,{evt_camp_fruit_help,500},5,0,[],[],[]}],0,0,0,0},{quest,639130,[],1,1,0,0,[{quest_progress,0,evt_camp_fruit_reward,0,[],0,{evt_camp_fruit_reward,499},1,0,[],[],[]}],0,0,0,0},{quest,610240,[],1,1,0,0,[{quest_progress,0,evt_trial,0,[count],0,{evt_trial,498},100,0,[],[],[]}],0,0,0,0},{quest,330130,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[{guard,1}],0,{evt_combat_statistics,497},1000,2,[],[],[]}],0,0,0,0},{quest,640431,[],1,1,0,0,[{quest_progress,0,evt_roll,1,[],0,{evt_roll,496},1,0,[],[],[]}],0,0,0,0},{quest,640426,[],1,1,0,0,[{quest_progress,0,evt_roll,15,[reward],0,{evt_roll,495},1,0,[],[],[]}],0,0,0,0},{quest,640425,[],1,1,0,0,[{quest_progress,0,evt_roll,99,[no_reward],0,{evt_roll,494},1,0,[],[],[]}],0,0,0,0},{quest,640202,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,493},1800,201,[],[],[]}],0,0,0,0},{quest,640103,[],1,1,0,0,[{quest_progress,0,evt_alchemy_melt,200,[],0,{evt_alchemy_melt,492},1,0,[],[],[]}],0,0,0,0},{quest,640110,[],1,1,0,0,[{quest_progress,0,evt_alchemy_produce,0,[],0,{evt_alchemy_produce,491},50,0,[],[],[]}],0,0,0,0},{quest,640100,[],1,1,0,0,[{quest_progress,0,evt_alchemy_melt,0,[],0,{evt_alchemy_melt,490},100,0,[],[],[]}],0,0,0,0},{quest,661041,[],1,1,0,0,[{quest_progress,0,evt_maze_cat,0,[],0,{evt_maze_cat,489},1,0,[],[],[]}],0,0,0,0},{quest,661031,[],1,1,0,0,[{quest_progress,0,evt_maze_monkey,0,[],0,{evt_maze_monkey,488},1,0,[],[],[]}],0,0,0,0},{quest,661021,[],1,1,0,0,[{quest_progress,0,evt_maze_gold,0,[],0,{evt_maze_gold,487},2000,0,[],[],[]}],0,0,0,0},{quest,661011,[],1,1,0,0,[{quest_progress,0,evt_maze_monster,0,[],0,{evt_maze_monster,486},10,0,[],[],[]}],0,0,0,0},{quest,661001,[],1,1,0,0,[{quest_progress,0,evt_maze_sweep,0,[],0,{evt_maze_sweep,485},10,0,[],[],[]}],0,0,0,0},{quest,640410,[],1,1,0,0,[{quest_progress,0,evt_roll,100,[],0,{evt_roll,484},1,0,[],[],[]}],0,0,0,0},{quest,220315,[],1,1,0,0,[{quest_progress,0,evt_pet_skill,1,[one_count],0,{evt_pet_skill,483},7,3,[],[],[]}],0,0,0,0},{quest,610604,[],1,1,0,0,[{quest_progress,0,evt_treasure,20053,[],0,{evt_treasure,482},50,0,[],[],[]}],0,0,0,0},{quest,150111,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[{growth,5}],0,{evt_wing,481},4,0,[],[],[]}],0,0,0,0},{quest,610211,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,480},5,0,[],[],[]}],0,0,0,0},{quest,450102,[],1,1,0,0,[{quest_progress,0,evt_fuse,20512,[],0,{evt_fuse,479},1,0,[],[],[]}],0,0,0,0},{quest,640522,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,478},600,201,[],[],[]}],0,0,0,0},{quest,640211,[],1,1,0,0,[{quest_progress,0,evt_gain_character,0,[],0,{evt_gain_character,477},6000,0,[],[],[]}],0,0,0,0},{quest,610510,[],1,1,0,0,[{quest_progress,0,evt_shipping_commit,0,[helped],0,{evt_shipping_commit,476},20,0,[],[],[]}],0,0,0,0},{quest,610201,[],1,1,0,0,[{quest_progress,0,evt_arena_fight,0,[],0,{evt_arena_fight,475},50,0,[],[],[]}],0,0,0,0},{quest,540101,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_liked,0,[],0,{evt_friend_zone_liked,474},999,0,[],[],[]}],0,0,0,0},{quest,450101,[],1,1,0,0,[{quest_progress,0,evt_fuse,20511,[],0,{evt_fuse,473},1,0,[],[],[]}],0,0,0,0},{quest,149039,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,8,[formation],0,{evt_formation_lev,472},1,0,[],[],[]}],0,0,0,0},{quest,149034,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,7,[formation],0,{evt_formation_lev,471},1,0,[],[],[]}],0,0,0,0},{quest,149029,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,6,[formation],0,{evt_formation_lev,470},1,0,[],[],[]}],0,0,0,0},{quest,149024,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,5,[formation],0,{evt_formation_lev,469},1,0,[],[],[]}],0,0,0,0},{quest,149019,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,4,[formation],0,{evt_formation_lev,468},1,0,[],[],[]}],0,0,0,0},{quest,149014,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,3,[formation],0,{evt_formation_lev,467},1,0,[],[],[]}],0,0,0,0},{quest,149009,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,2,[formation],0,{evt_formation_lev,466},1,0,[],[],[]}],0,0,0,0},{quest,140230,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[use_item],0,{evt_combat_statistics,465},2000,0,[],[],[]}],0,0,0,0},{quest,120301,[],1,1,0,0,[{quest_progress,0,evt_skill_life_produce,21400,[],0,{evt_skill_life_produce,464},1000,0,[],[],[]}],0,0,0,0},{quest,661272,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_one_shot,0,[],0,{evt_truth_dare_one_shot,463},1,0,[],[],[]}],0,0,0,0},{quest,661271,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_two_fail,0,[],0,{evt_truth_dare_two_fail,462},1,0,[],[],[]}],0,0,0,0},{quest,661268,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_end,3,[],0,{evt_truth_dare_end,461},1,0,[],[],[]}],0,0,0,0},{quest,661265,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_end,2,[],0,{evt_truth_dare_end,460},1,0,[],[],[]}],0,0,0,0},{quest,661262,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_end,1,[],0,{evt_truth_dare_end,459},1,0,[],[],[]}],0,0,0,0},{quest,661259,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_lucky_choose,2,[],0,{evt_truth_dare_lucky_choose,458},1,0,[],[],[]}],0,0,0,0},{quest,661256,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_lucky_choose,1,[],0,{evt_truth_dare_lucky_choose,457},1,0,[],[],[]}],0,0,0,0},{quest,661253,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_lucky,0,[],0,{evt_truth_dare_lucky,456},1,0,[],[],[]}],0,0,0,0},{quest,661250,[],1,1,0,0,[{quest_progress,0,evt_truth_dare_join,0,[],0,{evt_truth_dare_join,455},1,0,[],[],[]}],0,0,0,0},{quest,661100,[],1,1,0,0,[{quest_progress,0,evt_may_day_clean,0,[{camp_id,885}],0,{evt_may_day_clean,454},1,0,[],[],[]}],0,0,0,0},{quest,661077,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_cplt,600,[{camp_id,1618}],0,{evt_dragon_boat_cplt,453},1,0,[],[],[]}],0,0,0,0},{quest,661076,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,1618}],0,{evt_dragon_boat_rank,452},3,0,[],[],[]}],0,0,0,0},{quest,661075,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,1,[{camp_id,1618}],0,{evt_dragon_boat_rank,451},1,0,[],[],[]}],0,0,0,0},{quest,661074,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat_rank,10,[{camp_id,1618}],0,{evt_dragon_boat_rank,450},1,0,[],[],[]}],0,0,0,0},{quest,661073,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,1618}],0,{evt_dragon_boat,449},5,0,[],[],[]}],0,0,0,0},{quest,661072,[],1,1,0,0,[{quest_progress,0,evt_dragon_boat,0,[{camp_id,1618}],0,{evt_dragon_boat,448},1,0,[],[],[]}],0,0,0,0},{quest,661056,[],1,1,0,0,[{quest_progress,0,evt_may_day_clean,0,[{camp_id,1976}],0,{evt_may_day_clean,447},1,0,[],[],[]}],0,0,0,0},{quest,661053,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,76620,[],0,{evt_kill_npc,446},5,0,[],[],[]}],0,0,0,0},{quest,661052,[],1,1,0,0,[{quest_progress,0,evt_may_day_help,0,[],0,{evt_may_day_help,445},3,0,[],[],[]}],0,0,0,0},{quest,661050,[],1,1,0,0,[{quest_progress,0,evt_may_day_bags,0,[],0,{evt_may_day_bags,444},1,0,[],[],[]}],0,0,0,0},{quest,661089,[],1,1,0,0,[{quest_progress,0,evt_mount_dye_diff,1,[{dye_id,2031}],0,{evt_mount_dye_diff,443},1,0,[],[],[]}],0,0,0,0},{quest,640472,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,39,[],0,{evt_pre_honor,442},1,0,[],[],[]}],0,0,0,0},{quest,640471,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,38,[],0,{evt_pre_honor,441},1,0,[],[],[]}],0,0,0,0},{quest,640470,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,19,[],0,{evt_pre_honor,440},1,0,[],[],[]}],0,0,0,0},{quest,640469,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,17,[],0,{evt_pre_honor,439},1,0,[],[],[]}],0,0,0,0},{quest,640468,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,16,[],0,{evt_pre_honor,438},1,0,[],[],[]}],0,0,0,0},{quest,640467,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,15,[],0,{evt_pre_honor,437},1,0,[],[],[]}],0,0,0,0},{quest,640464,[],1,1,0,0,[{quest_progress,0,evt_pre_honor,0,[],0,{evt_pre_honor,436},1,0,[],[],[]}],0,0,0,0},{quest,640461,[],1,1,0,0,[{quest_progress,0,evt_quest_prac_help,0,[],0,{evt_quest_prac_help,435},20,0,[],[],[]}],0,0,0,0},{quest,640317,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21311,[],0,{evt_use_fruit_limit,432},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21314,[],0,{evt_use_fruit_limit,433},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21360,[],0,{evt_use_fruit_limit,434},1,0,[],[],[]}],0,0,0,0},{quest,639573,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_heap2,0,[{val,100}],0,{evt_campaign_unit_heap2,431},2,0,[],[],[]}],0,0,0,0},{quest,639570,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_heap2,0,[{val,0}],0,{evt_campaign_unit_heap2,430},1,0,[],[],[]}],0,0,0,0},{quest,639567,[],1,1,0,0,[{quest_progress,0,evt_mid_pudding_win,0,[],0,{evt_mid_pudding_win,429},1,0,[],[],[]}],0,0,0,0},{quest,639566,[],1,1,0,0,[{quest_progress,0,evt_mid_pudding_answer,0,[],0,{evt_mid_pudding_answer,428},5,0,[],[],[]}],0,0,0,0},{quest,639565,[],1,1,0,0,[{quest_progress,0,evt_mid_pudding_answer,1,[],0,{evt_mid_pudding_answer,427},20,0,[],[],[]}],0,0,0,0},{quest,639564,[],1,1,0,0,[{quest_progress,0,evt_join_mid_pudding,0,[],0,{evt_join_mid_pudding,426},1,0,[],[],[]}],0,0,0,0},{quest,639561,[],1,1,0,0,[{quest_progress,0,evt_glue_pudding_win,0,[],0,{evt_glue_pudding_win,425},1,0,[],[],[]}],0,0,0,0},{quest,639560,[],1,1,0,0,[{quest_progress,0,evt_glue_pudding_answer,0,[],0,{evt_glue_pudding_answer,424},5,0,[],[],[]}],0,0,0,0},{quest,639559,[],1,1,0,0,[{quest_progress,0,evt_glue_pudding_answer,1,[],0,{evt_glue_pudding_answer,423},20,0,[],[],[]}],0,0,0,0},{quest,639558,[],1,1,0,0,[{quest_progress,0,evt_join_glue_pudding,0,[],0,{evt_join_glue_pudding,422},1,0,[],[],[]}],0,0,0,0},{quest,639555,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_heap2,0,[{val,100}],0,{evt_campaign_unit_heap2,421},2,0,[],[],[]}],0,0,0,0},{quest,639550,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_heap2,0,[{val,0}],0,{evt_campaign_unit_heap2,420},1,0,[],[],[]}],0,0,0,0},{quest,639545,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_win,0,[],0,{evt_kongming_lanterns_win,419},1,0,[],[],[]}],0,0,0,0},{quest,639544,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_answer,0,[],0,{evt_kongming_lanterns_answer,418},5,0,[],[],[]}],0,0,0,0},{quest,639543,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_answer,1,[],0,{evt_kongming_lanterns_answer,417},20,0,[],[],[]}],0,0,0,0},{quest,639542,[],1,1,0,0,[{quest_progress,0,evt_join_kongming_lanterns,0,[],0,{evt_join_kongming_lanterns,416},1,0,[],[],[]}],0,0,0,0},{quest,639540,[],1,1,0,0,[{quest_progress,0,evt_camp_halloween_rank,1,[1],0,{evt_camp_halloween_rank,415},3,0,[],[],[]}],0,0,0,0},{quest,639530,[],1,1,0,0,[{quest_progress,0,evt_camp_halloween_first,0,[],0,{evt_camp_halloween_first,414},5,0,[],[],[]}],0,0,0,0},{quest,639520,[],1,1,0,0,[{quest_progress,0,evt_camp_halloween,0,[],0,{evt_camp_halloween,413},3,0,[],[],[]}],0,0,0,0},{quest,639510,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_card_boss,0,[],0,{evt_campaign_unit_card_boss,412},2,0,[],[],[]}],0,0,0,0},{quest,639500,[],1,1,0,0,[{quest_progress,0,evt_campaign_unit_card,0,[],0,{evt_campaign_unit_card,411},5,0,[],[],[]}],0,0,0,0},{quest,639400,[],1,1,0,0,[{quest_progress,0,evt_rainbow_lottery_day,0,[],0,{evt_rainbow_lottery_day,410},1,0,[],[],[]}],0,0,0,0},{quest,639393,[],1,1,0,0,[{quest_progress,0,evt_national_wisdom_luckyer,0,[],0,{evt_national_wisdom_luckyer,409},1,0,[],[],[]}],0,0,0,0},{quest,639390,[],1,1,0,0,[{quest_progress,0,evt_national_wisdom_right,0,[],0,{evt_national_wisdom_right,408},5,0,[],[],[]}],0,0,0,0},{quest,639380,[],1,1,0,0,[{quest_progress,0,evt_camp_cake_finish,0,[],0,{evt_camp_cake_finish,407},8,0,[],[],[]}],0,0,0,0},{quest,639370,[],1,1,0,0,[{quest_progress,0,evt_campaign_bag_reward,0,[],0,{evt_campaign_bag_reward,406},1,0,[],[],[]}],0,0,0,0},{quest,639360,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_win,0,[{camp_id,1779}],0,{evt_kongming_lanterns_win,405},1,0,[],[],[]}],0,0,0,0},{quest,639350,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_answer,0,[{camp_id,1779}],0,{evt_kongming_lanterns_answer,404},5,0,[],[],[]}],0,0,0,0},{quest,639340,[],1,1,0,0,[{quest_progress,0,evt_kongming_lanterns_answer,1,[{camp_id,1779}],0,{evt_kongming_lanterns_answer,403},20,0,[],[],[]}],0,0,0,0},{quest,639330,[],1,1,0,0,[{quest_progress,0,evt_join_kongming_lanterns,0,[{camp_id,1779}],0,{evt_join_kongming_lanterns,402},1,0,[],[],[]}],0,0,0,0},{quest,639320,[],1,1,0,0,[{quest_progress,0,evt_enjoy_moon_wish,0,[{wish,2}],0,{evt_enjoy_moon_wish,401},10,0,[],[],[]}],0,0,0,0},{quest,639310,[],1,1,0,0,[{quest_progress,0,evt_enjoy_moon_wish,0,[{wish,1}],0,{evt_enjoy_moon_wish,400},10,0,[],[],[]}],0,0,0,0},{quest,639300,[],1,1,0,0,[{quest_progress,0,evt_enjoy_moon,0,[],0,{evt_enjoy_moon,399},1,0,[],[],[]}],0,0,0,0},{quest,639145,[],1,1,0,0,[{quest_progress,0,evt_rushing_top_final_times,0,[],0,{evt_rushing_top_final_times,398},1,0,[],[],[]}],0,0,0,0},{quest,631209,[],1,1,0,0,[{quest_progress,0,evt_question_match_last_right,20,[],0,{evt_question_match_last_right,397},1,0,[],[],[]}],0,0,0,0},{quest,631206,[],1,1,0,0,[{quest_progress,0,evt_question_match_last_right,15,[],0,{evt_question_match_last_right,396},1,0,[],[],[]}],0,0,0,0},{quest,631203,[],1,1,0,0,[{quest_progress,0,evt_question_match_mvp,0,[],0,{evt_question_match_mvp,395},3,0,[],[],[]}],0,0,0,0},{quest,631200,[],1,1,0,0,[{quest_progress,0,evt_question_match_answer,0,[],0,{evt_question_match_answer,394},3,0,[],[],[]}],0,0,0,0},{quest,630201,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,79630,[],0,{evt_kill_npc,393},1,0,[],[],[]}],0,0,0,0},{quest,639102,[],1,1,0,0,[{quest_progress,0,evt_examination_answer,1,[],0,{evt_examination_answer,392},10000,0,[],[],[]}],0,0,0,0},{quest,620111,[],1,1,0,0,[{quest_progress,0,evt_dungeon_pass,10135,[],0,{evt_dungeon_pass,391},1,0,[],[],[]}],0,0,0,0},{quest,610601,[],1,1,0,0,[{quest_progress,0,evt_treasure,0,[],0,{evt_treasure,390},10,0,[],[],[]}],0,0,0,0},{quest,610530,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,3,[],0,{evt_shipping_sail,389},1,0,[],[],[]}],0,0,0,0},{quest,610220,[],1,1,0,0,[{quest_progress,0,evt_trial,1,[],0,{evt_trial,388},6,0,[],[],[]}],0,0,0,0},{quest,540111,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_leave_trend,0,[],0,{evt_friend_zone_leave_trend,387},1,0,[],[],[]}],0,0,0,0},{quest,320110,[],1,1,0,0,[{quest_progress,0,evt_guard_reset_eqm,0,[],0,{evt_guard_reset_eqm,386},50,0,[],[],[]}],0,0,0,0},{quest,320101,[],1,1,0,0,[{quest_progress,0,evt_guard_upgrade_eqm,0,[],0,{evt_guard_upgrade_eqm,385},20,6,[],[],[]}],0,0,0,0},{quest,120320,[],1,1,0,0,[{quest_progress,0,evt_skill_life_produce,0,[{skill,10000}],0,{evt_skill_life_produce,384},100,0,[],[],[]}],0,0,0,0},{quest,639101,[],1,1,0,0,[{quest_progress,0,evt_examination_answer,1,[],0,{evt_examination_answer,383},1000,0,[],[],[]}],0,0,0,0},{quest,610722,[],1,1,0,0,[{quest_progress,0,evt_arena_roll,5,[no_finish],0,{evt_arena_roll,382},1,0,[],[],[]}],0,0,0,0},{quest,610710,[],1,1,0,0,[{quest_progress,0,evt_arena_roll,0,[],0,{evt_arena_roll,381},5,0,[],[],[]}],0,0,0,0},{quest,610701,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,380},1300,0,[],[],[]}],0,0,0,0},{quest,610540,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,2,[],0,{evt_shipping_sail,379},1,0,[],[],[]}],0,0,0,0},{quest,120310,[],1,1,0,0,[{quest_progress,0,evt_skill_life_produce,0,[{skill,10007}],0,{evt_skill_life_produce,378},100,0,[],[],[]}],0,0,0,0},{quest,120244,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10001,[],0,{evt_skill_life_levup,377},30,15,[],[],[]}],0,0,0,0},{quest,120241,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10000,[],0,{evt_skill_life_levup,376},30,15,[],[],[]}],0,0,0,0},{quest,639120,[],1,1,0,0,[{quest_progress,0,evt_parade,0,[],0,{evt_parade,375},1,0,[],[],[]}],0,0,0,0},{quest,639110,[],1,1,0,0,[{quest_progress,0,evt_examination_answer,2,[],0,{evt_examination_answer,374},100,0,[],[],[]}],0,0,0,0},{quest,639100,[],1,1,0,0,[{quest_progress,0,evt_examination_answer,1,[],0,{evt_examination_answer,373},100,0,[],[],[]}],0,0,0,0},{quest,620102,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,3}],0,{evt_commit_quest,372},2000,0,[],[],[]}],0,0,0,0},{quest,610721,[],1,1,0,0,[{quest_progress,0,evt_arena_roll,3,[finish],0,{evt_arena_roll,371},1,0,[],[],[]}],0,0,0,0},{quest,540121,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_leave_trended,0,[],0,{evt_friend_zone_leave_trended,370},8,0,[],[],[]}],0,0,0,0},{quest,220401,[],1,1,0,0,[{quest_progress,0,evt_aptitude_pet,0,[count],0,{evt_aptitude_pet,369},100,0,[],[],[]}],0,0,0,0},{quest,220320,[],1,1,0,0,[{quest_progress,0,evt_pet_skill,2,[one_count],0,{evt_pet_skill,368},4,0,[],[],[]}],0,0,0,0},{quest,640450,[],1,1,0,0,[{quest_progress,0,evt_honor,0,[],0,{evt_honor,367},5,4,[],[],[]}],0,0,0,0},{quest,640201,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,366},1000,201,[],[],[]}],0,0,0,0},{quest,640601,[],1,1,0,0,[{quest_progress,0,evt_wedding_guest,0,[],0,{evt_wedding_guest,365},25,0,[],[],[]}],0,0,0,0},{quest,220310,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,20007,[],0,{evt_pet_use_item,364},10,0,[],[],[]}],0,0,0,0},{quest,150110,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[{growth,5}],0,{evt_wing,363},3,0,[],[],[]}],0,0,0,0},{quest,520103,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,362},50,0,[],[],[]}],0,0,0,0},{quest,230101,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[pet_revive],0,{evt_combat_statistics,361},5,0,[],[],[]}],0,0,0,0},{quest,220151,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,21312,[],0,{evt_pet_use_item,360},1,0,[],[],[]}],0,0,0,0},{quest,640521,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,359},300,201,[],[],[]}],0,0,0,0},{quest,640210,[],1,1,0,0,[{quest_progress,0,evt_gain_character,0,[],0,{evt_gain_character,358},1000,0,[],[],[]}],0,0,0,0},{quest,520102,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,357},20,0,[],[],[]}],0,0,0,0},{quest,510121,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,0,[{type,9}],0,{evt_kill_npc,356},50,0,[],[],[]}],0,0,0,0},{quest,230201,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[cast_pet],0,{evt_combat_statistics,355},10,0,[],[],[]}],0,0,0,0},{quest,220510,[],1,1,0,0,[{quest_progress,0,evt_pet,3333,[sum_talent],0,{evt_pet,354},1,0,[],[],[]}],0,0,0,0},{quest,210161,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,21301,[],0,{evt_pet_use_item,353},1,0,[],[],[]}],0,0,0,0},{quest,140241,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[is_die],0,{evt_combat_statistics,352},99,2,[],[],[]}],0,0,0,0},{quest,140220,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[revive],0,{evt_combat_statistics,351},100,1,[],[],[]}],0,0,0,0},{quest,130220,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[],0,{evt_market_silver_sold,350},1000,0,[],[],[]}],0,0,0,0},{quest,640316,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21309,[],0,{evt_use_fruit_limit,345},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21356,[],0,{evt_use_fruit_limit,346},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21357,[],0,{evt_use_fruit_limit,347},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21358,[],0,{evt_use_fruit_limit,348},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21359,[],0,{evt_use_fruit_limit,349},1,0,[],[],[]}],0,0,0,0},{quest,640445,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,1,[kill_group_pet],0,{evt_combat_statistics,344},1,0,[],[],[]}],0,0,0,0},{quest,610101,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,4}],0,{evt_commit_quest,343},50,0,[],[],[]}],0,0,0,0},{quest,520205,[],1,1,0,0,[{quest_progress,0,evt_wedding_treasure,0,[],0,{evt_wedding_treasure,342},99,0,[],[],[]}],0,0,0,0},{quest,220301,[],1,1,0,0,[{quest_progress,0,evt_pet_repleace_skill,0,[],0,{evt_pet_repleace_skill,341},1,0,[],[],[]}],0,0,0,0},{quest,149006,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,4,[],0,{evt_formation_lev,340},1,0,[],[],[]}],0,0,0,0},{quest,149004,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,3,[],0,{evt_formation_lev,339},1,0,[],[],[]}],0,0,0,0},{quest,130230,[],1,1,0,0,[{quest_progress,0,evt_market_silver_buy,0,[],0,{evt_market_silver_buy,338},1000,0,[],[],[]}],0,0,0,0},{quest,640440,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,1,[killed_group],0,{evt_combat_statistics,337},1,0,[],[],[]}],0,0,0,0},{quest,640311,[],1,1,0,0,[{quest_progress,0,evt_use_item,0,[21350,21303,21351,21352,21307,21353,21354,21355,21305,21313,21356,21357,21359,21309,21358,21360,21311,21314,21317,21318,21316,21319,21320,21321,21361,21362,21363,21380,21381,21382,21383,21384,21385,21386,21387,21388,21389,21390,21391,21392],0,{evt_use_item,336},72,0,[],[],[]}],0,0,0,0},{quest,620101,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,3}],0,{evt_commit_quest,335},200,0,[],[],[]}],0,0,0,0},{quest,510111,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,12}],0,{evt_commit_quest,334},100,0,[],[],[]}],0,0,0,0},{quest,220210,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,100,[type],0,{evt_pet_use_item,333},1,0,[],[],[]}],0,0,0,0},{quest,210155,[],1,1,0,0,[{quest_progress,0,evt_get_pet,20005,[base_id],0,{evt_get_pet,332},1,0,[],[],[]}],0,0,0,0},{quest,149001,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,1,[],0,{evt_formation_lev,331},8,1,[],[],[]}],0,0,0,0},{quest,140201,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,0,[],0,{evt_kill_npc,330},1000,0,[],[],[]}],0,0,0,0},{quest,130240,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[{percent,130}],0,{evt_market_silver_sold,329},1,0,[],[],[]}],0,0,0,0},{quest,130001,[],1,1,0,0,[{quest_progress,0,evt_market_silver_first_on_sale,0,[],0,{evt_market_silver_first_on_sale,328},1,0,[],[],[]}],0,0,0,0},{quest,520301,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_like,0,[],0,{evt_friend_zone_like,327},66,0,[],[],[]}],0,0,0,0},{quest,210160,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,20004,[],0,{evt_pet_use_item,326},1,0,[],[],[]}],0,0,0,0},{quest,149002,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,2,[],0,{evt_formation_lev,325},1,0,[],[],[]}],0,0,0,0},{quest,149000,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,1,[],0,{evt_formation_lev,324},2,1,[],[],[]}],0,0,0,0},{quest,130210,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[{assets,coin}],0,{evt_market_silver_sold,323},1000000,0,[],[],[]}],0,0,0,0},{quest,210150,[],1,1,0,0,[{quest_progress,0,evt_pet,4,[sum_genre],0,{evt_pet,322},1,0,[],[],[]}],0,0,0,0},{quest,210140,[],1,1,0,0,[{quest_progress,0,evt_pet,2,[sum_genre],0,{evt_pet,321},1,0,[],[],[]}],0,0,0,0},{quest,210110,[],1,1,0,0,[{quest_progress,0,evt_get_pet,0,[catch_num],0,{evt_get_pet,320},50,0,[],[],[]}],0,0,0,0},{quest,130201,[],1,1,0,0,[{quest_progress,0,evt_market_gold_bind_buy,0,[{percent,1250}],0,{evt_market_gold_bind_buy,319},1,0,[],[],[]}],0,0,0,0},{quest,630312,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_up_rank,0,[],0,{evt_classes_challenge_up_rank,318},10,0,[],[],[]}],0,0,0,0},{quest,630311,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_rank,15,[],0,{evt_classes_challenge_rank,317},1,0,[],[],[]}],0,0,0,0},{quest,630301,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_order,10,[],0,{evt_classes_challenge_order,316},1,0,[],[],[]}],0,0,0,0},{quest,530130,[],1,1,0,0,[{quest_progress,0,evt_wedding_marry,0,[],0,{evt_wedding_marry,315},3,0,[],[],[]}],0,0,0,0},{quest,520201,[],1,1,0,0,[{quest_progress,0,evt_friend_intimacy,0,[],0,{evt_friend_intimacy,314},200,0,[],[],[]}],0,0,0,0},{quest,220160,[],1,1,0,0,[{quest_progress,0,evt_pet_stone_upgrade,0,[],0,{evt_pet_stone_upgrade,313},1,0,[],[],[]}],0,0,0,0},{quest,130200,[],1,1,0,0,[{quest_progress,0,evt_market_gold_bind_buy,0,[{percent,1100}],0,{evt_market_gold_bind_buy,312},1,0,[],[],[]}],0,0,0,0},{quest,530110,[],1,1,0,0,[{quest_progress,0,evt_wedding_score,0,[acc],0,{evt_wedding_score,311},199,0,[],[],[]}],0,0,0,0},{quest,530140,[],1,1,0,0,[{quest_progress,0,evt_wedding_divorce,0,[],0,{evt_wedding_divorce,310},1,0,[],[],[]}],0,0,0,0},{quest,530101,[],1,1,0,0,[{quest_progress,0,evt_wedding_marry,0,[],0,{evt_wedding_marry,309},1,0,[],[],[]}],0,0,0,0},{quest,220501,[],1,1,0,0,[{quest_progress,0,evt_pet,1,[sum_genre],0,{evt_pet,308},1,0,[],[],[]}],0,0,0,0},{quest,210130,[],1,1,0,0,[{quest_progress,0,evt_pet_free,0,[],0,{evt_pet_free,307},1,0,[],[],[]}],0,0,0,0},{quest,220202,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,101,[type],0,{evt_pet_use_item,306},1,0,[],[],[]}],0,0,0,0},{quest,140210,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[win],0,{evt_combat_statistics,305},50,0,[],[],[]}],0,0,0,0},{quest,640351,[],1,1,0,0,[{quest_progress,0,evt_fashion_collect_lev,0,[],0,{evt_fashion_collect_lev,304},1,0,[],[],[]}],0,0,0,0},{quest,640341,[],1,1,0,0,[{quest_progress,0,evt_fashion,2,[],0,{evt_fashion,303},1,0,[],[],[]}],0,0,0,0},{quest,640325,[],1,1,0,0,[{quest_progress,0,evt_fashion,1,[],0,{evt_fashion,302},1,0,[],[],[]}],0,0,0,0},{quest,520221,[],1,1,0,0,[{quest_progress,0,evt_send_flower,20032,[],0,{evt_send_flower,301},1,0,[],[],[]}],0,0,0,0},{quest,520211,[],1,1,0,0,[{quest_progress,0,evt_send_flower,20031,[],0,{evt_send_flower,300},1,0,[],[],[]}],0,0,0,0},{quest,510210,[],1,1,0,0,[{quest_progress,0,evt_guild_post,30,[],0,{evt_guild_post,297},1,0,[],[],[]},{quest_progress,1,evt_guild_post,40,[],0,{evt_guild_post,298},1,0,[],[],[]},{quest_progress,2,evt_guild_post,50,[],0,{evt_guild_post,299},1,0,[],[],[]},{quest_progress,3,evt_guild_post,60,[],1,undefined,1,1,[],[],[]}],0,0,0,0},{quest,220201,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,102,[type],0,{evt_pet_use_item,296},1,0,[],[],[]}],0,0,0,0},{quest,150120,[],1,1,0,0,[{quest_progress,0,evt_wing_reset,0,[],0,{evt_wing_reset,295},5,0,[],[],[]}],0,0,0,0},{quest,640315,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21303,[],0,{evt_use_fruit_limit,286},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21305,[],0,{evt_use_fruit_limit,287},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21307,[],0,{evt_use_fruit_limit,288},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21313,[],0,{evt_use_fruit_limit,289},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21350,[],0,{evt_use_fruit_limit,290},1,0,[],[],[]},{quest_progress,5,evt_use_fruit_limit,21351,[],0,{evt_use_fruit_limit,291},1,0,[],[],[]},{quest_progress,6,evt_use_fruit_limit,21352,[],0,{evt_use_fruit_limit,292},1,0,[],[],[]},{quest_progress,7,evt_use_fruit_limit,21353,[],0,{evt_use_fruit_limit,293},1,0,[],[],[]},{quest_progress,8,evt_use_fruit_limit,21354,[],0,{evt_use_fruit_limit,294},1,0,[],[],[]}],0,0,0,0},{quest,540210,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[mentions],0,{evt_friend_circle,285},3,0,[],[],[]}],0,0,0,0},{quest,540206,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[photos],0,{evt_friend_circle,284},4,0,[],[],[]}],0,0,0,0},{quest,510203,[],1,1,0,0,[{quest_progress,0,evt_guild_post,40,[],0,{evt_guild_post,283},1,0,[],[],[]}],0,0,0,0},{quest,510220,[],1,1,0,0,[{quest_progress,0,evt_guild_leave,0,[],0,{evt_guild_leave,282},1,0,[],[],[]}],0,0,0,0},{quest,510202,[],1,1,0,0,[{quest_progress,0,evt_guild_post,50,[],0,{evt_guild_post,281},1,0,[],[],[]}],0,0,0,0},{quest,210120,[],1,1,0,0,[{quest_progress,0,evt_pet_rename,0,[],0,{evt_pet_rename,280},1,0,[],[],[]}],0,0,0,0},{quest,520101,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,279},1,0,[],[],[]}],0,0,0,0},{quest,140250,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[win_die],0,{evt_combat_statistics,278},1,0,[],[],[]}],0,0,0,0},{quest,540223,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[day_num],0,{evt_friend_circle,277},3,0,[],[],[]}],0,0,0,0},{quest,540220,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_commented,1,[],0,{evt_friend_circle_commented,276},10,0,[],[],[]}],0,0,0,0},{quest,540217,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_comment,0,[],0,{evt_friend_circle_comment,275},10,0,[],[],[]}],0,0,0,0},{quest,540214,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_liked,1,[],0,{evt_friend_circle_liked,274},10,0,[],[],[]}],0,0,0,0},{quest,540211,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_like,0,[],0,{evt_friend_circle_like,273},10,0,[],[],[]}],0,0,0,0},{quest,540207,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[mentions_acc],0,{evt_friend_circle,272},20,0,[],[],[]}],0,0,0,0},{quest,540203,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[photos_acc],0,{evt_friend_circle,271},10,0,[],[],[]}],0,0,0,0},{quest,540200,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[],0,{evt_friend_circle,270},1,0,[],[],[]}],0,0,0,0}],[],391,[]},{m_wedding,1,{0,[],0},[],0,[],[],[]},{m_constellation,2,0,[],[]},{m_investment,2,0,[],2,0,[]},{m_privilege,2,0,[],[],[]},{m_limit_return,1,1,1619876660,1619874045,1619874045,1637,0,0,[],0,300,1},{m_pray,0,3,1,0,[3,3],[{21220,0,1}],1,12140},{m_teacher,{0,[],0},2,[],0,[],0,0,[],[],[],[],[],0,0,[],0},{m_help,1,1,[],[],[],[]},{m_achieve_shop,5,[{5,[{ashop_goods_info,1,423,1,1619962007}]},{3,[{ashop_goods_info,1,0,1,0},{ashop_goods_info,1,218,1,0},{ashop_goods_info,1,217,1,0},{ashop_goods_info,1,201,1,0},{ashop_goods_info,1,212,1,0}]}],0,423,301,0,[],0,0,0},{m_brave_trial,2,0,[],[],0,0,[],0,[]},{m_camp_dragon_boat,0,0,0,[],0,0,0,[]},{m_over_seas,0},{m_hook_setting,2,0,[]},{m_tournament,3,[],0,[],0,0,0,[{king_badge,233,0,3,[{1,20},{5,4}],0},{king_badge,234,0,3,[{2,20},{6,5}],0},{king_badge,235,0,3,[{1,20},{6,5}],0},{king_badge,236,0,3,[{1,20},{7,4}],0},{king_badge,237,0,3,[{6,5},{7,4}],0},{king_badge,238,0,3,[{5,4},{6,5}],0},{king_badge,239,0,3,[{5,5},{4,4}],0},{king_badge,240,0,3,[{5,4},{2,20}],0},{king_badge,241,0,3,[{5,4},{7,4}],0}],0},{m_market_gold,1,[]},{m_goal,2,[{820125,1619876660},{800143,1619876660},{800142,1619876660},{800141,1619876660},{800140,1619876660},{800139,1619876660},{800138,1619876660},{800137,1619876660},{800136,1619876660},{800135,1619876660},{800125,1619876660},{800124,1619876660},{800123,1619876660},{800122,1619876660},{800121,1619876660},{800120,1619876660},{800119,1619876660},{800118,1619876660},{800117,1619876660},{800116,1619876660},{800115,1619876660},{800114,1619876660},{800113,1619876660},{800112,1619876660},{800111,1619876660},{800110,1619876660},{800095,1619876660},{800094,1619876660},{800093,1619876660},{800092,1619876660},{800091,1619876660},{800090,1619876660},{800089,1619876660},{810006,1619874045},{810005,1619874045},{810004,1619874045},{810003,1619874045},{810002,1619874045},{810001,1619874045},{810000,1619874045},{800150,1619874521},{800151,1619874521},{800152,1619874521},{800153,1619874521},{800154,1619874521},{800155,1619874525},{800156,1619874526}],[{quest,820156,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,6,[{star_lev,1}],0,{evt_wing_lev,1009},1,0,[],[],[]}],0,0,0,0},{quest,820109,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,1008},50,0,[],[],[]}],0,0,0,0},{quest,800173,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,6,[],0,{evt_blacksmith_embed_lev,1007},16,0,[],[],[]}],0,0,0,0},{quest,800172,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,5,[],0,{evt_blacksmith_embed_lev,1006},16,0,[],[],[]}],0,0,0,0},{quest,800171,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,4,[],0,{evt_blacksmith_embed_lev,1005},16,0,[],[],[]}],0,0,0,0},{quest,800170,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,5,[],0,{evt_blacksmith_embed_lev,1004},8,0,[],[],[]}],0,0,0,0},{quest,800169,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,5,[],0,{evt_blacksmith_embed_lev,1003},5,0,[],[],[]}],0,0,0,0},{quest,800168,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,4,[],0,{evt_blacksmith_embed_lev,1002},8,0,[],[],[]}],0,0,0,0},{quest,800167,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,7,[],0,{evt_blacksmith_embed_lev,1001},1,0,[],[],[]}],0,0,0,0},{quest,800166,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,6,[],0,{evt_blacksmith_embed_lev,1000},1,0,[],[],[]}],0,0,0,0},{quest,800165,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,5,[],0,{evt_blacksmith_embed_lev,999},1,0,[],[],[]}],0,0,0,0},{quest,800164,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,998},2100,0,[],[],[]}],0,0,0,0},{quest,800163,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,997},2000,0,[],[],[]}],0,0,0,0},{quest,800162,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,996},1950,0,[],[],[]}],0,0,0,0},{quest,800161,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,995},1900,0,[],[],[]}],0,0,0,0},{quest,800160,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,994},1850,0,[],[],[]}],0,0,0,0},{quest,800159,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,993},1800,0,[],[],[]}],0,0,0,0},{quest,800158,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,992},1700,0,[],[],[]}],0,0,0,0},{quest,800157,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,991},1600,0,[],[],[]}],0,0,0,0},{quest,800149,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,990},8,0,[],[],[]}],0,0,0,0},{quest,800148,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,989},7,0,[],[],[]}],0,0,0,0},{quest,800147,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,988},6,0,[],[],[]}],0,0,0,0},{quest,800146,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,987},5,0,[],[],[]}],0,0,0,0},{quest,800145,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,986},3,0,[],[],[]}],0,0,0,0},{quest,800144,[],1,1,0,0,[{quest_progress,0,evt_constellation,0,[],0,{evt_constellation,985},1,0,[],[],[]}],0,0,0,0},{quest,800134,[],1,1,0,0,[{quest_progress,0,evt_shipping_help,0,[],0,{evt_shipping_help,984},5,0,[],[],[]}],0,0,0,0},{quest,800133,[],1,1,0,0,[{quest_progress,0,evt_shipping_help,0,[],0,{evt_shipping_help,983},1,0,[],[],[]}],0,0,0,0},{quest,800132,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,982},12,0,[],[],[]}],0,0,0,0},{quest,800131,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,981},10,0,[],[],[]}],0,0,0,0},{quest,800130,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,980},8,0,[],[],[]}],0,0,0,0},{quest,800129,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,979},6,0,[],[],[]}],0,0,0,0},{quest,800128,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,978},5,0,[],[],[]}],0,0,0,0},{quest,800127,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,977},3,0,[],[],[]}],0,0,0,0},{quest,800126,[],1,1,0,0,[{quest_progress,0,evt_shipping_sail,0,[],0,{evt_shipping_sail,976},1,0,[],[],[]}],0,0,0,0},{quest,800109,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,975},40,0,[],[],[]}],0,0,0,0},{quest,800108,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,974},30,0,[],[],[]}],0,0,0,0},{quest,800107,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,973},20,0,[],[],[]}],0,0,0,0},{quest,800106,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,10008,[],0,{evt_skill_life_levup,972},10,0,[],[],[]}],0,0,0,0},{quest,800105,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,0,[],0,{evt_skill_life_levup,971},60,0,[],[],[]}],0,0,0,0},{quest,800104,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,0,[],0,{evt_skill_life_levup,970},50,0,[],[],[]}],0,0,0,0},{quest,800103,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,0,[],0,{evt_skill_life_levup,969},40,0,[],[],[]}],0,0,0,0},{quest,800102,[],1,1,0,0,[{quest_progress,0,evt_skill_life_levup,0,[],0,{evt_skill_life_levup,968},31,0,[],[],[]}],0,0,0,0},{quest,800101,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,71002,[],0,{evt_kill_npc,967},1,0,[],[],[]}],0,0,0,0},{quest,800100,[],1,1,0,0,[{quest_progress,0,evt_quest_guild_round,0,[],0,{evt_quest_guild_round,966},8,0,[],[],[]}],0,0,0,0},{quest,800099,[],1,1,0,0,[{quest_progress,0,evt_quest_guild_round,0,[],0,{evt_quest_guild_round,965},5,0,[],[],[]}],0,0,0,0},{quest,800098,[],1,1,0,0,[{quest_progress,0,evt_quest_guild_round,0,[],0,{evt_quest_guild_round,964},3,0,[],[],[]}],0,0,0,0},{quest,800097,[],1,1,0,0,[{quest_progress,0,evt_quest_guild_round,0,[],0,{evt_quest_guild_round,963},2,0,[],[],[]}],0,0,0,0},{quest,800096,[],1,1,0,0,[{quest_progress,0,evt_quest_guild_round,0,[],0,{evt_quest_guild_round,962},1,0,[],[],[]}],0,0,0,0},{quest,800088,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,961},1500,0,[],[],[]}],0,0,0,0},{quest,800087,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,960},1400,0,[],[],[]}],0,0,0,0},{quest,800086,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,959},1300,0,[],[],[]}],0,0,0,0},{quest,800085,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,958},1200,0,[],[],[]}],0,0,0,0},{quest,800084,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,957},1100,0,[],[],[]}],0,0,0,0},{quest,800083,[],1,1,0,0,[{quest_progress,0,evt_arena_cup,0,[],0,{evt_arena_cup,956},1050,0,[],[],[]}],0,0,0,0},{quest,800082,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,2,[],0,{evt_blacksmith_embed_lev,955},8,0,[],[],[]}],0,0,0,0},{quest,800081,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,2,[],0,{evt_blacksmith_embed_lev,954},5,0,[],[],[]}],0,0,0,0},{quest,800080,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,2,[],0,{evt_blacksmith_embed_lev,953},3,0,[],[],[]}],0,0,0,0},{quest,800079,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,952},8,0,[],[],[]}],0,0,0,0},{quest,800078,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,951},5,0,[],[],[]}],0,0,0,0},{quest,800077,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,950},3,0,[],[],[]}],0,0,0,0},{quest,800076,[],1,1,0,0,[{quest_progress,0,evt_blacksmith_embed_lev,1,[],0,{evt_blacksmith_embed_lev,949},1,0,[],[],[]}],0,0,0,0},{quest,800075,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,55499,[],0,{evt_kill_npc,948},1,0,[],[],[]}],0,0,0,0},{quest,800074,[],1,1,0,0,[{quest_progress,0,evt_trial,2,[],0,{evt_trial,947},5,0,[],[],[]}],0,0,0,0},{quest,800073,[],1,1,0,0,[{quest_progress,0,evt_trial,2,[],0,{evt_trial,946},3,0,[],[],[]}],0,0,0,0},{quest,800072,[],1,1,0,0,[{quest_progress,0,evt_trial,1,[],0,{evt_trial,945},6,0,[],[],[]}],0,0,0,0},{quest,800071,[],1,1,0,0,[{quest_progress,0,evt_trial,1,[],0,{evt_trial,944},5,0,[],[],[]}],0,0,0,0},{quest,800070,[],1,1,0,0,[{quest_progress,0,evt_trial,1,[],0,{evt_trial,943},3,0,[],[],[]}],0,0,0,0}],[{1,810000}],1,1619874045,[],[]},{m_family,1,{0,[],0},undefined,{0,[],0},{family_store,1,0,[]},[],[]},{m_charge_gift,1,0,1619876660,1619874045,0,0,0,0,[],0,0,0,[]},{m_mount,10,[],{mount_goal,1,[{500,1619874045},{1000,1619874063}],[],[]},1,0,[],[],[],[],0,[],{1,[],0},0},{m_camp_web,4,[],[],[],0,[],[],{0,0,0,[]}},{m_handbook,4,[],[],0,[{handbook_item,39,28691,1,75,0},{handbook_item,16,28643,1,32,0},{handbook_item,31,28683,1,32,0},{handbook_item,19,28646,1,45,0},{handbook_item,22,28649,1,53,0},{handbook_item,28,28680,1,32,0},{handbook_item,35,28687,1,48,0}],1619960400,[],[]},{m_endless_challenge,3,0,[],[],0,[],0,0,0},{m_lev_break,0,0,0,0,0},{m_head,2,0,0,0,[],0,0,0,[]},{m_extension,3,1,[],0,[],{0,[],0},[],[],0,0},{m_camp_cake,0,0,0,0,0,0,0,[],0,[]},{m_rainbow_lottery,1,[{rainbow_prize,1,1003,29384,1,0,250,15,1,50,0,1},{rainbow_prize,1,2004,23660,1,0,59,30,1,0,0,1},{rainbow_prize,1,3018,20062,1,0,50,40,0,0,0,1},{rainbow_prize,1,3020,20064,1,0,50,40,0,0,0,1},{rainbow_prize,1,4009,21421,1,0,100,60,0,0,0,1},{rainbow_prize,1,4006,23554,1,0,100,60,0,0,0,1},{rainbow_prize,1,5008,20653,1,0,9,260,0,0,0,0},{rainbow_prize,1,5004,20074,1,0,77,260,0,0,0,0},{rainbow_prize,1,5006,23555,1,0,77,260,0,0,0,0},{rainbow_prize,1,5014,20034,1,0,77,260,0,0,0,0},{rainbow_prize,1,6004,20060,1,0,41,200,0,0,0,0},{rainbow_prize,1,6018,20004,1,0,42,200,0,0,0,0},{rainbow_prize,1,6012,20004,1,0,42,200,0,0,0,0},{rainbow_prize,1,6022,20060,1,0,41,200,0,0,0,0},{rainbow_prize,1,6021,20052,1,0,42,200,0,0,0,0},{rainbow_prize,1,6007,20006,3,0,41,200,0,0,0,0}],0,[]},{m_sworn,0,{0,[],0},0,[],[],0},{m_gods_duel,2,{0,[],0},0},{m_preparation,0,undefined,0,0},{m_reward_back,3,1,[],1619872924,1619872924,40,1},{m_child,1,[],0,0,[]},{m_maze,4,0,10135,0,[{4,4},{2,4},{2,3},{3,4},{4,5}],[{maze_open,{1,1},1,1,1,0,3,2,0,0,0,0,[],0},{maze_open,{5,5},1,5,5,0,3,1,0,0,0,0,[],0}],[{{0,0},65,1,23529,1,1},{{0,0},163,2,6,1,4},{{0,0},10,1,20021,1,1},{{0,0},76,1,23532,1,1},{{0,0},75,1,23531,1,1},{{0,0},24,1,20087,1,3},{{0,0},24,1,20087,1,3},{{0,0},1,1,20052,1,1},{{0,0},86,1,20539,1,3},{{0,0},15,1,20088,1,1},{{0,0},37,1,21421,1,1},{{0,0},49,1,21850,1,1},{{0,0},149,2,1,1,1},{{5,4},6,1,20013,1,1},{{5,3},70,1,20531,1,1},{{5,2},137,1,21802,1,5},{{5,1},24,1,20087,1,1},{{4,3},65,1,23529,1,1},{{4,2},162,2,2,1,3},{{4,1},8,1,20020,2,1},{{3,5},52,1,90000,9000,1},{{3,3},73,1,20534,1,1},{{3,2},46,1,23522,1,1},{{3,1},21,1,20060,1,1},{{2,5},148,2,1,1,1},{{2,2},148,2,1,1,1},{{2,1},1,1,20052,1,1},{{1,5},1,1,20052,1,1},{{1,4},40,1,20521,1,1},{{1,3},36,1,21420,1,1},{{1,2},1,1,20052,1,1}],0,[],0,[],[],[],[]},{m_raffle,0,[]},{m_rencounter,1},{m_talisman,5,1,1,[],[],[],0,0,[],0,[],0,48},{m_month_gift,[]},{m_pay_turn,0,[]},{m_camp_box,0,[],[],[],0,0,0},{m_camp_pay_continus,0,0,[],0},{m_spirit_treasure,1,0,0,0,[],0,[]},{m_camp_discount,0,0,[],[],0,0},{m_camp_7_7th,{0,[],0},[],0,0,0,0,0,1,1619872924},{m_new_expression,[],[]},{m_exquisite_shelf,2,0,0,undefined,0,[],0,0},{m_camp_recharge,[]},{m_camp_recharge_gift,[]},{camp_collection,0,[],[],0,0},{m_camp_cut_price,0,[],[],undefined,[],[]},{m_camp_inquiry,1,[{camp_inquiry,1,860,[{camp_clue,1,6,83683,0,1},{camp_clue,1,5,83682,0,1},{camp_clue,1,4,83681,1,1}],0,-1,-1}]},{m_gods_place,3,0,0,0,0,0,0,1,1,0,0,0},{m_camp_slot_machine,1,0,[],0,[]},{m_camp_sign_draw,1,0,0,0,0,[],[]},{m_agenda_week,1,1,0,[],0},{m_exp_bottle,1,0,0,0,0},{m_camp_zillionaire,1,0,0,0,0,0,0,[],[]},{m_provocation,3,0,0,0,[],0,1,0,0,[],[],[],0,0},{m_oracle_treasure,2,0,0,0,[],0,[],0,0},{m_camp_pass_flower_language,1,0,[{7,0},{6,0},{5,0},{4,0},{3,0},{2,0},{1,0}],0},{m_camp_score_exchange,1,0,0,0,0,[],[]},{m_camp_pray,2,0,0,[],0,[]},{package,1,87,75,[69,70,71,72,73,74,75],[{item,0,86,21130,1,0,0,0,3,0,-1,0,0,0,2,68,0,0,[],[],35,0,2,[],[]},{item,0,85,20545,0,0,111,1,3,0,-1,0,0,0,2,67,0,0,[],[],1,0,2,[],[]},{item,0,84,22216,0,0,0,1,3,0,-1,0,0,0,2,65,0,0,[],[],1,0,2,[],[]},{item,0,82,23551,0,0,132,0,3,0,-1,0,0,0,1,66,0,0,[],[],75,0,2,[],[]},{item,0,73,22555,0,0,111,1,3,0,-1,0,0,0,6,63,0,0,[],[],70,0,2,[],[]},{item,0,71,22554,0,0,111,1,3,0,-1,0,0,0,8,62,0,0,[],[],60,0,2,[],[]},{item,0,65,22553,0,0,111,1,3,0,-1,0,0,0,8,61,0,0,[],[],50,0,2,[],[]},{item,0,74,22308,0,0,111,1,3,0,-1,0,0,0,1,59,0,0,[],[],1,0,2,[],[]},{item,0,36,20806,0,0,110,0,2,0,-1,0,0,0,50,56,0,0,[],[],40,0,2,[{1,720,[]},{2,1,[]},{3,2,[]}],[]},{item,0,35,20805,0,0,110,0,2,0,-1,0,0,0,50,55,0,0,[],[],40,0,2,[{1,810,[]},{2,1,[]},{3,2,[]}],[]},{item,0,34,20804,0,0,110,0,2,0,-1,0,0,0,50,54,0,0,[],[],40,0,2,[{1,720,[]},{2,1,[]},{3,2,[]}],[]},{item,0,33,20803,0,0,110,0,2,0,-1,0,0,0,50,53,0,0,[],[],40,0,2,[{1,720,[]},{2,1,[]},{3,2,[]}],[]},{item,0,32,20802,0,0,110,0,2,0,-1,0,0,0,50,52,0,0,[],[],40,0,2,[{1,810,[]},{2,1,[]},{3,2,[]}],[]},{item,0,31,20801,0,0,110,0,2,0,-1,0,0,0,50,51,0,0,[],[],40,0,2,[{1,1080,[]},{2,1,[]},{3,2,[]}],[]},{item,0,30,20800,0,0,110,0,2,0,-1,0,0,0,50,50,0,0,[],[],40,0,2,[{1,810,[]},{2,1,[]},{3,2,[]}],[]},{item,0,44,20659,0,0,110,0,4,0,-1,0,0,0,50,49,0,0,[],[],100,0,2,[{1,24300,[]},{2,1,[]},{3,2,[]}],[]},{item,0,43,20656,0,0,110,0,3,0,-1,0,0,0,50,48,0,0,[],[],90,0,2,[{1,8100,[]},{2,1,[]},{3,2,[]}],[]},{item,0,42,20653,0,0,110,0,3,0,-1,0,0,0,50,47,0,0,[],[],80,0,2,[{1,2700,[]},{2,1,[]},{3,2,[]}],[]},{item,0,76,20617,0,0,102,0,4,0,-1,0,0,0,1,46,0,0,[{attr_base,0,100,0,0,60152}],[],1,0,2,[],[]},{item,0,70,20617,0,0,102,0,4,0,-1,0,0,0,1,45,0,0,[{attr_base,0,100,0,0,60162}],[],1,0,2,[],[]},{item,0,61,20616,0,0,102,0,3,0,-1,0,0,0,1,44,0,0,[{attr_base,0,100,0,0,60013}],[],1,0,2,[],[]},{item,0,20,20615,0,0,102,0,2,0,-1,0,0,0,1,43,0,0,[{attr_base,0,100,0,0,60039}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,19,20615,0,0,102,0,2,0,-1,0,0,0,1,42,0,0,[{attr_base,0,100,0,0,60048}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,18,20615,0,0,102,0,2,0,-1,0,0,0,1,41,0,0,[{attr_base,0,100,0,0,60063}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,17,20615,0,0,102,0,2,0,-1,0,0,0,1,40,0,0,[{attr_base,0,100,0,0,60048}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,16,20615,0,0,102,0,2,0,-1,0,0,0,1,39,0,0,[{attr_base,0,100,0,0,60035}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,15,20615,0,0,102,0,2,0,-1,0,0,0,1,38,0,0,[{attr_base,0,100,0,0,60059}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,14,20615,0,0,102,0,2,0,-1,0,0,0,1,37,0,0,[{attr_base,0,100,0,0,60046}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,13,20615,0,0,102,0,2,0,-1,0,0,0,1,36,0,0,[{attr_base,0,100,0,0,60001}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,12,20615,0,0,102,0,2,0,-1,0,0,0,1,35,0,0,[{attr_base,0,100,0,0,60056}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,11,20615,0,0,102,0,2,0,-1,0,0,0,1,34,0,0,[{attr_base,0,100,0,0,60034}],[],1,0,2,[{1,4000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,22,20612,0,0,101,0,1,0,-1,0,0,0,10,32,0,0,[{attr_base,0,104,0,1,6}],[],30,0,2,[{1,2250,[]},{2,1,[]},{3,2,[]}],[]},{item,0,21,20600,0,0,101,0,1,0,-1,0,0,0,10,31,0,0,[{attr_base,0,101,0,1,6}],[],30,0,2,[{1,2250,[]},{2,1,[]},{3,2,[]}],[]},{item,0,62,20206,0,0,100,0,3,0,-1,0,0,0,1,30,0,0,[],[],1,0,2,[{1,36000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,26,20122,0,0,100,0,2,0,-1,0,0,0,99,29,0,0,[],[],1,0,2,[],[]},{item,0,25,20121,0,0,100,0,2,0,-1,0,0,0,99,28,0,0,[],[],1,0,2,[],[]},{item,0,27,20101,0,0,100,0,2,0,-1,0,0,0,3,27,0,0,[],[],1,0,2,[{1,3600,[]},{2,1,[]},{3,2,[]}],[]},{item,0,83,23746,0,0,111,1,3,0,-1,0,0,0,1,26,0,0,[],[],1,0,2,[],[]},{item,0,53,29560,0,0,0,1,3,0,-1,0,0,0,1,25,0,0,[],[],1,0,2,[],[]},{item,0,49,29545,0,0,0,1,3,0,-1,0,0,0,1,24,0,0,[],[],1,0,1,[],[]},{item,0,48,29545,0,0,0,1,3,0,-1,0,0,0,1,23,0,0,[],[],1,0,1,[],[]},{item,0,51,29484,0,0,0,1,3,0,-1,0,0,0,1,22,0,0,[],[],1,0,1,[],[]},{item,0,50,29484,0,0,0,1,3,0,-1,0,0,0,1,21,0,0,[],[],1,0,1,[],[]},{item,0,54,29277,0,0,0,1,3,0,-1,0,0,0,1,20,0,0,[],[],1,0,1,[],[]},{item,0,60,29008,0,0,0,1,3,0,-1,0,0,0,2,19,0,0,[],[],1,0,2,[],[]},{item,0,81,23550,0,0,0,0,3,0,-1,0,0,0,100,18,0,0,[],[],75,0,2,[{1,13500,[]},{2,1,[]},{3,2,[]}],[]},{item,0,67,22617,0,0,0,1,4,0,-1,0,0,0,1,17,0,0,[],[],1,0,2,[],[]},{item,0,79,21860,0,0,0,0,3,0,-1,0,0,0,1,16,0,0,[],[],40,0,2,[{1,24300,[]},{2,1,[]},{3,2,[]}],[]},{item,0,55,21220,0,0,0,0,2,0,-1,0,0,0,1,15,0,0,[],[],35,0,2,[],[]},{item,0,68,21101,0,0,0,0,3,0,-1,0,0,0,4,14,0,0,[],[],35,0,2,[{1,12600,[]},{2,1,[]},{3,2,[]}],[]},{item,0,37,20520,0,0,0,0,2,0,-1,0,0,0,50,13,0,0,[],[],40,0,2,[{1,585,[]},{2,1,[]},{3,2,[]}],[]},{item,0,29,20405,0,0,0,0,4,0,-1,0,0,0,99,12,0,0,[],[],1,0,2,[{1,22500,[]},{2,1,[]},{3,2,[]}],[]},{item,0,28,20405,0,0,0,0,4,0,-1,0,0,0,1,11,0,0,[],[],1,0,2,[{1,22500,[]},{2,1,[]},{3,2,[]}],[]},{item,0,78,20400,0,0,0,0,3,0,-1,0,0,0,6,10,0,0,[],[],50,0,2,[{1,2250,[]},{2,1,[]},{3,2,[]}],[]},{item,0,39,20095,0,0,0,0,3,0,-1,0,0,0,1,9,0,0,[],[],30,0,2,[{1,10350,[]},{2,1,[]},{3,2,[]}],[]},{item,0,57,20046,0,0,0,0,3,0,-1,0,0,0,4,8,0,0,[],[],20,0,2,[{1,7200,[]},{2,1,[]},{3,2,[]}],[]},{item,0,24,20040,0,0,0,0,3,0,-1,0,0,0,10,7,0,0,[],[],1,0,2,[{1,13500,[]},{2,1,[]},{3,2,[]}],[]},{item,0,23,20039,0,0,0,0,3,0,-1,0,0,0,10,6,0,0,[],[],1,0,2,[{1,4500,[]},{2,1,[]},{3,2,[]}],[]},{item,0,63,20020,0,0,0,0,2,0,-1,0,0,0,20,4,0,0,[],[],50,0,2,[{1,900,[]},{2,1,[]},{3,2,[]}],[]},{item,0,75,20011,0,0,0,0,3,0,-1,0,0,0,2,3,0,0,[],[],1,0,2,[{1,20000,[]},{2,1,[]},{3,2,[]}],[]},{item,0,69,20006,0,0,0,0,2,0,-1,0,0,0,810,2,0,0,[],[],5,0,2,[],[]},{item,0,45,22600,1,0,111,1,3,0,-1,0,0,0,1,64,0,0,[],[],1,0,2,[],[]},{item,0,47,22546,1,0,111,1,2,0,-1,0,0,0,1,60,0,0,[],[],1,0,2,[],[]},{item,0,46,22302,1,0,111,1,3,0,-1,0,0,0,2,58,0,0,[],[],1,0,2,[],[]},{item,0,40,22300,1,0,111,1,4,0,-1,0,0,0,2,57,0,0,[],[],1,0,2,[],[]},{item,0,6,20615,1,0,102,0,2,0,-1,0,0,0,1,33,0,0,[{attr_base,0,100,0,0,60076}],[],1,0,2,[],[]},{item,0,3,20025,1,0,0,0,2,0,-1,0,0,0,2,5,0,0,[],[],30,0,2,[],[]},{item,0,7,20006,1,0,0,0,2,0,-1,0,0,0,13,1,0,0,[],[],5,0,2,[],[]}]},{package,2,1,25,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],[]},{package,3,1,20,[9,10,11,12,13,14,15,16,17,18,19,20],[{item,0,4,10584,0,0,9,3,4,0,12,0,0,0,1,4,0,0,[{attr_base,0,25,9,1,114},{attr_base,0,1,8,1,759},{attr_base,1,25,0,1,27},{attr_base,1,1,0,1,546},{attr_base,2,103,1071,1,17}],[],80,0,2,[{23,12,[]}],[]},{item,0,3,10582,0,0,7,3,4,0,12,0,0,0,1,3,0,0,[{attr_base,0,7,6,1,254},{attr_base,0,5,9,1,855},{attr_base,1,7,0,1,183},{attr_base,1,5,0,1,205},{attr_base,2,101,3012,1,-5},{attr_base,2,103,3061,1,28}],[],80,0,2,[{23,12,[]}],[]},{item,0,2,10581,0,0,6,3,4,0,12,0,0,0,1,2,0,0,[{attr_base,0,26,7,1,109},{attr_base,0,4,7,1,526},{attr_base,1,26,0,1,26},{attr_base,1,4,0,1,126},{attr_base,2,105,4042,1,11},{attr_base,2,101,4101,1,14}],[],80,0,2,[{23,12,[]}],[]},{item,0,8,10696,0,0,14,3,4,0,12,0,0,0,1,8,0,0,[{attr_base,0,6,9,1,216},{attr_base,0,3,8,1,76},{attr_base,1,6,0,1,156},{attr_base,1,3,0,1,36},{attr_base,2,104,3072,1,-7},{attr_base,2,101,3041,1,29}],[],90,6,2,[{23,12,[]}],[]},{item,0,7,10694,0,0,12,3,4,0,12,0,0,0,1,7,0,0,[{attr_base,0,7,8,1,441},{attr_base,0,2,3,1,805},{attr_base,1,57,12,3,30},{attr_base,1,2,0,1,386},{attr_base,1,7,0,1,318},{attr_base,2,105,3112,1,-8},{attr_base,2,101,3111,1,36}],[],90,6,2,[{23,12,[]}],[]},{item,0,6,10693,0,0,11,3,4,0,12,0,0,0,1,6,0,0,[{attr_base,0,6,13,1,112},{attr_base,0,1,7,1,1955},{attr_base,1,6,0,1,81},{attr_base,1,1,0,1,1408},{attr_base,2,103,2081,1,25}],[],90,6,2,[{23,12,[]}],[]},{item,0,5,10692,0,0,10,3,4,0,12,0,0,0,1,5,0,0,[{attr_base,0,6,9,1,751},{attr_base,1,56,12,3,30},{attr_base,1,6,0,1,541},{attr_base,2,102,2081,1,25}],[],90,6,2,[{23,12,[]}],[]},{item,0,1,10691,0,10503,21,3,4,0,12,0,0,0,1,1,0,0,[{attr_base,0,43,4,1,1226},{attr_base,0,5,3,1,452},{attr_base,0,4,9,1,1444},{attr_base,1,55,12,3,30},{attr_base,1,43,0,1,294},{attr_base,1,5,0,1,108},{attr_base,1,4,0,1,347},{attr_base,2,103,4052,1,13},{attr_base,2,105,4111,1,16}],[],90,6,2,[{23,12,[]}],[]}]},{package,4,1,0,[],[]}}'),(2,'dev',1,'test123',0,'5470','贝利托特',0,'127.0.0.1',1793086326,'127.0.0.1',1793177534,1793173301,0,1,6,24,76,'{role,76,undefined,31,false,true,{1793177534,1793173301},1793086326,{127,0,0,1},{127,0,0,1},0,{2,[100,101,118],1},[100,101,118],1,0,[53,52,55,48],[118,105,114,116,117,97,108,95,49,55,57,51,48,54,55,56,54,54,95,53,48,51,50],1,[],[116,101,115,116,49,50,51],[36125,21033,25176,29305],0,0,0,1,6,24,0,260,1515,1080,1,1,1,{assets,41,23182,546119,0,0,0,0,0,0,292,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{attr,3,0,260,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},undefined,{1,[]},{rtimer,undefined,undefined,[]},{pos,10001,[100,101,118],1,undefined,10001,undefined,undefined,0,1975,1951,7},[],0,0,0,0,undefined,0,[],[],false,[],0,{m_attr_point,2,[],0,1,[{attr_point_plan,1,[],1,1,93,1,24,0,0,4,0,1}],0},{m_combat,3,undefined,undefined,0,[],[],[],0},{m_quest,19,[{quest,20506,[],1,4,0,0,[{quest_progress,0,evt_get_item,21411,[{monitor},{type,item}],0,{evt_get_item,300},1,0,[91,49,44,49,48,93],[{3,21411}],[]}],1793178376,0,0,0},{quest,41011,[],2,13,0,0,[{quest_progress,0,evt_arena_fight,0,[],0,{evt_arena_fight,265},1,0,[91,57,57,44,49,50,50,48,48,93],[],[]}],0,0,0,0},{quest,41012,[],2,13,0,0,[{quest_progress,0,evt_teacher_to_sudent,0,[],0,{evt_teacher_to_sudent,264},1,0,[91,49,44,50,93],[],[]}],0,0,0,0},{quest,41140,[],2,13,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,263},1,0,[91,57,57,44,49,49,56,48,48,93],[],[]}],0,0,0,0},{quest,41218,[],2,13,0,0,[{quest_progress,0,evt_skill_life_produce,0,[],0,{evt_skill_life_produce,262},1,0,[91,57,57,44,49,48,56,48,48,44,51,93],[],[]}],0,0,0,0},{quest,41220,[],2,13,0,0,[{quest_progress,0,evt_market_silver_first_on_sale,0,[],0,{evt_market_silver_first_on_sale,261},1,0,[91,57,57,44,49,50,52,48,49,93],[],[]}],0,0,0,0},{quest,41770,[],2,13,0,0,[{quest_progress,0,evt_skill_up,25,[],0,{evt_skill_up,260},4,0,[91,57,57,44,49,48,56,48,48,93],[],[]}],0,0,0,0},{quest,41790,[],2,13,0,0,[{quest_progress,0,evt_combat_over,13,[win],0,{evt_combat_over,259},5,0,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0},{quest,41800,[],2,13,0,0,[{quest_progress,0,evt_pet_add_point,0,[],0,{evt_pet_add_point,258},1,0,[91,57,57,44,49,48,53,48,48,93],[],[]}],0,0,0,0},{quest,41820,[],2,13,0,0,[{quest_progress,0,evt_market_gold_bind_sold,0,[],0,{evt_market_gold_bind_sold,257},1,0,[91,57,57,44,49,50,52,48,48,93],[],[]}],0,0,0,0},{quest,41830,[],2,13,0,0,[{quest_progress,0,evt_wing_lev,0,[{star_lev,3}],0,{evt_wing_lev,256},1,0,[91,57,57,44,49,48,51,48,48,44,51,93],[],[]}],0,0,0,0},{quest,22310,[],1,1,1,0,[{quest_progress,0,evt_levup,0,[],1,undefined,20,20,[91,93],[],[]}],0,0,0,0},{quest,41760,[],2,13,0,0,[{quest_progress,0,evt_skill_up,15,[],0,{evt_skill_up,12},3,0,[91,57,57,44,49,48,56,48,48,93],[],[]}],0,0,0,0},{quest,41060,[],2,13,1,0,[{quest_progress,0,evt_commit_quest,0,[{quest_classes,10}],1,undefined,1,1,[91,57,57,44,49,50,48,48,50,93],[],[]}],0,0,0,0}],[],[22280,22290,22300,22270,22264,22260,22230,22222,22220,22210,22200,22190,22170,22160,22126,22124,22100,22090,22084,22080,22066,22060,22054,22050,22030,22000],[],{quest_classes,20506,1,1,10,9,[{20506,1},{20560,1},{20500,1},{20585,1},{20504,1},{20529,1},{20503,1},{20563,1},{20501,1},{20522,1}]},{quest_offer,0,0,0,0,0,0,[]},{quest_prac,1,2,0},{quest_treasure,0,0,0},{quest_guild,0,0,1,0,0,[]},{quest_chain,0,0,0,[],0,0,undefined},{quest_marriage,0,0,0,0,0,#{mid=>0,robot_id=>undefined}},{quest_couple,0,0,0,0,0,undefined,#{mid=>0,partner_name=>[],robot_id=>undefined,triggers=>[]}},{quest_plant,0,0,0,0,0,0,{0,0,0},[]},{quest_teacher,0,0,0,undefined,0,0,[],#{appoint_trigger=>undefined,ask_id=>{<<>>,0,0},ask_start_time=>0}},{quest_shipping,[]},{quest_pursue,0,0,0,1,0,0,[]},2,{quest_child,0,0,0,0,1,0,[]},{quest_pregnancy,0,0,0,0,1,[]},{quest_acquaintance,0,0,0,0,0,[],[],0,0},{quest_king,1,1,[],[],0},{quest_summer,1,[],[],0,[]},{quest_single_dog,1,[],1,#{}},{quest_sign_draw,[],[]},{quest_score_exchange,[],[]},{quest_long_active,[],[]}},{m_pet,2,4,5,[{pet,32,3,2,[20845,32819,29461,29492],10,3823,1300,5,0,2,93857,1294,1,20057,{attr,3,0,520,1905,1751,37,207,210,241,126,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,11,11,11,11,11,0},1905,1751,1905,1751,{pet_attr,45,11,11,11,11,11,0,0,0,0,0,0,0,0,0,0,1700,1500,1670,1700,1750,1700,1500,1670,1700,1750},99999,[],[{pet_skill,67315,1,1,1,1073,1,0,0},{pet_skill,60285,1,1,1,1006,1,0,0},{pet_skill,60308,1,1,1,1014,1,0,0},{pet_skill,60282,1,1,1,1003,1,0,0},{pet_skill,60284,1,1,1,1005,1,0,0},{pet_skill,67308,1,1,1,1068,1,0,0},{pet_skill,67314,1,1,1,1072,1,0,0},{pet_skill,67316,1,1,2,1074,1,0,0}],1,0,[],[],[],0,0,[],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,4,1,0,0,0,0,[]},{pet_rune,3,1,0,0,0,0,[]},{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]},{pet,32,1,1,[27874,27874],14,2146,679,4,0,0,408,1405,0,10001,{attr,3,0,520,1167,868,35,364,130,148,119,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,67,28,15,15,15,0},1167,868,1167,868,{pet_attr,0,67,28,15,15,15,0,0,0,0,0,0,0,0,0,0,1188,1265,1009,831,1246,1188,1265,1009,831,1246},8111,[],[{pet_skill,60033,1,1,1,33,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0},{pet_skill,60039,1,1,1,39,1,0,0}],1,0,[],[],[],0,0,[{1,[20154,23478,33258,24102,36830,20987,36861,20987,21734,27874,123,102,97,99,101,95,49,44,49,125]},{2,[30475,25105,30340,36830,20987,36861,20987,27969,123,102,97,99,101,95,49,44,51,54,125]},{3,[20307,21147,21152,28857,33021,35753,25105,26356,25239,25549,27874,123,102,97,99,101,95,49,44,32,49,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]},{pet,32,2,1,[33457,33721],16,2108,721,4,0,0,720,5328,0,10003,{attr,3,0,520,1455,934,42,480,174,198,155,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,77,32,17,17,17,0},1455,934,1455,934,{pet_attr,0,77,32,17,17,17,0,0,0,0,0,0,0,0,0,0,1188,1365,1093,890,1188,1188,1365,1093,890,1188},7673,[],[{pet_skill,60038,1,1,1,38,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0}],1,0,[],[],[],0,0,[{1,[33258,24102,39640,32423,36830,20987,30340,24378,21147,23456,29289,23601,26159,25105,21862,123,102,97,99,101,95,49,44,50,48,125]},{2,[27599,27425,21319,32423,35760,24471,32473,25105,21152,28857,21734,123,102,97,99,101,95,49,44,32,55,125]},{3,[23567,24515,25105,20027,20154,25549,20320,21734,123,102,97,99,101,95,49,44,32,50,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,1,0,{pet_attr,0,72,30,16,16,16,0,0,0,0,0,0,0,0,0,0,1213,1394,1093,890,1188,1213,1394,1093,890,1188},[{pet_skill,60038,1,1,1,38,1,0,0},{pet_skill,60081,1,1,1,81,1,0,0},{pet_skill,60137,1,1,2,37,1,0,0}],700,3,8027,2326},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]}],3,5,1793203200},{m_skill,6,[{69001,12},{69002,12},{69004,0},{69003,0},{69005,0},{69006,0},{69007,0},{69008,0}],1,62000,[],[],[],[],[],[],0,100,0,0,[]},{m_var,1,1793150003,1793150003,1793086326,[{1011,2},{14,10},{631,36},{11,31}],[{129,13},{143,21600}],[],1793178374,21702,[{1016,2},{1001,440}],[{2094,1},{2000,{95,0}},{2134,1},{2137,1},{2022,{card_state,0,0,0,0,0,0,1793150003}},{2115,0},{2032,[]},{2110,1},{2102,1},{2118,1},{2105,1},{2136,1},{2123,1},{2124,1},{2125,[{fashion_repaire,1}]},{2023,[create_1,compensate_1]},{2010,1}]},{m_guard,1,[4,5],[],[],[{guard,2,1012,3,[34013,38639],[34013,38639],2,1,1,0,[61065,61066],[{guard_eqm,5,41022,19,20,[{attr_base,0,7,14,1,36},{attr_base,0,5,14,1,203}],0,[],[],1,0,0,[]},{guard_eqm,5,41024,20,20,[{attr_base,0,6,14,1,15},{attr_base,0,1,14,1,428}],0,[],[],1,0,0,[]},{guard_eqm,5,41026,18,20,[{attr_base,0,6,14,1,29},{attr_base,0,3,14,1,47}],0,[],[],1,0,0,[]},{guard_eqm,5,41025,17,20,[{attr_base,0,7,14,1,54},{attr_base,0,2,14,1,406}],0,[],[],1,0,0,[]},{guard_eqm,5,41023,16,20,[{attr_base,0,6,14,1,99}],0,[],[],1,0,0,[]},{guard_eqm,5,41021,15,20,[{attr_base,0,43,14,1,287},{attr_base,0,5,14,1,109},{attr_base,0,4,14,1,304}],0,[],[],1,0,0,[]}],{attr,3,0,0,1854,2898,80,733,914,361,478,0,0,0,0,0,0,0,0,0,11,11,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0},264,{guard_astroid,2,[],[],[],380,0}},{guard,2,1002,2,[33778,38597],[33778,38597],1,1,1,0,[61006,61005],[{guard_eqm,5,40022,19,20,[{attr_base,0,7,14,1,36},{attr_base,0,5,14,1,203}],0,[],[],1,0,0,[]},{guard_eqm,5,40024,20,20,[{attr_base,0,6,14,1,15},{attr_base,0,1,14,1,428}],0,[],[],1,0,0,[]},{guard_eqm,5,40026,18,20,[{attr_base,0,6,14,1,29},{attr_base,0,3,14,1,47}],0,[],[],1,0,0,[]},{guard_eqm,5,40025,17,20,[{attr_base,0,7,14,1,54},{attr_base,0,2,14,1,406}],0,[],[],1,0,0,[]},{guard_eqm,5,40023,16,20,[{attr_base,0,6,14,1,99}],0,[],[],1,0,0,[]},{guard_eqm,5,40021,15,20,[{attr_base,0,43,14,1,287},{attr_base,0,5,14,1,109},{attr_base,0,4,14,1,304}],0,[],[],1,0,0,[]}],{attr,3,0,0,1772,2898,105,938,627,349,272,0,0,0,0,0,0,0,0,0,11,11,0,0,0,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,0,0,0,0},236,{guard_astroid,2,[],[],[],320,0}}]},{m_plot,1,1,[30000,70390,70386,70384,70380,70374,70372,70360,30200,70350,70347,70346,70332,70330,70320,70310,70300,70193,70194,70192,70190,70185,70048,70060,70184,30150,70180,70177,70176,70174,70140,70046,70044,70050,70040,70039,70038,70037,70035,70020,70000,100,70036,110],[],[{plot,30020,0,0},{plot,10400,0,0},{plot,10372,0,0},{plot,10046,0,0},{plot,10044,0,0},{plot,10574,0,0},{plot,10510,0,0},{plot,10440,0,0}],[{plot,70010,0,0},{plot,120,0,0},{plot,101,0,0}],[1000,15,22],[{plot_unit,10040,[22307,24515,22478],40005,1,1,0,20001,1517,262,7,[115,116,97,110,100],[],0,0,0,0,0}],[],[],0,0,[],[],0},{m_dungeon,4,0,0,[],[],0},undefined,undefined,{m_option,1,[]},{m_wing,11,0,1,0,0,0,[],0,0,0,2,1,[{wing_skill_plan,1,[],[],[]}],0,0,[],[],50,0,0,[],1,[],100},{m_team,0,undefined,3,[],0,0,0,[1,2,3,4,5],[],0},{m_honor,3,0,0,[],0,[],[]},{m_friend,2,[],0,0,1,0,0,0,[],0,1,1,1,[],[],0,0,[],0},{m_wake,0,0,0,0,0,0,0,0,[],[]},{m_arena,1,0,0,1000,0,0,[{arena_graph,1,90012,5,0,1},{arena_graph,2,20006,3,0,1},{arena_graph,3,90012,4,0,1},{arena_graph,4,90012,6,0,1},{arena_graph,5,20020,1,0,2},{arena_graph,6,90012,7,0,2},{arena_graph,7,90012,5,0,2},{arena_graph,8,90012,7,0,2},{arena_graph,9,90012,8,0,3},{arena_graph,10,90012,6,0,3},{arena_graph,11,90012,7,0,3},{arena_graph,12,90012,8,0,3},{arena_graph,13,90012,7,0,4},{arena_graph,14,20007,1,0,4},{arena_graph,15,90012,9,0,4},{arena_graph,16,90012,8,0,4}]},{m_market_silver,1,1793178385,1,[{1,[{market_silver_refresh,1,20320,3,[],21926,0,undefined,0},{market_silver_refresh,2,21524,3,[],229320,0,undefined,0},{market_silver_refresh,3,21521,3,[],241500,0,undefined,0},{market_silver_refresh,4,20320,3,[],21715,0,undefined,0},{market_silver_refresh,5,20310,3,[],22286,0,undefined,0},{market_silver_refresh,6,21525,2,[],243080,0,undefined,0},{market_silver_refresh,7,21525,4,[],219520,0,undefined,0},{market_silver_refresh,8,21524,3,[],244420,0,undefined,0},{market_silver_refresh,9,20320,2,[],20449,0,undefined,0},{market_silver_refresh,10,20310,2,[],19230,0,undefined,0},{market_silver_refresh,11,21525,2,[],210120,0,undefined,0},{market_silver_refresh,12,20042,4,[],630240,0,undefined,0},{market_silver_refresh,13,20320,4,[],21897,0,undefined,0},{market_silver_refresh,14,20042,2,[],731520,0,undefined,0},{market_silver_refresh,15,21522,2,[],258000,0,undefined,0},{market_silver_refresh,16,21521,2,[],205640,0,undefined,0},{market_silver_refresh,17,20310,4,[],22562,0,undefined,0},{market_silver_refresh,18,20310,2,[],19935,0,undefined,0},{market_silver_refresh,19,21525,4,[],216000,0,undefined,0},{market_silver_refresh,20,21521,3,[],229320,0,undefined,0},{market_silver_refresh,21,21521,3,[],255840,0,undefined,0},{market_silver_refresh,22,21525,3,[],199980,0,undefined,0},{market_silver_refresh,23,21524,3,[],237160,0,undefined,0},{market_silver_refresh,24,21521,2,[],224640,0,undefined,0},{market_silver_refresh,25,21524,2,[],198000,0,undefined,0},{market_silver_refresh,26,20310,4,[],21893,0,undefined,0},{market_silver_refresh,27,20042,2,[],758520,0,undefined,0},{market_silver_refresh,28,20310,4,[],19354,0,undefined,0},{market_silver_refresh,29,21521,2,[],247200,0,undefined,0},{market_silver_refresh,30,21524,2,[],237600,0,undefined,0},{market_silver_refresh,31,20320,2,[],18675,0,undefined,0},{market_silver_refresh,32,20042,3,[],668160,0,undefined,0},{market_silver_refresh,33,20320,3,[],20647,0,undefined,0},{market_silver_refresh,34,21522,3,[],211860,0,undefined,0},{market_silver_refresh,35,20042,3,[],611820,0,undefined,0},{market_silver_refresh,36,21524,4,[],273000,0,undefined,0},{market_silver_refresh,37,20310,2,[],19590,0,undefined,0},{market_silver_refresh,38,21521,4,[],246380,0,undefined,0},{market_silver_refresh,39,21522,2,[],204000,0,undefined,0},{market_silver_refresh,40,21524,4,[],220480,0,undefined,0},{market_silver_refresh,41,21525,3,[],215600,0,undefined,0},{market_silver_refresh,42,21522,2,[],195840,0,undefined,0},{market_silver_refresh,43,20042,4,[],630240,0,undefined,0},{market_silver_refresh,44,20320,3,[],18507,0,undefined,0},{market_silver_refresh,45,20042,3,[],753960,0,undefined,0},{market_silver_refresh,46,20320,2,[],20071,0,undefined,0},{market_silver_refresh,47,21525,4,[],210080,0,undefined,0},{market_silver_refresh,48,20310,4,[],18817,0,undefined,0},{market_silver_refresh,49,20310,3,[],19597,0,undefined,0},{market_silver_refresh,50,21524,4,[],219520,0,undefined,0},{market_silver_refresh,51,20042,2,[],748440,0,undefined,0},{market_silver_refresh,52,21524,2,[],210000,0,undefined,0},{market_silver_refresh,53,20320,2,[],18870,0,undefined,0},{market_silver_refresh,54,21525,2,[],194000,0,undefined,0},{market_silver_refresh,55,21522,4,[],210000,0,undefined,0},{market_silver_refresh,56,20042,2,[],678722,0,undefined,0},{market_silver_refresh,57,21522,3,[],216300,0,undefined,0},{market_silver_refresh,58,21522,4,[],236900,0,undefined,0},{market_silver_refresh,59,21522,4,[],235200,0,undefined,0},{market_silver_refresh,60,21521,4,[],193920,0,undefined,0},{market_silver_refresh,61,20320,3,[],18155,0,undefined,0},{market_silver_refresh,62,20310,3,[],20449,0,undefined,0},{market_silver_refresh,63,21524,2,[],201760,0,undefined,0},{market_silver_refresh,64,21521,4,[],243540,0,undefined,0},{market_silver_refresh,65,21525,2,[],259560,0,undefined,0},{market_silver_refresh,66,21524,3,[],239400,0,undefined,0},{market_silver_refresh,67,21525,3,[],254100,0,undefined,0},{market_silver_refresh,68,21522,2,[],214200,0,undefined,0},{market_silver_refresh,69,20042,2,[],744960,0,undefined,0},{market_silver_refresh,70,21521,3,[],249900,0,undefined,0},{market_silver_refresh,71,20320,3,[],17599,0,undefined,0},{market_silver_refresh,72,21522,3,[],235202,0,undefined,0},{market_silver_refresh,73,21522,2,[],235200,0,undefined,0},{market_silver_refresh,74,21521,4,[],236000,0,undefined,0},{market_silver_refresh,75,20042,3,[],703800,0,undefined,0},{market_silver_refresh,76,21525,2,[],207360,0,undefined,0},{market_silver_refresh,77,21521,2,[],252000,0,undefined,0},{market_silver_refresh,78,20310,3,[],19844,0,undefined,0},{market_silver_refresh,79,20310,2,[],21507,0,undefined,0},{market_silver_refresh,80,20320,4,[],23044,0,undefined,0}]},{2,[{market_silver_refresh,1,21400,1,[],4104,0,undefined,0},{market_silver_refresh,2,21405,1,[{1,10}],43512,0,undefined,0},{market_silver_refresh,3,21407,1,[{1,10}],101920,0,undefined,0},{market_silver_refresh,4,21403,1,[{1,10}],49852,0,undefined,0},{market_silver_refresh,5,21405,1,[{1,10}],43512,0,undefined,0},{market_silver_refresh,6,21401,1,[{1,10}],85995,0,undefined,0},{market_silver_refresh,7,21406,1,[{1,10}],43269,0,undefined,0},{market_silver_refresh,8,21404,1,[{1,10}],49500,0,undefined,0},{market_silver_refresh,9,21402,1,[{1,10}],46512,0,undefined,0},{market_silver_refresh,10,21404,1,[{1,10}],41184,0,undefined,0},{market_silver_refresh,11,21408,1,[{1,10}],72033,0,undefined,0},{market_silver_refresh,12,21403,1,[{1,10}],39964,0,undefined,0},{market_silver_refresh,13,21401,1,[{1,10}],82418,0,undefined,0},{market_silver_refresh,14,21407,1,[{1,10}],85648,0,undefined,0},{market_silver_refresh,15,21406,1,[{1,10}],43697,0,undefined,0},{market_silver_refresh,16,21405,1,[{1,10}],41612,0,undefined,0},{market_silver_refresh,17,21406,1,[{1,10}],38134,0,undefined,0},{market_silver_refresh,18,21405,1,[{1,10}],47124,0,undefined,0},{market_silver_refresh,19,21400,1,[],4050,0,undefined,0},{market_silver_refresh,20,21402,1,[{1,10}],53040,0,undefined,0},{market_silver_refresh,21,21405,1,[{1,10}],52000,0,undefined,0},{market_silver_refresh,22,21402,1,[{1,10}],52832,0,undefined,0},{market_silver_refresh,23,21404,1,[{1,10}],41200,0,undefined,0},{market_silver_refresh,24,21408,1,[{1,10}],70422,0,undefined,0},{market_silver_refresh,25,21404,1,[{1,10}],45600,0,undefined,0},{market_silver_refresh,26,21402,1,[{1,10}],47124,0,undefined,0},{market_silver_refresh,27,21407,1,[{1,10}],85680,0,undefined,0},{market_silver_refresh,28,21407,1,[{1,10}],91560,0,undefined,0},{market_silver_refresh,29,21405,1,[{1,10}],49000,0,undefined,0},{market_silver_refresh,30,21400,1,[],4561,0,undefined,0},{market_silver_refresh,31,21401,1,[{1,10}],85260,0,undefined,0},{market_silver_refresh,32,21407,1,[{1,10}],96288,0,undefined,0},{market_silver_refresh,33,21403,1,[{1,10}],51584,0,undefined,0},{market_silver_refresh,34,21403,1,[{1,10}],49028,0,undefined,0},{market_silver_refresh,35,21404,1,[{1,10}],45250,0,undefined,0},{market_silver_refresh,36,21403,1,[{1,10}],51168,0,undefined,0},{market_silver_refresh,37,21404,1,[{1,10}],48300,0,undefined,0},{market_silver_refresh,38,21406,1,[{1,10}],43124,0,undefined,0},{market_silver_refresh,39,21408,1,[{1,10}],78104,0,undefined,0},{market_silver_refresh,40,21408,1,[{1,10}],74818,0,undefined,0},{market_silver_refresh,41,21401,1,[{1,10}],86572,0,undefined,0},{market_silver_refresh,42,21402,1,[{1,10}],45864,0,undefined,0},{market_silver_refresh,43,21408,1,[{1,10}],73260,0,undefined,0},{market_silver_refresh,44,21405,1,[{1,10}],50096,0,undefined,0},{market_silver_refresh,45,21402,1,[{1,10}],51000,0,undefined,0},{market_silver_refresh,46,21401,1,[{1,10}],82568,0,undefined,0},{market_silver_refresh,47,21407,1,[{1,10}],95648,0,undefined,0},{market_silver_refresh,48,21406,1,[{1,10}],37065,0,undefined,0},{market_silver_refresh,49,21400,1,[],3852,0,undefined,0},{market_silver_refresh,50,21404,1,[{1,10}],45080,0,undefined,0},{market_silver_refresh,51,21400,1,[],4590,0,undefined,0},{market_silver_refresh,52,21403,1,[{1,10}],44928,0,undefined,0},{market_silver_refresh,53,21406,1,[{1,10}],40824,0,undefined,0},{market_silver_refresh,54,21401,1,[{1,10}],88357,0,undefined,0},{market_silver_refresh,55,21402,1,[{1,10}],47724,0,undefined,0},{market_silver_refresh,56,21404,1,[{1,10}],42768,0,undefined,0},{market_silver_refresh,57,21400,1,[],4450,0,undefined,0},{market_silver_refresh,58,21407,1,[{1,10}],108360,0,undefined,0},{market_silver_refresh,59,21405,1,[{1,10}],48480,0,undefined,0},{market_silver_refresh,60,21406,1,[{1,10}],47250,0,undefined,0},{market_silver_refresh,61,21401,1,[{1,10}],83430,0,undefined,0},{market_silver_refresh,62,21403,1,[{1,10}],51584,0,undefined,0},{market_silver_refresh,63,21408,1,[{1,10}],67980,0,undefined,0},{market_silver_refresh,64,21402,1,[{1,10}],41160,0,undefined,0},{market_silver_refresh,65,21405,1,[{1,10}],49500,0,undefined,0},{market_silver_refresh,66,21403,1,[{1,10}],43560,0,undefined,0},{market_silver_refresh,67,21406,1,[{1,10}],46905,0,undefined,0},{market_silver_refresh,68,21401,1,[{1,10}],88027,0,undefined,0},{market_silver_refresh,69,21401,1,[{1,10}],95288,0,undefined,0},{market_silver_refresh,70,21400,1,[],4160,0,undefined,0},{market_silver_refresh,71,21406,1,[{1,10}],36691,0,undefined,0},{market_silver_refresh,72,21408,1,[{1,10}],86335,0,undefined,0},{market_silver_refresh,73,21407,1,[{1,10}],78336,0,undefined,0},{market_silver_refresh,74,21400,1,[],4347,0,undefined,0},{market_silver_refresh,75,21408,1,[{1,10}],73497,0,undefined,0},{market_silver_refresh,76,21404,1,[{1,10}],47336,0,undefined,0},{market_silver_refresh,77,21402,1,[{1,10}],48552,0,undefined,0},{market_silver_refresh,78,21407,1,[{1,10}],85248,0,undefined,0},{market_silver_refresh,79,21408,1,[{1,10}],82467,0,undefined,0},{market_silver_refresh,80,21403,1,[{1,10}],41088,0,undefined,0}]},{3,[{market_silver_refresh,1,21353,3,[],52380,0,undefined,0},{market_silver_refresh,2,21353,2,[],60000,0,undefined,0},{market_silver_refresh,3,21356,4,[],88202,0,undefined,0},{market_silver_refresh,4,21353,3,[],50500,0,undefined,0},{market_silver_refresh,5,21303,3,[],61500,0,undefined,0},{market_silver_refresh,6,21356,2,[],91350,0,undefined,0},{market_silver_refresh,7,21313,4,[],76387,0,undefined,0},{market_silver_refresh,8,21355,4,[],64890,0,undefined,0},{market_silver_refresh,9,21354,4,[],53040,0,undefined,0},{market_silver_refresh,10,21354,2,[],55125,0,undefined,0},{market_silver_refresh,11,21307,3,[],83325,0,undefined,0},{market_silver_refresh,12,21303,2,[],52430,0,undefined,0},{market_silver_refresh,13,21303,4,[],60770,0,undefined,0},{market_silver_refresh,14,21305,4,[],64512,0,undefined,0},{market_silver_refresh,15,21307,2,[],101588,0,undefined,0},{market_silver_refresh,16,21354,3,[],58802,0,undefined,0},{market_silver_refresh,17,21353,3,[],56682,0,undefined,0},{market_silver_refresh,18,21351,3,[],35754,0,undefined,0},{market_silver_refresh,19,21356,2,[],80115,0,undefined,0},{market_silver_refresh,20,21307,2,[],89842,0,undefined,0},{market_silver_refresh,21,21303,3,[],58075,0,undefined,0},{market_silver_refresh,22,21313,3,[],87870,0,undefined,0},{market_silver_refresh,23,21354,2,[],53040,0,undefined,0},{market_silver_refresh,24,21305,3,[],69258,0,undefined,0},{market_silver_refresh,25,21305,2,[],81270,0,undefined,0},{market_silver_refresh,26,21353,2,[],54590,0,undefined,0},{market_silver_refresh,27,21351,4,[],37128,0,undefined,0},{market_silver_refresh,28,21356,3,[],92565,0,undefined,0},{market_silver_refresh,29,21305,2,[],67620,0,undefined,0},{market_silver_refresh,30,21305,3,[],65450,0,undefined,0},{market_silver_refresh,31,21352,4,[],63125,0,undefined,0},{market_silver_refresh,32,21313,3,[],84001,0,undefined,0},{market_silver_refresh,33,21355,3,[],75078,0,undefined,0},{market_silver_refresh,34,21313,2,[],99225,0,undefined,0},{market_silver_refresh,35,21353,2,[],52520,0,undefined,0},{market_silver_refresh,36,21307,2,[],82568,0,undefined,0},{market_silver_refresh,37,21307,3,[],89610,0,undefined,0},{market_silver_refresh,38,21351,3,[],33386,0,undefined,0},{market_silver_refresh,39,21303,2,[],56682,0,undefined,0},{market_silver_refresh,40,21352,4,[],60900,0,undefined,0},{market_silver_refresh,41,21313,4,[],85749,0,undefined,0},{market_silver_refresh,42,21351,3,[],30888,0,undefined,0},{market_silver_refresh,43,21355,2,[],72384,0,undefined,0},{market_silver_refresh,44,21351,4,[],33465,0,undefined,0},{market_silver_refresh,45,21307,3,[],88027,0,undefined,0},{market_silver_refresh,46,21355,3,[],71280,0,undefined,0},{market_silver_refresh,47,21313,4,[],88140,0,undefined,0},{market_silver_refresh,48,21351,3,[],32136,0,undefined,0},{market_silver_refresh,49,21356,3,[],92160,0,undefined,0},{market_silver_refresh,50,21352,2,[],56160,0,undefined,0},{market_silver_refresh,51,21305,3,[],59904,0,undefined,0},{market_silver_refresh,52,21351,4,[],34560,0,undefined,0},{market_silver_refresh,53,21354,3,[],60180,0,undefined,0},{market_silver_refresh,54,21303,4,[],56500,0,undefined,0},{market_silver_refresh,55,21355,4,[],68640,0,undefined,0},{market_silver_refresh,56,21356,4,[],80325,0,undefined,0},{market_silver_refresh,57,21352,2,[],57167,0,undefined,0},{market_silver_refresh,58,21354,4,[],59160,0,undefined,0},{market_silver_refresh,59,21356,4,[],98438,0,undefined,0},{market_silver_refresh,60,21355,2,[],73062,0,undefined,0},{market_silver_refresh,61,21354,4,[],49995,0,undefined,0},{market_silver_refresh,62,21355,3,[],69000,0,undefined,0},{market_silver_refresh,63,21313,3,[],94500,0,undefined,0},{market_silver_refresh,64,21352,3,[],55105,0,undefined,0},{market_silver_refresh,65,21305,3,[],61740,0,undefined,0},{market_silver_refresh,66,21313,2,[],77962,0,undefined,0},{market_silver_refresh,67,21303,3,[],68250,0,undefined,0},{market_silver_refresh,68,21352,2,[],62370,0,undefined,0},{market_silver_refresh,69,21305,2,[],75660,0,undefined,0},{market_silver_refresh,70,21352,2,[],66300,0,undefined,0},{market_silver_refresh,71,21352,3,[],65145,0,undefined,0},{market_silver_refresh,72,21307,3,[],92610,0,undefined,0},{market_silver_refresh,73,21307,2,[],77175,0,undefined,0},{market_silver_refresh,74,21354,2,[],53560,0,undefined,0},{market_silver_refresh,75,21353,2,[],53045,0,undefined,0},{market_silver_refresh,76,21303,2,[],65145,0,undefined,0},{market_silver_refresh,77,21356,4,[],75705,0,undefined,0},{market_silver_refresh,78,21351,4,[],33222,0,undefined,0},{market_silver_refresh,79,21353,4,[],57600,0,undefined,0},{market_silver_refresh,80,21355,3,[],71190,0,undefined,0}]},{4,[{market_silver_refresh,1,21300,2,[],11762,0,undefined,0},{market_silver_refresh,2,21300,2,[],10098,0,undefined,0},{market_silver_refresh,3,21302,3,[{1,10}],29400,0,undefined,0},{market_silver_refresh,4,21302,3,[{1,10}],30555,0,undefined,0},{market_silver_refresh,5,21301,2,[],26624,0,undefined,0},{market_silver_refresh,6,21302,4,[{1,10}],32188,0,undefined,0},{market_silver_refresh,7,21301,4,[],20928,0,undefined,0},{market_silver_refresh,8,21300,4,[],10403,0,undefined,0},{market_silver_refresh,9,21302,3,[{1,10}],30000,0,undefined,0},{market_silver_refresh,10,21301,4,[],19200,0,undefined,0},{market_silver_refresh,11,21302,2,[{1,10}],30188,0,undefined,0},{market_silver_refresh,12,21302,3,[{1,10}],26880,0,undefined,0},{market_silver_refresh,13,21300,2,[],12700,0,undefined,0},{market_silver_refresh,14,21302,4,[{1,10}],29000,0,undefined,0},{market_silver_refresh,15,21300,4,[],12096,0,undefined,0},{market_silver_refresh,16,21302,3,[{1,10}],28750,0,undefined,0},{market_silver_refresh,17,21300,4,[],12700,0,undefined,0},{market_silver_refresh,18,21300,3,[],10609,0,undefined,0},{market_silver_refresh,19,21302,4,[{1,10}],27820,0,undefined,0},{market_silver_refresh,20,21300,3,[],12566,0,undefined,0},{market_silver_refresh,21,21302,4,[{1,10}],28088,0,undefined,0},{market_silver_refresh,22,21301,4,[],21384,0,undefined,0},{market_silver_refresh,23,21300,2,[],11074,0,undefined,0},{market_silver_refresh,24,21300,2,[],10600,0,undefined,0},{market_silver_refresh,25,21301,2,[],21780,0,undefined,0},{market_silver_refresh,26,21302,4,[{1,10}],33020,0,undefined,0},{market_silver_refresh,27,21301,2,[],24960,0,undefined,0},{market_silver_refresh,28,21301,2,[],24072,0,undefined,0},{market_silver_refresh,29,21302,2,[{1,10}],26010,0,undefined,0},{market_silver_refresh,30,21300,3,[],10300,0,undefined,0},{market_silver_refresh,31,21301,2,[],25088,0,undefined,0},{market_silver_refresh,32,21300,3,[],13158,0,undefined,0},{market_silver_refresh,33,21300,3,[],11130,0,undefined,0},{market_silver_refresh,34,21300,4,[],12584,0,undefined,0},{market_silver_refresh,35,21300,3,[],11858,0,undefined,0},{market_silver_refresh,36,21301,4,[],20370,0,undefined,0},{market_silver_refresh,37,21302,4,[{1,10}],27810,0,undefined,0},{market_silver_refresh,38,21301,4,[],21836,0,undefined,0},{market_silver_refresh,39,21301,4,[],22050,0,undefined,0},{market_silver_refresh,40,21300,2,[],9984,0,undefined,0},{market_silver_refresh,41,21300,3,[],10976,0,undefined,0},{market_silver_refresh,42,21302,3,[{1,10}],32188,0,undefined,0},{market_silver_refresh,43,21301,3,[],24336,0,undefined,0},{market_silver_refresh,44,21302,2,[{1,10}],29280,0,undefined,0},{market_silver_refresh,45,21302,3,[{1,10}],30555,0,undefined,0},{market_silver_refresh,46,21301,4,[],23600,0,undefined,0},{market_silver_refresh,47,21301,2,[],22770,0,undefined,0},{market_silver_refresh,48,21300,3,[],11657,0,undefined,0},{market_silver_refresh,49,21302,2,[{1,10}],31250,0,undefined,0},{market_silver_refresh,50,21302,2,[{1,10}],27553,0,undefined,0},{market_silver_refresh,51,21301,2,[],20800,0,undefined,0},{market_silver_refresh,52,21302,3,[{1,10}],30188,0,undefined,0},{market_silver_refresh,53,21301,4,[],22892,0,undefined,0},{market_silver_refresh,54,21300,3,[],10706,0,undefined,0},{market_silver_refresh,55,21301,4,[],20000,0,undefined,0},{market_silver_refresh,56,21300,3,[],12257,0,undefined,0},{market_silver_refresh,57,21301,3,[],24638,0,undefined,0},{market_silver_refresh,58,21302,3,[{1,10}],27967,0,undefined,0},{market_silver_refresh,59,21300,3,[],13260,0,undefined,0},{market_silver_refresh,60,21302,2,[{1,10}],30442,0,undefined,0},{market_silver_refresh,61,21300,2,[],10379,0,undefined,0},{market_silver_refresh,62,21302,3,[{1,10}],26775,0,undefined,0},{market_silver_refresh,63,21302,4,[{1,10}],29827,0,undefined,0},{market_silver_refresh,64,21301,3,[],20800,0,undefined,0},{market_silver_refresh,65,21301,2,[],21412,0,undefined,0},{market_silver_refresh,66,21300,4,[],10584,0,undefined,0},{market_silver_refresh,67,21301,4,[],23690,0,undefined,0},{market_silver_refresh,68,21302,2,[{1,10}],26705,0,undefined,0},{market_silver_refresh,69,21301,2,[],24892,0,undefined,0},{market_silver_refresh,70,21300,4,[],12896,0,undefined,0},{market_silver_refresh,71,21301,4,[],20972,0,undefined,0},{market_silver_refresh,72,21300,4,[],11286,0,undefined,0},{market_silver_refresh,73,21302,2,[{1,10}],27295,0,undefined,0},{market_silver_refresh,74,21301,4,[],20402,0,undefined,0},{market_silver_refresh,75,21301,4,[],22656,0,undefined,0},{market_silver_refresh,76,21302,2,[{1,10}],26513,0,undefined,0},{market_silver_refresh,77,21301,3,[],22176,0,undefined,0},{market_silver_refresh,78,21301,2,[],21186,0,undefined,0},{market_silver_refresh,79,21302,2,[{1,10}],30680,0,undefined,0},{market_silver_refresh,80,21300,4,[],11000,0,undefined,0}]},{5,[{market_silver_refresh,1,21931,3,[],21255,0,undefined,0},{market_silver_refresh,2,21910,4,[],22032,0,undefined,0},{market_silver_refresh,3,21508,3,[],23588,0,undefined,0},{market_silver_refresh,4,21500,4,[],18871,0,undefined,0},{market_silver_refresh,5,21508,4,[],21991,0,undefined,0},{market_silver_refresh,6,21910,2,[],22292,0,undefined,0},{market_silver_refresh,7,21931,2,[],21623,0,undefined,0},{market_silver_refresh,8,21931,2,[],22862,0,undefined,0},{market_silver_refresh,9,21502,4,[],21411,0,undefined,0},{market_silver_refresh,10,21506,2,[],18144,0,undefined,0},{market_silver_refresh,11,21502,4,[],20770,0,undefined,0},{market_silver_refresh,12,21931,3,[],20595,0,undefined,0},{market_silver_refresh,13,21910,4,[],20699,0,undefined,0},{market_silver_refresh,14,21506,4,[],20770,0,undefined,0},{market_silver_refresh,15,21508,3,[],20246,0,undefined,0},{market_silver_refresh,16,21910,3,[],19050,0,undefined,0},{market_silver_refresh,17,21500,4,[],18691,0,undefined,0},{market_silver_refresh,18,21506,4,[],22069,0,undefined,0},{market_silver_refresh,19,21931,4,[],19474,0,undefined,0},{market_silver_refresh,20,21502,2,[],22515,0,undefined,0},{market_silver_refresh,21,21500,2,[],23225,0,undefined,0},{market_silver_refresh,22,21508,2,[],20015,0,undefined,0},{market_silver_refresh,23,21502,4,[],18627,0,undefined,0},{market_silver_refresh,24,21931,3,[],17935,0,undefined,0},{market_silver_refresh,25,21506,3,[],23138,0,undefined,0},{market_silver_refresh,26,21506,3,[],18912,0,undefined,0},{market_silver_refresh,27,21900,2,[],18689,0,undefined,0},{market_silver_refresh,28,21506,4,[],19213,0,undefined,0},{market_silver_refresh,29,21506,2,[],18860,0,undefined,0},{market_silver_refresh,30,21931,4,[],21287,0,undefined,0},{market_silver_refresh,31,21506,3,[],20421,0,undefined,0},{market_silver_refresh,32,21900,3,[],22385,0,undefined,0},{market_silver_refresh,33,21900,2,[],21537,0,undefined,0},{market_silver_refresh,34,21508,3,[],21151,0,undefined,0},{market_silver_refresh,35,21910,2,[],18152,0,undefined,0},{market_silver_refresh,36,21502,3,[],22914,0,undefined,0},{market_silver_refresh,37,21910,4,[],20736,0,undefined,0},{market_silver_refresh,38,21931,2,[],20871,0,undefined,0},{market_silver_refresh,39,21500,2,[],17278,0,undefined,0},{market_silver_refresh,40,21910,4,[],17767,0,undefined,0},{market_silver_refresh,41,21502,3,[],18459,0,undefined,0},{market_silver_refresh,42,21502,2,[],21411,0,undefined,0},{market_silver_refresh,43,21910,2,[],19306,0,undefined,0},{market_silver_refresh,44,21506,2,[],18155,0,undefined,0},{market_silver_refresh,45,21508,4,[],17977,0,undefined,0},{market_silver_refresh,46,21500,4,[],16588,0,undefined,0},{market_silver_refresh,47,21500,4,[],21504,0,undefined,0},{market_silver_refresh,48,21900,3,[],21293,0,undefined,0},{market_silver_refresh,49,21900,3,[],22689,0,undefined,0},{market_silver_refresh,50,21931,3,[],16929,0,undefined,0},{market_silver_refresh,51,21900,3,[],21715,0,undefined,0},{market_silver_refresh,52,21506,3,[],19160,0,undefined,0},{market_silver_refresh,53,21508,4,[],19503,0,undefined,0},{market_silver_refresh,54,21508,3,[],21846,0,undefined,0},{market_silver_refresh,55,21506,2,[],18326,0,undefined,0},{market_silver_refresh,56,21931,2,[],21773,0,undefined,0},{market_silver_refresh,57,21500,2,[],17792,0,undefined,0},{market_silver_refresh,58,21500,2,[],20391,0,undefined,0},{market_silver_refresh,59,21508,3,[],21726,0,undefined,0},{market_silver_refresh,60,21910,2,[],18501,0,undefined,0},{market_silver_refresh,61,21500,2,[],20770,0,undefined,0},{market_silver_refresh,62,21508,2,[],18867,0,undefined,0},{market_silver_refresh,63,21506,4,[],23004,0,undefined,0},{market_silver_refresh,64,21500,4,[],18797,0,undefined,0},{market_silver_refresh,65,21900,2,[],22292,0,undefined,0},{market_silver_refresh,66,21502,3,[],21287,0,undefined,0},{market_silver_refresh,67,21900,2,[],19077,0,undefined,0},{market_silver_refresh,68,21502,4,[],19935,0,undefined,0},{market_silver_refresh,69,21502,3,[],21068,0,undefined,0},{market_silver_refresh,70,21910,2,[],22783,0,undefined,0},{market_silver_refresh,71,21900,4,[],21773,0,undefined,0},{market_silver_refresh,72,21500,4,[],18663,0,undefined,0},{market_silver_refresh,73,21900,3,[],22069,0,undefined,0},{market_silver_refresh,74,21910,2,[],23363,0,undefined,0},{market_silver_refresh,75,21900,3,[],20421,0,undefined,0},{market_silver_refresh,76,21500,4,[],18689,0,undefined,0},{market_silver_refresh,77,21508,3,[],21507,0,undefined,0},{market_silver_refresh,78,21502,4,[],20152,0,undefined,0},{market_silver_refresh,79,21931,4,[],19906,0,undefined,0},{market_silver_refresh,80,21502,3,[],19354,0,undefined,0}]},{6,[]}]},{m_escort,0,32000,0,0,0,0,[],0,0,0,0,0,0,0,0,{0,0},0,0,0,[]},{m_buff,2,[],1},{m_formation,1,1,1,[{formation,1,1,0}],[1002,1012]},{m_skill_life,2,[{skill_life,10000,15,0},{skill_life,10001,15,0},{skill_life,10005,0,0},{skill_life,10006,0,0},{skill_life,10007,0,0},{skill_life,10008,0,0},{skill_life,10009,0,0}]},{m_trial,3,0,0,undefined,{trial_unit,0,0,0,[],0,0,0,0,[],0,0,0},0,0,0,2,0,3,0,0,[],[],[]},{m_fashion,5,[],[],[],[],[],[],[],0,0,0,[]},{m_satiety,1,0,1,0},{m_agenda,1,[{agenda_prog,1,1000,0,0},{agenda_prog,1,1001,9,1793178376},{agenda_prog,1,1002,0,0},{agenda_prog,1,1004,0,0},{agenda_prog,1,1006,0,0},{agenda_prog,1,1007,0,0},{agenda_prog,1,1008,0,0},{agenda_prog,1,1009,0,0},{agenda_prog,1,1010,0,0},{agenda_prog,1,1013,0,0},{agenda_prog,1,1014,0,0},{agenda_prog,1,1017,0,0},{agenda_prog,1,1018,0,0},{agenda_prog,1,1020,0,0},{agenda_prog,1,1021,0,0},{agenda_prog,1,1022,0,0},{agenda_prog,1,1023,0,0},{agenda_prog,1,1024,0,0},{agenda_prog,1,1025,0,0},{agenda_prog,1,1026,0,0},{agenda_prog,1,1027,0,0},{agenda_prog,1,1028,0,0},{agenda_prog,1,1029,0,0},{agenda_prog,1,1030,0,0},{agenda_prog,1,1031,0,0},{agenda_prog,1,2002,0,0},{agenda_prog,1,2003,0,0},{agenda_prog,1,2004,0,0},{agenda_prog,1,2005,0,0},{agenda_prog,1,2006,0,0},{agenda_prog,1,2007,0,0},{agenda_prog,1,2008,0,0},{agenda_prog,1,2009,0,0},{agenda_prog,1,2010,0,0},{agenda_prog,1,2011,0,0},{agenda_prog,1,2012,0,0},{agenda_prog,1,2013,0,0},{agenda_prog,1,2014,0,0},{agenda_prog,1,2015,0,0},{agenda_prog,1,2016,0,0},{agenda_prog,1,2017,0,0},{agenda_prog,1,2018,0,0},{agenda_prog,1,2019,0,0},{agenda_prog,1,2020,0,0},{agenda_prog,1,2021,0,0},{agenda_prog,1,2022,0,0},{agenda_prog,1,2023,0,0},{agenda_prog,1,2024,0,0},{agenda_prog,1,2025,0,0},{agenda_prog,1,2026,0,0},{agenda_prog,1,2027,0,0},{agenda_prog,1,2028,0,0},{agenda_prog,1,2029,0,0},{agenda_prog,1,2030,0,0},{agenda_prog,1,2031,0,0},{agenda_prog,1,2032,0,0},{agenda_prog,1,2033,0,0},{agenda_prog,1,2034,0,0},{agenda_prog,1,2035,0,0},{agenda_prog,1,2036,0,0},{agenda_prog,1,2038,0,0},{agenda_prog,1,2039,0,0},{agenda_prog,1,2040,0,0},{agenda_prog,1,2041,0,0},{agenda_prog,1,2042,0,0},{agenda_prog,1,2043,0,0},{agenda_prog,1,2044,0,0},{agenda_prog,1,2045,0,0},{agenda_prog,1,2046,0,0},{agenda_prog,1,2047,0,0},{agenda_prog,1,2048,0,0},{agenda_prog,1,2049,0,0},{agenda_prog,1,2050,0,0},{agenda_prog,1,2051,0,0},{agenda_prog,1,2052,0,0},{agenda_prog,1,2053,0,0},{agenda_prog,1,2054,0,0},{agenda_prog,1,2055,0,0},{agenda_prog,1,2056,0,0},{agenda_prog,1,2057,0,0},{agenda_prog,1,2058,0,0},{agenda_prog,1,2059,0,0},{agenda_prog,1,2060,0,0},{agenda_prog,1,2061,0,0},{agenda_prog,1,2062,0,0},{agenda_prog,1,2063,0,0},{agenda_prog,1,2064,0,0},{agenda_prog,1,2065,0,0},{agenda_prog,1,2066,0,0},{agenda_prog,1,2067,0,0},{agenda_prog,1,2068,0,0},{agenda_prog,1,2069,0,0},{agenda_prog,1,2070,0,0},{agenda_prog,1,2071,0,0},{agenda_prog,1,2072,0,0},{agenda_prog,1,2073,0,0},{agenda_prog,1,2074,0,0},{agenda_prog,1,2075,0,0},{agenda_prog,1,2076,0,0},{agenda_prog,1,2077,0,0},{agenda_prog,1,2078,0,0},{agenda_prog,1,2079,0,0},{agenda_prog,1,2080,0,0},{agenda_prog,1,2081,0,0},{agenda_prog,1,2082,0,0},{agenda_prog,1,2083,0,0},{agenda_prog,1,2084,0,0},{agenda_prog,1,2085,0,0},{agenda_prog,1,2086,0,0},{agenda_prog,1,2087,0,0},{agenda_prog,1,2088,0,0},{agenda_prog,1,2089,0,0},{agenda_prog,1,2090,0,0},{agenda_prog,1,2091,0,0},{agenda_prog,1,2092,0,0},{agenda_prog,1,2093,0,0},{agenda_prog,1,2094,0,0},{agenda_prog,1,2095,0,0},{agenda_prog,1,2096,0,0},{agenda_prog,1,2097,0,0},{agenda_prog,1,2098,0,0},{agenda_prog,1,2099,0,0},{agenda_prog,1,2100,0,0},{agenda_prog,1,2101,0,0},{agenda_prog,1,2102,0,0},{agenda_prog,1,2103,0,0},{agenda_prog,1,2104,0,0},{agenda_prog,1,2105,0,0},{agenda_prog,1,2106,0,0},{agenda_prog,1,2107,0,0},{agenda_prog,1,2108,0,0},{agenda_prog,1,2109,0,0},{agenda_prog,1,2110,0,0},{agenda_prog,1,2111,0,0},{agenda_prog,1,2112,0,0},{agenda_prog,1,99,0,0}],36,1793178376,[],0,[1001],1793150003},{m_parade,0,undefined},[{mail,{7,[100,101,118],1},{2,[100,101,118],1},{0,[100,101,118],1},0,[],0,[],1,0,0,<<230,150,176,231,142,169,229,174,182,233,188,147,229,138,177>>,<<228,186,178,231,136,177,231,154,132,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,232,180,157,229,136,169,230,137,152,231,137,185,60,47,99,111,108,111,114,62,58,10,32,32,230,129,173,229,150,156,228,189,160,232,142,183,229,190,151,230,150,176,231,167,128,229,141,135,231,186,167,229,164,167,231,164,188,229,140,133,239,188,140,229,134,133,229,144,171,229,164,167,233,135,143,231,187,143,233,170,140,227,128,129,229,134,146,233,153,169,231,187,143,233,170,140,229,165,150,229,138,177,239,188,140,229,143,175,228,187,165,229,184,174,229,138,169,230,130,168,230,155,180,229,191,171,230,143,144,229,141,135,231,173,137,231,186,167,230,136,152,229,138,155,229,147,166,239,188,140,231,165,157,230,130,168,229,156,168,230,152,159,232,190,176,228,184,150,231,149,140,228,184,173,232,131,189,229,164,159,230,148,182,232,142,183,230,155,180,229,164,167,231,154,132,230,172,162,228,185,144,123,102,97,99,101,95,49,44,51,52,125>>,[{item,0,0,22227,1,0,111,1,3,0,-1,0,0,0,1,0,0,0,[],[],25,0,2,[],[]},{item,0,0,20025,1,0,0,0,2,0,-1,0,0,0,35,0,0,0,[],[],30,0,2,[],[]}],0,1793087198,1793087198,0},{mail,{6,[100,101,118],1},{2,[100,101,118],1},{0,[100,101,118],1},0,[],0,[],1,0,0,<<230,152,159,232,190,176,229,173,166,233,153,162,231,154,132,230,157,165,228,191,161>>,<<230,152,159,232,190,176,229,173,166,233,153,162,231,154,132,230,157,165,228,191,161,58,10,32,32,228,186,178,231,136,177,231,154,132,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,232,180,157,229,136,169,230,137,152,231,137,185,60,47,99,111,108,111,114,62,239,188,140,230,172,162,232,191,142,229,155,158,229,136,176,230,152,159,232,190,176,229,164,167,228,184,150,231,149,140,239,188,140,228,189,160,230,137,128,233,128,137,231,154,132,230,156,136,233,173,130,228,187,165,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,230,140,129,231,187,173,232,190,147,229,135,186,232,131,189,229,138,155,60,47,99,111,108,111,114,62,232,145,151,231,167,176,239,188,140,230,142,168,232,141,144,229,162,158,229,138,160,60,99,111,108,111,114,61,39,35,48,48,102,102,48,48,39,62,230,153,186,229,138,155,60,47,99,111,108,111,114,62,229,177,158,230,128,167,239,188,140,232,190,190,229,136,176,50,48,231,186,167,229,144,142,229,143,175,229,137,141,229,190,128,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,229,175,188,229,184,136,229,190,183,230,158,151,60,47,99,111,108,111,114,62,229,164,132,230,139,156,229,184,136,229,147,159,239,188,140,230,155,180,229,191,171,232,158,141,229,133,165,230,152,159,232,190,176,229,164,167,229,174,182,229,186,173,229,144,167,123,102,97,99,101,95,49,44,53,52,125>>,[],0,1793087198,1793087198,0}],{m_qualifying,1000,0,0,0,0,[],0,0,0},{m_treasure,0,{treasure_reward,0,0,0,0,[]},{treasure_compass,0,0,0,0,0,0},0},{m_campaign,27,[{1001,1793086446,28800},{1002,1793087287,27960}],[{1002,1793087287,1}],[{1001,1793087207,1}],{campaign_eggs,0,0,[],0,0,[]},{campaign_bags,0,[],0,0},[],{camp_login,0,0,0,[],[]},{camp_hide_seek,0,0,[],0,[]},{camp_login_roll,0,0,[],[],0,0,0},{camp_series_recharge,1,{2026,10,28},0,[{1,0}],0,0,0,0},{campaign_card,0,0,0,0,[]},0,[],{campaign_card_open,0,0,0,0,[]},{camp_series_recharge,1,{2026,10,28},0,[{1,0}],0,0,0,0},{camp_wish_flower,1,1,0,0,0},{camp_doll,3,0,1,0,[{camp_doll_data,4,0,1,[]},{camp_doll_data,7,0,1,[]},{camp_doll_data,8,0,1,[]},{camp_doll_data,3,0,1,[]},{camp_doll_data,2,0,1,[]},{camp_doll_data,5,0,1,[]},{camp_doll_data,6,0,1,[]},{camp_doll_data,1,0,1,[]}],0,[],0,0,[]},{camp_sign,{0,0,0},0,0},{camp_exchange,0,0,[],0},{m_animal_chess,1,0,0},{camp_new_flop,1,0,0,[],0},25,{camp_consume_rebate,1,[]},{m_black_white_chess,1,0,0,1},{m_camp_scratch_card,0,[],[]},{camp_new_acc_charge,1,0,[]},{camp_charge_seven_gift,1,0,0,[]},{camp_lucky_tree,0,0,[],[]},{camp_long_active,1,0,0,[],[],0,0},{camp_gift_custom,1,0,[],[],0}},{m_shipping,1,0},{m_checkin,3,[{{2026,10,27},1,0},{{2026,10,28},2,0}],{checkin_everyday,3,1793087205,{2026,10,27},1,[{{2026,10,27},1},{{2026,10,28},0}],0,0,0,[],1},[]},{m_tower,[],[]},{m_classes_challenge,2,0,0,[],[],0,0,[],0,[]},{m_fairyland,0,[],[],0,0,[],0,[]},{m_glory,2,0,0,0,0,0,0,0,0,1793086327,0,[],0,0},{m_examination,1,0,0,0,0,0,[],[],0,0,0,[],[]},{m_adm,0},{m_alchemy,0,[{alchemy_shop,1,1,2,[],1},{alchemy_shop,1,2,2,[],1},{alchemy_shop,1,3,2,[],1},{alchemy_shop,1,4,2,[],1}]},{m_pet_store,1,1,[],4},{m_store,0,[]},{m_achievement,3,20,[{220510,1793178279},{210140,1793177968},{310110,1793158037}],[{quest,640601,[],1,1,0,0,[{quest_progress,0,evt_wedding_guest,0,[],0,{evt_wedding_guest,304},25,0,[],[],[]}],0,0,0,0},{quest,220310,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,20007,[],0,{evt_pet_use_item,303},10,0,[],[],[]}],0,0,0,0},{quest,150132,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,3,[],0,{evt_wing_lev,302},1,0,[],[],[]}],0,0,0,0},{quest,150103,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[],0,{evt_wing,301},3,0,[],[],[]}],0,0,0,0},{quest,150110,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[{growth,5}],0,{evt_wing,299},3,0,[],[],[]}],0,0,0,0},{quest,520103,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,293},50,0,[],[],[]}],0,0,0,0},{quest,230101,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[pet_revive],0,{evt_combat_statistics,292},5,0,[],[],[]}],0,0,0,0},{quest,220151,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,21312,[],0,{evt_pet_use_item,291},1,0,[],[],[]}],0,0,0,0},{quest,640521,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,283},300,20,[],[],[]}],0,0,0,0},{quest,640210,[],1,1,0,0,[{quest_progress,0,evt_gain_character,0,[],0,{evt_gain_character,282},1000,0,[],[],[]}],0,0,0,0},{quest,520102,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,281},20,0,[],[],[]}],0,0,0,0},{quest,510121,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,0,[{type,9}],0,{evt_kill_npc,280},50,0,[],[],[]}],0,0,0,0},{quest,310111,[],1,1,0,0,[{quest_progress,0,evt_guard,0,[],0,{evt_guard,279},5,2,[],[],[]}],0,0,0,0},{quest,230201,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[cast_pet],0,{evt_combat_statistics,278},10,0,[],[],[]}],0,0,0,0},{quest,210161,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,21301,[],0,{evt_pet_use_item,277},1,0,[],[],[]}],0,0,0,0},{quest,140241,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[is_die],0,{evt_combat_statistics,276},99,0,[],[],[]}],0,0,0,0},{quest,140220,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[revive],0,{evt_combat_statistics,275},100,0,[],[],[]}],0,0,0,0},{quest,130220,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[],0,{evt_market_silver_sold,274},1000,0,[],[],[]}],0,0,0,0},{quest,640316,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21309,[],0,{evt_use_fruit_limit,266},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21356,[],0,{evt_use_fruit_limit,267},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21357,[],0,{evt_use_fruit_limit,268},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21358,[],0,{evt_use_fruit_limit,269},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21359,[],0,{evt_use_fruit_limit,270},1,0,[],[],[]}],0,0,0,0},{quest,640445,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,1,[kill_group_pet],0,{evt_combat_statistics,253},1,0,[],[],[]}],0,0,0,0},{quest,610101,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,4}],0,{evt_commit_quest,252},50,5,[],[],[]}],0,0,0,0},{quest,520205,[],1,1,0,0,[{quest_progress,0,evt_wedding_treasure,0,[],0,{evt_wedding_treasure,251},99,0,[],[],[]}],0,0,0,0},{quest,510101,[],1,1,0,0,[{quest_progress,0,evt_guild,0,[],0,{evt_guild,250},1,0,[],[],[]}],0,0,0,0},{quest,410102,[],1,1,0,0,[{quest_progress,0,evt_eqm,0,[{eqm_lev_num,40}],0,{evt_eqm,249},8,0,[],[],[]}],0,0,0,0},{quest,220301,[],1,1,0,0,[{quest_progress,0,evt_pet_repleace_skill,0,[],0,{evt_pet_repleace_skill,248},1,0,[],[],[]}],0,0,0,0},{quest,149006,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,4,[],0,{evt_formation_lev,247},1,0,[],[],[]}],0,0,0,0},{quest,149004,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,3,[],0,{evt_formation_lev,246},1,0,[],[],[]}],0,0,0,0},{quest,130230,[],1,1,0,0,[{quest_progress,0,evt_market_silver_buy,0,[],0,{evt_market_silver_buy,245},1000,0,[],[],[]}],0,0,0,0},{quest,110101,[],1,1,0,0,[{quest_progress,0,evt_levup,0,[],0,{evt_levup,244},30,24,[],[],[]}],0,0,0,0},{quest,640440,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,1,[killed_group],0,{evt_combat_statistics,241},1,0,[],[],[]}],0,0,0,0},{quest,640311,[],1,1,0,0,[{quest_progress,0,evt_use_item,0,[21350,21303,21351,21352,21307,21353,21354,21355,21305,21313,21356,21357,21359,21309,21358,21360,21311,21314,21317,21318,21316,21319,21320,21321,21361,21362,21363,21380,21381,21382,21383,21384,21385,21386,21387,21388,21389,21390,21391,21392],0,{evt_use_item,240},72,0,[],[],[]}],0,0,0,0},{quest,620101,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,3}],0,{evt_commit_quest,239},200,0,[],[],[]}],0,0,0,0},{quest,510111,[],1,1,0,0,[{quest_progress,0,evt_commit_quest,0,[{sec_type,12}],0,{evt_commit_quest,238},100,0,[],[],[]}],0,0,0,0},{quest,220210,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,100,[type],0,{evt_pet_use_item,237},1,0,[],[],[]}],0,0,0,0},{quest,210155,[],1,1,0,0,[{quest_progress,0,evt_get_pet,20005,[base_id],0,{evt_get_pet,236},1,0,[],[],[]}],0,0,0,0},{quest,149001,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,1,[],0,{evt_formation_lev,235},8,1,[],[],[]}],0,0,0,0},{quest,140201,[],1,1,0,0,[{quest_progress,0,evt_kill_npc,0,[],0,{evt_kill_npc,234},1000,5,[],[],[]}],0,0,0,0},{quest,130240,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[{percent,130}],0,{evt_market_silver_sold,233},1,0,[],[],[]}],0,0,0,0},{quest,130001,[],1,1,0,0,[{quest_progress,0,evt_market_silver_first_on_sale,0,[],0,{evt_market_silver_first_on_sale,232},1,0,[],[],[]}],0,0,0,0},{quest,520301,[],1,1,0,0,[{quest_progress,0,evt_friend_zone_like,0,[],0,{evt_friend_zone_like,230},66,0,[],[],[]}],0,0,0,0},{quest,210160,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,20004,[],0,{evt_pet_use_item,229},1,0,[],[],[]}],0,0,0,0},{quest,210141,[],1,1,0,0,[{quest_progress,0,evt_pet,2,[sum_genre],0,{evt_pet,228},2,1,[],[],[]}],0,0,0,0},{quest,149002,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,2,[],0,{evt_formation_lev,227},1,0,[],[],[]}],0,0,0,0},{quest,149000,[],1,1,0,0,[{quest_progress,0,evt_formation_lev,1,[],0,{evt_formation_lev,226},2,1,[],[],[]}],0,0,0,0},{quest,130210,[],1,1,0,0,[{quest_progress,0,evt_market_silver_sold,0,[{assets,coin}],0,{evt_market_silver_sold,225},1000000,0,[],[],[]}],0,0,0,0},{quest,210150,[],1,1,0,0,[{quest_progress,0,evt_pet,4,[sum_genre],0,{evt_pet,164},1,0,[],[],[]}],0,0,0,0},{quest,210110,[],1,1,0,0,[{quest_progress,0,evt_get_pet,0,[catch_num],0,{evt_get_pet,162},50,1,[],[],[]}],0,0,0,0},{quest,130201,[],1,1,0,0,[{quest_progress,0,evt_market_gold_bind_buy,0,[{percent,1250}],0,{evt_market_gold_bind_buy,161},1,0,[],[],[]}],0,0,0,0},{quest,640520,[],1,1,0,0,[{quest_progress,0,evt_achievement,0,[point],0,{evt_achievement,160},100,20,[],[],[]}],0,0,0,0},{quest,630312,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_up_rank,0,[],0,{evt_classes_challenge_up_rank,159},10,0,[],[],[]}],0,0,0,0},{quest,630311,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_rank,15,[],0,{evt_classes_challenge_rank,158},1,0,[],[],[]}],0,0,0,0},{quest,630301,[],1,1,0,0,[{quest_progress,0,evt_classes_challenge_order,10,[],0,{evt_classes_challenge_order,157},1,0,[],[],[]}],0,0,0,0},{quest,530130,[],1,1,0,0,[{quest_progress,0,evt_wedding_marry,0,[],0,{evt_wedding_marry,156},3,0,[],[],[]}],0,0,0,0},{quest,520201,[],1,1,0,0,[{quest_progress,0,evt_friend_intimacy,0,[],0,{evt_friend_intimacy,155},200,0,[],[],[]}],0,0,0,0},{quest,220160,[],1,1,0,0,[{quest_progress,0,evt_pet_stone_upgrade,0,[],0,{evt_pet_stone_upgrade,154},1,0,[],[],[]}],0,0,0,0},{quest,130200,[],1,1,0,0,[{quest_progress,0,evt_market_gold_bind_buy,0,[{percent,1100}],0,{evt_market_gold_bind_buy,153},1,0,[],[],[]}],0,0,0,0},{quest,530110,[],1,1,0,0,[{quest_progress,0,evt_wedding_score,0,[acc],0,{evt_wedding_score,152},199,0,[],[],[]}],0,0,0,0},{quest,130261,[],1,1,0,0,[{quest_progress,0,evt_store_buy,0,[{buy}],0,{evt_store_buy,151},1,0,[],[],[]}],0,0,0,0},{quest,120001,[],1,1,0,0,[{quest_progress,0,evt_skill_up,15,[],0,{evt_skill_up,150},3,0,[],[],[]}],0,0,0,0},{quest,530140,[],1,1,0,0,[{quest_progress,0,evt_wedding_divorce,0,[],0,{evt_wedding_divorce,149},1,0,[],[],[]}],0,0,0,0},{quest,530101,[],1,1,0,0,[{quest_progress,0,evt_wedding_marry,0,[],0,{evt_wedding_marry,148},1,0,[],[],[]}],0,0,0,0},{quest,220501,[],1,1,0,0,[{quest_progress,0,evt_pet,1,[sum_genre],0,{evt_pet,147},1,0,[],[],[]}],0,0,0,0},{quest,210130,[],1,1,0,0,[{quest_progress,0,evt_pet_free,0,[],0,{evt_pet_free,146},1,0,[],[],[]}],0,0,0,0},{quest,150131,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,2,[],0,{evt_wing_lev,145},1,0,[],[],[]}],0,0,0,0},{quest,150102,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[],0,{evt_wing,144},2,0,[],[],[]}],0,0,0,0},{quest,130250,[],1,1,0,0,[{quest_progress,0,evt_shop_buy,0,[{buy}],0,{evt_shop_buy,143},1,0,[],[],[]}],0,0,0,0},{quest,220202,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,101,[type],0,{evt_pet_use_item,142},1,0,[],[],[]}],0,0,0,0},{quest,140210,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[win],0,{evt_combat_statistics,141},50,3,[],[],[]}],0,0,0,0},{quest,640351,[],1,1,0,0,[{quest_progress,0,evt_fashion_collect_lev,0,[],0,{evt_fashion_collect_lev,140},1,0,[],[],[]}],0,0,0,0},{quest,640341,[],1,1,0,0,[{quest_progress,0,evt_fashion,2,[],0,{evt_fashion,139},1,0,[],[],[]}],0,0,0,0},{quest,640331,[],1,1,0,0,[{quest_progress,0,evt_fashion,3,[],0,{evt_fashion,138},1,0,[],[],[]}],0,0,0,0},{quest,640325,[],1,1,0,0,[{quest_progress,0,evt_fashion,1,[],0,{evt_fashion,137},1,0,[],[],[]}],0,0,0,0},{quest,520221,[],1,1,0,0,[{quest_progress,0,evt_send_flower,20032,[],0,{evt_send_flower,136},1,0,[],[],[]}],0,0,0,0},{quest,520211,[],1,1,0,0,[{quest_progress,0,evt_send_flower,20031,[],0,{evt_send_flower,135},1,0,[],[],[]}],0,0,0,0},{quest,510230,[],1,1,0,0,[{quest_progress,0,evt_gain_guild,0,[],0,{evt_gain_guild,134},200,0,[],[],[]}],0,0,0,0},{quest,510210,[],1,1,0,0,[{quest_progress,0,evt_guild_post,30,[],0,{evt_guild_post,130},1,0,[],[],[]},{quest_progress,1,evt_guild_post,40,[],0,{evt_guild_post,131},1,0,[],[],[]},{quest_progress,2,evt_guild_post,50,[],0,{evt_guild_post,132},1,0,[],[],[]},{quest_progress,3,evt_guild_post,60,[],0,{evt_guild_post,133},1,0,[],[],[]}],0,0,0,0},{quest,220201,[],1,1,0,0,[{quest_progress,0,evt_pet_use_item,102,[type],0,{evt_pet_use_item,129},1,0,[],[],[]}],0,0,0,0},{quest,150130,[],1,1,0,0,[{quest_progress,0,evt_wing_lev,1,[],0,{evt_wing_lev,128},1,0,[],[],[]}],0,0,0,0},{quest,150120,[],1,1,0,0,[{quest_progress,0,evt_wing_reset,0,[],0,{evt_wing_reset,127},5,0,[],[],[]}],0,0,0,0},{quest,150101,[],1,1,0,0,[{quest_progress,0,evt_wing,0,[],0,{evt_wing,126},1,0,[],[],[]}],0,0,0,0},{quest,130101,[],1,1,0,0,[{quest_progress,0,evt_gain_coin,0,[num],0,{evt_gain_coin,125},1000000,546119,[],[],[]}],0,0,0,0},{quest,640315,[],1,1,0,0,[{quest_progress,0,evt_use_fruit_limit,21303,[],0,{evt_use_fruit_limit,116},1,0,[],[],[]},{quest_progress,1,evt_use_fruit_limit,21305,[],0,{evt_use_fruit_limit,117},1,0,[],[],[]},{quest_progress,2,evt_use_fruit_limit,21307,[],0,{evt_use_fruit_limit,118},1,0,[],[],[]},{quest_progress,3,evt_use_fruit_limit,21313,[],0,{evt_use_fruit_limit,119},1,0,[],[],[]},{quest_progress,4,evt_use_fruit_limit,21350,[],0,{evt_use_fruit_limit,120},1,0,[],[],[]},{quest_progress,5,evt_use_fruit_limit,21351,[],0,{evt_use_fruit_limit,121},1,0,[],[],[]},{quest_progress,6,evt_use_fruit_limit,21352,[],0,{evt_use_fruit_limit,122},1,0,[],[],[]},{quest_progress,7,evt_use_fruit_limit,21353,[],0,{evt_use_fruit_limit,123},1,0,[],[],[]},{quest_progress,8,evt_use_fruit_limit,21354,[],0,{evt_use_fruit_limit,124},1,0,[],[],[]}],0,0,0,0},{quest,540210,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[mentions],0,{evt_friend_circle,115},3,0,[],[],[]}],0,0,0,0},{quest,540206,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[photos],0,{evt_friend_circle,114},4,0,[],[],[]}],0,0,0,0},{quest,510203,[],1,1,0,0,[{quest_progress,0,evt_guild_post,40,[],0,{evt_guild_post,113},1,0,[],[],[]}],0,0,0,0},{quest,510220,[],1,1,0,0,[{quest_progress,0,evt_guild_leave,0,[],0,{evt_guild_leave,112},1,0,[],[],[]}],0,0,0,0},{quest,510202,[],1,1,0,0,[{quest_progress,0,evt_guild_post,50,[],0,{evt_guild_post,111},1,0,[],[],[]}],0,0,0,0},{quest,210120,[],1,1,0,0,[{quest_progress,0,evt_pet_rename,0,[],0,{evt_pet_rename,110},1,0,[],[],[]}],0,0,0,0},{quest,140240,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[is_die],0,{evt_combat_statistics,109},1,0,[],[],[]}],0,0,0,0},{quest,520101,[],1,1,0,0,[{quest_progress,0,evt_friend,0,[],0,{evt_friend,108},1,0,[],[],[]}],0,0,0,0},{quest,510201,[],1,1,0,0,[{quest_progress,0,evt_guild_post,60,[],0,{evt_guild_post,107},1,0,[],[],[]}],0,0,0,0},{quest,140250,[],1,1,0,0,[{quest_progress,0,evt_combat_statistics,0,[win_die],0,{evt_combat_statistics,106},1,0,[],[],[]}],0,0,0,0},{quest,540223,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[day_num],0,{evt_friend_circle,105},3,0,[],[],[]}],0,0,0,0},{quest,540220,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_commented,1,[],0,{evt_friend_circle_commented,104},10,0,[],[],[]}],0,0,0,0},{quest,540217,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_comment,0,[],0,{evt_friend_circle_comment,103},10,0,[],[],[]}],0,0,0,0},{quest,540214,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_liked,1,[],0,{evt_friend_circle_liked,102},10,0,[],[],[]}],0,0,0,0},{quest,540211,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_like,0,[],0,{evt_friend_circle_like,101},10,0,[],[],[]}],0,0,0,0},{quest,540207,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[mentions_acc],0,{evt_friend_circle,100},20,0,[],[],[]}],0,0,0,0},{quest,540203,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[photos_acc],0,{evt_friend_circle,99},10,0,[],[],[]}],0,0,0,0},{quest,540200,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[],0,{evt_friend_circle,98},1,0,[],[],[]}],0,0,0,0}],[],20,[]},{m_wedding,1,{0,[],0},[],0,[],[],[]},{m_constellation,2,0,[],[]},{m_investment,2,0,[],2,0,[]},{m_privilege,2,0,[],[],[]},{m_limit_return,1,0,1793177534,1793178279,0,0,0,0,[],0,0,0},{m_pray,0,1,0,0,[1,0],[],0,0},{m_teacher,{0,[],0},2,[],0,[],0,0,[],[],[],[],[],0,0,[],0},{m_help,1,1,[],[],[],[]},{m_achieve_shop,5,[{3,[{ashop_goods_info,1,214,1,0},{ashop_goods_info,1,0,1,0}]}],0,401,301,0,[],0,0,0},{m_brave_trial,2,0,[],[],0,0,[],0,[]},{m_camp_dragon_boat,0,0,0,[],0,0,0,[]},{m_over_seas,0},{m_hook_setting,2,0,[]},{m_tournament,3,[],0,[],0,0,0,[],0},{m_market_gold,1,[]},{m_goal,2,[],[],[],1,1793154179,[],[]},{m_family,1,{0,[],0},undefined,{0,[],0},{family_store,1,0,[]},[],[]},{m_charge_gift,1,1,1793177534,1793178279,1793178279,0,0,0,[],0,0,1,[]},{m_mount,10,[],{mount_goal,1,[{500,1793087297}],[],[]},1,0,[],[],[],[],0,[],{1,[],0},0},{m_camp_web,4,[],[],[],0,[],[],{0,0,0,[]}},{m_handbook,4,[],[],0,[],0,[],[]},{m_endless_challenge,3,0,[],[],0,[],0,0,0},{m_lev_break,0,0,0,0,0},{m_head,2,0,0,0,[],0,0,0,[]},{m_extension,3,1,[],0,[],{0,[],0},[],[],0,0},{m_camp_cake,0,0,0,0,0,0,0,[],0,[]},{m_rainbow_lottery,1,[{rainbow_prize,1,1002,22205,1,0,350,20,1,60,400,1},{rainbow_prize,1,2001,29390,1,0,59,30,1,0,0,0},{rainbow_prize,1,3011,22216,1,0,50,40,0,0,0,1},{rainbow_prize,1,3014,22585,1,0,50,40,0,0,0,1},{rainbow_prize,1,4004,20658,1,0,37,60,0,0,0,1},{rainbow_prize,1,4001,22595,1,0,100,60,0,0,0,1},{rainbow_prize,1,5001,20000,1,0,77,260,0,0,0,0},{rainbow_prize,1,5013,21098,1,0,77,260,0,0,0,0},{rainbow_prize,1,5012,20025,1,0,77,260,0,0,0,0},{rainbow_prize,1,5014,20034,1,0,77,260,0,0,0,0},{rainbow_prize,1,6001,20006,3,0,41,200,0,0,0,0},{rainbow_prize,1,6022,20060,1,0,41,200,0,0,0,0},{rainbow_prize,1,6007,20006,3,0,41,200,0,0,0,0},{rainbow_prize,1,6004,20060,1,0,41,200,0,0,0,0},{rainbow_prize,1,6014,20020,1,0,42,200,0,0,0,0},{rainbow_prize,1,6024,20004,1,0,42,200,0,0,0,0}],0,[]},{m_sworn,0,{0,[],0},0,[],[],0},{m_gods_duel,2,{0,[],0},0},{m_preparation,0,undefined,0,0},{m_reward_back,3,1,[],1793150003,1793150003,40,13},{m_child,1,[],0,0,[]},{m_maze,4,0,10135,0,[{4,4},{2,4},{5,2},{2,5},{5,4}],[{maze_open,{1,1},1,1,1,0,3,2,0,0,0,0,[],0},{maze_open,{5,5},1,5,5,0,3,1,0,0,0,0,[],0}],[{{0,0},15,1,20088,1,1},{{0,0},27,1,20000,1,1},{{0,0},21,1,20060,1,1},{{0,0},40,1,20521,1,1},{{0,0},34,1,23555,1,2},{{0,0},185,1,21961,1,1},{{0,0},1,1,20052,1,1},{{0,0},162,2,2,1,4},{{0,0},40,1,20521,1,1},{{0,0},106,1,23540,1,3},{{0,0},148,2,1,1,1},{{0,0},29,1,20074,1,1},{{0,0},116,1,23853,1,1},{{5,3},61,1,23525,1,1},{{5,1},163,2,6,1,4},{{4,5},1,1,20052,1,1},{{4,3},148,2,1,1,1},{{4,2},64,1,23528,1,1},{{4,1},48,1,23524,1,1},{{3,5},148,2,1,1,1},{{3,4},52,1,90000,9000,1},{{3,3},54,1,90000,9300,1},{{3,2},67,1,21853,1,1},{{3,1},90,1,23538,1,3},{{2,3},22,1,20091,1,1},{{2,2},66,1,21852,1,1},{{2,1},49,1,21850,1,1},{{1,5},34,1,23555,1,2},{{1,4},1,1,20052,1,1},{{1,3},89,1,23537,1,2},{{1,2},56,1,20525,1,1}],0,[],0,[],[],[],[]},{m_raffle,0,[]},{m_rencounter,1},{m_talisman,5,1,1,[],[],[],0,0,[],0,[],0,48},{m_month_gift,[]},{m_pay_turn,0,[]},{m_camp_box,0,[],[],[],0,0,0},{m_camp_pay_continus,0,0,[],0},{m_spirit_treasure,1,0,0,0,[],0,[]},{m_camp_discount,0,0,[],[],0,0},{m_camp_7_7th,{0,[],0},[],0,0,0,0,0,1,1793150003},{m_new_expression,[],[]},{m_exquisite_shelf,2,0,0,undefined,0,[],0,0},{m_camp_recharge,[]},{m_camp_recharge_gift,[]},{camp_collection,0,[],[],0,0},{m_camp_cut_price,0,[],[],undefined,[],[]},{m_camp_inquiry,1,[]},{m_gods_place,3,0,0,0,0,0,0,1,1,0,0,0},{m_camp_slot_machine,1,0,[],0,[]},{m_camp_sign_draw,1,0,0,0,0,[],[]},{m_agenda_week,1,1,36,[],1793178376},{m_exp_bottle,1,0,0,0,0},{m_camp_zillionaire,1,0,0,0,0,0,0,[],[]},{m_provocation,3,0,0,0,[],0,1,0,0,[],[],[],0,0},{m_oracle_treasure,2,0,0,0,[],0,[],0,0},{m_camp_pass_flower_language,1,0,[{7,0},{6,0},{5,0},{4,0},{3,0},{2,0},{1,0}],0},{m_camp_score_exchange,1,0,0,0,0,[],[]},{m_camp_pray,2,0,0,[],0,[]},{package,1,16,75,[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75],[{item,0,8,22511,1,0,111,1,3,0,-1,0,0,0,1,3,0,0,[],[],20,0,2,[],[]},{item,0,11,10624,0,0,12,3,2,0,0,0,0,0,1,2,0,0,[{attr_base,0,7,12,1,80},{attr_base,0,2,12,1,398}],[],20,6,2,[],[]},{item,0,6,20006,1,0,0,0,2,0,-1,0,0,0,15,1,0,0,[],[],5,0,2,[],[]}]},{package,2,1,25,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],[]},{package,3,1,20,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],[{item,0,4,10504,1,0,9,3,1,0,0,0,0,0,1,4,0,0,[{attr_base,0,25,12,1,4},{attr_base,0,1,12,1,27}],[],1,0,2,[{23,0,[]}],[]},{item,0,3,10522,0,0,7,3,1,0,0,0,0,0,1,3,0,0,[{attr_base,0,7,12,1,53},{attr_base,0,5,12,1,199}],[],20,0,2,[{23,0,[]}],[]},{item,0,2,10521,0,0,6,3,1,0,0,0,0,0,1,2,0,0,[{attr_base,0,26,12,1,27},{attr_base,0,4,12,1,128}],[],20,0,2,[{23,0,[]}],[]},{item,0,1,10621,0,10501,21,3,3,0,0,0,0,0,1,1,0,0,[{attr_base,0,43,12,1,282},{attr_base,0,5,12,1,107},{attr_base,0,4,12,1,298}],[],20,6,2,[{23,0,[]}],[]},{item,0,8,10626,0,0,14,3,2,0,0,0,0,0,1,8,0,0,[{attr_base,0,6,12,1,39},{attr_base,0,3,12,1,16}],[],20,6,2,[{23,0,[]}],[]},{item,0,7,10604,1,0,12,3,1,0,0,0,0,0,1,7,0,0,[{attr_base,0,7,12,1,12},{attr_base,0,2,12,1,239}],[],1,6,2,[{23,0,[]}],[]},{item,0,6,10623,0,0,11,3,2,0,0,0,0,0,1,6,0,0,[{attr_base,0,6,12,1,19},{attr_base,0,1,12,1,420}],[],20,6,2,[{23,0,[]}],[]},{item,0,5,10622,0,0,10,3,2,0,0,0,0,0,1,5,0,0,[{attr_base,0,6,12,1,136}],[],20,6,2,[{23,0,[]}],[]}]},{package,4,1,0,[],[]}}');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_charge_cfg`
--

DROP TABLE IF EXISTS `role_charge_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_charge_cfg` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `label` varchar(50) NOT NULL COMMENT '充值标签',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家计费点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_charge_cfg`
--

LOCK TABLES `role_charge_cfg` WRITE;
/*!40000 ALTER TABLE `role_charge_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_charge_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_info`
--

DROP TABLE IF EXISTS `role_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_info` (
  `rid` int(11) NOT NULL COMMENT '角色信息',
  `platform` varchar(32) NOT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(22) NOT NULL COMMENT '角色',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `classes` int(11) NOT NULL COMMENT '职业',
  `fc` int(11) NOT NULL COMMENT '战力',
  `lev` int(11) NOT NULL COMMENT '等级',
  `exp` int(11) NOT NULL COMMENT '经验',
  `gold` int(11) NOT NULL COMMENT '钻石',
  `gold_bind` int(11) NOT NULL COMMENT '金币',
  `coin` int(11) NOT NULL COMMENT '银币',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备号',
  `device_type` int(4) NOT NULL DEFAULT 1 COMMENT '设备类型 1:安卓 2:ios 3:windows',
  `device_key` varchar(40) NOT NULL DEFAULT '' COMMENT '设备串号',
  `break_times` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级突破次数',
  PRIMARY KEY (`rid`,`platform`,`zone_id`),
  KEY `channel_reg` (`channel_reg`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色详细数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_info`
--

LOCK TABLES `role_info` WRITE;
/*!40000 ALTER TABLE `role_info` DISABLE KEYS */;
INSERT INTO `role_info` VALUES (1,'dev',1,'2017682741_0',0,'5470','亲测源码网',1,6,11465,100,8221,0,0,0,0,'120.11.121.114',1619872924,'120.11.121.114',1619876660,1619875682,0,'845f4276f722b54860398f5c95e58c49',1,'865166028895061',0),(2,'dev',1,'test123',0,'5470','贝利托特',1,6,1554,24,23182,0,0,546119,0,'127.0.0.1',1793086326,'127.0.0.1',1793177534,1793173301,0,'virtual_1793067866_5032',1,'',0);
/*!40000 ALTER TABLE `role_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title`
--

DROP TABLE IF EXISTS `strategy_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `gm` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1-官方发布;0-玩家发布',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title`
--

LOCK TABLES `strategy_title` WRITE;
/*!40000 ALTER TABLE `strategy_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title_local`
--

DROP TABLE IF EXISTS `strategy_title_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title_local` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `state` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-申请状态;1-审核通过;2-审核不通过',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统本地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title_local`
--

LOCK TABLES `strategy_title_local` WRITE;
/*!40000 ALTER TABLE `strategy_title_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_board`
--

DROP TABLE IF EXISTS `sys_notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `title` text DEFAULT NULL COMMENT '通知标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  `gain` text DEFAULT NULL COMMENT '奖励',
  `cond` text DEFAULT NULL COMMENT '领取条件',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='通知公告板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_board`
--

LOCK TABLES `sys_notice_board` WRITE;
/*!40000 ALTER TABLE `sys_notice_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_scroll`
--

DROP TABLE IF EXISTS `sys_notice_scroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_scroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `interval_time` int(10) unsigned NOT NULL COMMENT '间隔时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='滚动广播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_scroll`
--

LOCK TABLES `sys_notice_scroll` WRITE;
/*!40000 ALTER TABLE `sys_notice_scroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_scroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:禁言 2:封号 3:无效',
  `ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号/禁言时间',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `type_1` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报1-类型,1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_1` text DEFAULT NULL COMMENT '原因1',
  `msg_1` text DEFAULT NULL COMMENT '证据1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `type_2` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报2-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_2` text DEFAULT NULL COMMENT '原因2',
  `msg_2` text DEFAULT NULL COMMENT '证据2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报3-时间戳',
  `type_3` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报3-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_3` text DEFAULT NULL COMMENT '原因3',
  `msg_3` text DEFAULT NULL COMMENT '证据3',
  `id_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色4-id',
  `platform_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-平台标识',
  `zone_id_4` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色4-区号',
  `name_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-名字',
  `lev_4` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色4-等级',
  `time_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报4-时间戳',
  `type_4` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报4-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_4` text DEFAULT NULL COMMENT '原因4',
  `msg_4` text DEFAULT NULL COMMENT '证据4',
  `id_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色5-id',
  `platform_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-平台标识',
  `zone_id_5` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色5-区号',
  `name_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-名字',
  `lev_5` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色5-等级',
  `time_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报5-时间戳',
  `type_5` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报5-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_5` text DEFAULT NULL COMMENT '原因5',
  `msg_5` text DEFAULT NULL COMMENT '证据5',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_white_list`
--

DROP TABLE IF EXISTS `sys_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_white_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `name` varchar(20) NOT NULL COMMENT '使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='白名单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_white_list`
--

LOCK TABLES `sys_white_list` WRITE;
/*!40000 ALTER TABLE `sys_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fswy_dev_1'
--

--
-- Dumping routines for database 'fswy_dev_1'
--

--
-- Current Database: `fswy_dev_2`
--

/*!40000 DROP DATABASE IF EXISTS `fswy_dev_2`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fswy_dev_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `fswy_dev_2`;

--
-- Table structure for table `auth_sfz_cfg`
--

DROP TABLE IF EXISTS `auth_sfz_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sfz_cfg` (
  `platform` varchar(30) NOT NULL COMMENT 'ID编号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道编号',
  `can_charge` tinyint(4) NOT NULL COMMENT '未认证是否能充值(0:否 1:是)',
  `is_nonage` tinyint(4) NOT NULL COMMENT '未成年是否限制充值(0:否 1:是)',
  `charge_limit` int(11) NOT NULL COMMENT '未成年充值额度',
  `is_wallow` tinyint(4) NOT NULL COMMENT '是否开启防沉迷(0:否 1:是)',
  `down_sec` int(11) NOT NULL COMMENT '沉迷时间(秒)',
  `is_show_phone` tinyint(4) NOT NULL COMMENT '是否显示未到账联系方式(0:否 1:是)',
  `is_mail` tinyint(4) NOT NULL COMMENT '充值发送邮件(0:否 1:是)',
  `show_info` varchar(50) NOT NULL COMMENT '联系信息(0:否 1:是)',
  `is_mid_exp` tinyint(4) NOT NULL COMMENT '是否收益减半(0:否 1:是)',
  `is_lev_60` tinyint(4) NOT NULL COMMENT '只针对60级以下(0:否 1:是)',
  `is_need_check` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否开启标签页',
  PRIMARY KEY (`platform`,`channel_reg`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='防沉迷设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sfz_cfg`
--

LOCK TABLES `auth_sfz_cfg` WRITE;
/*!40000 ALTER TABLE `auth_sfz_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sfz_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web`
--

DROP TABLE IF EXISTS `camp_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_id` int(11) NOT NULL COMMENT '活动ID',
  `camp_id` int(11) NOT NULL COMMENT '活动条件ID',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `sec_type` int(11) NOT NULL COMMENT '具体类型',
  `settlement` int(4) NOT NULL COMMENT '结算类型',
  `reward_mod` int(4) NOT NULL COMMENT '奖励模式',
  `reward_num` int(11) NOT NULL COMMENT '最大奖励次数',
  `star` int(11) NOT NULL DEFAULT 2 COMMENT '星级',
  `mail_title` varchar(64) NOT NULL DEFAULT '' COMMENT '信件标题',
  `mail_content` text NOT NULL COMMENT '信件内容',
  `sort_val` int(11) NOT NULL DEFAULT 5 COMMENT '显示排序字段',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(128) NOT NULL DEFAULT '' COMMENT '标题2',
  `title_ico` varchar(64) NOT NULL COMMENT '标题图片',
  `ico` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `type_ico` varchar(32) NOT NULL DEFAULT '' COMMENT '类型图标',
  `total_ico` int(11) NOT NULL DEFAULT 0 COMMENT '独立总图标',
  `top_banner` varchar(64) NOT NULL DEFAULT '' COMMENT '顶部横幅',
  `rule_str` varchar(1024) NOT NULL DEFAULT '' COMMENT '规则描述',
  `time_str` varchar(128) NOT NULL DEFAULT '' COMMENT '时间描述',
  `bottom_alert` varchar(1024) NOT NULL DEFAULT '' COMMENT '底部描述',
  `reward_title` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励表头',
  `panel_type` varchar(128) NOT NULL DEFAULT '' COMMENT '面板类型',
  `reward` varchar(2048) NOT NULL DEFAULT '' COMMENT '子活动奖励',
  `cli_reward` varchar(1024) NOT NULL DEFAULT '' COMMENT '客户端奖励',
  `notice_msg` varchar(512) NOT NULL DEFAULT '' COMMENT '传闻公告',
  `button_text` varchar(48) NOT NULL DEFAULT '' COMMENT '按钮内容',
  `is_button` int(4) NOT NULL DEFAULT 1 COMMENT '是否按钮',
  `web_id` int(11) NOT NULL COMMENT '活动类型编号web端用',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `tran_info` varchar(512) NOT NULL DEFAULT '' COMMENT '跳转内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `camp_id` (`camp_id`),
  KEY `total_id` (`total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台子活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web`
--

LOCK TABLES `camp_web` WRITE;
/*!40000 ALTER TABLE `camp_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web_ico`
--

DROP TABLE IF EXISTS `camp_web_ico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web_ico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `total_id` int(11) NOT NULL COMMENT '总活动ID_唯一值',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '总活动名称',
  `title` varchar(128) DEFAULT '' COMMENT '总活动标题',
  `ico` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动图标',
  `alert` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动提示',
  `gif` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动动画',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `status` int(11) NOT NULL COMMENT '活动状态[1:等待审核 2:审核已发送 3:拒绝]',
  `open_day` int(11) NOT NULL DEFAULT 0 COMMENT '开服多少天后起作用',
  `merge_day` int(11) NOT NULL DEFAULT 0 COMMENT '合服多少天后起作用',
  `login_open` int(4) NOT NULL DEFAULT 0 COMMENT '是否登录打开界面',
  `is_show_time` int(4) NOT NULL DEFAULT 0 COMMENT '是否显示倒计时',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `total_id` (`total_id`),
  KEY `name` (`name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台总活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web_ico`
--

LOCK TABLES `camp_web_ico` WRITE;
/*!40000 ALTER TABLE `camp_web_ico` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web_ico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(120) NOT NULL COMMENT '订单号',
  `type` tinyint(3) unsigned NOT NULL COMMENT '充值类型(0:银行卡, 1:手机充值)',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未收取，1:已收取)',
  `gold` int(11) NOT NULL COMMENT '钻石数',
  `charge_type` int(11) NOT NULL DEFAULT 0 COMMENT '充值类型(0 普通充值 1 礼品充值)',
  `money` decimal(10,2) NOT NULL COMMENT '金额数',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` char(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(60) NOT NULL COMMENT '角色名称',
  `classes` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `lev` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `is_test` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否是测试充值',
  `ts` int(11) unsigned NOT NULL COMMENT '订单插入时间',
  `time_deal` int(11) NOT NULL DEFAULT 0 COMMENT '处理时间',
  `rmb` int(11) NOT NULL DEFAULT 0 COMMENT '充值余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `rid` (`rid`,`name`),
  KEY `account` (`account`),
  KEY `acc_search_idx` (`account`,`platform`,`zone_id`,`status`),
  KEY `rid_search_idx` (`rid`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('unreply','replied') NOT NULL DEFAULT 'unreply' COMMENT '回复状态',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `charge` int(11) NOT NULL COMMENT '累计充值钻石数',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(40) NOT NULL COMMENT '联系方式',
  `post_time` int(10) unsigned NOT NULL COMMENT '留言日期（unix_time）',
  `feedback_ip` char(16) DEFAULT NULL COMMENT '反馈ip',
  `gm_name` varchar(20) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `reply_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`,`rid`),
  KEY `date` (`post_time`,`reply_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_circle_report`
--

DROP TABLE IF EXISTS `friend_circle_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_circle_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned NOT NULL DEFAULT 0 COMMENT '0:动态 1:评论 2:图片',
  `spec_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`report_type`,`spec_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='朋友圈举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_circle_report`
--

LOCK TABLES `friend_circle_report` WRITE;
/*!40000 ALTER TABLE `friend_circle_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_circle_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_moment_wish`
--

DROP TABLE IF EXISTS `friend_moment_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_moment_wish` (
  `id` int(11) unsigned NOT NULL COMMENT '寄语动态id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '动态区号',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '角色平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '角色等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `camp_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
  `theme` varchar(20) NOT NULL COMMENT '活动主题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_photo` tinyint(4) NOT NULL DEFAULT 0 COMMENT '活动主题',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:审核通过 2:不通过',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='庆典寄语表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_moment_wish`
--

LOCK TABLES `friend_moment_wish` WRITE;
/*!40000 ALTER TABLE `friend_moment_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_moment_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodvoice_report`
--

DROP TABLE IF EXISTS `goodvoice_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodvoice_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除录音 2:无效, 3除名',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `filename_1` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_2` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_3` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名3',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='好声音举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodvoice_report`
--

LOCK TABLES `goodvoice_report` WRITE;
/*!40000 ALTER TABLE `goodvoice_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodvoice_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_role`
--

DROP TABLE IF EXISTS `lock_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_role` (
  `id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `lock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间型封号, 2永久封号',
  `lock_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号时间',
  `lock_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '封号过期时间',
  `lock_info` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `silent_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间禁言, 2永久禁言',
  `silent_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '禁言时间',
  `silent_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '禁言过期时间',
  `silent_hide` tinyint(1) DEFAULT 0 COMMENT '是否通知被禁言人,1:不通知,2:通知',
  `silent_info` varchar(200) NOT NULL DEFAULT '' COMMENT '禁言原因',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色封号禁言列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_role`
--

LOCK TABLES `lock_role` WRITE;
/*!40000 ALTER TABLE `lock_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_online`
--

DROP TABLE IF EXISTS `log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道id',
  `ts` int(11) NOT NULL DEFAULT 0 COMMENT '统计时间',
  `role_num` int(10) NOT NULL COMMENT '在线人数',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `channel_reg` (`channel_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='实时在线人数统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_online`
--

LOCK TABLES `log_online` WRITE;
/*!40000 ALTER TABLE `log_online` DISABLE KEYS */;
INSERT INTO `log_online` VALUES (1,0,1619873335,1,'dev',2),(2,0,1619873395,1,'dev',2),(3,0,1619873455,1,'dev',2),(4,0,1619873515,1,'dev',2),(5,0,1619873575,1,'dev',2),(6,0,1619873635,1,'dev',2),(7,0,1619873695,1,'dev',2),(8,0,1619873755,1,'dev',2);
/*!40000 ALTER TABLE `log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card`
--

DROP TABLE IF EXISTS `media_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card` (
  `card_num` varchar(48) NOT NULL COMMENT '卡号',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型编号',
  `batch_num` int(11) NOT NULL DEFAULT 1 COMMENT '批次',
  `rid` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `get_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ctime` int(11) NOT NULL COMMENT '新建时间',
  PRIMARY KEY (`card_num`),
  KEY `role_index` (`type`,`rid`,`platform`,`zone_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card`
--

LOCK TABLES `media_card` WRITE;
/*!40000 ALTER TABLE `media_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card_type`
--

DROP TABLE IF EXISTS `media_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card_type` (
  `id` int(11) NOT NULL COMMENT 'ID编号',
  `name` varchar(22) NOT NULL COMMENT '名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `lev` int(8) NOT NULL COMMENT '等级',
  `num` int(10) NOT NULL COMMENT '次数限制',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:失效 1:启动)',
  `items` varchar(1024) NOT NULL COMMENT '物品奖励({Id,Bind,Num})',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card_type`
--

LOCK TABLES `media_card_type` WRITE;
/*!40000 ALTER TABLE `media_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_mirrors`
--

DROP TABLE IF EXISTS `oms_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `auto_connect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启动后自动连接中央服',
  `nodename` varchar(255) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` varchar(10) NOT NULL DEFAULT 'zone' COMMENT '节点类型，zone:普通游戏区 center:中央服 world:世界主服务器 world_slave:世界从服务器',
  `cookie` varchar(255) NOT NULL DEFAULT '' COMMENT 'erlang节点使用的magic cookie',
  `ver` varchar(30) NOT NULL DEFAULT '' COMMENT '当前版本(此版本号用于标识当前版本，由安装工具自动填写)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`platform`,`zone_id`),
  UNIQUE KEY `nodename` (`nodename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='节点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_mirrors`
--

LOCK TABLES `oms_mirrors` WRITE;
/*!40000 ALTER TABLE `oms_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_log`
--

DROP TABLE IF EXISTS `review_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_log` (
  `id` int(11) unsigned NOT NULL COMMENT '评论id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `log_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '宠物或守护id',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 1 COMMENT '1增加，2删除',
  `base_name` varchar(20) NOT NULL DEFAULT '' COMMENT '宠物或守护名',
  `pro` varchar(20) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`),
  KEY `log_type` (`log_type`,`base_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_log`
--

LOCK TABLES `review_log` WRITE;
/*!40000 ALTER TABLE `review_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_report`
--

DROP TABLE IF EXISTS `review_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_report`
--

LOCK TABLES `review_report` WRITE;
/*!40000 ALTER TABLE `review_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `ver` int(11) NOT NULL COMMENT '版本号',
  `data` mediumblob NOT NULL COMMENT '序列化后的角色数据',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  UNIQUE KEY `name` (`name`,`platform`,`zone_id`),
  UNIQUE KEY `acc` (`account`,`platform`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'dev',2,'2017682741_0',0,'5470','亲测源码网',0,'120.11.121.114',1619873287,'120.11.121.114',1619873287,1619873814,0,0,4,5,76,'{role,76,undefined,20,false,true,{1619873287,1619873814},1619873287,{120,11,121,114},{120,11,121,114},0,{1,[100,101,118],2},[100,101,118],2,0,[53,52,55,48],[56,52,53,102,52,50,55,54,102,55,50,50,98,53,52,56,54,48,51,57,56,102,53,99,57,53,101,53,56,99,52,57],1,[56,54,53,49,54,54,48,50,56,56,57,53,48,54,49],[50,48,49,55,54,56,50,55,52,49,95,48],[22810,36164,28304,28216,25103],0,0,0,0,4,5,0,260,469,785,1,1,1,{assets,41,798,110614,0,0,0,0,0,0,297,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{attr,3,0,260,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},undefined,{1,[]},{rtimer,undefined,undefined,[]},{pos,10001,[100,101,118],2,undefined,10001,undefined,undefined,0,2803,1467,5},[],0,0,0,0,undefined,0,[],[],false,[],0,{m_attr_point,2,[],0,1,[{attr_point_plan,1,[],1,5,1,13,5,0,1,0,3,1}],0},{m_combat,3,undefined,undefined,0,[],[],[],0},{m_quest,19,[{quest,22084,[],1,1,0,0,[{quest_progress,0,evt_everyday,1,[],0,{evt_everyday,183},1,0,[91,57,57,44,49,48,50,48,52,44,49,93],[],[]},{quest_progress,1,evt_campaign_reward,1,[1001],0,{evt_campaign_reward,184},1,0,[91,57,57,44,49,48,50,48,52,44,49,44,56,93],[],[]}],0,0,0,0}],[],[22080,22066,22060,22054,22050,22030,22000],[],{quest_classes,0,0,1,0,0,[]},{quest_offer,0,0,0,0,0,0,[]},{quest_prac,1,2,0},{quest_treasure,0,0,0},{quest_guild,0,0,1,0,0,[]},{quest_chain,0,0,0,[],0,0,undefined},{quest_marriage,0,0,0,0,0,#{mid=>0,robot_id=>undefined}},{quest_couple,0,0,0,0,0,undefined,#{mid=>0,partner_name=>[],robot_id=>undefined,triggers=>[]}},{quest_plant,0,0,0,0,0,0,{0,0,0},[]},{quest_teacher,0,0,0,undefined,0,0,[],#{appoint_trigger=>undefined,ask_id=>{<<>>,0,0},ask_start_time=>0}},{quest_shipping,[]},{quest_pursue,0,0,0,1,0,0,[]},2,{quest_child,0,0,0,0,1,0,[]},{quest_pregnancy,0,0,0,0,1,[]},{quest_acquaintance,0,0,0,0,0,[],[],0,0},{quest_king,1,1,[],[],0},{quest_summer,1,[],[],0,[]},{quest_single_dog,1,[],1,#{}},{quest_sign_draw,[],[]},{quest_score_exchange,[],[]},{quest_long_active,[],[]}},{m_pet,2,1,2,[{pet,32,1,1,[27874,27874],7,2146,679,4,0,0,330,1003,1,10001,{attr,3,0,520,568,851,17,170,63,72,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,32,14,8,8,8,0},568,851,568,851,{pet_attr,0,32,14,8,8,8,0,0,0,0,0,0,0,0,0,0,1188,1265,1009,831,1246,1188,1265,1009,831,1246},7687,[],[{pet_skill,60033,1,1,1,33,1,0,0},{pet_skill,60037,1,1,1,37,1,0,0},{pet_skill,60039,1,1,1,39,1,0,0}],1,0,[],[],[],0,0,[{1,[20154,23478,33258,24102,36830,20987,36861,20987,21734,27874,123,102,97,99,101,95,49,44,49,125]},{2,[30475,25105,30340,36830,20987,36861,20987,27969,123,102,97,99,101,95,49,44,51,54,125]},{3,[20307,21147,21152,28857,33021,35753,25105,26356,25239,25549,27874,123,102,97,99,101,95,49,44,32,49,49,125]},{4,[21710,21568,65292,26159,19981,26159,24536,35760,32473,25105,21152,28857,20102,123,102,97,99,101,95,49,44,32,50,49,125]},{7,[25105,20808,21435,21969,26412,23456,29289,32463,39564,20070,123,102,97,99,101,95,49,44,49,53,125]}],0,0,0,[],0,0,[],0,0,{pet_tmp_aptitude,0,0,{pet_attr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},[],0,0,0,0},0,{pet_skin,0,[],0,0,0,0,0,0},0,0,[],[],[],0,{0,[],0},0,[{pet_rune,2,1,0,0,0,0,[]},{pet_rune,1,2,0,0,0,0,[]}]}],3,5,0},{m_skill,6,[{40001,4},{40002,4},{40003,0},{40006,0},{40005,0},{40004,0},{40007,0},{40008,0}],1,62000,[],[],[],[],[],[],0,100,0,0,[]},{m_var,1,1619873286,1619873286,1619873286,[],[{143,480}],[],0,527,[{1016,0},{1001,440}],[{2094,1},{2000,{95,0}},{2134,1},{2137,1},{2022,{card_state,0,0,0,0,0,0,1619873287}},{2115,0},{2032,[]},{2110,1},{2102,1},{2118,1},{2105,1},{2136,1},{2123,1},{2124,1},{2125,[{fashion_repaire,1}]},{2023,[create_1,compensate_1]}]},{m_guard,1,[2,3,4,5],[],[],[]},{m_plot,1,1,[30150,70180,70177,70176,70174,70140,70046,70044,70050,70040,70039,70038,70037,70035,70020,70000,100,70036],[],[{plot,70184,0,0},{plot,70048,1,0},{plot,70060,0,0},{plot,10046,0,0},{plot,10044,0,0},{plot,10574,0,0},{plot,10510,0,0},{plot,10440,0,0},{plot,70384,0,0},{plot,70300,0,0},{plot,70190,0,0},{plot,70185,0,0}],[{plot,70010,0,0},{plot,120,0,0},{plot,110,0,0},{plot,101,0,0}],[22],[{plot_unit,10040,[22307,24515,22478],40005,1,1,0,20001,1517,262,7,[115,116,97,110,100],[],0,0,0,0,0}],[],[],0,0,[],[],0},{m_dungeon,4,0,0,[],[],0},undefined,undefined,{m_option,1,[]},{m_wing,11,0,1,0,0,0,[],0,0,0,1,1,[{wing_skill_plan,1,[],[],[]}],0,0,[],[],0,0,0,[],1,[],100},{m_team,0,undefined,3,[],0,0,0,[1,2,3,4,5],[],0},{m_honor,3,0,0,[],0,[],[]},{m_friend,2,[],0,0,1,0,0,0,[],0,1,1,1,[],[],0,0,[],0},{m_wake,0,0,0,0,0,0,0,0,[],[]},{m_arena,1,0,0,1000,0,0,[]},{m_market_silver,1,0,1,[]},{m_escort,0,32000,0,0,0,0,[],0,0,0,0,0,0,0,0,{0,0},0,0,0,[]},{m_buff,2,[],1},{m_formation,1,1,1,[{formation,1,1,0}],[]},{m_skill_life,2,[{skill_life,10000,0,0},{skill_life,10001,0,0},{skill_life,10005,0,0},{skill_life,10006,0,0},{skill_life,10007,0,0},{skill_life,10008,0,0},{skill_life,10009,0,0}]},{m_trial,3,0,0,undefined,{trial_unit,0,0,0,[],0,0,0,0,[],0,0,0},0,0,0,2,0,2,0,0,[],[],[]},{m_fashion,5,[],[],[],[],[],[],[],0,0,0,[]},{m_satiety,1,0,1,0},{m_agenda,1,[{agenda_prog,1,1000,0,0},{agenda_prog,1,1001,0,0},{agenda_prog,1,1002,0,0},{agenda_prog,1,1004,0,0},{agenda_prog,1,1006,0,0},{agenda_prog,1,1007,0,0},{agenda_prog,1,1008,0,0},{agenda_prog,1,1009,0,0},{agenda_prog,1,1010,0,0},{agenda_prog,1,1013,0,0},{agenda_prog,1,1014,0,0},{agenda_prog,1,1017,0,0},{agenda_prog,1,1018,0,0},{agenda_prog,1,1020,0,0},{agenda_prog,1,1021,0,0},{agenda_prog,1,1022,0,0},{agenda_prog,1,1023,0,0},{agenda_prog,1,1024,0,0},{agenda_prog,1,1025,0,0},{agenda_prog,1,1026,0,0},{agenda_prog,1,1027,0,0},{agenda_prog,1,1028,0,0},{agenda_prog,1,1029,0,0},{agenda_prog,1,1030,0,0},{agenda_prog,1,1031,0,0},{agenda_prog,1,2002,0,0},{agenda_prog,1,2003,0,0},{agenda_prog,1,2004,0,0},{agenda_prog,1,2005,0,0},{agenda_prog,1,2006,0,0},{agenda_prog,1,2007,0,0},{agenda_prog,1,2008,0,0},{agenda_prog,1,2009,0,0},{agenda_prog,1,2010,0,0},{agenda_prog,1,2011,0,0},{agenda_prog,1,2012,0,0},{agenda_prog,1,2013,0,0},{agenda_prog,1,2014,0,0},{agenda_prog,1,2015,0,0},{agenda_prog,1,2016,0,0},{agenda_prog,1,2017,0,0},{agenda_prog,1,2018,0,0},{agenda_prog,1,2019,0,0},{agenda_prog,1,2020,0,0},{agenda_prog,1,2021,0,0},{agenda_prog,1,2022,0,0},{agenda_prog,1,2023,0,0},{agenda_prog,1,2024,0,0},{agenda_prog,1,2025,0,0},{agenda_prog,1,2026,0,0},{agenda_prog,1,2027,0,0},{agenda_prog,1,2028,0,0},{agenda_prog,1,2029,0,0},{agenda_prog,1,2030,0,0},{agenda_prog,1,2031,0,0},{agenda_prog,1,2032,0,0},{agenda_prog,1,2033,0,0},{agenda_prog,1,2034,0,0},{agenda_prog,1,2035,0,0},{agenda_prog,1,2036,0,0},{agenda_prog,1,2038,0,0},{agenda_prog,1,2039,0,0},{agenda_prog,1,2040,0,0},{agenda_prog,1,2041,0,0},{agenda_prog,1,2042,0,0},{agenda_prog,1,2043,0,0},{agenda_prog,1,2044,0,0},{agenda_prog,1,2045,0,0},{agenda_prog,1,2046,0,0},{agenda_prog,1,2047,0,0},{agenda_prog,1,2048,0,0},{agenda_prog,1,2049,0,0},{agenda_prog,1,2050,0,0},{agenda_prog,1,2051,0,0},{agenda_prog,1,2052,0,0},{agenda_prog,1,2053,0,0},{agenda_prog,1,2054,0,0},{agenda_prog,1,2055,0,0},{agenda_prog,1,2056,0,0},{agenda_prog,1,2057,0,0},{agenda_prog,1,2058,0,0},{agenda_prog,1,2059,0,0},{agenda_prog,1,2060,0,0},{agenda_prog,1,2061,0,0},{agenda_prog,1,2062,0,0},{agenda_prog,1,2063,0,0},{agenda_prog,1,2064,0,0},{agenda_prog,1,2065,0,0},{agenda_prog,1,2066,0,0},{agenda_prog,1,2067,0,0},{agenda_prog,1,2068,0,0},{agenda_prog,1,2069,0,0},{agenda_prog,1,2070,0,0},{agenda_prog,1,2071,0,0},{agenda_prog,1,2072,0,0},{agenda_prog,1,2073,0,0},{agenda_prog,1,2074,0,0},{agenda_prog,1,2075,0,0},{agenda_prog,1,2076,0,0},{agenda_prog,1,2077,0,0},{agenda_prog,1,2078,0,0},{agenda_prog,1,2079,0,0},{agenda_prog,1,2080,0,0},{agenda_prog,1,2081,0,0},{agenda_prog,1,2082,0,0},{agenda_prog,1,2083,0,0},{agenda_prog,1,2084,0,0},{agenda_prog,1,2085,0,0},{agenda_prog,1,2086,0,0},{agenda_prog,1,2087,0,0},{agenda_prog,1,2088,0,0},{agenda_prog,1,2089,0,0},{agenda_prog,1,2090,0,0},{agenda_prog,1,2091,0,0},{agenda_prog,1,2092,0,0},{agenda_prog,1,2093,0,0},{agenda_prog,1,2094,0,0},{agenda_prog,1,2095,0,0},{agenda_prog,1,2096,0,0},{agenda_prog,1,2097,0,0},{agenda_prog,1,2098,0,0},{agenda_prog,1,2099,0,0},{agenda_prog,1,2100,0,0},{agenda_prog,1,2101,0,0},{agenda_prog,1,2102,0,0},{agenda_prog,1,2103,0,0},{agenda_prog,1,2104,0,0},{agenda_prog,1,2105,0,0},{agenda_prog,1,2106,0,0},{agenda_prog,1,2107,0,0},{agenda_prog,1,2108,0,0},{agenda_prog,1,2109,0,0},{agenda_prog,1,2110,0,0},{agenda_prog,1,2111,0,0},{agenda_prog,1,2112,0,0},{agenda_prog,1,99,0,0}],0,0,[],0,[1002],1619873287},{m_parade,0,undefined},[{mail,{2,[100,101,118],2},{1,[100,101,118],2},{0,[100,101,118],2},0,[],0,[],1,0,0,<<230,152,159,232,190,176,229,173,166,233,153,162,231,154,132,230,157,165,228,191,161>>,<<230,152,159,232,190,176,229,173,166,233,153,162,231,154,132,230,157,165,228,191,161,58,10,32,32,228,186,178,231,136,177,231,154,132,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,229,164,154,232,181,132,230,186,144,230,184,184,230,136,143,60,47,99,111,108,111,114,62,239,188,140,230,172,162,232,191,142,229,155,158,229,136,176,230,152,159,232,190,176,229,164,167,228,184,150,231,149,140,239,188,140,228,189,160,230,137,128,233,128,137,231,154,132,229,133,189,231,129,181,228,187,165,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,229,188,186,229,164,167,230,136,152,230,150,151,230,142,167,229,156,186,232,131,189,229,138,155,60,47,99,111,108,111,114,62,232,145,151,231,167,176,239,188,140,230,142,168,232,141,144,229,162,158,229,138,160,60,99,111,108,111,114,61,39,35,48,48,102,102,48,48,39,62,228,189,147,232,180,168,227,128,129,230,149,143,230,141,183,60,47,99,111,108,111,114,62,229,177,158,230,128,167,239,188,140,232,190,190,229,136,176,50,48,231,186,167,229,144,142,229,143,175,229,137,141,229,190,128,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,229,175,188,229,184,136,229,190,183,230,158,151,60,47,99,111,108,111,114,62,229,164,132,230,139,156,229,184,136,229,147,159,239,188,140,230,155,180,229,191,171,232,158,141,229,133,165,230,152,159,232,190,176,229,164,167,229,174,182,229,186,173,229,144,167,123,102,97,99,101,95,49,44,53,52,125>>,[],0,1619873803,1619873803,0},{mail,{3,[100,101,118],2},{1,[100,101,118],2},{0,[100,101,118],2},0,[],0,[],1,0,0,<<230,150,176,231,142,169,229,174,182,233,188,147,229,138,177>>,<<228,186,178,231,136,177,231,154,132,60,99,111,108,111,114,61,39,35,102,102,102,102,48,48,39,62,229,164,154,232,181,132,230,186,144,230,184,184,230,136,143,60,47,99,111,108,111,114,62,58,10,32,32,230,129,173,229,150,156,228,189,160,232,142,183,229,190,151,230,150,176,231,167,128,229,141,135,231,186,167,229,164,167,231,164,188,229,140,133,239,188,140,229,134,133,229,144,171,229,164,167,233,135,143,231,187,143,233,170,140,227,128,129,229,134,146,233,153,169,231,187,143,233,170,140,229,165,150,229,138,177,239,188,140,229,143,175,228,187,165,229,184,174,229,138,169,230,130,168,230,155,180,229,191,171,230,143,144,229,141,135,231,173,137,231,186,167,230,136,152,229,138,155,229,147,166,239,188,140,231,165,157,230,130,168,229,156,168,230,152,159,232,190,176,228,184,150,231,149,140,228,184,173,232,131,189,229,164,159,230,148,182,232,142,183,230,155,180,229,164,167,231,154,132,230,172,162,228,185,144,123,102,97,99,101,95,49,44,51,52,125>>,[{item,0,0,22227,1,0,111,1,3,0,-1,0,0,0,1,0,0,0,[],[],25,0,2,[],[]},{item,0,0,20025,1,0,0,0,2,0,-1,0,0,0,35,0,0,0,[],[],30,0,2,[],[]}],0,1619873803,1619873803,0}],{m_qualifying,1000,0,0,0,0,[],0,0,0},{m_treasure,0,{treasure_reward,0,0,0,0,[]},{treasure_compass,0,0,0,0,0,0},0},{m_campaign,27,[{1001,1619873407,480}],[{1001,1619873407,1}],[],{campaign_eggs,0,0,[],0,0,[]},{campaign_bags,0,[],0,0},[],{camp_login,0,0,0,[],[]},{camp_hide_seek,0,0,[],0,[]},{camp_login_roll,0,0,[],[],0,0,0},{camp_series_recharge,1,{2021,5,1},0,[{1,0}],0,0,0,0},{campaign_card,0,0,0,0,[]},0,[],{campaign_card_open,0,0,0,0,[]},{camp_series_recharge,1,0,0,[],0,0,0,0},{camp_wish_flower,1,1,0,0,0},{camp_doll,3,0,1,0,[{camp_doll_data,4,0,1,[]},{camp_doll_data,7,0,1,[]},{camp_doll_data,8,0,1,[]},{camp_doll_data,3,0,1,[]},{camp_doll_data,2,0,1,[]},{camp_doll_data,5,0,1,[]},{camp_doll_data,6,0,1,[]},{camp_doll_data,1,0,1,[]}],0,[],0,0,[]},{camp_sign,{0,0,0},0,0},{camp_exchange,0,0,[],0},{m_animal_chess,1,0,0},{camp_new_flop,1,0,0,[],0},25,{camp_consume_rebate,1,[]},{m_black_white_chess,1,0,0,1},{m_camp_scratch_card,0,[],[]},{camp_new_acc_charge,1,0,[]},{camp_charge_seven_gift,1,0,0,[]},{camp_lucky_tree,0,0,[],[]},{camp_long_active,1,0,0,[],[],0,0},{camp_gift_custom,1,0,[],[],0}},{m_shipping,1,0},{m_checkin,3,[{{2021,5,1},1,0}],{checkin_everyday,3,0,{0,0,0},0,[{{2021,5,1},0}],0,0,0,[],0},[]},{m_tower,[],[]},{m_classes_challenge,2,0,0,[],[],0,0,[],0,[]},{m_fairyland,0,[],[],0,0,[],0,[]},{m_glory,2,0,0,0,0,0,0,0,0,1619873287,0,[],0,0},{m_examination,1,0,0,0,0,0,[],[],0,0,0,[],[]},{m_adm,0},{m_alchemy,0,[{alchemy_shop,1,1,2,[],1},{alchemy_shop,1,2,2,[],1},{alchemy_shop,1,3,2,[],1},{alchemy_shop,1,4,2,[],1}]},{m_pet_store,1,1,[],4},{m_store,0,[]},{m_achievement,3,0,[],[{quest,540223,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[day_num],0,{evt_friend_circle,105},3,0,[],[],[]}],0,0,0,0},{quest,540220,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_commented,1,[],0,{evt_friend_circle_commented,104},10,0,[],[],[]}],0,0,0,0},{quest,540217,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_comment,0,[],0,{evt_friend_circle_comment,103},10,0,[],[],[]}],0,0,0,0},{quest,540214,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_liked,1,[],0,{evt_friend_circle_liked,102},10,0,[],[],[]}],0,0,0,0},{quest,540211,[],1,1,0,0,[{quest_progress,0,evt_friend_circle_like,0,[],0,{evt_friend_circle_like,101},10,0,[],[],[]}],0,0,0,0},{quest,540207,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[mentions_acc],0,{evt_friend_circle,100},20,0,[],[],[]}],0,0,0,0},{quest,540203,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[photos_acc],0,{evt_friend_circle,99},10,0,[],[],[]}],0,0,0,0},{quest,540200,[],1,1,0,0,[{quest_progress,0,evt_friend_circle,0,[],0,{evt_friend_circle,98},1,0,[],[],[]}],0,0,0,0}],[],0,[]},{m_wedding,1,{0,[],0},[],0,[],[],[]},{m_constellation,2,0,[],[]},{m_investment,2,0,[],2,0,[]},{m_privilege,2,0,[],[],[]},{m_limit_return,1,0,1619873287,0,0,0,0,0,[],0,0,0},{m_pray,0,1,0,0,[1,0],[],0,0},{m_teacher,{0,[],0},2,[],0,[],0,0,[],[],[],[],[],0,0,[],0},{m_help,1,1,[],[],[],[]},{m_achieve_shop,5,[],0,401,301,0,[],0,0,0},{m_brave_trial,2,0,[],[],0,0,[],0,[]},{m_camp_dragon_boat,0,0,0,[],0,0,0,[]},{m_over_seas,0},{m_hook_setting,2,0,[]},{m_tournament,3,[],0,[],0,0,0,[],0},{m_market_gold,1,[]},{m_goal,2,[],[],[],0,0,[],[]},{m_family,1,{0,[],0},undefined,{0,[],0},{family_store,1,0,[]},[],[]},{m_charge_gift,1,0,1619873287,0,0,0,0,0,[],0,0,0,[]},{m_mount,10,[],{mount_goal,1,[],[],[]},1,0,[],[],[],[],0,[],{1,[],0},0},{m_camp_web,4,[],[],[],0,[],[],{0,0,0,[]}},{m_handbook,4,[],[],0,[],0,[],[]},{m_endless_challenge,3,0,[],[],0,[],0,0,0},{m_lev_break,0,0,0,0,0},{m_head,2,0,0,0,[],0,0,0,[]},{m_extension,3,0,[],0,[],{0,[],0},[],[],0,0},{m_camp_cake,0,0,0,0,0,0,0,[],0,[]},{m_rainbow_lottery,1,[{rainbow_prize,1,1003,29384,1,0,250,15,1,50,0,1},{rainbow_prize,1,2001,29390,1,0,59,30,1,0,0,0},{rainbow_prize,1,3002,23550,1,0,40,40,0,0,0,1},{rainbow_prize,1,3009,21431,1,0,40,40,0,0,0,1},{rainbow_prize,1,4011,20087,1,0,100,60,0,0,0,1},{rainbow_prize,1,4010,20039,1,0,100,60,0,0,0,1},{rainbow_prize,1,5001,20000,1,0,77,260,0,0,0,0},{rainbow_prize,1,5015,20021,1,0,77,260,0,0,0,0},{rainbow_prize,1,5006,23555,1,0,77,260,0,0,0,0},{rainbow_prize,1,5010,20655,1,0,27,260,0,0,0,0},{rainbow_prize,1,6010,20060,1,0,41,200,0,0,0,0},{rainbow_prize,1,6008,20020,1,0,42,200,0,0,0,0},{rainbow_prize,1,6018,20004,1,0,42,200,0,0,0,0},{rainbow_prize,1,6003,20052,1,0,42,200,0,0,0,0},{rainbow_prize,1,6002,20020,1,0,42,200,0,0,0,0},{rainbow_prize,1,6017,20005,1,0,42,200,0,0,0,0}],0,[]},{m_sworn,0,{0,[],0},0,[],[],0},{m_gods_duel,2,{0,[],0},0},{m_preparation,0,undefined,0,0},{m_reward_back,3,1,[],1619873287,1619873287,40,1},{m_child,1,[],0,0,[]},{m_maze,4,0,10135,0,[{3,3},{3,4},{1,5},{2,1},{4,2}],[{maze_open,{1,1},1,1,1,0,3,2,0,0,0,0,[],0},{maze_open,{5,5},1,5,5,0,3,1,0,0,0,0,[],0}],[{{0,0},133,1,21861,1,3},{{0,0},3,1,20004,1,1},{{0,0},166,2,10,1,2},{{0,0},19,1,20045,1,1},{{0,0},133,1,21861,1,4},{{0,0},66,1,21852,1,1},{{0,0},60,1,20529,1,1},{{0,0},36,1,21420,1,1},{{0,0},24,1,20087,1,2},{{0,0},5,1,20025,1,1},{{0,0},148,2,1,1,1},{{0,0},13,1,20088,1,1},{{0,0},56,1,20525,1,1},{{5,4},185,1,21961,1,1},{{5,3},7,1,20020,1,1},{{5,2},49,1,21850,1,1},{{5,1},48,1,23524,1,1},{{4,5},148,2,1,1,1},{{4,4},1,1,20052,1,1},{{4,3},62,1,23526,1,1},{{4,1},7,1,20020,1,1},{{3,5},163,2,6,1,5},{{3,2},24,1,20087,1,2},{{3,1},51,1,90000,9100,1},{{2,5},40,1,20521,1,1},{{2,4},64,1,23528,1,1},{{2,3},81,1,90000,9250,1},{{2,2},39,1,20520,1,1},{{1,4},50,1,21851,1,1},{{1,3},1,1,20052,1,1},{{1,2},11,1,20008,1,1}],0,[],0,[],[],[],[]},{m_raffle,0,[]},{m_rencounter,1},{m_talisman,5,1,1,[],[],[],0,0,[],0,[],0,48},{m_month_gift,[]},{m_pay_turn,0,[]},{m_camp_box,0,[],[],[],0,0,0},{m_camp_pay_continus,0,0,[],0},{m_spirit_treasure,1,0,0,0,[],0,[]},{m_camp_discount,0,0,[],[],0,0},{m_camp_7_7th,{0,[],0},[],0,0,0,0,0,1,1619873287},{m_new_expression,[],[]},{m_exquisite_shelf,2,0,0,undefined,0,[],0,0},{m_camp_recharge,[]},{m_camp_recharge_gift,[]},{camp_collection,0,[],[],0,0},{m_camp_cut_price,0,[],[],undefined,[],[]},{m_camp_inquiry,1,[]},{m_gods_place,3,0,0,0,0,0,0,1,1,0,0,0},{m_camp_slot_machine,1,0,[],0,[]},{m_camp_sign_draw,1,0,0,0,0,[],[]},{m_agenda_week,1,1,0,[],0},{m_exp_bottle,1,0,0,0,0},{m_camp_zillionaire,1,0,0,0,0,0,0,[],[]},{m_provocation,3,0,0,0,[],0,1,0,0,[],[],[],0,0},{m_oracle_treasure,2,0,0,0,[],0,[],0,0},{m_camp_pass_flower_language,1,0,[{7,0},{6,0},{5,0},{4,0},{3,0},{2,0},{1,0}],0},{m_camp_score_exchange,1,0,0,0,0,[],[]},{m_camp_pray,2,0,0,[],0,[]},{package,1,3,75,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75],[]},{package,2,1,25,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],[]},{package,3,1,20,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],[{item,0,5,10322,0,0,10,3,2,0,0,0,0,0,1,5,0,0,[{attr_base,0,6,12,1,136}],[],20,4,2,[],[]},{item,0,6,10303,1,0,11,3,1,0,0,0,0,0,1,6,0,0,[{attr_base,0,6,12,1,3},{attr_base,0,1,12,1,60}],[],1,4,2,[],[]},{item,0,7,10304,1,0,12,3,1,0,0,0,0,0,1,7,0,0,[{attr_base,0,7,12,1,12},{attr_base,0,2,12,1,239}],[],1,4,2,[],[]},{item,0,8,10306,1,0,14,3,1,0,0,0,0,0,1,8,0,0,[{attr_base,0,6,12,1,6},{attr_base,0,3,12,1,3}],[],1,4,2,[],[]},{item,0,1,10321,0,10301,4,3,3,0,0,0,0,0,1,1,0,0,[{attr_base,0,43,12,1,282},{attr_base,0,5,12,1,107},{attr_base,0,4,12,1,298}],[],20,4,2,[],[]},{item,0,2,10501,1,0,6,3,1,0,0,0,0,0,1,2,0,0,[{attr_base,0,26,12,1,4},{attr_base,0,4,12,1,18}],[],1,0,2,[],[]},{item,0,3,10502,1,0,7,3,1,0,0,0,0,0,1,3,0,0,[{attr_base,0,7,12,1,8},{attr_base,0,5,12,1,29}],[],1,0,2,[],[]},{item,0,4,10504,1,0,9,3,1,0,0,0,0,0,1,4,0,0,[{attr_base,0,25,12,1,4},{attr_base,0,1,12,1,27}],[],1,0,2,[],[]}]},{package,4,1,0,[],[]}}');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_charge_cfg`
--

DROP TABLE IF EXISTS `role_charge_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_charge_cfg` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `label` varchar(50) NOT NULL COMMENT '充值标签',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家计费点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_charge_cfg`
--

LOCK TABLES `role_charge_cfg` WRITE;
/*!40000 ALTER TABLE `role_charge_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_charge_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_info`
--

DROP TABLE IF EXISTS `role_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_info` (
  `rid` int(11) NOT NULL COMMENT '角色信息',
  `platform` varchar(32) NOT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(22) NOT NULL COMMENT '角色',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `classes` int(11) NOT NULL COMMENT '职业',
  `fc` int(11) NOT NULL COMMENT '战力',
  `lev` int(11) NOT NULL COMMENT '等级',
  `exp` int(11) NOT NULL COMMENT '经验',
  `gold` int(11) NOT NULL COMMENT '钻石',
  `gold_bind` int(11) NOT NULL COMMENT '金币',
  `coin` int(11) NOT NULL COMMENT '银币',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备号',
  `device_type` int(4) NOT NULL DEFAULT 1 COMMENT '设备类型 1:安卓 2:ios 3:windows',
  `device_key` varchar(40) NOT NULL DEFAULT '' COMMENT '设备串号',
  `break_times` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级突破次数',
  PRIMARY KEY (`rid`,`platform`,`zone_id`),
  KEY `channel_reg` (`channel_reg`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色详细数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_info`
--

LOCK TABLES `role_info` WRITE;
/*!40000 ALTER TABLE `role_info` DISABLE KEYS */;
INSERT INTO `role_info` VALUES (1,'dev',2,'2017682741_0',0,'5470','亲测源码网',0,4,614,5,798,0,0,110614,0,'120.11.121.114',1619873287,'120.11.121.114',1619873287,1619873814,0,'845f4276f722b54860398f5c95e58c49',1,'865166028895061',0);
/*!40000 ALTER TABLE `role_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title`
--

DROP TABLE IF EXISTS `strategy_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `gm` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1-官方发布;0-玩家发布',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title`
--

LOCK TABLES `strategy_title` WRITE;
/*!40000 ALTER TABLE `strategy_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title_local`
--

DROP TABLE IF EXISTS `strategy_title_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title_local` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `state` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-申请状态;1-审核通过;2-审核不通过',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统本地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title_local`
--

LOCK TABLES `strategy_title_local` WRITE;
/*!40000 ALTER TABLE `strategy_title_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_board`
--

DROP TABLE IF EXISTS `sys_notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `title` text DEFAULT NULL COMMENT '通知标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  `gain` text DEFAULT NULL COMMENT '奖励',
  `cond` text DEFAULT NULL COMMENT '领取条件',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='通知公告板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_board`
--

LOCK TABLES `sys_notice_board` WRITE;
/*!40000 ALTER TABLE `sys_notice_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_scroll`
--

DROP TABLE IF EXISTS `sys_notice_scroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_scroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `interval_time` int(10) unsigned NOT NULL COMMENT '间隔时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='滚动广播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_scroll`
--

LOCK TABLES `sys_notice_scroll` WRITE;
/*!40000 ALTER TABLE `sys_notice_scroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_scroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:禁言 2:封号 3:无效',
  `ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号/禁言时间',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `type_1` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报1-类型,1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_1` text DEFAULT NULL COMMENT '原因1',
  `msg_1` text DEFAULT NULL COMMENT '证据1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `type_2` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报2-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_2` text DEFAULT NULL COMMENT '原因2',
  `msg_2` text DEFAULT NULL COMMENT '证据2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报3-时间戳',
  `type_3` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报3-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_3` text DEFAULT NULL COMMENT '原因3',
  `msg_3` text DEFAULT NULL COMMENT '证据3',
  `id_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色4-id',
  `platform_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-平台标识',
  `zone_id_4` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色4-区号',
  `name_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-名字',
  `lev_4` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色4-等级',
  `time_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报4-时间戳',
  `type_4` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报4-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_4` text DEFAULT NULL COMMENT '原因4',
  `msg_4` text DEFAULT NULL COMMENT '证据4',
  `id_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色5-id',
  `platform_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-平台标识',
  `zone_id_5` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色5-区号',
  `name_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-名字',
  `lev_5` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色5-等级',
  `time_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报5-时间戳',
  `type_5` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报5-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_5` text DEFAULT NULL COMMENT '原因5',
  `msg_5` text DEFAULT NULL COMMENT '证据5',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_white_list`
--

DROP TABLE IF EXISTS `sys_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_white_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `name` varchar(20) NOT NULL COMMENT '使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='白名单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_white_list`
--

LOCK TABLES `sys_white_list` WRITE;
/*!40000 ALTER TABLE `sys_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fswy_dev_2'
--

--
-- Dumping routines for database 'fswy_dev_2'
--

--
-- Current Database: `fswy_dev_9000`
--

/*!40000 DROP DATABASE IF EXISTS `fswy_dev_9000`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fswy_dev_9000` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `fswy_dev_9000`;

--
-- Table structure for table `auth_sfz_cfg`
--

DROP TABLE IF EXISTS `auth_sfz_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sfz_cfg` (
  `platform` varchar(30) NOT NULL COMMENT 'ID编号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道编号',
  `can_charge` tinyint(4) NOT NULL COMMENT '未认证是否能充值(0:否 1:是)',
  `is_nonage` tinyint(4) NOT NULL COMMENT '未成年是否限制充值(0:否 1:是)',
  `charge_limit` int(11) NOT NULL COMMENT '未成年充值额度',
  `is_wallow` tinyint(4) NOT NULL COMMENT '是否开启防沉迷(0:否 1:是)',
  `down_sec` int(11) NOT NULL COMMENT '沉迷时间(秒)',
  `is_show_phone` tinyint(4) NOT NULL COMMENT '是否显示未到账联系方式(0:否 1:是)',
  `is_mail` tinyint(4) NOT NULL COMMENT '充值发送邮件(0:否 1:是)',
  `show_info` varchar(50) NOT NULL COMMENT '联系信息(0:否 1:是)',
  `is_mid_exp` tinyint(4) NOT NULL COMMENT '是否收益减半(0:否 1:是)',
  `is_lev_60` tinyint(4) NOT NULL COMMENT '只针对60级以下(0:否 1:是)',
  `is_need_check` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否开启标签页',
  PRIMARY KEY (`platform`,`channel_reg`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='防沉迷设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sfz_cfg`
--

LOCK TABLES `auth_sfz_cfg` WRITE;
/*!40000 ALTER TABLE `auth_sfz_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sfz_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web`
--

DROP TABLE IF EXISTS `camp_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_id` int(11) NOT NULL COMMENT '活动ID',
  `camp_id` int(11) NOT NULL COMMENT '活动条件ID',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `sec_type` int(11) NOT NULL COMMENT '具体类型',
  `settlement` int(4) NOT NULL COMMENT '结算类型',
  `reward_mod` int(4) NOT NULL COMMENT '奖励模式',
  `reward_num` int(11) NOT NULL COMMENT '最大奖励次数',
  `star` int(11) NOT NULL DEFAULT 2 COMMENT '星级',
  `mail_title` varchar(64) NOT NULL DEFAULT '' COMMENT '信件标题',
  `mail_content` text NOT NULL COMMENT '信件内容',
  `sort_val` int(11) NOT NULL DEFAULT 5 COMMENT '显示排序字段',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(128) NOT NULL DEFAULT '' COMMENT '标题2',
  `title_ico` varchar(64) NOT NULL COMMENT '标题图片',
  `ico` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `type_ico` varchar(32) NOT NULL DEFAULT '' COMMENT '类型图标',
  `total_ico` int(11) NOT NULL DEFAULT 0 COMMENT '独立总图标',
  `top_banner` varchar(64) NOT NULL DEFAULT '' COMMENT '顶部横幅',
  `rule_str` varchar(1024) NOT NULL DEFAULT '' COMMENT '规则描述',
  `time_str` varchar(128) NOT NULL DEFAULT '' COMMENT '时间描述',
  `bottom_alert` varchar(1024) NOT NULL DEFAULT '' COMMENT '底部描述',
  `reward_title` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励表头',
  `panel_type` varchar(128) NOT NULL DEFAULT '' COMMENT '面板类型',
  `reward` varchar(2048) NOT NULL DEFAULT '' COMMENT '子活动奖励',
  `cli_reward` varchar(1024) NOT NULL DEFAULT '' COMMENT '客户端奖励',
  `notice_msg` varchar(512) NOT NULL DEFAULT '' COMMENT '传闻公告',
  `button_text` varchar(48) NOT NULL DEFAULT '' COMMENT '按钮内容',
  `is_button` int(4) NOT NULL DEFAULT 1 COMMENT '是否按钮',
  `web_id` int(11) NOT NULL COMMENT '活动类型编号web端用',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `tran_info` varchar(512) NOT NULL DEFAULT '' COMMENT '跳转内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `camp_id` (`camp_id`),
  KEY `total_id` (`total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台子活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web`
--

LOCK TABLES `camp_web` WRITE;
/*!40000 ALTER TABLE `camp_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web_ico`
--

DROP TABLE IF EXISTS `camp_web_ico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web_ico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `total_id` int(11) NOT NULL COMMENT '总活动ID_唯一值',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '总活动名称',
  `title` varchar(128) DEFAULT '' COMMENT '总活动标题',
  `ico` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动图标',
  `alert` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动提示',
  `gif` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动动画',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `status` int(11) NOT NULL COMMENT '活动状态[1:等待审核 2:审核已发送 3:拒绝]',
  `open_day` int(11) NOT NULL DEFAULT 0 COMMENT '开服多少天后起作用',
  `merge_day` int(11) NOT NULL DEFAULT 0 COMMENT '合服多少天后起作用',
  `login_open` int(4) NOT NULL DEFAULT 0 COMMENT '是否登录打开界面',
  `is_show_time` int(4) NOT NULL DEFAULT 0 COMMENT '是否显示倒计时',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `total_id` (`total_id`),
  KEY `name` (`name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台总活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web_ico`
--

LOCK TABLES `camp_web_ico` WRITE;
/*!40000 ALTER TABLE `camp_web_ico` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web_ico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(120) NOT NULL COMMENT '订单号',
  `type` tinyint(3) unsigned NOT NULL COMMENT '充值类型(0:银行卡, 1:手机充值)',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未收取，1:已收取)',
  `gold` int(11) NOT NULL COMMENT '钻石数',
  `charge_type` int(11) NOT NULL DEFAULT 0 COMMENT '充值类型(0 普通充值 1 礼品充值)',
  `money` decimal(10,2) NOT NULL COMMENT '金额数',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` char(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(60) NOT NULL COMMENT '角色名称',
  `classes` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `lev` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `is_test` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否是测试充值',
  `ts` int(11) unsigned NOT NULL COMMENT '订单插入时间',
  `time_deal` int(11) NOT NULL DEFAULT 0 COMMENT '处理时间',
  `rmb` int(11) NOT NULL DEFAULT 0 COMMENT '充值余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `rid` (`rid`,`name`),
  KEY `account` (`account`),
  KEY `acc_search_idx` (`account`,`platform`,`zone_id`,`status`),
  KEY `rid_search_idx` (`rid`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('unreply','replied') NOT NULL DEFAULT 'unreply' COMMENT '回复状态',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `charge` int(11) NOT NULL COMMENT '累计充值钻石数',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(40) NOT NULL COMMENT '联系方式',
  `post_time` int(10) unsigned NOT NULL COMMENT '留言日期（unix_time）',
  `feedback_ip` char(16) DEFAULT NULL COMMENT '反馈ip',
  `gm_name` varchar(20) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `reply_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`,`rid`),
  KEY `date` (`post_time`,`reply_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_circle_report`
--

DROP TABLE IF EXISTS `friend_circle_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_circle_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned NOT NULL DEFAULT 0 COMMENT '0:动态 1:评论 2:图片',
  `spec_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`report_type`,`spec_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='朋友圈举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_circle_report`
--

LOCK TABLES `friend_circle_report` WRITE;
/*!40000 ALTER TABLE `friend_circle_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_circle_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_moment_wish`
--

DROP TABLE IF EXISTS `friend_moment_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_moment_wish` (
  `id` int(11) unsigned NOT NULL COMMENT '寄语动态id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '动态区号',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '角色平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '角色等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `camp_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
  `theme` varchar(20) NOT NULL COMMENT '活动主题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_photo` tinyint(4) NOT NULL DEFAULT 0 COMMENT '活动主题',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:审核通过 2:不通过',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='庆典寄语表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_moment_wish`
--

LOCK TABLES `friend_moment_wish` WRITE;
/*!40000 ALTER TABLE `friend_moment_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_moment_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodvoice_report`
--

DROP TABLE IF EXISTS `goodvoice_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodvoice_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除录音 2:无效, 3除名',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `filename_1` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_2` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_3` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名3',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='好声音举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodvoice_report`
--

LOCK TABLES `goodvoice_report` WRITE;
/*!40000 ALTER TABLE `goodvoice_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodvoice_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_role`
--

DROP TABLE IF EXISTS `lock_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_role` (
  `id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `lock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间型封号, 2永久封号',
  `lock_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号时间',
  `lock_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '封号过期时间',
  `lock_info` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `silent_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间禁言, 2永久禁言',
  `silent_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '禁言时间',
  `silent_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '禁言过期时间',
  `silent_hide` tinyint(1) DEFAULT 0 COMMENT '是否通知被禁言人,1:不通知,2:通知',
  `silent_info` varchar(200) NOT NULL DEFAULT '' COMMENT '禁言原因',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色封号禁言列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_role`
--

LOCK TABLES `lock_role` WRITE;
/*!40000 ALTER TABLE `lock_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_online`
--

DROP TABLE IF EXISTS `log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道id',
  `ts` int(11) NOT NULL DEFAULT 0 COMMENT '统计时间',
  `role_num` int(10) NOT NULL COMMENT '在线人数',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `channel_reg` (`channel_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='实时在线人数统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_online`
--

LOCK TABLES `log_online` WRITE;
/*!40000 ALTER TABLE `log_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card`
--

DROP TABLE IF EXISTS `media_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card` (
  `card_num` varchar(48) NOT NULL COMMENT '卡号',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型编号',
  `batch_num` int(11) NOT NULL DEFAULT 1 COMMENT '批次',
  `rid` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `get_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ctime` int(11) NOT NULL COMMENT '新建时间',
  PRIMARY KEY (`card_num`),
  KEY `role_index` (`type`,`rid`,`platform`,`zone_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card`
--

LOCK TABLES `media_card` WRITE;
/*!40000 ALTER TABLE `media_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card_type`
--

DROP TABLE IF EXISTS `media_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card_type` (
  `id` int(11) NOT NULL COMMENT 'ID编号',
  `name` varchar(22) NOT NULL COMMENT '名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `lev` int(8) NOT NULL COMMENT '等级',
  `num` int(10) NOT NULL COMMENT '次数限制',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:失效 1:启动)',
  `items` varchar(1024) NOT NULL COMMENT '物品奖励({Id,Bind,Num})',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card_type`
--

LOCK TABLES `media_card_type` WRITE;
/*!40000 ALTER TABLE `media_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_mirrors`
--

DROP TABLE IF EXISTS `oms_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `auto_connect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启动后自动连接中央服',
  `nodename` varchar(255) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` varchar(10) NOT NULL DEFAULT 'zone' COMMENT '节点类型，zone:普通游戏区 center:中央服 world:世界主服务器 world_slave:世界从服务器',
  `cookie` varchar(255) NOT NULL DEFAULT '' COMMENT 'erlang节点使用的magic cookie',
  `ver` varchar(30) NOT NULL DEFAULT '' COMMENT '当前版本(此版本号用于标识当前版本，由安装工具自动填写)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`platform`,`zone_id`),
  UNIQUE KEY `nodename` (`nodename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='节点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_mirrors`
--

LOCK TABLES `oms_mirrors` WRITE;
/*!40000 ALTER TABLE `oms_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_log`
--

DROP TABLE IF EXISTS `review_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_log` (
  `id` int(11) unsigned NOT NULL COMMENT '评论id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `log_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '宠物或守护id',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 1 COMMENT '1增加，2删除',
  `base_name` varchar(20) NOT NULL DEFAULT '' COMMENT '宠物或守护名',
  `pro` varchar(20) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`),
  KEY `log_type` (`log_type`,`base_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_log`
--

LOCK TABLES `review_log` WRITE;
/*!40000 ALTER TABLE `review_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_report`
--

DROP TABLE IF EXISTS `review_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_report`
--

LOCK TABLES `review_report` WRITE;
/*!40000 ALTER TABLE `review_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `ver` int(11) NOT NULL COMMENT '版本号',
  `data` mediumblob NOT NULL COMMENT '序列化后的角色数据',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  UNIQUE KEY `name` (`name`,`platform`,`zone_id`),
  UNIQUE KEY `acc` (`account`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_charge_cfg`
--

DROP TABLE IF EXISTS `role_charge_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_charge_cfg` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `label` varchar(50) NOT NULL COMMENT '充值标签',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家计费点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_charge_cfg`
--

LOCK TABLES `role_charge_cfg` WRITE;
/*!40000 ALTER TABLE `role_charge_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_charge_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_info`
--

DROP TABLE IF EXISTS `role_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_info` (
  `rid` int(11) NOT NULL COMMENT '角色信息',
  `platform` varchar(32) NOT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(22) NOT NULL COMMENT '角色',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `classes` int(11) NOT NULL COMMENT '职业',
  `fc` int(11) NOT NULL COMMENT '战力',
  `lev` int(11) NOT NULL COMMENT '等级',
  `exp` int(11) NOT NULL COMMENT '经验',
  `gold` int(11) NOT NULL COMMENT '钻石',
  `gold_bind` int(11) NOT NULL COMMENT '金币',
  `coin` int(11) NOT NULL COMMENT '银币',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备号',
  `device_type` int(4) NOT NULL DEFAULT 1 COMMENT '设备类型 1:安卓 2:ios 3:windows',
  `device_key` varchar(40) NOT NULL DEFAULT '' COMMENT '设备串号',
  `break_times` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级突破次数',
  PRIMARY KEY (`rid`,`platform`,`zone_id`),
  KEY `channel_reg` (`channel_reg`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色详细数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_info`
--

LOCK TABLES `role_info` WRITE;
/*!40000 ALTER TABLE `role_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title`
--

DROP TABLE IF EXISTS `strategy_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `gm` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1-官方发布;0-玩家发布',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title`
--

LOCK TABLES `strategy_title` WRITE;
/*!40000 ALTER TABLE `strategy_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title_local`
--

DROP TABLE IF EXISTS `strategy_title_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title_local` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `state` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-申请状态;1-审核通过;2-审核不通过',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统本地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title_local`
--

LOCK TABLES `strategy_title_local` WRITE;
/*!40000 ALTER TABLE `strategy_title_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_board`
--

DROP TABLE IF EXISTS `sys_notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `title` text DEFAULT NULL COMMENT '通知标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  `gain` text DEFAULT NULL COMMENT '奖励',
  `cond` text DEFAULT NULL COMMENT '领取条件',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='通知公告板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_board`
--

LOCK TABLES `sys_notice_board` WRITE;
/*!40000 ALTER TABLE `sys_notice_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_scroll`
--

DROP TABLE IF EXISTS `sys_notice_scroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_scroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `interval_time` int(10) unsigned NOT NULL COMMENT '间隔时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='滚动广播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_scroll`
--

LOCK TABLES `sys_notice_scroll` WRITE;
/*!40000 ALTER TABLE `sys_notice_scroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_scroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:禁言 2:封号 3:无效',
  `ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号/禁言时间',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `type_1` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报1-类型,1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_1` text DEFAULT NULL COMMENT '原因1',
  `msg_1` text DEFAULT NULL COMMENT '证据1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `type_2` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报2-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_2` text DEFAULT NULL COMMENT '原因2',
  `msg_2` text DEFAULT NULL COMMENT '证据2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报3-时间戳',
  `type_3` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报3-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_3` text DEFAULT NULL COMMENT '原因3',
  `msg_3` text DEFAULT NULL COMMENT '证据3',
  `id_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色4-id',
  `platform_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-平台标识',
  `zone_id_4` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色4-区号',
  `name_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-名字',
  `lev_4` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色4-等级',
  `time_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报4-时间戳',
  `type_4` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报4-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_4` text DEFAULT NULL COMMENT '原因4',
  `msg_4` text DEFAULT NULL COMMENT '证据4',
  `id_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色5-id',
  `platform_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-平台标识',
  `zone_id_5` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色5-区号',
  `name_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-名字',
  `lev_5` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色5-等级',
  `time_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报5-时间戳',
  `type_5` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报5-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_5` text DEFAULT NULL COMMENT '原因5',
  `msg_5` text DEFAULT NULL COMMENT '证据5',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_white_list`
--

DROP TABLE IF EXISTS `sys_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_white_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `name` varchar(20) NOT NULL COMMENT '使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='白名单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_white_list`
--

LOCK TABLES `sys_white_list` WRITE;
/*!40000 ALTER TABLE `sys_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fswy_dev_9000'
--

--
-- Dumping routines for database 'fswy_dev_9000'
--

--
-- Current Database: `fswy_dev_9999`
--

/*!40000 DROP DATABASE IF EXISTS `fswy_dev_9999`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fswy_dev_9999` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `fswy_dev_9999`;

--
-- Table structure for table `auth_sfz_cfg`
--

DROP TABLE IF EXISTS `auth_sfz_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sfz_cfg` (
  `platform` varchar(30) NOT NULL COMMENT 'ID编号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道编号',
  `can_charge` tinyint(4) NOT NULL COMMENT '未认证是否能充值(0:否 1:是)',
  `is_nonage` tinyint(4) NOT NULL COMMENT '未成年是否限制充值(0:否 1:是)',
  `charge_limit` int(11) NOT NULL COMMENT '未成年充值额度',
  `is_wallow` tinyint(4) NOT NULL COMMENT '是否开启防沉迷(0:否 1:是)',
  `down_sec` int(11) NOT NULL COMMENT '沉迷时间(秒)',
  `is_show_phone` tinyint(4) NOT NULL COMMENT '是否显示未到账联系方式(0:否 1:是)',
  `is_mail` tinyint(4) NOT NULL COMMENT '充值发送邮件(0:否 1:是)',
  `show_info` varchar(50) NOT NULL COMMENT '联系信息(0:否 1:是)',
  `is_mid_exp` tinyint(4) NOT NULL COMMENT '是否收益减半(0:否 1:是)',
  `is_lev_60` tinyint(4) NOT NULL COMMENT '只针对60级以下(0:否 1:是)',
  `is_need_check` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否开启标签页',
  PRIMARY KEY (`platform`,`channel_reg`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='防沉迷设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sfz_cfg`
--

LOCK TABLES `auth_sfz_cfg` WRITE;
/*!40000 ALTER TABLE `auth_sfz_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sfz_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web`
--

DROP TABLE IF EXISTS `camp_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_id` int(11) NOT NULL COMMENT '活动ID',
  `camp_id` int(11) NOT NULL COMMENT '活动条件ID',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `sec_type` int(11) NOT NULL COMMENT '具体类型',
  `settlement` int(4) NOT NULL COMMENT '结算类型',
  `reward_mod` int(4) NOT NULL COMMENT '奖励模式',
  `reward_num` int(11) NOT NULL COMMENT '最大奖励次数',
  `star` int(11) NOT NULL DEFAULT 2 COMMENT '星级',
  `mail_title` varchar(64) NOT NULL DEFAULT '' COMMENT '信件标题',
  `mail_content` text NOT NULL COMMENT '信件内容',
  `sort_val` int(11) NOT NULL DEFAULT 5 COMMENT '显示排序字段',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(128) NOT NULL DEFAULT '' COMMENT '标题2',
  `title_ico` varchar(64) NOT NULL COMMENT '标题图片',
  `ico` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `type_ico` varchar(32) NOT NULL DEFAULT '' COMMENT '类型图标',
  `total_ico` int(11) NOT NULL DEFAULT 0 COMMENT '独立总图标',
  `top_banner` varchar(64) NOT NULL DEFAULT '' COMMENT '顶部横幅',
  `rule_str` varchar(1024) NOT NULL DEFAULT '' COMMENT '规则描述',
  `time_str` varchar(128) NOT NULL DEFAULT '' COMMENT '时间描述',
  `bottom_alert` varchar(1024) NOT NULL DEFAULT '' COMMENT '底部描述',
  `reward_title` varchar(128) NOT NULL DEFAULT '' COMMENT '奖励表头',
  `panel_type` varchar(128) NOT NULL DEFAULT '' COMMENT '面板类型',
  `reward` varchar(2048) NOT NULL DEFAULT '' COMMENT '子活动奖励',
  `cli_reward` varchar(1024) NOT NULL DEFAULT '' COMMENT '客户端奖励',
  `notice_msg` varchar(512) NOT NULL DEFAULT '' COMMENT '传闻公告',
  `button_text` varchar(48) NOT NULL DEFAULT '' COMMENT '按钮内容',
  `is_button` int(4) NOT NULL DEFAULT 1 COMMENT '是否按钮',
  `web_id` int(11) NOT NULL COMMENT '活动类型编号web端用',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `tran_info` varchar(512) NOT NULL DEFAULT '' COMMENT '跳转内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `camp_id` (`camp_id`),
  KEY `total_id` (`total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台子活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web`
--

LOCK TABLES `camp_web` WRITE;
/*!40000 ALTER TABLE `camp_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_web_ico`
--

DROP TABLE IF EXISTS `camp_web_ico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_web_ico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `total_id` int(11) NOT NULL COMMENT '总活动ID_唯一值',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '总活动名称',
  `title` varchar(128) DEFAULT '' COMMENT '总活动标题',
  `ico` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动图标',
  `alert` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动提示',
  `gif` varchar(256) NOT NULL DEFAULT '' COMMENT '总活动动画',
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `status` int(11) NOT NULL COMMENT '活动状态[1:等待审核 2:审核已发送 3:拒绝]',
  `open_day` int(11) NOT NULL DEFAULT 0 COMMENT '开服多少天后起作用',
  `merge_day` int(11) NOT NULL DEFAULT 0 COMMENT '合服多少天后起作用',
  `login_open` int(4) NOT NULL DEFAULT 0 COMMENT '是否登录打开界面',
  `is_show_time` int(4) NOT NULL DEFAULT 0 COMMENT '是否显示倒计时',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `total_id` (`total_id`),
  KEY `name` (`name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='后台总活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_web_ico`
--

LOCK TABLES `camp_web_ico` WRITE;
/*!40000 ALTER TABLE `camp_web_ico` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_web_ico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(120) NOT NULL COMMENT '订单号',
  `type` tinyint(3) unsigned NOT NULL COMMENT '充值类型(0:银行卡, 1:手机充值)',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未收取，1:已收取)',
  `gold` int(11) NOT NULL COMMENT '钻石数',
  `charge_type` int(11) NOT NULL DEFAULT 0 COMMENT '充值类型(0 普通充值 1 礼品充值)',
  `money` decimal(10,2) NOT NULL COMMENT '金额数',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` char(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(60) NOT NULL COMMENT '角色名称',
  `classes` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `lev` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `is_test` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否是测试充值',
  `ts` int(11) unsigned NOT NULL COMMENT '订单插入时间',
  `time_deal` int(11) NOT NULL DEFAULT 0 COMMENT '处理时间',
  `rmb` int(11) NOT NULL DEFAULT 0 COMMENT '充值余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `rid` (`rid`,`name`),
  KEY `account` (`account`),
  KEY `acc_search_idx` (`account`,`platform`,`zone_id`,`status`),
  KEY `rid_search_idx` (`rid`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('unreply','replied') NOT NULL DEFAULT 'unreply' COMMENT '回复状态',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `charge` int(11) NOT NULL COMMENT '累计充值钻石数',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(40) NOT NULL COMMENT '联系方式',
  `post_time` int(10) unsigned NOT NULL COMMENT '留言日期（unix_time）',
  `feedback_ip` char(16) DEFAULT NULL COMMENT '反馈ip',
  `gm_name` varchar(20) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `reply_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`,`rid`),
  KEY `date` (`post_time`,`reply_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_circle_report`
--

DROP TABLE IF EXISTS `friend_circle_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_circle_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned NOT NULL DEFAULT 0 COMMENT '0:动态 1:评论 2:图片',
  `spec_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`report_type`,`spec_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='朋友圈举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_circle_report`
--

LOCK TABLES `friend_circle_report` WRITE;
/*!40000 ALTER TABLE `friend_circle_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_circle_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_moment_wish`
--

DROP TABLE IF EXISTS `friend_moment_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_moment_wish` (
  `id` int(11) unsigned NOT NULL COMMENT '寄语动态id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '动态区号',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '角色平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '角色等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `camp_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动ID',
  `theme` varchar(20) NOT NULL COMMENT '活动主题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_photo` tinyint(4) NOT NULL DEFAULT 0 COMMENT '活动主题',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:审核通过 2:不通过',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='庆典寄语表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_moment_wish`
--

LOCK TABLES `friend_moment_wish` WRITE;
/*!40000 ALTER TABLE `friend_moment_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_moment_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodvoice_report`
--

DROP TABLE IF EXISTS `goodvoice_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodvoice_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除录音 2:无效, 3除名',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `filename_1` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_2` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `filename_3` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名3',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='好声音举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodvoice_report`
--

LOCK TABLES `goodvoice_report` WRITE;
/*!40000 ALTER TABLE `goodvoice_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodvoice_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_role`
--

DROP TABLE IF EXISTS `lock_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_role` (
  `id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `lock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间型封号, 2永久封号',
  `lock_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号时间',
  `lock_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '封号过期时间',
  `lock_info` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `silent_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0解禁, 1时间禁言, 2永久禁言',
  `silent_ctime` int(10) NOT NULL DEFAULT 0 COMMENT '禁言时间',
  `silent_timeout` int(10) NOT NULL DEFAULT 0 COMMENT '禁言过期时间',
  `silent_hide` tinyint(1) DEFAULT 0 COMMENT '是否通知被禁言人,1:不通知,2:通知',
  `silent_info` varchar(200) NOT NULL DEFAULT '' COMMENT '禁言原因',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色封号禁言列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_role`
--

LOCK TABLES `lock_role` WRITE;
/*!40000 ALTER TABLE `lock_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_online`
--

DROP TABLE IF EXISTS `log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '渠道id',
  `ts` int(11) NOT NULL DEFAULT 0 COMMENT '统计时间',
  `role_num` int(10) NOT NULL COMMENT '在线人数',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `channel_reg` (`channel_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='实时在线人数统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_online`
--

LOCK TABLES `log_online` WRITE;
/*!40000 ALTER TABLE `log_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card`
--

DROP TABLE IF EXISTS `media_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card` (
  `card_num` varchar(48) NOT NULL COMMENT '卡号',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '类型编号',
  `batch_num` int(11) NOT NULL DEFAULT 1 COMMENT '批次',
  `rid` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '平台号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `get_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ctime` int(11) NOT NULL COMMENT '新建时间',
  PRIMARY KEY (`card_num`),
  KEY `role_index` (`type`,`rid`,`platform`,`zone_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card`
--

LOCK TABLES `media_card` WRITE;
/*!40000 ALTER TABLE `media_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_card_type`
--

DROP TABLE IF EXISTS `media_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_card_type` (
  `id` int(11) NOT NULL COMMENT 'ID编号',
  `name` varchar(22) NOT NULL COMMENT '名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `lev` int(8) NOT NULL COMMENT '等级',
  `num` int(10) NOT NULL COMMENT '次数限制',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:失效 1:启动)',
  `items` varchar(1024) NOT NULL COMMENT '物品奖励({Id,Bind,Num})',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='媒体卡类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_card_type`
--

LOCK TABLES `media_card_type` WRITE;
/*!40000 ALTER TABLE `media_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_mirrors`
--

DROP TABLE IF EXISTS `oms_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `auto_connect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启动后自动连接中央服',
  `nodename` varchar(255) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` varchar(10) NOT NULL DEFAULT 'zone' COMMENT '节点类型，zone:普通游戏区 center:中央服 world:世界主服务器 world_slave:世界从服务器',
  `cookie` varchar(255) NOT NULL DEFAULT '' COMMENT 'erlang节点使用的magic cookie',
  `ver` varchar(30) NOT NULL DEFAULT '' COMMENT '当前版本(此版本号用于标识当前版本，由安装工具自动填写)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`platform`,`zone_id`),
  UNIQUE KEY `nodename` (`nodename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='节点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_mirrors`
--

LOCK TABLES `oms_mirrors` WRITE;
/*!40000 ALTER TABLE `oms_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_log`
--

DROP TABLE IF EXISTS `review_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_log` (
  `id` int(11) unsigned NOT NULL COMMENT '评论id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `log_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '宠物或守护id',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 1 COMMENT '1增加，2删除',
  `base_name` varchar(20) NOT NULL DEFAULT '' COMMENT '宠物或守护名',
  `pro` varchar(20) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`),
  KEY `log_type` (`log_type`,`base_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_log`
--

LOCK TABLES `review_log` WRITE;
/*!40000 ALTER TABLE `review_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_report`
--

DROP TABLE IF EXISTS `review_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned DEFAULT 0 COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT 0 COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='评论举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_report`
--

LOCK TABLES `review_report` WRITE;
/*!40000 ALTER TABLE `review_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级',
  `ver` int(11) NOT NULL COMMENT '版本号',
  `data` mediumblob NOT NULL COMMENT '序列化后的角色数据',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  UNIQUE KEY `name` (`name`,`platform`,`zone_id`),
  UNIQUE KEY `acc` (`account`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_charge_cfg`
--

DROP TABLE IF EXISTS `role_charge_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_charge_cfg` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `label` varchar(50) NOT NULL COMMENT '充值标签',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='玩家计费点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_charge_cfg`
--

LOCK TABLES `role_charge_cfg` WRITE;
/*!40000 ALTER TABLE `role_charge_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_charge_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_info`
--

DROP TABLE IF EXISTS `role_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_info` (
  `rid` int(11) NOT NULL COMMENT '角色信息',
  `platform` varchar(32) NOT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `channel_reg` int(11) NOT NULL DEFAULT 0 COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(22) NOT NULL COMMENT '角色',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `classes` int(11) NOT NULL COMMENT '职业',
  `fc` int(11) NOT NULL COMMENT '战力',
  `lev` int(11) NOT NULL COMMENT '等级',
  `exp` int(11) NOT NULL COMMENT '经验',
  `gold` int(11) NOT NULL COMMENT '钻石',
  `gold_bind` int(11) NOT NULL COMMENT '金币',
  `coin` int(11) NOT NULL COMMENT '银币',
  `lock_status` int(8) NOT NULL DEFAULT 0 COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT 0 COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备号',
  `device_type` int(4) NOT NULL DEFAULT 1 COMMENT '设备类型 1:安卓 2:ios 3:windows',
  `device_key` varchar(40) NOT NULL DEFAULT '' COMMENT '设备串号',
  `break_times` tinyint(4) NOT NULL DEFAULT 0 COMMENT '等级突破次数',
  PRIMARY KEY (`rid`,`platform`,`zone_id`),
  KEY `channel_reg` (`channel_reg`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='角色详细数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_info`
--

LOCK TABLES `role_info` WRITE;
/*!40000 ALTER TABLE `role_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title`
--

DROP TABLE IF EXISTS `strategy_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `gm` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1-官方发布;0-玩家发布',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title`
--

LOCK TABLES `strategy_title` WRITE;
/*!40000 ALTER TABLE `strategy_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy_title_local`
--

DROP TABLE IF EXISTS `strategy_title_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy_title_local` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `state` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-申请状态;1-审核通过;2-审核不通过',
  `order_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='攻略系统本地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy_title_local`
--

LOCK TABLES `strategy_title_local` WRITE;
/*!40000 ALTER TABLE `strategy_title_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `strategy_title_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_board`
--

DROP TABLE IF EXISTS `sys_notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `title` text DEFAULT NULL COMMENT '通知标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  `gain` text DEFAULT NULL COMMENT '奖励',
  `cond` text DEFAULT NULL COMMENT '领取条件',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='通知公告板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_board`
--

LOCK TABLES `sys_notice_board` WRITE;
/*!40000 ALTER TABLE `sys_notice_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_scroll`
--

DROP TABLE IF EXISTS `sys_notice_scroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_scroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 1 COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `interval_time` int(10) unsigned NOT NULL COMMENT '间隔时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1已审核，0为审核',
  `msg` text DEFAULT NULL COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='滚动广播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_scroll`
--

LOCK TABLES `sys_notice_scroll` WRITE;
/*!40000 ALTER TABLE `sys_notice_scroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_scroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT 0 COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `classes` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报职业',
  `lev` tinyint(4) NOT NULL DEFAULT 0 COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT 0 COMMENT '0:未处理 1:禁言 2:封号 3:无效',
  `ctime` int(10) NOT NULL DEFAULT 0 COMMENT '封号/禁言时间',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报1-时间戳',
  `type_1` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报1-类型,1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_1` text DEFAULT NULL COMMENT '原因1',
  `msg_1` text DEFAULT NULL COMMENT '证据1',
  `id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报2-时间戳',
  `type_2` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报2-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_2` text DEFAULT NULL COMMENT '原因2',
  `msg_2` text DEFAULT NULL COMMENT '证据2',
  `id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报3-时间戳',
  `type_3` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报3-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_3` text DEFAULT NULL COMMENT '原因3',
  `msg_3` text DEFAULT NULL COMMENT '证据3',
  `id_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色4-id',
  `platform_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-平台标识',
  `zone_id_4` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色4-区号',
  `name_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-名字',
  `lev_4` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色4-等级',
  `time_4` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报4-时间戳',
  `type_4` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报4-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_4` text DEFAULT NULL COMMENT '原因4',
  `msg_4` text DEFAULT NULL COMMENT '证据4',
  `id_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报角色5-id',
  `platform_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-平台标识',
  `zone_id_5` int(11) NOT NULL DEFAULT 0 COMMENT '举报角色5-区号',
  `name_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-名字',
  `lev_5` tinyint(4) NOT NULL DEFAULT 0 COMMENT '举报角色5-等级',
  `time_5` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报5-时间戳',
  `type_5` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '举报5-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_5` text DEFAULT NULL COMMENT '原因5',
  `msg_5` text DEFAULT NULL COMMENT '证据5',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_white_list`
--

DROP TABLE IF EXISTS `sys_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_white_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `name` varchar(20) NOT NULL COMMENT '使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='白名单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_white_list`
--

LOCK TABLES `sys_white_list` WRITE;
/*!40000 ALTER TABLE `sys_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fswy_dev_9999'
--

--
-- Dumping routines for database 'fswy_dev_9999'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28 17:06:20
