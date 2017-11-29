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
-- Table structure for table `projinfo`
--

DROP TABLE IF EXISTS `projinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projinfo` (
  `projectname` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `appno` varchar(255) DEFAULT NULL,
  `Startdate` varchar(255) DEFAULT NULL,
  `Intdate` varchar(255) DEFAULT NULL,
  `Plandate` varchar(255) DEFAULT NULL,
  `Execdate` varchar(255) DEFAULT NULL,
  `Hyperdate` varchar(255) DEFAULT NULL,
  `Enddate` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projinfo`
--

LOCK TABLES `projinfo` WRITE;
/*!40000 ALTER TABLE `projinfo` DISABLE KEYS */;
INSERT INTO `projinfo` VALUES ('Project1','its the first project ','4','','','','','','',7),('Project2','the 2nd project','3','01/10/2017','','','','','31/10/2017',25),('Project3','3rd project','','02/10/2017','','','','','30/10/2017',26),('Project4','4th project','','02/10/2017','','','','','31/10/2017',27),('Project5','5th project','','01/10/2017','','','','','27/10/2017',28),('Project6','6th project','','03/10/2017','','','','','27/10/2017',29),('Project7','7th project','2','04/10/2017','','','','','25/10/2017',30);
/*!40000 ALTER TABLE `projinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:54:59