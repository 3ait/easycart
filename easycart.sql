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
  `title` varchar(1024) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `description` varchar(1024) DEFAULT '',
  `type` varchar(255) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (20,'/resources/banner/banner1468728885.jpg','http://45.79.98.47:8080/royaldeer/product/118',1,'',NULL,'',NULL),(21,'/resources/banner/banner1469510241.jpg','http://45.79.98.47:8080/royaldeer/product/118',1,'',NULL,'',NULL),(22,'/resources/banner/banner1469510444.jpg','http://45.79.98.47:8080/royaldeer/product/101',1,'',NULL,'',NULL),(23,'/resources/banner/banner1469510487.jpg','http://45.79.98.47:8080/royaldeer/product/103',1,'',NULL,'',NULL),(24,'/resources/banner/banner1469510635.jpg','http://45.79.98.47:8080/royaldeer/product/133',1,'',NULL,'','indexBanner');
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
  `email` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `email_smtp` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `description` text,
  `keywords` varchar(512) DEFAULT NULL,
  `exchange_rate` double(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Royal Deer of New Zealand','65 Wakefield Street, Auckland Central, New Zealand','0064-9-3031619','Royal Deer of New Zealand','ASB BANK 12-3037-0427423-50',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (31,'zhuyoumeimei@hotmail.com',NULL,'0273047888','e10adc3949ba59abbe56e057f20f883e',1,0.6,'2016-07-13 23:43:57','2016-07-19 09:43:00'),(32,NULL,NULL,'0211803929','e10adc3949ba59abbe56e057f20f883e',1,0.9,'2016-07-14 03:54:59','2016-07-14 04:19:24'),(33,'anjie@3a.co.nz',NULL,'0210406582','9f9a37c41205a57d1ee4687414a7d899',1,0.99,'2016-07-22 09:17:31','2016-07-22 09:17:31'),(34,'leo@3a.co.nz',NULL,'0221828358','e10adc3949ba59abbe56e057f20f883e',1,0.99,'2016-08-08 04:21:15','2016-08-28 14:35:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `from_address`
--

LOCK TABLES `from_address` WRITE;
/*!40000 ALTER TABLE `from_address` DISABLE KEYS */;
INSERT INTO `from_address` VALUES (29,31,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',NULL),(30,31,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'0273984765','Royal Deer of New Zealand',NULL),(32,32,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',NULL),(33,32,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',1),(34,34,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'15810388458','Royal Deer of New Zealand',1),(35,34,'65 Wakefield Street, Auckland Central, New Zealand',NULL,NULL,NULL,'006493031619','Royal Deer of New Zealand',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_record`
--

LOCK TABLES `order_record` WRITE;
/*!40000 ALTER TABLE `order_record` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (72,21,141,'蜂蜜，MegaMax','1',1,'MegaMax抗氧化活性5+混合蜂蜜1kg','MegaMax抗氧化活性5+混合蜂蜜1kg',40,0,0,0,1,1,1,1,1,1,1,1468126788,1468126788,1,''),(73,21,141,'','',1,'优质蜂皇浆 高浓度16毫克10HDA 365粒','Mega Royal Jelly 365 ',110,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1470095277,1,'蜂皇漿,又稱蜂皇乳,是工蜂專門煉制給蜂后食用的名貴食糧.有助于增強體力,調節睡眠,延年益壽,美容護膚,調理內臟機能.對腸胃, 平衡血壓, 糖尿病有效用。其中皇漿酸成分10HDA 是重要的成分, 本品每粒含有16毫克以上的皇漿酸,是市場中最高質量的產品之一.<div>注意:有對蜂產品過敏者不宜服用。需隔光,隔熱包存.</div><div><br></div><div>每日飯前1粒.<div><br>365粒装</div></div>'),(74,21,143,'','',1,'卵磷脂1200mg 300粒','MegaMax Lecithin 1200mg 300',25,0,0,0,1,1,1,1,1,1,1,NULL,1469592910,1,''),(75,21,143,'','',1,'深海魚油 400粒家庭装','MegaMax Omega 3',25,0,0,0,1,1,1,1,1,1,1,NULL,1469592786,1,''),(76,22,146,'羊胎素天然精華液','',1,'羊胎素天然有机精華液','PPS ORGANIC New Zealand Placenta Serum with Rose oil',150,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1470106190,1,'<div>PPS羊胎素天然精華液,得天獨厚的天然美容護膚聖品.PPS羊胎素,精選自新西蘭CERTIFIED ORGANIC FARM,成分天然,不可多得,配合六勝肽,南極海醣蛋白,活性蔓努卡蜂蜜和玫瑰果油等天然成分,24小時,專業護理皮膚.被譽為不用打針的新一代\"除皺之王.\"</div><div><br></div><div>本品無添加苯甲酸脂,無防腐劑,無人工色素和香料,無礦物油.讓你的美麗純潔無暇.</div><div><br></div><div>使用方法:每天早晚清潔和按摸皮膚後塗抹於臉部,特別是眼部皮膚和皺紋處.</div><div>1套5毫升X6支</div>'),(79,22,146,'','',1,'高級羊胎素修復面霜','Placenta Repairing cream',25,0,0,0,1,1,NULL,NULL,NULL,NULL,1,NULL,1469593570,1,'高級羊胎素修復面霜Placenta Repairing Cream<div>是一種含有較高濃縮度的羊胎盤自然萃取液，蘊含新生的胎盤組織和活性精華。並特別添加羊奶,月見草油,野玫瑰油和維他命E等多種天然營養素.</div><div>功能：促進皮膚細胞自然地更新換代，修復滋潤平衡粗糙皮膚，有助美白肌膚、減淺黑色素和黑斑，是令皮膚健康年輕和最大限度減少細紋及皺紋的關鍵。</div><div>用法：早晚取少量輕揉臉部和頸部皮膚，本品如能與羊胎盤素調理液同時使用，效果最佳。30ml</div>'),(80,24,147,'','',1,'BOWRON羊皮 兩拼金星','BOWRON',245,0,0,0,1,1,0,0,0,0,1,NULL,1469593749,2,''),(81,24,147,'','',1,' BOWRON羊皮 八拼金星','BOWRON',995,0,0,0,1,1,0,0,0,0,1,NULL,1469593888,8,''),(82,24,147,'','',1,'BOWRON羊皮 六拼金星','BOWRON',850,0,0,0,1,1,0,0,0,0,1,NULL,1469594067,1,''),(83,24,147,'','',3,'BOWRON羊皮 六拼金星','BOWRON',850,0,0,0,1,1,0,0,0,0,1,NULL,1468455276,6,''),(84,21,156,'Sealongpou海龍寶精粹','',60,'Mega Sealongpou III 海龍寶精粹III號','Mega Sealongpou III',99,NULL,NULL,NULL,1,1,1,1,1,1,1,NULL,1471585709,0.3,'海龍寶精粹III號：現代男性的最佳保養品,天然名貴專利配方,可固本陪元,壯元陽,增強腎的功能,對前列腺炎和肥大, 腎虧損, 尿頻, 陽痿等有效用。提高機體工作能力和效率.，增加抗氧化能力, 強化自癒能力及加快康復速度, 對前列腺、睪丸具有顯著的保護作用, 可預防並改善前列腺疾病症狀。自海龍寶問世以來,迅速成為家喻戶曉的產品,其效果顯著受到一致好評,譽滿全紐．<div><br></div><div>每日飯后1-2 粒</div><div><br></div><div>60粒装</div>'),(85,21,154,'美中顏羊胎素','',100,'Mega Recell II 美中顏口服活性羊胎素60粒','Mega Recell II 60\'s Soft Gel',35,NULL,NULL,NULL,1,1,NULL,1,1,NULL,1,NULL,1471585831,0.5,'纽西蘭得天獨厚的天然瑰寶 - 口服活性羊胎素<div><br></div><div>美中顏口服活性羊胎素: 以其得天獨厚的優勢 ，優選自純淨自然環境中的健康羊胎盤素,為目前紐西蘭市場上高活性濃縮的羊胎素口服液體膠囊，最大限度地保留了羊胎素的活性物質，即保証每粒含有相於3000毫克新鮮羊胎素的活性細胞成分，配合海洋膠原蛋白的特別配方,滿足人體的新陳代謝每日所需要量。美中顏經過嚴格的加工和檢測，達到國際GMP水準. 可增強皮膚彈性,去斑去黑眼圈,減緩皺紋,調補身體, 促進好身材.</div><div><br></div><div>3000毫克的活性羊胎素,配合海洋膠原蛋白的特別配方,可增強皮膚彈性,去斑去黑眼圈,減緩皺紋,延遲更年期,締造美的神話,留住活力與青春.&nbsp;</div><div><br></div><div>每日1-3粒</div><div><br></div><div>60粒裝</div>'),(86,43,143,'deer velvet','1',10,'鹿茸丸100粒','Deer Velvet Extract capsule 100\'s',35,NULL,NULL,NULL,1,1,NULL,NULL,1,1,1,NULL,1471236102,0.15,''),(87,47,146,'','',100,'純綿羊油面霜','Bion Lin Lanolin Facial cream',4.5,NULL,NULL,NULL,1,1,NULL,1,1,NULL,1,NULL,1471234267,0.2,''),(88,21,141,'MegaMax Propolis黑蜂膠500毫克500粒家庭裝','',100,'MegaMax Propolis黑蜂膠500毫克500粒家庭裝','MegaMax Propolis  500s family pack',45,NULL,NULL,NULL,1,1,NULL,1,1,NULL,1,NULL,1469594527,0.55,'蜂膠被稱為天然抗生素,可增強人體自然免疫力,對流行性感冒,氣管,喉嚨,牙齒和口腔疾病,呼吸系統疾病,胃腸不適,蚊虫咬傷有功效.還可以外敷,蜂膠有膠,無酒精滴劑和噴劑,適合不同需要。<div><br></div><div>2013全新包装--不透光,更好保存活性.</div><div><br></div><div>注意:有對蜂產品過敏者不宜服用。</div><div><br></div><div>每日2-4粒</div><div><br></div><div>500毫克(capsule): 500粒装</div>'),(89,43,141,'','9400554000135',10,'優質天然花粉 250克','Happy Valley Bee Pollen Granules 250gm',42,NULL,NULL,NULL,1,1,1,0,1,0,0,NULL,1471585521,0.4,''),(90,21,143,'','',1,'紐西蘭鹿茸原支切片 血茸片50克','Deer Velvet slices Mid grade 50gm',65,NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,1,NULL,1471489675,0.8,'紐西蘭鹿茸原支切片 血茸片50克--可提供具有出口證明。<div><br><div>補血，補氣的聖品。可以燉湯，煲茶飲用。</div><div>恕不接受海外郵購，僅接受紐西蘭本地郵購。</div></div>'),(91,43,143,'deer tail','',5,'紐西蘭放養鹿尾','Deer Tail ',60,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,1,NULL,1471489792,0.7,''),(92,21,156,'','9419236001100',200,'南極魚寶 Mega GSD','Mega GSD High Concernstration Fish Oil',60,0,0,0,0.2,1,1,0,1,0,1,NULL,1468549992,0.2,''),(93,21,154,'','9419236000103',100,'紐西蘭鹿血胶囊 500粒','Deer Blood Soft Gel 500\'s',65,NULL,NULL,NULL,0,1,0,1,1,0,0,NULL,1469594675,1,''),(94,31,141,'康維他麥蘆卡蜂蜜','',60,'康維他麥蘆卡蜂蜜UMF15+250克','Comvita Manuka Honey UMF15+ 250gm',128,0,0,0,0,1,0,0,0,0,0,NULL,1468548621,0.5,''),(95,21,141,'活性蜂膠 ','9419236000103',100,'活性蜂膠 1000毫克 60粒','Mega Propolis 60\'s',25,0,0,0,0,1,1,NULL,1,NULL,0,NULL,1468728405,0.2,'活性蜂膠 1000毫克 60粒'),(96,31,141,'康維他麥蘆卡蜂蜜','',60,'康維他麥蘆卡蜂蜜UMF10+ 500克','Comvita Manuka Honey UMF10+ 500gm',99,0,0,0,0,1,0,0,0,0,0,NULL,1468548784,0.8,''),(97,21,154,'','9419236001230',200,'Mega月見草膠囊1000毫克 100粒','Evening Primrose Oil EPO 100\'s',18,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469594839,0.4,'<div>月見草油膠囊: 純天然植物提煉,含有Gamma Linolenic (r-亞麻酸GLA),能減輕婦女生理周期和月經前期的緊張,煩躁不安,乳房漲痛,頭痛,腹痛等症狀.並對更年期的各種不適症狀有緩解作用.對糖尿病,心臟病亦有效用, 也是素食者的福音.</div><div><br></div><div>每日飯后2-3 粒</div><div><br></div>Mega月見草膠囊1000毫克 100粒'),(98,31,141,'','',100,'康維他麥蘆卡蜂蜜UMF5+ 500克','Comvita Manuka Honey UMF 5+ 500gm',50,0,0,0,0,1,NULL,NULL,NULL,NULL,0,NULL,1468548817,0.8,''),(99,21,155,'','',200,'高鈣牛初乳小熊300片','Mega Colostrum Bear 300\'s chewable',30,0,0,0,0,1,1,1,1,NULL,0,NULL,1469333103,0.4,'我們採用紐西蘭自然放養的健康奶牛所產的初乳為原料,被譽為世界上最純淨的,最高級的初乳原料.以確保牛初乳中的IgG免疫蛋白的高含量和活性.本品可增強人體免疫力, 抵抗各種流行性疾病, 有助於兒童的胃腸道功能,並可補鈣和營養素。本品含鈣高於普通牛初乳片.'),(100,21,156,'','',100,'液體鹿骨高鈣60粒','Mega CALEPO 60\'s',20,0,0,0,0,1,0,0,0,0,0,NULL,1469336907,0.2,''),(101,21,155,'','',100,'可口型牛初乳300片','Colostrum Plus 300 chewable',20,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1470094998,0.5,'<div>Colostrum Plus 可口型牛初乳300片</div><div>牛初乳片:天然營養免疫精華,紐西蘭的牛初乳含有優質的免疫蛋白和成長因子,長期服用可強化免疫力,幫助抵抗病菌,促進健康,本品香甜可口.</div><div>每日4-6粒.</div><div><br></div><div>Colostrum Plus: 300粒装</div>'),(102,51,162,'','',0,'EMU雪地靴低幫','EMU Stinger Mini',165,0,0,0,0,1,0,0,0,0,0,1468466525,1468466525,1.5,''),(103,51,162,'EMU雪地靴','',20,'EMU雪地靴中筒','EMU Stinger Lo Ugg Boot',195,0,0,0,0,1,1,1,1,0,0,NULL,1468550363,1.2,''),(104,21,143,'角鯊稀','9419236000028',200,'Mega 角鯊稀100粒1000毫克','Mega Squalene 100s',25,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1470094806,0.2,'<table border=\"0\" align=\"center\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15.6px; width: 554px; background-color: rgb(255, 255, 255);\"><tbody><tr><td rowspan=\"1\"><p style=\"margin: 1em 0px; padding: 0px;\">紐西蘭純淨的深海角鯊稀油,<br>增強體質,對滋潤皮膚,心臟病,糖尿病,肝病,胃炎,流感等有效用,並可調理內臟機能。<br><br>100粒装1000毫克/粒</p><span style=\"font-style: italic;\"></span></td></tr><tr></tr></tbody></table><br>'),(105,21,154,'蜂膠牙膏','9419236001940',200,'MegaMax 蜂膠牙膏100克','MegaMax  Propolis Toothpaste 100gm',6,0,0,0,0,1,NULL,NULL,NULL,NULL,0,NULL,1469591257,0.2,''),(106,51,162,'雪地靴高筒','9419236000028',10,'EMU 雪地靴高筒Stinger HI Ugg Boot','EMU Stinger HI Ugg Boot',205,0,0,0,0,1,0,0,0,0,0,NULL,1468547486,1.8,''),(107,31,141,'康維他麥蘆卡蜂蜜','',100,'康維他麥蘆卡蜂蜜UMF5+ 1公斤','Comvita Manuka Honey UMF 5+ 1Kg',99,0,0,0,0,1,1,0,1,0,0,NULL,1468550040,1.2,''),(108,31,141,'','',30,'康維他麥蘆卡蜂蜜UMF18+ 250克','Comvita Manuka Honey UMF18+ 250gm',170,0,0,0,0,1,0,0,0,0,0,1468548993,1468548993,0.5,''),(109,31,141,'潤喉糖','',30,'康維他麥蘆卡蜂蜜潤喉糖 檸檬味500克','Comvita Manuka Honey UMF10+ Lozenges 500gm Lenmon',42,0,0,0,0,1,0,0,0,0,0,1468549337,1468549337,0.8,''),(110,31,141,'潤喉糖500克','',20,'康維他麥蘆卡蜂蜜潤喉糖500克薄荷味','Comvita Manuka Honey UMF10+ Lozenges 500gm Mint',42,0,0,0,0,1,0,0,0,0,0,1468549608,1468549608,0.8,''),(111,45,146,'皇家花蜜蜂毒','',20,'Royal Nectar皇家花蜜蜂毒眼霜15克','Royal Nectar Bee Venom Eye cream 15gm',37,0,0,0,0,1,0,0,0,0,0,NULL,1468553616,0.5,''),(112,31,141,'潤喉糖','',15,'康維他麥蘆卡蜂蜜潤喉糖橄欖味500克','Comvita Manuka Honey UMF10+ Lozenges 500gm Olive',42,0,0,0,0,1,0,0,0,0,0,1468549831,1468549831,0.8,''),(113,45,158,'蜂毒面膜','',100,'Royal Nectar皇家花蜜蜂毒面膜50克','Royal Nectar Bee Venom Mask 50gm',60,0,0,0,0,1,NULL,NULL,1,NULL,0,NULL,1468553398,0.2,''),(114,45,158,'','',100,'Royal Nectar皇家花蜜蜂毒面霜50克','Royal Nectar Bee Venom Moisturising Face Lift 50gm',55,0,0,0,0,1,1,1,NULL,NULL,0,NULL,1468553367,0.5,''),(115,45,146,'皇家花蜜蜂毒','',15,'Royal Nectar皇家花蜜蜂毒再生精華素','Royal Nectar Bee Venom Rejuvenating Serum',37,0,0,0,0,1,0,0,0,0,0,NULL,1469591018,0.5,''),(116,21,143,'視力寶藍莓素 Eye-tamin','',100,'視力寶藍莓素 Eye-Tamin 60粒','Mega Eye-tamin 60 Soft Gel',25,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469595480,0.5,'含有豐富,高含量的藍莓素(Billberry), 以及小米草, 葉黃素, 玉米黃素, Beta類胡蘿蔔素, Omega<div>3(EPA,DHA)等對眼睛健康十分必要的多種天然營養成份和礦物元素。可消除眼睛疲勞,補充營養,對舒緩眼睛幹澀, 近視和弱視,提高視力有幫助。</div><div><br></div><div>每日1-2 粒</div><div><br></div><div>60粒装</div><div><br></div>'),(117,21,143,'螺旋藻素 Mega Spirulina','',100,'螺旋藻素 Mega Spirulina 100粒',' Mega Spirulina 100 capsule',15,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469595546,0.5,'綠保婷螺旋藻素:從純淨的藍綠色的海藻單細胞生物中提取,由於分子結構簡單,可迅速被人體吸收,含豐富的綜合維生素B,葉綠素,藻清蛋白,鐵質,鈣質等多種維生素和人體必需的氨基酸,對胃酸過多,胃潰瘍,胰腺炎等消化系統問題,營養不良,抗輻射,預防\"現代疲勞病\"都有很好的幫助.<div>補充綠色蛋白質,豐富維他命B族元素, 美容瘦身,消除疲勞,對消化系統功能,糖尿病有幫助。</div><div><br></div><div>每日2-4粒</div><div><br></div><div>100粒装 400毫克/粒</div>'),(118,21,143,'蜂膠 Propolis 2600','',100,'蜂膠 Propolis 2600 200 粒','Mega Propolis 2600 200s soft gel',65,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1469595616,0.8,'蜂膠2600: 蜂膠中含有天然類黃酮素，可與空氣中的水份結合，產生有消炎殺菌作用的過氧化氫，具有天然消炎，抗菌，抗病毒的作用，因此被譽為天然抗菌素．近代研究証明，蜂膠具有降血糖、降血脂、抗菌、消炎、止痒、麻醉、促進組織再生，抗腫瘤等作用。本品含有相當於新鮮蜂膠2600毫克濃縮精華,含量高於普通蜂膠產品.<div>注意:有對蜂產品過敏者不宜服用。</div><div><br></div><div>每日1 粒.</div><div><br></div><div>200粒装</div>'),(119,21,156,'牛奶鈣皇 Smart CAL','',100,'牛奶鈣皇 Smart CAL 120片','Smart CAL 120 tablets',25,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469595680,0.8,'牛奶鈣皇:真真正正的鈣片由紐西蘭高鈣量的牛奶鈣、DHA、維生素D和牛初乳,天然成份精心配制而成的補鈣精品，本品不含防腐劑和色素，是市場中唯一無添加任何糖份及香料，不含油劑和膠囊的產品，所以廣泛適用各種年齡的人士．天然純正,GMP品質保証，是紐西蘭乳制品業發達的成果。有關研究表明牛奶鈣的吸收率為：乳酸鈣的1.75倍，碳酸鈣的2.15倍，卵殼鈣的5.5倍; 牛奶鈣皇能促進青少年骨骼發育，防止中老年人的骨質疏鬆，在補鈣的同時增進視力，腦力，提高免疫力。<div>每日飯前1-2 粒</div><div><br></div><div>90粒装 1000毫克</div><div><br></div>'),(120,21,143,' Squalene ','',100,'角鯊稀油 Shark Squalene 1000mg300粒','Mega Shark Squalene 1000mg 300 soft gel',58,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1470093596,1,''),(121,21,156,'鲨魚軟骨 Mega Shark Cartilage g','',100,'鲨魚軟骨 Mega Shark Cartilage 1000mg 粒','Mega Shark Cartilage 1000mg 100 Soft Gel',25,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469595814,0.8,'鯊魚軟骨添加海參的特別配方軟膠,可加強關節的靈活性,對骨刺,骨質增生,腰錐疼痛,防癌有助益。<div><br></div><div>注意:心臟病者,手術恢復期不宜服用。</div><div><br></div><div>Soft Gel: 1000mg 100粒装</div>'),(122,21,156,'超級關節靈 Mega Joint','',100,'超級關節靈 Mega Joint 60','Mega Joint 60 capsules',30,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1469595877,0.4,'MegaJoint<div>超級關節靈 極品配方：MSM、維骨素、軟骨素、青口精四合一精華. 是目前紐西蘭市場上對關節保護最全面和強力的配方。舒緩筋骨酸痛和僵硬、促進全身大小關節靈活性，減輕關節的老化, 對關節炎、骨刺、痛風、麻痺有助益.</div><div><br></div><div>每日1-3 粒</div><div><br></div><div>60粒装</div>'),(123,21,143,'天然護肝寶 LiverTon','',100,'天然護肝寶 LiverTon 60','Mega LiverTon 60 capsules',25,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1469595931,0.4,'天然護肝寶LiverTon以奶薊草高活性含量為主，配合蒲公英、五味子、牛磺酸等天然強效活性配方精制而成。奶薊草Milk Thistle含有水飛薊素（Silybin)，能有效修復受損的肝細胞，增加膽汁的分泌，促進解毒作用，其護肝功能已被廣泛証明。天然護肝寶LiverTon不僅能促進肝功能，淨化血液，幫助肝臟解毒和中和毒素，減輕肝臟的負擔，而且可促進膽汁分泌，降肝脂，清肝火，所以對病毒性肝炎（A、B、C、D、E、F、G等型），酒精性和藥物性肝中毒，肝硬化、脂肪肝、膽囊炎以及各種慢性肝膽病都有相當的助益。<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span><div><br></div><div>每日飯后1-2粒</div><div>60粒装</div>'),(124,21,143,'蜂皇浆 Royal Jelly 365 粒','',50,'蜂皇浆 Royal Jelly 365 粒 中等浓度','Mega Royal Jelly 365 soft gel Mid Grade',40,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469596001,1.4,'蜂皇漿,又稱蜂皇乳,是工蜂專門煉制給蜂后食用的名貴食糧. 有助增強體力,調節睡眠,延年益壽,美容護膚,調理內臟機能.對腸胃, 平衡血壓, 糖尿病有效用。<div><br></div><div>注意:有對蜂產品過敏者不宜服用。</div><div><br></div><div>每日飯前1-2粒</div><div><br></div><div>365粒装 1000毫克</div>'),(125,49,147,'WINDWARD羊皮 兩拼五星','',30,'WINDWARD羊皮 兩拼五星','WINDWARD Double 5 star',180,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1469596127,2.3,''),(126,49,147,'WINDWARD羊皮 四拼五星','',5,'WINDWARD羊皮 四拼五星','WINDWARD 4pcs 5 star',450,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1469596277,4.5,''),(127,49,147,'WINDWARD羊皮 六拼五星','',5,'WINDWARD羊皮 六拼五星','WINDWARD 6pcs 5 star',605,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1469596364,4.5,''),(128,49,147,'WINDWARD羊皮 八拼五星','',3,'WINDWARD羊皮 八拼五星','WINDWARD 8pcs 5star',750,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1469596427,8.5,''),(129,49,147,'WINDWARD羊皮 單張五星','',NULL,'WINDWARD羊皮 單張五星','WINDWARD Single pc 5 Star',85,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469596498,1.2,'WINDWARD羊皮 單張五星 大號 長約98厘米 X 68厘米<div>可用於1-2人沙發,床墊,地毯或其他豪華家具裝飾.</div><div><br></div><div>天然形狀,白色,100%純羊毛和羊皮.冬暖夏涼.</div>'),(130,49,163,'WINDWARD羊皮坐垫','',30,'WINDWARD羊皮坐垫 40x40','WINDWARD Sheepskin Cushion 40cmx40cm',45,0,0,0,0,1,NULL,NULL,NULL,NULL,0,NULL,1468722891,0.5,''),(131,41,141,'HNZ麥蘆卡蜂蜜 UMF5','',100,'HNZ麥蘆卡蜂蜜 UMF5+ 500克','HNZ Manuka Honey UMF5+ 500gm ',40,0,0,0,0,1,0,0,0,0,0,1468724703,1468724703,0.65,''),(132,41,141,'HNZ麥蘆卡蜂蜜 UMF5+ ','',50,'HNZ麥蘆卡蜂蜜 UMF5+ 250克','HNZ Manuka Honey UMF5+ 250gm',23,0,0,0,0,1,0,0,0,0,0,1468724847,1468724847,0.4,''),(133,41,141,'HNZ麥蘆卡蜂蜜 UMF5+ ','',100,'HNZ麥蘆卡蜂蜜 UMF5+ 1公斤','HNZ麥蘆卡蜂蜜 UMF5+ 1kg',77,0,0,0,0,1,NULL,NULL,1,NULL,0,NULL,1468725038,1.3,''),(134,41,141,'HNZ麥蘆卡蜂蜜 UMF10+ ','',100,'HNZ麥蘆卡蜂蜜 UMF10+ 1公斤','HNZ Manuka Honey UMF10+ 1kg',125,0,0,0,0,1,0,0,1,0,0,NULL,1469590663,1.3,''),(135,41,141,'HNZ麥蘆卡蜂蜜 UMF155+ ','',30,'HNZ麥蘆卡蜂蜜 UMF15+ 250克','HNZ Manuka Honey UMF15+ 250克',63,0,0,0,0,1,0,0,1,0,0,1468725361,1468725361,0.4,''),(136,41,141,'HNZ麥蘆卡蜂蜜 UMF18','',30,'HNZ麥蘆卡蜂蜜 UMF18+ 250克','HNZ Manuka Honey UMF18+ 250克',85,0,0,0,0,1,NULL,NULL,NULL,NULL,0,1468725479,1468725479,0.4,''),(137,41,141,'HNZ麥蘆卡蜂蜜 UMF22','',12,'HNZ麥蘆卡蜂蜜 UMF22+ 250克','HNZ Manuka Honey UMF22+ 250gm',125,0,0,0,0,1,0,0,0,0,0,1468725614,1468725614,0.5,''),(138,21,143,'深海魚油Omega 3 1200 ','',120,'深海魚油Omega 3 1200 Plus 70粒','Omega 3 1200mg Plus 70s soft gel',18,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1470093452,0.5,'深海魚油1200: 含有角鯊烯,深海魚油(OMEGA3)和維生素E.每粒1200毫克.廣泛適合各種年齡層次的人群.紐西蘭的深海魚油含豐富的EPA和DHA, 本品可疏通血液,軟化血管, 亦可增加免疫力.,有益視力,健腦,保護心臟.被稱為“血管清道夫”.<div><br></div><div>每日2-3 粒</div><div>70粒装</div>'),(139,30,156,'好健康Q10 150mg ','',0,'好健康Q10 150mg 心血管保养胶囊 60','Good Health Opti CoQ10 150mg 60s',34.3,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1470028737,0.5,''),(140,30,156,'好健康复方辅酶Q10 300mg胶囊','',NULL,'好健康复方辅酶Q10 300mg胶囊 50','GoodHealth CoQ10 300mg  Complex 50capsule',37,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1470098494,0.4,'好健康复方辅酶Q10 300mg胶囊含高效配方有助于心血管健康和增强活力。维生素D和E加倍保护心脏；鱼油和黑胡椒加速辅酶Q10的吸收；辅酶Q10有助对心血管健康、大脑健康、抗氧化防衰老和体力需求等。<div><br></div><div>辅酶Q10能激活人体细胞和细胞能量的营养，具有提高人体免疫力、增强抗氧化、延缓衰老和增强人体活力等功能。当人体内辅酶Q10含量下降25 % 时，许多疾病就产生，特别是心脑血管疾病，更加可怕的是：当体内的辅酶Q10下降超过75 % 时，生命就会终止。人体缺少辅酶Q10，通常容易患心力衰竭，心律失常，心肌梗塞，中风，高血压，高血脂，动脉硬化等多种心脑血管疾病。辅酶Q10有助于为心肌提供充足氧气，预防突发性心脏病，尤其在心肌缺氧过程中辅酶Q10发挥关键作用。辅酶Q10还可保持健康的牙龈，减少牙周炎和牙龈出血的情况。</div>'),(141,21,143,'','',100,'卵磷脂 MegaMax Lecithin 1200mg 100粒','MegaMax Lecithin 1200mg 100s',10,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469596731,0.35,'卵磷脂高含量口服膠囊:從大豆中提取,許多家庭已普遍使用的基本保養品.可解肝毒,減輕肝臟負擔,　通腸胃,減少便秘,　護肝養顏,增加記憶力,健腦,緩解膽固醇．<div><br></div><div>每天2-3粒</div><div><br></div><div>100粒装 1200毫克</div>'),(142,21,143,'复合青口素MegaMax Mussel 1000mg 500s','',100,'复合绿唇青口素MegaMax Mussel 1000mg 500s','MegaMax Mussel plus 1000mg 500s',50,0,0,0,0,1,NULL,NULL,NULL,NULL,0,NULL,1469489629,0.6,'复合绿唇青口素MegaMax Mussel 1000mg 500s'),(143,21,141,'','',100,'优质蜂皇浆 高浓度16毫克10HDA 1000毫克60粒 ','MegaMax premium Royal Jelly 16mg 10HDA  1000mg 60s',25,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469596862,0.25,'蜂皇漿,又稱蜂皇乳,是工蜂專門煉制給蜂后食用的名貴食糧.有助于增強體力,調節睡眠,延年益壽,美容護膚,調理內臟機能.對腸胃, 平衡血壓, 糖尿病有效用。其中皇漿酸成分10HDA 是重要的成分, 本品每粒<div><br></div><div>注意:有對蜂產品過敏者不宜服用。</div><div><br></div><div>60粒装 1000毫克</div>'),(144,21,141,'','',100,'紐西蘭綠唇青口精華膠囊 GM3500 60粒','MegaMax Green Mussel Extract 3500mg 60s',35,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469596967,0.15,'從紐西蘭天然的綠色青口中提取的精華，世界著名的綠色唇邊青口是生活在紐西蘭純淨清澈的海岸邊獨特的海洋貝殼生物，含有豐富的多醣聚合物，葡萄醣胺，軟骨素等.有利於關節的保護,對骨骼肌肉老化及關節方面的問題有相當的助益。<div><br></div><div>60粒装</div>'),(145,21,154,'','',60,'EPO 1000毫克365粒家庭装','Mega EPO 1000mg 365s',35,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,0,NULL,1469597032,0.65,'月見草油膠囊: 純天然植物提煉,含有Gamma Linolenic (r-亞麻酸GLA),能減輕婦女生理周期和月經前期的緊張,煩躁不安,乳房漲痛,頭痛,腹痛等症狀.並對更年期的各種不適症狀有緩解作用.對糖尿病,心臟病亦有效用, 也是素食者的福音.<div><br></div><div>每日飯后2-3 粒</div><div><br></div><div>365粒装 1000毫克</div>'),(146,30,155,'','',100,'兒童聰慧咀嚼魚油 120粒','O-Mega 3 Bursts Naturally bright kids 120',30,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1469747987,0.35,''),(147,52,160,'紐西蘭優質溫暖羊毛被Pure NZ Wool Duvet Queen','',0,'紐西蘭優質溫暖羊毛被Pure NZ Wool Duvet Baby 90x120','Health & Beauty Pure NZ Wool Duvet Queen 550g/m',98,NULL,NULL,NULL,0,2,1,NULL,NULL,NULL,0,NULL,1470108938,2.8,'紐西蘭優質溫暖羊毛被Pure NZ Wool Duvet for baby 90x120'),(148,43,143,'','',30,'有機瑪咔素食膠囊 800毫克60粒','Organic Maca vege caspule 800mg 60s',35,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1470366793,0.15,''),(149,54,161,'羊毛內衣 ','',30,'超級保暖美麗諾純羊毛內衣 女式長袖上衣','Super warm Merino underwear Ladies\' Long sleeves',45,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235988,0.35,''),(150,54,161,'內衣','',20,'超級保暖美麗諾純羊毛內衣 女式長褲','Super warm Merino underwear Ladies\' Leg liner',45,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235955,0.35,''),(151,54,161,'men 內衣','',NULL,'超級保暖美麗諾純羊毛內衣 男式長袖上衣','Super warm Merino underwear Men\'s Long sleeves',45,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235901,0.35,''),(152,54,161,'men 內衣','',NULL,'超級保暖美麗諾純羊毛內衣 男式長褲','Super warm Merino underwear Men\'s Long Joint',45,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235850,0.35,''),(153,54,161,'','',20,'超級保暖美麗諾純羊毛內衣加厚雙針 女式長袖上衣','Super warm Merino underwear Double knitted Ladies\' Long sleeves',68,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235439,0.4,''),(154,54,161,'','',15,'超級保暖美麗諾純羊毛內衣加厚雙針 女式長褲','Super warm Merino underwear Double knitted Ladies\' Legliner',68,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235523,0.4,''),(155,54,161,'','',15,'超級保暖美麗諾純羊毛內衣加厚雙針 男式長袖上衣','Super warm Merino underwear Double knitted Men\'s Long Slevees',68,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235570,0.4,''),(156,54,161,'','',NULL,'超級保暖美麗諾純羊毛內衣加厚雙針 男式長褲','Super warm Merino underwear Double knitted Men\'s Long Joint',68,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235615,0.4,''),(157,24,147,'','',6,'嬰兒保護羊皮 嬰兒椅墊，床墊','Babycare sheepskin long wool',106,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471235725,1.45,''),(158,49,163,'','',30,'白色可愛小羊型羊皮座墊 靠墊 帶拉鍊 51cmx37cm','Sheepskin Cushion Lamb shape 51cmx37cm',43,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1471586764,0.35,''),(159,24,163,'','9415860158401',5,'白色可愛大羊型羊皮座墊 靠墊 帶拉 81cmx56cm','Sheepskin Cushion Large Lamb shape 81cmx56cm',105,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471488569,1,''),(160,57,162,'','',10,'羊毛拖鞋加厚底 紐西蘭製造','Wool sleepers Sheep/Kiwi Printed NZ MADE',60,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471476642,1,'羊毛拖鞋加厚底 紐西蘭製造<div>尺寸： S， M， L， XL.</div>'),(161,57,162,'','',20,'羊毛羊皮拖鞋 軟皮底 紐西蘭製造','Sheepskin Sleepers  NZ Made soft sole',60,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1471476413,0.35,'羊毛羊皮拖鞋 軟皮底 紐西蘭製造<div>Sheepskin Sleepers &nbsp;NZ Made soft sole</div>'),(162,48,141,'紅印蜂膠牙膏100克','',100,'紅印蜂膠牙膏100克','Reseal Propolis Toothpaste 100gm',3.8,NULL,NULL,NULL,0,1,1,0,0,0,0,NULL,1471585079,0.15,''),(163,48,155,'','',100,'紅印兒童牙膏75克','Reseal Kid\'s Toothpaste 75gm',3.8,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1471584981,0.12,''),(164,48,143,'','',50,'紅印吸煙者牙膏100克 ','Reseal Smoker\'s Toothpaste 100gm',3.8,NULL,NULL,NULL,0,1,0,0,0,0,0,NULL,1471584827,0.15,''),(165,48,154,'紅印黑糖500克','',100,'紅印黑糖500克','Redseal Blackstrap Molasses 500gm',5.4,NULL,NULL,NULL,0,1,1,NULL,1,NULL,0,NULL,1469597859,0.6,'紅印黑糖500克<div>Redseal Blackstrap Molasses 500gm</div>'),(166,46,146,'高級膠原蛋白抗皺面霜','',100,'高級膠原蛋白抗皺面霜','La reine Collagen Cream with Royal Jelly',12,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,NULL,1471476158,0.12,'高級膠原蛋白抗皺面霜 La reine Collagen Cream with Royal Jelly 70克\r\n本品蕴涵胶原蛋白、绵羊油、蜂皇浆、芦荟、牛初乳、维生素E等天然成份，增加皮肤弹性，防皱、抗皱。'),(167,46,146,'Placenta','',1,'羊胎素保養面霜','Placenta Rejuvenating Facial cream',12,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,1,NULL,1471586626,0.3,''),(168,22,146,'','',100,'玫瑰精油面霜 100克','Rose oil extract Facial cream 100gm',15,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,1471586536,0.18,''),(169,52,160,'','',15,'紐西蘭5星高級溫暖羊毛被',' 5 star NZ Premium Wool Duvet  King 240cmx210cm 550gm/m2',220,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,1,NULL,1472103001,5.5,'紐西蘭5星高級溫暖羊毛被<div>&nbsp;5 star NZ Premium Wool Duvet &nbsp;King 240cmx210cm 550gm/m2</div>'),(170,52,160,'queen','',30,'紐西蘭5星高級溫暖羊毛被','5 star Premium NZ Wool Duvet Queen 210cmx210cm 550gm/M',210,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,1472102945,5.1,'紐西蘭5星高級溫暖羊毛被<div>5 star Premium NZ Wool Duvet Queen 210cmx210cm 550gm/M</div>'),(171,52,160,'','',30,'紐西蘭5星高級溫暖羊毛被','5 star Premium NZ Wool Duvet  Double 180cmx210cm 550gm/M',200,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,1472102897,4.5,'紐西蘭5星高級溫暖羊毛被<div>5 star Premium NZ Wool Duvet &nbsp;Double 180cmx210cm 550gm/M</div>'),(172,52,160,'','',10,'紐西蘭5星高級溫暖羊毛被','5 star Premium NZ Wool Duvet Single 140cmx210cm 550gm/M',190,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,1472102810,3.9,'紐西蘭5星高級溫暖羊毛被<div>5 star Premium NZ Wool Duvet Single 140cmx210cm 550gm/M</div>'),(173,52,160,'紐西蘭優質溫暖羊毛被Pure NZ Wool Duvet King ','',30,'紐西蘭優質溫暖羊毛被 ','Pure NZ Wool Duvet King 240cmx210cm 550gm/M',135,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1472102755,5,'紐西蘭優質溫暖羊毛被&nbsp;<div>Pure NZ Wool Duvet King 240cmx210cm 550gm/M<br><div><br></div></div>'),(174,52,160,'','',30,'紐西蘭優質溫暖羊毛被','Pure NZ Wool Duvet Queen 210cmx210cm 550gm/M',120,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1472102677,4.6,'紐西蘭優質溫暖羊毛被<div>Pure NZ Wool Duvet Queen 210cmx210cm 550gm/M</div>'),(175,52,160,'','',30,'紐西蘭優質溫暖羊毛被  Pure NZ Wool  雙人 180cmx210cm 550克/平米','Pure NZ Wool Duvet Double 180cmx210cm 550gm/M',115,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1472103525,4.2,'紐西蘭優質溫暖羊毛被<div>Pure NZ Wool Duvet Double 180cmx210cm 550gm/M</div>'),(176,52,160,'single','',10,'紐西蘭優質溫暖羊毛被   單人 140cmx210cm 550克/平米','Pure NZ Wool Duvet Single 140cmx210cm 550gm/M',105,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,0,NULL,1472103616,3.7,'紐西蘭優質溫暖羊毛被<div>Pure NZ Wool Duvet Single 140cmx210cm 550gm/M</div>'),(177,21,143,'deer velvet 鹿茸片','',2,'紐西蘭鹿茸原支切片 頂茸片50克','NZ Deer Velvet tip 50gm',130,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,1471476047,0.15,'紐西蘭鹿茸原支切片 頂茸片50克<div><br></div><div>恕不接受海外郵購，僅接受紐西蘭本地郵購。</div>'),(178,43,141,'comb honey 蜂巢','',12,'紐西蘭天然原裝蜂巢蜜340克','NZ natural Comb Honey 340gm',35,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,1471236593,0.6,'紐西蘭天然原裝蜂巢蜜340克'),(179,58,146,'小青瓜精油面霜','',10,'綿羊脂小青瓜精油面霜100克','Lanolin with Cucumber oil Facial cream 100gm',15,NULL,NULL,NULL,0,1,0,0,0,0,0,1471237443,1471237443,NULL,''),(180,30,154,'','',NULL,'强效海洋胶原蛋白胶囊 60片','Imaglow 60\'s',43,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1472360481,0.25,'<div>好健康Imaglow强效海洋胶原蛋白配方助于嫩滑肌肤，发质光亮和指甲健康。Imaglow强效海洋胶原蛋白有效地恢复受损皮肤，如：细纹，皱纹，毛细血管破裂，色素沉着，色斑和肌肤失衡。此产品的成份富含胶原蛋白和弹性蛋白，能有效地帮助肌肤恢复弹性，细腻和韧性。</div><div><br></div><div>适用对象皮肤干早，皱纹，暗哑，无光泽和肌肤松驰。</div>'),(181,30,143,'','',NULL,'深海鱼油胶囊1000毫克 家庭裝 400粒','Omega 3 1000mg 400\'s family pack',30,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1472361132,0.9,'<div>好健康深海鱼油胶囊1000mg采自于野生深海鱼类体中提炼出来的脂肪酸（欧米加3）。欧米加3的主要成分为EPA和DHA，它们有助于保持健康的心血管，神经系统，心脏功能，胆固醇水平，大脑，灵活关节，舒缓关节炎等。</div><div><br></div><div>好健康深海鱼油胶囊通过了新西兰和澳洲高标准的药物检查与审核，它的汞和重金属含量都是合符国际标准的。</div><div><br></div><div>适用对象•高血压者•心脏不适•易中风者•降低血栓•关节不适•舒缓紧张•心血管疾病•增强记忆力•预防心肌梗塞•胆固醇不平衡</div><div><br></div><div>包装尺寸400粒</div>'),(182,30,143,'','',NULL,'女仕综合维生素锭 60 片','Women\'s Multi 60\'s',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1472361455,0.15,'<div><div>好健康女仕综合维生素锭内含多种维生素和矿物质的高强度配方，提供每日必需的主要营养素以维护整体健康。好健康女仕维生素胶囊含有B群群生素，以维护中枢神经系统及健康的能量水平；维生素D和钙对骨骼健康；叶酸对生殖保健；铁有补血补气功效；β胡萝卜素、维生素C和E、硒和锌可提供抗氧化保护。好健康女仕综合维生素锭还有着提供心血管健康和增强免疫力等效用。</div><div><br></div><div>我们都处于忙碌生知中，赶着从家里去上班、去上学或去社交等。我们总是不能在正确的时间点去吸收营养的食物。一款优良的复合维生素和矿物质配方的保健品，可以确保您可以吸收到每天必需的营养，保护身体健康。</div><div><br></div><div>适用对象•日常保健•饮食不均衡•情绪低落，容易疲乏•女性生殖系统提供营养•舒缓神经系统，缓解压力</div><div><br></div><div>包装尺寸60粒</div></div><div><br></div>'),(183,30,143,'','',10,'男仕综合维生素锭 60粒','Men\'s Multi 60\'s',25,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1472361739,1472361739,0.15,'<div>好健康男仕综合维生素锭是一个综合多种维生素和矿物质针对男性健康所须而设计的保养品。有效地保护前列缐、舒缓工作压力、心血管健康、抗氧化、增强免疫力等。</div><div><br></div><div>我们都处于忙碌生知中，赶着从家里去上班、去上学或去社交等。我们总是不能在正确的时间点去吸收营养的食物。一款优良的复合维生素和矿物质配方的保健品，可以确保您可以吸收到每天必需的营养，保护身体健康。</div><div><br></div><div>适用对象•日常保健•舒缓神经系统，缓解压力•精力不足•生殖和前列腺保健•心血管健康•抗氧化保护•增强免疫力</div><div><br></div><div>包装尺寸60粒</div>'),(184,30,154,'','',15,'骨钙胶囊 150片','Supercal 150\'s',30,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1472362161,1472362161,0.5,'<div>好健康Supercal骨钙胶囊不仅含有骨骼健康必须的钙，此配方还连同各种矿物质和维生素来帮助骨骼的吸收和强化。</div><div><br></div><div>适用对象•骨质疏松•骨伤骨折•肌肉痉挛•高血压•怀孕和哺乳•骨软化 / 佝偻病•更年期骨骼保健</div><div><br></div><div>包装尺寸150粒</div>'),(185,30,143,'','',30,'Hi Cal 高钙液体胶囊','Hi Cal 150\'s liquid calcium',24,NULL,NULL,NULL,0,1,0,0,0,0,0,1472362344,1472362344,0.55,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (21,'MegaMax','MegaMax',NULL,136),(22,'cosmedica','cosmedica',NULL,137),(24,'BOWRON','BOWRON',NULL,138),(25,'Swisse','Swisse',NULL,139),(26,'康维他','Comvita',NULL,139),(27,'新溪岛','Streamland',NULL,136),(28,'纽乐 ','Nutralife',NULL,136),(29,'安佳','Anchor',NULL,136),(30,'好健康','Good health',NULL,136),(31,'康維他','Comvita',NULL,136),(39,'Health Plus','Health Plus',NULL,136),(40,'金奇維','Gold Kiwi',NULL,136),(41,'佳蜜紐西蘭',' HNZ',NULL,136),(42,'Kiwi Manuka','Kiwi Manuka',NULL,136),(43,'NZ Health Food','NZ Health Food',NULL,136),(44,'Wild Fern','Wild Fern',NULL,137),(45,'皇家花蜜','Royal Nectar',NULL,137),(46,'La Reine','La Reine',NULL,137),(47,'I Care','I Care',NULL,137),(48,'紅印','Red Seal',NULL,136),(49,'WindWard','Windward',NULL,138),(50,'Mi Woolies','Mi Woolies',NULL,138),(51,'EMU','EMU',NULL,138),(52,'Health n Beauty','Health n Beauty',NULL,138),(53,'Natures Beauty','Natures Beauty',NULL,137),(54,'Superwarm','Superwarm',NULL,138),(55,'Koru','Koru',NULL,138),(56,'McDonald','McDonald',NULL,138),(57,'GoldenFleece','GoldenFleece',NULL,138),(58,'Leisy','Leisy',NULL,137),(59,'Happy Valley','Happy Valley',NULL,136),(60,'Deer Product','Deer Product',NULL,136);
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
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES (66,72,'list',0,1,'/resources/product_img/20160710/72_list1468126788.jpg',NULL),(67,72,'desc',0,1,'/resources/product_img/20160710/72_desc1468126788.JPG',NULL),(70,74,'list',0,1,'/resources/product_img/20160710/74_list1468127122.jpg',NULL),(76,79,'list',0,1,'/resources/product_img/20160710/79_list1468128005.jpg',NULL),(77,80,'list',0,1,'/resources/product_img/20160710/80_list1468128364.jpg',NULL),(78,81,'list',0,1,'/resources/product_img/20160710/81_list1468128439.jpg',NULL),(79,82,'list',0,1,'/resources/product_img/20160710/82_list1468128502.jpg',NULL),(80,83,'list',0,1,'/resources/product_img/20160710/83_list1468128680.jpg',NULL),(99,93,'list',0,1,'/resources/product_img/20160713/93_list1468377469.JPG',NULL),(104,92,'list',0,1,'/resources/product_img/20160713/92_list1468387359.jpg',NULL),(105,92,'desc',0,1,'/resources/product_img/20160713/92_desc1468387359.jpg',NULL),(109,95,'desc',0,1,'/resources/product_img/20160714/95_desc1468456371.jpg',NULL),(111,97,'list',0,1,'/resources/product_img/20160714/97_list1468456730.jpg',NULL),(112,97,'list',0,1,'/resources/product_img/20160714/98_list1468456730.jpg',NULL),(113,97,'list',0,1,'/resources/product_img/20160714/99_list1468456730.jpg',NULL),(114,99,'list',0,1,'/resources/product_img/20160714/99_list1468465458.jpg',NULL),(115,100,'list',0,1,'/resources/product_img/20160714/100_list1468465921.jpg',NULL),(116,100,'list',0,1,'/resources/product_img/20160714/101_list1468465921.jpg',NULL),(117,100,'list',0,1,'/resources/product_img/20160714/102_list1468465921.jpg',NULL),(121,102,'list',0,1,'/resources/product_img/20160714/102_list1468466525.JPG',NULL),(122,102,'desc',0,1,'/resources/product_img/20160714/102_desc1468466525.jpg',NULL),(129,103,'list',0,1,'/resources/product_img/20160715/103_list1468547316.jpg',NULL),(130,103,'list',0,1,'/resources/product_img/20160715/104_list1468547316.jpg',NULL),(131,103,'list',0,1,'/resources/product_img/20160715/105_list1468547316.jpg',NULL),(132,106,'list',0,1,'/resources/product_img/20160715/106_list1468547486.jpg',NULL),(133,106,'list',0,1,'/resources/product_img/20160715/107_list1468547486.jpg',NULL),(134,106,'list',0,1,'/resources/product_img/20160715/108_list1468547486.jpg',NULL),(135,107,'list',0,1,'/resources/product_img/20160715/107_list1468548186.jpg',NULL),(136,98,'list',0,1,'/resources/product_img/20160715/98_list1468548323.jpg',NULL),(137,94,'list',0,1,'/resources/product_img/20160715/94_list1468548621.jpg',NULL),(138,96,'list',0,1,'/resources/product_img/20160715/96_list1468548784.jpg',NULL),(139,108,'list',0,1,'/resources/product_img/20160715/108_list1468548993.jpg',NULL),(140,109,'list',0,1,'/resources/product_img/20160715/109_list1468549337.jpg',NULL),(141,110,'list',0,1,'/resources/product_img/20160715/110_list1468549608.jpg',NULL),(142,112,'list',0,1,'/resources/product_img/20160715/112_list1468549831.jpg',NULL),(143,114,'list',0,1,'/resources/product_img/20160715/114_list1468553367.jpg',NULL),(144,113,'list',0,1,'/resources/product_img/20160715/113_list1468553398.jpg',NULL),(145,111,'list',0,1,'/resources/product_img/20160715/111_list1468553616.jpg',NULL),(148,84,'desc',0,1,'/resources/product_img/20160717/84_desc1468716601.jpg',NULL),(150,85,'desc',0,1,'/resources/product_img/20160717/85_desc1468717031.jpg',NULL),(165,125,'list',0,1,'/resources/product_img/20160717/125_list1468721335.jpg',NULL),(166,126,'list',0,1,'/resources/product_img/20160717/126_list1468721514.jpg',NULL),(167,127,'list',0,1,'/resources/product_img/20160717/127_list1468721686.jpg',NULL),(168,128,'list',0,1,'/resources/product_img/20160717/128_list1468721802.jpg',NULL),(169,129,'list',0,1,'/resources/product_img/20160717/129_list1468721963.jpg',NULL),(171,130,'list',0,1,'/resources/product_img/20160717/130_list1468722885.jpg',NULL),(172,131,'list',0,1,'/resources/product_img/20160717/131_list1468724703.jpg',NULL),(173,131,'desc',0,1,'/resources/product_img/20160717/131_desc1468724703.jpg',NULL),(174,132,'list',0,1,'/resources/product_img/20160717/132_list1468724847.jpg',NULL),(175,133,'list',0,1,'/resources/product_img/20160717/133_list1468725038.jpg',NULL),(176,133,'desc',0,1,'/resources/product_img/20160717/133_desc1468725038.jpg',NULL),(178,134,'desc',0,1,'/resources/product_img/20160717/134_desc1468725190.jpg',NULL),(179,135,'list',0,1,'/resources/product_img/20160717/135_list1468725361.jpg',NULL),(180,136,'list',0,1,'/resources/product_img/20160717/136_list1468725479.jpg',NULL),(181,137,'list',0,1,'/resources/product_img/20160717/137_list1468725614.jpg',NULL),(182,137,'desc',0,1,'/resources/product_img/20160717/137_desc1468725614.jpg',NULL),(183,122,'list',0,1,'/resources/product_img/20160717/122_list1468726670.jpg',NULL),(185,118,'list',0,1,'/resources/product_img/20160717/118_list1468727431.jpg',NULL),(189,119,'list',0,1,'/resources/product_img/20160717/119_list1468727927.jpg',NULL),(190,123,'list',0,1,'/resources/product_img/20160717/123_list1468728350.jpg',NULL),(191,95,'list',0,1,'/resources/product_img/20160717/95_list1468728405.jpg',NULL),(195,141,'list',0,1,'/resources/product_img/20160725/141_list1469489035.JPG',NULL),(197,142,'list',0,1,'/resources/product_img/20160725/142_list1469489629.JPG',NULL),(206,144,'list',0,1,'/resources/product_img/20160726/144_list1469507400.jpg',NULL),(207,144,'desc',0,1,'/resources/product_img/20160726/144_desc1469507400.jpg',NULL),(209,85,'desc',0,1,'/resources/product_img/20160726/85_desc1469507499.jpg',NULL),(223,124,'list',0,1,'/resources/product_img/20160726/124_list1469509094.jpg',NULL),(226,121,'list',0,1,'/resources/product_img/20160726/121_list1469509176.jpg',NULL),(229,117,'list',0,1,'/resources/product_img/20160726/117_list1469509259.jpg',NULL),(230,116,'list',0,1,'/resources/product_img/20160726/116_list1469509305.jpg',NULL),(232,75,'list',0,1,'/resources/product_img/20160726/75_list1469509432.jpg',NULL),(233,88,'list',0,1,'/resources/product_img/20160726/88_list1469509668.jpg',NULL),(268,143,'list',0,1,'/resources/product_img/20160727/143_list1469586546.jpg',NULL),(276,145,'list',0,1,'/resources/product_img/20160727/145_list1469589721.jpg',NULL),(278,134,'list',0,1,'/resources/product_img/20160727/134_list1469590655.jpg',NULL),(279,115,'list',0,1,'/resources/product_img/20160727/115_list1469591012.jpg',NULL),(281,105,'list',0,1,'/resources/product_img/20160727/105_list1469591231.jpg',NULL),(282,105,'list',0,1,'/resources/product_img/20160727/105_list1469591254.jpg',NULL),(285,165,'list',0,1,'/resources/product_img/20160727/165_list1469597859.png',NULL),(299,146,'list',0,1,'/resources/product_img/20160728/146_list1469747987.jpg',NULL),(300,140,'list',0,1,'/resources/product_img/20160728/140_list1469748041.jpg',NULL),(301,139,'list',0,1,'/resources/product_img/20160728/139_list1469748066.jpg',NULL),(308,147,'list',0,1,'/resources/product_img/20160731/147_list1469943277.jpg',NULL),(309,147,'list',0,1,'/resources/product_img/20160731/147_list1469943316.jpg',NULL),(310,147,'list',0,1,'/resources/product_img/20160731/148_list1469943316.jpg',NULL),(313,169,'list',0,1,'/resources/product_img/20160801/169_list1470029629.jpg',NULL),(317,138,'list',0,1,'/resources/product_img/20160801/138_list1470093452.jpg',NULL),(318,138,'list',0,1,'/resources/product_img/20160801/139_list1470093452.jpg',NULL),(319,138,'list',0,1,'/resources/product_img/20160801/140_list1470093453.jpg',NULL),(320,120,'list',0,1,'/resources/product_img/20160801/120_list1470093596.jpg',NULL),(321,104,'list',0,1,'/resources/product_img/20160801/104_list1470094806.jpg',NULL),(322,104,'list',0,1,'/resources/product_img/20160801/105_list1470094806.jpg',NULL),(323,104,'list',0,1,'/resources/product_img/20160801/106_list1470094806.jpg',NULL),(324,101,'list',0,1,'/resources/product_img/20160801/101_list1470094998.jpg',NULL),(325,101,'list',0,1,'/resources/product_img/20160801/102_list1470094998.jpg',NULL),(326,101,'list',0,1,'/resources/product_img/20160801/103_list1470094998.jpg',NULL),(327,73,'list',0,1,'/resources/product_img/20160801/73_list1470095277.jpg',NULL),(328,73,'list',0,1,'/resources/product_img/20160801/74_list1470095277.jpg',NULL),(329,73,'list',0,1,'/resources/product_img/20160801/75_list1470095277.jpg',NULL),(332,76,'list',0,1,'/resources/product_img/20160802/76_list1470106190.jpg',NULL),(340,173,'list',0,1,'/resources/product_img/20160802/173_list1470108424.jpg',NULL),(341,173,'list',0,1,'/resources/product_img/20160802/174_list1470108424.jpg',NULL),(342,173,'list',0,1,'/resources/product_img/20160802/175_list1470108424.jpg',NULL),(343,174,'list',0,1,'/resources/product_img/20160802/174_list1470108454.jpg',NULL),(344,174,'list',0,1,'/resources/product_img/20160802/175_list1470108454.jpg',NULL),(346,175,'list',0,1,'/resources/product_img/20160802/175_list1470108488.jpg',NULL),(347,175,'list',0,1,'/resources/product_img/20160802/176_list1470108488.jpg',NULL),(349,176,'list',0,1,'/resources/product_img/20160802/176_list1470108511.jpg',NULL),(350,176,'list',0,1,'/resources/product_img/20160802/177_list1470108511.jpg',NULL),(352,170,'list',0,1,'/resources/product_img/20160802/170_list1470108570.jpg',NULL),(353,171,'list',0,1,'/resources/product_img/20160802/171_list1470108589.jpg',NULL),(354,172,'list',0,1,'/resources/product_img/20160802/172_list1470108617.jpg',NULL),(355,148,'list',0,1,'/resources/product_img/20160805/148_list1470366788.jpg',NULL),(368,169,'desc',0,1,'/resources/product_img/20160815/169_desc1471231928.png',NULL),(369,170,'desc',0,1,'/resources/product_img/20160815/170_desc1471232033.png',NULL),(370,171,'desc',0,1,'/resources/product_img/20160815/171_desc1471232062.png',NULL),(371,172,'desc',0,1,'/resources/product_img/20160815/172_desc1471232140.png',NULL),(372,174,'desc',0,1,'/resources/product_img/20160815/174_desc1471232206.png',NULL),(373,175,'desc',0,1,'/resources/product_img/20160815/175_desc1471232268.png',NULL),(374,176,'desc',0,1,'/resources/product_img/20160815/176_desc1471232482.png',NULL),(379,87,'list',0,1,'/resources/product_img/20160815/87_list1471234255.png',NULL),(385,157,'list',0,1,'/resources/product_img/20160815/157_list1471235031.PNG',NULL),(386,153,'list',0,1,'/resources/product_img/20160815/153_list1471235439.png',NULL),(387,153,'desc',0,1,'/resources/product_img/20160815/153_desc1471235439.png',NULL),(388,154,'list',0,1,'/resources/product_img/20160815/154_list1471235523.png',NULL),(389,154,'desc',0,1,'/resources/product_img/20160815/154_desc1471235524.png',NULL),(390,155,'list',0,1,'/resources/product_img/20160815/155_list1471235570.png',NULL),(391,155,'desc',0,1,'/resources/product_img/20160815/155_desc1471235570.png',NULL),(392,156,'list',0,1,'/resources/product_img/20160815/156_list1471235615.png',NULL),(393,156,'desc',0,1,'/resources/product_img/20160815/156_desc1471235615.png',NULL),(396,157,'list',0,1,'/resources/product_img/20160815/158_list1471235691.png',NULL),(397,157,'desc',0,1,'/resources/product_img/20160815/157_desc1471235725.png',NULL),(398,157,'desc',0,1,'/resources/product_img/20160815/158_desc1471235725.png',NULL),(399,152,'list',0,1,'/resources/product_img/20160815/152_list1471235850.png',NULL),(400,152,'desc',0,1,'/resources/product_img/20160815/152_desc1471235850.png',NULL),(401,151,'list',0,1,'/resources/product_img/20160815/151_list1471235901.png',NULL),(402,151,'desc',0,1,'/resources/product_img/20160815/151_desc1471235901.png',NULL),(403,150,'list',0,1,'/resources/product_img/20160815/150_list1471235955.png',NULL),(404,150,'desc',0,1,'/resources/product_img/20160815/150_desc1471235956.png',NULL),(405,149,'list',0,1,'/resources/product_img/20160815/149_list1471235988.png',NULL),(406,149,'desc',0,1,'/resources/product_img/20160815/149_desc1471235988.png',NULL),(407,86,'list',0,1,'/resources/product_img/20160815/86_list1471236102.png',NULL),(413,178,'list',0,1,'/resources/product_img/20160815/178_list1471236426.png',NULL),(415,178,'list',0,1,'/resources/product_img/20160815/180_list1471236426.png',NULL),(420,179,'list',0,1,'/resources/product_img/20160815/179_list1471237443.png',NULL),(421,179,'list',0,1,'/resources/product_img/20160815/180_list1471237443.png',NULL),(426,177,'list',0,1,'/resources/product_img/20160817/177_list1471476005.png',NULL),(427,177,'list',0,1,'/resources/product_img/20160817/178_list1471476005.png',NULL),(428,177,'desc',0,1,'/resources/product_img/20160817/177_desc1471476047.png',NULL),(429,177,'desc',0,1,'/resources/product_img/20160817/178_desc1471476047.png',NULL),(430,166,'list',0,1,'/resources/product_img/20160817/166_list1471476158.png',NULL),(431,166,'list',0,1,'/resources/product_img/20160817/167_list1471476158.png',NULL),(436,161,'list',0,1,'/resources/product_img/20160817/161_list1471476413.png',NULL),(437,161,'list',0,1,'/resources/product_img/20160817/162_list1471476413.png',NULL),(443,160,'list',0,1,'/resources/product_img/20160817/160_list1471476642.png',NULL),(444,160,'list',0,1,'/resources/product_img/20160817/161_list1471476642.png',NULL),(446,159,'list',0,1,'/resources/product_img/20160818/159_list1471488569.png',NULL),(448,90,'list',0,1,'/resources/product_img/20160818/90_list1471489675.png',NULL),(449,90,'list',0,1,'/resources/product_img/20160818/91_list1471489675.PNG',NULL),(451,91,'list',0,1,'/resources/product_img/20160818/91_list1471489792.PNG',NULL),(454,164,'list',0,1,'/resources/product_img/20160819/164_list1471584821.png',NULL),(455,163,'list',0,1,'/resources/product_img/20160819/163_list1471584977.png',NULL),(456,162,'list',0,1,'/resources/product_img/20160819/162_list1471585071.png',NULL),(457,89,'list',0,1,'/resources/product_img/20160819/89_list1471585514.png',NULL),(459,84,'list',0,1,'/resources/product_img/20160819/84_list1471585704.png',NULL),(460,85,'list',0,1,'/resources/product_img/20160819/85_list1471585827.png',NULL),(463,168,'list',0,1,'/resources/product_img/20160819/168_list1471586523.png',NULL),(464,168,'list',0,1,'/resources/product_img/20160819/168_list1471586532.png',NULL),(465,167,'list',0,1,'/resources/product_img/20160819/167_list1471586614.png',NULL),(466,167,'list',0,1,'/resources/product_img/20160819/167_list1471586626.png',NULL),(467,158,'list',0,1,'/resources/product_img/20160819/158_list1471586759.png',NULL),(468,180,'list',0,1,'/resources/product_img/20160828/180_list1472360419.jpg',NULL),(469,181,'list',0,1,'/resources/product_img/20160828/181_list1472360961.jpg',NULL),(471,182,'list',0,1,'/resources/product_img/20160828/182_list1472361455.jpg',NULL),(472,183,'list',0,1,'/resources/product_img/20160828/183_list1472361739.jpg',NULL),(473,184,'list',0,1,'/resources/product_img/20160828/184_list1472362161.jpg',NULL),(474,185,'list',0,1,'/resources/product_img/20160828/185_list1472362344.jpg',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_address`
--

LOCK TABLES `to_address` WRITE;
/*!40000 ALTER TABLE `to_address` DISABLE KEYS */;
INSERT INTO `to_address` VALUES (1,31,'12 a rd',NULL,NULL,NULL,'0273047888','ff',NULL),(2,32,'中欧',NULL,NULL,NULL,'021123456','Leo',NULL),(3,34,'北京方庄  芳古园 一区四号楼 519',NULL,NULL,NULL,'0221828358','liang',NULL);
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

-- Dump completed on 2016-08-31 22:24:49
