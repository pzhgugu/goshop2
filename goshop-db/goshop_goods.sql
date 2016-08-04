/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : goshop_goods

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-06-27 14:15:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gs_goods
-- ----------------------------
DROP TABLE IF EXISTS `gs_goods`;
CREATE TABLE `gs_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称（+规格名称）',
  `goods_jingle` varchar(50) NOT NULL COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `goods_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品主图',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_addtime` timestamp NULL DEFAULT NULL COMMENT '商品添加时间',
  `goods_edittime` timestamp NULL DEFAULT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否 默认0',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned DEFAULT '0' COMMENT '评价数',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of gs_goods
-- ----------------------------
INSERT INTO `gs_goods` VALUES ('46', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 绿色', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '6', '0', '0', 'a:1:{i:239;s:6:\"绿色\";}', '122', '1_04418240378724556.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '239', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('47', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 梅红', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '1', '0', '0', 'a:1:{i:240;s:6:\"梅红\";}', '122', '1_04418240641767556.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '240', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('48', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 蓝色', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '1', '1', '0', 'a:1:{i:241;s:6:\"蓝色\";}', '121', '1_04418240795665638.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '241', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('49', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 黑色', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '3', '1', '0', 'a:1:{i:242;s:6:\"黑色\";}', '121', '1_04418240955916042.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '242', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('50', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 橙色', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '0', '0', '0', 'a:1:{i:243;s:6:\"橙色\";}', '122', '1_04418241398474746.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '243', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('51', '100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟 灰色', '', '1', '官方店铺', '14', '103', '129.00', '358.00', '', '4', '0', '0', 'a:1:{i:228;s:6:\"灰色\";}', '122', '1_04418242684128103.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '228', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('231', '100085', '至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒 原装进口', '全国唯一支持开瓶试饮7天无理由退换货', '1', '官方店铺', '630', '263', '899.00', '1688.00', '', '31', '12', '0', 'a:1:{i:403;s:12:\"原装进口\";}', '4988', '1_04423392298369303.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '0', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('232', '100086', '中华老字号 东阿阿胶桃花姬阿胶糕300g', '', '1', '官方店铺', '617', '250', '150.00', '168.00', '', '6', '2', '0', 'N;', '41', '1_04423411880302392.png', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '0', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('246', '100098', '1111 绿色 e2', '1111', '1', '官方店铺', '14', '81', '211.00', '1111.00', '111', '0', '0', '0', 'a:2:{i:239;s:6:\"绿色\";i:446;s:2:\"e2\";}', '1', '1_04931403208687929.png', '10', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '0', '239', '0', '0.00', '0', '1', ',2,', '5', '0');
INSERT INTO `gs_goods` VALUES ('247', '100098', '1111 梅红 e2', '1111', '1', '官方店铺', '14', '81', '211.00', '1111.00', '222', '0', '0', '0', 'a:2:{i:240;s:6:\"梅红\";i:446;s:2:\"e2\";}', '2', '1_04931403208687929.png', '10', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '0', '240', '0', '0.00', '0', '1', ',2,', '5', '0');
INSERT INTO `gs_goods` VALUES ('248', '100098', '1111 黑色 e2', '1111', '1', '官方店铺', '14', '81', '211.00', '1111.00', '333', '1', '0', '0', 'a:2:{i:242;s:6:\"黑色\";i:446;s:2:\"e2\";}', '3', '1_04931403208687929.png', '10', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '0', '242', '0', '0.00', '0', '1', ',2,', '5', '0');
INSERT INTO `gs_goods` VALUES ('249', '100099', '审核商品名称', '', '1', '官方店铺', '14', '0', '222.00', '1170.00', '111', '1', '0', '0', 'N;', '111', '1_05028085984323487.gif', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0', '0', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('250', '100009', '2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 绿色 e1', '', '1', '官方店铺', '14', '101', '179.00', '568.00', '00001', '0', '0', '0', 'a:2:{i:239;s:6:\"绿色\";i:442;s:2:\"e1\";}', '10', '1_04418211211965600.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '239', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('251', '100011', '新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 白色 e2', '2014新款，特惠促销', '1', '官方店铺', '14', '108', '99.00', '483.00', '', '0', '0', '0', 'a:2:{i:249;s:6:\"白色\";i:446;s:2:\"e2\";}', '10', '1_04418253240878850.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '249', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('252', '100011', '新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨 紫色 e2', '2014新款，特惠促销', '1', '官方店铺', '14', '108', '99.00', '483.00', '', '0', '0', '0', 'a:2:{i:250;s:6:\"紫色\";i:446;s:2:\"e2\";}', '12', '1_04418254088878407.jpg', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '250', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('253', '100008', '正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初 橙色 e1', '', '1', '官方店铺', '14', '103', '189.00', '702.00', '5', '0', '0', '0', 'a:2:{i:243;s:6:\"橙色\";i:442;s:2:\"e1\";}', '100', '1_04418206625430066.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '243', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('254', '100009', '2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 绿色 e2', '', '1', '官方店铺', '14', '101', '179.00', '568.00', '', '0', '0', '0', 'a:2:{i:239;s:6:\"绿色\";i:446;s:2:\"e2\";}', '2', '1_04418211211965600.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '239', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('255', '100009', '2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 梅红 e1', '', '1', '官方店铺', '14', '101', '179.00', '568.00', '', '0', '0', '0', 'a:2:{i:240;s:6:\"梅红\";i:442;s:2:\"e1\";}', '3', '1_04418211211965600.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '240', '0', '0.00', '0', '1', ',0,', '5', '0');
INSERT INTO `gs_goods` VALUES ('256', '100009', '2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺 梅红 e2', '', '1', '官方店铺', '14', '101', '179.00', '568.00', '', '6', '0', '0', 'a:2:{i:240;s:6:\"梅红\";i:446;s:2:\"e2\";}', '6', '1_04418211211965600.jpg', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '36', '240', '0', '0.00', '0', '1', ',0,', '5', '0');

-- ----------------------------
-- Table structure for gs_goods_class
-- ----------------------------
DROP TABLE IF EXISTS `gs_goods_class`;
CREATE TABLE `gs_goods_class` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `gc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `type_name` varchar(100) DEFAULT NULL COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `gc_sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `gc_title` varchar(200) DEFAULT NULL COMMENT '名称',
  `gc_keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `gc_description` varchar(255) DEFAULT '' COMMENT '描述',
  `gc_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of gs_goods_class
-- ----------------------------
INSERT INTO `gs_goods_class` VALUES ('1', '服饰鞋帽6', '0', '', '0', '0', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('2', '礼品箱包', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('3', '家居家装', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('4', '女装', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('5', '男装', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('6', '内衣', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('7', '运动', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('8', '女鞋', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('9', '男鞋', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('10', '配饰', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('11', '童装', '0', '', '1', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('12', 'T恤', '32', '服饰鞋帽/女装/T恤', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('13', '衬衫', '33', '服饰鞋帽/女装/衬衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('14', '针织衫', '34', '服饰鞋/女装/针织衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('15', '雪纺衫', '35', '服饰鞋帽/女装/雪纺衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('16', '卫衣', '36', '服饰鞋帽/女装/卫衣', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('17', '马甲', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('18', '连衣裙', '35', '服饰鞋帽/女装/雪纺衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('19', '半身裙', '34', '服饰鞋/女装/针织衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('20', '牛仔裤', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('21', '休闲裤', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('22', '打底裤', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('23', '正装裤', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('24', '西服', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('25', '短外套', '35', '服饰鞋帽/女装/雪纺衫', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('26', '风衣', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('27', '大衣', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('28', '皮衣皮草', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('29', '棉服', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('30', '羽绒服', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('31', '孕妇装', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('32', '大码装', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('33', '中老年装', '0', '', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('34', '婚纱礼服', '32', '服饰鞋帽/女装/T恤', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('35', '衬衫', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('36', 'T恤', '51', '男士T恤', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('37', 'POLO衫', '51', '男士T恤', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('38', '针织衫', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('39', '羊绒衫', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('40', '卫衣', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('41', '马甲／背心', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('42', '夹克', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('43', '风衣', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('44', '大衣', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('45', '皮衣', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('46', '外套', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('47', '西服', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('48', '棉服', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('49', '羽绒服', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('50', '牛仔裤', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('51', '休闲裤', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('52', '西裤', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('53', '西服套装', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('54', '大码装', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('55', '中老年装', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('56', '唐装', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('57', '工装', '0', '', '5', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('58', '文胸', '38', '内衣', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('59', '女式内裤', '39', '女士内裤', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('60', '男式内裤', '39', '女士内裤', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('61', '家居', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('62', '睡衣', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('63', '塑身衣', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('64', '睡袍／浴袍', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('65', '泳衣', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('66', '背心', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('67', '抹胸', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('68', '连裤袜', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('69', '美腿袜', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('70', '男袜', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('71', '女袜', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('72', '情趣内衣', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('73', '保暖内衣', '0', '', '6', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('74', '休闲鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('75', '帆布鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('76', '跑步鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('77', '篮球鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('78', '足球鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('79', '训练鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('80', '乒羽鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('81', '拖鞋', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('82', '卫衣', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('83', '夹克', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('84', 'T恤', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('85', '棉服／羽绒服', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('86', '运动裤', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('87', '套装', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('88', '运动包', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('89', '运动配件', '0', '', '7', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('90', '平底鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('91', '高跟鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('92', '单鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('93', '休闲鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('94', '凉鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('95', '女靴', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('96', '雪地靴', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('97', '拖鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('98', '裸靴', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('99', '筒靴', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('100', '帆布鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('101', '雨鞋／雨靴', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('102', '妈妈鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('103', '鞋配件', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('104', '特色鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('105', '鱼嘴鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('106', '布鞋／绣花鞋', '0', '', '8', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('107', '商务休闲鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('108', '正装鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('109', '休闲鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('110', '凉鞋／沙滩鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('111', '男靴', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('112', '功能鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('113', '拖鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('114', '传统布鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('115', '鞋配件', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('116', '帆布鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('117', '豆豆鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('118', '驾车鞋', '0', '', '9', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('119', '太阳镜', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('120', '框镜', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('121', '皮带', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('122', '围巾', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('123', '手套', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('124', '帽子', '48', '女包', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('125', '领带', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('126', '袖扣', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('127', '其他配件', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('128', '丝巾', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('129', '披肩', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('130', '腰带', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('131', '腰链／腰封', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('132', '棒球帽', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('133', '毛线', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('134', '遮阳帽', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('135', '防紫外线手套', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('136', '草帽', '0', '', '10', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('137', '套装', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('138', '上衣', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('139', '裤子', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('140', '裙子', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('141', '内衣／家居服', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('142', '羽绒服／棉服', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('143', '亲子装', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('144', '儿童配饰', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('145', '礼服／演出服', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('146', '运动鞋', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('147', '单鞋', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('148', '靴子', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('149', '凉鞋', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('150', '功能鞋', '0', '', '11', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('151', '潮流女包', '0', '', '2', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('152', '时尚男包', '0', '', '2', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('153', '功能箱包', '0', '', '2', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('154', '礼品', '0', '', '2', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('155', '奢侈品', '0', '', '2', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('156', '钱包/卡包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('157', '手拿包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('158', '单肩包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('159', '双肩包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('160', '手提包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('161', '斜挎包', '0', '', '151', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('162', '钱包/卡包', '0', '', '152', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('163', '男士手包', '0', '', '152', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('164', '腰带／礼盒', '0', '', '152', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('165', '商务公文包', '0', '', '152', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('166', '电脑数码包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('167', '拉杆箱', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('168', '旅行包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('169', '旅行配件', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('170', '休闲运动包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('171', '登山包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('172', '妈咪包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('173', '书包', '0', '', '153', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('174', '火机烟具', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('175', '礼品文具', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('176', '瑞士军刀', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('177', '收藏品', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('178', '工艺礼品', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('179', '创意礼品', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('180', '礼卡礼卷', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('181', '鲜花速递', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('182', '婚庆用品', '0', '', '154', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('184', '奢侈品箱包', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('185', '钱包', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('186', '服饰', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('187', '腰带', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('188', '太阳镜眼镜', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('189', '配件', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('190', 'GUCCI', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('191', 'PRADA', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('192', 'FENDI', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('193', 'BURBERRY', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('194', 'MONTBLANC', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('195', 'ARMANI', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('196', 'RIMOWA', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('197', 'RAY-BAN', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('198', 'COACH', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('199', '更多品牌', '0', '', '155', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('200', '家纺', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('201', '灯具', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('202', '生活日用', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('203', '家装软饰', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('204', '清洁日用', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('205', '宠物生活', '0', '', '3', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('206', '床品件套', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('207', '被子', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('208', '枕芯枕套', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('209', '床单被罩', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('210', '毛巾被/毯', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('211', '床垫/床褥', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('212', '蚊帐/凉席', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('213', '抱枕坐垫', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('214', '毛巾家纺', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('215', '电热毯', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('216', '窗帘/窗纱', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('217', '酒店用品', '0', '', '200', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('218', '台灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('219', '节能灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('220', '装饰灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('221', '落地灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('222', '应急灯/手电', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('223', 'LED灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('224', '吸顶灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('225', '五金电器', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('226', '吊灯', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('227', '氛围照明', '0', '', '201', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('228', '收纳用品', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('229', '雨伞雨具', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('230', '浴室用品', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('231', '缝纫用品', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('232', '洗晒用品', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('233', '净化除味', '0', '', '202', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('234', '桌布/罩件', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('235', '地毯地垫', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('236', '沙发垫套', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('237', '相框/相片墙', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('238', '墙画墙贴', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('239', '节庆饰品', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('240', '手工/十字绣', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('241', '工艺摆件', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('242', '其他', '0', '', '203', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('243', '纸品湿巾', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('244', '衣物清洁', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('245', '清洁工具', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('246', '驱虫用品', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('247', '居室清洁', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('248', '皮具护理', '0', '', '204', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('249', '宠物主粮', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('250', '宠物零食', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('251', '营养品', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('252', '家居日用', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('253', '玩具服饰', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('254', '出行装备', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('255', '医护美容', '0', '', '205', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('256', '数码办公', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('258', '手机配件', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('259', '摄影摄像', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('260', '数码配件', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('261', '时尚影音', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('264', '手机电池', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('265', '蓝牙耳机', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('266', '充电器/数据线', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('267', '手机耳机', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('268', '手机贴膜', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('269', '手机存储卡', '49', '存储卡', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('270', '手机保护套', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('271', '车载配件', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('272', 'iPhone 配件', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('273', '创意配件', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('274', '便携/无线音响', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('275', '手机饰品', '0', '', '258', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('276', '数码相机', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('277', '单电/微单相机', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('278', '单反相机', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('279', '摄像机', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('280', '拍立得', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('281', '镜头', '0', '', '259', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('282', '存储卡', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('283', '读卡器', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('284', '滤镜', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('285', '闪光灯/手柄', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('286', '相机包', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('287', '三脚架/云台', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('288', '相机清洁', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('289', '相机贴膜', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('290', '机身附件', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('291', '镜头附件', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('292', '电池/充电器', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('293', '移动电源', '0', '', '260', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('294', 'MP3/MP4', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('295', '智能设备', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('296', '耳机/耳麦', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('297', '音箱', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('298', '高清播放器', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('299', '电子书', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('300', '电子词典', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('301', 'MP3/MP4配件', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('302', '录音笔', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('303', '麦克风', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('304', '专业音频', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('305', '电子教育', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('306', '数码相框', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('307', '苹果配件', '0', '', '261', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('308', '家用电器', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('309', '大家电', '0', '', '308', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('310', '生活电器', '0', '', '308', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('311', '厨房电器', '0', '', '308', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('312', '个护健康', '0', '', '308', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('313', '五金家装', '0', '', '308', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('314', '平板电视', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('315', '空调', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('316', '冰箱', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('317', '洗衣机', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('318', '家庭影院', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('319', 'DVD播放机', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('320', '迷你音响', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('321', '烟机/灶具', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('322', '热水器', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('323', '消毒柜/洗碗机', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('324', '酒柜/冰吧/冷柜', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('325', '家电配件', '0', '', '309', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('326', '净化器', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('327', '电风扇', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('328', '吸尘器', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('329', '加湿器', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('330', '净水设备', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('331', '饮水机', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('332', '冷风扇', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('333', '挂烫机/熨斗', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('334', '电话机', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('335', '插座', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('336', '收录/音机', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('337', '除湿/干衣机', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('338', '清洁机', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('339', '取暖电器', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('340', '其它生活电器', '0', '', '310', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('341', '料理/榨汁机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('342', '豆浆机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('343', '电饭煲', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('344', '电压力锅', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('345', '面包机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('346', '咖啡机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('347', '微波炉', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('348', '电烤箱', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('349', '电磁炉', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('350', '电饼铛/烧烤盘', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('351', '煮蛋器', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('352', '酸奶机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('353', '电炖锅', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('354', '电水壶/热水瓶', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('355', '多用途锅', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('356', '果蔬解毒机', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('357', '其它厨房电器', '0', '', '311', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('358', '剃须刀', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('359', '剃/脱毛器', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('360', '口腔护理', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('361', '电吹风', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('362', '美容器', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('363', '美发器', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('364', '按摩椅', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('365', '按摩器', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('366', '足浴盆', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('367', '血压计', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('368', '健康秤/厨房秤', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('369', '血糖仪', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('370', '体温计', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('371', '计步器/脂肪检测仪', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('372', '其它健康电器', '0', '', '312', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('373', '电动工具', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('374', '手动工具', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('375', '仪器仪表', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('376', '浴霸/排气扇', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('377', '灯具', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('378', 'LED灯', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('379', '洁身器', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('380', '水槽', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('381', '龙头', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('382', '淋浴花洒', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('383', '厨卫五金', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('384', '家具五金', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('385', '门铃', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('386', '电气开关', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('387', '插座', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('388', '电工电料', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('389', '监控安防', '0', '', '313', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('390', '电脑整机', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('391', '电脑配件', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('392', '外设产品', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('393', '网络产品', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('394', '办公打印', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('395', '办公文仪', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('398', '笔记本', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('399', '超极本', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('400', '游戏本', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('401', '平板电脑', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('402', '平板电脑配件', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('403', '台式机', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('404', '服务器', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('405', '笔记本配件', '0', '', '390', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('406', 'CPU', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('407', '主板', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('408', '显卡', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('409', '硬盘', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('410', 'SSD固态硬盘', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('411', '内存', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('412', '机箱', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('413', '电源', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('414', '显示器', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('415', '刻录机/光驱', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('416', '散热器', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('417', '声卡/扩展卡', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('418', '装机配件', '0', '', '391', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('419', '鼠标', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('420', '键盘', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('421', '移动硬盘', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('422', 'U盘', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('423', '摄像头', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('424', '外置盒', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('425', '游戏设备', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('426', '电视盒', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('427', '手写板', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('428', '鼠标垫', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('429', '插座', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('430', 'UPS电源', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('431', '线缆', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('432', '电脑工具', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('433', '电脑清洁', '0', '', '392', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('434', '路由器', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('435', '网卡', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('436', '交换机', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('437', '网络存储', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('438', '3G上网', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('439', '网络盒子', '0', '', '393', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('440', '打印机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('441', '一体机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('442', '投影机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('443', '投影配件', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('444', '传真机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('445', '复合机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('446', '碎纸机', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('447', '扫描仪', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('448', '墨盒', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('449', '硒鼓', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('450', '墨粉', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('451', '色带', '0', '', '394', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('452', '办公文具', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('453', '文件管理', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('454', '笔类', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('455', '纸类', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('456', '本册/便签', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('457', '学生文具', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('458', '财务用品', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('459', '计算器', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('460', '激光笔', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('461', '白板/封装', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('462', '考勤机', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('463', '刻录碟片/附件', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('464', '点钞机', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('465', '支付设备/POS机', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('466', '安防监控', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('467', '呼叫/会议设备', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('468', '保险柜', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('469', '办公家具', '0', '', '395', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('470', '个护化妆', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('471', '面部护理', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('472', '身体护理', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('473', '口腔护理', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('474', '女性护理', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('475', '男士护理', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('476', '魅力彩妆', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('477', '香水SPA', '0', '', '470', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('478', '洁面乳', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('479', '爽肤水', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('480', '精华露', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('481', '乳液面霜', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('482', '面膜面贴', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('483', '眼部护理', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('484', '颈部护理', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('485', 'T区护理', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('486', '护肤套装', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('487', '防晒隔离', '0', '', '471', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('488', '洗发护发', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('489', '染发/造型', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('490', '沐浴', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('491', '磨砂/浴盐', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('492', '身体乳', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('493', '手工/香皂', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('494', '香薰精油', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('495', '纤体瘦身', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('496', '脱毛膏', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('497', '手足护理', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('498', '洗护套装', '0', '', '472', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('499', '牙膏/牙粉', '0', '', '473', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('500', '牙刷/牙线', '0', '', '473', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('501', '漱口水', '0', '', '473', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('502', '卫生巾', '0', '', '474', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('503', '卫生护垫', '0', '', '474', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('504', '洗液', '0', '', '474', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('505', '美容食品', '0', '', '474', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('506', '其他', '0', '', '474', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('507', '脸部护理', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('508', '眼部护理', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('509', '身体护理', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('510', '男士香水', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('511', '剃须护理', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('512', '防脱洗护', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('513', '男士唇膏', '0', '', '475', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('514', '粉底/遮瑕', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('515', '腮红', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('516', '眼影/眼线', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('517', '眉笔', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('518', '睫毛膏', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('519', '唇膏唇彩', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('520', '彩妆组合', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('521', '卸妆', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('522', '美甲', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('523', '彩妆工具', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('524', '假发', '0', '', '476', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('525', '女士香水', '0', '', '477', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('526', '男士香水', '0', '', '477', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('527', '组合套装', '0', '', '477', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('528', '迷你香水', '0', '', '477', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('529', '香体走珠', '0', '', '477', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('530', '珠宝手表', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('531', '时尚饰品', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('532', '纯金K金饰品', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('533', '金银投资', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('534', '银饰', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('535', '钻石饰品', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('536', '翡翠玉石', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('537', '水晶玛瑙', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('538', '宝石珍珠', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('539', '婚庆', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('540', '钟表手表', '0', '', '530', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('541', '项链', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('542', '手链/脚链', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('543', '戒指', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('544', '耳饰', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('545', '头饰', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('546', '胸针', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('547', '婚庆饰品', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('548', '饰品配件', '0', '', '531', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('549', '吊坠/项链', '0', '', '532', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('550', '手镯/手链/脚链', '0', '', '532', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('551', '戒指', '0', '', '532', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('552', '耳饰', '0', '', '532', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('553', '工艺金', '0', '', '533', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('554', '工艺银', '0', '', '533', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('555', '吊坠/项链', '0', '', '534', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('556', '手镯/手链/脚链', '0', '', '534', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('557', '戒指/耳饰', '0', '', '534', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('558', '宝宝金银', '0', '', '534', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('559', '千足银', '0', '', '534', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('560', '裸钻', '0', '', '535', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('561', '戒指', '0', '', '535', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('563', '项链/吊坠', '0', '', '535', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('564', '耳饰', '0', '', '535', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('565', '手镯/手链', '0', '', '535', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('566', '项链/吊坠', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('567', '手镯/手串', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('568', '戒指', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('569', '耳饰', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('570', '挂件/摆件/把件', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('571', '高值收藏', '0', '', '536', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('572', '耳饰', '0', '', '537', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('573', '手镯/手链/脚链', '0', '', '537', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('574', '戒指', '0', '', '537', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('575', '头饰/胸针', '0', '', '537', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('576', '摆件/挂件', '0', '', '537', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('577', '项链/吊坠', '0', '', '538', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('578', '耳饰', '0', '', '538', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('579', '手镯/手链', '0', '', '538', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('580', '戒指', '0', '', '538', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('581', '婚嫁首饰', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('582', '婚纱摄影', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('583', '婚纱礼服', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('584', '婚庆服务', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('585', '婚庆礼品/用品', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('586', '婚宴', '0', '', '539', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('587', '瑞士品牌', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('588', '国产品牌', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('589', '日本品牌', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('590', '时尚品牌', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('591', '闹钟挂钟', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('592', '儿童手表', '0', '', '540', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('593', '食品饮料', '50', '食品通用', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('594', '进口食品', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('595', '地方特产', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('596', '休闲食品', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('597', '粮油调味', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('598', '中外名酒', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('599', '饮料冲调', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('600', '营养健康', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('601', '亚健康调理', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('602', '健康礼品', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('603', '生鲜食品', '50', '食品通用', '593', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('604', '饼干蛋糕', '50', '食品通用', '594', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('605', '糖果巧克力', '50', '食品通用', '594', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('606', '休闲零食', '50', '食品通用', '594', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('607', '冲调饮品', '50', '食品通用', '594', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('608', '粮油调味', '50', '食品通用', '594', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('609', '华北', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('610', '西北', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('611', '西南', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('612', '东北', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('613', '华南', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('614', '华东', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('615', '华中', '50', '食品通用', '595', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('616', '休闲零食', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('617', '坚果炒货', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('618', '肉干肉松', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('619', '蜜饯果脯', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('620', '糖果/巧克力', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('621', '饼干蛋糕', '50', '食品通用', '596', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('622', '米面杂粮', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('623', '食用油', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('624', '调味品', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('625', '南北干货', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('626', '方便食品', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('627', '有机食品', '50', '食品通用', '597', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('628', '白酒', '50', '食品通用', '598', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('629', '洋酒', '50', '食品通用', '598', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('630', '葡萄酒', '50', '食品通用', '598', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('631', '啤酒', '50', '食品通用', '598', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('632', '黄酒', '50', '食品通用', '598', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('633', '水', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('634', '饮料', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('635', '牛奶', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('636', '茶叶', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('637', '咖啡/奶茶', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('638', '冲饮谷物', '50', '食品通用', '599', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('639', '基础营养', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('640', '美体养颜', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('641', '滋补调养', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('642', '骨骼健康', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('643', '保健茶饮', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('644', '成分保健', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('645', '无糖食品', '50', '食品通用', '600', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('646', '调节三高', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('647', '心脑养护', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('648', '改善睡眠', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('649', '肝肾养护', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('650', '免疫调节', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('651', '更多调理', '50', '食品通用', '601', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('652', '参茸礼品', '50', '食品通用', '602', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('653', '更多礼品', '50', '食品通用', '602', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('654', '水果', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('655', '蔬菜', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('656', '海鲜水产', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('657', '禽蛋', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('658', '鲜肉', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('659', '加工类肉食', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('660', '冻品', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('661', '半成品', '50', '食品通用', '603', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('662', '运动健康', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('663', '户外鞋服', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('664', '户外装备', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('665', '运动器械', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('666', '纤体瑜伽', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('667', '体育娱乐', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('668', '成人用品', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('669', '保健器械', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('670', '急救卫生', '0', '', '662', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('671', '户外服装', '0', '', '663', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('672', '户外鞋袜', '0', '', '663', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('673', '户外配饰', '0', '', '663', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('674', '帐篷', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('675', '睡袋', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('676', '登山攀岩', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('677', '户外背包', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('678', '户外照明', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('679', '户外垫子', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('680', '户外仪表', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('681', '户外工具', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('682', '望远镜', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('683', '垂钓用品', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('684', '旅游用品', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('685', '便携桌椅床', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('686', '烧烤用品', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('687', '野餐炊具', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('688', '军迷用品', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('689', '游泳用具', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('690', '泳衣', '0', '', '664', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('691', '健身器械', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('692', '运动器材', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('693', '极限轮滑', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('694', '骑行运动', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('695', '运动护具', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('696', '武术搏击', '0', '', '665', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('697', '瑜伽垫', '0', '', '666', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('698', '瑜伽服', '0', '', '666', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('699', '瑜伽配件', '0', '', '666', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('700', '瑜伽套装', '0', '', '666', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('701', '舞蹈鞋服', '0', '', '666', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('702', '羽毛球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('703', '乒乓球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('704', '篮球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('705', '足球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('706', '网球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('707', '排球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('708', '高尔夫球', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('709', '棋牌麻将', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('710', '其他', '0', '', '667', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('711', '安全避孕', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('712', '验孕测孕', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('713', '人体润滑', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('714', '情爱玩具', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('715', '情趣内衣', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('716', '组合套装', '0', '', '668', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('717', '养生器械', '0', '', '669', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('718', '保健用品', '0', '', '669', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('719', '康复辅助', '0', '', '669', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('720', '家庭护理', '0', '', '669', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('721', '跌打损伤', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('722', '烫伤止痒', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('723', '防裂抗冻', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('724', '口腔咽部', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('725', '眼部保健', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('726', '鼻炎健康', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('727', '风湿骨痛', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('728', '生殖泌尿', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('729', '美体塑身', '0', '', '670', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('730', '汽车用品', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('731', '电子电器', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('732', '系统养护', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('733', '改装配件', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('734', '汽车美容', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('735', '座垫脚垫', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('736', '内饰精品', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('737', '安全自驾', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('738', '便携GPS导航', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('739', '嵌入式导航', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('740', '安全预警仪', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('741', '行车记录仪', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('742', '跟踪防盗器', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('743', '倒车雷达', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('744', '车载电源', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('745', '车载蓝牙', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('746', '车载影音', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('747', '车载净化器', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('748', '车载冰箱', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('749', '车载吸尘器', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('750', '充气泵', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('751', '胎压监测', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('752', '车载生活电器', '0', '', '731', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('753', '机油', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('754', '添加剂', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('755', '防冻冷却液', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('756', '附属油', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('757', '底盘装甲', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('758', '空调清洗剂', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('759', '金属养护', '0', '', '732', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('760', '雨刷', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('761', '车灯', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('762', '轮胎', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('763', '贴膜', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('764', '装饰贴', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('765', '后视镜', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('766', '机油滤', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('767', '空气滤', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('768', '空调滤', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('769', '燃油滤', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('770', '火花塞', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('771', '喇叭', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('772', '刹车片', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('773', '刹车盘', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('774', '减震器', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('775', '车身装饰', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('776', '尾喉/排气管', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('777', '踏板', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('778', '蓄电池', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('779', '其他配件', '0', '', '733', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('780', '漆面美容', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('781', '漆面修复', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('782', '内饰清洁', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('783', '玻璃美容', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('784', '补漆笔', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('785', '轮胎轮毂清洗', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('786', '洗车器', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('787', '洗车水枪', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('788', '洗车配件', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('789', '洗车液', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('790', '车掸', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('791', '擦车巾/海绵', '0', '', '734', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('792', '凉垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('793', '四季垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('794', '毛垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('795', '专车专用座垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('796', '专车专用座套', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('797', '通用座套', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('798', '多功能垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('799', '专车专用脚垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('800', '通用脚垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('801', '后备箱垫', '0', '', '735', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('802', '车用香水', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('803', '车用炭包', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('804', '空气净化', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('805', '颈枕/头枕', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('806', '抱枕/腰靠', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('807', '方向盘套', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('808', '挂件', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('809', '摆件', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('810', '布艺软饰', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('811', '功能用品', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('812', '整理收纳', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('813', 'CD夹', '0', '', '736', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('814', '儿童安全座椅', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('815', '应急救援', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('816', '汽修工具', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('817', '自驾野营', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('818', '自驾照明', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('819', '保温箱', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('820', '置物箱', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('821', '车衣', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('822', '遮阳挡雪挡', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('823', '车锁地锁', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('824', '摩托车装备', '0', '', '737', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('825', '玩具乐器', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('826', '适用年龄', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('827', '遥控/电动', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('828', '毛绒布艺', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('829', '娃娃玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('830', '模型玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('831', '健身玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('832', '动漫玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('833', '益智玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('834', '积木拼插', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('835', 'DIY玩具', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('836', '创意减压', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('837', '乐器相关', '0', '', '825', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('838', '0-6个月', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('839', '6-12个月', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('840', '1-3岁', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('841', '3-6岁', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('842', '6-14岁', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('843', '14岁以上', '0', '', '826', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('844', '遥控车', '0', '', '827', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('845', '遥控飞机', '0', '', '827', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('846', '遥控船', '0', '', '827', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('847', '机器人/电动', '0', '', '827', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('848', '轨道/助力', '0', '', '827', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('849', '毛绒/布艺', '0', '', '828', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('850', '靠垫/抱枕', '0', '', '828', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('851', '芭比娃娃', '0', '', '829', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('852', '卡通娃娃', '0', '', '829', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('853', '智能娃娃', '0', '', '829', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('854', '仿真模型', '0', '', '830', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('855', '拼插模型', '0', '', '830', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('856', '收藏爱好', '0', '', '830', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('857', '炫舞毯', '0', '', '831', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('858', '爬行垫/毯', '0', '', '831', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('859', '户外玩具', '0', '', '831', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('860', '戏水玩具', '0', '', '831', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('861', '电影周边', '0', '', '832', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('862', '卡通周边', '0', '', '832', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('863', '网游周边', '0', '', '832', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('864', '摇铃/床铃', '0', '', '833', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('865', '健身架', '0', '', '833', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('866', '早教启智', '0', '', '833', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('867', '拖拉玩具', '0', '', '833', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('868', '积木', '0', '', '834', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('869', '拼图', '0', '', '834', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('870', '磁力棒', '0', '', '834', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('871', '立体拼插', '0', '', '834', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('872', '手工彩泥', '0', '', '835', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('873', '绘画工具', '0', '', '835', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('874', '情景玩具', '0', '', '835', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('875', '减压玩具', '0', '', '836', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('876', '创意玩具', '0', '', '836', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('877', '钢琴', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('878', '电子琴', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('879', '手风琴', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('880', '吉他/贝斯', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('881', '民族管弦乐器', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('882', '西洋管弦乐', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('883', '口琴/口风琴/竖笛', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('884', '西洋打击乐器', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('885', '各式乐器配件', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('886', '电脑音乐', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('887', '工艺礼品乐器', '0', '', '837', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('888', '厨具', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('889', '烹饪锅具', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('890', '刀剪菜板', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('891', '收纳保鲜', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('892', '水具酒具', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('893', '餐具', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('895', '炒锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('896', '煎锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('897', '压力锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('898', '蒸锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('899', '汤锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('900', '奶锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('901', '套锅', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('902', '煲类', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('903', '水壶', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('904', '厨用杂件', '0', '', '889', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('905', '单刀', '0', '', '890', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('906', '剪刀', '0', '', '890', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('907', '套刀', '0', '', '890', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('908', '砧板', '0', '', '890', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('909', '刀具配件', '0', '', '890', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('910', '保鲜盒', '0', '', '891', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('911', '保鲜膜/袋', '0', '', '891', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('912', '调料器皿', '0', '', '891', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('913', '饭盒/提锅', '0', '', '891', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('914', '塑料杯', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('915', '运动水壶', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('916', '玻璃杯', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('917', '陶瓷杯', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('918', '保温杯', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('919', '保温壶', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('920', '酒杯/套装', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('921', '酒具配件', '0', '', '892', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('922', '餐具套装', '0', '', '893', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('923', '碗/碟/盘', '0', '', '893', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('924', '筷勺/刀叉', '0', '', '893', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('925', '一次性餐具', '0', '', '893', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('935', '茶具/咖啡具', '0', '', '888', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('936', '整套茶具', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('937', '茶杯', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('938', '茶壶', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('939', '茶盘茶托', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('940', '茶叶罐', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('941', '茶具配件', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('942', '茶宠摆件', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('943', '咖啡具', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('944', '其他', '0', '', '935', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('959', '母婴用品', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('960', '奶粉', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('961', '营养辅食', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('962', '尿裤湿巾', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('963', '喂养用品', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('964', '洗护用品', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('965', '童车童床', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('966', '服饰寝居', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('967', '妈妈专区', '0', '', '959', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('968', '品牌奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('969', '妈妈奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('970', '1段奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('971', '2段奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('972', '3段奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('973', '4段奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('974', '羊奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('975', '特殊配方', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('976', '成人奶粉', '0', '', '960', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('977', '婴幼营养', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('978', '初乳', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('979', '米粉/菜粉', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('980', '果泥/果汁', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('981', '肉松/饼干', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('982', '辅食', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('983', '孕期营养', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('984', '清火/开胃', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('985', '面条/粥', '0', '', '961', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('986', '品牌尿裤', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('987', '新生儿', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('988', 'S号', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('989', 'M号', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('990', 'L号', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('991', 'XL/XXL号', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('992', '裤型尿裤', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('993', '湿巾', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('994', '尿布/尿垫', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('995', '成人尿裤', '0', '', '962', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('996', '奶瓶', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('997', '奶嘴', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('998', '吸奶器', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('999', '暖奶/消毒', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1000', '餐具', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1001', '水具', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1002', '牙胶/安抚', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1003', '辅助用品', '0', '', '963', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1004', '宝宝护肤', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1005', '洗浴用品', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1006', '洗发沐浴', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1007', '清洁用品', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1008', '护理用品', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1009', '妈妈护肤', '0', '', '964', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1010', '婴儿推车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1011', '餐椅摇椅', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1012', '婴儿床', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1013', '学步车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1014', '三轮车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1015', '自行车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1016', '电动车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1017', '健身车', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1018', '安全座椅', '0', '', '965', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1019', '婴儿外出服', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1020', '婴儿内衣', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1021', '婴儿礼盒', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1022', '婴儿鞋帽袜', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1023', '安全防护', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1024', '家居床品', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1025', '其他', '0', '', '966', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1026', '包/背婴带', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1027', '妈妈护理', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1028', '产后塑身', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1029', '孕妇内衣', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1030', '防辐射服', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1031', '孕妇装', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1032', '孕妇食品', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1033', '妈妈美容', '0', '', '967', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1034', '手机通讯', '0', '', '256', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1035', '手机', '0', '', '1034', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1036', '对讲机', '0', '', '1034', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1037', '虚拟充值', '0', '', '0', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1041', '充值', '0', '', '1037', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1042', '游戏', '0', '', '1037', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1043', '票务', '0', '', '1037', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1044', '手机充值', '0', '', '1041', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1045', '游戏点卡', '0', '', '1042', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1046', 'QQ充值', '0', '', '1042', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1047', '电影票', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1048', '演唱会', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1049', '话剧/歌剧/音乐剧', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1050', '体育赛事', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1051', '舞蹈芭蕾', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1052', '戏曲综艺', '0', '', '1043', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1053', '女装', '32', '服饰鞋帽/女装/T恤', '4', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1054', '整车', '0', '', '730', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1055', '新车', '52', '汽车', '1054', '255', '', '', '', null);
INSERT INTO `gs_goods_class` VALUES ('1056', '二手车', '52', '汽车', '1054', '255', '', '', '', null);

-- ----------------------------
-- Table structure for gs_goods_class_staple
-- ----------------------------
DROP TABLE IF EXISTS `gs_goods_class_staple`;
CREATE TABLE `gs_goods_class_staple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` bigint(20) unsigned NOT NULL COMMENT '会员id',
  `counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';

-- ----------------------------
-- Records of gs_goods_class_staple
-- ----------------------------
INSERT INTO `gs_goods_class_staple` VALUES ('1', '服饰鞋帽 >女装 >连衣裙', '1', '4', '18', '35', '1', '2');
INSERT INTO `gs_goods_class_staple` VALUES ('2', '服饰鞋帽 >女装 >牛仔裤', '1', '4', '20', '0', '1', '7');
INSERT INTO `gs_goods_class_staple` VALUES ('3', '服饰鞋帽 >男鞋 >拖鞋', '1', '9', '113', '0', '1', '1');
INSERT INTO `gs_goods_class_staple` VALUES ('4', '服饰鞋帽 >男鞋 >功能鞋', '1', '9', '112', '0', '1', '11');
INSERT INTO `gs_goods_class_staple` VALUES ('5', '服饰鞋帽 >童装 >礼服／演出服', '1', '11', '145', '0', '1', '2');
INSERT INTO `gs_goods_class_staple` VALUES ('6', '服饰鞋帽 >童装 >套装', '1', '11', '137', '0', '1', '21');
INSERT INTO `gs_goods_class_staple` VALUES ('7', '服饰鞋帽 >女装 >针织衫', '1', '4', '14', '34', '1', '58');
INSERT INTO `gs_goods_class_staple` VALUES ('8', '服饰鞋帽 >女装 >卫衣', '1', '4', '16', '36', '1', '5');
INSERT INTO `gs_goods_class_staple` VALUES ('14', '家居家装>清洁日用>居室清洁', '3', '204', '247', '0', '46', '1');

-- ----------------------------
-- Table structure for gs_goods_common
-- ----------------------------
DROP TABLE IF EXISTS `gs_goods_common`;
CREATE TABLE `gs_goods_common` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_jingle` varchar(50) NOT NULL COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) NOT NULL COMMENT '商品主图',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_body` text NOT NULL COMMENT '商品内容',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` timestamp NULL DEFAULT NULL COMMENT '商品添加时间',
  `goods_selltime` timestamp NULL DEFAULT NULL COMMENT '上架时间',
  `goods_specname` text NOT NULL COMMENT '规格名称序列化（下标为规格id）',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '成本价',
  `goods_discount` float unsigned NOT NULL COMMENT '折扣',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板',
  `transport_title` varchar(60) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否，默认为0',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  PRIMARY KEY (`goods_commonid`)
) ENGINE=InnoDB AUTO_INCREMENT=100087 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';

-- ----------------------------
-- Records of gs_goods_common
-- ----------------------------
INSERT INTO `gs_goods_common` VALUES ('100008', '正品 2014春装新款 女 绣花针织衫 开衫外套浮桑初', '', '14', '服饰鞋帽 &gt;女装 &gt;针织衫', '1', '官方店铺', 'a:2:{i:1;s:6:\"颜色\";i:16;s:2:\"ee\";}', 'a:2:{i:1;a:1:{i:243;s:6:\"橙色\";}i:16;a:1:{i:442;s:2:\"e1\";}}', '103', 'ELLE HOME', '34', '1_04418206625430066.jpg', 'a:5:{i:206;a:2:{s:4:\"name\";s:6:\"款式\";i:3050;s:6:\"毛衣\";}i:207;a:2:{s:4:\"name\";s:6:\"材质\";i:3059;s:3:\"棉\";}i:208;a:2:{s:4:\"name\";s:6:\"价格\";i:3069;s:7:\"100-199\";}i:209;a:2:{s:4:\"name\";s:6:\"袖长\";i:3076;s:6:\"长袖\";}i:210;a:2:{s:4:\"name\";s:6:\"风格\";i:3087;s:12:\"原创设计\";}}', '<div id=\"detail2\" class=\"detail\">\r\n	<div class=\"cont tabc\">\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" title=\"温馨提示.jpg\" src=\"http://pimg2.imglefeng.com/decoration/1000000029/947d983961bd9a8fcc2ea78818fbd5f1_1379469491798.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2o_1tXXtcXXXXXXXX_%21%21228784630.jpg\" /><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2kgHfXbBbXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<br />\r\n					</td>\r\n					<td align=\"left\" valign=\"top\">\r\n						<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2vDzeXf0aXXXXXXXX_%21%21228784630.gif\" height=\"13\" width=\"14\" /> \r\n					</td>\r\n					<td style=\"font-size:14px;font-weight:bold;\">\r\n						23160037 浮桑初凉 &nbsp;绣团花偏开襟秀美小毛衫\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td colspan=\"2\">\r\n						<br />\r\n					</td>\r\n					<td style=\"font-size:12px;\">\r\n						设计点：<span style=\"font-family:宋体;\">圆领</span>&nbsp;/ 彩线绣花 /<span style=\"font-family:宋体;\">偏开襟/</span><span style=\"font-family:宋体;\">不规则下摆</span><br />\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2f8haXetOXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T24vu6XbVbXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2aXuZXeFbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2kOeLXaNbXXXXXXXX_%21%21228784630.jpg\" /><br />\r\n<a href=\"http://item.taobao.com/item.htm?spm=a220z.1000880.0.41.79yC08&amp;id=17627712443&amp;bucket_id=1\" target=\"_self\"><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T29pTjXo0aXXXXXXXX_%21%21228784630.jpg\" /></a><br />\r\n<a href=\"http://detail.tmall.com/item.htm?spm=a1z10.3.w4011-1127672680.228.50YS3y&amp;id=16160903240&amp;rn=1fc977d36692d690abf6e1d0aca92509\" target=\"_blank\"><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2ZxTjXcRaXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2meCUXeFbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<a href=\"http://detail.tmall.com/item.htm?spm=a1z10.3.w4011-1127672680.133.50YS3y&amp;id=5780117087&amp;rn=1fc977d36692d690abf6e1d0aca92509\" target=\"_blank\"><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2hGrgXcXbXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2vua0XbVbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2pqHkXaXXXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T241PjXl8aXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<a href=\"http://detail.tmall.com/item.htm?spm=a1z10.5.w4011-1127672677.232.PJJLn9&amp;id=14011986267&amp;rn=e0ac95696e6379fbbb09762e4a1783d6\" target=\"_blank\"><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T20xC0Xd8bXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2JIHkXcxXXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2tlR8Xl8cXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2kOiZXbdbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2DD5_XcXbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2U5TjXfpaXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2J3LXXoBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2FUWGXohbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T26K6hXm4aXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<a href=\"http://detail.tmall.com/item.htm?spm=a1z10.5.w4011-1127672677.108.lZibYM&amp;id=12501106699&amp;rn=62c1af367fed33a46a39abcd6e78a60a\" target=\"_blank\"><img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2jLzeXo0aXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2UffkXclXXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2ePbXXbXbXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2bMBsXdpOXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2ogh4XmBdXXXXXXXX_%21%21228784630.jpg\" /> \r\n						</p>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						？\r\n					</td>\r\n					<td>\r\n						？\r\n					</td>\r\n					<td>\r\n						？\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2vGfcXaBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2GUFkXcFOXXXXXXXX_%21%21228784630.jpg\" height=\"46\" width=\"748\" /> \r\n		</p>\r\n		<table style=\"color:#292929;font-size:12px;font-weight:bold;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"685\">\r\n			<tbody>\r\n				<tr>\r\n					<td align=\"right\">\r\n						产品款号：\r\n					</td>\r\n					<td>\r\n						23160037\r\n					</td>\r\n					<td align=\"right\">\r\n						柔软：\r\n					</td>\r\n					<td valign=\"center\">\r\n						<ul class=\"list-paddingleft-2\">\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#ffffff;color:#000000;\">柔软</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#5b5b5b;color:#ffffff;\">适中</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									偏硬\r\n								</p>\r\n							</li>\r\n						</ul>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td align=\"right\">\r\n						产品昵称：\r\n					</td>\r\n					<td>\r\n						扶桑初凉\r\n					</td>\r\n					<td align=\"right\">\r\n						厚度：\r\n					</td>\r\n					<td>\r\n						<ul class=\"list-paddingleft-2\">\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#ffffff;color:#000000;\">厚</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#595959;color:#ffffff;\">适中</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									微薄\r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									透视\r\n								</p>\r\n							</li>\r\n						</ul>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td align=\"right\">\r\n						产品颜色：\r\n					</td>\r\n					<td>\r\n						蓝色 粉色 玫红 绿色 黑色\r\n					</td>\r\n					<td align=\"right\">\r\n						柔软：\r\n					</td>\r\n					<td>\r\n						<ul class=\"list-paddingleft-2\">\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#ffffff;color:#000000;\">超弹</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									弹力\r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#595959;color:#ffffff;\">微弹</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#ffffff;color:#000000;\">无弹力</span> \r\n								</p>\r\n							</li>\r\n						</ul>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td align=\"right\">\r\n						产品成份：\r\n					</td>\r\n					<td>\r\n						<span style=\"background-color:#f7f7f7;color:#6e6e6e;\"><span style=\"background-color:#ffffff;color:#222222;\"><strong><span style=\"color:#000000;\">55%聚丙烯腈纤维45%棉</span></strong></span></span> \r\n					</td>\r\n					<td align=\"right\">\r\n						版型：\r\n					</td>\r\n					<td>\r\n						<ul class=\"list-paddingleft-2\">\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#ffffff;color:#000000;\">修身</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									适中\r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									<span style=\"background-color:#555555;color:#ffffff;\">宽松</span> \r\n								</p>\r\n							</li>\r\n							<li>\r\n								<p>\r\n									直筒\r\n								</p>\r\n							</li>\r\n						</ul>\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td align=\"right\">\r\n						克 &nbsp; &nbsp;重：\r\n					</td>\r\n					<td>\r\n						<span style=\"background-color:#f7f7f7;color:#6e6e6e;\"><span style=\"background-color:#ffffff;color:#222222;\"><strong><span style=\"color:#000000;\">0.3kg</span></strong></span></span> \r\n					</td>\r\n					<td align=\"right\">\r\n						？\r\n					</td>\r\n					<td>\r\n						？\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2Why2XbhbXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2PcG.XblbXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T25GTaXh4aXXXXXXXX_%21%21228784630.jpg\" /> \r\n					</td>\r\n					<td>\r\n						<p>\r\n							① 领型\r\n						</p>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			圆领，修饰脖颈及锁骨线条。\r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<p>\r\n							② 前襟\r\n						</p>\r\n					</td>\r\n					<td>\r\n						<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T22qhXXhVOXXXXXXXX_%21%21228784630.jpg\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			偏开襟设计，活泼中透着婉约气质\r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2c9fiXftaXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2j2edXilcXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T25GTaXh4aXXXXXXXX_%21%21228784630.jpg\" /> \r\n					</td>\r\n					<td>\r\n						<p>\r\n							③ 绣花\r\n						</p>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			低调而精美，图案古典，针法密实\r\n		</p>\r\n		<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<p>\r\n							④ 下摆\r\n						</p>\r\n					</td>\r\n					<td>\r\n						<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T22qhXXhVOXXXXXXXX_%21%21228784630.jpg\" /> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			不规则下摆，打破死板\r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2qNnjXktaXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2hf6jXjdaXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2vwSPXdJbXXXXXXXX_%21%21228784630.jpg\" height=\"31\" width=\"748\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2PbafXhpXXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"460\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<strong>尺码</strong> \r\n					</td>\r\n					<td>\r\n						<strong>后中长</strong> \r\n					</td>\r\n					<td>\r\n						<strong>胸围</strong> \r\n					</td>\r\n					<td>\r\n						<strong>摆围</strong> \r\n					</td>\r\n					<td>\r\n						<strong>袖长</strong> \r\n					</td>\r\n					<td>\r\n						<strong>袖肥</strong> \r\n					</td>\r\n					<td>\r\n						<strong>领宽</strong> \r\n					</td>\r\n					<td>\r\n						<strong>-</strong> \r\n					</td>\r\n					<td>\r\n						<strong>-</strong> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						S\r\n					</td>\r\n					<td>\r\n						64\r\n					</td>\r\n					<td>\r\n						92\r\n					</td>\r\n					<td>\r\n						92\r\n					</td>\r\n					<td>\r\n						61\r\n					</td>\r\n					<td>\r\n						26\r\n					</td>\r\n					<td>\r\n						29\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						M\r\n					</td>\r\n					<td>\r\n						66\r\n					</td>\r\n					<td>\r\n						96\r\n					</td>\r\n					<td>\r\n						96\r\n					</td>\r\n					<td>\r\n						63\r\n					</td>\r\n					<td>\r\n						27\r\n					</td>\r\n					<td>\r\n						29\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						L\r\n					</td>\r\n					<td>\r\n						68\r\n					</td>\r\n					<td>\r\n						100\r\n					</td>\r\n					<td>\r\n						100\r\n					</td>\r\n					<td>\r\n						65\r\n					</td>\r\n					<td>\r\n						28\r\n					</td>\r\n					<td>\r\n						30\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						XL\r\n					</td>\r\n					<td>\r\n						70\r\n					</td>\r\n					<td>\r\n						104\r\n					</td>\r\n					<td>\r\n						104\r\n					</td>\r\n					<td>\r\n						67\r\n					</td>\r\n					<td>\r\n						29\r\n					</td>\r\n					<td>\r\n						30\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n					<td>\r\n						-\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			由于尺码是纯手工测量所以难免存在1CM-3CM,请精灵见谅。\r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T293WhXdNcXXXXXXXX_%21%21228784630.jpg\" height=\"33\" width=\"748\" /> \r\n		</p>\r\n		<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"690\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						模特橙子\r\n					</td>\r\n					<td>\r\n						身高168CM\r\n					</td>\r\n					<td>\r\n						体重45KG\r\n					</td>\r\n					<td>\r\n						三围： 81/57/82/\r\n					</td>\r\n					<td>\r\n						肩宽 37CM &nbsp; 穿S码（裤子穿25码）\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						模特田心\r\n					</td>\r\n					<td>\r\n						身高165CM\r\n					</td>\r\n					<td>\r\n						体重45KG\r\n					</td>\r\n					<td>\r\n						三围： 80/58.5/83/\r\n					</td>\r\n					<td>\r\n						肩宽 37CM &nbsp; 穿S码（裤子穿25码）\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						试衣模特\r\n					</td>\r\n					<td>\r\n						身高160CM\r\n					</td>\r\n					<td>\r\n						体重50KG\r\n					</td>\r\n					<td>\r\n						三围： 84/66/85/\r\n					</td>\r\n					<td>\r\n						平时穿M码/裤子26 码 此款***码 合适\r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						试衣模特\r\n					</td>\r\n					<td>\r\n						身高168CM\r\n					</td>\r\n					<td>\r\n						体重62.5KG\r\n					</td>\r\n					<td>\r\n						三围： 100/82/95/\r\n					</td>\r\n					<td>\r\n						平时穿L码/裤子29 码 此款***码 合适\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2l1PkXaNXXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n		<p>\r\n			<img alt=\"裂帛 裂帛正品 2013秋装新款 女 绣花针织衫 开衫外套23160037浮桑初\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2vh2cXhBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n		</p>\r\n	</div>\r\n</div>', '1', null, '1', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '189.00', '702.00', '56.00', '26', '23160037', '0', '', '1', '0.00', '0', '1', '36', ',0,', '0', '0');
INSERT INTO `gs_goods_common` VALUES ('100009', '2014春款打底毛衫拼色毛衣 长袖套头针织衫 莺', '', '14', '服饰鞋帽 &gt;女装 &gt;针织衫', '1', '官方店铺', 'a:2:{i:1;s:6:\"颜色\";i:16;s:2:\"ee\";}', 'a:2:{i:1;a:2:{i:239;s:6:\"绿色\";i:240;s:6:\"梅红\";}i:16;a:2:{i:442;s:2:\"e1\";i:446;s:2:\"e2\";}}', '101', '爱帝', '34', '1_04418211211965600.jpg', 'a:5:{i:206;a:2:{s:4:\"name\";s:6:\"款式\";i:3050;s:6:\"毛衣\";}i:207;a:2:{s:4:\"name\";s:6:\"材质\";i:3064;s:13:\"羊毛/羊绒\";}i:208;a:2:{s:4:\"name\";s:6:\"价格\";i:3069;s:7:\"100-199\";}i:209;a:2:{s:4:\"name\";s:6:\"袖长\";i:3076;s:6:\"长袖\";}i:210;a:2:{s:4:\"name\";s:6:\"风格\";i:3087;s:12:\"原创设计\";}}', '<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" title=\"温馨提示.jpg\" src=\"http://pimg1.imglefeng.com/decoration/1000000029/947d983961bd9a8fcc2ea78818fbd5f1_1386214294101.jpg\" />&nbsp;\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2bpwSXeNaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" id=\"ids-tag-m-5\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2_JMRXdtaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2GPiRXj8bXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2o5ciXfpXXXXXXXXX_%21%211124754276.jpg\" height=\"90\" width=\"750\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"2\">\r\n				<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2p2jJXaxbXXXXXXXX_%21%211124754276.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T25UIRXb8aXXXXXXXX_%21%211124754276.jpg\" height=\"58\" width=\"440\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"font-family:微软雅黑;font-size:12px;background-color:#ffffff;\">\r\n				<p>\r\n					分割的情感落成一片一片的<br />\r\n棱角坚实地分布在人们身着的欣喜中<br />\r\n温暖自空气 流入身体<br />\r\n你在一个果园里采摘到热爱<br />\r\n或者简单的设计以及无法藏掖的暧昧<br />\r\n拒绝无所适从的情感<br />\r\n一切都很自然、美丽以及大方\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n					<tbody>\r\n						<tr>\r\n							<td>\r\n								&nbsp;\r\n							</td>\r\n							<td>\r\n								<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2269NXjNbXXXXXXXX_%21%211124754276.jpg\" height=\"30\" width=\"14\" /> \r\n							</td>\r\n							<td>\r\n								<p>\r\n									24160069 莺伞 腈棉直筒螺纹下摆梭织毛衣\r\n								</p>\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n					<tbody>\r\n						<tr>\r\n							<td style=\"background-color:#ffffff;\">\r\n								&nbsp;\r\n							</td>\r\n							<td style=\"font-family:微软雅黑;font-size:12px;\">\r\n								设计点：直筒型/大圆领/拼接袖/腈棉/几何分割图案/罗纹下摆\r\n							</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2FZESXk0XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T22BrjXf0XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T298ZRXdhaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2.6niXmlaXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2Z0VvXXtOXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2BX6kXbtXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2mWbnXfBaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2KX_nXgXaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2CdDnXgRXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2o.2iXXNbXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2uWlvXcdOXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" id=\"ids-tag-m-4\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2JksTXXtXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"color:#292929;font-size:12px;font-weight:bold;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"685\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品款号：\r\n			</td>\r\n			<td>\r\n				24160069\r\n			</td>\r\n			<td align=\"right\">\r\n				柔软：\r\n			</td>\r\n			<td valign=\"center\">\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#5d5d5d;color:#ffffff;\">柔软</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							偏硬\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品昵称：\r\n			</td>\r\n			<td>\r\n				莺伞\r\n			</td>\r\n			<td align=\"right\">\r\n				厚度：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">加厚</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							厚&nbsp;\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中&nbsp;\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#626262;color:#ffffff;\">薄款</span> \r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品颜色：\r\n			</td>\r\n			<td>\r\n				蓝色 绿色 橙色\r\n			</td>\r\n			<td align=\"right\">\r\n				弹力：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">超弹</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							弹力\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#5f5f5f;color:#ffffff;\">微弹</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							无弹力\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品成份：\r\n			</td>\r\n			<td>\r\n				54.2%聚丙烯腈纤维45.8%棉\r\n			</td>\r\n			<td align=\"right\">\r\n				版型：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">修身</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							直筒&nbsp;\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#626262;color:#ffffff;\">宽松</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				克&nbsp;&nbsp;&nbsp; 重：\r\n			</td>\r\n			<td>\r\n				0.26kg\r\n			</td>\r\n			<td align=\"right\">\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" id=\"ids-tag-m-1\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T26aZSXo4XXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2XXwgXe0aXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2I5cgXaRaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"460\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<b>尺码</b> \r\n			</td>\r\n			<td>\r\n				<b>左身长</b> \r\n			</td>\r\n			<td>\r\n				<b>适用胸围</b> \r\n			</td>\r\n			<td>\r\n				<b>摆围</b> \r\n			</td>\r\n			<td>\r\n				<b>肩宽</b> \r\n			</td>\r\n			<td>\r\n				<b>袖长</b> \r\n			</td>\r\n			<td>\r\n				<b>袖肥</b> \r\n			</td>\r\n			<td>\r\n				<b>袖口</b> \r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				S\r\n			</td>\r\n			<td>\r\n				66\r\n			</td>\r\n			<td>\r\n				92-96\r\n			</td>\r\n			<td>\r\n				71\r\n			</td>\r\n			<td>\r\n				56\r\n			</td>\r\n			<td>\r\n				46\r\n			</td>\r\n			<td>\r\n				25\r\n			</td>\r\n			<td>\r\n				16\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				M\r\n			</td>\r\n			<td>\r\n				68\r\n			</td>\r\n			<td>\r\n				96-100\r\n			</td>\r\n			<td>\r\n				75\r\n			</td>\r\n			<td>\r\n				58\r\n			</td>\r\n			<td>\r\n				47\r\n			</td>\r\n			<td>\r\n				26\r\n			</td>\r\n			<td>\r\n				17\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				L\r\n			</td>\r\n			<td>\r\n				70\r\n			</td>\r\n			<td>\r\n				100-104\r\n			</td>\r\n			<td>\r\n				79\r\n			</td>\r\n			<td>\r\n				60\r\n			</td>\r\n			<td>\r\n				48\r\n			</td>\r\n			<td>\r\n				27\r\n			</td>\r\n			<td>\r\n				18\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XL\r\n			</td>\r\n			<td>\r\n				72\r\n			</td>\r\n			<td>\r\n				104-108\r\n			</td>\r\n			<td>\r\n				83\r\n			</td>\r\n			<td>\r\n				62\r\n			</td>\r\n			<td>\r\n				49\r\n			</td>\r\n			<td>\r\n				28\r\n			</td>\r\n			<td>\r\n				19\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XXL\r\n			</td>\r\n			<td>\r\n				74\r\n			</td>\r\n			<td>\r\n				108-112\r\n			</td>\r\n			<td>\r\n				87\r\n			</td>\r\n			<td>\r\n				64\r\n			</td>\r\n			<td>\r\n				50\r\n			</td>\r\n			<td>\r\n				29\r\n			</td>\r\n			<td>\r\n				20\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	由于尺码是纯手工测量所以难免存在1CM-3CM，请精灵们谅解。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" id=\"ids-tag-m-2\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛  裂帛2013秋款打底毛衫拼色毛衣 长袖套头针织衫24160069莺\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2eJkSXm0XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"690\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				模特橙子\r\n			</td>\r\n			<td>\r\n				身高168CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 81/57/82/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM&nbsp;&nbsp; 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				模特田心\r\n			</td>\r\n			<td>\r\n				身高165CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 80/58.5/83/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM&nbsp;&nbsp; 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高**CM\r\n			</td>\r\n			<td>\r\n				体重**KG\r\n			</td>\r\n			<td>\r\n				三围： **/**/**/\r\n			</td>\r\n			<td>\r\n				平时穿M码/裤子26 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高**CM\r\n			</td>\r\n			<td>\r\n				体重**KG\r\n			</td>\r\n			<td>\r\n				三围： **/**/**/\r\n			</td>\r\n			<td>\r\n				平时穿L码/裤子29 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<br />\r\n</p>', '1', null, '1', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '179.00', '568.00', '0.00', '31', '24160069', '0', '', '1', '0.00', '0', '1', '36', ',0,', '0', '0');
INSERT INTO `gs_goods_common` VALUES ('100010', '春装 披肩式 超短款 针织 衫开衫 女装 青鸟', '', '14', '服饰鞋帽 &gt;女装 &gt;针织衫', '1', '官方店铺', 'a:1:{i:1;s:6:\"颜色\";}', 'a:1:{i:1;a:6:{i:239;s:6:\"绿色\";i:240;s:6:\"梅红\";i:241;s:6:\"蓝色\";i:242;s:6:\"黑色\";i:243;s:6:\"橙色\";i:228;s:6:\"灰色\";}}', '103', '', '34', '1_04418239521122578.jpg', 'a:5:{i:206;a:2:{s:4:\"name\";s:6:\"款式\";i:3050;s:6:\"毛衣\";}i:207;a:2:{s:4:\"name\";s:6:\"材质\";i:3064;s:13:\"羊毛/羊绒\";}i:208;a:2:{s:4:\"name\";s:6:\"价格\";i:3069;s:7:\"100-199\";}i:209;a:2:{s:4:\"name\";s:6:\"袖长\";i:3076;s:6:\"长袖\";}i:210;a:2:{s:4:\"name\";s:6:\"风格\";i:3087;s:12:\"原创设计\";}}', '<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2o_1tXXtcXXXXXXXX_%21%21228784630.jpg\" /><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2uNvKXfBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td align=\"left\" valign=\"top\">\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2vDzeXf0aXXXXXXXX_%21%21228784630.gif\" height=\"13\" width=\"14\" /> \r\n			</td>\r\n			<td style=\"font-size:14px;font-weight:bold;\">\r\n				21160068 青鸟 披肩式超短款针织开衫\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<br />\r\n			</td>\r\n			<td style=\"font-size:12px;\">\r\n				设计点：百搭 \\ 无扣 \\ 连襟领 \\ 坎肩型 \\ 粘纤纱线 \\ 可做空调衫\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T29NbrXjVaXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T24vu6XbVbXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2ULmqXXRcXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=a220z.1000881.0.46.x5VeTX&amp;id=16502932964&amp;bucket_id=19\"><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2EvfsXkdXXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2dq9KXjBbXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T29urrXjVaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=a220z.1000880.0.44.QoN0fi&amp;id=16277417495&amp;bucket_id=19\"><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2qWHrXhhaXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2ZY0HXXXOXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2HrHsXnhXXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=a220z.1000880.0.44.CgfZ7Y&amp;id=16824833952&amp;bucket_id=19\"><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2BFPoXXpbXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2Xc6rXkVaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2nOPrXjtaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2ImYmXoRaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T24dyTXchbXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2F8zgXfBbXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2X1_sXetXXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2enfrXd8aXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=a220z.1000881.0.51.1vaa5j&amp;id=18538963088&amp;bucket_id=19\"><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2l6e7XcXbXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T248brXgtaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2NId2XmpcXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T230lnXf0OXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2D3LrXhBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2GdjKXflaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T22UbCXbVbXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2gqHLXnlXXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2w56KXjhXXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2V6fKXglaXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2rEzrXeFXXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2VEVpXfxOXXXXXXXX_%21%21228784630.jpg\" /> \r\n				</p>\r\n				<p>\r\n					<a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=a220z.1000880.0.44.Sty9W6&amp;id=16143249430&amp;bucket_id=19\"><img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2OKOGXapcXXXXXXXX_%21%21228784630.jpg\" /></a> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2_6bcXmRXXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2GUFkXcFOXXXXXXXX_%21%21228784630.jpg\" height=\"46\" width=\"748\" /> \r\n</p>\r\n<table style=\"color:#292929;font-size:12px;font-weight:bold;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"685\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品款号：\r\n			</td>\r\n			<td>\r\n				21160068\r\n			</td>\r\n			<td align=\"right\">\r\n				柔软：\r\n			</td>\r\n			<td valign=\"center\">\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#5d5d5d;\">柔软</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							偏硬\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品昵称：\r\n			</td>\r\n			<td>\r\n				青鸟\r\n			</td>\r\n			<td align=\"right\">\r\n				厚度：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;\">加厚</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							厚&nbsp;\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中&nbsp;\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#5d5d5d;\">薄款</span> \r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品颜色：\r\n			</td>\r\n			<td>\r\n				黑色 红色 绿色 玫红 蓝色 灰色\r\n			</td>\r\n			<td align=\"right\">\r\n				弹力：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;\">超弹</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#626262;\">弹力</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							微弹\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							无弹力\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品成份：\r\n			</td>\r\n			<td>\r\n				100%粘纤\r\n			</td>\r\n			<td align=\"right\">\r\n				版型：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#5d5d5d;\">修身</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							宽松\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							直筒\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				克&nbsp;&nbsp;&nbsp; 重：\r\n			</td>\r\n			<td>\r\n				0.137KG\r\n			</td>\r\n			<td align=\"right\">\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2iO8XXhdOXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T25GTaXh4aXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					① 超短款\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	短款设计，让上下身比例趋于完美，更显高瘦\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					② 连襟领\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T22qhXXhVOXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	连襟领配无扣前襟，展现锁骨和颈部的精致线条\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2OlPpXcFXXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2eOpOXfVeXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T25GTaXh4aXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					③ 罗纹袖口\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	袖口螺纹，纤长手臂，方便挽起\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					④ 前下摆\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T22qhXXhVOXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	后摆下收成，更贴身舒适\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2icyAXaXcXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T2CRjKXddaXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2dbvbXglXXXXXXXXX_%21%21228784630.jpg\" height=\"37\" width=\"748\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2huDcXo8XXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2vUteXiNOXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img02.taobaocdn.com/imgextra/i2/228784630/T2TnvcXeRXXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2EcLcXjRaXXXXXXXX_%21%21228784630.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2vwSPXdJbXXXXXXXX_%21%21228784630.jpg\" height=\"31\" width=\"748\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T2PbafXhpXXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"460\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<b>尺码</b> \r\n			</td>\r\n			<td>\r\n				<b>身长</b> \r\n			</td>\r\n			<td>\r\n				<b>胸围</b> \r\n			</td>\r\n			<td>\r\n				<b>袖长</b> \r\n			</td>\r\n			<td>\r\n				<strong>袖肥</strong> \r\n			</td>\r\n			<td>\r\n				<strong>袖口</strong> \r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				S\r\n			</td>\r\n			<td>\r\n				41\r\n			</td>\r\n			<td>\r\n				63\r\n			</td>\r\n			<td>\r\n				57\r\n			</td>\r\n			<td>\r\n				24\r\n			</td>\r\n			<td>\r\n				17\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				M\r\n			</td>\r\n			<td>\r\n				43\r\n			</td>\r\n			<td>\r\n				67\r\n			</td>\r\n			<td>\r\n				58\r\n			</td>\r\n			<td>\r\n				25\r\n			</td>\r\n			<td>\r\n				18\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				L\r\n			</td>\r\n			<td>\r\n				45\r\n			</td>\r\n			<td>\r\n				71\r\n			</td>\r\n			<td>\r\n				59\r\n			</td>\r\n			<td>\r\n				26\r\n			</td>\r\n			<td>\r\n				19\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XL\r\n			</td>\r\n			<td>\r\n				47\r\n			</td>\r\n			<td>\r\n				75\r\n			</td>\r\n			<td>\r\n				60\r\n			</td>\r\n			<td>\r\n				27\r\n			</td>\r\n			<td>\r\n				20\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XXL\r\n			</td>\r\n			<td>\r\n				49\r\n			</td>\r\n			<td>\r\n				79\r\n			</td>\r\n			<td>\r\n				61\r\n			</td>\r\n			<td>\r\n				28\r\n			</td>\r\n			<td>\r\n				21\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	由于尺码是纯手工测量所以难免存在1CM-3CM，请精灵们谅解。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T293WhXdNcXXXXXXXX_%21%21228784630.jpg\" height=\"33\" width=\"748\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"690\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				模特橙子\r\n			</td>\r\n			<td>\r\n				身高168CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 81/57/82/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM&nbsp;&nbsp; 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				模特田心\r\n			</td>\r\n			<td>\r\n				身高165CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 80/58.5/83/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM&nbsp;&nbsp; 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高160CM\r\n			</td>\r\n			<td>\r\n				体重50KG\r\n			</td>\r\n			<td>\r\n				三围： 84/66/85/\r\n			</td>\r\n			<td>\r\n				平时穿M码/裤子26 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高168CM\r\n			</td>\r\n			<td>\r\n				体重62.5KG\r\n			</td>\r\n			<td>\r\n				三围： 100/82/95/\r\n			</td>\r\n			<td>\r\n				平时穿L码/裤子29 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img03.taobaocdn.com/imgextra/i3/228784630/T29qR4XnXdXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛 秋装 披肩式 超短款 针织 衫开衫 女21160068青鸟\" src=\"http://img01.taobaocdn.com/imgextra/i1/228784630/T2vh2cXhBaXXXXXXXX_%21%21228784630.jpg\" /> \r\n</p>', '0', null, '1', null, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '129.00', '358.00', '0.00', '36', '', '0', '', '1', '0.00', '0', '1', '36', ',0,', '1', '2');
INSERT INTO `gs_goods_common` VALUES ('100011', '新款 女款 拼接 不规则摆 长袖针织衫开衫 杏雨', '2014新款，特惠促销', '14', '服饰鞋帽 &gt;女装 &gt;针织衫', '1', '官方店铺', 'a:2:{i:1;s:6:\"颜色\";i:16;s:2:\"ee\";}', 'a:2:{i:1;a:2:{i:249;s:6:\"白色\";i:250;s:6:\"紫色\";}i:16;a:1:{i:446;s:2:\"e2\";}}', '108', '挪巍', '34', '1_04418253240878850.jpg', 'a:5:{i:206;a:2:{s:4:\"name\";s:6:\"款式\";i:3056;s:9:\"蝙蝠衫\";}i:207;a:2:{s:4:\"name\";s:6:\"材质\";i:3059;s:3:\"棉\";}i:208;a:2:{s:4:\"name\";s:6:\"价格\";i:3068;s:4:\"0-99\";}i:209;a:2:{s:4:\"name\";s:6:\"袖长\";i:3076;s:6:\"长袖\";}i:210;a:2:{s:4:\"name\";s:6:\"风格\";i:3088;s:6:\"百搭\";}}', '<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" title=\"温馨提示.jpg\" src=\"http://pimg2.imglefeng.com/decoration/1000000029/947d983961bd9a8fcc2ea78818fbd5f1_1378452905642.jpg\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2jUjiXn0aXXXXXXXX_%21%211124754276.jpg?4caa155c10bcc783150746582de00275\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" id=\"ids-tag-m-5\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2CEZIXelXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td align=\"left\" valign=\"top\">\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2HRYjXfhXXXXXXXXX_%21%211124754276.jpg\" /> \r\n			</td>\r\n			<td style=\"font-size:14px;font-weight:bold;\">\r\n				51130454 杏雨 清新色系花边拼接长袖针织衫\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				？\r\n			</td>\r\n			<td style=\"font-size:12px;\">\r\n				设计点：精巧圆领（两侧开小口） /插肩袖 / 网布绣花花边拼接 / 单排扣门襟 / 甜美糖果色纽扣 / 百搭长袖 / 罗纹袖口 / 高腰分割效果 / 褶皱装饰 / 不规则下摆 /轻薄针织衫\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2uht5XlBdXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2CVgIXdlaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2OncIXgtXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2iV7IXn8XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2YVAIXdNaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2I7kGXhlaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2e9EHXclaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2ytgHXjxaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2qJsIXapaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2VaMJXbFXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2TvZIXihXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2Su3IXkBXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T28_.HXfdaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2t9gHXd0aXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2aHkJXb4XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" id=\"ids-tag-m-4\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2.kjjXjXXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2TDm1XctbXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"color:#292929;font-size:12px;font-weight:bold;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"685\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品款号：\r\n			</td>\r\n			<td>\r\n				51130454\r\n			</td>\r\n			<td align=\"right\">\r\n				柔软：\r\n			</td>\r\n			<td valign=\"center\">\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">柔软</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#636363;color:#ffffff;\">适中</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							偏硬\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品昵称：\r\n			</td>\r\n			<td>\r\n				杏雨\r\n			</td>\r\n			<td align=\"right\">\r\n				厚度：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">加厚</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							厚\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#636363;color:#ffffff;\">适中</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							薄款\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品颜色：\r\n			</td>\r\n			<td>\r\n				粉色 紫色 白色\r\n			</td>\r\n			<td align=\"right\">\r\n				弹力：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">超弹</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#626262;color:#ffffff;\">弹力</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							微弹\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							无弹力\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				产品成份：\r\n			</td>\r\n			<td>\r\n				55%聚丙烯腈纤维45%棉\r\n			</td>\r\n			<td align=\"right\">\r\n				版型：\r\n			</td>\r\n			<td>\r\n				<ul class=\"list-paddingleft-2\">\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#ffffff;color:#000000;\">修身</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							直筒\r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							<span style=\"background-color:#6b6b6b;color:#ffffff;\">宽松</span> \r\n						</p>\r\n					</li>\r\n					<li>\r\n						<p>\r\n							适中\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"right\">\r\n				克 重：\r\n			</td>\r\n			<td>\r\n				0.156KG\r\n			</td>\r\n			<td align=\"right\">\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/228784630/T25.VBXdpOXXXXXXXX_%21%21228784630.jpg\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2DLAHXcXaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T20hcIXe0XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2DQjiXhFaXXXXXXXX_%21%211124754276.jpg?82c0a15cd9b4e1656ddf9534acc87ac8\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					① 精致开口圆领\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	小巧精致的圆领，两侧插肩接缝处添加小小开口设计，趣味感十足\r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					② 雅致花边拼接\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2LO16XeXbXXXXXXXX_%21%211124754276.jpg?02e8eefb6edde3e53093aac4a2b6f462\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	肩袖处拼接白色羽毛状绣花网眼布，在清新色彩上更显雅致\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2BQL6XeRbXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2ZqMHXmRaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2DQjiXhFaXXXXXXXX_%21%211124754276.jpg?82c0a15cd9b4e1656ddf9534acc87ac8\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					③ 糖果色纽扣\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	单排扣门襟，纽扣与衣服同一色系，色彩更加鲜亮活泼，非常俏皮可爱\r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					④ 不规则下摆\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2LO16XeXbXXXXXXXX_%21%211124754276.jpg?02e8eefb6edde3e53093aac4a2b6f462\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	不要中规中矩，优雅独特的气质跳跃而出\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2JakIXo4XXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2fIgGXjhaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2B59pXeVcXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"font-family:微软雅黑;color:#000000;font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td rowspan=\"2\">\r\n				？\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2HRYjXfhXXXXXXXXX_%21%211124754276.jpg\" height=\"13\" width=\"14\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					素雅绣花网眼布拼接\r\n				</p>\r\n			</td>\r\n			<td rowspan=\"2\">\r\n				？\r\n			</td>\r\n			<td>\r\n				<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2HRYjXfhXXXXXXXXX_%21%211124754276.jpg\" height=\"13\" width=\"14\" /> \r\n			</td>\r\n			<td>\r\n				<p>\r\n					柔和亲肤腈棉材质\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" valign=\"top\">\r\n				<p>\r\n					肩袖处拼接绣花网眼布，使用单色线绣法，用色淡雅，纹样精美，做工精致。由于绣在网布之上，使网布绣花看起来接近蕾丝的质地，古典婉约，并且兼具蕾丝的甜美与性感。\r\n				</p>\r\n			</td>\r\n			<td colspan=\"2\" valign=\"top\">\r\n				<p>\r\n					腈棉是聚丙烯腈纤维和棉的混纺物。拥有聚丙烯腈纤维弹性好、蓬松卷曲而柔软的特点，柔软蓬松，易染色、色泽鲜艳、耐光、抗菌，不怕虫蛀等。同时结合棉吸湿性好，手感柔软、卫生舒适、光泽柔和、有自然美感等贴点，穿着更加柔和亲肤。\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2XXwgXe0aXXXXXXXX_%21%211124754276.jpg\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2.fJ8XktcXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img04.taobaocdn.com/imgextra/i4/1124754276/T2I5cgXaRaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"460\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<strong>尺码</strong> \r\n			</td>\r\n			<td>\r\n				<strong>身长</strong> \r\n			</td>\r\n			<td>\r\n				<strong>胸围</strong> \r\n			</td>\r\n			<td>\r\n				<strong>摆围</strong> \r\n			</td>\r\n			<td>\r\n				<strong>袖长</strong> \r\n			</td>\r\n			<td>\r\n				<strong>袖肥</strong> \r\n			</td>\r\n			<td>\r\n				<strong>袖口</strong> \r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				S\r\n			</td>\r\n			<td>\r\n				58\r\n			</td>\r\n			<td>\r\n				84\r\n			</td>\r\n			<td>\r\n				138\r\n			</td>\r\n			<td>\r\n				69\r\n			</td>\r\n			<td>\r\n				26\r\n			</td>\r\n			<td>\r\n				17\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				M\r\n			</td>\r\n			<td>\r\n				60\r\n			</td>\r\n			<td>\r\n				88\r\n			</td>\r\n			<td>\r\n				142\r\n			</td>\r\n			<td>\r\n				70.5\r\n			</td>\r\n			<td>\r\n				27\r\n			</td>\r\n			<td>\r\n				18\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					L\r\n				</p>\r\n			</td>\r\n			<td>\r\n				62\r\n			</td>\r\n			<td>\r\n				92\r\n			</td>\r\n			<td>\r\n				146\r\n			</td>\r\n			<td>\r\n				72\r\n			</td>\r\n			<td>\r\n				28\r\n			</td>\r\n			<td>\r\n				19\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XL\r\n			</td>\r\n			<td>\r\n				64\r\n			</td>\r\n			<td>\r\n				96\r\n			</td>\r\n			<td>\r\n				150\r\n			</td>\r\n			<td>\r\n				73.5\r\n			</td>\r\n			<td>\r\n				29\r\n			</td>\r\n			<td>\r\n				20\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				XXL\r\n			</td>\r\n			<td>\r\n				66\r\n			</td>\r\n			<td>\r\n				100\r\n			</td>\r\n			<td>\r\n				154\r\n			</td>\r\n			<td>\r\n				75\r\n			</td>\r\n			<td>\r\n				30\r\n			</td>\r\n			<td>\r\n				21\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				-\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n			<td>\r\n				？\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	由于尺码是纯手工测量所以难免存在1CM-3CM，请精灵们谅解。\r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" id=\"ids-tag-m-2\" class=\"ke_anchor\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" /><img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img03.taobaocdn.com/imgextra/i3/1124754276/T2id2jXctaXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<table style=\"font-size:12px;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"690\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				模特橙子\r\n			</td>\r\n			<td>\r\n				身高168CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 81/57/82/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				模特田心\r\n			</td>\r\n			<td>\r\n				身高165CM\r\n			</td>\r\n			<td>\r\n				体重45KG\r\n			</td>\r\n			<td>\r\n				三围： 80/58.5/83/\r\n			</td>\r\n			<td>\r\n				肩宽 37CM 穿S码（裤子穿25码）\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高**CM\r\n			</td>\r\n			<td>\r\n				体重**KG\r\n			</td>\r\n			<td>\r\n				三围： **/**/**/\r\n			</td>\r\n			<td>\r\n				平时穿M码/裤子26 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				试衣模特\r\n			</td>\r\n			<td>\r\n				身高**CM\r\n			</td>\r\n			<td>\r\n				体重**KG\r\n			</td>\r\n			<td>\r\n				三围： **/**/**/\r\n			</td>\r\n			<td>\r\n				平时穿L码/裤子29 码 此款***码 合适\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img01.taobaocdn.com/imgextra/i1/1124754276/T2DIsIXoXXXXXXXXXX_%21%211124754276.jpg\" /> \r\n</p>\r\n<p>\r\n	<img alt=\"裂帛 裂帛新款 女 拼接 不规则摆 长袖针织衫开衫51130454杏雨\" src=\"http://img02.taobaocdn.com/imgextra/i2/1124754276/T2YEDiXmVaXXXXXXXX_%21%211124754276.jpg?2bb287f60d61e3f3159f1bbaa3b7e3c6\" /> \r\n</p>', '0', null, '1', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '99.00', '483.00', '0.00', '20', '', '0', '', '1', '0.00', '0', '1', '36', ',0,', '0', '0');
INSERT INTO `gs_goods_common` VALUES ('100085', '至尊金奖 法国原瓶进口AOC红酒 任选一箱 红沙城堡红葡萄酒', '全国唯一支持开瓶试饮7天无理由退换货', '630', '食品饮料 &gt;中外名酒 &gt;葡萄酒', '1', '官方店铺', 'a:1:{i:29;s:6:\"口味\";}', 'a:1:{i:29;a:1:{i:403;s:12:\"原装进口\";}}', '263', '长城葡萄酒', '50', '1_04423392298369303.jpg', 'a:4:{i:273;a:2:{s:4:\"name\";s:6:\"产地\";i:3512;s:6:\"其他\";}i:274;a:2:{s:4:\"name\";s:6:\"价格\";i:3517;s:8:\"500-1000\";}i:275;a:2:{s:4:\"name\";s:6:\"特性\";i:3520;s:9:\"无添加\";}i:276;a:2:{s:4:\"name\";s:6:\"包装\";i:3529;s:6:\"箱装\";}}', '<img src=\"../data/upload/shop/store/goods/1/1_04423392645620711_1280.jpg\" alt=\"image\" />', '1', null, '1', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '899.00', '1688.00', '0.00', '53', '', '0', '', '1', '0.00', '0', '1', '36', ',0,', '0', '0');
INSERT INTO `gs_goods_common` VALUES ('100086', '中华老字号 东阿阿胶桃花姬阿胶糕300g', '', '617', '食品饮料 &gt;休闲食品 &gt;坚果炒货', '1', '官方店铺', 'N;', 'N;', '250', '养生堂', '50', '1_04423411880302392.png', 'a:4:{i:273;a:2:{s:4:\"name\";s:6:\"产地\";i:3510;s:6:\"中国\";}i:274;a:2:{s:4:\"name\";s:6:\"价格\";i:3515;s:7:\"100-200\";}i:275;a:2:{s:4:\"name\";s:6:\"特性\";i:3520;s:9:\"无添加\";}i:276;a:2:{s:4:\"name\";s:6:\"包装\";i:3527;s:9:\"礼盒装\";}}', '<img src=\"../data/upload/shop/store/goods/1/1_04423412221350722_1280.jpg\" alt=\"image\" />', '1', null, '1', '', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '150.00', '168.00', '0.00', '89', '', '0', '', '1', '0.00', '0', '1', '36', ',0,', '0', '0');

-- ----------------------------
-- Table structure for gs_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `gs_goods_type`;
CREATE TABLE `gs_goods_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) NOT NULL COMMENT '所属分类名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Records of gs_goods_type
-- ----------------------------
INSERT INTO `gs_goods_type` VALUES ('34', '服饰鞋/女装/针织衫', '3', '14', '针织衫');
INSERT INTO `gs_goods_type` VALUES ('35', '服饰鞋帽/女装/雪纺衫', '4', '15', '雪纺衫');
INSERT INTO `gs_goods_type` VALUES ('36', '服饰鞋帽/女装/卫衣', '5', '16', '卫衣');
