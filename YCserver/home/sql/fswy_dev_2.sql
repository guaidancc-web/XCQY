-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: fswy_dev_2
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `auth_sfz_cfg`
--

DROP TABLE IF EXISTS `auth_sfz_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sfz_cfg` (
  `platform` varchar(30) NOT NULL COMMENT 'ID编号',
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '渠道编号',
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
  `is_need_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启标签页',
  PRIMARY KEY (`platform`,`channel_reg`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='防沉迷设置';
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
/*!40101 SET character_set_client = utf8 */;
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
  `star` int(11) NOT NULL DEFAULT '2' COMMENT '星级',
  `mail_title` varchar(64) NOT NULL DEFAULT '' COMMENT '信件标题',
  `mail_content` text NOT NULL COMMENT '信件内容',
  `sort_val` int(11) NOT NULL DEFAULT '5' COMMENT '显示排序字段',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(128) NOT NULL DEFAULT '' COMMENT '标题2',
  `title_ico` varchar(64) NOT NULL COMMENT '标题图片',
  `ico` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `type_ico` varchar(32) NOT NULL DEFAULT '' COMMENT '类型图标',
  `total_ico` int(11) NOT NULL DEFAULT '0' COMMENT '独立总图标',
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
  `is_button` int(4) NOT NULL DEFAULT '1' COMMENT '是否按钮',
  `web_id` int(11) NOT NULL COMMENT '活动类型编号web端用',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `tran_info` varchar(512) NOT NULL DEFAULT '' COMMENT '跳转内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `camp_id` (`camp_id`),
  KEY `total_id` (`total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台子活动规则表';
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
/*!40101 SET character_set_client = utf8 */;
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
  `open_day` int(11) NOT NULL DEFAULT '0' COMMENT '开服多少天后起作用',
  `merge_day` int(11) NOT NULL DEFAULT '0' COMMENT '合服多少天后起作用',
  `login_open` int(4) NOT NULL DEFAULT '0' COMMENT '是否登录打开界面',
  `is_show_time` int(4) NOT NULL DEFAULT '0' COMMENT '是否显示倒计时',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `total_id` (`total_id`),
  KEY `name` (`name`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台总活动';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(120) NOT NULL COMMENT '订单号',
  `type` tinyint(3) unsigned NOT NULL COMMENT '充值类型(0:银行卡, 1:手机充值)',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未收取，1:已收取)',
  `gold` int(11) NOT NULL COMMENT '钻石数',
  `charge_type` int(11) NOT NULL DEFAULT '0' COMMENT '充值类型(0 普通充值 1 礼品充值)',
  `money` decimal(10,2) NOT NULL COMMENT '金额数',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` char(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '注册渠道',
  `name` varchar(60) NOT NULL COMMENT '角色名称',
  `classes` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `lev` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `is_test` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是测试充值',
  `ts` int(11) unsigned NOT NULL COMMENT '订单插入时间',
  `time_deal` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `rmb` int(11) NOT NULL DEFAULT '0' COMMENT '充值余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `rid` (`rid`,`name`),
  KEY `account` (`account`),
  KEY `acc_search_idx` (`account`,`platform`,`zone_id`,`status`),
  KEY `rid_search_idx` (`rid`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('unreply','replied') NOT NULL DEFAULT 'unreply' COMMENT '回复状态',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `rid` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '注册渠道',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `charge` int(11) NOT NULL COMMENT '累计充值钻石数',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(40) NOT NULL COMMENT '联系方式',
  `post_time` int(10) unsigned NOT NULL COMMENT '留言日期（unix_time）',
  `feedback_ip` char(16) DEFAULT NULL COMMENT '反馈ip',
  `gm_name` varchar(20) DEFAULT NULL,
  `reply` text,
  `reply_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`,`rid`),
  KEY `date` (`post_time`,`reply_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家意见反馈表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_circle_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0:动态 1:评论 2:图片',
  `spec_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT '0' COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`report_type`,`spec_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='朋友圈举报表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_moment_wish` (
  `id` int(11) unsigned NOT NULL COMMENT '寄语动态id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态区号',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '角色平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `camp_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `theme` varchar(20) NOT NULL COMMENT '活动主题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_photo` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动主题',
  `state` tinyint(4) unsigned DEFAULT '0' COMMENT '0:未处理 1:审核通过 2:不通过',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='庆典寄语表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodvoice_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT '0' COMMENT '0:未处理 1:删除录音 2:无效, 3除名',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报1-时间戳',
  `filename_1` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名1',
  `id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报2-时间戳',
  `filename_2` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名2',
  `id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报2-时间戳',
  `filename_3` varchar(40) NOT NULL DEFAULT '' COMMENT '被举报音频文件名3',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好声音举报表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lock_role` (
  `id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `lock_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0解禁, 1时间型封号, 2永久封号',
  `lock_ctime` int(10) NOT NULL DEFAULT '0' COMMENT '封号时间',
  `lock_timeout` int(10) NOT NULL DEFAULT '0' COMMENT '封号过期时间',
  `lock_info` varchar(200) NOT NULL DEFAULT '' COMMENT '封号原因',
  `silent_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0解禁, 1时间禁言, 2永久禁言',
  `silent_ctime` int(10) NOT NULL DEFAULT '0' COMMENT '禁言时间',
  `silent_timeout` int(10) NOT NULL DEFAULT '0' COMMENT '禁言过期时间',
  `silent_hide` tinyint(1) DEFAULT '0' COMMENT '是否通知被禁言人,1:不通知,2:通知',
  `silent_info` varchar(200) NOT NULL DEFAULT '' COMMENT '禁言原因',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色封号禁言列表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '渠道id',
  `ts` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间',
  `role_num` int(10) NOT NULL COMMENT '在线人数',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `channel_reg` (`channel_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='实时在线人数统计';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_card` (
  `card_num` varchar(48) NOT NULL COMMENT '卡号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型编号',
  `batch_num` int(11) NOT NULL DEFAULT '1' COMMENT '批次',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `get_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `ctime` int(11) NOT NULL COMMENT '新建时间',
  PRIMARY KEY (`card_num`),
  KEY `role_index` (`type`,`rid`,`platform`,`zone_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体卡';
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体卡类型';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '平台标识',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `auto_connect` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启动后自动连接中央服',
  `nodename` varchar(255) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` varchar(10) NOT NULL DEFAULT 'zone' COMMENT '节点类型，zone:普通游戏区 center:中央服 world:世界主服务器 world_slave:世界从服务器',
  `cookie` varchar(255) NOT NULL DEFAULT '' COMMENT 'erlang节点使用的magic cookie',
  `ver` varchar(30) NOT NULL DEFAULT '' COMMENT '当前版本(此版本号用于标识当前版本，由安装工具自动填写)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone` (`platform`,`zone_id`),
  UNIQUE KEY `nodename` (`nodename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点信息';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_log` (
  `id` int(11) unsigned NOT NULL COMMENT '评论id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `log_type` tinyint(4) unsigned DEFAULT '0' COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '宠物或守护id',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `time` int(11) unsigned NOT NULL COMMENT '产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT '1' COMMENT '1增加，2删除',
  `base_name` varchar(20) NOT NULL DEFAULT '' COMMENT '宠物或守护名',
  `pro` varchar(20) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`),
  KEY `log_type` (`log_type`,`base_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论日志';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_report` (
  `id` int(11) unsigned NOT NULL COMMENT '被举报动态id',
  `platform` varchar(20) NOT NULL COMMENT '被举报动态平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报动态区号',
  `report_type` tinyint(4) unsigned DEFAULT '0' COMMENT '1宠物，2守护',
  `base_id` int(11) unsigned NOT NULL COMMENT '被举报内容id',
  `role_id` int(11) unsigned NOT NULL COMMENT '被举报角色id',
  `role_platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `role_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报区号',
  `time` int(11) unsigned NOT NULL COMMENT '举报产生时间戳',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '被举报内容',
  `state` tinyint(4) unsigned DEFAULT '0' COMMENT '0:未处理 1:删除 2:无效',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色id',
  `reporter_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色平台标识',
  `reporter_zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色区号',
  `reporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色名字',
  `reporter_lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色等级',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  KEY `time` (`time`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论举报表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `account` varchar(120) NOT NULL DEFAULT '' COMMENT '帐号名',
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '注册渠道',
  `dispense` varchar(20) NOT NULL DEFAULT '' COMMENT '分发号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `lock_status` int(8) NOT NULL DEFAULT '0' COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT '0' COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `classes` tinyint(4) NOT NULL DEFAULT '0' COMMENT '职业',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级',
  `ver` int(11) NOT NULL COMMENT '版本号',
  `data` mediumblob NOT NULL COMMENT '序列化后的角色数据',
  PRIMARY KEY (`id`,`platform`,`zone_id`),
  UNIQUE KEY `name` (`name`,`platform`,`zone_id`),
  UNIQUE KEY `acc` (`account`,`platform`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色数据';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_charge_cfg` (
  `id` int(11) NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `label` varchar(50) NOT NULL COMMENT '充值标签',
  PRIMARY KEY (`id`,`platform`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家计费点';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_info` (
  `rid` int(11) NOT NULL COMMENT '角色信息',
  `platform` varchar(32) NOT NULL COMMENT '平台名称',
  `zone_id` int(11) NOT NULL COMMENT '区号',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `channel_reg` int(11) NOT NULL DEFAULT '0' COMMENT '注册渠道',
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
  `lock_status` int(8) NOT NULL DEFAULT '0' COMMENT '账号锁定状态:0:正常,1禁言2封号3封号且禁言',
  `reg_ip` char(16) DEFAULT NULL COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `login_ip` char(16) DEFAULT NULL COMMENT '最后一次登陆IP',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登陆时间',
  `logout_time` int(11) NOT NULL DEFAULT '0' COMMENT '登出时间',
  `label` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标志,0:玩家 1:GM 2:新手指导员',
  `device_id` varchar(40) NOT NULL DEFAULT '' COMMENT '设备号',
  `device_type` int(4) NOT NULL DEFAULT '1' COMMENT '设备类型 1:安卓 2:ios 3:windows',
  `device_key` varchar(40) NOT NULL DEFAULT '' COMMENT '设备串号',
  `break_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级突破次数',
  PRIMARY KEY (`rid`,`platform`,`zone_id`),
  KEY `channel_reg` (`channel_reg`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色详细数据';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategy_title` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `gm` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-官方发布;0-玩家发布',
  `order_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='攻略系统';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategy_title_local` (
  `id` int(11) NOT NULL COMMENT '唯一ID',
  `name` varchar(50) NOT NULL COMMENT '攻略标题',
  `content` text NOT NULL COMMENT '攻略内容',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `platform` varchar(20) NOT NULL COMMENT '平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '区号',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `type` int(11) NOT NULL COMMENT '1:新手成长;2职业装备;3:宠物培养;4:挑战攻略',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-申请状态;1-审核通过;2-审核不通过',
  `order_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认排序序号',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='攻略系统本地';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT '1' COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1已审核，0为审核',
  `title` text COMMENT '通知标题',
  `content` text COMMENT '内容',
  `msg` text COMMENT '通知内容',
  `gain` text COMMENT '奖励',
  `cond` text COMMENT '领取条件',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告板';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_scroll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT '1' COMMENT '通知类型 1:更新公告 2:gm补偿 3:奖励 4:普通',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `interval_time` int(10) unsigned NOT NULL COMMENT '间隔时间',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1已审核，0为审核',
  `msg` text COMMENT '通知内容',
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `audit` (`audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='滚动广播';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report` (
  `id` int(10) unsigned NOT NULL COMMENT '被举报角色id',
  `platform` varchar(20) NOT NULL COMMENT '被举报平台标识',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报区号',
  `time` int(10) unsigned NOT NULL COMMENT '举报产生时间戳',
  `classes` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被举报职业',
  `lev` tinyint(4) NOT NULL DEFAULT '0' COMMENT '被举报等级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '被举报角色名',
  `state` smallint(6) unsigned DEFAULT '0' COMMENT '0:未处理 1:禁言 2:封号 3:无效',
  `ctime` int(10) NOT NULL DEFAULT '0' COMMENT '封号/禁言时间',
  `items` varchar(1024) NOT NULL DEFAULT '' COMMENT '物品奖励({Id,Bind,Num})',
  `id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色1-id',
  `platform_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-平台标识',
  `zone_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色1-区号',
  `name_1` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色1-名字',
  `lev_1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色1-等级',
  `time_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报1-时间戳',
  `type_1` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '举报1-类型,1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_1` text COMMENT '原因1',
  `msg_1` text COMMENT '证据1',
  `id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色2-id',
  `platform_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-平台标识',
  `zone_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色2-区号',
  `name_2` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色2-名字',
  `lev_2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色2-等级',
  `time_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报2-时间戳',
  `type_2` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '举报2-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_2` text COMMENT '原因2',
  `msg_2` text COMMENT '证据2',
  `id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色3-id',
  `platform_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-平台标识',
  `zone_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色3-区号',
  `name_3` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色3-名字',
  `lev_3` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色3-等级',
  `time_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报3-时间戳',
  `type_3` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '举报3-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_3` text COMMENT '原因3',
  `msg_3` text COMMENT '证据3',
  `id_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色4-id',
  `platform_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-平台标识',
  `zone_id_4` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色4-区号',
  `name_4` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色4-名字',
  `lev_4` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色4-等级',
  `time_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报4-时间戳',
  `type_4` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '举报4-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_4` text COMMENT '原因4',
  `msg_4` text COMMENT '证据4',
  `id_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报角色5-id',
  `platform_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-平台标识',
  `zone_id_5` int(11) NOT NULL DEFAULT '0' COMMENT '举报角色5-区号',
  `name_5` varchar(20) NOT NULL DEFAULT '' COMMENT '举报角色5-名字',
  `lev_5` tinyint(4) NOT NULL DEFAULT '0' COMMENT '举报角色5-等级',
  `time_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '举报5-时间戳',
  `type_5` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '举报5-类型1:昵称不雅,2:骚扰谩骂,3:广告诈骗,4:色情暴力,5:反动,6:其他',
  `reason_5` text COMMENT '原因5',
  `msg_5` text COMMENT '证据5',
  PRIMARY KEY (`id`,`platform`,`zone_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_white_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '帐号名',
  `name` varchar(20) NOT NULL COMMENT '使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='白名单列表';
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01 22:13:34
