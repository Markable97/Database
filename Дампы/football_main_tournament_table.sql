CREATE DATABASE  IF NOT EXISTS `football_main` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `football_main`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: football_main
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `tournament_table`
--

DROP TABLE IF EXISTS `tournament_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournament_table` (
  `id_season` int(11) NOT NULL,
  `id_division` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `games` int(11) DEFAULT '0',
  `wins` int(11) DEFAULT '0',
  `draws` int(11) DEFAULT '0',
  `losses` int(11) DEFAULT '0',
  `goals_scored` int(11) DEFAULT '0',
  `goals_conceded` int(11) DEFAULT '0',
  `points` int(11) DEFAULT '0',
  PRIMARY KEY (`id_season`,`id_division`,`id_team`),
  KEY `fk_tournament_table_teams1_idx` (`id_team`),
  KEY `fk_tournament_table_divisions1_idx` (`id_division`),
  KEY `fk_tournament_table_sesons1_idx` (`id_season`),
  CONSTRAINT `fk_tournament_table_divisions1` FOREIGN KEY (`id_division`) REFERENCES `divisions` (`id_division`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tournament_table_sesons1` FOREIGN KEY (`id_season`) REFERENCES `sesons` (`id_season`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tournament_table_teams1` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_table`
--

LOCK TABLES `tournament_table` WRITE;
/*!40000 ALTER TABLE `tournament_table` DISABLE KEYS */;
INSERT INTO `tournament_table` VALUES (1,1,1,21,16,3,2,103,22,51),(1,1,2,21,11,4,6,63,45,37),(1,1,3,20,17,3,0,110,25,54),(1,1,4,21,4,3,14,56,87,15),(1,1,5,20,2,0,18,36,124,6),(1,1,6,21,7,0,14,51,101,21),(1,1,7,20,16,3,1,112,32,51),(1,1,8,20,8,6,6,66,49,30),(1,1,9,22,4,4,14,43,84,16),(1,1,10,21,6,5,10,65,95,23),(1,1,11,21,12,1,8,84,66,37),(1,1,12,22,18,1,3,91,38,55),(1,1,13,21,7,2,12,79,81,23),(1,1,14,20,4,0,16,31,93,12),(1,1,15,10,4,1,5,26,43,13),(1,1,16,21,7,0,14,55,86,21),(1,2,17,0,0,0,0,0,0,0),(1,2,18,0,0,0,0,0,0,0),(1,2,19,0,0,0,0,0,0,0),(1,2,20,0,0,0,0,0,0,0),(1,2,21,0,0,0,0,0,0,0),(1,2,22,0,0,0,0,0,0,0),(1,2,23,0,0,0,0,0,0,0),(1,2,24,0,0,0,0,0,0,0),(1,2,25,0,0,0,0,0,0,0),(1,2,26,0,0,0,0,0,0,0),(1,2,27,0,0,0,0,0,0,0),(1,2,28,0,0,0,0,0,0,0),(1,2,29,0,0,0,0,0,0,0),(1,2,30,0,0,0,0,0,0,0),(1,2,31,0,0,0,0,0,0,0),(1,2,38,0,0,0,0,0,0,0),(1,2,39,0,0,0,0,0,0,0),(1,2,40,0,0,0,0,0,0,0),(1,2,41,0,0,0,0,0,0,0),(1,2,42,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tournament_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 22:13:21
