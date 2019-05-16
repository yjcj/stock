-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fstock
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockid` varchar(45) DEFAULT NULL,
  `blockname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'S2701','半导体'),(2,'S3301','白色家电'),(3,'S3602','包装印刷'),(4,'S4902','保险'),(5,'S6102','玻璃制造'),(6,'S1107','畜禽养殖'),(7,'S2104','采掘服务'),(8,'S4604','餐饮'),(9,'S6504','船舶制造'),(10,'S1108','动物保健'),(11,'S2705','电子制造'),(12,'S4101','电力'),(13,'S4903','多元金融'),(14,'S6301','电机'),(15,'S6302','电气自动化设备'),(16,'S6303','电源设备'),(17,'S6503','地面兵装'),(18,'S3501','纺织制造'),(19,'S3502','服装家纺'),(20,'S4301','房地产开发'),(21,'S6201','房屋建设'),(22,'S2301','钢铁'),(23,'S2403','工业金属'),(24,'S2703','光学光电子'),(25,'S4201','港口'),(26,'S4202','高速公路'),(27,'S4203','公交'),(28,'S6304','高低压设备'),(29,'S2202','化学原料'),(30,'S2203','化学制品'),(31,'S2204','化学纤维'),(32,'S2404','黄金'),(33,'S3701','化学制药'),(34,'S4104','环保工程及服务'),(35,'S4204','航空运输'),(36,'S4206','航运'),(37,'S6501','航天装备'),(38,'S6502','航空装备'),(39,'S7203','互联网传媒'),(40,'S2402','金属非金属新材...'),(41,'S3603','家用轻工'),(42,'S4205','机场'),(43,'S4601','景点'),(44,'S4602','酒店'),(45,'S6203','基础建设'),(46,'S6404','金属制品'),(47,'S7101','计算机设备'),(48,'S7102','计算机应用'),(49,'S1103','林业'),(50,'S4603','旅游综合'),(51,'S2102','煤炭开采'),(52,'S4502','贸易'),(53,'S1105','农产品加工'),(54,'S1106','农业综合'),(55,'S2103','其他采掘'),(56,'S2704','其他电子'),(57,'S2801','汽车整车'),(58,'S2802','汽车零部件'),(59,'S2803','汽车服务'),(60,'S2804','其他交运设备'),(61,'S3604','其他轻工制造'),(62,'S4605','其他休闲服务'),(63,'S6103','其他建材'),(64,'S4103','燃气'),(65,'S1104','饲料'),(66,'S2101','石油开采'),(67,'S2201','石油化工'),(68,'S2205','塑料'),(69,'S3302','视听器材'),(70,'S3404','食品加工'),(71,'S3703','生物制品'),(72,'S4102','水务'),(73,'S4505','商业物业经营'),(74,'S6101','水泥制造'),(75,'S4207','铁路运输'),(76,'S6401','通用机械'),(77,'S7301','通信运营'),(78,'S7302','通信设备'),(79,'S4208','物流'),(80,'S7201','文化传媒'),(81,'S2206','橡胶'),(82,'S2405','稀有金属'),(83,'S1102','渔业'),(84,'S2702','元件'),(85,'S3403','饮料制造'),(86,'S3704','医药商业'),(87,'S3705','医疗器械'),(88,'S3706','医疗服务'),(89,'S4302','园区开发'),(90,'S4503','一般零售'),(91,'S4801','银行'),(92,'S6205','园林工程'),(93,'S6403','仪器仪表'),(94,'S6405','运输设备'),(95,'S7202','营销传播'),(96,'S1101','种植业'),(97,'S3601','造纸'),(98,'S3702','中药'),(99,'S4504','专业零售'),(100,'S4901','证券'),(101,'S5101','综合'),(102,'S6202','装修装饰'),(103,'S6204','专业工程'),(104,'S6402','专用设备'),(105,'S2701','半导体'),(106,'S3301','白色家电'),(107,'S3602','包装印刷'),(108,'S4902','保险'),(109,'S6102','玻璃制造'),(110,'S1107','畜禽养殖'),(111,'S2104','采掘服务'),(112,'S4604','餐饮'),(113,'S6504','船舶制造'),(114,'S1108','动物保健'),(115,'S2705','电子制造'),(116,'S4101','电力'),(117,'S4903','多元金融'),(118,'S6301','电机'),(119,'S6302','电气自动化设备'),(120,'S6303','电源设备'),(121,'S6503','地面兵装'),(122,'S3501','纺织制造'),(123,'S3502','服装家纺'),(124,'S4301','房地产开发'),(125,'S6201','房屋建设'),(126,'S2301','钢铁'),(127,'S2403','工业金属'),(128,'S2703','光学光电子'),(129,'S4201','港口'),(130,'S4202','高速公路'),(131,'S4203','公交'),(132,'S6304','高低压设备'),(133,'S2202','化学原料'),(134,'S2203','化学制品'),(135,'S2204','化学纤维'),(136,'S2404','黄金'),(137,'S3701','化学制药'),(138,'S4104','环保工程及服务'),(139,'S4204','航空运输'),(140,'S4206','航运'),(141,'S6501','航天装备'),(142,'S6502','航空装备'),(143,'S7203','互联网传媒'),(144,'S2402','金属非金属新材...'),(145,'S3603','家用轻工'),(146,'S4205','机场'),(147,'S4601','景点'),(148,'S4602','酒店'),(149,'S6203','基础建设'),(150,'S6404','金属制品'),(151,'S7101','计算机设备'),(152,'S7102','计算机应用'),(153,'S1103','林业'),(154,'S4603','旅游综合'),(155,'S2102','煤炭开采'),(156,'S4502','贸易'),(157,'S1105','农产品加工'),(158,'S1106','农业综合'),(159,'S2103','其他采掘'),(160,'S2704','其他电子'),(161,'S2801','汽车整车'),(162,'S2802','汽车零部件'),(163,'S2803','汽车服务'),(164,'S2804','其他交运设备'),(165,'S3604','其他轻工制造'),(166,'S4605','其他休闲服务'),(167,'S6103','其他建材'),(168,'S4103','燃气'),(169,'S1104','饲料'),(170,'S2101','石油开采'),(171,'S2201','石油化工'),(172,'S2205','塑料'),(173,'S3302','视听器材'),(174,'S3404','食品加工'),(175,'S3703','生物制品'),(176,'S4102','水务'),(177,'S4505','商业物业经营'),(178,'S6101','水泥制造'),(179,'S4207','铁路运输'),(180,'S6401','通用机械'),(181,'S7301','通信运营'),(182,'S7302','通信设备'),(183,'S4208','物流'),(184,'S7201','文化传媒'),(185,'S2206','橡胶'),(186,'S2405','稀有金属'),(187,'S1102','渔业'),(188,'S2702','元件'),(189,'S3403','饮料制造'),(190,'S3704','医药商业'),(191,'S3705','医疗器械'),(192,'S3706','医疗服务'),(193,'S4302','园区开发'),(194,'S4503','一般零售'),(195,'S4801','银行'),(196,'S6205','园林工程'),(197,'S6403','仪器仪表'),(198,'S6405','运输设备'),(199,'S7202','营销传播'),(200,'S1101','种植业'),(201,'S3601','造纸'),(202,'S3702','中药'),(203,'S4504','专业零售'),(204,'S4901','证券'),(205,'S5101','综合'),(206,'S6202','装修装饰'),(207,'S6204','专业工程'),(208,'S6402','专用设备'),(209,'S2701???','半导体'),(210,'S3301???','白色家电'),(211,'S3602???','包装印刷'),(212,'S4902???','保险'),(213,'S6102???','玻璃制造'),(214,'S1107???','畜禽养殖'),(215,'S2104???','采掘服务'),(216,'S4604???','餐饮'),(217,'S6504???','船舶制造'),(218,'S1108???','动物保健'),(219,'S2705???','电子制造'),(220,'S4101???','电力'),(221,'S4903???','多元金融'),(222,'S6301???','电机'),(223,'S6302???','电气自动化设备'),(224,'S6303???','电源设备'),(225,'S6503???','地面兵装'),(226,'S3501???','纺织制造'),(227,'S3502???','服装家纺'),(228,'S4301???','房地产开发'),(229,'S6201???','房屋建设'),(230,'S2301???','钢铁'),(231,'S2403???','工业金属'),(232,'S2703???','光学光电子'),(233,'S4201???','港口'),(234,'S4202???','高速公路'),(235,'S4203???','公交'),(236,'S6304???','高低压设备'),(237,'S2202???','化学原料'),(238,'S2203???','化学制品'),(239,'S2204???','化学纤维'),(240,'S2404???','黄金'),(241,'S3701???','化学制药'),(242,'S4104???','环保工程及服务'),(243,'S4204???','航空运输'),(244,'S4206???','航运'),(245,'S6501???','航天装备'),(246,'S6502???','航空装备'),(247,'S7203???','互联网传媒'),(248,'S2402???','金属非金属新材...'),(249,'S3603???','家用轻工'),(250,'S4205???','机场'),(251,'S4601???','景点'),(252,'S4602???','酒店'),(253,'S6203???','基础建设'),(254,'S6404???','金属制品'),(255,'S7101???','计算机设备'),(256,'S7102???','计算机应用'),(257,'S1103???','林业'),(258,'S4603???','旅游综合'),(259,'S2102???','煤炭开采'),(260,'S4502???','贸易'),(261,'S1105???','农产品加工'),(262,'S1106???','农业综合'),(263,'S2103???','其他采掘'),(264,'S2704???','其他电子'),(265,'S2801???','汽车整车'),(266,'S2802???','汽车零部件'),(267,'S2803???','汽车服务'),(268,'S2804???','其他交运设备'),(269,'S3604???','其他轻工制造'),(270,'S4605???','其他休闲服务'),(271,'S6103???','其他建材'),(272,'S4103???','燃气'),(273,'S1104???','饲料'),(274,'S2101???','石油开采'),(275,'S2201???','石油化工'),(276,'S2205???','塑料'),(277,'S3302???','视听器材'),(278,'S3404???','食品加工'),(279,'S3703???','生物制品'),(280,'S4102???','水务'),(281,'S4505???','商业物业经营'),(282,'S6101???','水泥制造'),(283,'S4207???','铁路运输'),(284,'S6401???','通用机械'),(285,'S7301???','通信运营'),(286,'S7302???','通信设备'),(287,'S4208???','物流'),(288,'S7201???','文化传媒'),(289,'S2206???','橡胶'),(290,'S2405???','稀有金属'),(291,'S1102???','渔业'),(292,'S2702???','元件'),(293,'S3403???','饮料制造'),(294,'S3704???','医药商业'),(295,'S3705???','医疗器械'),(296,'S3706???','医疗服务'),(297,'S4302???','园区开发'),(298,'S4503???','一般零售'),(299,'S4801???','银行'),(300,'S6205???','园林工程'),(301,'S6403???','仪器仪表'),(302,'S6405???','运输设备'),(303,'S7202???','营销传播'),(304,'S1101???','种植业'),(305,'S3601???','造纸'),(306,'S3702???','中药'),(307,'S4504???','专业零售'),(308,'S4901???','证券'),(309,'S5101???','综合'),(310,'S6202???','装修装饰'),(311,'S6204???','专业工程'),(312,'S6402???','专用设备'),(313,'S2701','半导体'),(314,'S3301','白色家电'),(315,'S3602','包装印刷'),(316,'S4902','保险'),(317,'S6102','玻璃制造'),(318,'S1107','畜禽养殖'),(319,'S2104','采掘服务'),(320,'S4604','餐饮'),(321,'S6504','船舶制造'),(322,'S1108','动物保健'),(323,'S2705','电子制造'),(324,'S4101','电力'),(325,'S4903','多元金融'),(326,'S6301','电机'),(327,'S6302','电气自动化设备'),(328,'S6303','电源设备'),(329,'S6503','地面兵装'),(330,'S3501','纺织制造'),(331,'S3502','服装家纺'),(332,'S4301','房地产开发'),(333,'S6201','房屋建设'),(334,'S2301','钢铁'),(335,'S2403','工业金属'),(336,'S2703','光学光电子'),(337,'S4201','港口'),(338,'S4202','高速公路'),(339,'S4203','公交'),(340,'S6304','高低压设备'),(341,'S2202','化学原料'),(342,'S2203','化学制品'),(343,'S2204','化学纤维'),(344,'S2404','黄金'),(345,'S3701','化学制药'),(346,'S4104','环保工程及服务'),(347,'S4204','航空运输'),(348,'S4206','航运'),(349,'S6501','航天装备'),(350,'S6502','航空装备'),(351,'S7203','互联网传媒'),(352,'S2402','金属非金属新材...'),(353,'S3603','家用轻工'),(354,'S4205','机场'),(355,'S4601','景点'),(356,'S4602','酒店'),(357,'S6203','基础建设'),(358,'S6404','金属制品'),(359,'S7101','计算机设备'),(360,'S7102','计算机应用'),(361,'S1103','林业'),(362,'S4603','旅游综合'),(363,'S2102','煤炭开采'),(364,'S4502','贸易'),(365,'S1105','农产品加工'),(366,'S1106','农业综合'),(367,'S2103','其他采掘'),(368,'S2704','其他电子'),(369,'S2801','汽车整车'),(370,'S2802','汽车零部件'),(371,'S2803','汽车服务'),(372,'S2804','其他交运设备'),(373,'S3604','其他轻工制造'),(374,'S4605','其他休闲服务'),(375,'S6103','其他建材'),(376,'S4103','燃气'),(377,'S1104','饲料'),(378,'S2101','石油开采'),(379,'S2201','石油化工'),(380,'S2205','塑料'),(381,'S3302','视听器材'),(382,'S3404','食品加工'),(383,'S3703','生物制品'),(384,'S4102','水务'),(385,'S4505','商业物业经营'),(386,'S6101','水泥制造'),(387,'S4207','铁路运输'),(388,'S6401','通用机械'),(389,'S7301','通信运营'),(390,'S7302','通信设备'),(391,'S4208','物流'),(392,'S7201','文化传媒'),(393,'S2206','橡胶'),(394,'S2405','稀有金属'),(395,'S1102','渔业'),(396,'S2702','元件'),(397,'S3403','饮料制造'),(398,'S3704','医药商业'),(399,'S3705','医疗器械'),(400,'S3706','医疗服务'),(401,'S4302','园区开发'),(402,'S4503','一般零售'),(403,'S4801','银行'),(404,'S6205','园林工程'),(405,'S6403','仪器仪表'),(406,'S6405','运输设备'),(407,'S7202','营销传播'),(408,'S1101','种植业'),(409,'S3601','造纸'),(410,'S3702','中药'),(411,'S4504','专业零售'),(412,'S4901','证券'),(413,'S5101','综合'),(414,'S6202','装修装饰'),(415,'S6204','专业工程'),(416,'S6402','专用设备');
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockcommit`
--

DROP TABLE IF EXISTS `blockcommit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockcommit` (
  `bcid` int(11) NOT NULL,
  `blockid` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockcommit`
--

LOCK TABLES `blockcommit` WRITE;
/*!40000 ALTER TABLE `blockcommit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockcommit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockhistory`
--

DROP TABLE IF EXISTS `blockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockhistory` (
  `bhid` int(11) NOT NULL,
  `blockid` int(11) DEFAULT NULL,
  `blockname` varchar(45) DEFAULT NULL,
  `beginprice` double DEFAULT NULL,
  `endprice` double DEFAULT NULL,
  `maxprice` double DEFAULT NULL,
  `minprice` double DEFAULT NULL,
  `endpricebefore` double DEFAULT NULL,
  `increase` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`bhid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockhistory`
--

LOCK TABLES `blockhistory` WRITE;
/*!40000 ALTER TABLE `blockhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockk`
--

DROP TABLE IF EXISTS `blockk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockk` (
  `bkid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`bkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockk`
--

LOCK TABLES `blockk` WRITE;
/*!40000 ALTER TABLE `blockk` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockmainstock`
--

DROP TABLE IF EXISTS `blockmainstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockmainstock` (
  `bmsid` int(11) NOT NULL,
  `blockid` varchar(45) DEFAULT NULL,
  `stockid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bmsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockmainstock`
--

LOCK TABLES `blockmainstock` WRITE;
/*!40000 ALTER TABLE `blockmainstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockmainstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `btos`
--

DROP TABLE IF EXISTS `btos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `btos` (
  `bsid` int(11) NOT NULL,
  `stockid` int(11) DEFAULT NULL,
  `blockid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `btos`
--

LOCK TABLES `btos` WRITE;
/*!40000 ALTER TABLE `btos` DISABLE KEYS */;
/*!40000 ALTER TABLE `btos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sotck`
--

DROP TABLE IF EXISTS `sotck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sotck` (
  `stockid` int(11) NOT NULL,
  `stockname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sotck`
--

LOCK TABLES `sotck` WRITE;
/*!40000 ALTER TABLE `sotck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sotck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockdata`
--

DROP TABLE IF EXISTS `stockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockdata` (
  `stockid` int(11) NOT NULL,
  `current` double DEFAULT NULL,
  `market_capital` double DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `stockdatacol` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `volume_ratio` double DEFAULT NULL,
  `chg` double DEFAULT NULL,
  `amplitude` double DEFAULT NULL,
  `current_year_percent` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockdata`
--

LOCK TABLES `stockdata` WRITE;
/*!40000 ALTER TABLE `stockdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockhistory`
--

DROP TABLE IF EXISTS `stockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockhistory` (
  `shid` int(11) NOT NULL,
  `stockid` int(11) DEFAULT NULL,
  `stockname` double DEFAULT NULL,
  `beginprice` double DEFAULT NULL,
  `endprice` double DEFAULT NULL,
  `maxprice` double DEFAULT NULL,
  `minprice` double DEFAULT NULL,
  `endpricebefore` double DEFAULT NULL,
  `increase` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockhistory`
--

LOCK TABLES `stockhistory` WRITE;
/*!40000 ALTER TABLE `stockhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockicommit`
--

DROP TABLE IF EXISTS `stockicommit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockicommit` (
  `scid` int(11) NOT NULL,
  `stockid` int(11) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockicommit`
--

LOCK TABLES `stockicommit` WRITE;
/*!40000 ALTER TABLE `stockicommit` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockicommit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockk`
--

DROP TABLE IF EXISTS `stockk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockk` (
  `skid` int(11) NOT NULL,
  `stockid` int(11) DEFAULT NULL,
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockk`
--

LOCK TABLES `stockk` WRITE;
/*!40000 ALTER TABLE `stockk` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fstock'
--

--
-- Dumping routines for database 'fstock'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16  9:42:52
