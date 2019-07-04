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
-- Table structure for table `players_statistics`
--

DROP TABLE IF EXISTS `players_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_statistics` (
  `id_season` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `games` int(11) DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  `assist` int(11) DEFAULT NULL,
  `yellow_card` int(11) DEFAULT NULL,
  `red_card` int(11) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `own_goal` int(11) DEFAULT NULL,
  `penalty_out` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_season`,`id_player`,`id_team`),
  KEY `fk_players_has_sesons_sesons1_idx` (`id_season`),
  KEY `fk_players_has_sesons_players1_idx` (`id_player`),
  KEY `fk_players_statistics_teams1_idx` (`id_team`),
  CONSTRAINT `fk_players_has_sesons_players1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_players_has_sesons_sesons1` FOREIGN KEY (`id_season`) REFERENCES `sesons` (`id_season`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_players_statistics_teams1` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_statistics`
--

LOCK TABLES `players_statistics` WRITE;
/*!40000 ALTER TABLE `players_statistics` DISABLE KEYS */;
INSERT INTO `players_statistics` VALUES (1,1,12,1,0,1,0,0,0,0,0),(1,2,12,1,0,0,0,0,0,0,0),(1,3,12,20,0,2,5,0,0,1,0),(1,4,12,11,2,2,1,0,0,0,0),(1,5,12,9,0,3,0,0,0,0,0),(1,6,12,12,1,0,0,0,0,0,0),(1,7,12,16,0,0,0,0,0,0,0),(1,8,12,12,0,0,0,0,0,0,0),(1,9,12,1,0,0,0,0,0,0,0),(1,10,12,17,4,2,3,1,0,0,1),(1,11,12,10,1,2,0,0,0,0,0),(1,12,12,22,10,12,1,0,0,0,0),(1,13,12,15,4,3,0,0,0,0,0),(1,14,12,10,0,0,0,0,0,0,0),(1,15,12,4,4,3,0,0,0,0,0),(1,16,12,22,20,14,1,0,0,0,0),(1,17,12,18,10,3,0,0,0,0,0),(1,18,12,14,2,0,1,0,0,0,0),(1,19,12,5,0,1,0,0,0,0,0),(1,20,12,1,0,0,0,0,0,0,0),(1,21,12,8,6,2,0,0,0,0,0),(1,22,12,3,0,0,1,0,0,0,0),(1,23,12,11,1,2,4,0,0,0,0),(1,24,12,4,0,0,0,0,0,0,0),(1,25,12,13,0,0,0,0,0,0,0),(1,26,12,11,0,0,0,0,0,0,0),(1,27,12,7,2,0,0,0,0,0,0),(1,28,12,11,6,6,3,0,0,0,0),(1,29,12,15,10,6,1,0,0,0,0),(1,30,12,16,4,4,0,0,0,0,0),(1,31,3,9,0,0,0,0,0,0,0),(1,32,3,10,0,0,0,0,0,0,0),(1,33,3,2,0,0,0,0,0,0,0),(1,34,3,13,0,0,0,0,0,0,0),(1,35,3,16,4,2,2,0,0,0,0),(1,36,3,16,2,3,0,0,0,0,0),(1,37,3,2,1,2,0,0,0,0,0),(1,38,3,14,1,3,0,0,0,0,0),(1,39,3,18,8,7,1,0,0,0,0),(1,40,3,15,10,5,0,0,0,0,0),(1,41,3,16,10,8,0,0,0,0,0),(1,42,3,17,4,7,0,0,0,0,0),(1,43,3,18,3,5,1,0,0,0,1),(1,44,3,16,6,1,0,0,0,0,0),(1,45,3,14,3,6,1,0,0,0,0),(1,46,3,18,5,7,1,0,0,0,0),(1,47,3,20,7,13,2,0,0,0,0),(1,48,3,14,1,0,0,0,0,0,0),(1,49,3,13,1,1,0,0,0,0,0),(1,50,3,16,7,4,1,0,1,0,0),(1,51,3,2,0,0,0,0,0,0,0),(1,52,3,17,16,5,1,0,0,0,0),(1,53,3,20,10,9,0,0,0,0,0),(1,54,3,16,10,8,0,0,0,0,0),(1,55,1,5,0,0,0,0,0,0,0),(1,56,1,20,0,0,1,0,0,0,0),(1,57,1,20,5,4,0,0,0,0,0),(1,58,1,19,4,7,2,0,0,0,0),(1,59,1,19,7,0,5,0,1,0,0),(1,60,1,15,1,3,0,0,0,0,0),(1,61,1,4,1,1,0,0,0,0,0),(1,62,1,20,1,3,2,0,0,0,0),(1,63,1,2,1,0,0,0,0,0,0),(1,64,1,20,14,8,2,0,0,0,0),(1,65,1,21,20,10,0,0,0,0,0),(1,66,1,21,20,9,1,0,0,0,0),(1,67,1,14,1,6,1,0,0,0,0),(1,68,1,11,0,13,2,0,0,0,0),(1,69,1,21,2,3,1,0,0,0,0),(1,70,1,15,5,1,1,0,0,0,0),(1,71,1,16,9,7,1,0,0,0,0),(1,72,1,17,7,9,2,1,0,0,0),(1,73,7,9,0,1,0,0,0,0,0),(1,74,7,1,0,0,0,0,0,0,0),(1,75,7,16,0,0,0,0,0,0,0),(1,76,7,16,2,2,0,0,1,0,0),(1,77,7,9,0,0,1,0,0,0,0),(1,78,7,17,0,0,1,0,0,0,0),(1,79,7,17,0,1,1,0,0,0,0),(1,80,7,14,1,3,0,0,0,0,0),(1,81,7,18,2,3,1,0,0,1,0),(1,82,7,11,3,1,3,0,0,0,0),(1,83,7,1,1,0,0,0,0,0,0),(1,84,7,13,1,1,0,0,0,0,0),(1,85,7,15,4,11,5,0,0,0,1),(1,86,7,17,6,7,0,0,0,0,0),(1,87,7,17,11,3,0,0,0,0,0),(1,88,9,18,11,7,3,0,0,0,0),(1,89,7,14,1,4,1,0,0,0,0),(1,90,7,11,10,1,0,0,1,0,0),(1,91,7,20,22,17,1,0,0,0,0),(1,92,7,19,10,4,0,0,0,0,0),(1,93,7,13,4,5,0,0,0,0,0),(1,94,7,12,5,3,0,0,0,0,0),(1,95,11,19,0,1,1,0,0,0,0),(1,96,11,4,0,0,0,0,0,0,0),(1,97,11,4,0,0,0,0,0,0,0),(1,98,11,15,0,1,2,0,0,0,0),(1,99,11,3,0,0,0,0,0,0,0),(1,100,11,13,0,1,0,0,0,1,0),(1,101,11,16,1,1,0,0,0,0,0),(1,102,11,4,0,1,0,0,0,0,0),(1,103,11,7,0,1,0,0,0,1,0),(1,104,11,16,0,5,3,0,0,0,0),(1,105,11,2,1,0,0,0,0,0,0),(1,106,11,21,16,8,3,0,0,0,0),(1,107,11,3,0,1,0,0,0,0,0),(1,108,11,2,0,0,0,0,0,0,0),(1,109,11,3,0,0,0,0,0,0,0),(1,110,11,11,2,1,0,0,0,0,0),(1,111,11,3,1,3,0,0,0,0,0),(1,112,11,17,3,1,0,0,0,0,0),(1,113,11,10,3,1,0,0,0,0,0),(1,114,11,2,0,0,0,0,0,0,0),(1,115,11,7,8,2,0,0,0,0,0),(1,116,11,20,10,6,1,0,0,0,0),(1,117,11,14,0,3,1,0,0,0,0),(1,118,11,19,4,8,1,0,0,0,0),(1,119,11,19,23,12,2,0,0,0,0),(1,120,11,8,2,0,1,0,0,0,0),(1,121,11,14,4,6,0,0,0,0,0),(1,122,11,5,2,0,0,0,0,0,0),(1,123,11,4,2,1,0,0,0,0,0),(1,124,2,17,0,1,0,0,0,0,0),(1,125,2,5,0,0,0,0,0,0,0),(1,126,2,20,4,3,1,0,0,0,0),(1,127,2,20,3,2,0,0,0,0,0),(1,128,2,5,0,0,0,0,0,0,0),(1,129,2,19,2,2,7,0,0,0,0),(1,130,2,17,2,3,3,0,0,0,0),(1,131,2,19,1,4,2,0,1,1,0),(1,132,2,21,5,0,0,0,0,0,0),(1,133,2,1,0,0,0,0,0,0,0),(1,134,2,2,0,0,0,0,0,0,0),(1,135,2,20,1,3,0,0,0,0,0),(1,136,2,19,15,13,1,0,0,0,0),(1,137,2,20,8,3,3,0,0,0,0),(1,138,2,18,3,0,1,0,0,0,0),(1,139,2,3,1,0,0,0,0,0,0),(1,140,2,11,2,3,0,0,0,0,0),(1,141,2,8,1,0,2,0,0,0,1),(1,142,2,17,1,5,1,0,0,0,0),(1,143,2,19,10,2,3,0,0,0,0),(1,144,2,11,2,3,0,0,0,0,0),(1,145,8,9,0,1,0,0,0,0,0),(1,146,8,11,0,0,1,0,0,0,0),(1,147,8,8,0,0,1,0,0,0,0),(1,148,8,19,1,6,0,0,0,0,0),(1,149,8,19,0,2,0,0,0,0,0),(1,150,8,2,1,0,0,0,0,0,0),(1,151,8,11,0,2,2,0,0,0,0),(1,152,8,15,1,0,2,0,0,0,0),(1,153,8,3,1,0,0,0,0,0,0),(1,154,8,20,13,7,0,0,1,0,0),(1,155,8,18,3,1,1,0,0,0,0),(1,156,8,18,1,6,0,0,0,0,0),(1,157,8,4,4,0,0,0,0,0,0),(1,158,8,18,1,11,1,0,0,0,0),(1,159,8,12,5,3,1,0,0,0,0),(1,160,8,1,0,0,1,0,0,0,1),(1,161,8,19,6,8,0,0,0,0,0),(1,162,8,13,0,3,1,0,0,0,2),(1,163,8,9,10,1,0,0,0,0,0),(1,164,8,3,1,0,0,0,0,0,0),(1,165,8,1,0,0,0,0,0,0,0),(1,166,8,11,10,0,0,0,0,0,0),(1,167,8,20,6,2,0,0,0,0,0),(1,168,13,14,0,0,0,0,0,0,0),(1,169,13,11,0,0,0,0,0,0,0),(1,170,13,8,0,1,1,0,0,0,0),(1,171,13,1,0,0,0,0,0,0,0),(1,172,13,3,0,0,0,0,0,0,0),(1,173,13,1,0,0,0,0,0,0,0),(1,174,13,2,0,0,0,0,0,1,0),(1,175,13,3,1,0,1,0,0,0,0),(1,176,13,17,0,0,1,1,0,0,0),(1,177,13,9,0,3,0,0,0,0,0),(1,178,13,17,2,1,1,0,0,0,0),(1,179,13,11,4,1,0,0,0,0,0),(1,180,13,19,10,14,0,0,0,0,0),(1,181,13,13,4,0,0,0,0,0,0),(1,182,13,12,5,3,0,0,0,0,0),(1,183,10,8,8,2,0,0,0,0,0),(1,184,13,1,0,0,0,0,0,0,0),(1,185,13,9,1,2,0,0,0,0,0),(1,186,13,18,8,9,0,0,0,0,0),(1,187,13,20,5,20,0,0,0,0,0),(1,188,13,11,1,2,0,0,0,0,0),(1,189,13,14,1,0,4,0,0,0,1),(1,190,9,21,9,15,0,0,0,0,0),(1,191,13,2,0,0,0,0,0,0,0),(1,192,15,6,6,0,1,0,0,0,0),(1,193,13,9,19,0,0,0,0,0,0),(1,194,5,17,8,4,1,0,0,0,0),(1,195,13,4,1,1,0,0,0,0,0),(1,196,10,4,0,0,0,0,0,0,0),(1,197,10,18,0,0,0,0,0,0,0),(1,198,10,11,0,0,2,0,0,0,0),(1,199,10,4,0,0,1,0,0,0,0),(1,200,10,1,0,0,0,0,0,0,0),(1,201,10,2,0,0,0,0,0,0,0),(1,202,10,12,3,2,1,0,0,0,0),(1,203,10,1,0,0,0,0,0,0,0),(1,204,10,1,0,0,0,0,0,0,0),(1,205,10,2,0,0,0,0,0,0,0),(1,206,10,8,0,2,0,0,0,0,0),(1,207,10,15,4,6,1,0,0,1,0),(1,208,10,10,2,0,1,0,0,0,0),(1,209,10,4,0,1,1,0,0,0,0),(1,210,10,1,0,0,1,0,0,0,0),(1,211,10,7,0,2,0,0,0,0,0),(1,212,10,5,1,1,1,0,0,0,0),(1,213,10,11,4,1,0,0,0,0,0),(1,214,10,11,2,3,0,0,0,0,0),(1,215,10,3,0,0,0,0,0,0,0),(1,216,10,4,1,0,0,0,0,0,0),(1,217,10,18,7,6,1,0,0,0,0),(1,218,10,2,0,0,0,0,0,0,0),(1,219,10,1,0,0,0,0,0,0,0),(1,220,10,1,0,0,0,0,0,0,0),(1,221,10,4,0,0,1,0,0,0,0),(1,222,10,1,0,0,0,0,0,0,0),(1,223,10,1,0,0,0,0,0,0,0),(1,224,10,5,2,0,0,0,0,0,0),(1,225,10,1,0,1,0,0,0,0,0),(1,226,10,17,5,4,1,0,1,0,0),(1,227,10,15,17,12,2,0,1,0,0),(1,228,10,2,0,0,0,0,0,0,0),(1,229,10,15,3,0,3,0,0,0,0),(1,230,10,14,6,3,3,0,0,0,0),(1,231,10,2,1,0,0,0,0,0,0),(1,232,6,16,0,0,0,0,0,0,0),(1,233,6,5,0,0,1,0,0,0,0),(1,234,6,7,0,1,1,0,0,0,0),(1,235,6,16,2,1,0,0,0,0,0),(1,236,6,20,1,1,1,0,0,1,0),(1,237,6,13,4,0,2,0,0,0,0),(1,238,6,10,2,4,1,0,0,0,0),(1,239,6,14,1,1,0,0,0,0,0),(1,240,6,4,0,0,0,0,0,0,0),(1,241,6,17,0,0,0,0,0,1,0),(1,242,6,3,0,0,0,0,0,0,0),(1,243,6,13,0,3,4,0,0,0,0),(1,244,6,12,9,2,9,0,0,0,0),(1,245,6,10,1,3,0,0,0,0,0),(1,246,6,11,5,2,1,0,0,0,0),(1,247,6,10,1,1,0,0,0,0,0),(1,248,6,19,3,1,1,0,0,0,0),(1,249,6,14,5,5,2,0,0,0,0),(1,250,6,10,1,0,0,0,0,0,0),(1,251,6,1,0,0,0,0,0,0,0),(1,252,6,9,4,2,0,0,0,0,0),(1,253,6,7,1,2,0,0,0,0,0),(1,254,6,6,0,0,0,0,0,0,0),(1,255,6,11,4,0,0,0,0,0,0),(1,256,6,10,5,1,0,0,0,0,0),(1,257,6,2,0,1,0,0,0,0,0),(1,258,6,7,0,0,0,0,0,0,0),(1,259,16,10,0,0,0,0,0,0,0),(1,260,16,11,0,0,0,0,0,0,0),(1,261,16,21,3,2,3,0,0,1,0),(1,262,16,3,0,0,0,0,0,0,0),(1,263,16,17,1,0,2,0,0,0,0),(1,264,16,8,0,0,0,0,0,0,0),(1,265,16,4,0,1,0,0,0,0,0),(1,266,16,7,0,0,0,0,0,0,0),(1,267,16,21,1,2,2,0,0,1,0),(1,268,16,2,0,0,0,0,0,0,0),(1,269,16,17,2,2,1,0,0,0,0),(1,270,16,17,2,2,1,0,0,0,0),(1,271,16,11,6,3,0,0,0,0,0),(1,272,16,11,0,2,0,0,0,0,0),(1,273,16,5,0,0,1,0,0,0,0),(1,274,16,17,2,2,0,0,0,0,0),(1,275,16,8,2,2,0,0,0,0,0),(1,276,16,17,8,3,2,0,0,0,0),(1,277,16,14,9,4,1,0,1,0,0),(1,278,16,13,3,7,0,0,0,0,0),(1,279,16,18,9,6,5,0,0,0,0),(1,280,16,5,6,2,0,0,0,0,0),(1,281,16,5,0,0,0,0,0,0,0),(1,282,9,14,0,0,0,0,0,0,0),(1,283,9,6,0,0,0,0,0,0,0),(1,284,9,2,0,0,0,0,0,0,0),(1,285,9,1,0,0,0,0,0,0,0),(1,286,9,8,2,1,0,0,0,0,0),(1,287,9,21,1,3,1,0,0,0,0),(1,288,9,1,0,0,0,0,0,0,0),(1,289,9,22,4,0,2,0,0,0,0),(1,290,9,20,6,2,0,0,0,0,0),(1,291,9,1,0,0,0,0,0,0,0),(1,292,9,7,0,0,1,0,0,0,0),(1,293,9,17,4,3,2,0,0,0,0),(1,294,9,2,0,0,0,0,0,0,0),(1,295,9,2,0,0,1,0,0,0,0),(1,296,9,10,1,2,2,0,0,0,0),(1,297,9,21,1,2,0,0,0,0,0),(1,298,9,16,6,1,3,0,0,0,0),(1,299,9,7,0,1,0,0,0,1,0),(1,300,9,11,3,2,0,0,0,0,0),(1,301,9,22,5,6,1,0,0,0,0),(1,302,4,20,1,0,1,0,0,0,0),(1,303,4,1,0,0,0,0,0,0,0),(1,304,4,14,1,0,0,1,0,0,0),(1,305,4,1,0,0,0,0,0,0,0),(1,306,4,19,4,4,1,0,0,0,0),(1,307,4,18,0,3,0,0,0,0,0),(1,308,4,7,5,4,0,0,0,0,0),(1,309,4,14,2,2,1,0,0,0,0),(1,310,4,1,0,0,0,0,0,0,0),(1,311,4,14,5,1,3,0,0,0,0),(1,312,4,1,0,0,0,0,0,0,0),(1,313,4,5,1,1,0,0,0,0,0),(1,314,4,1,1,1,0,0,0,0,0),(1,315,4,1,0,0,0,0,0,0,0),(1,316,4,18,2,1,1,0,0,0,0),(1,317,4,16,2,6,0,0,0,0,0),(1,318,4,6,1,1,1,0,0,0,0),(1,319,4,16,12,3,0,0,0,0,0),(1,320,4,10,7,7,0,0,0,0,0),(1,321,4,1,0,0,0,0,0,0,0),(1,322,4,3,2,0,0,0,0,0,0),(1,323,4,2,2,0,0,0,0,0,0),(1,324,4,5,6,4,1,0,0,0,0),(1,325,15,10,0,0,0,0,0,0,0),(1,326,15,6,0,1,0,0,0,0,0),(1,327,15,7,0,0,0,0,0,0,0),(1,328,15,8,2,2,0,0,0,0,0),(1,329,15,1,0,0,0,0,0,0,0),(1,330,15,7,4,0,2,0,0,0,0),(1,331,15,6,0,1,0,0,0,0,0),(1,332,15,8,0,3,1,0,0,0,0),(1,333,15,6,1,1,2,0,0,0,0),(1,334,15,4,0,2,0,0,0,0,0),(1,335,15,9,7,2,0,0,0,0,0),(1,336,15,8,7,2,1,0,1,0,0),(1,337,15,8,0,0,0,0,0,0,0),(1,338,15,3,0,2,1,0,0,0,0),(1,339,15,6,1,1,0,0,0,0,0),(1,340,15,3,0,2,0,0,0,0,0),(1,341,15,1,1,0,0,0,0,0,0),(1,342,14,2,0,0,0,0,0,0,0),(1,343,14,18,0,0,0,0,0,0,0),(1,344,14,18,3,1,0,0,0,0,0),(1,345,14,12,0,2,1,0,0,0,0),(1,346,14,13,0,0,0,0,0,0,0),(1,347,14,4,0,0,0,0,0,0,0),(1,348,14,4,0,0,0,0,0,0,0),(1,349,14,17,4,0,1,0,0,0,0),(1,350,14,13,4,0,0,0,0,0,0),(1,351,14,10,0,1,2,0,0,0,0),(1,352,14,13,3,7,3,0,0,0,0),(1,353,14,18,1,1,1,0,0,0,1),(1,354,14,5,1,0,0,0,0,0,0),(1,355,14,14,5,1,1,0,0,0,0),(1,356,14,10,0,1,0,0,0,1,0),(1,357,14,5,1,0,0,0,0,0,0),(1,358,14,13,1,3,0,0,0,0,0),(1,359,14,17,3,3,2,0,0,0,0),(1,360,14,13,4,5,0,0,0,0,0),(1,361,14,17,1,1,1,0,0,0,0),(1,362,5,13,0,1,0,0,0,0,0),(1,363,5,7,0,0,0,0,0,0,0),(1,364,5,10,0,1,0,0,0,1,0),(1,365,5,3,0,0,0,0,0,0,0),(1,366,5,16,0,0,2,0,0,0,0),(1,367,5,3,0,0,0,0,0,0,0),(1,368,5,14,1,0,0,0,0,0,0),(1,369,5,11,0,1,0,0,0,0,0),(1,370,5,7,1,1,0,0,0,0,0),(1,371,5,2,0,0,0,0,0,0,0),(1,372,5,2,2,0,0,0,0,0,0),(1,373,5,6,2,0,0,0,0,1,0),(1,374,5,5,1,0,1,0,0,0,0),(1,375,5,10,0,2,1,0,0,0,0),(1,376,5,10,5,2,0,0,0,0,0),(1,377,5,5,0,0,0,0,0,0,0),(1,378,5,2,0,0,0,0,0,0,0),(1,379,5,15,3,1,5,0,0,0,1),(1,380,5,16,7,6,1,0,0,0,0),(1,381,5,10,1,1,0,0,0,0,0),(1,382,5,14,2,0,0,0,0,1,0),(1,383,5,17,4,3,1,0,0,0,0),(1,384,5,12,5,2,0,0,0,0,0),(1,385,5,5,0,1,0,0,0,0,0);
/*!40000 ALTER TABLE `players_statistics` ENABLE KEYS */;
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
