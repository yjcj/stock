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
  `blockid` int(11) NOT NULL,
  `blockname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
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

-- Dump completed on 2019-05-14 17:48:53
