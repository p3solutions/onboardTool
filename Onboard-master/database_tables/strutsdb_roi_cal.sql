-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: strutsdb
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `roi_cal`
--

DROP TABLE IF EXISTS `roi_cal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roi_cal` (
  `anl_org_pay` varchar(255) DEFAULT NULL,
  `mf_servr` varchar(255) DEFAULT NULL,
  `app_servr` varchar(255) DEFAULT NULL,
  `web_servr` varchar(255) DEFAULT NULL,
  `windws_servr` varchar(255) DEFAULT NULL,
  `virtl_servr` varchar(255) DEFAULT NULL,
  `db_servr` varchar(255) DEFAULT NULL,
  `anl_lic_cst` varchar(255) DEFAULT NULL,
  `db_lic` varchar(255) DEFAULT NULL,
  `op_sys_lic` varchar(255) DEFAULT NULL,
  `sft_pro_lic` varchar(255) DEFAULT NULL,
  `other_lic` varchar(255) DEFAULT NULL,
  `anl_sprt_cst` varchar(255) DEFAULT NULL,
  `upgrade_cst` varchar(255) DEFAULT NULL,
  `res_cst` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roi_cal`
--

LOCK TABLES `roi_cal` WRITE;
/*!40000 ALTER TABLE `roi_cal` DISABLE KEYS */;
/*!40000 ALTER TABLE `roi_cal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:54:56