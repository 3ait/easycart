/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : easycart

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-07-08 20:22:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_href` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `position` int(255) DEFAULT '1' COMMENT '1 首页大图切换',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('3', '/resources/banner/banner1466740247.jpg', 'http://localhost:8080/easycart/product/66', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `comment_content` varchar(512) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '皇鹿土产', 'city', '091111111', '公司账户', '1111111111111111111111111');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `phone` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `discount` double NOT NULL DEFAULT '1' COMMENT '折扣：0.95=原价*0.95',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('15', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', '2016-05-20 19:18:35', '2016-05-20 19:18:35');
INSERT INTO `customer` VALUES ('16', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '0.99', '2016-05-20 19:18:35', '2016-05-20 19:18:35');
INSERT INTO `customer` VALUES ('17', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('18', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('19', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('20', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('21', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('22', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('23', '', '', '', '-2be2732670ff4dfb167ff6671307bd82', '1', '1', null, null);
INSERT INTO `customer` VALUES ('24', '', 'leo', '0221828359', '-1ef523c6b645a65441a91fa80df077c2', '1', '1', null, '2016-06-26 11:36:03');
INSERT INTO `customer` VALUES ('25', '', 'aa', '+64221828358', '-2b20fd1f9dbe085463e83ee15cb03ded', '1', '1', null, null);
INSERT INTO `customer` VALUES ('29', null, null, '0221828359', '202cb962ac59075b964b07152d234b70', '0', '1', '2016-06-07 16:53:44', '2016-06-07 16:53:44');
INSERT INTO `customer` VALUES ('30', 'aaa@sina.com', null, '0221828358', '4297f44b13955235245b2497399d7a93', '1', '0.99', '2016-06-28 16:41:45', '2016-07-08 19:43:05');
INSERT INTO `customer` VALUES ('31', '', '皇鹿土产', '091111111', '463f5733f4f01f4caea920a5bf690312', '1', '1', null, null);

-- ----------------------------
-- Table structure for from_address
-- ----------------------------
DROP TABLE IF EXISTS `from_address`;
CREATE TABLE `from_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `from_address` varchar(128) DEFAULT NULL,
  `from_city` varchar(128) DEFAULT '',
  `from_province` varchar(128) DEFAULT '',
  `from_country` varchar(128) DEFAULT '',
  `from_phone` varchar(45) DEFAULT NULL,
  `from_name` varchar(45) DEFAULT NULL,
  `default_address` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `from_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of from_address
-- ----------------------------
INSERT INTO `from_address` VALUES ('8', '15', '', null, null, null, '', '', '1');
INSERT INTO `from_address` VALUES ('16', '24', '保存', null, null, null, '保存电话1', '保存姓名1', null);
INSERT INTO `from_address` VALUES ('17', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('18', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('19', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('20', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('21', '24', '保存', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('22', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('23', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('24', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('25', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('26', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('27', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('28', '24', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', null, null, null, '保存电话1', '保存姓名1', '1');
INSERT INTO `from_address` VALUES ('29', '30', 'city', null, null, null, '091111111', '皇鹿土产', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_cn` varchar(128) NOT NULL,
  `name_en` varchar(128) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '第几级菜单',
  `position` int(11) DEFAULT '0',
  `father_id` int(11) DEFAULT NULL COMMENT '父级菜单',
  `unite_price` double(10,2) DEFAULT '0.00',
  `box_weight` double DEFAULT '0',
  `other_charge` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_en` (`name_en`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '0', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('2', '保健品', 'supplement', '1', '4', null, '6.51', '0.61', '0.0111');
INSERT INTO `menu` VALUES ('4', '羊毛制品', 'woolen', '1', '5', null, '8.50', '0.8', '1');
INSERT INTO `menu` VALUES ('10', '蜂产品', 'honey', '1', '1', null, '5.00', '1', '0');
INSERT INTO `menu` VALUES ('101', '鹿产品', 'deer', '1', '3', null, '10.50', '1', '0');
INSERT INTO `menu` VALUES ('102', '蜂胶', 'propolis', '2', '0', '10', null, null, null);
INSERT INTO `menu` VALUES ('103', '蜂王浆', 'jelly', '2', '1', '10', null, null, null);
INSERT INTO `menu` VALUES ('104', '牛初乳', 'coloctrum', '2', '2', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('105', '鱼油', 'fishoil', '2', '3', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('108', '儿童用品', 'children', '1', '4', null, '4.00', '0', '4');
INSERT INTO `menu` VALUES ('109', '中文名称', 'yingwen', '2', '1', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('110', '蜂王浆', 'fengwangjiang', '2', '1', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('113', '羊毛围巾', 'craft', '2', '2', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('114', '羊毛围巾', 'woolean2', '2', '2', '2', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('118', '蜂巢', 'fengchao', '2', '1', '10', null, null, null);
INSERT INTO `menu` VALUES ('125', '羊毛围巾7', 'wool7', '2', '7', '4', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('127', '羊毛围巾8', 'wool8', '2', '8', '4', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('128', '鹿产品1', 'luchanpin1', '2', '1', '101', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('129', '鹿产品2', 'luchanpin2', '2', '2', '101', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('130', '鹿产品3', 'luchanpin3', '2', '3', '101', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('131', '鹿产品4', 'luchnapin4', '2', '4', '101', '0.00', '0', '0');
INSERT INTO `menu` VALUES ('132', '肉类', 'meat', '1', '5', null, '1.00', '1', '1');
INSERT INTO `menu` VALUES ('133', '肉类1', 'roulei1', '2', '1', '132', null, null, null);
INSERT INTO `menu` VALUES ('134', '奶制品', 'milk', '1', '7', null, '1.00', '1', '1');
INSERT INTO `menu` VALUES ('135', '奶粉', 'milkpowder', '2', '1', '134', null, null, null);

-- ----------------------------
-- Table structure for menu_attr
-- ----------------------------
DROP TABLE IF EXISTS `menu_attr`;
CREATE TABLE `menu_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_attr_name` varchar(128) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_attr_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_attr
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tracking_num` varchar(128) DEFAULT NULL,
  `pay_type` varchar(45) DEFAULT NULL,
  `is_payed` int(11) DEFAULT '0',
  `total_product_price` double DEFAULT NULL,
  `total_freight` double DEFAULT NULL,
  `customer_msg` varchar(512) DEFAULT NULL,
  `admin_msg` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '订单状态（0：下单，1：已付款，2：已发货，3：已收货，4：已完成 5：已取消）',
  `create_time` int(11) DEFAULT NULL,
  `modify_time` int(11) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_phone` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `to_phone` varchar(255) DEFAULT NULL,
  `to_address` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `from_name` (`from_name`),
  KEY `from_phone` (`from_phone`),
  KEY `to_name` (`to_name`),
  KEY `to_phone` (`to_phone`),
  KEY `order_ibfk_2` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('8', '15', null, '', '0', null, null, 'asdfas', 'asdasdf', '1', '1462495085', '1462495085', 'fromname1', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('9', '16', null, '', '1', null, null, '留货20个1111', 'aaaaa111', '4', '1462495515', '1462495515', 'fromname2', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('10', '17', null, '', '0', null, null, '', '', '1', '1464134888', '1464134888', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('11', '18', null, '', '0', null, null, 'asdf', '', '1', '1464142710', '1464142710', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('12', '19', null, '', '0', null, null, '', '', '1', '1464144445', '1464144445', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('13', '20', null, '', '0', null, null, '', '', '1', '1464145283', '1464145283', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('14', '21', null, '', '0', null, null, '', '', '1', '1464145306', '1464145306', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('15', '22', null, '', '0', null, null, '', '', '1', '1464145354', '1464145354', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('16', '23', null, '', '0', null, null, '', '', '1', '1464145602', '1464145602', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('17', '24', null, '', '0', null, null, '客人主动取消订单', '', '5', '1464154139', '1464154139', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('18', '24', null, '', '0', null, null, '客户主动取消订单', '', '5', '1464155844', '1464155844', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('19', '24', null, '', '1', null, null, '客人主动取消订单', '客人主动取消订单', '5', '1464155910', '1464155910', 'fromname', 'fromphone', 'from address', 'toname', 'tophone', 'toaddress', null);
INSERT INTO `order` VALUES ('20', '25', null, '', '1', null, null, '', '', '0', '1464426277', '1464426277', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('21', '24', null, '', '0', null, null, '客人主动取消订单', '', '5', '1464677741', '1464677741', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('22', '24', null, '', '0', null, null, '客人主动取消订单', '', '5', '1464819335', '1464819335', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('23', '24', null, '', '0', null, null, '', '', '0', '1465354067', '1465354067', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('24', '24', null, '', '0', null, null, '', '', '0', '1465354098', '1465354098', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('25', '24', null, '', '0', '0', '1', 'adfasdfa', '', '0', '1465355730', '1465355730', null, null, null, null, null, null, null);
INSERT INTO `order` VALUES ('26', '24', null, '', '1', '0', '2', '', '客人主动取消订单', '0', '1465363028', '1466166895', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', '1111', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('27', '24', null, '', '1', '115.5', '10', '', '', '0', '1466167231', '1466740314', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('28', '24', null, '', '0', '21', '1', '', '', '0', '1466740723', '1466740723', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('29', '24', null, '', '0', '21', '1', '', '', '0', '1466749953', '1466749953', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('30', '24', null, '', '0', '21', '1', '', '', '0', '1466777710', '1466777710', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('31', '24', null, '', '0', '21', '1', '', '', '0', '1466777764', '1466777764', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('32', '24', null, '', '0', '21', '1', '', '', '0', '1466777806', '1466777806', '保存姓名1', '保存电话1', '保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1保存地址1', 'aaa', 'ccc', 'ccc', null);
INSERT INTO `order` VALUES ('33', '30', null, '', '1', '21', '0.99', '', '', '1', '1467856892', '1467891509', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('34', '31', null, '', '0', '21', '1', '', '', '0', '1467892815', '1467892815', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('35', '31', null, '', '0', '21', '1', '', '', '0', '1467893146', '1467893146', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('36', '31', null, '', '0', '21', '1', '', '', '0', '1467893170', '1467893170', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('37', '31', null, '', '0', '21', '1', '', '', '0', '1467893261', '1467893261', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('38', '31', null, '', '0', '21', '1', '', '', '0', '1467893371', '1467893371', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('40', '31', null, '', '0', '21', '1', '', '', '0', '1467894264', '1467894264', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('41', '31', null, '', '0', '21', '1', '', '', '0', '1467894817', '1467894817', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('42', '30', null, '', '0', '21', '0.99', '', '', '0', '1467935352', '1467935352', '皇鹿土产', '091111111', 'city', 'aa', 'aa', 'aa', null);
INSERT INTO `order` VALUES ('43', '30', null, '', '0', '21', '0.99', '', '', '0', '1467963841', '1467963841', '皇鹿土产', '091111111', 'city', 'aa', '111', 'aa', null);

-- ----------------------------
-- Table structure for order_record
-- ----------------------------
DROP TABLE IF EXISTS `order_record`;
CREATE TABLE `order_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_record_ibfk_1` (`customer_id`),
  KEY `order_record_ibfk_2` (`order_id`),
  KEY `order_record_ibfk_3` (`product_id`),
  CONSTRAINT `order_record_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_record_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_record_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_record
-- ----------------------------
INSERT INTO `order_record` VALUES ('4', '15', '8', '2', '1', '45.00');
INSERT INTO `order_record` VALUES ('5', '16', '9', '2', '1', '45.00');
INSERT INTO `order_record` VALUES ('6', '18', '11', '2', '2', '2.00');
INSERT INTO `order_record` VALUES ('7', '19', '12', '2', '2', '2.00');
INSERT INTO `order_record` VALUES ('8', '20', '13', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('9', '21', '14', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('10', '22', '15', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('11', '22', '15', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('12', '23', '16', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('13', '23', '16', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('14', '24', '17', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('15', '24', '17', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('16', '24', '18', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('17', '24', '18', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('18', '24', '19', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('19', '24', '19', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('20', '25', '20', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('21', '24', '21', '67', '2', '1.00');
INSERT INTO `order_record` VALUES ('22', '24', '22', '2', '1', '2.00');
INSERT INTO `order_record` VALUES ('23', '24', '23', '8', '1', '8.00');
INSERT INTO `order_record` VALUES ('24', '24', '25', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('25', '24', '26', '66', '2', '1.00');
INSERT INTO `order_record` VALUES ('26', '24', '27', '68', '2', '5.00');
INSERT INTO `order_record` VALUES ('27', '24', '28', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('28', '24', '29', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('29', '24', '30', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('30', '24', '31', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('31', '24', '32', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('32', '30', '33', '67', '1', '1.00');
INSERT INTO `order_record` VALUES ('33', '31', '34', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('34', '31', '35', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('35', '31', '36', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('36', '31', '37', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('37', '31', '38', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('39', '31', '40', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('40', '31', '41', '66', '1', '1.00');
INSERT INTO `order_record` VALUES ('41', '30', '42', '67', '1', '1.00');
INSERT INTO `order_record` VALUES ('42', '30', '43', '67', '1', '1.00');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_brand_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `product_lable` varchar(128) DEFAULT NULL,
  `mpn` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `product_name_cn` varchar(128) DEFAULT NULL,
  `product_name_en` varchar(128) DEFAULT NULL,
  `price1` double NOT NULL DEFAULT '0',
  `price2` double DEFAULT '0',
  `price3` double DEFAULT '0',
  `price4` double DEFAULT '0',
  `cost` double DEFAULT '0',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 下线 1 上线 2缺货',
  `hot` tinyint(4) DEFAULT '0' COMMENT '热销产品',
  `promote` tinyint(4) DEFAULT '0' COMMENT '促销产品',
  `front_page` tinyint(4) DEFAULT '0' COMMENT '首页显示',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '推荐产品',
  `sold_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  `weight` double DEFAULT '0',
  `memo` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_ibfk_1` (`product_brand_id`),
  KEY `menu_id` (`menu_id`),
  KEY `mpn` (`mpn`),
  KEY `product_lable` (`product_lable`),
  KEY `product_name_cn` (`product_name_cn`),
  KEY `product_name_en` (`product_name_en`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, '102', '蜂蜜 迈努卡', '123456789', '1', '康维他500g', 'kangweita', '1', null, null, null, '22.5', '0', '1', '1', '0', '0', '2', '1', null, '0.5', '缺货中，特价！');
INSERT INTO `product` VALUES ('2', null, '102', '蜂蜜 迈努卡', '123456789', '0', '康维他1000g', 'kangweita', '2', null, null, null, '0', '2', '1', '0', '0', '1', '0', '2', null, '0.5', '');
INSERT INTO `product` VALUES ('3', null, '102', '蜂蜜 迈努卡', '123456789', '0', '康维他1500g', 'kangweita', '3', null, null, null, null, '1', '1', '0', '0', '1', '0', '3', null, '0.5', null);
INSERT INTO `product` VALUES ('4', null, '102', '蜂蜜 迈努卡', '123456789', '0', '康维他2500g', 'kangweita', '4', null, null, null, null, '1', '1', '0', '0', '1', '0', '4', null, '0.5', null);
INSERT INTO `product` VALUES ('5', null, '102', '蜂蜜 迈努卡', '123456789', '0', '蜜纽康500g', 'kangweita', '5', null, null, null, null, '1', '0', '1', '0', '1', '0', '5', null, '0.5', null);
INSERT INTO `product` VALUES ('6', null, '102', '蜂蜜 迈努卡', '123456789', '0', '蜜纽康1000g', 'kangweita', '6', null, null, null, null, '1', '0', '1', '0', '1', '0', '6', null, '0.5', null);
INSERT INTO `product` VALUES ('7', null, '102', '蜂蜜 迈努卡', '123456789', '0', '蜜纽康1500g', 'kangweita', '7', null, null, null, null, '1', '0', '1', '0', '1', '0', '7', null, '0.5', null);
INSERT INTO `product` VALUES ('8', null, '102', '蜂蜜 迈努卡', '123456789', '0', '蜜纽康2000g', 'kangweita', '8', null, null, null, null, '2', '0', '1', '0', '1', '0', '8', null, '0.5', null);
INSERT INTO `product` VALUES ('14', null, '128', '', '', null, '', '', '9', null, null, null, null, null, null, null, null, null, null, '9', null, '0.5', '');
INSERT INTO `product` VALUES ('16', '7', '128', '', '', null, 'aa', 'bb', '10', null, null, null, null, null, null, null, null, null, null, '10', null, '0.5', 'cc');
INSERT INTO `product` VALUES ('20', '8', '128', '', '', '0', 'asdfasdf', 'asdf', '11', null, null, null, '0', '0', '0', '0', '0', '0', '0', '11', null, '0.5', '');
INSERT INTO `product` VALUES ('24', '7', '128', '', '', null, 'asdfa', 'asdf', '12', null, null, null, null, null, null, null, null, null, null, '12', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('27', '7', '128', '1', '1', '1', 'asdfasdf', 'asdfff', '13', null, null, null, '1', null, null, null, null, null, '1', '13', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('32', '7', '128', 'aaa', 'aaa', '1', 'asdfasdf', 'asdf', '14', null, null, null, '1', null, null, null, null, null, '1', '14', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('33', '7', '128', 'aaa', 'aaa', '1', 'asdfasdf', 'asdf', '15', null, null, null, '1', null, null, null, null, null, '1', '15', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('34', '7', '128', 'aaa', 'aaa', '1', 'asdfasdf', 'asdf', '16', null, null, null, '1', null, null, null, null, null, '1', '16', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('35', '7', '128', 'aaa', 'aaa', '1', 'asdfasdf', 'asdf', '17', null, null, null, '1', null, null, null, null, null, '1', '17', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('38', '7', '128', '', '', null, 'aasf', 'asdf', '18', null, null, null, null, null, null, null, null, null, null, '18', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('40', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '19', null, null, null, null, null, null, null, null, null, null, '19', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('41', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '20', null, null, null, null, null, null, null, null, null, null, '20', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('42', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '21', null, null, null, null, null, null, null, null, null, null, '21', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('43', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '22', null, null, null, null, null, null, null, null, null, null, '22', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('44', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '23', null, null, null, null, null, null, null, null, null, null, '23', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('45', '7', '128', '', '', null, '阿斯蒂芬', 'eee', '24', null, null, null, null, null, null, null, null, null, null, '24', null, '0.5', '阿斯蒂芬');
INSERT INTO `product` VALUES ('46', '8', '128', '', '', null, '中文名称', 'en', '25', null, null, null, null, null, null, null, null, null, null, '25', null, '0.5', 'ttt');
INSERT INTO `product` VALUES ('47', '8', '128', '', '', null, '中文名称', 'en', '26', null, null, null, null, null, null, null, null, null, null, '26', null, '0.5', 'ttt');
INSERT INTO `product` VALUES ('50', '7', '128', '', '', null, 'a\'s\'d\'fa', 'enname', '27', null, null, null, null, null, null, null, null, null, null, '27', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('51', '7', '128', '', '', null, 'a\'s\'d\'fa', 'enname', '28', null, null, null, null, null, null, null, null, null, null, '28', null, '0.5', 'asdf');
INSERT INTO `product` VALUES ('52', '7', '128', '111', '111', '3', 'a\'s\'d\'fa', 'enname', '28', null, null, null, '2', null, null, null, null, null, '4', '1463121205', '1463121205', '0.5', 'asdf');
INSERT INTO `product` VALUES ('53', '7', '128', '111', '111', '3', 'a\'s\'d\'fa', 'enname', '28', null, null, null, '2', null, null, null, null, null, '4', '1463121480', '1463121480', '0.5', 'asdf');
INSERT INTO `product` VALUES ('54', '7', '128', '', '', null, 'asdfasdf', 'asdfas', '28', null, null, null, null, null, null, null, null, null, null, '1463365955', '1463365955', '0.5', 'asdf');
INSERT INTO `product` VALUES ('55', '7', '128', '', '', null, 'asdfasdf', 'asdfas', '28', null, null, null, null, null, null, null, null, null, null, null, '1463557975', '0.5', 'asdf');
INSERT INTO `product` VALUES ('56', '7', '128', '', '', null, 'asdfasdf', 'asdfas', '28', null, null, null, null, null, null, null, null, null, null, '1463366380', '1463366380', '0.5', 'asdf');
INSERT INTO `product` VALUES ('59', '7', '128', '1', '1', '1', 'asdfasdf', 'asdf', '1', null, null, null, '1', '1', '0', '0', '0', '0', '1', '1463367972', '1463367972', '0.5', 'asdf');
INSERT INTO `product` VALUES ('60', '7', '128', '1', '1', '1', 'asdfasdf', 'asdf', '1', null, null, null, '1', '1', '1', '0', '0', '1', '1', '1463368028', '1463368028', '0.5', 'asdf');
INSERT INTO `product` VALUES ('62', '7', '128', '1', '11', '1', '鹿茸', 'lurong', '1', null, null, null, '1', '1', '0', '0', '0', '0', '1', '1463371110', '1463371110', '0.5', 'asdf');
INSERT INTO `product` VALUES ('63', '7', '128', '1', '1', '1', 'asdfasdf', 'asdf', '1', null, null, null, '1', '0', '1', null, null, '1', '1', '1463553510', '1463553510', '0.5', 'asdf');
INSERT INTO `product` VALUES ('64', '7', '128', '1', '1', '1', 'asdfasdf', 'asdf', '1', null, null, null, '1', '0', '1', null, null, '1', '1', '1463556693', '1463556693', '0.5', 'asdf');
INSERT INTO `product` VALUES ('65', '7', '128', '2', '1', '1', 'asdfasdf', 'asdf', '1', null, null, null, '1', '0', '1', null, null, '1', '1', '1463556709', '1463556709', '0.5', 'asdf');
INSERT INTO `product` VALUES ('66', '7', '128', '3', '1', '1', 'a\'s\'d\'fa\'s\'dasdfasdf', 'asdf', '1', null, null, null, '1', '1', '1', '1', '1', '1', '1', null, '1463558317', '0.5', 'asdf');
INSERT INTO `product` VALUES ('67', '7', '128', '1', '1', '1', '测试3', 'ceshi3', '1', null, null, null, '1', '2', null, null, '1', '1', '1', null, '1466561195', '1', 'asdf ');
INSERT INTO `product` VALUES ('68', '7', '128', '5', '5', '5', '测试5', '555', '5', null, null, null, '5', '0', '1', '1', '1', '1', '1', null, '1466558387', '5', '5');
INSERT INTO `product` VALUES ('69', '19', '102', '', '', null, '蜂胶产品', 'fengjiao', '5', null, null, null, null, '1', null, null, null, null, null, '1466656584', '1466656584', null, '蜂胶产品备注');
INSERT INTO `product` VALUES ('70', '8', '129', '鹿茸', '', '1', '鹿产品测试', 'luchanpin', '0', null, null, null, '0', '0', '0', '0', '0', '0', '0', '1466656649', '1466656649', '1', '鹿产品备注');
INSERT INTO `product` VALUES ('71', '20', '135', '', '', '2', '安家1', 'anjiatest 11122', '1', null, null, null, '1', '1', '0', '0', '0', '0', '0', null, '1467958199', '1', '备注  ');

-- ----------------------------
-- Table structure for product_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_attr`;
CREATE TABLE `product_attr` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_brand_id` int(11) NOT NULL,
  `menu_attr_id` int(10) unsigned NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_brand_id` (`product_brand_id`),
  KEY `menu_attr_id` (`menu_attr_id`),
  CONSTRAINT `product_attr_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_attr_ibfk_2` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`),
  CONSTRAINT `product_attr_ibfk_3` FOREIGN KEY (`menu_attr_id`) REFERENCES `menu_attr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attr
-- ----------------------------

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name_cn` varchar(128) DEFAULT NULL,
  `brand_name_en` varchar(128) DEFAULT NULL,
  `brand_img_url` varchar(512) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_brand_ibfk_1` (`menu_id`),
  CONSTRAINT `product_brand_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
INSERT INTO `product_brand` VALUES ('1', '康维他', null, null, '1');
INSERT INTO `product_brand` VALUES ('5', '羊毛1', 'yangmao1', null, '4');
INSERT INTO `product_brand` VALUES ('6', '羊毛2', 'yangmao2', null, '4');
INSERT INTO `product_brand` VALUES ('7', '鹿产品品牌1', 'pinpai1', null, '101');
INSERT INTO `product_brand` VALUES ('8', '鹿产品品牌2', 'pinpai2', null, '101');
INSERT INTO `product_brand` VALUES ('9', '鹿产品品牌3', 'pinpai3', null, '101');
INSERT INTO `product_brand` VALUES ('19', 'aa', 'aa', null, '10');
INSERT INTO `product_brand` VALUES ('20', '安家', 'ankor', null, '134');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,自增',
  `product_id` int(11) NOT NULL,
  `img_type` enum('list','detail','desc') NOT NULL,
  `position` int(11) DEFAULT NULL,
  `default_img` tinyint(4) DEFAULT '0',
  `href` varchar(512) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('1', '1', 'list', null, '1', '/resources/product_img/honey01_list.jpg', null);
INSERT INTO `product_img` VALUES ('2', '2', 'list', '1', '1', '/resources/product_img/honey01_list.jpg', null);
INSERT INTO `product_img` VALUES ('4', '1', 'list', null, '1', '/resources/product_img/honey02_list.jpg', null);
INSERT INTO `product_img` VALUES ('5', '2', 'list', null, '1', '/resources/product_img/honey02_list.jpg', null);
INSERT INTO `product_img` VALUES ('36', '51', 'desc', '0', '1', '/resources/product_img/20160513/51_desc.jpg', null);
INSERT INTO `product_img` VALUES ('37', '51', 'desc', '0', '1', '/resources/product_img/20160513/52_desc.jpg', null);
INSERT INTO `product_img` VALUES ('38', '59', 'list', '0', '1', '/resources/product_img/20160516/59_list.jpg', null);
INSERT INTO `product_img` VALUES ('39', '59', 'list', '0', '1', '/resources/product_img/20160516/60_list.jpg', null);
INSERT INTO `product_img` VALUES ('43', '62', 'list', '0', '1', '/resources/product_img/20160516/63_list.jpg', null);
INSERT INTO `product_img` VALUES ('44', '64', 'list', '0', '1', '/resources/product_img/20160518/64_list.jpg', null);
INSERT INTO `product_img` VALUES ('45', '64', 'list', '0', '1', '/resources/product_img/20160518/65_list.jpg', null);
INSERT INTO `product_img` VALUES ('46', '65', 'list', '0', '1', '/resources/product_img/20160518/65_list.jpg', null);
INSERT INTO `product_img` VALUES ('48', '66', 'list', '0', '1', '/resources/product_img/20160518/66_list.jpg', null);
INSERT INTO `product_img` VALUES ('50', '55', 'desc', '0', '1', '/resources/product_img/20160518/55_desc.jpg', null);
INSERT INTO `product_img` VALUES ('51', '55', 'desc', '0', '1', '/resources/product_img/20160518/56_desc.jpg', null);
INSERT INTO `product_img` VALUES ('52', '55', 'desc', '0', '1', '/resources/product_img/20160518/55_desc.jpg', null);
INSERT INTO `product_img` VALUES ('53', '55', 'desc', '0', '1', '/resources/product_img/20160518/56_desc.jpg', null);
INSERT INTO `product_img` VALUES ('54', '55', 'desc', '0', '1', '/resources/product_img/20160518/55_desc.jpg', null);
INSERT INTO `product_img` VALUES ('55', '55', 'desc', '0', '1', '/resources/product_img/20160518/56_desc.jpg', null);
INSERT INTO `product_img` VALUES ('59', '66', 'desc', '0', '1', '/resources/product_img/20160518/66_desc.jpg', null);
INSERT INTO `product_img` VALUES ('60', '67', 'list', '0', '1', '/resources/product_img/20160518/67_list.jpg', null);
INSERT INTO `product_img` VALUES ('61', '69', 'list', '0', '1', '/resources/product_img/20160623/69_list1466656584.jpg', null);
INSERT INTO `product_img` VALUES ('62', '69', 'desc', '0', '1', '/resources/product_img/20160623/69_desc1466656584.png', null);
INSERT INTO `product_img` VALUES ('63', '70', 'list', '0', '1', '/resources/product_img/20160623/70_list1466656649.jpg', null);
INSERT INTO `product_img` VALUES ('64', '70', 'desc', '0', '1', '/resources/product_img/20160623/70_desc1466656649.png', null);
INSERT INTO `product_img` VALUES ('65', '71', 'list', '0', '1', '/resources/product_img/20160624/71_list1466740092.jpg', null);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for to_address
-- ----------------------------
DROP TABLE IF EXISTS `to_address`;
CREATE TABLE `to_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `to_address` varchar(128) DEFAULT NULL,
  `to_city` varchar(128) DEFAULT '',
  `to_province` varchar(128) DEFAULT '',
  `to_country` varchar(128) DEFAULT '',
  `to_phone` varchar(45) DEFAULT NULL,
  `to_name` varchar(45) DEFAULT NULL,
  `default_address` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `to_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of to_address
-- ----------------------------
INSERT INTO `to_address` VALUES ('1', '30', 'aa', null, null, null, 'aa', 'aa', null);
INSERT INTO `to_address` VALUES ('2', '30', 'aa', null, null, null, 'aa', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test@test.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1');
INSERT INTO `user` VALUES ('4', 'test1@test.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `user` VALUES ('5', 'test2@test.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `user` VALUES ('6', 'test3@test.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1');
INSERT INTO `user` VALUES ('7', '', 'd41d8cd98f00b204e9800998ecf8427e', '1', '0');
