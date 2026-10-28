-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: fswy_dev_9000
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实时在线人数统计';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据';
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
-- Dumping events for database 'fswy_dev_9000'
--

--
-- Dumping routines for database 'fswy_dev_9000'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01 22:13:39
