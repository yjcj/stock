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
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockcomment`
--

DROP TABLE IF EXISTS `blockcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockcomment` (
  `bcid` int(11) NOT NULL,
  `blockid` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockcomment`
--

LOCK TABLES `blockcomment` WRITE;
/*!40000 ALTER TABLE `blockcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockcomment` ENABLE KEYS */;
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
  `bsid` int(11) NOT NULL AUTO_INCREMENT,
  `stockid` varchar(45) DEFAULT NULL,
  `blockid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bsid`)
) ENGINE=InnoDB AUTO_INCREMENT=7827 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `btos`
--

LOCK TABLES `btos` WRITE;
/*!40000 ALTER TABLE `btos` DISABLE KEYS */;
/*!40000 ALTER TABLE `btos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockdata`
--

DROP TABLE IF EXISTS `stockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockdata` (
  `stockid` varchar(45) DEFAULT NULL,
  `current` double DEFAULT NULL,
  `market_capital` double DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  `turnover_rate` float DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `volume_ratio` double DEFAULT NULL,
  `chg` double DEFAULT NULL,
  `amplitude` double DEFAULT NULL,
  `current_year_percent` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `pb` double DEFAULT NULL,
  `pe` double DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockdata`
--

LOCK TABLES `stockdata` WRITE;
/*!40000 ALTER TABLE `stockdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockicomment`
--

DROP TABLE IF EXISTS `stockicomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockicomment` (
  `scid` int(11) NOT NULL,
  `stockid` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockicomment`
--

LOCK TABLES `stockicomment` WRITE;
/*!40000 ALTER TABLE `stockicomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockicomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thsblock`
--

DROP TABLE IF EXISTS `thsblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thsblock` (
  `blockid` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thsblock`
--

LOCK TABLES `thsblock` WRITE;
/*!40000 ALTER TABLE `thsblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `thsblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thsblockdata`
--

DROP TABLE IF EXISTS `thsblockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thsblockdata` (
  `blockid` varchar(45) NOT NULL,
  `begin` double DEFAULT NULL,
  `end` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `percent` varchar(45) DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  `input` double DEFAULT NULL,
  `account` double DEFAULT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thsblockdata`
--

LOCK TABLES `thsblockdata` WRITE;
/*!40000 ALTER TABLE `thsblockdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `thsblockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thsbtos`
--

DROP TABLE IF EXISTS `thsbtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thsbtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockid` varchar(45) DEFAULT NULL,
  `stockid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thsbtos`
--

LOCK TABLES `thsbtos` WRITE;
/*!40000 ALTER TABLE `thsbtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `thsbtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thsstockdata`
--

DROP TABLE IF EXISTS `thsstockdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thsstockdata` (
  `stockid` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `current` varchar(45) DEFAULT NULL,
  `percent` varchar(45) DEFAULT NULL,
  `chg` varchar(45) DEFAULT NULL,
  `speed` varchar(45) DEFAULT NULL,
  `changehand` varchar(45) DEFAULT NULL,
  `amount_ratio` varchar(45) DEFAULT NULL,
  `amplitude` varchar(45) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `flow` varchar(45) DEFAULT NULL,
  `flowmarket` varchar(45) DEFAULT NULL,
  `pe` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thsstockdata`
--

LOCK TABLES `thsstockdata` WRITE;
/*!40000 ALTER TABLE `thsstockdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `thsstockdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thsstockkline`
--

DROP TABLE IF EXISTS `thsstockkline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thsstockkline` (
  `stockid` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `begin` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `end` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thsstockkline`
--

LOCK TABLES `thsstockkline` WRITE;
/*!40000 ALTER TABLE `thsstockkline` DISABLE KEYS */;
/*!40000 ALTER TABLE `thsstockkline` ENABLE KEYS */;
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

-- Dump completed on 2019-05-16 16:33:30
