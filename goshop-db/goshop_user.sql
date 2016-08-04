/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : goshop_user

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-06-27 14:15:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gs_member
-- ----------------------------
DROP TABLE IF EXISTS `gs_member`;
CREATE TABLE `gs_member` (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `member_truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `member_avatar` varchar(500) DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT '0' COMMENT '会员性别',
  `member_birthday` date DEFAULT NULL COMMENT '生日',
  `member_email` varchar(100) NOT NULL COMMENT '会员邮箱',
  `member_qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `member_ww` varchar(100) DEFAULT NULL COMMENT '阿里旺旺',
  `member_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会员注册时间',
  `member_qqopenid` varchar(100) DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buy` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_credit` int(11) NOT NULL DEFAULT '0' COMMENT '会员信用',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_privacy` varchar(255) DEFAULT NULL COMMENT '隐私设定',
  `member_areainfo` varchar(255) DEFAULT NULL COMMENT '地区内容',
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of gs_member
-- ----------------------------
INSERT INTO `gs_member` VALUES ('7', '0', '彭树洞', '', '2', null, 'feng@shopnc.com', '46140184', 'www', '2016-03-06 09:36:04', '', '', '240', '0.00', '0.00', '2', '0', '0', '0', '0', null, null, null, null, null);
INSERT INTO `gs_member` VALUES ('13', '61', '', '', '0', null, 'pzh@126.com', '', '', '2016-06-18 22:53:38', null, null, '0', '0.00', '0.00', '1', '1', '1', '1', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for gs_role
-- ----------------------------
DROP TABLE IF EXISTS `gs_role`;
CREATE TABLE `gs_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_role
-- ----------------------------
INSERT INTO `gs_role` VALUES ('0', 'user', '用户', '1', '1');
INSERT INTO `gs_role` VALUES ('1', 'admin', '管理员', '1', '1');
INSERT INTO `gs_role` VALUES ('2', 'seller', '卖家', '1', '1');

-- ----------------------------
-- Table structure for gs_user
-- ----------------------------
DROP TABLE IF EXISTS `gs_user`;
CREATE TABLE `gs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户中文名',
  `login_name` varchar(255) NOT NULL COMMENT '用户登陆名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐值',
  `enable` int(1) DEFAULT NULL COMMENT '是否启用',
  `type` int(1) DEFAULT NULL COMMENT '用户类型(1:注册用户，2：管理员添加)',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `upcreated` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `login_num` int(11) DEFAULT '1' COMMENT '登录次数',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '当前登录时间',
  `old_login_time` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '当前登录ip',
  `old_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user
-- ----------------------------
INSERT INTO `gs_user` VALUES ('0', '管理员', 'admin', '6d4c4623d36b9aa1b056ead1ac74b824', 'aTt31', null, null, null, null, '12', '2016-06-19 20:24:22', '2016-06-19 20:22:33', '127.0.0.1', '127.0.0.1');
INSERT INTO `gs_user` VALUES ('61', null, 'wwww', '7ed869b063b1e2e860bc83ae0c2d3e92', 'n6NvJ', null, null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for gs_user_role
-- ----------------------------
DROP TABLE IF EXISTS `gs_user_role`;
CREATE TABLE `gs_user_role` (
  `r_id` bigint(20) NOT NULL,
  `u_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user_role
-- ----------------------------
INSERT INTO `gs_user_role` VALUES ('0', '0');
INSERT INTO `gs_user_role` VALUES ('2', '46');
INSERT INTO `gs_user_role` VALUES ('1', '0');
INSERT INTO `gs_user_role` VALUES ('1', '60');
