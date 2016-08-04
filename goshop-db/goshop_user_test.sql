/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : goshop_user_test

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-06-27 14:15:33
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of gs_member
-- ----------------------------
INSERT INTO `gs_member` VALUES ('7', '0', '彭树洞', '', '2', null, 'feng@shopnc.com', '46140184', 'www', '2016-03-06 09:36:04', '', '', '240', '0.00', '0.00', '2', '0', '0', '0', '0', null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user
-- ----------------------------
INSERT INTO `gs_user` VALUES ('14', '管理员_BTekzFw1', 'admin_BTekzFw1', 'd6a7805cf7e204af8fbad78e22383e00', '7dcLE', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('15', '管理员_VWbb7JN6', 'admin_VWbb7JN6', 'c16999d8447975d08080e6ec71e0a215', 'p1EEo', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('16', '管理员_xXey6whc', 'admin_xXey6whc', '3e74d20f03ef8c724de79e59c4ef4ef8', 'Te9AH', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('17', '管理员_5YJD63IM', 'admin_5YJD63IM', '087d14679135c6814004c79c6fae3e38', 'EQuTH', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('18', '管理员_6owCRTzX', 'admin_6owCRTzX', '6b8e2c3386cb62ad7eb57b633629e1d4', 'j86IV', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('19', '管理员_dp8xIbvB', 'admin_dp8xIbvB', 'ef21296f0f5ad6fef46499c2e8a399b0', 'NDv7M', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('20', '管理员_83jE4LVB', 'admin_83jE4LVB', '630c024e2c25d37df8e5e4ed6c764a6b', 'Sv0I7', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('21', '管理员_BmtnbcMh', 'admin_BmtnbcMh', 'b98a933666ed124308c8c4aa3e08dbb4', 'OciEQ', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('22', '管理员_VKT9th0t', 'admin_VKT9th0t', 'b0795dbd92e749c475acde16ad8d20aa', 'sJ7Cy', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('23', '管理员_ttKsW9Fu', 'admin_ttKsW9Fu', '00a92176ea57037e21d97454a796700f', 'dJoye', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('24', '管理员_VyCQizup', 'admin_VyCQizup', 'd79c81deebb20684031f608beabcd9ac', 'Ap1rc', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('25', '管理员_tbYM93nc', 'admin_tbYM93nc', '237d85233a22b9feb9ae015c665d1180', 'ppS9M', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('26', '管理员_K1oErCaw', 'admin_K1oErCaw', 'b2eeb7fd4ab5d7b4e76339f19b3004a6', 'wJC2D', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('27', '管理员_vqzTIZP9', 'admin_vqzTIZP9', '39088404de0e5188ee4eac2cfa095ccf', '5MAWN', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('28', '管理员_S60DSBGY', 'admin_S60DSBGY', 'd7313d0d0801e48024d2bba687f9726c', 'rzDUp', null, null, null, null, '1', null, null, null, null);
INSERT INTO `gs_user` VALUES ('29', '管理员_huSqmwHe', 'admin_huSqmwHe', '85c19d1b199c5884cbc09a98d691bb78', 'DOSmv', null, null, null, null, '1', null, null, null, null);

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
DROP TRIGGER IF EXISTS `master_insert`;
DELIMITER ;;
CREATE TRIGGER `master_insert` AFTER INSERT ON `gs_user` FOR EACH ROW insert into goshop_user_test_read.gs_user (select   *    from goshop_user_test.gs_user where id = new.id)
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `master_update`;
DELIMITER ;;
CREATE TRIGGER `master_update` BEFORE UPDATE ON `gs_user` FOR EACH ROW delete from goshop_user_test_read.gs_user where  id = old.id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `master_update_after`;
DELIMITER ;;
CREATE TRIGGER `master_update_after` AFTER UPDATE ON `gs_user` FOR EACH ROW insert into goshop_user_test_read.gs_user (select   *    from goshop_user_test.gs_user where id = old.id)
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `master_delete`;
DELIMITER ;;
CREATE TRIGGER `master_delete` AFTER DELETE ON `gs_user` FOR EACH ROW delete from goshop_user_test_read.gs_user where  id = old.id
;;
DELIMITER ;
