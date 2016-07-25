-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: easycart
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_href` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `position` int(255) DEFAULT '1' COMMENT '1 首页大图切换',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (4,'/resources/banner/banner1468361948.jpg','http://45.79.98.47:8080/royaldeer/product/85',1),(12,'/resources/banner/banner1468455106.jpg','http://45.79.98.47:8080/royaldeer/list/Wool%20Product',1),(14,'/resources/banner/banner1468546273.PNG','http://45.79.98.47:8080/royaldeer/product/76',1),(18,'/resources/banner/banner1468726267.jpg','http://45.79.98.47:8080/royaldeer/product/133',1),(20,'/resources/banner/banner1468728885.jpg','http://45.79.98.47:8080/royaldeer/product/118',1);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `comment_content` varchar(512) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Royal Deer of New Zealand','65 Wakefield Street, Auckland Central, New Zealand','0064-9-3031619','Royal Deer of New Zealand','ASB BANK 12-3037-0427423-50');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (31,'zhuyoumeimei@hotmail.com',NULL,'0273047888','e10adc3949ba59abbe56e057f20f883e',1,0.6,'2016-07-13 23:43:57','2016-07-19 09:43:00'),(32,NULL,NULL,'0211803929','e10adc3949ba59abbe56e057f20f883e',1,0.9,'2016-07-14 03:54:59','2016-07-14 04:19:24'),(33,'anjie@3a.co.nz',NULL,'0210406582','9f9a37c41205a57d1ee4687414a7d899',1,0.99,'2016-07-22 09:17:31','2016-07-22 09:17:31');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `from_address`
--

DROP TABLE IF EXISTS `from_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `from_address`
--

LOCK TABLES `from_address` WRITE;
/*!40000 ALTER TABLE `from_address` DISABLE KEYS */;
INSERT INTO `from_address` VALUES (29,31,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',NULL),(30,31,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'0273984765','Royal Deer of New Zealand',NULL),(32,32,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',NULL),(33,32,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',1);
/*!40000 ALTER TABLE `from_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (136,'營養保健品','Health Product',1,1,0,6.00,0.5,1),(137,'美容品','Beauty',1,2,0,6.00,0.5,1),(138,'羊毛制品','Wool Product',1,3,0,8.50,0.8,1),(139,'其他','other',1,4,0,6.00,0.5,1),(141,'蜂產品','Bee Product',2,2,136,NULL,NULL,NULL),(143,'家庭保養品','Product for Family',2,4,136,NULL,NULL,NULL),(146,'護膚品','skincare',2,3,137,NULL,NULL,NULL),(147,'羊皮整皮','sheepskin rug',2,2,138,NULL,NULL,NULL),(152,'保健品','healthy',2,2,139,NULL,NULL,NULL),(153,'奶制品','Dairy product',2,5,136,NULL,NULL,NULL),(154,'女性保養品','Product for Women',2,3,136,NULL,NULL,NULL),(155,'兒童保養品','Product for Kids',2,6,136,NULL,NULL,NULL),(156,'中老年保養品','Product for Senior',2,7,136,NULL,NULL,NULL),(157,'嬰兒護膚品','Skincare for Baby',2,4,137,NULL,NULL,NULL),(158,'面膜類','Mask',2,5,137,NULL,NULL,NULL),(159,'洗護用品','Cleansing prodcuts',2,6,137,NULL,NULL,NULL),(160,'羊毛被','Wool Duvet',2,1,138,NULL,NULL,NULL),(161,'羊毛衣','Wool Sweater',2,3,138,NULL,NULL,NULL),(162,'羊皮毛鞋','Slipper and  Boot',2,4,138,NULL,NULL,NULL),(163,'羊皮坐墊','Sheepskin Cushion',2,5,138,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_attr`
--

DROP TABLE IF EXISTS `menu_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_attr_name` varchar(128) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_attr_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_attr`
--

LOCK TABLES `menu_attr` WRITE;
/*!40000 ALTER TABLE `menu_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (33,31,NULL,'',0,24,1.7999999999999998,'','asd',0,1468455036,1468455818,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(34,31,NULL,'',0,12,0.6,'','',0,1468455816,1468455816,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(35,31,NULL,'',0,9,0.6,'skdka','',0,1468461274,1468461274,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(36,31,NULL,'',0,15,4.08,'','',0,1468462230,1468462230,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(37,31,NULL,'',0,9,0.6,'','',0,1468462661,1468462661,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(38,31,NULL,'',0,27,108,'','',0,1468463629,1468463629,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(39,31,NULL,'',0,1.2,15,'','',0,1468465607,1468465607,'Royal Deer of New Zealand','0273984765','65 Wakefield Street, Auckland Central, New Zealand','ff','0273047888','12 a rd',NULL),(40,32,NULL,'',0,135,10.2,'','',0,1468470470,1468470470,'Royal Deer of New Zealand','006493031619','65 Wakefield Street, Auckland Central, New Zealand','Leo','021123456','中欧',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_record`
--

DROP TABLE IF EXISTS `order_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_record`
--

LOCK TABLES `order_record` WRITE;
/*!40000 ALTER TABLE `order_record` DISABLE KEYS */;
INSERT INTO `order_record` VALUES (32,31,33,79,3,1.00),(33,31,34,85,1,1.00),(34,31,35,85,1,1.00),(35,31,36,86,1,5.80),(36,31,36,87,1,1.00),(37,31,37,85,1,1.00),(38,31,38,97,10,18.00),(39,31,39,85,1,1.00),(40,31,39,87,1,1.00),(41,32,40,95,6,25.00);
/*!40000 ALTER TABLE `order_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_brand_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `product_lable` varchar(128) DEFAULT NULL,
  `mpn` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `product_name_cn` varchar(128) DEFAULT NULL,
  `product_name_en` varchar(128) DEFAULT NULL,
  `price1` double NOT NULL DEFAULT '0.99',
  `price2` double DEFAULT NULL,
  `price3` double DEFAULT NULL,
  `price4` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 下线 1 上线 2缺货',
  `hot` tinyint(4) DEFAULT '0' COMMENT '热销产品',
  `promote` tinyint(4) DEFAULT '0' COMMENT '促销产品',
  `front_page` tinyint(4) DEFAULT '0' COMMENT '首页显示',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '推荐产品',
  `sold_num` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `modify_time` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (72,21,141,'蜂蜜，MegaMax','1',1,'MegaMax抗氧化活性5+混合蜂蜜1kg','MegaMax抗氧化活性5+混合蜂蜜1kg',25,NULL,NULL,NULL,1,1,1,1,1,1,1,1468126788,1468126788,1,'MEAMAX抗氧化活性5+混合蜂蜜是從紐西蘭特有的蔓奴卡茶樹上的小白花天然採集的花蜜,含有一種獨特的抗菌活性因子,有助我們的咽喉和胃腸健康.'),(73,21,141,'','',1,'优质蜂皇浆 高浓度16毫克10HDA 365粒','Mega Royal Jelly 365 ',110,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1468727703,1,''),(74,21,143,'','',1,'卵磷脂1200mg 300粒','MegaMax Lecithin 1200mg 300',23,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1468550716,1,''),(75,21,143,'','',1,'深海魚油 400粒家庭装','MegaMax Omega 3',23,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1468550703,1,''),(76,22,146,'羊胎素天然精華液','',1,'羊胎素天然有机精華液','PPS ORGANIC New Zealand Placenta Serum with Rose oil',150,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1469338082,1,'<div>PPS羊胎素天然精華液,得天獨厚的天然美容護膚聖品.PPS羊胎素,精選自新西蘭CERTIFIED ORGANIC FARM,成分天然,不可多得,配合六勝肽,南極海醣蛋白,活性蔓努卡蜂蜜和玫瑰果油等天然成分,24小時,專業護理皮膚.被譽為不用打針的新一代\"除皺之王.\"</div><div><br></div><div>本品無添加苯甲酸脂,無防腐劑,無人工色素和香料,無礦物油.讓你的美麗純潔無暇.</div><div><br></div><div>使用方法:每天早晚清潔和按摸皮膚後塗抹於臉部,特別是眼部皮膚和皺紋處.</div><div>1套5毫升X6支</div>'),(77,NULL,146,'','',1,'羊胎素日夜面霜 ','I CARE PLACENTO DAY & NIGHT CREAM',1,NULL,NULL,NULL,1,1,NULL,NULL,NULL,1,1,NULL,1468127861,1,''),(78,NULL,146,'','',1,'高級膠原蛋白抗皺面霜','La reine Collagen Cream with Royal Jelly',12,NULL,NULL,NULL,1,1,0,0,0,0,1,NULL,1468127852,1,''),(79,22,146,'','',1,'高級羊胎素修復面霜','Placenta Repairing cream',25,NULL,NULL,NULL,1,1,0,0,0,0,1,NULL,1468128029,1,''),(80,24,147,'','',1,'BOWRON羊皮 兩拼金星','BOWRON',265,NULL,NULL,NULL,1,1,0,0,0,0,1,NULL,1468455386,2,''),(81,24,147,'','',1,' BOWRON羊皮 八拼金星','BOWRON',895,NULL,NULL,NULL,1,1,0,0,0,0,1,NULL,1468455334,8,''),(82,24,147,'','',1,'BOWRON羊皮 六拼金星','BOWRON',1,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,1,1468128502,1468128502,1,''),(83,24,147,'','',3,'BOWRON羊皮 六拼金星','BOWRON',695,NULL,NULL,NULL,1,1,0,0,0,0,1,NULL,1468455276,6,''),(84,21,156,'Sealongpou海龍寶精粹','',60,'Mega Sealongpou III 海龍寶精粹III號','Mega Sealongpou III',99,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1468716601,0.3,''),(85,21,154,'美中顏羊胎素','',100,'Mega Recell II 美中顏口服活性羊胎素60粒','Mega Recell II 60\'s Soft Gel',32,NULL,NULL,NULL,1,1,NULL,1,1,NULL,1,NULL,1468717065,0.5,''),(86,27,141,'Streamland','1',1,'Streamland新溪岛柠檬蜂蜜 500克','Streamland',5.8,NULL,NULL,NULL,1,1,NULL,NULL,1,1,1,NULL,1468461548,1,''),(87,25,152,'','',1,'Swisse胶原蛋白液500ml','Swisse',1,NULL,NULL,NULL,1,1,0,1,1,0,1,1468363427,1468363427,1,''),(88,25,152,'','',1,'Swisse抗衰老滋养祛黑眼圈眼霜15ml','Swisse',1,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,1,NULL,1468550187,1,''),(89,27,141,'','',1,'Streamland新溪岛麦卢卡UMF5+蜂蜜 500g','Streamland',1,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,1468364094,1,''),(90,28,143,'','',1,'Nutralife纽乐三倍浓缩深海鱼油90粒一天一片','Nutralife',30,NULL,NULL,NULL,1,2,1,0,1,0,1,1468364264,1468364264,1,''),(91,28,143,'','',100,'Nutralife纽乐 深海鱼油 1500mg 180粒','Nutralife',28,NULL,NULL,NULL,1,0,0,0,1,0,1,NULL,1468467397,1,''),(92,21,156,'','9419236001100',200,'南極魚寶 Mega GSD','Mega GSD High Concernstration Fish Oil',60,NULL,NULL,NULL,0.2,1,1,NULL,1,NULL,1,NULL,1468549992,0.2,'南極魚寶GSD: 魚油中之極品,高濃縮DHA和EPA,及有效地配合植物中的OMEGA 3,6,9. 確保品質天然純正,保証DHA高達50%,EPA20%,為普通魚油的4倍以上. 對高血脂,高膽固醇,腦血栓,心臟病有獨特的功用.,南極魚寶是紐西蘭市場中不可多得的高質魚油.多年來得到顧客肯定,是追求高品質魚油人士最優選擇. 2013年新装上市~建議服用量: 每日一粒60粒装 1000毫克'),(93,21,154,'','9419236000103',100,'紐西蘭鹿血胶囊 500粒','Deer Blood Soft Gel 500\'s',65,NULL,NULL,NULL,0,1,0,1,1,0,0,NULL,1468459855,1,''),(94,31,141,'康維他麥蘆卡蜂蜜','',60,'康維他麥蘆卡蜂蜜UMF15+250克','Comvita Manuka Honey UMF15+ 250gm',119,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468548621,0.5,''),(95,21,141,'活性蜂膠 ','9419236000103',100,'活性蜂膠 1000毫克 60粒','Mega Propolis 60\'s',25,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1468728405,0.2,'活性蜂膠 1000毫克 60粒'),(96,31,141,'康維他麥蘆卡蜂蜜','',60,'康維他麥蘆卡蜂蜜UMF10+ 500克','Comvita Manuka Honey UMF10+ 500gm',90,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468548784,0.8,''),(97,21,154,'','9419236001230',200,'Mega月見草膠囊1000毫克 100粒','Evening Primrose Oil EPO 100\'s',18,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1468459666,0.4,'Mega月見草膠囊1000毫克 100粒'),(98,31,141,'','',100,'康維他麥蘆卡蜂蜜UMF5+ 500克','Comvita Manuka Honey UMF 5+ 500gm',50,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468548817,0.8,''),(99,21,155,'','',200,'高鈣牛初乳小熊300片','Mega Colostrum Bear 300\'s chewable',30,NULL,NULL,NULL,NULL,1,1,1,1,NULL,NULL,NULL,1469333103,0.4,'我們採用紐西蘭自然放養的健康奶牛所產的初乳為原料,被譽為世界上最純淨的,最高級的初乳原料.以確保牛初乳中的IgG免疫蛋白的高含量和活性.本品可增強人體免疫力, 抵抗各種流行性疾病, 有助於兒童的胃腸道功能,並可補鈣和營養素。本品含鈣高於普通牛初乳片.'),(100,21,156,'','',100,'液體鹿骨高鈣60粒','Mega CALEPO 60\'s',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1469336907,0.2,'<div><font color=\"#535353\"><span style=\"font-size: 20px; line-height: 22px;\">精選紐西蘭鹿骨原料,為有機鈣質,採用現代科技加工為液體鹿鈣,胃腸吸收率高,含有豐富的鐵,磷,鋅,鎂等微量元素和月見草油,可預防骨質疏鬆及風濕骨痛,增強手力和腿力.</span></font></div><div><font color=\"#535353\"><span style=\"font-size: 20px; line-height: 22px;\">每日飯后2-3 粒</span></font></div><div><font color=\"#535353\"><span style=\"font-size: 20px; line-height: 22px;\"><br></span></font></div><div><font color=\"#535353\"><span style=\"font-size: 20px; line-height: 22px;\">60粒装</span></font></div>'),(101,21,155,'','',100,'可口型牛初乳300片','Colostrum Plus 300 chewable',20,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1469335178,0.5,'<div>Colostrum Plus 可口型牛初乳300片</div><div>牛初乳片:天然營養免疫精華,紐西蘭的牛初乳含有優質的免疫蛋白和成長因子,長期服用可強化免疫力,幫助抵抗病菌,促進健康,本品香甜可口.</div><div>每日4-6粒.</div><div><br></div><div>Colostrum Plus: 300粒装</div>'),(102,51,162,'','',NULL,'EMU雪地靴低幫','EMU Stinger Mini',135,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468466525,1468466525,1.5,'EMU雪地靴低幫'),(103,51,162,'EMU雪地靴','',200,'EMU雪地靴中筒','EMU Stinger Lo Ugg Boot',163,NULL,NULL,NULL,NULL,1,1,1,1,NULL,NULL,NULL,1468550363,1.2,''),(104,21,143,'角鯊稀','9419236000028',200,'Mega 角鯊稀100粒1000毫克','Mega Squalene 100s',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1469329888,0.2,'<table border=\"0\" align=\"center\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15.6px; width: 554px; background-color: rgb(255, 255, 255);\"><tbody><tr><td rowspan=\"1\"><p style=\"margin: 1em 0px; padding: 0px;\">紐西蘭純淨的深海角鯊稀油,<br>增強體質,對滋潤皮膚,心臟病,糖尿病,肝病,胃炎,流感等有效用,並可調理內臟機能。<br><br>100粒装1000毫克/粒</p><span style=\"font-style: italic;\"></span></td></tr><tr></tr></tbody></table><br>'),(105,21,154,'蜂膠牙膏','9419236001940',200,'MegaMax 蜂膠牙膏100克','MegaMax  Propolis Toothpaste 100gm',6,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468547040,0.2,''),(106,51,162,'雪地靴高筒','9419236000028',200,'EMU 雪地靴高筒Stinger HI Ugg Boot','EMU Stinger HI Ugg Boot',185,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468547486,1.8,''),(107,31,141,'康維他麥蘆卡蜂蜜','',100,'康維他麥蘆卡蜂蜜UMF5+ 1公斤','Comvita Manuka Honey UMF 5+ 1Kg',90,NULL,NULL,NULL,NULL,1,1,NULL,1,NULL,NULL,NULL,1468550040,1.2,''),(108,31,141,'','',30,'康維他麥蘆卡蜂蜜UMF18+ 250克','Comvita Manuka Honey UMF18+ 250gm',165,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468548993,1468548993,0.5,''),(109,31,141,'潤喉糖','',30,'康維他麥蘆卡蜂蜜潤喉糖 檸檬味500克','Comvita Manuka Honey UMF10+ Lozenges 500gm Lenmon',39,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468549337,1468549337,0.8,''),(110,31,141,'潤喉糖500克','',20,'康維他麥蘆卡蜂蜜潤喉糖500克薄荷味','Comvita Manuka Honey UMF10+ Lozenges 500gm Mint',39,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468549608,1468549608,0.8,''),(111,45,146,'皇家花蜜蜂毒','',20,'Royal Nectar皇家花蜜蜂毒眼霜15克','Royal Nectar Bee Venom Eye cream 15gm',35,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468553616,0.5,''),(112,31,141,'潤喉糖','',15,'康維他麥蘆卡蜂蜜潤喉糖橄欖味500克','Comvita Manuka Honey UMF10+ Lozenges 500gm Olive',39,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468549831,1468549831,0.8,''),(113,45,158,'蜂毒面膜','',100,'Royal Nectar皇家花蜜蜂毒面膜50克','Royal Nectar Bee Venom Mask 50gm',60,NULL,NULL,NULL,0,1,NULL,NULL,1,NULL,0,NULL,1468553398,0.2,''),(114,45,158,'','',100,'Royal Nectar皇家花蜜蜂毒面霜50克','Royal Nectar Bee Venom Moisturising Face Lift 50gm',55,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,1468553367,0.5,''),(115,45,146,'皇家花蜜蜂毒','',15,'Royal Nectar皇家花蜜蜂毒再生精華素','Royal Nectar Bee Venom Rejuvenating Serum',35,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468553836,1468553836,0.5,''),(116,21,143,'視力寶藍莓素 Eye-tamin','',100,'視力寶藍莓素 Eye-Tamin 60粒','Mega Eye-tamin 60 Soft Gel',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468718045,0.5,''),(117,21,143,'螺旋藻素 Mega Spirulina','',100,'螺旋藻素 Mega Spirulina 100粒',' Mega Spirulina 100 capsule',15,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468717858,0.5,''),(118,21,143,'蜂膠 Propolis 2600','',100,'蜂膠 Propolis 2600 200 粒','Mega Propolis 2600 200s soft gel',65,NULL,NULL,NULL,NULL,1,1,NULL,1,NULL,NULL,NULL,1468727431,0.8,''),(119,21,156,'牛奶鈣皇 Smart CAL','',100,'牛奶鈣皇 Smart CAL 120片','Smart CAL 120 tablets',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468727927,0.8,''),(120,21,143,' Squalene ','',100,'角鯊稀油 Shark Squalene 1000mg300粒','Mega Shark Squalene 1000mg 300 soft gel',55,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468719940,1468719940,1,''),(121,21,156,'鲨魚軟骨 Mega Shark Cartilage g','',100,'鲨魚軟骨 Mega Shark Cartilage 1000mg 粒','Mega Shark Cartilage 1000mg 100 Soft Gel',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468720188,1468720188,0.8,''),(122,21,156,'超級關節靈 Mega Joint','',100,'超級關節靈 Mega Joint 60','Mega Joint 60 capsules',30,NULL,NULL,NULL,NULL,1,1,NULL,1,NULL,NULL,NULL,1468726670,0.4,''),(123,21,143,'天然護肝寶 LiverTon','',100,'天然護肝寶 LiverTon 60','Mega LiverTon 60 capsules',25,NULL,NULL,NULL,NULL,1,1,NULL,1,NULL,NULL,NULL,1468728350,0.4,''),(124,21,143,'蜂皇浆 Royal Jelly 365 粒','',50,'蜂皇浆 Royal Jelly 365 粒 中等浓度','Mega Royal Jelly 365 soft gel Mid Grade',40,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468720757,1468720757,1.4,''),(125,49,147,'WINDWARD羊皮 兩拼五星','',30,'WINDWARD羊皮 兩拼五星','WINDWARD Double 5 star',155,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468721341,2.3,''),(126,49,147,'WINDWARD羊皮 四拼五星','',5,'WINDWARD羊皮 四拼五星','WINDWARD 4pcs 5 star',420,NULL,NULL,NULL,0,1,0,0,0,0,0,1468721514,1468721514,4.5,''),(127,49,147,'WINDWARD羊皮 六拼五星','',5,'WINDWARD羊皮 六拼五星','WINDWARD 6pcs 5 star',550,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1468721686,4.5,''),(128,49,147,'WINDWARD羊皮 八拼五星','',3,'WINDWARD羊皮 八拼五星','WINDWARD 8pcs 5star',690,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468721802,1468721802,8.5,''),(129,49,147,'WINDWARD羊皮 單張五星','',NULL,'WINDWARD羊皮 單張五星','WINDWARD Single pc 5 Star',85,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468721963,1468721963,1.2,''),(130,49,163,'WINDWARD羊皮坐垫','',30,'WINDWARD羊皮坐垫 40x40','WINDWARD Sheepskin Cushion 40cmx40cm',45,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1468722891,0.5,''),(131,41,141,'HNZ麥蘆卡蜂蜜 UMF5','',100,'HNZ麥蘆卡蜂蜜 UMF5+ 500克','HNZ Manuka Honey UMF5+ 500gm ',38,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468724703,1468724703,0.65,''),(132,41,141,'HNZ麥蘆卡蜂蜜 UMF5+ ','',50,'HNZ麥蘆卡蜂蜜 UMF5+ 250克','HNZ Manuka Honey UMF5+ 250gm',26,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468724847,1468724847,0.4,''),(133,41,141,'HNZ麥蘆卡蜂蜜 UMF5+ ','',100,'HNZ麥蘆卡蜂蜜 UMF5+ 1公斤','HNZ麥蘆卡蜂蜜 UMF5+ 1kg',77,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,1468725038,1.3,''),(134,41,141,'HNZ麥蘆卡蜂蜜 UMF10+ ','',100,'HNZ麥蘆卡蜂蜜 UMF10+ 1公斤','HNZ Manuka Honey UMF10+ 1kg',120,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,1468725190,1.3,''),(135,41,141,'HNZ麥蘆卡蜂蜜 UMF155+ ','',30,'HNZ麥蘆卡蜂蜜 UMF15+ 250克','HNZ Manuka Honey UMF15+ 250克',62,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,1468725361,1468725361,0.4,''),(136,41,141,'HNZ麥蘆卡蜂蜜 UMF18','',30,'HNZ麥蘆卡蜂蜜 UMF18+ 250克','HNZ Manuka Honey UMF18+ 250克',85,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468725479,1468725479,0.4,''),(137,41,141,'HNZ麥蘆卡蜂蜜 UMF22','',12,'HNZ麥蘆卡蜂蜜 UMF22+ 250克','HNZ Manuka Honey UMF22+ 250gm',120,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468725614,1468725614,0.5,''),(138,21,143,'深海魚油Omega 3 1200 ','',120,'深海魚油Omega 3 1200 Plus 70粒','Omega 3 1200mg Plus 70s soft gel',18,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468727374,1468727374,0.5,''),(139,30,156,'好健康Q10 150mg ','',NULL,'好健康Q10 150mg 心血管保养胶囊 60','Good Health Opti CoQ10 150mg 60s',32,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1468729856,1468729856,0.5,''),(140,30,156,'好健康复方辅酶Q10 300mg胶囊','',NULL,'好健康复方辅酶Q10 300mg胶囊 50','GoodHealth CoQ10 300mg  Complex 50capsule',37,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1469333214,0.4,'<br>');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attr`
--

DROP TABLE IF EXISTS `product_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attr`
--

LOCK TABLES `product_attr` WRITE;
/*!40000 ALTER TABLE `product_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name_cn` varchar(128) DEFAULT NULL,
  `brand_name_en` varchar(128) DEFAULT NULL,
  `brand_img_url` varchar(512) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_brand_ibfk_1` (`menu_id`),
  CONSTRAINT `product_brand_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (21,'MegaMax','MegaMax',NULL,136),(22,'cosmedica','cosmedica',NULL,137),(24,'BOWRON','BOWRON',NULL,138),(25,'Swisse','Swisse',NULL,139),(26,'康维他','Comvita',NULL,139),(27,'新溪岛','Streamland',NULL,136),(28,'纽乐 ','Nutralife',NULL,136),(29,'安佳','Anchor',NULL,136),(30,'好健康','Good health',NULL,136),(31,'康維他','Comvita',NULL,136),(39,'Health Plus','Health Plus',NULL,136),(40,'金奇維','Gold Kiwi',NULL,136),(41,'佳蜜紐西蘭',' HNZ',NULL,136),(42,'Kiwi Manuka','Kiwi Manuka',NULL,136),(43,'NZ Health Food','NZ Health Food',NULL,136),(44,'Wild Fern','Wild Fern',NULL,137),(45,'皇家花蜜','Royal Nectar',NULL,137),(46,'La Reine','La Reine',NULL,137),(47,'I Care','I Care',NULL,137),(48,'紅印','Red Seal',NULL,136),(49,'WindWard','Windward',NULL,138),(50,'Mi Woolies','Mi Woolies',NULL,138),(51,'EMU','EMU',NULL,138),(52,'Health n Beauty','Health n Beauty',NULL,138),(53,'Natures Beauty','Natures Beauty',NULL,137);
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES (66,72,'list',0,1,'/resources/product_img/20160710/72_list1468126788.jpg',NULL),(67,72,'desc',0,1,'/resources/product_img/20160710/72_desc1468126788.JPG',NULL),(70,74,'list',0,1,'/resources/product_img/20160710/74_list1468127122.jpg',NULL),(71,75,'list',0,1,'/resources/product_img/20160710/75_list1468127312.jpg',NULL),(72,76,'list',0,1,'/resources/product_img/20160710/76_list1468127553.jpg',NULL),(73,77,'list',0,1,'/resources/product_img/20160710/77_list1468127676.jpg',NULL),(74,78,'list',0,1,'/resources/product_img/20160710/78_list1468127774.jpg',NULL),(76,79,'list',0,1,'/resources/product_img/20160710/79_list1468128005.jpg',NULL),(77,80,'list',0,1,'/resources/product_img/20160710/80_list1468128364.jpg',NULL),(78,81,'list',0,1,'/resources/product_img/20160710/81_list1468128439.jpg',NULL),(79,82,'list',0,1,'/resources/product_img/20160710/82_list1468128502.jpg',NULL),(80,83,'list',0,1,'/resources/product_img/20160710/83_list1468128680.jpg',NULL),(83,86,'list',0,1,'/resources/product_img/20160712/86_list1468363292.jpg',NULL),(84,87,'list',0,1,'/resources/product_img/20160712/87_list1468363427.jpg',NULL),(89,89,'list',0,1,'/resources/product_img/20160712/89_list1468364094.jpg',NULL),(90,90,'list',0,1,'/resources/product_img/20160712/90_list1468364264.jpg',NULL),(91,91,'list',0,1,'/resources/product_img/20160712/91_list1468364362.jpg',NULL),(99,93,'list',0,1,'/resources/product_img/20160713/93_list1468377469.JPG',NULL),(104,92,'list',0,1,'/resources/product_img/20160713/92_list1468387359.jpg',NULL),(105,92,'desc',0,1,'/resources/product_img/20160713/92_desc1468387359.jpg',NULL),(109,95,'desc',0,1,'/resources/product_img/20160714/95_desc1468456371.jpg',NULL),(111,97,'list',0,1,'/resources/product_img/20160714/97_list1468456730.jpg',NULL),(112,97,'list',0,1,'/resources/product_img/20160714/98_list1468456730.jpg',NULL),(113,97,'list',0,1,'/resources/product_img/20160714/99_list1468456730.jpg',NULL),(114,99,'list',0,1,'/resources/product_img/20160714/99_list1468465458.jpg',NULL),(115,100,'list',0,1,'/resources/product_img/20160714/100_list1468465921.jpg',NULL),(116,100,'list',0,1,'/resources/product_img/20160714/101_list1468465921.jpg',NULL),(117,100,'list',0,1,'/resources/product_img/20160714/102_list1468465921.jpg',NULL),(118,101,'list',0,1,'/resources/product_img/20160714/101_list1468466102.jpg',NULL),(119,101,'list',0,1,'/resources/product_img/20160714/102_list1468466103.jpg',NULL),(120,101,'list',0,1,'/resources/product_img/20160714/103_list1468466103.jpg',NULL),(121,102,'list',0,1,'/resources/product_img/20160714/102_list1468466525.JPG',NULL),(122,102,'desc',0,1,'/resources/product_img/20160714/102_desc1468466525.jpg',NULL),(123,104,'list',0,1,'/resources/product_img/20160715/104_list1468546644.jpg',NULL),(124,104,'list',0,1,'/resources/product_img/20160715/105_list1468546644.jpg',NULL),(127,105,'list',0,1,'/resources/product_img/20160715/105_list1468547040.jpg',NULL),(128,105,'list',0,1,'/resources/product_img/20160715/106_list1468547040.jpg',NULL),(129,103,'list',0,1,'/resources/product_img/20160715/103_list1468547316.jpg',NULL),(130,103,'list',0,1,'/resources/product_img/20160715/104_list1468547316.jpg',NULL),(131,103,'list',0,1,'/resources/product_img/20160715/105_list1468547316.jpg',NULL),(132,106,'list',0,1,'/resources/product_img/20160715/106_list1468547486.jpg',NULL),(133,106,'list',0,1,'/resources/product_img/20160715/107_list1468547486.jpg',NULL),(134,106,'list',0,1,'/resources/product_img/20160715/108_list1468547486.jpg',NULL),(135,107,'list',0,1,'/resources/product_img/20160715/107_list1468548186.jpg',NULL),(136,98,'list',0,1,'/resources/product_img/20160715/98_list1468548323.jpg',NULL),(137,94,'list',0,1,'/resources/product_img/20160715/94_list1468548621.jpg',NULL),(138,96,'list',0,1,'/resources/product_img/20160715/96_list1468548784.jpg',NULL),(139,108,'list',0,1,'/resources/product_img/20160715/108_list1468548993.jpg',NULL),(140,109,'list',0,1,'/resources/product_img/20160715/109_list1468549337.jpg',NULL),(141,110,'list',0,1,'/resources/product_img/20160715/110_list1468549608.jpg',NULL),(142,112,'list',0,1,'/resources/product_img/20160715/112_list1468549831.jpg',NULL),(143,114,'list',0,1,'/resources/product_img/20160715/114_list1468553367.jpg',NULL),(144,113,'list',0,1,'/resources/product_img/20160715/113_list1468553398.jpg',NULL),(145,111,'list',0,1,'/resources/product_img/20160715/111_list1468553616.jpg',NULL),(146,115,'list',0,1,'/resources/product_img/20160715/115_list1468553836.jpg',NULL),(147,84,'list',0,1,'/resources/product_img/20160717/84_list1468716560.jpg',NULL),(148,84,'desc',0,1,'/resources/product_img/20160717/84_desc1468716601.jpg',NULL),(149,85,'list',0,1,'/resources/product_img/20160717/85_list1468717031.jpg',NULL),(150,85,'desc',0,1,'/resources/product_img/20160717/85_desc1468717031.jpg',NULL),(157,117,'list',0,1,'/resources/product_img/20160717/117_list1468717858.jpg',NULL),(158,116,'list',0,1,'/resources/product_img/20160717/116_list1468718045.jpg',NULL),(159,120,'list',0,1,'/resources/product_img/20160717/120_list1468719940.jpg',NULL),(160,121,'list',0,1,'/resources/product_img/20160717/121_list1468720188.jpg',NULL),(163,124,'list',0,1,'/resources/product_img/20160717/124_list1468720757.jpg',NULL),(165,125,'list',0,1,'/resources/product_img/20160717/125_list1468721335.jpg',NULL),(166,126,'list',0,1,'/resources/product_img/20160717/126_list1468721514.jpg',NULL),(167,127,'list',0,1,'/resources/product_img/20160717/127_list1468721686.jpg',NULL),(168,128,'list',0,1,'/resources/product_img/20160717/128_list1468721802.jpg',NULL),(169,129,'list',0,1,'/resources/product_img/20160717/129_list1468721963.jpg',NULL),(171,130,'list',0,1,'/resources/product_img/20160717/130_list1468722885.jpg',NULL),(172,131,'list',0,1,'/resources/product_img/20160717/131_list1468724703.jpg',NULL),(173,131,'desc',0,1,'/resources/product_img/20160717/131_desc1468724703.jpg',NULL),(174,132,'list',0,1,'/resources/product_img/20160717/132_list1468724847.jpg',NULL),(175,133,'list',0,1,'/resources/product_img/20160717/133_list1468725038.jpg',NULL),(176,133,'desc',0,1,'/resources/product_img/20160717/133_desc1468725038.jpg',NULL),(177,134,'list',0,1,'/resources/product_img/20160717/134_list1468725190.jpg',NULL),(178,134,'desc',0,1,'/resources/product_img/20160717/134_desc1468725190.jpg',NULL),(179,135,'list',0,1,'/resources/product_img/20160717/135_list1468725361.jpg',NULL),(180,136,'list',0,1,'/resources/product_img/20160717/136_list1468725479.jpg',NULL),(181,137,'list',0,1,'/resources/product_img/20160717/137_list1468725614.jpg',NULL),(182,137,'desc',0,1,'/resources/product_img/20160717/137_desc1468725614.jpg',NULL),(183,122,'list',0,1,'/resources/product_img/20160717/122_list1468726670.jpg',NULL),(184,138,'list',0,1,'/resources/product_img/20160717/138_list1468727374.jpg',NULL),(185,118,'list',0,1,'/resources/product_img/20160717/118_list1468727431.jpg',NULL),(187,73,'list',0,1,'/resources/product_img/20160717/74_list1468727529.jpg',NULL),(188,73,'list',0,1,'/resources/product_img/20160717/75_list1468727529.jpg',NULL),(189,119,'list',0,1,'/resources/product_img/20160717/119_list1468727927.jpg',NULL),(190,123,'list',0,1,'/resources/product_img/20160717/123_list1468728350.jpg',NULL),(191,95,'list',0,1,'/resources/product_img/20160717/95_list1468728405.jpg',NULL),(192,139,'list',0,1,'/resources/product_img/20160717/139_list1468729856.jpg',NULL),(194,140,'list',0,1,'/resources/product_img/20160719/140_list1468902167.jpg',NULL);
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_address`
--

DROP TABLE IF EXISTS `to_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_address`
--

LOCK TABLES `to_address` WRITE;
/*!40000 ALTER TABLE `to_address` DISABLE KEYS */;
INSERT INTO `to_address` VALUES (1,31,'12 a rd',NULL,NULL,NULL,'0273047888','ff',NULL),(2,32,'中欧',NULL,NULL,NULL,'021123456','Leo',NULL);
/*!40000 ALTER TABLE `to_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test@test.com','e10adc3949ba59abbe56e057f20f883e',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-25  5:57:10
