/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : goshop_store

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-06-27 14:15:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gs_store
-- ----------------------------
DROP TABLE IF EXISTS `gs_store`;
CREATE TABLE `gs_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_auth` tinyint(1) DEFAULT '0' COMMENT '店铺认证',
  `name_auth` tinyint(1) DEFAULT '0' COMMENT '店主认证',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '店主卖家用户名',
  `store_owner_card` varchar(50) DEFAULT NULL COMMENT '身份证',
  `sc_id` int(11) NOT NULL COMMENT '店铺分类',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `area_id` int(11) DEFAULT NULL COMMENT '地区id',
  `area_info` varchar(100) DEFAULT NULL COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) DEFAULT NULL COMMENT '详细地区',
  `store_zip` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `store_tel` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `store_image` varchar(100) DEFAULT NULL COMMENT '证件上传',
  `store_image1` varchar(100) DEFAULT NULL COMMENT '执照上传',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `store_time` date DEFAULT NULL COMMENT '店铺时间',
  `store_end_time` date DEFAULT NULL COMMENT '店铺关闭时间',
  `store_label` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `store_keywords` varchar(255) DEFAULT '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) DEFAULT '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `description` text COMMENT '店铺简介',
  `store_zy` text COMMENT '主营商品',
  `store_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) DEFAULT '0' COMMENT '店铺信用',
  `praise_rate` float DEFAULT '0' COMMENT '店铺好评率',
  `store_desccredit` float DEFAULT '0' COMMENT '描述相符度分数',
  `store_servicecredit` float DEFAULT '0' COMMENT '服务态度分数',
  `store_deliverycredit` float DEFAULT '0' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `store_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_storage_alarm` tinyint(3) unsigned DEFAULT '10' COMMENT '库存警报',
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `sc_id` (`sc_id`),
  KEY `area_id` (`area_id`),
  KEY `store_state` (`store_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';

-- ----------------------------
-- Records of gs_store
-- ----------------------------
INSERT INTO `gs_store` VALUES ('1', '古古', '0', '0', '1', '46', 'gugu', 'gugu_shop', null, '7', '公司名称', null, null, null, null, '联系人电话', null, '/2016-04-15/ccb6d27c-2738-43c9-ae31-5687258407ca.gif', '1', '关闭原因1', '0', '2016-04-17', '2026-04-30', null, null, '', '', null, null, null, null, null, '0', '0', 'default', '0', '0', '0', '0', '0', '0', null, null, null, null, '0', null, null, null, '0.00', '10');

-- ----------------------------
-- Table structure for gs_store_class
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_class`;
CREATE TABLE `gs_store_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k8are5foo7cgj6ytmlqulgsu7` (`PARENT_ID`) USING BTREE,
  CONSTRAINT `gs_store_class_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `gs_store_class` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_store_class
-- ----------------------------
INSERT INTO `gs_store_class` VALUES ('1', '1', '女装', '9');
INSERT INTO `gs_store_class` VALUES ('2', '1', 'T恤', '9');
INSERT INTO `gs_store_class` VALUES ('3', '3', '衬衫', '9');
INSERT INTO `gs_store_class` VALUES ('4', '4', '针织衫', '9');
INSERT INTO `gs_store_class` VALUES ('5', '5', '雪纺衫', '9');
INSERT INTO `gs_store_class` VALUES ('6', '6', '卫衣', '9');
INSERT INTO `gs_store_class` VALUES ('7', '1', '礼品箱包', null);
INSERT INTO `gs_store_class` VALUES ('9', '0', '服饰鞋帽', null);
INSERT INTO `gs_store_class` VALUES ('17', '2', '3C数码', null);
INSERT INTO `gs_store_class` VALUES ('18', '3', '美容护理', null);
INSERT INTO `gs_store_class` VALUES ('19', '8', '家居用品', null);

-- ----------------------------
-- Table structure for gs_store_goods_class
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_goods_class`;
CREATE TABLE `gs_store_goods_class` (
  `stc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `stc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `stc_parent_id` int(11) NOT NULL COMMENT '父级id',
  `stc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `stc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  PRIMARY KEY (`stc_id`),
  KEY `stc_parent_id` (`stc_parent_id`,`stc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';

-- ----------------------------
-- Records of gs_store_goods_class
-- ----------------------------
INSERT INTO `gs_store_goods_class` VALUES ('1', 'www', '0', '0', '1', '0');
INSERT INTO `gs_store_goods_class` VALUES ('2', '1', '0', '1', '1', '0');
INSERT INTO `gs_store_goods_class` VALUES ('3', '2', '1', '1', '1', '0');
INSERT INTO `gs_store_goods_class` VALUES ('4', '3', '1', '1', '1', '0');
INSERT INTO `gs_store_goods_class` VALUES ('5', '4', '1', '1', '1', '0');
INSERT INTO `gs_store_goods_class` VALUES ('6', '1.1', '2', '1', '1', '0');

-- ----------------------------
-- Table structure for gs_store_grade
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_grade`;
CREATE TABLE `gs_store_grade` (
  `sg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) unsigned DEFAULT '0' COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) unsigned DEFAULT '0' COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) unsigned DEFAULT '0' COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `sg_price` varchar(100) DEFAULT NULL COMMENT '费用',
  `sg_confirm` tinyint(1) DEFAULT '1' COMMENT '审核，0为否，1为是，默认为1',
  `sg_description` text COMMENT '申请说明',
  `sg_function` varchar(255) DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别，数目越大级别越高',
  PRIMARY KEY (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';

-- ----------------------------
-- Records of gs_store_grade
-- ----------------------------
INSERT INTO `gs_store_grade` VALUES ('1', '系统默认', '100', '500', '100', '6', 'default|style1|style2|style3|style4|style5', '100元/年', '0', '用户选择“默认等级”，可以立即开通。', '', '0');
INSERT INTO `gs_store_grade` VALUES ('2', '白金店铺', '200', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '200元/年', '1', '享受更多特权', 'editor_multimedia', '2');
INSERT INTO `gs_store_grade` VALUES ('3', '钻石店铺', '1000', '1000', '100', '6', 'default|style1|style2|style3|style4|style5', '1000元/年', '0', '', 'editor_multimedia', '100');

-- ----------------------------
-- Table structure for gs_store_join
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_join`;
CREATE TABLE `gs_store_join` (
  `member_id` bigint(20) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_employee_count` int(10) unsigned DEFAULT NULL COMMENT '员工总数',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(500) DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_electronic` varchar(500) DEFAULT NULL COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(500) DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '支行联行号',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(500) DEFAULT NULL COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) DEFAULT NULL COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(250) DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(250) DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certificate_electronic` varchar(500) DEFAULT NULL COMMENT '税务登记证号电子版',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家帐号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `sg_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `sg_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sc_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(200) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺入住表';

-- ----------------------------
-- Records of gs_store_join
-- ----------------------------
INSERT INTO `gs_store_join` VALUES ('46', 'gugu', '公司名称', '内蒙古自治区 乌海市 乌达区', null, '110', '1', '2', '联系人姓名', '联系人电话', 'pzh_gugu@126.com', '营业执照号1', '河北省 石家庄市 元氏县', '2016-04-03', '2016-04-29', '法定经营范围1', '/2016-04-15/ccb6d27c-2738-43c9-ae31-5687258407ca.gif', '组织机构代码', '/2016-04-15/10e7802b-2131-4b2a-ba73-852403d4963a.gif', '/2016-04-15/49ab71d1-43fc-4528-beaa-f99600bdafe6.gif', '银行开户名', '公司银行账号', '开户银行支行名称', '支行联行号', '北京 北京市 西城区', '/2016-04-14/15bf46c0-3f01-441f-8dd9-6f982a43e000.gif', '1', '银行开户名', '公司银行账号', '开户银行支行名称', '支行联行号', '广东省 潮州市 湘桥区', '税务登记证号', '纳税人识别号', '/2016-04-14/858added-1250-4e55-98d9-295993313873.gif', 'gugu_shop', '古古', '[{\"jmcs\":[{\"id\":\"2\",\"name\":\"礼品箱包\"},{\"id\":\"151\",\"name\":\"潮流女包\"},{\"id\":\"157\",\"name\":\"手拿包\"}]},{\"jmcs\":[{\"id\":\"308\",\"name\":\"家用电器\"},{\"id\":\"310\",\"name\":\"生活电器\"},{\"id\":\"326\",\"name\":\"净化器\"}]}]', null, '40', '找到', '白金店铺', '2', '  服饰鞋帽', '9', null, '/2016-04-15/adb60ac8-2ba7-475b-96eb-1a5269716a93.gif', '已付款');

-- ----------------------------
-- Table structure for gs_store_nav
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_nav`;
CREATE TABLE `gs_store_nav` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastUpdater` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `snIfShow` varchar(255) DEFAULT NULL,
  `snNewOpen` varchar(255) DEFAULT NULL,
  `snSort` varchar(255) DEFAULT NULL,
  `snTitle` varchar(255) DEFAULT NULL,
  `snUrl` varchar(255) DEFAULT NULL,
  `storeId` varchar(255) DEFAULT NULL,
  `snContent` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_store_nav
-- ----------------------------
INSERT INTO `gs_store_nav` VALUES ('4028978151334697015133481cb10000', '2015-11-23 15:39:02', 'administrator', 'administrator', '2015-12-23 10:23:57', '8', '1', '0', '2', '多肉繁殖', '', '402897815123d77f015123dee3910001', '<div id=\"J_DivItemDesc\" class=\"content\" style=\"margin:0px;padding:10px 0px 0px;\">\r\n	<p>\r\n		温馨提醒：\r\n	</p>\r\n	<p style=\"text-align:left;background-color:#FFFFFF;text-indent:0px;color:#000000;\">\r\n		<strong><span style=\"color:#FF0000;\"><span style=\"color:#000000;\">1.由于植物的特殊性，不支持退货，换货，15天内有问题我们都会帮您退款，请放心购买！</span></span></strong> \r\n	</p>\r\n	<p style=\"background-color:#FFFFFF;text-indent:0px;color:#000000;\">\r\n		<strong><span style=\"color:#FF0000;\"><span style=\"color:#000000;\">2.收到货需自己栽种，不是栽种好发货，栽种步骤参考本页面下方。</span></span></strong> \r\n	</p>\r\n	<p style=\"background-color:#FFFFFF;text-indent:0px;color:#000000;\">\r\n		<strong><span style=\"color:#FF0000;\"><span style=\"color:#000000;\">3.<strong>玻璃盆是人工吹制而成，会有气泡等现象，属正常，尽请谅解，不能接受的亲请勿拍！</strong></span></span></strong> \r\n	</p>\r\n	<p style=\"background-color:#FFFFFF;text-indent:0px;color:#000000;\">\r\n		<strong><span style=\"color:#FF0000;\"></span></strong><strong>4.</strong><span style=\"font-size:14px;\"><strong><span style=\"color:#FF0000;\">因光照，温度，环境等各方面因素影响</span></strong><span style=\"color:#FF0000;\"><strong>夏季植物颜色普遍变绿，对多肉了解的买家都知道这个常识，四季颜色不同，下面图片是春季拍的，现在虹之玉，火祭或红叶</strong></span><strong>祭</strong><span style=\"color:#FF0000;\"><strong>，初恋，姬胧月，秋丽，黄丽，紫珍珠颜色都变绿或者颜色变淡不红了，秋季植物又会变红，请新手买家们知悉，不要因此给中差评，只能说明您对多肉不是那么热爱。<img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB21noYeFXXXXX6XpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"559\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2xV4ceVXXXXaGXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"705\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2wltaeVXXXXaOXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"615\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2rt2XfFXXXXc6XXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"376\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2B7q.fFXXXXXAXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"310\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2FYaZfFXXXXaLXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"310\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2sprcfFXXXXcWXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"309\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2ox2kfFXXXXazXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"310\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB24su4fFXXXXaIXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"310\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2uwMTeFXXXXbCXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"514\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2A1k7eFXXXXbZXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"463\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2ppo0eFXXXXX3XpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"478\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2bt._eFXXXXbEXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"462\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2jPgWeFXXXXaGXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"478\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2wUNfeVXXXXXSXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"472\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2_VA9eFXXXXb9XXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"472\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2Vaw8eFXXXXb.XXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"472\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2MgIMeFXXXXcKXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"465\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2fHo7eFXXXXcxXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"464\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2dqQ_eFXXXXbzXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"462\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB28ipgeVXXXXXLXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"478\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB245A0eFXXXXX2XpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"462\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2ej.PeFXXXXcbXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"478\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2qc7_eFXXXXaIXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"671\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2X7s8eFXXXXb3XXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"185\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2nG.NeFXXXXb4XpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"464\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i1/2274072695/TB2LqoUeFXXXXbnXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"521\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i3/2274072695/TB2yQ.6eFXXXXckXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"480\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i2/2274072695/TB2qD.TeFXXXXbrXpXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"468\" width=\"750\" /><img src=\"https://img.alicdn.com/imgextra/i4/2274072695/TB2GORgeVXXXXXAXXXXXXXXXXXX_!!2274072695.jpg\" class=\"\" style=\"border:0px;\" align=\"middle\" height=\"1897\" width=\"750\" /></strong></span></span> \r\n	</p>\r\n</div>');

-- ----------------------------
-- Table structure for gs_store_plate
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_plate`;
CREATE TABLE `gs_store_plate` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastUpdater` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `plateContent` varchar(255) DEFAULT NULL,
  `plateName` varchar(255) DEFAULT NULL,
  `platePosition` varchar(255) DEFAULT NULL,
  `storeId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_store_plate
-- ----------------------------
INSERT INTO `gs_store_plate` VALUES ('402897814f8185bc014f818a31150000', '2015-08-31 10:16:01', 'administrator', 'administrator', '2015-08-31 10:16:01', '0', '2222', '2222', '0', '402897814ed3230d014ed324742f0000');
INSERT INTO `gs_store_plate` VALUES ('402897815174b6d6015174c08b1e0001', '2015-12-06 08:45:54', 'administrator', 'administrator', '2015-12-06 08:45:54', '0', '我是顶部<img src=\"/show/att/download/402897814ef88553014ef8fdb7740002\" />', '顶部1', '1', '402897815123d77f015123dee3910001');
INSERT INTO `gs_store_plate` VALUES ('402897814f680224014f680d10450000', '2015-08-26 11:28:50', 'administrator', 'administrator', '2015-08-29 16:23:59', '1', '1111', '1111', '1', '402897814ed3230d014ed324742f0000');
INSERT INTO `gs_store_plate` VALUES ('402897815174b6d6015174c0db890002', '2015-12-06 08:46:14', 'administrator', 'administrator', '2015-12-06 08:46:14', '0', '我是底部', '底部1', '0', '402897815123d77f015123dee3910001');

-- ----------------------------
-- Table structure for gs_store_warning
-- ----------------------------
DROP TABLE IF EXISTS `gs_store_warning`;
CREATE TABLE `gs_store_warning` (
  `id` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastUpdater` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `storeId` varchar(255) DEFAULT NULL,
  `warningValue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_store_warning
-- ----------------------------
INSERT INTO `gs_store_warning` VALUES ('402897815190361f0151903764540000', '2015-12-11 16:45:28', 'administrator', 'administrator', '2015-12-11 16:52:20', '1', '402897815123d77f015123dee3910001', '20');
