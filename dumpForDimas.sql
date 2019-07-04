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
-- Table structure for table `amplua`
--

DROP TABLE IF EXISTS `amplua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amplua` (
  `id_amplua` int(11) NOT NULL AUTO_INCREMENT,
  `name_amplua` varchar(45) NOT NULL,
  PRIMARY KEY (`id_amplua`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amplua`
--

LOCK TABLES `amplua` WRITE;
/*!40000 ALTER TABLE `amplua` DISABLE KEYS */;
INSERT INTO `amplua` VALUES (1,'Вратарь'),(2,'Защитник'),(3,'Полузащитник'),(4,'Нападающий');
/*!40000 ALTER TABLE `amplua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id_app` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_app`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,2),(2,3),(3,2);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `id_division` int(11) NOT NULL,
  `name_division` varchar(45) NOT NULL,
  PRIMARY KEY (`id_division`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Высший дивизион'),(2,'Первый дивизион'),(3,'Второй дивизион A'),(4,'Второй дивизион B'),(5,'Третий дивизион A'),(6,'Третий дивизион B');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id_match` int(11) NOT NULL AUTO_INCREMENT,
  `id_season` int(11) NOT NULL,
  `id_division` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `team_home` int(11) NOT NULL,
  `goal_home` int(11) DEFAULT NULL,
  `goal_guest` int(11) DEFAULT NULL,
  `team_guest` int(11) NOT NULL,
  `m_date` datetime DEFAULT NULL,
  `id_stadium` int(11) DEFAULT NULL,
  `id_referee` int(11) DEFAULT NULL,
  `transfer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_match`,`id_season`,`id_division`,`id_tour`),
  KEY `fk_matches_teams1_idx` (`team_home`),
  KEY `fk_matches_teams2_idx` (`team_guest`),
  KEY `fk_matches_sesons1_idx` (`id_season`),
  KEY `fk_matches_stadiums1_idx` (`id_stadium`),
  KEY `fk_matches_divisions1_idx` (`id_division`),
  KEY `fk_matches_staff1_idx` (`id_referee`),
  CONSTRAINT `fk_matches_divisions1` FOREIGN KEY (`id_division`) REFERENCES `divisions` (`id_division`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_sesons1` FOREIGN KEY (`id_season`) REFERENCES `sesons` (`id_season`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_stadiums1` FOREIGN KEY (`id_stadium`) REFERENCES `stadiums` (`id_stadium`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_staff1` FOREIGN KEY (`id_referee`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `fk_matches_teams1` FOREIGN KEY (`team_home`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_teams2` FOREIGN KEY (`team_guest`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,1,1,1,2,4,0,14,'2018-08-25 10:00:00',NULL,1,NULL),(2,1,1,1,1,14,0,16,'2018-08-25 13:30:00',NULL,1,NULL),(3,1,1,1,12,5,3,11,'2018-09-15 19:20:00',NULL,2,'Перенос Нижгары'),(4,1,1,1,9,2,2,10,'2018-08-26 15:50:00',NULL,3,NULL),(5,1,1,1,8,4,4,7,'2018-08-26 14:40:00',NULL,3,NULL),(6,1,1,1,4,3,4,5,'2018-08-26 13:30:00',NULL,4,NULL),(7,1,1,1,13,2,3,6,'2018-08-25 19:20:00',NULL,5,NULL),(8,1,1,1,15,0,8,3,'2018-08-26 18:10:00',NULL,5,NULL),(9,1,1,2,3,5,1,14,'2018-09-01 15:50:00',NULL,1,NULL),(10,1,1,2,6,2,4,15,'2018-09-02 20:30:00',NULL,5,NULL),(11,1,1,2,5,2,3,13,'2018-09-01 17:00:00',NULL,1,NULL),(12,1,1,2,7,8,0,4,'2018-09-02 17:00:00',NULL,5,NULL),(13,1,1,2,10,2,1,8,'2018-09-01 15:50:00',NULL,3,NULL),(14,1,1,2,11,5,3,9,'2018-09-02 15:50:00',NULL,5,NULL),(15,1,1,2,16,0,2,12,'2018-09-02 19:20:00',NULL,5,NULL),(16,1,1,2,2,2,2,1,'2018-09-01 20:30:00',NULL,4,NULL),(17,1,1,3,14,0,11,1,'2018-09-09 15:50:00',NULL,3,NULL),(18,1,1,3,12,5,1,2,'2018-09-08 19:20:00',NULL,3,NULL),(19,1,1,3,9,3,2,16,'2018-09-09 17:00:00',NULL,6,NULL),(20,1,1,3,8,7,2,11,'2018-09-09 18:10:00',NULL,6,NULL),(21,1,1,3,4,5,7,10,'2018-09-09 20:30:00',NULL,3,NULL),(22,1,1,3,13,2,5,7,'2018-09-09 17:00:00',NULL,1,NULL),(23,1,1,3,15,4,3,5,'2018-09-09 15:50:00',NULL,1,NULL),(24,1,1,3,3,12,1,6,'2018-10-13 19:20:00',NULL,4,'Перенос Альбасете'),(25,1,1,4,6,3,1,14,'2018-09-23 12:20:00',NULL,3,NULL),(26,1,1,4,5,2,9,3,'2018-09-23 13:30:00',NULL,4,NULL),(27,1,1,4,7,11,1,15,'2018-09-23 18:10:00',NULL,2,NULL),(28,1,1,4,10,6,10,13,'2018-09-23 17:00:00',NULL,1,NULL),(29,1,1,4,11,3,4,4,'2018-09-23 19:20:00',NULL,2,NULL),(30,1,1,4,16,3,2,8,'2018-11-05 20:30:00',NULL,5,'Перенос СКА'),(31,1,1,4,2,2,2,9,'2018-09-23 11:10:00',NULL,3,NULL),(32,1,1,4,1,1,0,12,'2018-12-09 14:40:00',NULL,1,'Перенос Селтик-2'),(33,1,1,5,14,1,12,12,'2018-10-07 17:00:00',NULL,3,NULL),(34,1,1,5,9,1,3,1,'2018-10-07 15:50:00',NULL,1,NULL),(35,1,1,5,8,2,3,2,'2018-10-07 19:20:00',NULL,5,NULL),(36,1,1,5,4,0,4,16,'2018-10-07 20:30:00',NULL,5,NULL),(37,1,1,5,13,5,6,11,'2018-10-07 18:10:00',NULL,3,NULL),(38,1,1,5,15,4,1,10,'2018-10-06 13:30:00',NULL,1,NULL),(39,1,1,5,3,1,1,7,'2018-10-07 14:40:00',NULL,2,NULL),(40,1,1,5,6,4,2,5,'2018-10-07 13:30:00',NULL,2,NULL),(41,1,1,6,5,1,2,14,'2018-10-21 17:00:00',NULL,1,NULL),(42,1,1,6,7,8,1,6,'2018-10-20 19:20:00',NULL,3,NULL),(43,1,1,6,10,1,10,3,'2019-01-12 13:30:00',NULL,1,'Перенос Лиги'),(44,1,1,6,11,3,2,15,'2018-10-21 20:30:00',NULL,5,NULL),(45,1,1,6,16,5,8,13,'2018-10-21 18:10:00',NULL,5,NULL),(46,1,1,6,2,3,1,4,'2018-10-21 14:40:00',NULL,4,NULL),(47,1,1,6,1,2,1,8,'2018-10-21 11:10:00',NULL,1,NULL),(48,1,1,6,12,4,2,9,'2018-10-21 15:50:00',NULL,3,NULL),(49,1,1,7,14,0,2,9,'2018-11-05 18:10:00',NULL,5,NULL),(50,1,1,7,8,2,2,12,'2018-11-03 12:20:00',NULL,3,NULL),(51,1,1,7,4,3,5,1,'2018-11-04 14:40:00',NULL,1,NULL),(52,1,1,7,13,3,4,2,'2018-11-04 18:10:00',NULL,4,NULL),(53,1,1,7,15,0,4,16,'2018-11-03 18:10:00',NULL,2,NULL),(54,1,1,7,3,2,0,11,'2018-11-03 14:40:00',NULL,2,NULL),(55,1,1,7,6,4,3,10,'2018-11-04 17:00:00',NULL,3,NULL),(56,1,1,7,5,1,6,7,'2018-11-05 14:40:00',NULL,1,NULL),(57,1,1,8,7,6,2,14,'2018-11-17 17:00:00',NULL,5,NULL),(58,1,1,8,10,2,0,5,'2018-11-18 18:10:00',NULL,5,NULL),(59,1,1,8,11,4,3,6,'2018-11-18 15:50:00',NULL,3,NULL),(60,1,1,8,16,1,9,3,'2018-11-18 19:20:00',NULL,5,NULL),(61,1,1,8,2,1,5,15,'2018-11-17 18:10:00',NULL,3,NULL),(62,1,1,8,1,3,0,13,'2018-11-17 14:40:00',NULL,1,NULL),(63,1,1,8,12,5,2,4,'2018-11-17 13:30:00',NULL,1,NULL),(64,1,1,8,9,2,4,8,'2018-11-18 15:50:00',NULL,2,NULL),(65,1,1,9,14,2,7,8,'2018-12-01 14:40:00',NULL,1,NULL),(66,1,1,9,4,1,3,9,'2018-12-02 14:40:00',NULL,4,NULL),(67,1,1,9,13,2,5,12,'2018-12-02 17:00:00',NULL,2,NULL),(68,1,1,9,15,NULL,NULL,1,NULL,NULL,NULL,''),(69,1,1,9,3,1,0,2,'2018-12-02 14:40:00',NULL,2,NULL),(70,1,1,9,6,3,2,16,'2018-12-01 20:30:00',NULL,2,NULL),(71,1,1,9,5,3,11,11,'2018-12-02 15:50:00',NULL,2,NULL),(72,1,1,9,7,9,1,10,'2018-12-02 18:10:00',NULL,5,NULL),(73,1,1,10,10,4,3,14,'2018-12-09 19:20:00',NULL,2,NULL),(74,1,1,10,11,3,3,7,'2018-12-09 17:00:00',NULL,5,NULL),(75,1,1,10,16,1,2,5,'2018-12-09 19:20:00',NULL,5,NULL),(76,1,1,10,2,3,1,6,'2018-12-08 20:30:00',NULL,5,NULL),(77,1,1,10,1,0,1,3,'2019-02-03 11:10:00',NULL,8,'Перенос Лиги'),(78,1,1,10,12,6,2,15,'2018-12-08 17:00:00',NULL,4,NULL),(79,1,1,10,9,2,2,13,'2018-12-09 18:10:00',NULL,5,NULL),(80,1,1,10,8,3,3,4,'2018-12-08 13:30:00',NULL,1,NULL),(81,1,1,11,14,2,1,4,'2019-01-26 12:20:00',NULL,2,'Перенос Титан'),(82,1,1,11,13,2,3,8,'2018-12-15 17:00:00',NULL,2,NULL),(83,1,1,11,15,4,4,9,'2018-12-15 18:10:00',NULL,2,NULL),(84,1,1,11,3,3,2,12,'2018-11-24 13:30:00',NULL,1,NULL),(85,1,1,11,6,1,5,1,'2018-12-16 11:10:00',NULL,2,NULL),(86,1,1,11,5,3,7,2,'2018-12-16 15:50:00',NULL,1,NULL),(87,1,1,11,7,5,4,16,'2018-12-16 18:10:00',NULL,5,NULL),(88,1,1,11,10,1,5,11,'2018-12-16 20:30:00',NULL,8,NULL),(89,1,1,12,11,6,3,14,'2018-12-23 15:50:00',NULL,2,NULL),(90,1,1,12,16,4,3,10,'2018-12-23 17:00:00',NULL,1,NULL),(91,1,1,12,2,1,2,7,'2018-12-23 11:10:00',NULL,1,NULL),(92,1,1,12,1,7,1,5,'2018-12-22 12:20:00',NULL,3,NULL),(93,1,1,12,12,5,2,6,'2018-12-22 13:30:00',NULL,3,NULL),(94,1,1,12,9,1,4,3,'2018-12-23 12:20:00',NULL,2,NULL),(95,1,1,12,8,NULL,NULL,15,NULL,NULL,NULL,'Перенос РМА'),(96,1,1,12,4,8,2,13,'2018-12-23 18:10:00',NULL,5,NULL),(97,1,1,13,14,0,3,13,'2019-01-13 13:30:00',NULL,3,NULL),(98,1,1,13,15,NULL,NULL,4,NULL,NULL,NULL,''),(99,1,1,13,3,2,2,8,'2018-12-22 18:10:00',NULL,5,NULL),(100,1,1,13,6,5,2,9,'2019-01-13 19:20:00',NULL,5,NULL),(101,1,1,13,5,2,9,12,'2019-01-13 14:40:00',NULL,4,NULL),(102,1,1,13,7,3,2,1,'2019-01-13 17:00:00',NULL,8,NULL),(103,1,1,13,10,3,6,2,'2019-01-13 18:10:00',NULL,3,NULL),(104,1,1,13,11,11,3,16,'2019-01-13 15:50:00',NULL,1,NULL),(105,1,1,14,16,3,1,14,'2019-01-20 19:20:00',NULL,5,NULL),(106,1,1,14,2,1,3,11,'2019-01-20 20:30:00',NULL,5,NULL),(107,1,1,14,1,9,0,10,'2019-01-19 13:30:00',NULL,3,NULL),(108,1,1,14,12,4,1,7,'2019-01-20 15:50:00',NULL,2,NULL),(109,1,1,14,9,6,2,5,'2019-01-20 14:40:00',NULL,1,NULL),(110,1,1,14,8,5,1,6,'2019-01-20 17:00:00',NULL,2,NULL),(111,1,1,14,4,2,5,3,'2019-01-20 13:30:00',NULL,4,NULL),(112,1,1,15,14,NULL,NULL,15,NULL,NULL,NULL,''),(113,1,1,15,3,5,2,13,'2019-01-27 15:10:00',NULL,2,NULL),(114,1,1,15,6,3,8,4,'2019-01-27 21:00:00',NULL,3,NULL),(115,1,1,15,5,1,3,8,'2019-01-27 16:20:00',NULL,1,NULL),(116,1,1,15,7,9,1,9,'2019-01-27 18:40:00',NULL,3,NULL),(117,1,1,15,10,2,4,12,'2019-01-27 14:00:00',NULL,2,NULL),(118,1,1,15,11,0,5,1,'2019-01-27 17:30:00',NULL,8,NULL),(119,1,1,15,16,2,4,2,'2019-01-27 19:50:00',NULL,3,NULL),(120,1,1,16,14,1,4,2,'2019-02-03 17:00:00',NULL,5,NULL),(121,1,1,16,16,1,2,1,'2019-02-02 11:10:00',NULL,1,NULL),(122,1,1,16,11,0,2,12,'2019-02-02 19:20:00',NULL,3,NULL),(123,1,1,16,10,6,2,9,'2019-02-02 12:20:00',NULL,1,NULL),(124,1,1,16,7,5,2,8,'2019-02-03 18:10:00',NULL,5,NULL),(125,1,1,16,5,0,5,4,'2019-02-03 17:00:00',NULL,1,NULL),(126,1,1,16,6,3,9,13,'2019-02-03 10:00:00',NULL,3,NULL),(127,1,1,17,14,1,4,3,'2019-02-10 17:00:00',NULL,4,NULL),(128,1,1,17,15,NULL,NULL,6,NULL,NULL,NULL,''),(129,1,1,17,13,9,2,5,'2019-02-10 18:10:00',NULL,5,NULL),(130,1,1,17,4,0,3,7,'2019-02-10 13:30:00',NULL,1,NULL),(131,1,1,17,8,4,4,10,'2019-03-03 18:10:00',NULL,1,'Перенос Регион-13'),(132,1,1,17,9,2,5,11,'2019-02-10 14:40:00',NULL,3,NULL),(133,1,1,17,12,4,3,16,'2019-02-10 15:50:00',NULL,3,NULL),(134,1,1,17,1,2,2,2,'2019-02-09 15:50:00',NULL,5,NULL),(135,1,1,18,1,10,1,14,'2019-02-16 17:00:00',NULL,3,NULL),(136,1,1,18,2,1,2,12,'2019-02-16 20:30:00',NULL,2,NULL),(137,1,1,18,16,3,0,9,'2019-02-17 15:50:00',NULL,3,NULL),(138,1,1,18,11,2,4,8,'2019-02-17 18:10:00',NULL,5,NULL),(139,1,1,18,10,3,3,4,'2019-02-17 18:10:00',NULL,1,NULL),(140,1,1,18,7,3,0,13,'2019-02-17 17:00:00',NULL,5,NULL),(141,1,1,18,5,NULL,NULL,15,NULL,NULL,NULL,''),(142,1,1,18,6,1,4,3,'2019-02-17 12:20:00',NULL,4,NULL),(143,1,1,19,14,3,1,6,'2019-02-24 12:20:00',NULL,4,NULL),(144,1,1,19,3,18,2,5,'2019-02-24 14:40:00',NULL,1,NULL),(145,1,1,19,13,5,5,10,'2019-02-24 19:20:00',NULL,2,NULL),(146,1,1,19,4,2,7,11,'2019-02-24 15:50:00',NULL,3,NULL),(147,1,1,19,8,7,2,16,'2019-02-24 18:10:00',NULL,5,NULL),(148,1,1,19,9,1,8,2,'2019-02-23 14:50:00',NULL,1,NULL),(149,1,1,19,12,1,3,1,'2019-02-24 17:00:00',NULL,3,NULL),(150,1,1,20,12,5,2,14,'2019-03-03 11:10:00',NULL,2,NULL),(151,1,1,20,1,5,0,9,'2019-03-03 12:20:00',NULL,3,NULL),(152,1,1,20,2,NULL,NULL,8,NULL,NULL,NULL,'Перенос Трансгарант'),(153,1,1,20,16,5,1,4,'2019-03-03 13:30:00',NULL,2,NULL),(154,1,1,20,11,3,2,13,'2019-03-03 17:00:00',NULL,3,NULL),(155,1,1,20,10,NULL,NULL,15,NULL,NULL,NULL,''),(156,1,1,20,5,3,5,6,'2019-03-03 15:50:00',NULL,3,NULL),(157,1,1,21,14,NULL,NULL,5,NULL,NULL,NULL,'Перенос Бриг'),(158,1,1,21,6,2,10,7,'2019-03-08 11:10:00',NULL,2,NULL),(159,1,1,21,3,3,3,10,'2019-03-10 19:20:00',NULL,3,NULL),(160,1,1,21,15,NULL,NULL,11,NULL,NULL,NULL,''),(161,1,1,21,13,5,3,16,'2019-03-09 17:00:00',NULL,3,NULL),(162,1,1,21,4,1,1,2,'2019-03-10 15:50:00',NULL,1,NULL),(163,1,1,21,8,1,1,1,'2019-03-09 18:10:00',NULL,4,NULL),(164,1,1,21,9,1,3,12,'2019-03-10 17:00:00',NULL,2,NULL),(165,1,1,22,9,1,5,14,'2019-03-17 17:00:00',NULL,2,NULL),(166,1,1,22,12,4,2,8,'2019-03-17 14:40:00',NULL,1,NULL),(167,1,1,22,1,11,3,4,'2019-03-16 14:40:00',NULL,1,NULL),(168,1,1,22,2,5,3,13,'2019-03-16 20:30:00',NULL,5,NULL),(169,1,1,22,11,2,4,3,'2019-03-17 18:10:00',NULL,2,NULL),(170,1,1,22,10,6,2,6,'2019-03-16 18:10:00',NULL,2,NULL),(171,1,1,22,7,10,0,5,'2019-03-17 17:00:00',NULL,5,NULL);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_bef_ins_matches before insert on matches 
for each row
begin 

declare l_id_match int;
declare l_g_home int;

select m.id_match, m.goal_home
into l_id_match, l_g_home
from matches m
where team_home = new.team_home and team_guest = new.team_guest;

	if new.id_referee is null then 
		set new.goal_home = null;
        set new.goal_guest = null;
    end if;

if l_id_match is not null  and l_g_home is not null then 
	update matches 
    set goal_home = new.goal_home,
		goal_guest = new.goal_guest
	where id_match = l_id_match;
    
    SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: not insert, but update';
end if;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_aft_ins_matches after insert on matches 
for each row
begin 

declare team_home int;
declare team_guest int;

declare goal_h int;
declare goal_v int;
declare befor int;

#set befor = old.goal_home;

set team_home = new.team_home;
set team_guest = new.team_guest;
set goal_h = new.goal_home;
set goal_v = new.goal_guest;

#if goal_h is not null then 
if new.id_referee is not null and goal_h is not null then 

	    if goal_h > goal_v then
    #победа первой
		update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 3
        where id_team = team_home;
	#поражение второй
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h
        where id_team = team_guest;
        
    elseif goal_h < goal_v then
    #поражение первой
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v
        where id_team = team_home;
	#победа второй
        update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 3
        where id_team = team_guest;
        
	else
    #ничья
		update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 1
        where id_team = team_home;
        
        update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 1
        where id_team = team_guest;
    
        
    end if;

end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger up_tournament_table after update on matches 
for each row
begin 

declare team_home int;
declare team_guest int;

declare goal_h int;
declare goal_v int;
declare befor int;

set befor = old.goal_home;

set team_home = old.team_home;
set team_guest = old.team_guest;
set goal_h = new.goal_home;
set goal_v = new.goal_guest;
if goal_h is not null and old.goal_home is null then

    
    if goal_h > goal_v then
    #победа первой
		update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 3
        where id_team = team_home;
	#поражение второй
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h
        where id_team = team_guest;
        
    elseif goal_h < goal_v then
    #поражение первой
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v
        where id_team = team_home;
	#победа второй
        update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 3
        where id_team = team_guest;
        
	else
    #ничья
		update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 1
        where id_team = team_home;
        
        update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 1
        where id_team = team_guest;
    
    end if;
elseif old.goal_home <> new.goal_home or old.goal_guest <> new.goal_guest then
	set goal_h = new.goal_home;
	set goal_v = new.goal_guest;
    if goal_h > goal_v then
    #победа первой
		if old.goal_home > old.goal_guest then 
			#старая победа первой
            update tournament_table
            set goals_scored = goals_scored - old.goal_home + new.goal_home,
            goals_conceded = goals_conceded - old.goal_guest + new.goal_guest
            where id_team = team_home;
            #старое поражение второй
            update tournament_table
			set goals_scored = goals_scored - old.goal_guest + new.goal_guest,
			goals_conceded = goals_conceded - old.goal_home + new.goal_home
			where id_team = team_guest;
        end if;
        #доделать для каждого старого события
		/*update tournament_table 
		set wins = wins + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 3
        where id_team = team_home;
	#поражение второй
		update tournament_table
        set losses = losses + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h
        where id_team = team_guest;*/
        
    elseif goal_h < goal_v then
    #поражение первой
		update tournament_table
        set losses = losses + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v
        where id_team = team_home;
	#победа второй
        update tournament_table 
		set wins = wins + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 3
        where id_team = team_guest;
        
	else
    #ничья
		update tournament_table
		set draws = draws + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, points = points + 1
        where id_team = team_home;
        
        update tournament_table
		set draws = draws + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, points = points + 1
        where id_team = team_guest;
    
    end if;      
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id_player` int(11) NOT NULL AUTO_INCREMENT,
  `id_team` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `id_amplua` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_player`),
  KEY `fk_players_teams_idx` (`id_team`),
  KEY `fk_players_amplua1_idx` (`id_amplua`),
  CONSTRAINT `fk_players_amplua1` FOREIGN KEY (`id_amplua`) REFERENCES `amplua` (`id_amplua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_teams` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,12,'Гаспарян Альберт Араикович',1,'1995-08-28',0,'Гаспарян Альберт Араикович.png'),(2,12,'Тимербулатов Ильяс Рифович',1,'1983-09-13',0,'Тимербулатов Ильяс Рифович.png'),(3,12,'Фомин Роман Геннадьевич',1,'1995-05-27',0,'Фомин Роман Геннадьевич.png'),(4,12,'Абовян Мартун Ашотович',2,'1994-01-14',0,'Абовян Мартун Ашотович.png'),(5,12,'Драгунов Игорь Александрович',2,'1991-04-06',0,'Драгунов Игорь Александрович.png'),(6,12,'Котунов Александр Андреевич',2,'1988-03-19',0,'Котунов Александр Андреевич.png'),(7,12,'Лучинкин Михаил Вадимович',2,'1991-01-11',0,'Лучинкин Михаил Вадимович.png'),(8,12,'Мартынов Артур Андреевич',2,'1991-01-03',0,'Мартынов Артур Андреевич.png'),(9,12,'Узунян Давид Русланович',2,'2000-02-04',0,'Узунян Давид Русланович.png'),(10,12,'Хасенов Ринат Надирович',2,'1987-05-08',0,'Хасенов Ринат Надирович.png'),(11,12,'Абдеев Тимур Ринатович',3,'1991-08-02',0,'Абдеев Тимур Ринатович.png'),(12,12,'Абраамян Зарзанд Манукович',3,'1991-03-25',0,'Абраамян Зарзанд Манукович.png'),(13,12,'Ващенко Богдан Евгеньевич',3,'1994-02-17',0,'Ващенко Богдан Евгеньевич.png'),(14,12,'Дёмин Владимир Романович',3,'1989-09-29',0,'Дёмин Владимир Романович.png'),(15,12,'Дмитриев Олег Сергеевич',3,'1995-11-18',0,'Дмитриев Олег Сергеевич.png'),(16,12,'Жамалетдинов Ильнар Гаярович',3,'1990-11-19',0,'Жамалетдинов Ильнар Гаярович.png'),(17,12,'Карандашов Иван Вячеславович',3,'1991-09-29',0,'Карандашов Иван Вячеславович.png'),(18,12,'Козлов Михаил Андреевич',3,'1991-02-10',0,'Козлов Михаил Андреевич.png'),(19,12,'Кужлев Олег Олегович',3,'1990-03-21',0,'Кужлев Олег Олегович.png'),(20,12,'Лёвин Василий Яковлевич',3,'1998-05-25',0,'Лёвин Василий Яковлевич.png'),(21,12,'Лимонов Фёдор Андреевич',3,'1995-12-02',0,'Лимонов Фёдор Андреевич.png'),(22,12,'Маричев Евгений Станиславович',3,'1995-07-27',0,'Маричев Евгений Станиславович.png'),(23,12,'Пилиев Ника Константинович',3,'1991-03-21',0,'Пилиев Ника Константинович.png'),(24,12,'Родионов Евгений Викторович',3,'1991-01-26',0,'Родионов Евгений Викторович.png'),(25,12,'Хамзин Рустам Саярович',3,'1994-09-04',0,'Хамзин Рустам Саярович.png'),(26,12,'Шинкаренко Александр Игоревич',3,'1993-09-14',0,'Шинкаренко Александр Игоревич.png'),(27,12,'Исаев Мурад Джабраилович',4,'1991-03-16',0,'Исаев Мурад Джабраилович.png'),(28,12,'Козлов Александр Сергеевич-II',4,'1993-03-08',0,'Козлов Александр Сергеевич-II.png'),(29,12,'Кухарчук Дмитрий Владимирович',4,'1992-07-27',0,'Кухарчук Дмитрий Владимирович.png'),(30,12,'Панокин Даниил Вячеславович',4,'1991-01-25',0,'Панокин Даниил Вячеславович.png'),(31,3,'Кликин Максим Николаевич',1,'1981-04-30',0,'Кликин Максим Николаевич.png'),(32,3,'Костенко Евгений Александрович',1,'1986-11-01',0,'Костенко Евгений Александрович.png'),(33,3,'Мельников Андрей Николаевич',1,'1979-04-02',0,'Мельников Андрей Николаевич.png'),(34,3,'Журавлёв Александр Владимирович',2,'1985-02-22',0,'Журавлёв Александр Владимирович.png'),(35,3,'Косачёв Виктор Вячеславович',2,'1991-11-03',0,'Косачёв Виктор Вячеславович.png'),(36,3,'Кулагин Антон Андреевич',2,'1986-04-16',0,'Кулагин Антон Андреевич.png'),(37,3,'Садиков Марат Рустямович',2,'1991-05-03',0,'Садиков Марат Рустямович.png'),(38,3,'Сучков Денис Николаевич',2,'1985-11-03',0,'Сучков Денис Николаевич.png'),(39,3,'Харламов Сергей Борисович',2,'1991-01-24',0,'Харламов Сергей Борисович.png'),(40,3,'Балаян Нарек Гарсеванович',3,'1991-03-20',0,'Балаян Нарек Гарсеванович.png'),(41,3,'Горячев Антон Германович',3,'1990-03-24',0,'Горячев Антон Германович.png'),(42,3,'Демянков Сергей Александрович',3,'1990-03-16',0,'Демянков Сергей Александрович.png'),(43,3,'Клинин Андрей Михайлович',3,'1986-12-26',0,'Клинин Андрей Михайлович.png'),(44,3,'Максимов Александр Сергеевич',3,'1990-05-17',0,'Максимов Александр Сергеевич.png'),(45,3,'Миронов Андрей Сергеевич',3,'1991-06-23',0,'Миронов Андрей Сергеевич.png'),(46,3,'Миронов Николай Геннадьевич',3,'1988-05-05',0,'Миронов Николай Геннадьевич.png'),(47,3,'Мухин Максим Александрович',3,'1987-02-19',0,'Мухин Максим Александрович.png'),(48,3,'Новиков Юрий Николаевич',3,'1985-04-23',0,'Новиков Юрий Николаевич.png'),(49,3,'Прокопьев Константин Олегович',3,'1993-04-07',0,'Прокопьев Константин Олегович.png'),(50,3,'Уразаков Эдуард Васимович',3,'1985-04-14',0,'Уразаков Эдуард Васимович.png'),(51,3,'Артамонов Михаил Михайлович',4,'1985-01-07',0,'Артамонов Михаил Михайлович.png'),(52,3,'Бунтов Максим Анатольевич',4,'1984-03-28',0,'Бунтов Максим Анатольевич.png'),(53,3,'Колыванов Илья Алексеевич',4,'1985-04-06',0,'Колыванов Илья Алексеевич.png'),(54,3,'Перемитин Анатолий Константинович',4,'1986-10-27',0,'Перемитин Анатолий Константинович.png'),(55,1,'Кузнецов Василий Александрович',1,'1978-08-24',0,'Кузнецов Василий Александрович.png'),(56,1,'Филатов Кирилл Сергеевич',1,'1987-04-02',0,'Филатов Кирилл Сергеевич.png'),(57,1,'Домрин Дмитрий Игоревич',2,'1992-09-18',0,'Домрин Дмитрий Игоревич.png'),(58,1,'Иванов Андрей Алексеевич',2,'1988-10-08',0,'Иванов Андрей Алексеевич.png'),(59,1,'Озеров Александр Андреевич',2,'1986-08-21',0,'Озеров Александр Андреевич.png'),(60,1,'Пискунов Антон Алексеевич',2,'1989-07-12',0,'Пискунов Антон Алексеевич.png'),(61,1,'Потапенко Дмитрий Германович',2,'1991-04-10',0,'Потапенко Дмитрий Германович.png'),(62,1,'Шевчук Игорь Анатольевич',2,'1979-12-04',0,'Шевчук Игорь Анатольевич.png'),(63,1,'Аносов Роман Александрович',3,'1990-05-15',0,'Аносов Роман Александрович.png'),(64,1,'Антипов Артём Юрьевич',3,'1988-11-28',0,'Антипов Артём Юрьевич.png'),(65,1,'Иванов Андрей Владимирович',3,'1991-05-19',0,'Иванов Андрей Владимирович.png'),(66,1,'Каретников Михаил Андреевич',3,'1991-10-08',0,'Каретников Михаил Андреевич.png'),(67,1,'Павленко Алексей Юрьевич',3,'1984-07-29',0,'Павленко Алексей Юрьевич.png'),(68,1,'Пискунов Леонид Алексеевич',3,'1978-02-15',0,'Пискунов Леонид Алексеевич.png'),(69,1,'Спицин Александр Сергеевич',3,'1980-06-23',0,'Спицин Александр Сергеевич.png'),(70,1,'Шеин Игорь Владимирович',3,'1989-01-08',0,'Шеин Игорь Владимирович.png'),(71,1,'Гумеров Азамат Амирович',4,'1978-12-07',0,'Гумеров Азамат Амирович.png'),(72,1,'Чечукевич Алексей Анатольевич',4,'1987-08-24',0,'Чечукевич Алексей Анатольевич.png'),(73,7,'Погорелов Андрей Юрьевич',1,'1979-03-18',0,'Погорелов Андрей Юрьевич.png'),(74,7,'Тимошенко Владислав Станиславович',1,'1990-03-12',0,'Тимошенко Владислав Станиславович.png'),(75,7,'Ульянов Алексей Алексеевич',1,'1987-01-20',0,'Ульянов Алексей Алексеевич.png'),(76,7,'Закеров Марат Наилевич',2,'1988-04-23',0,'Закеров Марат Наилевич.png'),(77,7,'Корнеев Игорь Сергеевич',2,'1993-04-26',0,'Корнеев Игорь Сергеевич.png'),(78,7,'Королёв Дмитрий Вячеславович',2,'1988-04-15',0,'Королёв Дмитрий Вячеславович.png'),(79,7,'Мирзоев Нарек Юрьевич',2,'1987-08-20',0,'Мирзоев Нарек Юрьевич.png'),(80,7,'Платухин Алексей Иванович',2,'1982-06-26',0,'Платухин Алексей Иванович.png'),(81,7,'Свиридов Кирилл Дмитриевич',2,'1992-07-31',0,'Свиридов Кирилл Дмитриевич.png'),(82,7,'Гудей Дмитрий Васильевич',3,'1984-05-10',0,'Гудей Дмитрий Васильевич.png'),(83,7,'Дмитриев Вячеслав Сергеевич',3,'1990-05-28',0,'Дмитриев Вячеслав Сергеевич.png'),(84,7,'Кузьмин Алексей Геннадьевич',3,'1990-10-08',0,'Кузьмин Алексей Геннадьевич.png'),(85,7,'Маврин Василий Евгеньевич',3,'1989-11-05',0,'Маврин Василий Евгеньевич.png'),(86,7,'Макаров Александр Александрович',3,'1991-06-30',0,'Макаров Александр Александрович.png'),(87,7,'Минасян Альберт Аведисович',3,'1993-06-19',0,'Минасян Альберт Аведисович.png'),(88,9,'Самылин Алексей Дмитриевич',3,'1997-10-15',0,'Самылин Алексей Дмитриевич.png'),(89,7,'Сидин Виктор Александрович',3,'1991-04-02',0,'Сидин Виктор Александрович.png'),(90,7,'Элязян Алик Дживанович',3,'1987-04-06',0,'Элязян Алик Дживанович.png'),(91,7,'Курамшин Дамир Надерович',4,'1986-08-20',0,'Курамшин Дамир Надерович.png'),(92,7,'Салихов Радик Равильевич',4,'1989-09-01',0,'Салихов Радик Равильевич.png'),(93,7,'Таибов Ренат Расимович',4,'1990-08-11',0,'Таибов Ренат Расимович.png'),(94,7,'Хасянов Ринат Саярович',4,'1981-01-27',0,'Хасянов Ринат Саярович.png'),(95,11,'Низрюхин Александр Сергеевич',1,'1989-01-12',0,'Низрюхин Александр Сергеевич.png'),(96,11,'Смирнов Никита Михайлович',1,'1996-01-22',0,'Смирнов Никита Михайлович.png'),(97,11,'Козлов Алексей Владимирович',2,'1975-08-18',0,'Козлов Алексей Владимирович.png'),(98,11,'Малюков Олег Олегович',2,'1985-01-16',0,'Малюков Олег Олегович.png'),(99,11,'Морыганов Кирилл Андреевич',2,'1991-02-07',0,'Морыганов Кирилл Андреевич.png'),(100,11,'Никулов Сергей Юрьевич',2,'1991-02-23',0,'Никулов Сергей Юрьевич.png'),(101,11,'Новиков Антон Игоревич',2,'1989-07-07',0,'Новиков Антон Игоревич.png'),(102,11,'Сергеев Никита Николаевич',2,'1992-02-14',0,'Сергеев Никита Николаевич.png'),(103,11,'Скворцов Александр Владимирович-III',2,'1982-03-06',0,'Скворцов Александр Владимирович-III.png'),(104,11,'Тихомиров Антон Юрьевич',2,'1985-11-09',0,'Тихомиров Антон Юрьевич.png'),(105,11,'Алексанян Артак Левонович',3,'1991-03-10',0,'Алексанян Артак Левонович.png'),(106,11,'Василенко Александр Владимирович',3,'1986-10-30',0,'Василенко Александр Владимирович.png'),(107,11,'Галыгин Кирилл Викторович',3,'1987-09-10',0,'Галыгин Кирилл Викторович.png'),(108,11,'Калашник Алексей Алексеевич',3,'1983-01-20',0,'Калашник Алексей Алексеевич.png'),(109,11,'Мальгин Анатолий Витальевич',3,'1991-04-19',0,'Мальгин Анатолий Витальевич.png'),(110,11,'Мамулашвили Гига Теймуразович',3,'1991-10-02',0,'Мамулашвили Гига Теймуразович.png'),(111,11,'Мухутдинов Альмир Нуруллович',3,'1985-06-09',0,'Мухутдинов Альмир Нуруллович.png'),(112,11,'Неретин Сергей Владимирович',3,'1980-01-16',0,'Неретин Сергей Владимирович.png'),(113,11,'Павлов Константин Сергеевич',3,'1989-01-21',0,'Павлов Константин Сергеевич.png'),(114,11,'Родин Иван Алексеевич',3,'1987-04-14',0,'Родин Иван Алексеевич.png'),(115,11,'Самсонов Артём Владимирович',3,'1989-02-06',0,'Самсонов Артём Владимирович.png'),(116,11,'Туменко Александр Владимирович',3,'1983-07-15',0,'Туменко Александр Владимирович.png'),(117,11,'Чернухин Дмитрий Сергеевич',3,'1988-11-17',0,'Чернухин Дмитрий Сергеевич.png'),(118,11,'Гусак Дмитрий Владимирович',4,'1985-07-01',0,'Гусак Дмитрий Владимирович.png'),(119,11,'Крыжановский Игорь Николаевич',4,'1989-08-23',0,'Крыжановский Игорь Николаевич.png'),(120,11,'Садиков Дамир Маратович',4,'1991-07-12',0,'Садиков Дамир Маратович.png'),(121,11,'Селиванов Александр Александрович',4,'1985-03-21',0,'Селиванов Александр Александрович.png'),(122,11,'Тихонов Дмитрий Владимирович',4,'1988-08-13',0,'Тихонов Дмитрий Владимирович.png'),(123,11,'Трегулов Дамир Ксяинович',4,'1998-11-07',0,'Трегулов Дамир Ксяинович.png'),(124,2,'Оленин Игорь Валерьевич',1,'1985-09-30',0,'Оленин Игорь Валерьевич.png'),(125,2,'Хомутинников Павел Николаевич',1,'1984-03-15',0,'Хомутинников Павел Николаевич.png'),(126,2,'Борисов Андрей Андреевич',2,'1991-12-13',0,'Борисов Андрей Андреевич.png'),(127,2,'Капоткин Александр Александрович',2,'1993-01-15',0,'Капоткин Александр Александрович.png'),(128,2,'Киселёв Михаил Иванович',2,'1978-10-23',0,'Киселёв Михаил Иванович.png'),(129,2,'Кузьмин Владимир Петрович',2,'1986-04-19',0,'Кузьмин Владимир Петрович.png'),(130,2,'Мотыкевич Дмитрий Андреевич',2,'1990-11-29',0,'Мотыкевич Дмитрий Андреевич.png'),(131,2,'Борисов Евгений Андреевич',3,'1981-05-22',0,'Борисов Евгений Андреевич.png'),(132,2,'Горшков Борис Игоревич',3,'1993-04-17',0,'Горшков Борис Игоревич.png'),(133,2,'Гуляев Павел Викторович',3,'1982-12-09',0,'Гуляев Павел Викторович.png'),(134,2,'Деев Михаил Петрович',3,'1987-11-10',0,'Деев Михаил Петрович.png'),(135,2,'Локшин Владимир Александрович',3,'1989-12-13',0,'Локшин Владимир Александрович.png'),(136,2,'Локшин Игорь Александрович',3,'1991-12-18',0,'Локшин Игорь Александрович.png'),(137,2,'Разин Андрей Михайлович',3,'1995-06-22',0,'Разин Андрей Михайлович.png'),(138,2,'Суров Денис Константинович',3,'1989-03-03',0,'Суров Денис Константинович.png'),(139,2,'Буданов Александр Сергеевич',4,'1991-04-27',0,'Буданов Александр Сергеевич.png'),(140,2,'Ефимов Руслан Мэлсович',4,'1991-01-29',0,'Ефимов Руслан Мэлсович.png'),(141,2,'Лычёв Егор Александрович',4,'1994-07-24',0,'Лычёв Егор Александрович.png'),(142,2,'Низаметдинов Рамиль Наильевич',4,'1992-04-28',0,'Низаметдинов Рамиль Наильевич.png'),(143,2,'Орнат Андрей Петрович',4,'1991-03-04',0,'Орнат Андрей Петрович.png'),(144,2,'Сербин Дмитрий Александрович',4,'1987-07-31',0,'Сербин Дмитрий Александрович.png'),(145,8,'Гамидов Алексей Алексеевич',1,'1991-12-02',0,'Гамидов Алексей Алексеевич.png'),(146,8,'Сидорко Сергей Алексеевич',1,'1990-01-06',0,'Сидорко Сергей Алексеевич.png'),(147,8,'Коломыц Юрий Сергеевич',2,'1979-04-30',0,'Коломыц Юрий Сергеевич.png'),(148,8,'Королёв Дмитрий Сергеевич',2,'1989-01-02',0,'Королёв Дмитрий Сергеевич.png'),(149,8,'Куделин Дмитрий Анатольевич',2,'1991-04-08',0,'Куделин Дмитрий Анатольевич.png'),(150,8,'Матвеев Артём Евгеньевич',2,'1990-08-25',0,'Матвеев Артём Евгеньевич.png'),(151,8,'Пугачёв Михаил Михайлович',2,'1987-11-21',0,'Пугачёв Михаил Михайлович.png'),(152,8,'Решетняк Михаил Александрович',2,'1996-01-23',0,'Решетняк Михаил Александрович.png'),(153,8,'Хугаев Валерий Казбекович',2,'1988-09-27',0,'Хугаев Валерий Казбекович.png'),(154,8,'Вагин Дмитрий Леонидович',3,'1990-07-23',0,'Вагин Дмитрий Леонидович.png'),(155,8,'Грачёв Павел Максимович',3,'1993-08-24',0,'Грачёв Павел Максимович.png'),(156,8,'Громов Роман Юрьевич',3,'1981-08-07',0,'Громов Роман Юрьевич.png'),(157,8,'Заботин Кирилл Владимирович',3,'1996-01-28',0,'Заботин Кирилл Владимирович.png'),(158,8,'Зотов Константин Владимирович',3,'1986-01-14',0,'Зотов Константин Владимирович.png'),(159,8,'Келдияров Азиз Азимбаевич',3,'1990-07-04',0,'Келдияров Азиз Азимбаевич.png'),(160,8,'Косович Артём Андреевич',3,'1995-10-05',0,'Косович Артём Андреевич.png'),(161,8,'Орлов Артём Сергеевич',3,'1995-05-12',0,'Орлов Артём Сергеевич.png'),(162,8,'Пивоваров Сергей Александрович',3,'1989-10-12',0,'Пивоваров Сергей Александрович.png'),(163,8,'Шанин Ян Александрович',3,'1993-04-20',0,'Шанин Ян Александрович.png'),(164,8,'Данилин Сергей Алексеевич',4,'1985-12-04',0,'Данилин Сергей Алексеевич.png'),(165,8,'Жемаев Вячеслав Алексеевич',4,'1987-12-24',0,'Жемаев Вячеслав Алексеевич.png'),(166,8,'Романович Сергей Иванович',4,'1984-02-18',0,'Романович Сергей Иванович.png'),(167,8,'Третьяков Георгий Алексеевич',4,'1984-01-16',0,'Третьяков Георгий Алексеевич.png'),(168,13,'Мякушко Александр Игоревич',1,'1996-05-04',0,'Мякушко Александр Игоревич.png'),(169,13,'Утин Николай Александрович',1,'1998-05-12',0,'Утин Николай Александрович.png'),(170,13,'Артёмов Максим Валерьевич',2,'1996-09-29',0,'Артёмов Максим Валерьевич.png'),(171,13,'Баранов Антон Валерьевич',2,'1996-12-21',0,'Баранов Антон Валерьевич.png'),(172,13,'Братяков Даниил Кириллович',2,'2000-09-28',0,'Братяков Даниил Кириллович.png'),(173,13,'Дорохин Владимир Александрович',2,'1998-01-22',0,'Дорохин Владимир Александрович.png'),(174,13,'Кузяев Михаил Игоревич',2,'1988-01-22',0,'Кузяев Михаил Игоревич.png'),(175,13,'Ропот Андрей Дмитриевич',2,'1979-09-17',0,'Ропот Андрей Дмитриевич.png'),(176,13,'Сорокин Михаил Сергеевич',2,'1982-12-13',0,'Сорокин Михаил Сергеевич.png'),(177,13,'Цурков Данила Сергеевич',2,'1995-10-17',0,'Цурков Данила Сергеевич.png'),(178,13,'Цыплухин Илья Станиславович',2,'1997-03-05',0,'Цыплухин Илья Станиславович.png'),(179,13,'Алиев Гия Датоевич',3,'1990-03-04',0,'Алиев Гия Датоевич.png'),(180,13,'Беломытцев Андрей Александрович',3,'1994-10-29',0,'Беломытцев Андрей Александрович.png'),(181,13,'Калинин Антон Вадимович',3,'1995-08-05',0,'Калинин Антон Вадимович.png'),(182,13,'Колеев Денис Васильевич',3,'1990-06-14',0,'Колеев Денис Васильевич.png'),(183,10,'Колесник Григорий Фёдорович',3,'1990-02-22',0,'Колесник Григорий Фёдорович.png'),(184,13,'Майга Мамаду',3,'1995-02-10',0,'Майга Мамаду.png'),(185,13,'Попов Антон Александрович-II',3,'1994-08-19',0,'Попов Антон Александрович-II.png'),(186,13,'Савельев Евгений Михайлович',3,'1993-06-15',0,'Савельев Евгений Михайлович.png'),(187,13,'Сахаров Вадим Сергеевич',3,'1996-07-12',0,'Сахаров Вадим Сергеевич.png'),(188,13,'Соболев Антон Олегович',3,'1993-08-13',0,'Соболев Антон Олегович.png'),(189,13,'Стукалов Павел Алексеевич',3,'1999-08-26',0,'Стукалов Павел Алексеевич.png'),(190,9,'Стукалов Фёдор Алексеевич',3,'1997-01-22',0,'Стукалов Фёдор Алексеевич.png'),(191,13,'Сыроватень Владислав Сергеевич',3,'1999-09-02',0,'Сыроватень Владислав Сергеевич.png'),(192,15,'Ткачёв Олег Александрович',3,'1995-08-29',0,'Ткачёв Олег Александрович.png'),(193,13,'Гусев Виталий Александрович',4,'1994-04-04',0,'Гусев Виталий Александрович.png'),(194,5,'Старыгин Андрей Александрович',4,'1997-12-15',0,'Старыгин Андрей Александрович.png'),(195,13,'Юсупов Исмаил',4,'1998-02-26',0,'Юсупов Исмаил.png'),(196,10,'Гох Амаль Наджибуллаевич',1,'1993-06-30',0,'Гох Амаль Наджибуллаевич.png'),(197,10,'Плаксин Андрей Юрьевич',1,'1997-03-16',0,'Плаксин Андрей Юрьевич.png'),(198,10,'Антонов Сергей Николаевич',2,'1984-04-24',0,'Антонов Сергей Николаевич.png'),(199,10,'Батищев Алексей Михайлович',2,'1983-12-05',0,'Батищев Алексей Михайлович.png'),(200,10,'Борг Тимур Олегович',2,'1991-10-04',0,'Борг Тимур Олегович.png'),(201,10,'Великов Шамиль Нургалиевич',2,'1988-01-22',0,'Великов Шамиль Нургалиевич.png'),(202,10,'Догадаев Владимир Сергеевич',2,'1995-06-13',0,'Догадаев Владимир Сергеевич.png'),(203,10,'Майоров Юрий Геннадьевич',2,'1985-12-21',0,'Майоров Юрий Геннадьевич.png'),(204,10,'Манучарян Артур Ашотович',2,'1989-10-04',0,'Манучарян Артур Ашотович.png'),(205,10,'Никифоров Валерий Сергеевич',2,'1983-11-18',0,'Никифоров Валерий Сергеевич.png'),(206,10,'Рыбников Дмитрий Михайлович',2,'1980-12-30',0,'Рыбников Дмитрий Михайлович.png'),(207,10,'Серебряков Роман Эдуардович',2,'1988-08-21',0,'Серебряков Роман Эдуардович.png'),(208,10,'Сухарев Виктор Васильевич',2,'1993-03-10',0,'Сухарев Виктор Васильевич.png'),(209,10,'Ахуков Владислав Юрьевич',3,'1998-07-09',0,'Ахуков Владислав Юрьевич.png'),(210,10,'Безумов Егор Сергеевич',3,'1995-06-11',0,'Безумов Егор Сергеевич.png'),(211,10,'Груба Алексей Алексеевич',3,'1997-08-20',0,'Груба Алексей Алексеевич.png'),(212,10,'Давыдкин Тимур Бекханович',3,'1991-06-27',0,'Давыдкин Тимур Бекханович.png'),(213,10,'Давыдов Алексей Михайлович',3,'1982-02-01',0,'Давыдов Алексей Михайлович.png'),(214,10,'Догадаев Иван Сергеевич',3,'1995-06-13',0,'Догадаев Иван Сергеевич.png'),(215,10,'Есиков Михаил Александрович',3,'1997-12-06',0,'Есиков Михаил Александрович.png'),(216,10,'Колбин Олег Алексеевич',3,'1999-07-02',0,'Колбин Олег Алексеевич.png'),(217,10,'Кондратенко Илья Валерьевич',3,'1991-07-11',0,'Кондратенко Илья Валерьевич.png'),(218,10,'Миннигалеев Владимир Рафикович',3,'1995-05-12',0,'Миннигалеев Владимир Рафикович.png'),(219,10,'Напорчук Сергей',3,'1999-08-09',0,'Напорчук Сергей.png'),(220,10,'Новосёлов Артём Андреевич',3,'1986-06-07',0,'Новосёлов Артём Андреевич.png'),(221,10,'Семёнов Артём Александрович',3,'1997-04-12',0,'Семёнов Артём Александрович.png'),(222,10,'Сергеев Георгий Андреевич',3,'1988-01-23',0,'Сергеев Георгий Андреевич.png'),(223,10,'Середа Евгений Сергеевич',3,'1991-03-12',0,'Середа Евгений Сергеевич.png'),(224,10,'Стерхов Матвей Александрович',3,'1996-02-25',0,'Стерхов Матвей Александрович.png'),(225,10,'Финашин Семён Андреевич',3,'1995-03-06',0,'Финашин Семён Андреевич.png'),(226,10,'Харин Сергей Владимирович',3,'1990-01-09',0,'Харин Сергей Владимирович.png'),(227,10,'Бурыкин Алексей Игоревич',4,'1985-04-29',0,'Бурыкин Алексей Игоревич.png'),(228,10,'Быстров Алексей Вадимович',4,'1988-09-20',0,'Быстров Алексей Вадимович.png'),(229,10,'Олейников Александр Сергеевич',4,'1995-12-11',0,'Олейников Александр Сергеевич.png'),(230,10,'Плаксин Вячеслав Юрьевич',4,'1990-04-18',0,'Плаксин Вячеслав Юрьевич.png'),(231,10,'Хабаров Олег Александрович',4,'1982-10-17',0,'Хабаров Олег Александрович.png'),(232,6,'Ломоносов Дмитрий Сергеевич',1,'1995-04-10',0,'Ломоносов Дмитрий Сергеевич.png'),(233,6,'Чириков Владислав Андреевич',1,'1998-05-05',0,'Чириков Владислав Андреевич.png'),(234,6,'Акубардия Гогита Бидзинаевич',2,'1985-03-31',0,'Акубардия Гогита Бидзинаевич.png'),(235,6,'Амадбеков Тимур Тавалоевич',2,'1988-06-04',0,'Амадбеков Тимур Тавалоевич.png'),(236,6,'Андержанов Ильдар Шамилевич',2,'1988-01-28',0,'Андержанов Ильдар Шамилевич.png'),(237,6,'Болгар Григорий Григорьевич',2,'1996-05-08',0,'Болгар Григорий Григорьевич.png'),(238,6,'Валиахметов Артур Ибрагимович',2,'1987-09-15',0,'Валиахметов Артур Ибрагимович.png'),(239,6,'Дехин Марк Юрьевич',2,'1995-09-26',0,'Дехин Марк Юрьевич.png'),(240,6,'Жуков Алексей Сергеевич-II',2,'1987-03-29',0,'Жуков Алексей Сергеевич-II.png'),(241,6,'Мамонтов Максим Игоревич',2,'1988-10-21',0,'Мамонтов Максим Игоревич.png'),(242,6,'Сумароков Кирилл Андреевич',2,'1994-08-07',0,'Сумароков Кирилл Андреевич.png'),(243,6,'Тишков Александр Владимирович',2,'1986-04-25',0,'Тишков Александр Владимирович.png'),(244,6,'Антонов Марат Владимирович',3,'1991-04-13',0,'Антонов Марат Владимирович.png'),(245,6,'Багаутдинов Дамир Халитович',3,'1994-10-30',0,'Багаутдинов Дамир Халитович.png'),(246,6,'Билалов Радик Шевкетович',3,'1994-11-05',0,'Билалов Радик Шевкетович.png'),(247,6,'Бычков Никита Алексеевич',3,'1993-11-05',0,'Бычков Никита Алексеевич.png'),(248,6,'Климов Михаил Александрович',3,'1997-11-12',0,'Климов Михаил Александрович.png'),(249,6,'Лёмин Иосиф Гелаевич',3,'1998-05-29',0,'Лёмин Иосиф Гелаевич.png'),(250,6,'Муравлёв Алексей Сергеевич',3,'1990-10-20',0,'Муравлёв Алексей Сергеевич.png'),(251,6,'Налейкин Денис Вадимович',3,'1986-07-07',0,'Налейкин Денис Вадимович.png'),(252,6,'Сероштан Виктор Сергеевич',3,'1992-10-08',0,'Сероштан Виктор Сергеевич.png'),(253,6,'Шилин Виктор Вячеславович',3,'1995-05-20',0,'Шилин Виктор Вячеславович.png'),(254,6,'Шишков Роман Дмитриевич',3,'1993-07-24',0,'Шишков Роман Дмитриевич.png'),(255,6,'Бахтыев Рамиз Романович',4,'1995-10-15',0,'Бахтыев Рамиз Романович.png'),(256,6,'Быченко Владислав Вадимович',4,'1995-02-27',0,'Быченко Владислав Вадимович.png'),(257,6,'Никифоров Александр Анатольевич',4,'1978-02-02',0,'Никифоров Александр Анатольевич.png'),(258,6,'Сергеев Станислав Алексеевич',4,'1991-07-28',0,'Сергеев Станислав Алексеевич.png'),(259,16,'Васильев Илья Олегович',1,'1990-07-02',0,'Васильев Илья Олегович.png'),(260,16,'Холхунов Михаил Алексеевич',1,'1988-02-16',0,'Холхунов Михаил Алексеевич.png'),(261,16,'Богданов Даниил Владиславович',2,'1992-03-08',0,'Богданов Даниил Владиславович.png'),(262,16,'Бутузов Николай Юрьевич',2,'1987-03-04',0,'Бутузов Николай Юрьевич.png'),(263,16,'Доровских Константин Сергеевич',2,'1988-07-23',0,'Доровских Константин Сергеевич.png'),(264,16,'Дудыкин Дмитрий Львович',2,'1972-09-04',0,'Дудыкин Дмитрий Львович.png'),(265,16,'Жаров Максим Николаевич',2,'1982-07-22',0,'Жаров Максим Николаевич.png'),(266,16,'Захаров Дмитрий Александрович',2,'1989-04-26',0,'Захаров Дмитрий Александрович.png'),(267,16,'Куликов Дмитрий Павлович',2,'1986-06-15',0,'Куликов Дмитрий Павлович.png'),(268,16,'Филиппов Александр Сергеевич',2,'1991-11-18',0,'Филиппов Александр Сергеевич.png'),(269,16,'Цурков Евгений Геннадьевич',2,'1985-01-05',0,'Цурков Евгений Геннадьевич.png'),(270,16,'Билялетдинов Марат Ринатович',3,'1984-02-10',0,'Билялетдинов Марат Ринатович.png'),(271,16,'Галкин Дмитрий Александрович',3,'1996-03-27',0,'Галкин Дмитрий Александрович.png'),(272,16,'Голиков Илья Александрович',3,'1986-02-20',0,'Голиков Илья Александрович.png'),(273,16,'Зайнулин Евгений Рустамович',3,'1988-12-08',0,'Зайнулин Евгений Рустамович.png'),(274,16,'Костенко Алексей Игоревич',3,'1984-11-19',0,'Костенко Алексей Игоревич.png'),(275,16,'Крижановский Антон Сергеевич',3,'1987-04-06',0,'Крижановский Антон Сергеевич.png'),(276,16,'Кролевец Кирилл Юрьевич',3,'1986-10-07',0,'Кролевец Кирилл Юрьевич.png'),(277,16,'Осипов Павел Андреевич',3,'1991-01-02',0,'Осипов Павел Андреевич.png'),(278,16,'Сапаев Алексей Владимирович',3,'1983-01-28',0,'Сапаев Алексей Владимирович.png'),(279,16,'Гусенков Александр Валентинович',4,'1984-06-12',0,'Гусенков Александр Валентинович.png'),(280,16,'Мышонков Илья Олегович',4,'1994-01-03',0,'Мышонков Илья Олегович.png'),(281,16,'Наликашвили Валерий Валерьевич',4,'1982-07-06',0,'Наликашвили Валерий Валерьевич.png'),(282,9,'Гнездилов Денис Дмитриевич',1,'1991-11-28',0,'Гнездилов Денис Дмитриевич.png'),(283,9,'Калатович Роберт Олегович',1,'1989-01-04',0,'Калатович Роберт Олегович.png'),(284,9,'Ковалёв Павел Максимович',1,'1998-03-16',0,'Ковалёв Павел Максимович.png'),(285,9,'Савкин Михаил Михайлович',1,'1974-04-19',0,'Савкин Михаил Михайлович.png'),(286,9,'Казакевич Кирилл Максимович',2,'1998-08-18',0,'Казакевич Кирилл Максимович.png'),(287,9,'Мазурин Дмитрий Александрович',2,'1991-04-20',0,'Мазурин Дмитрий Александрович.png'),(288,9,'Химанов Алексей Александрович',2,'1981-05-03',0,'Химанов Алексей Александрович.png'),(289,9,'Яковлев Антон Дмитриевич',2,'1986-03-18',0,'Яковлев Антон Дмитриевич.png'),(290,9,'Артемьев Павел Евгеньевич',3,'1989-11-09',0,'Артемьев Павел Евгеньевич.png'),(291,9,'Бурау Игорь Викторович',3,'1983-08-11',0,'Бурау Игорь Викторович.png'),(292,9,'Вахитов Павел Романович',3,'1995-05-31',0,'Вахитов Павел Романович.png'),(293,9,'Горшков Сергей Алексеевич',3,'1999-11-29',0,'Горшков Сергей Алексеевич.png'),(294,9,'Ершов Александр Михайлович',3,'1984-02-24',0,'Ершов Александр Михайлович.png'),(295,9,'Желанов Дмитрий Михайлович',3,'1999-06-13',0,'Желанов Дмитрий Михайлович.png'),(296,9,'Зарипов Шамиль Гаярович',3,'1996-04-02',0,'Зарипов Шамиль Гаярович.png'),(297,9,'Кашаев Дмитрий Михайлович',3,'1996-07-24',0,'Кашаев Дмитрий Михайлович.png'),(298,9,'Лобков Максим Арнольдович',3,'1992-07-15',0,'Лобков Максим Арнольдович.png'),(299,9,'Титов Даниил Владимирович',3,'1999-07-14',0,'Титов Даниил Владимирович.png'),(300,9,'Фирсаков Андрей Витальевич',3,'1998-01-22',0,'Фирсаков Андрей Витальевич.png'),(301,9,'Фаттахов Дмитрий Данисович',4,'1996-09-24',0,'Фаттахов Дмитрий Данисович.png'),(302,4,'Конанков Иван Олегович',1,'1989-07-30',0,'Конанков Иван Олегович.png'),(303,4,'Николайченков Павел Андреевич',1,'1990-01-30',0,'Николайченков Павел Андреевич.png'),(304,4,'Барабанов Николай Николаевич',2,'1982-12-04',0,'Барабанов Николай Николаевич.png'),(305,4,'Безубцев Андрей Николаевич',2,'1982-03-13',0,'Безубцев Андрей Николаевич.png'),(306,4,'Грачёв Александр Александрович',2,'1990-08-15',0,'Грачёв Александр Александрович.png'),(307,4,'Озеров Александр Юрьевич',2,'1989-07-25',0,'Озеров Александр Юрьевич.png'),(308,4,'Васин Владислав Сергеевич',3,'1999-09-28',0,'Васин Владислав Сергеевич.png'),(309,4,'Дегтярёв Михаил Романович',3,'2000-11-09',0,'Дегтярёв Михаил Романович.png'),(310,4,'Диордиев Алексей Геннадьевич',3,'1991-10-15',0,'Диордиев Алексей Геннадьевич.png'),(311,4,'Корчагин Андрей Владимирович',3,'1998-05-05',0,'Корчагин Андрей Владимирович.png'),(312,4,'Мартыненко Павел Николаевич',3,'1987-09-28',0,'Мартыненко Павел Николаевич.png'),(313,4,'Писарев Михаил Дмитриевич',3,'1992-09-06',0,'Писарев Михаил Дмитриевич.png'),(314,4,'Погребной Виталий Олегович',3,'1997-05-02',0,'Погребной Виталий Олегович.png'),(315,4,'Пушкин Никита Николаевич',3,'2000-01-21',0,'Пушкин Никита Николаевич.png'),(316,4,'Семенистый Сергей Михайлович',3,'1995-11-14',0,'Семенистый Сергей Михайлович.png'),(317,4,'Сухов Максим Игоревич',3,'1993-03-29',0,'Сухов Максим Игоревич.png'),(318,4,'Терехов Денис Сергеевич',3,'1994-04-01',0,'Терехов Денис Сергеевич.png'),(319,4,'Фёдоров Алексей Павлович',3,'1990-03-22',0,'Фёдоров Алексей Павлович.png'),(320,4,'Цицвидзе Владимир Петрович',3,'1997-05-11',0,'Цицвидзе Владимир Петрович.png'),(321,4,'Щудрин Егор Владимирович',3,'1994-06-26',0,'Щудрин Егор Владимирович.png'),(322,4,'Грачёв Денис Александрович',4,'1978-03-23',0,'Грачёв Денис Александрович.png'),(323,4,'Крючков Никита Викторович',4,'1998-06-07',0,'Крючков Никита Викторович.png'),(324,4,'Ординян Артур Андреасович',4,'1998-01-15',0,'Ординян Артур Андреасович.png'),(325,15,'Горобинский Артур Витальевич',1,'1993-06-16',0,'Горобинский Артур Витальевич.png'),(326,15,'Иващенко Максим Анатольевич',2,'1990-03-07',0,'Иващенко Максим Анатольевич.png'),(327,15,'Любушкин Алексей Сергеевич',2,'1990-01-25',0,'Любушкин Алексей Сергеевич.png'),(328,15,'Матвеев Матвей Викторович',2,'1993-04-09',0,'Матвеев Матвей Викторович.png'),(329,15,'Рогов Роман Дмитриевич',2,'1990-11-29',0,'Рогов Роман Дмитриевич.png'),(330,15,'Старостин Василий Вячеславович',2,'1993-01-02',0,'Старостин Василий Вячеславович.png'),(331,15,'Акимов Игорь Олегович',3,'1988-02-07',0,'Акимов Игорь Олегович.png'),(332,15,'Иванов Кирилл Александрович',3,'1988-06-13',0,'Иванов Кирилл Александрович.png'),(333,15,'Крамаренко Даниэль Романович',3,'1995-10-29',0,'Крамаренко Даниэль Романович.png'),(334,15,'Кудрявцев Иван Анатольевич',3,'1993-04-19',0,'Кудрявцев Иван Анатольевич.png'),(335,15,'Попов Вадим Николаевич',3,'1996-02-14',0,'Попов Вадим Николаевич.png'),(336,15,'Савченко Антон Владимирович',3,'1990-09-17',0,'Савченко Антон Владимирович.png'),(337,15,'Семченков Роман Николаевич',3,'1988-03-13',0,'Семченков Роман Николаевич.png'),(338,15,'Ульянов Александр Дмитриевич',3,'1993-06-20',0,'Ульянов Александр Дмитриевич.png'),(339,15,'Цыбулевский Егор Павлович',3,'1994-05-16',0,'Цыбулевский Егор Павлович.png'),(340,15,'Боровской Александр Александрович',4,'1990-09-06',0,'Боровской Александр Александрович.png'),(341,15,'Зубков Александр Евгеньевич',4,'1999-07-22',0,'Зубков Александр Евгеньевич.png'),(342,14,'Калинин Павел Владимирович',1,'1989-02-15',0,'Калинин Павел Владимирович.png'),(343,14,'Мареев Андрей Валерьевич',1,'1981-01-29',0,'Мареев Андрей Валерьевич.png'),(344,14,'Дамаскин Максим Андреевич',2,'1987-04-14',0,'Дамаскин Максим Андреевич.png'),(345,14,'Легезин Максим Викторович',2,'1987-04-25',0,'Легезин Максим Викторович.png'),(346,14,'Новиков-Шестаков Олег Владимирович',2,'1987-05-14',0,'Новиков-Шестаков Олег Владимирович.png'),(347,14,'Радович Павел Мирославович',2,'1984-09-29',0,'Радович Павел Мирославович.png'),(348,14,'Кайсенов Никита Эдуардович',3,'1994-08-20',0,'Кайсенов Никита Эдуардович.png'),(349,14,'Кондарюк Дмитрий Игоревич',3,'1990-02-16',0,'Кондарюк Дмитрий Игоревич.png'),(350,14,'Мелентьев Андрей Юрьевич',3,'1988-03-19',0,'Мелентьев Андрей Юрьевич.png'),(351,14,'Наурбиев Магомед Баширович',3,'1985-10-08',0,'Наурбиев Магомед Баширович.png'),(352,14,'Одедесион Алексей Валерьевич',3,'1987-10-26',0,'Одедесион Алексей Валерьевич.png'),(353,14,'Понуровский Антон Александрович',3,'1988-09-02',0,'Понуровский Антон Александрович.png'),(354,14,'Раца Игорь Васильевич',3,'1988-08-03',0,'Раца Игорь Васильевич.png'),(355,14,'Стерлюкин Дмитрий Александрович',3,'1984-09-16',0,'Стерлюкин Дмитрий Александрович.png'),(356,14,'Хамидулин Александр Михайлович',3,'1968-03-12',0,'Хамидулин Александр Михайлович.png'),(357,14,'Шаряфетдинов Камиль Абдулганиевич',3,'1993-02-04',0,'Шаряфетдинов Камиль Абдулганиевич.png'),(358,14,'Ганюк Александр Леонидович',4,'1986-04-12',0,'Ганюк Александр Леонидович.png'),(359,14,'Ерков Владимир Владимирович',4,'1986-09-26',0,'Ерков Владимир Владимирович.png'),(360,14,'Козин Пётр Владимирович',4,'1988-04-04',0,'Козин Пётр Владимирович.png'),(361,14,'Скляров Евгений Александрович',4,'1980-05-31',0,'Скляров Евгений Александрович.png'),(362,5,'Казарян Варуж Варужевич',1,'1995-08-14',0,'Казарян Варуж Варужевич.png'),(363,5,'Макаров Владислав Александрович',1,'1996-01-06',0,'Макаров Владислав Александрович.png'),(364,5,'Алпаткин Евгений Геннадьевич',2,'1988-09-07',0,'Алпаткин Евгений Геннадьевич.png'),(365,5,'Архипцев Никита Андреевич',2,'1987-04-02',0,'Архипцев Никита Андреевич.png'),(366,5,'Кудрявцев Владимир Аркадьевич',2,'1987-11-23',0,'Кудрявцев Владимир Аркадьевич.png'),(367,5,'Пушкин Павел Александрович',2,'1988-03-19',0,'Пушкин Павел Александрович.png'),(368,5,'Трушель Пётр Юрьевич',2,'1984-04-27',0,'Трушель Пётр Юрьевич.png'),(369,5,'Шушунов Евгений Витальевич',2,'1988-03-05',0,'Шушунов Евгений Витальевич.png'),(370,5,'Барахтенко Сергей Александрович',3,'1993-05-15',0,'Барахтенко Сергей Александрович.png'),(371,5,'Жулин Виктор Константинович',3,'1996-03-02',0,'Жулин Виктор Константинович.png'),(372,5,'Кучеров Вячеслав Юрьевич',3,'1985-08-19',0,'Кучеров Вячеслав Юрьевич.png'),(373,5,'Мельник Олег Вячеславович',3,'1994-06-24',0,'Мельник Олег Вячеславович.png'),(374,5,'Мельников Сергей Сергеевич',3,'1987-01-16',0,'Мельников Сергей Сергеевич.png'),(375,5,'Можаев Денис Андреевич',3,'1997-06-01',0,'Можаев Денис Андреевич.png'),(376,5,'Озманян Давид Юрьевич',3,'1997-08-19',0,'Озманян Давид Юрьевич.png'),(377,5,'Озманян Даниил Юрьевич',3,'2000-03-24',0,'Озманян Даниил Юрьевич.png'),(378,5,'Пальцев Никита Александрович',3,'1986-11-07',0,'Пальцев Никита Александрович.png'),(379,5,'Подымов Александр Константинович',3,'1982-08-15',0,'Подымов Александр Константинович.png'),(380,5,'Свирин Антон Павлович',3,'1994-10-13',0,'Свирин Антон Павлович.png'),(381,5,'Седых Александр Александрович-II',3,'1985-03-03',0,'Седых Александр Александрович-II.png'),(382,5,'Шнайдерман Виктор Михайлович',3,'1985-12-06',0,'Шнайдерман Виктор Михайлович.png'),(383,5,'Грановский Борис Ильич',4,'1988-08-07',0,'Грановский Борис Ильич.png'),(384,5,'Плиев Шахан Олегович',4,'1994-10-03',0,'Плиев Шахан Олегович.png'),(385,5,'Степанов Святослав Александрович',4,'1997-04-09',0,'Степанов Святослав Александрович.png');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  tr_before_ins_players before insert on players
for each row
begin
	declare message char(100);
    declare f int;
    declare pl_name char(100);
    set pl_name = new.name;
    
    select id_player
	 into f
    from players p
    where p.name = pl_name;
    
    if  f is not null then 
		select Concat('Warning: player have already exist ()',' ', new.name)
        into message;
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = message;
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  tr_aft_ins_players after insert on players
for each row
begin

declare idPlayer int;
declare idSeason int;
declare idTeam int;

set idPlayer = new.id_player;
set idSeason = (select id_season from sesons
					where curdate() between year_start and year_end);
set idTeam = new.id_team;         
           
insert into players_statistics
set id_player = idPlayer, id_season = idSeason, id_team = idTeam,
games = 0, goal = 0, assist = 0, yellow_card = 0, red_card = 0, penalty = 0, own_goal = 0, penalty_out = 0;
 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `players_in_match`
--

DROP TABLE IF EXISTS `players_in_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_in_match` (
  `id_match` int(11) NOT NULL,
  `id_player` int(11) NOT NULL COMMENT 'Заявка на матч. Данные об игроке, участвующем в матче (его активность)',
  `count_goals` int(11) DEFAULT NULL,
  `count_assist` int(11) DEFAULT NULL,
  `yellow` int(11) DEFAULT NULL,
  `red` int(11) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `penalty_out` int(11) DEFAULT NULL,
  `own_goal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_match`,`id_player`),
  KEY `fk_players_in_match_players1_idx` (`id_player`),
  KEY `fk_players_in_match_matches1_idx` (`id_match`),
  CONSTRAINT `fk_players_in_match_matches1` FOREIGN KEY (`id_match`) REFERENCES `matches` (`id_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_players_in_match_players1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_in_match`
--

LOCK TABLES `players_in_match` WRITE;
/*!40000 ALTER TABLE `players_in_match` DISABLE KEYS */;
INSERT INTO `players_in_match` VALUES (1,124,0,0,0,0,0,0,0),(1,126,0,0,0,0,0,0,0),(1,127,0,1,0,0,0,0,0),(1,129,1,0,0,0,0,0,0),(1,130,0,0,0,0,0,0,0),(1,131,0,2,0,0,0,0,0),(1,132,0,0,0,0,0,0,0),(1,133,0,0,0,0,0,0,0),(1,137,0,0,0,0,0,0,0),(1,138,1,0,0,0,0,0,0),(1,140,0,1,0,0,0,0,0),(1,141,1,0,0,0,0,0,0),(1,143,0,0,0,0,0,0,0),(1,144,1,0,0,0,0,0,0),(1,343,0,0,0,0,0,0,0),(1,344,0,0,0,0,0,0,0),(1,346,0,0,0,0,0,0,0),(1,347,0,0,0,0,0,0,0),(1,348,0,0,0,0,0,0,0),(1,349,0,0,1,0,0,0,0),(1,353,0,0,0,0,0,0,0),(1,354,0,0,0,0,0,0,0),(1,356,0,0,0,0,0,0,0),(1,358,0,0,0,0,0,0,0),(1,361,0,0,1,0,0,0,0),(2,55,0,0,0,0,0,0,0),(2,57,1,0,0,0,0,0,0),(2,59,0,0,0,0,0,0,0),(2,60,0,0,0,0,0,0,0),(2,62,0,0,0,0,0,0,0),(2,64,3,1,0,0,0,0,0),(2,65,3,2,0,0,0,0,0),(2,66,4,1,0,0,0,0,0),(2,67,0,1,0,0,0,0,0),(2,68,0,5,0,0,0,0,0),(2,69,1,0,0,0,0,0,0),(2,71,2,1,0,0,0,0,0),(2,72,0,1,0,0,0,0,0),(2,260,0,0,0,0,0,0,0),(2,261,0,0,0,0,0,0,0),(2,263,0,0,0,0,0,0,0),(2,266,0,0,0,0,0,0,0),(2,267,0,0,0,0,0,0,0),(2,270,0,0,0,0,0,0,0),(2,273,0,0,1,0,0,0,0),(2,277,0,0,0,0,0,0,0),(2,279,0,0,0,0,0,0,0),(2,281,0,0,0,0,0,0,0),(3,1,0,1,0,0,0,0,0),(3,6,0,0,0,0,0,0,0),(3,7,0,0,0,0,0,0,0),(3,8,0,0,0,0,0,0,0),(3,10,0,0,0,0,0,0,0),(3,12,0,1,0,0,0,0,0),(3,15,2,0,0,0,0,0,0),(3,16,1,0,0,0,0,0,0),(3,18,0,0,0,0,0,0,0),(3,26,0,0,0,0,0,0,0),(3,27,0,0,0,0,0,0,0),(3,28,1,1,1,0,0,0,0),(3,29,0,1,0,0,0,0,0),(3,95,0,0,0,0,0,0,0),(3,98,0,0,1,0,0,0,0),(3,99,0,0,0,0,0,0,0),(3,100,0,0,0,0,0,0,1),(3,103,0,0,0,0,0,0,0),(3,104,0,0,1,0,0,0,0),(3,106,0,1,0,0,0,0,0),(3,107,0,0,0,0,0,0,0),(3,116,0,0,0,0,0,0,0),(3,117,0,0,0,0,0,0,0),(3,118,1,0,0,0,0,0,0),(3,119,2,1,0,0,0,0,0),(3,122,0,0,0,0,0,0,0),(4,88,1,0,1,0,0,0,0),(4,183,0,0,0,0,0,0,0),(4,190,1,0,0,0,0,0,0),(4,197,0,0,0,0,0,0,0),(4,202,0,0,1,0,0,0,0),(4,207,1,0,0,0,0,0,0),(4,208,0,0,0,0,0,0,0),(4,211,0,0,0,0,0,0,0),(4,212,1,0,0,0,0,0,0),(4,216,0,0,0,0,0,0,0),(4,217,0,0,0,0,0,0,0),(4,224,0,0,0,0,0,0,0),(4,226,0,0,0,0,0,0,0),(4,229,0,0,0,0,0,0,0),(4,230,0,0,0,0,0,0,0),(4,282,0,0,0,0,0,0,0),(4,287,0,0,0,0,0,0,0),(4,289,0,0,1,0,0,0,0),(4,290,0,0,0,0,0,0,0),(4,291,0,0,0,0,0,0,0),(4,293,0,0,0,0,0,0,0),(4,297,0,0,0,0,0,0,0),(4,298,0,0,1,0,0,0,0),(4,299,0,0,0,0,0,0,0),(4,301,0,0,0,0,0,0,0),(5,73,0,0,0,0,0,0,0),(5,75,0,0,0,0,0,0,0),(5,76,1,0,0,0,0,0,0),(5,77,0,0,0,0,0,0,0),(5,78,0,0,0,0,0,0,0),(5,79,0,0,0,0,0,0,0),(5,80,0,0,0,0,0,0,0),(5,81,0,0,0,0,0,0,0),(5,85,1,0,1,0,0,0,0),(5,86,0,0,0,0,0,0,0),(5,87,0,1,0,0,0,0,0),(5,89,0,0,0,0,0,0,0),(5,91,1,2,0,0,0,0,0),(5,92,1,0,0,0,0,0,0),(5,93,0,0,0,0,0,0,0),(5,94,0,0,0,0,0,0,0),(5,145,0,0,0,0,0,0,0),(5,148,1,0,0,0,0,0,0),(5,149,0,0,0,0,0,0,0),(5,151,0,1,1,0,0,0,0),(5,152,0,0,0,0,0,0,0),(5,153,1,0,0,0,0,0,0),(5,154,1,1,0,0,0,0,0),(5,155,0,0,0,0,0,0,0),(5,156,0,1,0,0,0,0,0),(5,158,0,1,1,0,0,0,0),(5,161,0,0,0,0,0,0,0),(5,162,0,0,0,0,0,0,0),(5,164,0,0,0,0,0,0,0),(5,167,1,0,0,0,0,0,0),(6,194,1,0,0,0,0,0,0),(6,302,0,0,0,0,0,0,0),(6,304,0,0,0,1,0,0,0),(6,306,0,1,0,0,0,0,0),(6,307,0,0,0,0,0,0,0),(6,311,0,0,0,0,0,0,0),(6,312,0,0,0,0,0,0,0),(6,313,1,0,0,0,0,0,0),(6,317,0,2,0,0,0,0,0),(6,319,2,0,0,0,0,0,0),(6,322,0,0,0,0,0,0,0),(6,362,0,0,0,0,0,0,0),(6,364,0,0,0,0,0,0,0),(6,365,0,0,0,0,0,0,0),(6,366,0,0,0,0,0,0,0),(6,369,0,0,0,0,0,0,0),(6,371,0,0,0,0,0,0,0),(6,374,0,0,0,0,0,0,0),(6,379,0,0,1,0,0,1,0),(6,380,0,1,0,0,0,0,0),(6,381,0,0,0,0,0,0,0),(6,382,1,0,0,0,0,0,0),(6,383,0,2,0,0,0,0,0),(6,384,2,0,0,0,0,0,0),(7,168,0,0,0,0,0,0,0),(7,169,0,0,0,0,0,0,0),(7,173,0,0,0,0,0,0,0),(7,176,0,0,0,1,0,0,0),(7,178,0,0,0,0,0,0,0),(7,179,1,0,0,0,0,0,0),(7,180,0,0,0,0,0,0,0),(7,181,1,0,0,0,0,0,0),(7,182,0,1,0,0,0,0,0),(7,184,0,0,0,0,0,0,0),(7,185,0,0,0,0,0,0,0),(7,187,0,0,0,0,0,0,0),(7,232,0,0,0,0,0,0,0),(7,235,0,0,0,0,0,0,0),(7,236,0,0,0,0,0,0,0),(7,237,1,0,0,0,0,0,0),(7,239,0,0,0,0,0,0,0),(7,241,0,0,0,0,0,0,0),(7,243,0,0,0,0,0,0,0),(7,245,0,0,0,0,0,0,0),(7,246,1,1,1,0,0,0,0),(7,250,0,0,0,0,0,0,0),(7,252,0,0,0,0,0,0,0),(7,253,0,0,0,0,0,0,0),(7,255,1,0,0,0,0,0,0),(7,256,0,0,0,0,0,0,0),(7,257,0,0,0,0,0,0,0),(8,31,0,0,0,0,0,0,0),(8,32,0,0,0,0,0,0,0),(8,34,0,0,0,0,0,0,0),(8,35,0,0,0,0,0,0,0),(8,36,0,0,0,0,0,0,0),(8,37,0,1,0,0,0,0,0),(8,39,0,1,0,0,0,0,0),(8,41,2,0,0,0,0,0,0),(8,42,0,0,0,0,0,0,0),(8,43,0,0,0,0,0,0,0),(8,44,0,0,0,0,0,0,0),(8,45,0,0,0,0,0,0,0),(8,46,0,1,0,0,0,0,0),(8,47,0,3,0,0,0,0,0),(8,48,1,0,0,0,0,0,0),(8,49,0,1,0,0,0,0,0),(8,50,0,1,0,0,0,0,0),(8,52,4,0,0,0,0,0,0),(8,53,1,0,0,0,0,0,0),(8,325,0,0,0,0,0,0,0),(8,326,0,0,0,0,0,0,0),(8,328,0,0,0,0,0,0,0),(8,333,0,0,0,0,0,0,0),(8,335,0,0,0,0,0,0,0),(8,336,0,0,0,0,0,0,0),(8,337,0,0,0,0,0,0,0),(8,340,0,0,0,0,0,0,0),(9,31,0,0,0,0,0,0,0),(9,34,0,0,0,0,0,0,0),(9,35,0,1,0,0,0,0,0),(9,37,1,1,0,0,0,0,0),(9,38,0,0,0,0,0,0,0),(9,40,1,0,0,0,0,0,0),(9,41,0,0,0,0,0,0,0),(9,42,0,0,0,0,0,0,0),(9,43,1,0,0,0,0,0,0),(9,44,0,0,0,0,0,0,0),(9,46,0,2,0,0,0,0,0),(9,47,1,0,0,0,0,0,0),(9,48,0,0,0,0,0,0,0),(9,49,0,0,0,0,0,0,0),(9,50,0,0,0,0,0,0,0),(9,52,0,0,0,0,0,0,0),(9,53,0,0,0,0,0,0,0),(9,54,1,0,0,0,0,0,0),(9,343,0,0,0,0,0,0,0),(9,344,0,0,0,0,0,0,0),(9,346,0,0,0,0,0,0,0),(9,348,0,0,0,0,0,0,0),(9,349,0,0,0,0,0,0,0),(9,351,0,0,0,0,0,0,0),(9,352,1,0,0,0,0,0,0),(9,353,0,0,0,0,0,0,0),(9,354,0,0,0,0,0,0,0),(9,356,0,0,0,0,0,0,0),(9,359,0,0,0,0,0,0,0),(9,361,0,0,0,0,0,0,0),(10,232,0,0,0,0,0,0,0),(10,235,0,0,0,0,0,0,0),(10,236,0,0,0,0,0,0,0),(10,237,0,0,0,0,0,0,0),(10,239,1,1,0,0,0,0,0),(10,241,0,0,0,0,0,0,1),(10,245,0,0,0,0,0,0,0),(10,246,0,0,0,0,0,0,0),(10,250,0,0,0,0,0,0,0),(10,251,0,0,0,0,0,0,0),(10,252,1,0,0,0,0,0,0),(10,255,0,0,0,0,0,0,0),(10,256,0,0,0,0,0,0,0),(10,257,0,1,0,0,0,0,0),(10,325,0,0,0,0,0,0,0),(10,326,0,0,0,0,0,0,0),(10,327,0,0,0,0,0,0,0),(10,328,0,1,0,0,0,0,0),(10,330,1,0,0,0,0,0,0),(10,331,0,0,0,0,0,0,0),(10,333,0,0,0,0,0,0,0),(10,335,1,0,0,0,0,0,0),(10,336,1,1,0,0,0,0,0),(10,337,0,0,0,0,0,0,0),(10,340,0,1,0,0,0,0,0),(11,168,0,0,0,0,0,0,0),(11,169,0,0,0,0,0,0,0),(11,170,0,0,0,0,0,0,0),(11,172,0,0,0,0,0,0,0),(11,178,0,0,0,0,0,0,0),(11,179,1,0,0,0,0,0,0),(11,180,0,0,0,0,0,0,0),(11,185,0,0,0,0,0,0,0),(11,187,0,1,0,0,0,0,0),(11,188,0,1,0,0,0,0,0),(11,193,2,0,0,0,0,0,0),(11,194,0,0,1,0,0,0,0),(11,195,0,0,0,0,0,0,0),(11,362,0,0,0,0,0,0,0),(11,364,0,0,0,0,0,0,0),(11,366,0,0,0,0,0,0,0),(11,369,0,1,0,0,0,0,0),(11,371,0,0,0,0,0,0,0),(11,374,0,0,1,0,0,0,0),(11,379,0,1,0,0,0,0,0),(11,380,0,0,0,0,0,0,0),(11,381,0,0,0,0,0,0,0),(11,382,1,0,0,0,0,0,0),(11,383,1,0,0,0,0,0,0),(11,384,0,0,0,0,0,0,0),(12,73,0,0,0,0,0,0,0),(12,77,0,0,1,0,0,0,0),(12,81,0,0,0,0,0,0,0),(12,85,1,1,1,0,0,0,0),(12,86,0,1,0,0,0,0,0),(12,91,2,0,0,0,0,0,0),(12,92,0,1,0,0,0,0,0),(12,93,1,0,0,0,0,0,0),(12,302,0,0,0,0,0,0,0),(12,306,0,0,0,0,0,0,0),(12,307,0,0,0,0,0,0,0),(12,309,0,0,0,0,0,0,0),(12,313,0,0,0,0,0,0,0),(12,317,0,0,0,0,0,0,0),(12,318,0,0,1,0,0,0,0),(12,319,0,0,0,0,0,0,0),(13,145,0,0,0,0,0,0,0),(13,148,0,0,0,0,0,0,0),(13,149,0,0,0,0,0,0,0),(13,151,0,0,0,0,0,0,0),(13,152,0,0,0,0,0,0,0),(13,153,0,0,0,0,0,0,0),(13,154,0,0,0,0,0,0,0),(13,156,0,0,0,0,0,0,0),(13,157,0,0,0,0,0,0,0),(13,158,0,0,0,0,0,0,0),(13,160,0,0,1,0,0,1,0),(13,162,0,0,0,0,0,0,0),(13,167,1,0,0,0,0,0,0),(13,197,0,0,0,0,0,0,0),(13,201,0,0,0,0,0,0,0),(13,202,0,0,0,0,0,0,0),(13,206,0,0,0,0,0,0,0),(13,207,0,1,0,0,0,0,0),(13,208,0,0,0,0,0,0,0),(13,209,0,1,0,0,0,0,0),(13,216,0,0,0,0,0,0,0),(13,217,0,0,0,0,0,0,0),(13,224,0,0,0,0,0,0,0),(13,226,0,0,0,0,0,0,0),(13,227,2,0,0,0,0,0,0),(13,229,0,0,0,0,0,0,0),(13,230,0,0,0,0,0,0,0),(14,88,1,1,0,0,0,0,0),(14,95,0,0,0,0,0,0,0),(14,98,0,0,0,0,0,0,0),(14,99,0,0,0,0,0,0,0),(14,100,0,1,0,0,0,0,0),(14,104,0,0,0,0,0,0,0),(14,106,2,0,0,0,0,0,0),(14,107,0,1,0,0,0,0,0),(14,108,0,0,0,0,0,0,0),(14,112,1,1,0,0,0,0,0),(14,116,0,0,0,0,0,0,0),(14,118,0,2,0,0,0,0,0),(14,122,2,0,0,0,0,0,0),(14,190,0,2,0,0,0,0,0),(14,282,0,0,0,0,0,0,0),(14,287,0,0,0,0,0,0,0),(14,288,0,0,0,0,0,0,0),(14,289,1,0,0,0,0,0,0),(14,290,0,0,0,0,0,0,0),(14,293,1,0,0,0,0,0,0),(14,297,0,0,0,0,0,0,0),(14,298,0,0,1,0,0,0,0),(14,299,0,0,0,0,0,0,0),(14,301,0,0,0,0,0,0,0),(15,3,0,0,1,0,0,0,0),(15,4,0,0,0,0,0,0,0),(15,6,0,0,0,0,0,0,0),(15,7,0,0,0,0,0,0,0),(15,8,0,0,0,0,0,0,0),(15,9,0,0,0,0,0,0,0),(15,12,0,0,1,0,0,0,0),(15,14,0,0,0,0,0,0,0),(15,16,0,1,0,0,0,0,0),(15,17,0,0,0,0,0,0,0),(15,18,0,0,0,0,0,0,0),(15,19,0,0,0,0,0,0,0),(15,20,0,0,0,0,0,0,0),(15,24,0,0,0,0,0,0,0),(15,25,0,0,0,0,0,0,0),(15,26,0,0,0,0,0,0,0),(15,27,1,0,0,0,0,0,0),(15,29,1,0,0,0,0,0,0),(15,30,0,0,0,0,0,0,0),(15,259,0,0,0,0,0,0,0),(15,261,0,0,0,0,0,0,0),(15,262,0,0,0,0,0,0,0),(15,263,0,0,0,0,0,0,0),(15,264,0,0,0,0,0,0,0),(15,267,0,0,0,0,0,0,0),(15,268,0,0,0,0,0,0,0),(15,269,0,0,0,0,0,0,0),(15,270,0,0,0,0,0,0,0),(15,272,0,0,0,0,0,0,0),(15,275,0,0,0,0,0,0,0),(15,279,0,0,1,0,0,0,0),(15,281,0,0,0,0,0,0,0),(16,56,0,0,0,0,0,0,0),(16,57,0,0,0,0,0,0,0),(16,58,0,1,0,0,0,0,0),(16,59,0,0,0,0,0,0,0),(16,60,0,0,0,0,0,0,0),(16,61,0,0,0,0,0,0,0),(16,62,0,0,0,0,0,0,0),(16,63,0,0,0,0,0,0,0),(16,64,0,0,0,0,0,0,0),(16,65,0,0,0,0,0,0,0),(16,66,0,1,0,0,0,0,0),(16,68,0,0,1,0,0,0,0),(16,69,0,0,1,0,0,0,0),(16,71,1,0,0,0,0,0,0),(16,72,1,0,1,0,0,0,0),(16,124,0,0,0,0,0,0,0),(16,126,1,1,0,0,0,0,0),(16,127,0,0,0,0,0,0,0),(16,129,0,0,1,0,0,0,0),(16,131,0,0,0,0,0,0,0),(16,132,0,0,0,0,0,0,0),(16,135,0,0,0,0,0,0,0),(16,137,0,0,0,0,0,0,0),(16,138,0,0,0,0,0,0,0),(16,140,1,1,0,0,0,0,0),(16,141,0,0,1,0,0,0,0),(16,142,0,0,0,0,0,0,0),(16,143,0,0,0,0,0,0,0),(16,144,0,0,0,0,0,0,0),(17,56,0,0,0,0,0,0,0),(17,57,1,1,0,0,0,0,0),(17,58,0,0,1,0,0,0,0),(17,59,1,0,0,0,0,0,0),(17,60,0,0,0,0,0,0,0),(17,61,1,1,0,0,0,0,0),(17,62,0,1,0,0,0,0,0),(17,63,1,0,0,0,0,0,0),(17,64,1,1,0,0,0,0,0),(17,65,4,1,0,0,0,0,0),(17,66,2,1,0,0,0,0,0),(17,68,0,1,0,0,0,0,0),(17,69,0,0,0,0,0,0,0),(17,71,0,2,0,0,0,0,0),(17,72,0,2,1,0,0,0,0),(17,343,0,0,0,0,0,0,0),(17,344,0,0,0,0,0,0,0),(17,346,0,0,0,0,0,0,0),(17,348,0,0,0,0,0,0,0),(17,349,0,0,0,0,0,0,0),(17,351,0,0,0,0,0,0,0),(17,352,0,0,0,0,0,0,0),(17,353,0,0,0,0,0,0,0),(17,354,0,0,0,0,0,0,0),(17,358,0,0,0,0,0,0,0),(17,359,0,0,0,0,0,0,0),(17,361,0,0,0,0,0,0,0),(18,3,0,0,0,0,0,0,0),(18,6,0,0,0,0,0,0,0),(18,7,0,0,0,0,0,0,0),(18,10,1,1,0,0,0,0,0),(18,11,0,0,0,0,0,0,0),(18,12,1,0,0,0,0,0,0),(18,14,0,0,0,0,0,0,0),(18,16,2,2,0,0,0,0,0),(18,17,1,0,0,0,0,0,0),(18,18,0,0,0,0,0,0,0),(18,19,0,0,0,0,0,0,0),(18,24,0,0,0,0,0,0,0),(18,25,0,0,0,0,0,0,0),(18,26,0,0,0,0,0,0,0),(18,27,0,0,0,0,0,0,0),(18,29,0,1,0,0,0,0,0),(18,30,0,0,0,0,0,0,0),(18,124,0,0,0,0,0,0,0),(18,126,0,0,0,0,0,0,0),(18,127,0,0,0,0,0,0,0),(18,128,0,0,0,0,0,0,0),(18,129,0,0,0,0,0,0,0),(18,130,0,0,0,0,0,0,0),(18,131,0,0,0,0,0,0,0),(18,132,0,0,0,0,0,0,0),(18,135,1,0,0,0,0,0,0),(18,136,0,0,0,0,0,0,0),(18,138,0,0,1,0,0,0,0),(18,140,0,0,0,0,0,0,0),(18,141,0,0,0,0,0,0,0),(18,142,0,1,0,0,0,0,0),(18,143,0,0,0,0,0,0,0),(19,88,1,0,0,0,0,0,0),(19,190,0,1,0,0,0,0,0),(19,260,0,0,0,0,0,0,0),(19,261,0,0,1,0,0,0,0),(19,262,0,0,0,0,0,0,0),(19,263,0,0,0,0,0,0,0),(19,264,0,0,0,0,0,0,0),(19,267,0,1,1,0,0,0,0),(19,268,0,0,0,0,0,0,0),(19,269,0,0,1,0,0,0,0),(19,270,0,0,0,0,0,0,0),(19,272,0,0,0,0,0,0,0),(19,273,0,0,0,0,0,0,0),(19,274,0,0,0,0,0,0,0),(19,275,0,0,0,0,0,0,0),(19,276,1,0,0,0,0,0,0),(19,277,0,0,0,0,0,0,0),(19,279,1,1,0,0,0,0,0),(19,281,0,0,0,0,0,0,0),(19,283,0,0,0,0,0,0,0),(19,287,0,1,0,0,0,0,0),(19,289,0,0,0,0,0,0,0),(19,292,0,0,0,0,0,0,0),(19,293,0,1,1,0,0,0,0),(19,297,0,0,0,0,0,0,0),(19,298,1,0,0,0,0,0,0),(19,299,0,0,0,0,0,0,0),(19,301,1,0,0,0,0,0,0),(20,95,0,0,0,0,0,0,0),(20,98,0,0,1,0,0,0,0),(20,99,0,0,0,0,0,0,0),(20,100,0,0,0,0,0,0,0),(20,104,0,0,1,0,0,0,0),(20,105,1,0,0,0,0,0,0),(20,106,0,1,0,0,0,0,0),(20,107,0,0,0,0,0,0,0),(20,108,0,0,0,0,0,0,0),(20,112,1,0,0,0,0,0,0),(20,116,0,0,0,0,0,0,0),(20,118,0,1,0,0,0,0,0),(20,119,0,0,0,0,0,0,0),(20,122,0,0,0,0,0,0,0),(20,145,0,0,0,0,0,0,0),(20,148,0,0,0,0,0,0,0),(20,149,0,2,0,0,0,0,0),(20,151,0,0,0,0,0,0,0),(20,154,1,2,0,0,0,0,0),(20,155,1,0,0,0,0,0,0),(20,156,0,0,0,0,0,0,0),(20,157,3,0,0,0,0,0,0),(20,158,0,2,0,0,0,0,0),(20,161,0,0,0,0,0,0,0),(20,162,0,1,1,0,0,2,0),(20,164,1,0,0,0,0,0,0),(20,167,1,0,0,0,0,0,0),(21,183,3,0,0,0,0,0,0),(21,197,0,0,0,0,0,0,0),(21,201,0,0,0,0,0,0,0),(21,202,2,0,0,0,0,0,0),(21,207,0,1,0,0,0,0,0),(21,217,1,0,0,0,0,0,0),(21,224,1,0,0,0,0,0,0),(21,226,0,2,0,0,0,0,0),(21,227,0,0,0,0,0,0,0),(21,229,0,0,0,0,0,0,0),(21,230,0,1,0,0,0,0,0),(21,302,0,0,0,0,0,0,0),(21,306,0,1,0,0,0,0,0),(21,307,0,1,0,0,0,0,0),(21,308,3,1,0,0,0,0,0),(21,309,0,0,0,0,0,0,0),(21,316,1,0,0,0,0,0,0),(21,317,0,2,0,0,0,0,0),(21,322,1,0,0,0,0,0,0),(22,75,0,0,0,0,0,0,0),(22,76,0,0,0,0,0,0,0),(22,77,0,0,0,0,0,0,0),(22,78,0,0,0,0,0,0,0),(22,80,0,1,0,0,0,0,0),(22,84,0,0,0,0,0,0,0),(22,85,0,0,0,0,0,0,0),(22,86,1,1,0,0,0,0,0),(22,87,0,0,0,0,0,0,0),(22,89,0,0,0,0,0,0,0),(22,90,2,0,0,0,0,0,0),(22,91,1,1,0,0,0,0,0),(22,92,1,0,0,0,0,0,0),(22,93,0,0,0,0,0,0,0),(22,94,0,0,0,0,0,0,0),(22,168,0,0,0,0,0,0,0),(22,169,0,0,0,0,0,0,0),(22,170,0,0,0,0,0,0,0),(22,171,0,0,0,0,0,0,0),(22,172,0,0,0,0,0,0,0),(22,178,1,0,0,0,0,0,0),(22,180,0,0,0,0,0,0,0),(22,181,0,0,0,0,0,0,0),(22,185,0,0,0,0,0,0,0),(22,186,0,1,0,0,0,0,0),(22,187,0,1,0,0,0,0,0),(22,188,0,0,0,0,0,0,0),(22,193,0,0,0,0,0,0,0),(22,195,1,0,0,0,0,0,0),(23,192,0,0,0,0,0,0,0),(23,194,1,0,0,0,0,0,0),(23,325,0,0,0,0,0,0,0),(23,326,0,0,0,0,0,0,0),(23,327,0,0,0,0,0,0,0),(23,330,1,0,0,0,0,0,0),(23,331,0,1,0,0,0,0,0),(23,332,0,1,0,0,0,0,0),(23,333,1,1,0,0,0,0,0),(23,335,2,0,0,0,0,0,0),(23,337,0,0,0,0,0,0,0),(23,340,0,1,0,0,0,0,0),(23,362,0,0,0,0,0,0,0),(23,364,0,1,0,0,0,0,0),(23,365,0,0,0,0,0,0,0),(23,366,0,0,0,0,0,0,0),(23,369,0,0,0,0,0,0,0),(23,375,0,0,0,0,0,0,0),(23,379,0,0,0,0,0,0,0),(23,380,1,0,0,0,0,0,0),(23,381,0,0,0,0,0,0,0),(23,384,1,0,0,0,0,0,0),(24,31,0,0,0,0,0,0,0),(24,34,0,0,0,0,0,0,0),(24,35,0,0,0,0,0,0,0),(24,39,1,1,0,0,0,0,0),(24,40,0,0,0,0,0,0,0),(24,41,1,1,0,0,0,0,0),(24,42,0,0,0,0,0,0,0),(24,43,0,1,0,0,0,0,0),(24,44,1,0,0,0,0,0,0),(24,45,1,2,0,0,0,0,0),(24,46,1,0,0,0,0,0,0),(24,47,1,2,0,0,0,0,0),(24,50,1,0,0,0,0,0,0),(24,52,2,1,0,0,0,0,0),(24,53,0,1,0,0,0,0,0),(24,54,3,1,0,0,0,0,0),(24,232,0,0,0,0,0,0,0),(24,235,0,0,0,0,0,0,0),(24,236,0,0,0,0,0,0,0),(24,237,0,0,0,0,0,0,0),(24,239,0,0,0,0,0,0,0),(24,241,0,0,0,0,0,0,0),(24,243,0,1,0,0,0,0,0),(24,245,0,0,0,0,0,0,0),(24,248,0,0,0,0,0,0,0),(24,254,0,0,0,0,0,0,0),(24,255,1,0,0,0,0,0,0),(24,256,0,0,0,0,0,0,0),(25,232,0,0,0,0,0,0,0),(25,236,0,0,0,0,0,0,0),(25,237,0,0,0,0,0,0,0),(25,239,0,0,0,0,0,0,0),(25,241,0,0,0,0,0,0,0),(25,243,0,1,0,0,0,0,0),(25,245,1,0,0,0,0,0,0),(25,247,0,0,0,0,0,0,0),(25,248,0,0,0,0,0,0,0),(25,250,1,0,0,0,0,0,0),(25,254,0,0,0,0,0,0,0),(25,256,1,0,0,0,0,0,0),(25,343,0,0,0,0,0,0,0),(25,344,0,0,0,0,0,0,0),(25,345,0,1,0,0,0,0,0),(25,346,0,0,0,0,0,0,0),(25,347,0,0,0,0,0,0,0),(25,348,0,0,0,0,0,0,0),(25,349,1,0,0,0,0,0,0),(25,351,0,0,0,0,0,0,0),(25,353,0,0,0,0,0,0,0),(25,354,0,0,0,0,0,0,0),(25,356,0,0,0,0,0,0,0),(25,358,0,0,0,0,0,0,0),(25,359,0,0,0,0,0,0,0),(25,360,0,0,0,0,0,0,0),(25,361,0,0,0,0,0,0,0),(26,31,0,0,0,0,0,0,0),(26,34,0,0,0,0,0,0,0),(26,35,0,1,0,0,0,0,0),(26,36,1,0,0,0,0,0,0),(26,38,0,0,0,0,0,0,0),(26,39,2,0,0,0,0,0,0),(26,41,1,0,0,0,0,0,0),(26,42,0,1,0,0,0,0,0),(26,43,1,1,0,0,0,0,0),(26,45,0,2,0,0,0,0,0),(26,46,0,2,0,0,0,0,0),(26,47,0,0,0,0,0,0,0),(26,48,0,0,0,0,0,0,0),(26,49,0,0,0,0,0,0,0),(26,50,2,0,0,0,0,0,0),(26,51,0,0,0,0,0,0,0),(26,52,0,0,0,0,0,0,0),(26,53,2,1,0,0,0,0,0),(26,194,0,1,0,0,0,0,0),(26,362,0,0,0,0,0,0,0),(26,364,0,0,0,0,0,0,0),(26,366,0,0,0,0,0,0,0),(26,368,0,0,0,0,0,0,0),(26,369,0,0,0,0,0,0,0),(26,374,1,0,0,0,0,0,0),(26,375,0,0,0,0,0,0,0),(26,379,0,0,2,0,0,0,0),(26,380,1,0,0,0,0,0,0),(26,382,0,0,0,0,0,0,0),(26,383,0,1,0,0,0,0,0),(26,384,0,0,0,0,0,0,0),(27,75,0,0,0,0,0,0,0),(27,77,0,0,0,0,0,0,0),(27,78,0,0,0,0,0,0,0),(27,79,0,0,0,0,0,0,0),(27,85,0,2,0,0,0,0,0),(27,90,2,0,0,0,0,0,0),(27,91,2,2,0,0,0,0,0),(27,92,1,2,0,0,0,0,0),(27,325,0,0,0,0,0,0,0),(27,326,0,0,0,0,0,0,0),(27,327,0,0,0,0,0,0,0),(27,330,0,0,0,0,0,0,0),(27,332,0,1,0,0,0,0,0),(27,333,0,0,1,0,0,0,0),(27,335,1,0,0,0,0,0,0),(27,337,0,0,0,0,0,0,0),(28,168,0,0,0,0,0,0,0),(28,170,0,0,0,0,0,0,0),(28,172,0,0,0,0,0,0,0),(28,178,0,0,0,0,0,0,0),(28,180,2,0,0,0,0,0,0),(28,181,0,0,0,0,0,0,0),(28,183,2,2,0,0,0,0,0),(28,185,0,1,0,0,0,0,0),(28,186,2,2,0,0,0,0,0),(28,187,0,2,0,0,0,0,0),(28,188,1,0,0,0,0,0,0),(28,193,5,0,0,0,0,0,0),(28,195,0,1,0,0,0,0,0),(28,197,0,0,0,0,0,0,0),(28,198,0,0,1,0,0,0,0),(28,202,0,0,0,0,0,0,0),(28,207,0,2,0,0,0,0,0),(28,216,1,0,0,0,0,0,0),(28,217,0,2,0,0,0,0,0),(28,229,1,0,0,0,0,0,0),(28,230,2,0,0,0,0,0,0),(29,95,0,0,0,0,0,0,0),(29,98,0,0,0,0,0,0,0),(29,100,0,0,0,0,0,0,0),(29,101,0,1,0,0,0,0,0),(29,104,0,0,0,0,0,0,0),(29,105,0,0,0,0,0,0,0),(29,106,2,1,0,0,0,0,0),(29,110,0,0,0,0,0,0,0),(29,112,0,0,0,0,0,0,0),(29,116,1,0,0,0,0,0,0),(29,118,0,0,0,0,0,0,0),(29,119,0,1,0,0,0,0,0),(29,122,0,0,0,0,0,0,0),(29,302,0,0,0,0,0,0,0),(29,304,0,0,0,0,0,0,0),(29,306,1,0,0,0,0,0,0),(29,307,0,0,0,0,0,0,0),(29,308,2,2,0,0,0,0,0),(29,309,0,0,0,0,0,0,0),(29,311,0,0,0,0,0,0,0),(29,313,0,1,0,0,0,0,0),(29,316,0,0,0,0,0,0,0),(29,317,0,0,0,0,0,0,0),(29,319,1,0,0,0,0,0,0),(30,145,0,0,0,0,0,0,0),(30,148,0,0,0,0,0,0,0),(30,149,0,0,0,0,0,0,0),(30,151,0,0,0,0,0,0,0),(30,154,2,0,0,0,0,0,0),(30,155,0,0,0,0,0,0,0),(30,156,0,0,0,0,0,0,0),(30,158,0,1,0,0,0,0,0),(30,161,0,0,0,0,0,0,0),(30,162,0,0,0,0,0,0,0),(30,163,0,0,0,0,0,0,0),(30,167,0,0,0,0,0,0,0),(30,260,0,0,0,0,0,0,0),(30,261,0,1,1,0,0,0,0),(30,263,0,0,1,0,0,0,0),(30,265,0,0,0,0,0,0,0),(30,267,0,0,0,0,0,0,0),(30,269,0,0,0,0,0,0,0),(30,270,0,0,0,0,0,0,0),(30,271,0,0,0,0,0,0,0),(30,272,0,0,0,0,0,0,0),(30,273,0,0,0,0,0,0,0),(30,275,0,0,0,0,0,0,0),(30,277,0,1,0,0,0,0,0),(30,280,3,0,0,0,0,0,0),(31,88,0,0,1,0,0,0,0),(31,124,0,0,0,0,0,0,0),(31,127,0,0,0,0,0,0,0),(31,128,0,0,0,0,0,0,0),(31,129,0,0,1,0,0,0,0),(31,130,0,0,0,0,0,0,0),(31,132,0,0,0,0,0,0,0),(31,134,0,0,0,0,0,0,0),(31,135,0,0,0,0,0,0,0),(31,136,1,0,0,0,0,0,0),(31,137,0,0,0,0,0,0,0),(31,138,0,0,0,0,0,0,0),(31,140,0,0,0,0,0,0,0),(31,142,0,1,0,0,0,0,0),(31,143,1,0,1,0,0,0,0),(31,144,0,0,0,0,0,0,0),(31,190,1,0,0,0,0,0,0),(31,283,0,0,0,0,0,0,0),(31,287,1,1,0,0,0,0,0),(31,289,0,0,0,0,0,0,0),(31,290,0,0,0,0,0,0,0),(31,293,0,0,0,0,0,0,0),(31,297,0,0,0,0,0,0,0),(31,299,0,0,0,0,0,0,0),(31,301,0,0,0,0,0,0,0),(32,3,0,0,0,0,0,0,0),(32,4,0,0,0,0,0,0,0),(32,10,0,0,1,0,0,0,0),(32,12,0,0,0,0,0,0,0),(32,13,0,0,0,0,0,0,0),(32,15,0,0,0,0,0,0,0),(32,16,0,0,0,0,0,0,0),(32,21,0,0,0,0,0,0,0),(32,23,0,0,0,0,0,0,0),(32,28,0,0,0,0,0,0,0),(32,56,0,0,0,0,0,0,0),(32,57,0,0,0,0,0,0,0),(32,59,0,0,1,0,0,0,0),(32,62,0,0,1,0,0,0,0),(32,64,0,0,1,0,0,0,0),(32,65,1,0,0,0,0,0,0),(32,66,0,0,0,0,0,0,0),(32,67,0,0,0,0,0,0,0),(32,69,0,0,0,0,0,0,0),(32,70,0,0,0,0,0,0,0),(32,72,0,0,0,0,0,0,0),(33,3,0,0,0,0,0,0,0),(33,6,0,0,0,0,0,0,0),(33,8,0,0,0,0,0,0,0),(33,10,0,0,0,0,0,0,0),(33,11,1,1,0,0,0,0,0),(33,12,0,2,0,0,0,0,0),(33,13,0,0,0,0,0,0,0),(33,14,0,0,0,0,0,0,0),(33,16,5,3,0,0,0,0,0),(33,17,2,1,0,0,0,0,0),(33,18,1,0,0,0,0,0,0),(33,25,0,0,0,0,0,0,0),(33,27,1,0,0,0,0,0,0),(33,28,1,1,0,0,0,0,0),(33,29,1,0,0,0,0,0,0),(33,30,0,1,0,0,0,0,0),(33,343,0,0,0,0,0,0,0),(33,345,0,0,0,0,0,0,0),(33,349,0,0,0,0,0,0,0),(33,350,0,0,0,0,0,0,0),(33,353,0,0,0,0,0,0,0),(33,354,1,0,0,0,0,0,0),(33,355,0,0,0,0,0,0,0),(33,356,0,0,0,0,0,0,0),(33,360,0,1,0,0,0,0,0),(33,361,0,0,0,0,0,0,0),(34,55,0,0,0,0,0,0,0),(34,56,0,0,0,0,0,0,0),(34,57,0,0,0,0,0,0,0),(34,58,0,0,0,0,0,0,0),(34,59,1,0,0,0,0,0,0),(34,60,0,0,0,0,0,0,0),(34,61,0,0,0,0,0,0,0),(34,62,0,0,0,0,0,0,0),(34,64,0,0,0,0,0,0,0),(34,65,0,1,0,0,0,0,0),(34,66,0,0,0,0,0,0,0),(34,67,0,0,0,0,0,0,0),(34,69,0,0,0,0,0,0,0),(34,71,0,0,0,0,0,0,0),(34,72,1,0,0,0,0,0,0),(34,88,1,0,0,0,0,0,0),(34,190,0,0,0,0,0,0,0),(34,283,0,0,0,0,0,0,0),(34,287,0,0,0,0,0,0,0),(34,289,0,0,0,0,0,0,0),(34,290,0,0,0,0,0,0,0),(34,293,0,0,0,0,0,0,0),(34,297,0,0,0,0,0,0,0),(34,298,0,0,0,0,0,0,0),(34,299,0,0,0,0,0,0,1),(34,301,0,1,0,0,0,0,0),(35,124,0,0,0,0,0,0,0),(35,126,0,0,0,0,0,0,0),(35,127,0,0,0,0,0,0,0),(35,129,0,0,1,0,0,0,0),(35,130,1,0,1,0,0,0,0),(35,131,0,1,0,0,0,0,0),(35,132,0,0,0,0,0,0,0),(35,135,0,0,0,0,0,0,0),(35,136,1,0,0,0,0,0,0),(35,137,0,0,1,0,0,0,0),(35,138,0,0,0,0,0,0,0),(35,140,0,1,0,0,0,0,0),(35,142,0,1,0,0,0,0,0),(35,143,1,0,0,0,0,0,0),(35,145,0,0,0,0,0,0,0),(35,148,0,0,0,0,0,0,0),(35,149,0,0,0,0,0,0,0),(35,151,0,0,0,0,0,0,0),(35,153,0,0,0,0,0,0,0),(35,154,1,0,0,0,1,0,0),(35,155,0,0,0,0,0,0,0),(35,157,0,0,0,0,0,0,0),(35,161,0,0,0,0,0,0,0),(35,162,0,1,0,0,0,0,0),(35,164,0,0,0,0,0,0,0),(35,167,0,0,0,0,0,0,0),(36,259,0,0,0,0,0,0,0),(36,261,0,0,0,0,0,0,0),(36,263,0,0,0,0,0,0,0),(36,264,0,0,0,0,0,0,0),(36,266,0,0,0,0,0,0,0),(36,267,0,0,0,0,0,0,0),(36,269,0,0,0,0,0,0,0),(36,270,0,0,0,0,0,0,0),(36,271,2,1,0,0,0,0,0),(36,272,0,0,0,0,0,0,0),(36,273,0,0,0,0,0,0,0),(36,274,1,0,0,0,0,0,0),(36,275,0,1,0,0,0,0,0),(36,277,1,0,0,0,0,0,0),(36,279,0,2,1,0,0,0,0),(36,302,0,0,0,0,0,0,0),(36,306,0,0,0,0,0,0,0),(36,308,0,0,0,0,0,0,0),(36,311,0,0,0,0,0,0,0),(36,313,0,0,0,0,0,0,0),(36,316,0,0,0,0,0,0,0),(36,317,0,0,0,0,0,0,0),(36,318,0,0,0,0,0,0,0),(36,319,0,0,0,0,0,0,0),(37,96,0,0,0,0,0,0,0),(37,97,0,0,0,0,0,0,0),(37,98,0,0,0,0,0,0,0),(37,100,0,0,0,0,0,0,0),(37,104,0,2,0,0,0,0,0),(37,106,2,1,1,0,0,0,0),(37,112,0,0,0,0,0,0,0),(37,116,0,1,0,0,0,0,0),(37,117,0,0,0,0,0,0,0),(37,118,0,1,0,0,0,0,0),(37,119,4,0,0,0,0,0,0),(37,122,0,0,0,0,0,0,0),(37,169,0,0,0,0,0,0,0),(37,170,0,1,0,0,0,0,0),(37,175,0,0,1,0,0,0,0),(37,176,0,0,0,0,0,0,0),(37,178,0,0,0,0,0,0,0),(37,180,2,0,0,0,0,0,0),(37,181,0,0,0,0,0,0,0),(37,185,0,0,0,0,0,0,0),(37,186,0,2,0,0,0,0,0),(37,187,0,0,0,0,0,0,0),(37,188,0,0,0,0,0,0,0),(37,193,3,0,0,0,0,0,0),(38,197,0,0,0,0,0,0,0),(38,199,0,0,1,0,0,0,0),(38,206,0,0,0,0,0,0,0),(38,207,0,0,0,0,0,0,0),(38,213,0,0,0,0,0,0,0),(38,214,0,0,0,0,0,0,0),(38,217,0,0,0,0,0,0,0),(38,226,0,0,0,0,0,0,0),(38,229,1,0,0,0,0,0,0),(38,230,0,1,0,0,0,0,0),(38,325,0,0,0,0,0,0,0),(38,326,0,1,0,0,0,0,0),(38,327,0,0,0,0,0,0,0),(38,328,0,1,0,0,0,0,0),(38,331,0,0,0,0,0,0,0),(38,332,0,1,0,0,0,0,0),(38,333,0,0,1,0,0,0,0),(38,335,2,0,0,0,0,0,0),(38,336,1,1,0,0,0,0,0),(38,337,0,0,0,0,0,0,0),(38,339,1,0,0,0,0,0,0),(39,32,0,0,0,0,0,0,0),(39,34,0,0,0,0,0,0,0),(39,35,0,0,1,0,0,0,0),(39,36,0,0,0,0,0,0,0),(39,38,0,0,0,0,0,0,0),(39,39,0,0,0,0,0,0,0),(39,40,0,1,0,0,0,0,0),(39,41,0,0,0,0,0,0,0),(39,43,0,0,0,0,0,0,0),(39,44,0,0,0,0,0,0,0),(39,45,0,0,0,0,0,0,0),(39,46,0,0,1,0,0,0,0),(39,47,1,0,0,0,0,0,0),(39,48,0,0,0,0,0,0,0),(39,49,0,0,0,0,0,0,0),(39,52,0,0,1,0,0,0,0),(39,53,0,0,0,0,0,0,0),(39,54,0,0,0,0,0,0,0),(39,75,0,0,0,0,0,0,0),(39,76,0,0,0,0,0,0,0),(39,77,0,0,0,0,0,0,0),(39,78,0,0,0,0,0,0,0),(39,79,0,0,1,0,0,0,0),(39,80,0,0,0,0,0,0,0),(39,81,0,0,0,0,0,0,0),(39,82,0,0,1,0,0,0,0),(39,84,0,0,0,0,0,0,0),(39,86,1,0,0,0,0,0,0),(39,87,0,0,0,0,0,0,0),(39,90,0,0,0,0,0,0,0),(39,91,0,1,0,0,0,0,0),(39,92,0,0,0,0,0,0,0),(39,94,0,0,0,0,0,0,0),(40,194,0,0,0,0,0,0,0),(40,232,0,0,0,0,0,0,0),(40,235,1,0,0,0,0,0,0),(40,236,0,0,0,0,0,0,0),(40,237,0,0,1,0,0,0,0),(40,239,0,0,0,0,0,0,0),(40,241,0,0,0,0,0,0,0),(40,243,0,0,1,0,0,0,0),(40,245,0,2,0,0,0,0,0),(40,247,0,0,0,0,0,0,0),(40,248,0,0,0,0,0,0,0),(40,250,0,0,0,0,0,0,0),(40,254,0,0,0,0,0,0,0),(40,255,1,0,0,0,0,0,0),(40,256,2,0,0,0,0,0,0),(40,362,0,0,0,0,0,0,0),(40,366,0,0,0,0,0,0,0),(40,368,0,0,0,0,0,0,0),(40,373,1,0,0,0,0,0,0),(40,375,0,1,0,0,0,0,0),(40,380,1,1,0,0,0,0,0),(40,381,0,0,0,0,0,0,0),(40,382,0,0,0,0,0,0,0),(40,383,0,0,0,0,0,0,0),(40,384,0,0,0,0,0,0,0),(41,194,0,0,0,0,0,0,0),(41,343,0,0,0,0,0,0,0),(41,344,0,0,0,0,0,0,0),(41,345,0,0,0,0,0,0,0),(41,349,1,0,0,0,0,0,0),(41,350,0,0,0,0,0,0,0),(41,351,0,0,0,0,0,0,0),(41,352,0,1,0,0,0,0,0),(41,353,0,0,0,0,0,0,0),(41,355,0,0,0,0,0,0,0),(41,356,0,0,0,0,0,0,0),(41,357,0,0,0,0,0,0,0),(41,358,1,1,0,0,0,0,0),(41,360,0,0,0,0,0,0,0),(41,361,0,0,0,0,0,0,0),(41,362,0,0,0,0,0,0,0),(41,366,0,0,0,0,0,0,0),(41,375,0,0,0,0,0,0,0),(41,378,0,0,0,0,0,0,0),(41,379,0,0,2,0,0,0,0),(41,380,0,1,0,0,0,0,0),(41,381,0,0,0,0,0,0,0),(41,382,0,0,0,0,0,0,0),(41,383,1,0,0,0,0,0,0),(41,384,0,0,0,0,0,0,0),(42,75,0,0,0,0,0,0,0),(42,77,0,0,0,0,0,0,0),(42,81,0,0,0,0,0,0,0),(42,85,0,2,0,0,0,0,0),(42,87,1,0,0,0,0,0,0),(42,90,1,0,0,0,0,0,0),(42,91,2,0,0,0,0,0,0),(42,93,1,1,0,0,0,0,0),(42,233,0,0,0,0,0,0,0),(42,236,0,0,0,0,0,0,0),(42,237,1,0,0,0,0,0,0),(42,245,0,0,0,0,0,0,0),(42,247,0,0,0,0,0,0,0),(42,248,0,0,0,0,0,0,0),(42,255,0,0,0,0,0,0,0),(42,256,0,1,0,0,0,0,0),(43,31,0,0,0,0,0,0,0),(43,34,0,0,0,0,0,0,0),(43,35,1,0,0,0,0,0,0),(43,36,0,1,0,0,0,0,0),(43,38,1,0,0,0,0,0,0),(43,39,0,0,0,0,0,0,0),(43,40,2,0,0,0,0,0,0),(43,42,1,1,0,0,0,0,0),(43,43,1,0,0,0,0,0,0),(43,44,1,1,0,0,0,0,0),(43,45,0,2,1,0,0,0,0),(43,47,0,0,0,0,0,0,0),(43,48,0,0,0,0,0,0,0),(43,52,2,0,0,0,0,0,0),(43,53,1,1,0,0,0,0,0),(43,54,0,3,0,0,0,0,0),(43,196,0,0,0,0,0,0,0),(43,204,0,0,0,0,0,0,0),(43,205,0,0,0,0,0,0,0),(43,211,0,0,0,0,0,0,0),(43,217,0,0,0,0,0,0,0),(43,219,0,0,0,0,0,0,0),(43,220,0,0,0,0,0,0,0),(43,221,0,0,0,0,0,0,0),(43,226,0,0,0,0,1,0,0),(43,228,0,0,0,0,0,0,0),(43,229,0,0,0,0,0,0,0),(43,230,0,0,0,0,0,0,0),(43,231,0,0,0,0,0,0,0),(44,95,0,0,0,0,0,0,0),(44,97,0,0,0,0,0,0,0),(44,98,0,0,0,0,0,0,0),(44,100,0,0,0,0,0,0,0),(44,101,0,0,0,0,0,0,0),(44,103,0,0,0,0,0,0,0),(44,104,0,0,0,0,0,0,0),(44,106,1,0,0,0,0,0,0),(44,110,1,0,0,0,0,0,0),(44,112,0,0,0,0,0,0,0),(44,116,1,0,0,0,0,0,0),(44,117,0,0,0,0,0,0,0),(44,118,0,1,0,0,0,0,0),(44,119,0,1,0,0,0,0,0),(44,325,0,0,0,0,0,0,0),(44,327,0,0,0,0,0,0,0),(44,328,2,0,0,0,0,0,0),(44,331,0,0,0,0,0,0,0),(44,332,0,0,1,0,0,0,0),(44,333,0,0,0,0,0,0,0),(44,335,0,2,0,0,0,0,0),(44,336,0,0,0,0,0,0,0),(44,337,0,0,0,0,0,0,0),(44,339,0,0,0,0,0,0,0),(45,168,0,0,0,0,0,0,0),(45,170,0,0,1,0,0,0,0),(45,176,0,0,0,0,0,0,0),(45,178,0,0,0,0,0,0,0),(45,180,1,5,0,0,0,0,0),(45,181,1,0,0,0,0,0,0),(45,186,0,1,0,0,0,0,0),(45,187,0,2,0,0,0,0,0),(45,188,0,0,0,0,0,0,0),(45,193,6,0,0,0,0,0,0),(45,195,0,0,0,0,0,0,0),(45,259,0,0,0,0,0,0,0),(45,261,0,0,0,0,0,0,0),(45,262,0,0,0,0,0,0,0),(45,263,0,0,0,0,0,0,0),(45,264,0,0,0,0,0,0,0),(45,267,0,0,0,0,0,0,0),(45,269,0,1,0,0,0,0,0),(45,270,0,0,0,0,0,0,0),(45,271,0,1,0,0,0,0,0),(45,272,0,0,0,0,0,0,0),(45,274,0,1,0,0,0,0,0),(45,275,0,1,0,0,0,0,0),(45,276,1,0,0,0,0,0,0),(45,277,3,0,0,0,0,0,0),(45,279,1,0,0,0,0,0,0),(45,281,0,0,0,0,0,0,0),(46,124,0,0,0,0,0,0,0),(46,125,0,0,0,0,0,0,0),(46,126,1,1,1,0,0,0,0),(46,127,0,0,0,0,0,0,0),(46,128,0,0,0,0,0,0,0),(46,129,0,0,0,0,0,0,0),(46,130,0,0,0,0,0,0,0),(46,131,0,0,0,0,0,0,0),(46,132,0,0,0,0,0,0,0),(46,135,0,0,0,0,0,0,0),(46,136,0,0,0,0,0,0,0),(46,137,1,0,0,0,0,0,0),(46,138,0,0,0,0,0,0,0),(46,140,0,0,0,0,0,0,0),(46,141,0,0,0,0,0,0,0),(46,142,0,0,0,0,0,0,0),(46,143,1,0,0,0,0,0,0),(46,302,0,0,1,0,0,0,0),(46,304,0,0,0,0,0,0,0),(46,306,0,1,0,0,0,0,0),(46,307,0,0,0,0,0,0,0),(46,309,0,0,0,0,0,0,0),(46,316,0,0,0,0,0,0,0),(46,317,0,0,0,0,0,0,0),(46,319,0,0,0,0,0,0,0),(46,321,0,0,0,0,0,0,0),(46,322,1,0,0,0,0,0,0),(47,56,0,0,0,0,0,0,0),(47,57,0,0,0,0,0,0,0),(47,58,0,0,0,0,0,0,0),(47,59,0,0,0,0,0,0,0),(47,62,0,1,0,0,0,0,0),(47,64,1,0,0,0,0,0,0),(47,65,0,0,0,0,0,0,0),(47,66,0,0,0,0,0,0,0),(47,67,0,0,0,0,0,0,0),(47,69,0,0,0,0,0,0,0),(47,70,0,0,0,0,0,0,0),(47,72,1,1,0,0,0,0,0),(47,145,0,0,0,0,0,0,0),(47,147,0,0,0,0,0,0,0),(47,148,0,0,0,0,0,0,0),(47,149,0,0,0,0,0,0,0),(47,151,0,0,0,0,0,0,0),(47,152,0,0,0,0,0,0,0),(47,154,0,0,0,0,0,0,0),(47,155,0,0,0,0,0,0,0),(47,156,0,0,0,0,0,0,0),(47,157,1,0,0,0,0,0,0),(47,158,0,0,0,0,0,0,0),(47,161,0,0,0,0,0,0,0),(47,163,0,0,0,0,0,0,0),(47,167,0,0,0,0,0,0,0),(48,3,0,0,0,0,0,0,0),(48,7,0,0,0,0,0,0,0),(48,10,0,0,0,0,0,0,0),(48,12,3,0,0,0,0,0,0),(48,13,1,0,0,0,0,0,0),(48,16,0,1,0,0,0,0,0),(48,17,0,0,0,0,0,0,0),(48,27,0,0,0,0,0,0,0),(48,88,1,0,0,0,0,0,0),(48,190,0,2,0,0,0,0,0),(48,283,0,0,0,0,0,0,0),(48,287,0,0,0,0,0,0,0),(48,289,0,0,1,0,0,0,0),(48,290,1,0,0,0,0,0,0),(48,297,0,0,0,0,0,0,0),(48,301,0,0,0,0,0,0,0),(49,88,0,0,0,0,0,0,0),(49,190,1,0,0,0,0,0,0),(49,282,0,0,0,0,0,0,0),(49,287,0,0,0,0,0,0,0),(49,289,0,0,0,0,0,0,0),(49,290,0,0,0,0,0,0,0),(49,294,0,0,0,0,0,0,0),(49,297,0,0,0,0,0,0,0),(49,298,0,0,0,0,0,0,0),(49,299,0,1,0,0,0,0,0),(49,300,1,0,0,0,0,0,0),(49,301,0,0,0,0,0,0,0),(49,343,0,0,0,0,0,0,0),(49,344,0,0,0,0,0,0,0),(49,345,0,0,0,0,0,0,0),(49,346,0,0,0,0,0,0,0),(49,349,0,0,0,0,0,0,0),(49,350,0,0,0,0,0,0,0),(49,351,0,0,1,0,0,0,0),(49,352,0,0,1,0,0,0,0),(49,355,0,0,1,0,0,0,0),(49,357,0,0,0,0,0,0,0),(49,358,0,0,0,0,0,0,0),(49,359,0,0,0,0,0,0,0),(49,360,0,0,0,0,0,0,0),(49,361,0,0,0,0,0,0,0),(50,3,0,0,1,0,0,0,0),(50,6,0,0,0,0,0,0,0),(50,7,0,0,0,0,0,0,0),(50,8,0,0,0,0,0,0,0),(50,10,0,0,0,0,0,0,0),(50,11,0,0,0,0,0,0,0),(50,12,0,1,0,0,0,0,0),(50,16,0,1,0,0,0,0,0),(50,17,1,0,0,0,0,0,0),(50,19,0,0,0,0,0,0,0),(50,25,0,0,0,0,0,0,0),(50,27,0,0,0,0,0,0,0),(50,29,1,0,0,0,0,0,0),(50,30,0,0,0,0,0,0,0),(50,145,0,0,0,0,0,0,0),(50,148,0,0,0,0,0,0,0),(50,149,0,0,0,0,0,0,0),(50,150,1,0,0,0,0,0,0),(50,151,0,0,0,0,0,0,0),(50,152,0,0,0,0,0,0,0),(50,154,0,1,0,0,0,0,0),(50,155,0,0,1,0,0,0,0),(50,156,0,1,0,0,0,0,0),(50,158,0,0,0,0,0,0,0),(50,161,0,0,0,0,0,0,0),(50,162,0,0,0,0,0,0,0),(50,166,1,0,0,0,0,0,0),(50,167,0,0,0,0,0,0,0),(51,55,0,0,0,0,0,0,0),(51,56,0,0,0,0,0,0,0),(51,57,1,2,0,0,0,0,0),(51,58,0,0,0,0,0,0,0),(51,59,0,0,1,0,1,0,0),(51,60,0,0,0,0,0,0,0),(51,61,0,0,0,0,0,0,0),(51,62,0,0,0,0,0,0,0),(51,65,2,0,0,0,0,0,0),(51,66,0,0,0,0,0,0,0),(51,68,0,1,1,0,0,0,0),(51,69,0,0,0,0,0,0,0),(51,70,1,0,0,0,0,0,0),(51,71,0,0,0,0,0,0,0),(51,72,0,1,0,0,0,0,0),(51,302,0,0,0,0,0,0,0),(51,304,1,0,0,0,0,0,0),(51,306,0,0,0,0,0,0,0),(51,307,0,0,0,0,0,0,0),(51,311,0,1,1,0,0,0,0),(51,316,0,0,0,0,0,0,0),(51,317,1,1,0,0,0,0,0),(51,319,1,0,0,0,0,0,0),(51,320,0,0,0,0,0,0,0),(52,124,0,0,0,0,0,0,0),(52,126,0,0,0,0,0,0,0),(52,127,1,0,0,0,0,0,0),(52,128,0,0,0,0,0,0,0),(52,129,0,0,1,0,0,0,0),(52,130,0,0,0,0,0,0,0),(52,131,0,0,1,0,0,0,0),(52,132,1,0,0,0,0,0,0),(52,135,0,0,0,0,0,0,0),(52,136,0,2,1,0,0,0,0),(52,137,0,1,0,0,0,0,0),(52,140,1,0,0,0,0,0,0),(52,142,1,0,0,0,0,0,0),(52,168,0,0,0,0,0,0,0),(52,170,0,0,0,0,0,0,0),(52,175,1,0,0,0,0,0,0),(52,176,0,0,0,0,0,0,0),(52,178,0,0,0,0,0,0,0),(52,180,1,1,0,0,0,0,0),(52,181,0,0,0,0,0,0,0),(52,182,0,0,0,0,0,0,0),(52,185,0,1,0,0,0,0,0),(52,186,0,1,0,0,0,0,0),(52,188,0,0,0,0,0,0,0),(52,193,1,0,0,0,0,0,0),(53,194,0,0,0,0,0,0,0),(53,259,0,0,0,0,0,0,0),(53,261,0,0,0,0,0,0,0),(53,263,0,0,0,0,0,0,0),(53,264,0,0,0,0,0,0,0),(53,265,0,1,0,0,0,0,0),(53,267,0,0,0,0,0,0,0),(53,269,0,0,0,0,0,0,0),(53,270,0,0,0,0,0,0,0),(53,271,1,0,0,0,0,0,0),(53,273,0,0,0,0,0,0,0),(53,275,2,0,0,0,0,0,0),(53,276,0,0,0,0,0,0,0),(53,277,0,1,0,0,0,0,0),(53,280,1,1,0,0,0,0,0),(53,325,0,0,0,0,0,0,0),(53,327,0,0,0,0,0,0,0),(53,328,0,0,0,0,0,0,0),(53,329,0,0,0,0,0,0,0),(53,330,0,0,0,0,0,0,0),(53,331,0,0,0,0,0,0,0),(53,332,0,0,0,0,0,0,0),(53,334,0,0,0,0,0,0,0),(53,335,0,0,0,0,0,0,0),(53,336,0,0,0,0,0,0,0),(53,337,0,0,0,0,0,0,0),(53,338,0,0,0,0,0,0,0),(53,339,0,0,0,0,0,0,0),(54,32,0,0,0,0,0,0,0),(54,34,0,0,0,0,0,0,0),(54,35,1,0,0,0,0,0,0),(54,36,0,0,0,0,0,0,0),(54,39,0,0,0,0,0,0,0),(54,40,0,0,0,0,0,0,0),(54,41,0,1,0,0,0,0,0),(54,42,0,0,0,0,0,0,0),(54,43,0,0,0,0,0,0,0),(54,44,1,0,0,0,0,0,0),(54,45,0,0,0,0,0,0,0),(54,46,0,0,0,0,0,0,0),(54,47,0,1,0,0,0,0,0),(54,48,0,0,0,0,0,0,0),(54,49,0,0,0,0,0,0,0),(54,50,0,0,0,0,0,0,0),(54,52,0,0,0,0,0,0,0),(54,53,0,0,0,0,0,0,0),(54,54,0,0,0,0,0,0,0),(54,95,0,0,0,0,0,0,0),(54,96,0,0,0,0,0,0,0),(54,97,0,0,0,0,0,0,0),(54,100,0,0,0,0,0,0,0),(54,103,0,0,0,0,0,0,0),(54,104,0,0,0,0,0,0,0),(54,106,0,0,0,0,0,0,0),(54,110,0,0,0,0,0,0,0),(54,112,0,0,0,0,0,0,0),(54,114,0,0,0,0,0,0,0),(54,116,0,0,0,0,0,0,0),(54,117,0,0,0,0,0,0,0),(54,118,0,0,0,0,0,0,0),(54,119,0,0,0,0,0,0,0),(54,121,0,0,0,0,0,0,0),(55,197,0,0,0,0,0,0,0),(55,199,0,0,0,0,0,0,0),(55,202,0,0,0,0,0,0,0),(55,207,0,0,0,0,0,0,1),(55,208,0,0,0,0,0,0,0),(55,209,0,0,0,0,0,0,0),(55,212,0,1,0,0,0,0,0),(55,217,1,1,0,0,0,0,0),(55,226,0,0,0,0,0,0,0),(55,227,2,0,0,0,0,0,0),(55,229,0,0,0,0,0,0,0),(55,230,0,0,0,0,0,0,0),(55,233,0,0,0,0,0,0,0),(55,236,0,0,1,0,0,0,0),(55,237,1,0,0,0,0,0,0),(55,241,0,0,0,0,0,0,0),(55,244,1,0,1,0,0,0,0),(55,245,0,1,0,0,0,0,0),(55,247,0,0,0,0,0,0,0),(55,248,0,0,0,0,0,0,0),(55,249,0,1,1,0,0,0,0),(55,250,0,0,0,0,0,0,0),(55,252,0,0,0,0,0,0,0),(55,254,0,0,0,0,0,0,0),(55,255,0,0,0,0,0,0,0),(55,256,1,0,0,0,0,0,0),(55,258,0,0,0,0,0,0,0),(56,74,0,0,0,0,0,0,0),(56,75,0,0,0,0,0,0,0),(56,76,0,0,0,0,0,0,0),(56,78,0,0,0,0,0,0,0),(56,79,0,0,0,0,0,0,0),(56,80,0,0,0,0,0,0,0),(56,81,0,0,0,0,0,0,0),(56,82,0,0,0,0,0,0,0),(56,84,0,0,0,0,0,0,0),(56,85,0,0,0,0,0,0,0),(56,86,0,0,0,0,0,0,0),(56,87,0,0,0,0,0,0,0),(56,89,0,0,0,0,0,0,0),(56,91,3,1,0,0,0,0,0),(56,92,0,0,0,0,0,0,0),(56,93,1,0,0,0,0,0,0),(56,94,2,1,0,0,0,0,0),(56,363,0,0,0,0,0,0,0),(56,368,0,0,0,0,0,0,0),(56,369,0,0,0,0,0,0,0),(56,372,0,0,0,0,0,0,0),(56,373,0,0,0,0,0,0,0),(56,378,0,0,0,0,0,0,0),(56,380,0,1,0,0,0,0,0),(56,381,1,0,0,0,0,0,0),(56,384,0,0,0,0,0,0,0),(57,73,0,0,0,0,0,0,0),(57,75,0,0,0,0,0,0,0),(57,76,0,1,0,0,1,0,0),(57,77,0,0,0,0,0,0,0),(57,78,0,0,0,0,0,0,0),(57,79,0,1,0,0,0,0,0),(57,81,0,0,0,0,0,0,0),(57,82,0,0,0,0,0,0,0),(57,84,0,0,0,0,0,0,0),(57,85,0,0,0,0,0,0,0),(57,86,1,1,0,0,0,0,0),(57,87,0,0,0,0,0,0,0),(57,89,0,0,0,0,0,0,0),(57,90,1,0,0,0,0,0,0),(57,91,2,1,0,0,0,0,0),(57,92,1,1,0,0,0,0,0),(57,94,0,0,0,0,0,0,0),(57,343,0,0,0,0,0,0,0),(57,344,0,0,0,0,0,0,0),(57,345,0,1,0,0,0,0,0),(57,346,0,0,0,0,0,0,0),(57,347,0,0,0,0,0,0,0),(57,349,0,0,0,0,0,0,0),(57,350,1,0,0,0,0,0,0),(57,352,0,0,1,0,0,0,0),(57,353,1,0,0,0,0,0,0),(57,357,0,0,0,0,0,0,0),(57,359,0,0,0,0,0,0,0),(57,360,0,0,0,0,0,0,0),(57,361,0,0,0,0,0,0,0),(58,197,0,0,0,0,0,0,0),(58,199,0,0,0,0,0,0,0),(58,202,0,0,0,0,0,0,0),(58,207,0,0,0,0,0,0,0),(58,213,0,0,0,0,0,0,0),(58,215,0,0,0,0,0,0,0),(58,217,0,1,0,0,0,0,0),(58,218,0,0,0,0,0,0,0),(58,224,0,0,0,0,0,0,0),(58,226,1,0,0,0,0,0,0),(58,227,0,0,0,0,0,0,0),(58,229,0,0,0,0,0,0,0),(58,230,1,0,1,0,0,0,0),(58,362,0,0,0,0,0,0,0),(58,366,0,0,1,0,0,0,0),(58,373,0,0,0,0,0,0,0),(58,375,0,0,0,0,0,0,0),(58,376,0,0,0,0,0,0,0),(58,379,0,0,0,0,0,0,0),(58,382,0,0,0,0,0,0,0),(58,383,0,0,0,0,0,0,0),(58,384,0,0,0,0,0,0,0),(58,385,0,0,0,0,0,0,0),(59,95,0,0,0,0,0,0,0),(59,97,0,0,0,0,0,0,0),(59,98,0,0,0,0,0,0,0),(59,101,0,0,0,0,0,0,0),(59,103,0,1,0,0,0,0,0),(59,104,0,0,0,0,0,0,0),(59,106,0,1,0,0,0,0,0),(59,110,0,0,0,0,0,0,0),(59,111,0,0,0,0,0,0,0),(59,112,0,0,0,0,0,0,0),(59,114,0,0,0,0,0,0,0),(59,116,1,1,0,0,0,0,0),(59,117,0,0,0,0,0,0,0),(59,118,1,0,0,0,0,0,0),(59,119,2,0,0,0,0,0,0),(59,121,0,0,0,0,0,0,0),(59,232,0,0,0,0,0,0,0),(59,234,0,0,0,0,0,0,0),(59,235,0,0,0,0,0,0,0),(59,236,0,0,0,0,0,0,0),(59,237,1,0,0,0,0,0,0),(59,239,0,0,0,0,0,0,0),(59,241,0,0,0,0,0,0,0),(59,243,0,0,0,0,0,0,0),(59,244,1,1,1,0,0,0,0),(59,245,0,0,0,0,0,0,0),(59,247,0,0,0,0,0,0,0),(59,248,1,0,0,0,0,0,0),(59,249,0,0,1,0,0,0,0),(59,255,0,0,0,0,0,0,0),(59,256,0,0,0,0,0,0,0),(60,31,0,0,0,0,0,0,0),(60,34,0,0,0,0,0,0,0),(60,35,1,0,0,0,0,0,0),(60,36,0,0,0,0,0,0,0),(60,38,0,1,0,0,0,0,0),(60,39,0,1,0,0,0,0,0),(60,40,2,0,0,0,0,0,0),(60,41,0,2,0,0,0,0,0),(60,43,0,0,0,0,0,0,0),(60,44,1,0,0,0,0,0,0),(60,45,0,0,0,0,0,0,0),(60,46,1,0,0,0,0,0,0),(60,47,0,2,0,0,0,0,0),(60,48,0,0,0,0,0,0,0),(60,49,0,0,0,0,0,0,0),(60,50,1,0,0,0,0,0,0),(60,52,1,0,0,0,0,0,0),(60,53,0,2,0,0,0,0,0),(60,54,2,0,0,0,0,0,0),(60,260,0,0,0,0,0,0,0),(60,261,0,0,0,0,0,0,0),(60,263,0,0,0,0,0,0,0),(60,264,0,0,0,0,0,0,0),(60,266,0,0,0,0,0,0,0),(60,267,0,0,0,0,0,0,0),(60,269,0,0,0,0,0,0,0),(60,270,0,0,0,0,0,0,0),(60,272,0,0,0,0,0,0,0),(60,274,0,0,0,0,0,0,0),(60,275,0,0,0,0,0,0,0),(60,276,0,0,0,0,0,0,0),(60,277,0,1,0,0,0,0,0),(60,279,1,0,0,0,0,0,0),(61,125,0,0,0,0,0,0,0),(61,126,0,0,0,0,0,0,0),(61,127,0,0,0,0,0,0,0),(61,130,0,0,0,0,0,0,0),(61,131,0,0,0,0,0,0,0),(61,132,0,0,0,0,0,0,0),(61,135,0,1,0,0,0,0,0),(61,136,1,0,0,0,0,0,0),(61,137,0,0,0,0,0,0,0),(61,138,0,0,0,0,0,0,0),(61,140,0,0,0,0,0,0,0),(61,142,0,0,0,0,0,0,0),(61,143,0,0,0,0,0,0,0),(61,144,0,0,0,0,0,0,0),(61,194,1,0,0,0,0,0,0),(61,325,0,0,0,0,0,0,0),(61,326,0,0,0,0,0,0,0),(61,328,0,0,0,0,0,0,0),(61,330,2,0,0,0,0,0,0),(61,331,0,0,0,0,0,0,0),(61,332,0,0,0,0,0,0,0),(61,334,0,1,0,0,0,0,0),(61,336,2,0,0,0,0,0,0),(61,337,0,0,0,0,0,0,0),(61,338,0,1,1,0,0,0,0),(61,339,0,1,0,0,0,0,0),(62,56,0,0,0,0,0,0,0),(62,57,0,0,0,0,0,0,0),(62,58,0,0,0,0,0,0,0),(62,59,0,0,0,0,0,0,0),(62,60,0,0,0,0,0,0,0),(62,62,0,0,0,0,0,0,0),(62,64,1,0,0,0,0,0,0),(62,65,0,1,0,0,0,0,0),(62,66,1,1,0,0,0,0,0),(62,67,0,0,0,0,0,0,0),(62,69,0,0,0,0,0,0,0),(62,71,0,1,0,0,0,0,0),(62,72,1,0,0,0,0,0,0),(62,169,0,0,0,0,0,0,0),(62,170,0,0,0,0,0,0,0),(62,175,0,0,0,0,0,0,0),(62,176,0,0,0,0,0,0,0),(62,180,0,0,0,0,0,0,0),(62,182,0,0,0,0,0,0,0),(62,183,0,0,0,0,0,0,0),(62,185,0,0,0,0,0,0,0),(62,186,0,0,0,0,0,0,0),(62,187,0,0,0,0,0,0,0),(62,189,0,0,0,0,0,0,0),(62,191,0,0,0,0,0,0,0),(63,3,0,0,1,0,0,0,0),(63,4,0,0,0,0,0,0,0),(63,6,1,0,0,0,0,0,0),(63,7,0,0,0,0,0,0,0),(63,8,0,0,0,0,0,0,0),(63,10,1,1,0,0,0,0,0),(63,12,0,1,0,0,0,0,0),(63,13,0,1,0,0,0,0,0),(63,16,1,0,0,0,0,0,0),(63,17,0,0,0,0,0,0,0),(63,23,1,0,1,0,0,0,0),(63,25,0,0,0,0,0,0,0),(63,27,0,0,0,0,0,0,0),(63,28,1,1,0,0,0,0,0),(63,29,0,0,0,0,0,0,0),(63,30,0,0,0,0,0,0,0),(63,302,0,0,0,0,0,0,0),(63,306,0,0,0,0,0,0,0),(63,307,0,0,0,0,0,0,0),(63,309,0,0,0,0,0,0,0),(63,311,0,0,0,0,0,0,0),(63,316,0,0,0,0,0,0,0),(63,319,0,1,0,0,0,0,0),(63,320,0,1,0,0,0,0,0),(63,324,2,0,0,0,0,0,0),(64,88,0,0,0,0,0,0,0),(64,145,0,1,0,0,0,0,0),(64,148,0,1,0,0,0,0,0),(64,149,0,0,0,0,0,0,0),(64,151,0,0,0,0,0,0,0),(64,152,1,0,0,0,0,0,0),(64,154,0,0,0,0,0,0,0),(64,155,0,0,0,0,0,0,0),(64,156,0,0,0,0,0,0,0),(64,158,0,1,0,0,0,0,0),(64,159,0,0,0,0,0,0,0),(64,161,2,0,0,0,0,0,0),(64,162,0,0,0,0,0,0,0),(64,166,1,0,0,0,0,0,0),(64,167,0,0,0,0,0,0,0),(64,190,0,1,0,0,0,0,0),(64,282,0,0,0,0,0,0,0),(64,287,0,0,0,0,0,0,0),(64,289,0,0,0,0,0,0,0),(64,290,0,0,0,0,0,0,0),(64,293,0,0,0,0,0,0,0),(64,297,0,0,0,0,0,0,0),(64,298,2,0,0,0,0,0,0),(64,300,0,0,0,0,0,0,0),(64,301,0,1,0,0,0,0,0),(65,145,0,0,0,0,0,0,0),(65,148,0,0,0,0,0,0,0),(65,149,0,0,0,0,0,0,0),(65,151,0,1,0,0,0,0,0),(65,154,0,1,0,0,0,0,0),(65,155,0,0,0,0,0,0,0),(65,156,0,1,0,0,0,0,0),(65,158,1,1,0,0,0,0,0),(65,159,0,2,0,0,0,0,0),(65,161,0,0,0,0,0,0,0),(65,163,3,0,0,0,0,0,0),(65,166,2,0,0,0,0,0,0),(65,167,1,0,0,0,0,0,0),(65,343,0,0,0,0,0,0,0),(65,344,2,0,0,0,0,0,0),(65,346,0,0,0,0,0,0,0),(65,349,0,0,0,0,0,0,0),(65,350,0,0,0,0,0,0,0),(65,351,0,1,1,0,0,0,0),(65,352,0,1,0,0,0,0,0),(65,353,0,0,0,0,0,0,0),(65,355,0,0,0,0,0,0,0),(65,358,0,0,0,0,0,0,0),(65,359,0,0,0,0,0,0,0),(65,360,0,0,0,0,0,0,0),(66,88,0,2,0,0,0,0,0),(66,190,1,0,0,0,0,0,0),(66,282,0,0,0,0,0,0,0),(66,287,0,0,0,0,0,0,0),(66,289,0,0,0,0,0,0,0),(66,290,0,0,0,0,0,0,0),(66,293,2,0,1,0,0,0,0),(66,297,0,0,0,0,0,0,0),(66,299,0,0,0,0,0,0,0),(66,301,0,0,0,0,0,0,0),(66,302,0,0,0,0,0,0,0),(66,304,0,0,0,0,0,0,0),(66,307,0,0,0,0,0,0,0),(66,309,0,0,0,0,0,0,0),(66,311,0,0,0,0,0,0,0),(66,316,0,1,0,0,0,0,0),(66,319,1,0,0,0,0,0,0),(66,320,0,0,0,0,0,0,0),(66,324,0,0,1,0,0,0,0),(67,3,0,0,0,0,0,0,0),(67,4,0,1,0,0,0,0,0),(67,6,0,0,0,0,0,0,0),(67,7,0,0,0,0,0,0,0),(67,10,0,0,0,0,0,0,0),(67,11,0,0,0,0,0,0,0),(67,12,0,0,0,0,0,0,0),(67,13,0,1,0,0,0,0,0),(67,14,0,0,0,0,0,0,0),(67,16,1,0,0,0,0,0,0),(67,17,2,0,0,0,0,0,0),(67,18,0,0,0,0,0,0,0),(67,19,0,0,0,0,0,0,0),(67,23,0,0,0,0,0,0,0),(67,25,0,0,0,0,0,0,0),(67,28,0,0,0,0,0,0,0),(67,30,1,0,0,0,0,0,0),(67,169,0,0,0,0,0,0,0),(67,170,0,0,0,0,0,0,0),(67,174,0,0,0,0,0,0,1),(67,176,0,0,0,0,0,0,0),(67,178,0,1,0,0,0,0,0),(67,181,0,0,0,0,0,0,0),(67,182,0,1,0,0,0,0,0),(67,183,1,0,0,0,0,0,0),(67,187,0,0,0,0,0,0,0),(67,188,0,0,0,0,0,0,0),(67,189,0,0,0,0,0,0,0),(67,193,1,0,0,0,0,0,0),(69,32,0,0,0,0,0,0,0),(69,36,1,0,0,0,0,0,0),(69,38,0,0,0,0,0,0,0),(69,39,0,1,0,0,0,0,0),(69,40,0,0,0,0,0,0,0),(69,41,0,0,0,0,0,0,0),(69,42,0,0,0,0,0,0,0),(69,43,0,0,0,0,0,0,0),(69,44,0,0,0,0,0,0,0),(69,46,0,0,0,0,0,0,0),(69,47,0,0,0,0,0,0,0),(69,49,0,0,0,0,0,0,0),(69,50,0,0,0,0,0,0,0),(69,52,0,0,0,0,0,0,0),(69,53,0,0,0,0,0,0,0),(69,54,0,0,0,0,0,0,0),(69,124,0,0,0,0,0,0,0),(69,126,0,0,0,0,0,0,0),(69,127,0,0,0,0,0,0,0),(69,129,0,0,0,0,0,0,0),(69,131,0,0,0,0,0,0,0),(69,132,0,0,0,0,0,0,0),(69,135,0,0,0,0,0,0,0),(69,136,0,0,0,0,0,0,0),(69,137,0,0,0,0,0,0,0),(69,138,0,0,0,0,0,0,0),(69,140,0,0,0,0,0,0,0),(69,141,0,0,1,0,0,1,0),(69,142,0,0,0,0,0,0,0),(69,143,0,0,0,0,0,0,0),(69,144,0,0,0,0,0,0,0),(70,232,0,0,0,0,0,0,0),(70,234,0,0,0,0,0,0,0),(70,235,0,0,0,0,0,0,0),(70,236,0,1,0,0,0,0,0),(70,237,0,0,1,0,0,0,0),(70,238,0,1,0,0,0,0,0),(70,241,0,0,0,0,0,0,0),(70,243,0,0,0,0,0,0,0),(70,244,1,0,1,0,0,0,0),(70,245,0,0,0,0,0,0,0),(70,248,0,0,0,0,0,0,0),(70,250,0,0,0,0,0,0,0),(70,252,1,0,0,0,0,0,0),(70,256,1,0,0,0,0,0,0),(70,258,0,0,0,0,0,0,0),(70,259,0,0,0,0,0,0,0),(70,261,0,0,1,0,0,0,0),(70,267,0,0,0,0,0,0,0),(70,269,0,0,0,0,0,0,0),(70,270,0,1,0,0,0,0,0),(70,272,0,0,0,0,0,0,0),(70,274,0,0,0,0,0,0,0),(70,275,0,0,0,0,0,0,0),(70,276,1,1,0,0,0,0,0),(70,278,0,0,0,0,0,0,0),(70,279,1,0,0,0,0,0,0),(71,95,0,0,0,0,0,0,0),(71,96,0,0,0,0,0,0,0),(71,98,0,0,0,0,0,0,0),(71,101,0,0,0,0,0,0,0),(71,104,0,1,1,0,0,0,0),(71,106,2,0,0,0,0,0,0),(71,111,1,2,0,0,0,0,0),(71,112,1,0,0,0,0,0,0),(71,116,2,0,0,0,0,0,0),(71,117,0,0,0,0,0,0,0),(71,118,0,1,0,0,0,0,0),(71,119,2,2,0,0,0,0,0),(71,121,2,2,0,0,0,0,0),(71,363,0,0,0,0,0,0,0),(71,366,0,0,0,0,0,0,0),(71,370,0,0,0,0,0,0,0),(71,375,0,1,1,0,0,0,0),(71,376,1,0,0,0,0,0,0),(71,379,0,0,0,0,0,0,0),(71,380,0,2,0,0,0,0,0),(71,382,0,0,0,0,0,0,1),(71,383,0,0,0,0,0,0,0),(71,384,2,0,0,0,0,0,0),(72,73,0,0,0,0,0,0,0),(72,75,0,0,0,0,0,0,0),(72,76,1,0,0,0,0,0,0),(72,78,0,0,0,0,0,0,0),(72,79,0,0,0,0,0,0,0),(72,80,0,0,0,0,0,0,0),(72,81,0,0,0,0,0,0,0),(72,82,0,0,0,0,0,0,0),(72,84,0,0,0,0,0,0,0),(72,85,0,1,0,0,0,0,0),(72,86,0,2,0,0,0,0,0),(72,87,2,1,0,0,0,0,0),(72,89,0,2,0,0,0,0,0),(72,90,1,0,0,0,1,0,0),(72,91,1,0,0,0,0,0,0),(72,92,1,0,0,0,0,0,0),(72,94,2,1,0,0,0,0,0),(72,197,0,0,0,0,0,0,0),(72,199,0,0,0,0,0,0,0),(72,208,0,0,0,0,0,0,0),(72,212,0,0,1,0,0,0,0),(72,214,0,1,0,0,0,0,0),(72,217,0,0,0,0,0,0,0),(72,218,0,0,0,0,0,0,0),(72,226,0,0,0,0,0,0,0),(72,230,1,0,2,0,0,0,0),(73,197,0,0,0,0,0,0,0),(73,198,0,0,0,0,0,0,0),(73,206,0,0,0,0,0,0,0),(73,207,1,0,0,0,0,0,0),(73,211,0,0,0,0,0,0,0),(73,212,0,0,0,0,0,0,0),(73,213,0,1,0,0,0,0,0),(73,217,1,0,0,0,0,0,0),(73,224,1,0,0,0,0,0,0),(73,226,1,0,1,0,0,0,0),(73,227,0,2,0,0,0,0,0),(73,229,0,0,0,0,0,0,0),(73,343,0,0,0,0,0,0,0),(73,344,0,1,0,0,0,0,0),(73,352,0,0,0,0,0,0,0),(73,353,0,0,0,0,0,0,0),(73,355,0,0,0,0,0,0,0),(73,357,1,0,0,0,0,0,0),(73,358,0,0,0,0,0,0,0),(73,359,1,1,0,0,0,0,0),(73,360,0,0,0,0,0,0,0),(73,361,1,0,0,0,0,0,0),(74,75,0,0,0,0,0,0,0),(74,76,0,0,0,0,0,0,0),(74,78,0,0,0,0,0,0,0),(74,79,0,0,0,0,0,0,0),(74,80,0,0,0,0,0,0,0),(74,81,1,0,0,0,0,0,0),(74,82,0,0,0,0,0,0,0),(74,84,0,0,0,0,0,0,0),(74,85,0,2,1,0,0,0,0),(74,86,0,0,0,0,0,0,0),(74,87,0,0,0,0,0,0,0),(74,89,0,0,0,0,0,0,0),(74,90,2,0,0,0,0,0,0),(74,91,0,1,0,0,0,0,0),(74,92,0,0,0,0,0,0,0),(74,94,0,0,0,0,0,0,0),(74,95,0,1,0,0,0,0,0),(74,100,0,0,0,0,0,0,0),(74,101,0,0,0,0,0,0,0),(74,104,0,0,0,0,0,0,0),(74,106,1,0,0,0,0,0,0),(74,112,0,0,0,0,0,0,0),(74,115,0,2,0,0,0,0,0),(74,116,0,0,0,0,0,0,0),(74,117,0,0,0,0,0,0,0),(74,118,1,0,0,0,0,0,0),(74,119,1,0,0,0,0,0,0),(74,121,0,0,0,0,0,0,0),(75,260,0,0,0,0,0,0,0),(75,261,0,0,0,0,0,0,0),(75,265,0,0,0,0,0,0,0),(75,266,0,0,0,0,0,0,0),(75,267,0,0,0,0,0,0,0),(75,269,0,0,0,0,0,0,0),(75,270,0,0,0,0,0,0,0),(75,271,0,0,0,0,0,0,0),(75,274,0,0,0,0,0,0,0),(75,276,0,0,1,0,0,0,0),(75,278,0,0,0,0,0,0,0),(75,279,1,0,0,0,0,0,0),(75,280,0,1,0,0,0,0,0),(75,281,0,0,0,0,0,0,0),(75,362,0,0,0,0,0,0,0),(75,366,0,0,1,0,0,0,0),(75,368,0,0,0,0,0,0,0),(75,369,0,0,0,0,0,0,0),(75,375,0,0,0,0,0,0,0),(75,376,0,1,0,0,0,0,0),(75,377,0,0,0,0,0,0,0),(75,379,0,0,0,0,0,0,0),(75,380,1,0,0,0,0,0,0),(75,383,1,0,1,0,0,0,0),(75,384,0,1,0,0,0,0,0),(76,124,0,0,0,0,0,0,0),(76,126,0,0,0,0,0,0,0),(76,127,0,0,0,0,0,0,0),(76,128,0,0,0,0,0,0,0),(76,129,0,0,0,0,0,0,0),(76,131,1,0,1,0,0,0,1),(76,132,1,0,0,0,0,0,0),(76,135,0,0,0,0,0,0,0),(76,136,0,0,0,0,0,0,0),(76,137,1,0,1,0,0,0,0),(76,138,0,0,0,0,0,0,0),(76,140,0,0,0,0,0,0,0),(76,142,0,0,0,0,0,0,0),(76,143,0,0,0,0,0,0,0),(76,144,0,1,0,0,0,0,0),(76,179,0,0,0,0,0,0,0),(76,232,0,0,0,0,0,0,0),(76,235,0,0,0,0,0,0,0),(76,236,0,0,0,0,0,0,0),(76,237,0,0,0,0,0,0,0),(76,238,0,0,0,0,0,0,0),(76,241,0,0,0,0,0,0,0),(76,243,0,0,1,0,0,0,0),(76,244,0,0,1,0,0,0,0),(76,245,0,0,0,0,0,0,0),(76,247,0,0,0,0,0,0,0),(76,248,0,0,0,0,0,0,0),(76,249,0,0,0,0,0,0,0),(76,250,0,0,0,0,0,0,0),(76,252,0,0,0,0,0,0,0),(76,255,0,0,0,0,0,0,0),(76,256,0,0,0,0,0,0,0),(76,258,0,0,0,0,0,0,0),(77,31,0,0,0,0,0,0,0),(77,35,0,0,1,0,0,0,0),(77,38,0,0,0,0,0,0,0),(77,39,0,0,0,0,0,0,0),(77,40,0,0,0,0,0,0,0),(77,41,0,0,0,0,0,0,0),(77,42,0,0,0,0,0,0,0),(77,43,0,0,0,0,0,0,0),(77,44,0,0,0,0,0,0,0),(77,45,0,0,0,0,0,0,0),(77,46,0,1,0,0,0,0,0),(77,47,0,0,0,0,0,0,0),(77,50,0,0,0,0,0,0,0),(77,52,1,0,0,0,0,0,0),(77,53,0,0,0,0,0,0,0),(77,56,0,0,0,0,0,0,0),(77,57,0,0,0,0,0,0,0),(77,58,0,0,0,0,0,0,0),(77,59,0,0,1,0,0,0,0),(77,62,0,0,0,0,0,0,0),(77,64,0,0,0,0,0,0,0),(77,65,0,0,0,0,0,0,0),(77,66,0,0,0,0,0,0,0),(77,67,0,0,0,0,0,0,0),(77,69,0,0,0,0,0,0,0),(77,70,0,0,0,0,0,0,0),(77,71,0,0,0,0,0,0,0),(78,3,0,0,0,0,0,0,0),(78,4,1,0,0,0,0,0,0),(78,6,0,0,0,0,0,0,0),(78,7,0,0,0,0,0,0,0),(78,10,0,0,0,0,0,0,0),(78,11,0,0,0,0,0,0,0),(78,12,0,0,0,0,0,0,0),(78,13,0,0,0,0,0,0,0),(78,14,0,0,0,0,0,0,0),(78,16,3,1,0,0,0,0,0),(78,17,0,1,0,0,0,0,0),(78,19,0,1,0,0,0,0,0),(78,23,0,1,1,0,0,0,0),(78,26,0,0,0,0,0,0,0),(78,28,1,1,0,0,0,0,0),(78,30,1,0,0,0,0,0,0),(78,194,0,1,0,0,0,0,0),(78,325,0,0,0,0,0,0,0),(78,328,0,0,0,0,0,0,0),(78,330,0,0,1,0,0,0,0),(78,332,0,0,0,0,0,0,0),(78,334,0,0,0,0,0,0,0),(78,335,1,0,0,0,0,0,0),(78,336,1,0,0,0,0,0,0),(78,338,0,1,0,0,0,0,0),(78,339,0,0,0,0,0,0,0),(79,88,0,1,0,0,0,0,0),(79,168,0,0,0,0,0,0,0),(79,174,0,0,0,0,0,0,0),(79,176,0,0,0,0,0,0,0),(79,178,0,0,0,0,0,0,0),(79,180,1,0,0,0,0,0,0),(79,181,0,0,0,0,0,0,0),(79,182,0,0,0,0,0,0,0),(79,183,0,0,0,0,0,0,0),(79,185,1,0,0,0,0,0,0),(79,186,0,0,0,0,0,0,0),(79,187,0,0,0,0,0,0,0),(79,188,0,0,0,0,0,0,0),(79,189,0,0,0,0,0,0,0),(79,190,0,1,0,0,0,0,0),(79,191,0,0,0,0,0,0,0),(79,193,0,0,0,0,0,0,0),(79,282,0,0,0,0,0,0,0),(79,287,0,0,0,0,0,0,0),(79,289,0,0,0,0,0,0,0),(79,290,0,0,0,0,0,0,0),(79,294,0,0,0,0,0,0,0),(79,295,0,0,1,0,0,0,0),(79,297,1,0,0,0,0,0,0),(79,298,0,0,0,0,0,0,0),(79,300,1,0,0,0,0,0,0),(79,301,0,0,0,0,0,0,0),(80,146,0,0,0,0,0,0,0),(80,148,0,0,0,0,0,0,0),(80,149,0,0,0,0,0,0,0),(80,151,0,0,1,0,0,0,0),(80,152,0,0,0,0,0,0,0),(80,154,1,1,0,0,0,0,0),(80,156,0,0,0,0,0,0,0),(80,158,0,0,0,0,0,0,0),(80,161,1,2,0,0,0,0,0),(80,162,0,0,0,0,0,0,0),(80,163,0,0,0,0,0,0,0),(80,166,1,0,0,0,0,0,0),(80,167,0,0,0,0,0,0,0),(80,302,0,0,0,0,0,0,0),(80,304,0,0,0,0,0,0,0),(80,306,0,0,0,0,0,0,0),(80,307,0,0,0,0,0,0,0),(80,309,0,0,0,0,0,0,0),(80,311,0,0,0,0,0,0,0),(80,316,0,0,0,0,0,0,0),(80,317,0,0,0,0,0,0,0),(80,318,0,0,0,0,0,0,0),(80,319,3,0,0,0,0,0,0),(80,324,0,3,0,0,0,0,0),(81,179,0,0,0,0,0,0,0),(81,302,0,0,0,0,0,0,0),(81,306,1,0,0,0,0,0,0),(81,307,0,0,0,0,0,0,0),(81,309,0,1,0,0,0,0,0),(81,311,0,0,1,0,0,0,0),(81,316,0,0,0,0,0,0,0),(81,317,0,0,0,0,0,0,0),(81,319,0,0,0,0,0,0,0),(81,343,0,0,0,0,0,0,0),(81,344,0,0,0,0,0,0,0),(81,345,0,0,0,0,0,0,0),(81,349,0,0,0,0,0,0,0),(81,350,2,0,0,0,0,0,0),(81,352,0,2,0,0,0,0,0),(81,353,0,0,0,0,0,0,0),(81,355,0,0,0,0,0,0,0),(81,356,0,0,0,0,0,0,0),(81,358,0,0,0,0,0,0,0),(81,359,0,0,1,0,0,0,0),(81,361,0,0,0,0,0,0,0),(82,146,0,0,0,0,0,0,0),(82,147,0,0,0,0,0,0,0),(82,148,0,0,0,0,0,0,0),(82,149,0,0,0,0,0,0,0),(82,152,0,0,0,0,0,0,0),(82,154,0,0,0,0,0,0,0),(82,155,0,0,0,0,0,0,0),(82,156,0,0,0,0,0,0,0),(82,158,0,0,0,0,0,0,0),(82,159,1,0,1,0,0,0,0),(82,161,0,0,0,0,0,0,0),(82,163,1,0,0,0,0,0,0),(82,166,1,0,0,0,0,0,0),(82,167,0,1,0,0,0,0,0),(82,168,0,0,0,0,0,0,0),(82,176,0,0,0,0,0,0,0),(82,178,0,0,0,0,0,0,0),(82,181,0,0,0,0,0,0,0),(82,182,0,0,0,0,0,0,0),(82,183,1,0,0,0,0,0,0),(82,186,0,0,0,0,0,0,0),(82,187,0,1,0,0,0,0,0),(82,189,0,0,0,0,0,0,0),(82,193,1,0,0,0,0,0,0),(83,88,1,1,1,0,0,0,0),(83,190,0,0,0,0,0,0,0),(83,282,0,0,0,0,0,0,0),(83,287,0,0,0,0,0,0,0),(83,289,0,0,0,0,0,0,0),(83,290,2,0,0,0,0,0,0),(83,293,0,0,0,0,0,0,0),(83,297,0,0,0,0,0,0,0),(83,298,1,0,0,0,0,0,0),(83,300,0,0,0,0,0,0,0),(83,301,0,2,0,0,0,0,0),(83,325,0,0,0,0,0,0,0),(83,327,0,0,0,0,0,0,0),(83,328,0,0,0,0,0,0,0),(83,330,0,0,1,0,0,0,0),(83,332,0,0,0,0,0,0,0),(83,334,0,1,0,0,0,0,0),(83,335,0,0,0,0,0,0,0),(83,336,2,0,1,0,1,0,0),(83,339,0,0,0,0,0,0,0),(83,341,1,0,0,0,0,0,0),(84,3,0,1,0,0,0,0,0),(84,4,1,0,0,0,0,0,0),(84,6,0,0,0,0,0,0,0),(84,7,0,0,0,0,0,0,0),(84,10,0,0,0,0,0,0,0),(84,12,0,1,0,0,0,0,0),(84,13,0,0,0,0,0,0,0),(84,16,0,0,0,0,0,0,0),(84,17,0,0,0,0,0,0,0),(84,18,0,0,0,0,0,0,0),(84,22,0,0,1,0,0,0,0),(84,23,0,0,0,0,0,0,0),(84,28,0,0,1,0,0,0,0),(84,29,1,0,0,0,0,0,0),(84,32,0,0,0,0,0,0,0),(84,35,1,0,0,0,0,0,0),(84,36,0,0,0,0,0,0,0),(84,38,0,1,0,0,0,0,0),(84,39,0,1,0,0,0,0,0),(84,40,0,0,0,0,0,0,0),(84,41,0,0,0,0,0,0,0),(84,44,0,0,0,0,0,0,0),(84,47,0,0,1,0,0,0,0),(84,50,0,0,0,0,1,0,0),(84,52,1,0,0,0,0,0,0),(84,53,0,0,0,0,0,0,0),(84,54,0,0,0,0,0,0,0),(85,56,0,0,0,0,0,0,0),(85,58,0,1,0,0,0,0,0),(85,59,0,0,0,0,0,0,0),(85,60,0,0,0,0,0,0,0),(85,62,0,0,0,0,0,0,0),(85,64,1,0,0,0,0,0,0),(85,65,2,0,0,0,0,0,0),(85,66,0,0,0,0,0,0,0),(85,68,0,1,0,0,0,0,0),(85,69,0,0,0,0,0,0,0),(85,70,1,0,0,0,0,0,0),(85,71,0,1,0,0,0,0,0),(85,179,0,0,0,0,0,0,0),(85,232,0,0,0,0,0,0,0),(85,234,0,0,0,0,0,0,0),(85,235,1,0,0,0,0,0,0),(85,236,0,0,0,0,0,0,1),(85,237,0,0,0,0,0,0,0),(85,238,0,0,0,0,0,0,0),(85,243,0,0,1,0,0,0,0),(85,248,0,0,0,0,0,0,0),(85,249,0,0,0,0,0,0,0),(85,250,0,0,0,0,0,0,0),(85,253,0,1,0,0,0,0,0),(85,255,0,0,0,0,0,0,0),(85,258,0,0,0,0,0,0,0),(86,124,0,1,0,0,0,0,0),(86,126,0,0,0,0,0,0,0),(86,127,0,0,0,0,0,0,0),(86,129,0,1,0,0,0,0,0),(86,130,0,1,0,0,0,0,0),(86,131,0,0,0,0,0,0,0),(86,132,0,0,0,0,0,0,0),(86,134,0,0,0,0,0,0,0),(86,135,0,0,0,0,0,0,0),(86,136,4,1,0,0,0,0,0),(86,137,1,0,0,0,0,0,0),(86,138,0,0,0,0,0,0,0),(86,141,0,0,0,0,0,0,0),(86,142,0,1,0,0,0,0,0),(86,143,1,1,0,0,0,0,0),(86,144,0,0,0,0,0,0,0),(86,362,0,0,0,0,0,0,0),(86,366,0,0,0,0,0,0,0),(86,368,0,0,0,0,0,0,0),(86,373,1,0,0,0,0,0,1),(86,375,0,0,0,0,0,0,0),(86,376,2,0,0,0,0,0,0),(86,379,0,0,0,0,0,0,0),(86,380,0,0,0,0,0,0,0),(86,383,0,0,0,0,0,0,0),(86,384,0,1,0,0,0,0,0),(86,385,0,0,0,0,0,0,0),(87,73,0,0,0,0,0,0,0),(87,76,0,0,0,0,0,0,0),(87,78,0,0,0,0,0,0,0),(87,79,0,0,0,0,0,0,0),(87,80,0,0,0,0,0,0,0),(87,81,0,1,1,0,0,0,0),(87,82,1,0,0,0,0,0,0),(87,84,0,0,0,0,0,0,0),(87,85,0,1,1,0,0,1,0),(87,86,1,1,0,0,0,0,0),(87,87,0,0,0,0,0,0,0),(87,89,1,0,0,0,0,0,0),(87,91,0,0,0,0,0,0,0),(87,92,1,0,0,0,0,0,0),(87,94,0,1,0,0,0,0,0),(87,259,0,0,0,0,0,0,0),(87,261,1,0,0,0,0,0,1),(87,263,0,0,0,0,0,0,0),(87,266,0,0,0,0,0,0,0),(87,267,0,1,0,0,0,0,0),(87,269,1,0,0,0,0,0,0),(87,270,1,0,0,0,0,0,0),(87,274,0,0,0,0,0,0,0),(87,276,0,0,0,0,0,0,0),(87,277,0,0,1,0,0,0,0),(87,278,1,0,0,0,0,0,0),(87,279,0,0,1,0,0,0,0),(88,95,0,0,0,0,0,0,0),(88,98,0,0,0,0,0,0,0),(88,100,0,0,0,0,0,0,0),(88,101,0,0,0,0,0,0,0),(88,104,0,1,0,0,0,0,0),(88,106,0,0,0,0,0,0,0),(88,112,0,0,0,0,0,0,0),(88,113,1,1,0,0,0,0,0),(88,115,3,0,0,0,0,0,0),(88,116,0,0,0,0,0,0,0),(88,117,0,0,0,0,0,0,0),(88,119,0,1,0,0,0,0,0),(88,121,1,2,0,0,0,0,0),(88,197,0,0,0,0,0,0,0),(88,198,0,0,0,0,0,0,0),(88,206,0,0,0,0,0,0,0),(88,207,0,0,0,0,0,0,0),(88,208,0,0,0,0,0,0,0),(88,212,0,0,0,0,0,0,0),(88,213,0,0,0,0,0,0,0),(88,214,0,0,0,0,0,0,0),(88,217,1,0,0,0,0,0,0),(88,226,0,1,0,0,0,0,0),(88,227,0,0,0,0,0,0,0),(88,229,0,0,0,0,0,0,0),(89,95,0,0,0,0,0,0,0),(89,98,0,1,0,0,0,0,0),(89,100,0,0,0,0,0,0,0),(89,101,0,0,0,0,0,0,0),(89,103,0,0,0,0,0,0,0),(89,104,0,0,0,0,0,0,0),(89,106,0,0,0,0,0,0,0),(89,111,0,1,0,0,0,0,0),(89,112,0,0,0,0,0,0,0),(89,113,1,0,0,0,0,0,0),(89,115,2,0,0,0,0,0,0),(89,117,0,0,0,0,0,0,0),(89,118,1,0,0,0,0,0,0),(89,119,2,1,0,0,0,0,0),(89,121,0,1,0,0,0,0,0),(89,343,0,0,0,0,0,0,0),(89,344,0,0,0,0,0,0,0),(89,345,0,0,1,0,0,0,0),(89,346,0,0,0,0,0,0,0),(89,349,1,0,0,0,0,0,0),(89,353,0,0,0,0,0,0,0),(89,355,2,0,0,0,0,0,0),(89,357,0,0,0,0,0,0,0),(89,358,0,1,0,0,0,0,0),(89,359,0,1,0,0,0,0,0),(89,360,0,1,0,0,0,0,0),(90,197,0,0,0,0,0,0,0),(90,198,0,0,0,0,0,0,0),(90,206,0,0,0,0,0,0,0),(90,208,1,0,0,0,0,0,0),(90,214,1,1,0,0,0,0,0),(90,217,0,0,0,0,0,0,0),(90,221,0,0,0,0,0,0,0),(90,226,0,0,0,0,0,0,0),(90,227,1,0,0,0,0,0,0),(90,229,0,0,0,0,0,0,0),(90,259,0,0,0,0,0,0,0),(90,261,0,0,0,0,0,0,0),(90,263,0,0,0,0,0,0,0),(90,267,0,0,0,0,0,0,0),(90,269,0,0,0,0,0,0,0),(90,271,0,0,0,0,0,0,0),(90,272,0,1,0,0,0,0,0),(90,274,0,0,0,0,0,0,0),(90,276,0,0,0,0,0,0,0),(90,277,3,0,0,0,0,0,0),(90,278,0,0,0,0,0,0,0),(90,279,1,0,0,0,0,0,0),(91,75,0,0,0,0,0,0,0),(91,76,0,0,0,0,0,0,0),(91,78,0,0,0,0,0,0,0),(91,79,0,0,0,0,0,0,0),(91,80,0,0,0,0,0,0,0),(91,81,0,1,0,0,0,0,0),(91,83,1,0,0,0,0,0,0),(91,86,0,0,0,0,0,0,0),(91,87,1,0,0,0,0,0,0),(91,89,0,0,0,0,0,0,0),(91,91,0,0,1,0,0,0,0),(91,92,0,0,0,0,0,0,0),(91,93,0,0,0,0,0,0,0),(91,94,0,0,0,0,0,0,0),(91,124,0,0,0,0,0,0,0),(91,126,0,0,0,0,0,0,0),(91,127,0,0,0,0,0,0,0),(91,129,0,0,0,0,0,0,0),(91,131,0,0,0,0,0,0,0),(91,132,0,0,0,0,0,0,0),(91,135,0,0,0,0,0,0,0),(91,136,1,0,0,0,0,0,0),(91,137,0,0,0,0,0,0,0),(91,142,0,0,0,0,0,0,0),(91,143,0,0,0,0,0,0,0),(92,55,0,0,0,0,0,0,0),(92,56,0,0,0,0,0,0,0),(92,57,0,0,0,0,0,0,0),(92,58,0,0,0,0,0,0,0),(92,60,0,2,0,0,0,0,0),(92,62,0,0,0,0,0,0,0),(92,64,3,0,0,0,0,0,0),(92,65,2,0,0,0,0,0,0),(92,66,2,1,0,0,0,0,0),(92,68,0,2,0,0,0,0,0),(92,69,0,0,0,0,0,0,0),(92,71,0,0,0,0,0,0,0),(92,72,0,0,0,0,0,0,0),(92,362,0,0,0,0,0,0,0),(92,366,0,0,0,0,0,0,0),(92,368,0,0,0,0,0,0,0),(92,369,0,0,0,0,0,0,0),(92,370,1,0,0,0,0,0,0),(92,373,0,0,0,0,0,0,0),(92,375,0,0,0,0,0,0,0),(92,376,0,0,0,0,0,0,0),(92,377,0,0,0,0,0,0,0),(92,379,0,0,0,0,0,0,0),(92,380,0,0,0,0,0,0,0),(92,382,0,0,0,0,0,0,0),(92,384,0,0,0,0,0,0,0),(92,385,0,0,0,0,0,0,0),(93,3,0,0,0,0,0,0,0),(93,5,0,0,0,0,0,0,0),(93,7,0,0,0,0,0,0,0),(93,10,2,0,0,0,0,0,0),(93,12,1,0,0,0,0,0,0),(93,13,1,0,0,0,0,0,0),(93,15,0,1,0,0,0,0,0),(93,16,0,0,0,0,0,0,0),(93,18,0,0,0,0,0,0,0),(93,21,1,0,0,0,0,0,0),(93,23,0,1,1,0,0,0,0),(93,28,0,1,0,0,0,0,0),(93,29,0,1,0,0,0,0,0),(93,30,0,0,0,0,0,0,0),(93,233,0,0,0,0,0,0,0),(93,234,0,0,1,0,0,0,0),(93,235,0,1,0,0,0,0,0),(93,236,0,0,0,0,0,0,0),(93,237,0,0,0,0,0,0,0),(93,238,0,0,0,0,0,0,0),(93,239,0,0,0,0,0,0,0),(93,241,0,0,0,0,0,0,0),(93,243,0,0,0,0,0,0,0),(93,244,2,0,0,0,0,0,0),(93,248,0,0,0,0,0,0,0),(93,249,0,1,0,0,0,0,0),(93,254,0,0,0,0,0,0,0),(93,258,0,0,0,0,0,0,0),(94,32,0,0,0,0,0,0,0),(94,35,0,0,0,0,0,0,0),(94,36,0,1,0,0,0,0,0),(94,39,1,0,0,0,0,0,0),(94,40,0,0,0,0,0,0,0),(94,42,0,1,0,0,0,0,0),(94,43,0,0,0,0,0,0,0),(94,44,1,0,0,0,0,0,0),(94,45,0,0,0,0,0,0,0),(94,46,1,0,0,0,0,0,0),(94,47,0,0,0,0,0,0,0),(94,48,0,0,0,0,0,0,0),(94,50,1,1,0,0,0,0,0),(94,53,0,0,0,0,0,0,0),(94,54,0,1,0,0,0,0,0),(94,88,0,1,0,0,0,0,0),(94,190,0,0,0,0,0,0,0),(94,282,0,0,0,0,0,0,0),(94,286,0,0,0,0,0,0,0),(94,287,0,0,0,0,0,0,0),(94,289,0,0,0,0,0,0,0),(94,290,1,0,0,0,0,0,0),(94,293,0,0,0,0,0,0,0),(94,295,0,0,0,0,0,0,0),(94,297,0,0,0,0,0,0,0),(94,298,0,0,0,0,0,0,0),(94,301,0,0,0,0,0,0,0),(96,168,0,0,0,0,0,0,0),(96,169,0,0,0,0,0,0,0),(96,176,0,0,0,0,0,0,0),(96,180,0,0,0,0,0,0,0),(96,181,0,0,0,0,0,0,0),(96,183,1,0,0,0,0,0,0),(96,185,0,0,0,0,0,0,0),(96,186,1,0,0,0,0,0,0),(96,187,0,2,0,0,0,0,0),(96,189,0,0,1,0,0,1,0),(96,302,0,0,0,0,0,0,0),(96,304,0,0,0,0,0,0,0),(96,306,0,0,1,0,0,0,0),(96,307,0,0,0,0,0,0,0),(96,309,1,1,1,0,0,0,0),(96,311,0,0,0,0,0,0,0),(96,316,1,0,0,0,0,0,0),(96,319,2,0,0,0,0,0,0),(96,320,1,2,0,0,0,0,0),(96,324,3,0,0,0,0,0,0),(97,168,0,0,0,0,0,0,0),(97,176,0,0,0,0,0,0,0),(97,177,0,2,0,0,0,0,0),(97,178,0,0,0,0,0,0,0),(97,180,0,0,0,0,0,0,0),(97,182,0,0,0,0,0,0,0),(97,186,0,0,0,0,0,0,0),(97,187,0,1,0,0,0,0,0),(97,189,1,0,0,0,0,0,0),(97,190,0,0,0,0,0,0,0),(97,192,2,0,0,0,0,0,0),(97,194,0,0,0,0,0,0,0),(97,342,0,0,0,0,0,0,0),(97,345,0,0,0,0,0,0,0),(97,349,0,0,0,0,0,0,0),(97,350,0,0,0,0,0,0,0),(97,351,0,0,0,0,0,0,0),(97,352,0,0,0,0,0,0,0),(97,353,0,0,0,0,0,0,0),(97,355,0,0,0,0,0,0,0),(97,358,0,0,0,0,0,0,0),(97,359,0,0,0,0,0,0,0),(97,360,0,0,0,0,0,0,0),(97,361,0,0,0,0,0,0,0),(99,31,0,0,0,0,0,0,0),(99,35,0,0,0,0,0,0,0),(99,36,0,0,0,0,0,0,0),(99,38,0,0,0,0,0,0,0),(99,39,1,1,1,0,0,0,0),(99,40,1,0,0,0,0,0,0),(99,42,0,1,0,0,0,0,0),(99,43,0,0,1,0,0,1,0),(99,44,0,0,0,0,0,0,0),(99,45,0,0,0,0,0,0,0),(99,46,0,0,0,0,0,0,0),(99,47,0,0,0,0,0,0,0),(99,48,0,0,0,0,0,0,0),(99,49,0,0,0,0,0,0,0),(99,53,0,0,0,0,0,0,0),(99,54,0,0,0,0,0,0,0),(99,146,0,0,1,0,0,0,0),(99,147,0,0,0,0,0,0,0),(99,148,0,0,0,0,0,0,0),(99,149,0,0,0,0,0,0,0),(99,150,0,0,0,0,0,0,0),(99,151,0,0,0,0,0,0,0),(99,152,0,0,0,0,0,0,0),(99,154,0,0,0,0,0,0,0),(99,155,0,0,0,0,0,0,0),(99,156,0,0,0,0,0,0,0),(99,158,0,1,0,0,0,0,0),(99,159,1,0,0,0,0,0,0),(99,161,0,0,0,0,0,0,0),(99,163,1,1,0,0,0,0,0),(99,166,0,0,0,0,0,0,0),(99,167,0,0,0,0,0,0,0),(100,232,0,0,0,0,0,0,0),(100,234,0,1,0,0,0,0,0),(100,235,0,0,0,0,0,0,0),(100,236,0,0,0,0,0,0,0),(100,238,0,0,1,0,0,0,0),(100,240,0,0,0,0,0,0,0),(100,241,0,0,0,0,0,0,0),(100,242,0,0,0,0,0,0,0),(100,243,0,0,0,0,0,0,0),(100,244,0,1,1,0,0,0,0),(100,246,2,0,0,0,0,0,0),(100,248,0,0,0,0,0,0,0),(100,249,1,1,0,0,0,0,0),(100,252,0,0,0,0,0,0,0),(100,253,1,1,0,0,0,0,0),(100,255,1,0,0,0,0,0,0),(100,258,0,0,0,0,0,0,0),(100,283,0,0,0,0,0,0,0),(100,286,0,0,0,0,0,0,0),(100,287,0,1,0,0,0,0,0),(100,289,1,0,0,0,0,0,0),(100,290,0,0,0,0,0,0,0),(100,293,0,0,0,0,0,0,0),(100,296,0,1,0,0,0,0,0),(100,297,0,0,0,0,0,0,0),(100,298,0,0,0,0,0,0,0),(100,301,1,0,1,0,0,0,0),(101,3,0,0,0,0,0,0,0),(101,4,0,1,0,0,0,0,0),(101,5,0,0,0,0,0,0,0),(101,6,0,0,0,0,0,0,0),(101,8,0,0,0,0,0,0,0),(101,11,0,0,0,0,0,0,0),(101,12,0,2,0,0,0,0,0),(101,13,1,0,0,0,0,0,0),(101,16,2,2,0,0,0,0,0),(101,18,0,0,0,0,0,0,0),(101,21,1,1,0,0,0,0,0),(101,25,0,0,0,0,0,0,0),(101,26,0,0,0,0,0,0,0),(101,29,3,1,0,0,0,0,0),(101,30,1,0,0,0,0,0,0),(101,363,0,0,0,0,0,0,0),(101,364,0,0,0,0,0,0,1),(101,366,0,0,0,0,0,0,0),(101,368,0,0,0,0,0,0,0),(101,369,0,0,0,0,0,0,0),(101,370,0,1,0,0,0,0,0),(101,376,1,0,0,0,0,0,0),(101,377,0,0,0,0,0,0,0),(101,379,0,0,0,0,0,0,0),(101,380,1,0,0,0,0,0,0),(101,382,0,0,0,0,0,0,0),(101,383,0,0,0,0,0,0,0),(102,56,0,0,0,0,0,0,0),(102,57,0,0,0,0,0,0,0),(102,58,0,0,0,0,0,0,0),(102,59,0,0,1,0,0,0,0),(102,62,0,0,0,0,0,0,0),(102,64,0,0,0,0,0,0,0),(102,65,0,0,0,0,0,0,0),(102,66,0,0,0,0,0,0,0),(102,67,0,0,1,0,0,0,0),(102,69,0,1,0,0,0,0,0),(102,70,2,0,0,0,0,0,0),(102,75,0,0,0,0,0,0,0),(102,76,0,0,0,0,0,0,0),(102,78,0,0,0,0,0,0,0),(102,79,0,0,0,0,0,0,0),(102,80,0,0,0,0,0,0,0),(102,81,0,0,0,0,0,0,0),(102,85,0,1,0,0,0,0,0),(102,86,0,0,0,0,0,0,0),(102,87,1,0,0,0,0,0,0),(102,88,0,0,0,0,0,0,0),(102,89,0,1,1,0,0,0,0),(102,91,2,0,0,0,0,0,0),(102,92,0,0,0,0,0,0,0),(102,93,0,0,0,0,0,0,0),(103,124,0,0,0,0,0,0,0),(103,126,0,0,0,0,0,0,0),(103,127,0,0,0,0,0,0,0),(103,129,0,0,0,0,0,0,0),(103,130,0,0,0,0,0,0,0),(103,131,0,0,0,0,0,0,0),(103,132,1,0,0,0,0,0,0),(103,135,0,0,0,0,0,0,0),(103,136,2,2,0,0,0,0,0),(103,137,2,0,0,0,0,0,0),(103,138,1,0,0,0,0,0,0),(103,142,0,1,1,0,0,0,0),(103,143,0,1,0,0,0,0,0),(103,196,0,0,0,0,0,0,0),(103,198,0,0,0,0,0,0,0),(103,214,0,0,0,0,0,0,0),(103,217,0,2,0,0,0,0,0),(103,222,0,0,0,0,0,0,0),(103,226,0,0,0,0,0,0,0),(103,227,1,1,0,0,0,0,0),(103,229,0,0,1,0,0,0,0),(103,230,1,0,0,0,0,0,0),(103,231,1,0,0,0,0,0,0),(104,95,0,0,0,0,0,0,0),(104,100,0,0,0,0,0,0,0),(104,101,0,0,0,0,0,0,0),(104,102,0,1,0,0,0,0,0),(104,104,0,1,0,0,0,0,0),(104,106,2,1,0,0,0,0,0),(104,110,1,1,0,0,0,0,0),(104,115,2,0,0,0,0,0,0),(104,116,1,2,0,0,0,0,0),(104,117,0,1,0,0,0,0,0),(104,118,0,0,0,0,0,0,0),(104,119,2,1,0,0,0,0,0),(104,121,1,0,0,0,0,0,0),(104,123,1,1,0,0,0,0,0),(104,260,0,0,0,0,0,0,0),(104,261,0,0,0,0,0,0,0),(104,267,0,0,0,0,0,0,1),(104,269,0,0,0,0,0,0,0),(104,272,0,0,0,0,0,0,0),(104,274,0,0,0,0,0,0,0),(104,276,0,0,0,0,0,0,0),(104,277,1,0,0,0,1,0,0),(104,278,0,1,0,0,0,0,0),(104,279,0,0,0,0,0,0,0),(104,280,1,0,0,0,0,0,0),(105,259,0,0,0,0,0,0,0),(105,261,0,0,0,0,0,0,0),(105,263,1,0,0,0,0,0,0),(105,267,0,0,0,0,0,0,0),(105,270,0,0,0,0,0,0,0),(105,272,0,1,0,0,0,0,0),(105,274,0,0,0,0,0,0,0),(105,276,1,0,0,0,0,0,0),(105,277,0,0,0,0,0,0,0),(105,278,0,0,0,0,0,0,0),(105,279,1,0,0,0,0,0,0),(105,343,0,0,0,0,0,0,0),(105,344,1,0,0,0,0,0,0),(105,346,0,0,0,0,0,0,0),(105,347,0,0,0,0,0,0,0),(105,350,0,0,0,0,0,0,0),(105,351,0,0,0,0,0,0,0),(105,353,0,0,0,0,0,0,0),(105,356,0,0,0,0,0,0,0),(105,358,0,0,0,0,0,0,0),(105,359,0,0,0,0,0,0,0),(105,361,0,0,0,0,0,0,0),(106,95,0,0,1,0,0,0,0),(106,98,0,0,0,0,0,0,0),(106,101,0,0,0,0,0,0,0),(106,104,0,0,0,0,0,0,0),(106,106,0,1,1,0,0,0,0),(106,110,0,0,0,0,0,0,0),(106,112,0,0,0,0,0,0,0),(106,113,0,0,0,0,0,0,0),(106,116,0,0,0,0,0,0,0),(106,117,0,1,1,0,0,0,0),(106,118,0,0,0,0,0,0,0),(106,119,2,0,1,0,0,0,0),(106,120,1,0,0,0,0,0,0),(106,121,0,1,0,0,0,0,0),(106,124,0,0,0,0,0,0,0),(106,126,0,0,0,0,0,0,0),(106,127,0,0,0,0,0,0,0),(106,129,1,0,0,0,0,0,0),(106,130,0,0,0,0,0,0,0),(106,131,0,0,0,0,0,0,0),(106,132,0,0,0,0,0,0,0),(106,135,0,0,0,0,0,0,0),(106,136,0,1,0,0,0,0,0),(106,137,0,0,1,0,0,0,0),(106,138,0,0,0,0,0,0,0),(106,142,0,0,0,0,0,0,0),(106,143,0,0,0,0,0,0,0),(106,144,0,0,0,0,0,0,0),(107,56,0,0,0,0,0,0,0),(107,57,0,0,0,0,0,0,0),(107,58,1,1,0,0,0,0,0),(107,59,0,0,0,0,0,0,0),(107,60,0,0,0,0,0,0,0),(107,62,0,0,0,0,0,0,0),(107,64,2,2,0,0,0,0,0),(107,65,1,2,0,0,0,0,0),(107,66,2,0,0,0,0,0,0),(107,67,1,2,0,0,0,0,0),(107,68,0,0,0,0,0,0,0),(107,69,0,1,0,0,0,0,0),(107,70,1,0,0,0,0,0,0),(107,71,1,0,0,0,0,0,0),(107,72,0,0,0,0,0,0,0),(107,196,0,0,0,0,0,0,0),(107,205,0,0,0,0,0,0,0),(107,206,0,0,0,0,0,0,0),(107,211,0,0,0,0,0,0,0),(107,213,0,0,0,0,0,0,0),(107,221,0,0,1,0,0,0,0),(107,223,0,0,0,0,0,0,0),(107,226,0,0,0,0,0,0,0),(107,228,0,0,0,0,0,0,0),(107,230,0,0,0,0,0,0,0),(108,3,0,0,0,0,0,0,0),(108,5,0,0,0,0,0,0,0),(108,8,0,0,0,0,0,0,0),(108,10,0,0,0,0,0,0,0),(108,11,0,1,0,0,0,0,0),(108,12,1,1,0,0,0,0,0),(108,13,0,0,0,0,0,0,0),(108,14,0,0,0,0,0,0,0),(108,15,2,2,0,0,0,0,0),(108,16,0,0,0,0,0,0,0),(108,17,0,0,0,0,0,0,0),(108,18,0,0,0,0,0,0,0),(108,25,0,0,0,0,0,0,0),(108,26,0,0,0,0,0,0,0),(108,29,1,0,1,0,0,0,0),(108,30,0,0,0,0,0,0,0),(108,75,0,0,0,0,0,0,0),(108,76,0,0,0,0,0,0,0),(108,78,0,0,0,0,0,0,0),(108,79,0,0,0,0,0,0,0),(108,81,0,0,0,0,0,0,0),(108,82,0,0,1,0,0,0,0),(108,84,0,0,0,0,0,0,0),(108,86,0,0,0,0,0,0,0),(108,87,0,0,0,0,0,0,0),(108,88,0,0,0,0,0,0,0),(108,89,0,1,0,0,0,0,0),(108,91,1,0,0,0,0,0,0),(108,92,0,0,0,0,0,0,0),(108,93,0,0,0,0,0,0,0),(108,94,0,0,0,0,0,0,0),(109,285,0,0,0,0,0,0,0),(109,286,1,1,0,0,0,0,0),(109,287,0,0,0,0,0,0,0),(109,289,0,0,0,0,0,0,0),(109,290,2,1,0,0,0,0,0),(109,293,1,0,0,0,0,0,0),(109,296,0,1,0,0,0,0,0),(109,297,0,0,0,0,0,0,0),(109,298,0,0,0,0,0,0,0),(109,300,1,1,0,0,0,0,0),(109,301,1,1,0,0,0,0,0),(109,362,0,0,0,0,0,0,0),(109,364,0,0,0,0,0,0,0),(109,366,0,0,0,0,0,0,0),(109,368,0,0,0,0,0,0,0),(109,370,0,0,0,0,0,0,0),(109,373,0,0,0,0,0,0,0),(109,375,0,0,0,0,0,0,0),(109,376,0,0,0,0,0,0,0),(109,377,0,0,0,0,0,0,0),(109,379,1,0,0,0,0,0,0),(109,380,1,0,0,0,0,0,0),(109,382,0,0,0,0,0,0,0),(109,383,0,0,0,0,0,0,0),(109,385,0,1,0,0,0,0,0),(110,146,0,0,0,0,0,0,0),(110,147,0,0,0,0,0,0,0),(110,148,0,0,0,0,0,0,0),(110,149,0,0,0,0,0,0,0),(110,152,0,0,0,0,0,0,0),(110,154,3,0,0,0,0,0,0),(110,155,0,1,0,0,0,0,0),(110,156,0,0,0,0,0,0,0),(110,158,0,0,0,0,0,0,0),(110,159,1,1,0,0,0,0,0),(110,161,0,1,0,0,0,0,0),(110,162,0,1,0,0,0,0,0),(110,167,1,0,0,0,0,0,0),(110,232,0,0,0,0,0,0,0),(110,234,0,0,0,0,0,0,0),(110,235,0,0,0,0,0,0,0),(110,238,0,0,0,0,0,0,0),(110,240,0,0,0,0,0,0,0),(110,241,0,0,0,0,0,0,0),(110,244,1,0,1,0,0,0,0),(110,246,0,0,0,0,0,0,0),(110,248,0,0,0,0,0,0,0),(110,249,0,1,0,0,0,0,0),(110,250,0,0,0,0,0,0,0),(110,253,0,0,0,0,0,0,0),(111,32,0,0,0,0,0,0,0),(111,34,0,0,0,0,0,0,0),(111,35,0,0,0,0,0,0,0),(111,36,0,0,0,0,0,0,0),(111,38,0,0,0,0,0,0,0),(111,39,1,0,0,0,0,0,0),(111,40,2,0,0,0,0,0,0),(111,41,0,0,0,0,0,0,0),(111,42,0,1,0,0,0,0,0),(111,43,0,0,0,0,0,0,0),(111,45,0,0,0,0,0,0,0),(111,46,0,0,0,0,0,0,0),(111,47,0,2,0,0,0,0,0),(111,48,0,0,0,0,0,0,0),(111,50,0,1,0,0,0,0,0),(111,52,2,0,0,0,0,0,0),(111,53,0,0,0,0,0,0,0),(111,303,0,0,0,0,0,0,0),(111,304,0,0,0,0,0,0,0),(111,306,1,0,0,0,0,0,0),(111,307,0,0,0,0,0,0,0),(111,308,0,0,0,0,0,0,0),(111,309,0,0,0,0,0,0,0),(111,316,0,0,0,0,0,0,0),(111,317,0,0,0,0,0,0,0),(111,319,0,0,0,0,0,0,0),(111,320,1,1,0,0,0,0,0),(113,31,0,0,0,0,0,0,0),(113,34,0,0,0,0,0,0,0),(113,35,0,0,0,0,0,0,0),(113,39,0,0,0,0,0,0,0),(113,41,1,1,0,0,0,0,0),(113,42,1,0,0,0,0,0,0),(113,43,0,1,0,0,0,0,0),(113,44,1,0,0,0,0,0,0),(113,45,0,0,0,0,0,0,0),(113,46,0,1,0,0,0,0,0),(113,47,0,0,0,0,0,0,0),(113,48,0,0,0,0,0,0,0),(113,49,0,0,0,0,0,0,0),(113,50,2,0,0,0,0,0,0),(113,52,0,0,0,0,0,0,0),(113,53,0,2,0,0,0,0,0),(113,54,0,0,0,0,0,0,0),(113,169,0,0,0,0,0,0,0),(113,176,0,0,0,0,0,0,0),(113,177,0,0,0,0,0,0,0),(113,178,0,0,0,0,0,0,0),(113,180,1,1,0,0,0,0,0),(113,186,0,1,0,0,0,0,0),(113,187,0,0,0,0,0,0,0),(113,189,0,0,0,0,0,0,0),(113,190,0,0,0,0,0,0,0),(113,194,1,0,0,0,0,0,0),(114,179,0,0,0,0,0,0,0),(114,232,0,0,0,0,0,0,0),(114,234,0,0,0,0,0,0,0),(114,235,0,0,0,0,0,0,0),(114,236,0,0,0,0,0,0,0),(114,238,1,0,0,0,0,0,0),(114,239,0,0,0,0,0,0,0),(114,240,0,0,0,0,0,0,0),(114,241,0,0,0,0,0,0,0),(114,242,0,0,0,0,0,0,0),(114,243,0,0,0,0,0,0,0),(114,244,2,0,0,0,0,0,0),(114,246,0,1,0,0,0,0,0),(114,248,0,0,0,0,0,0,0),(114,249,0,0,0,0,0,0,0),(114,250,0,0,0,0,0,0,0),(114,253,0,0,0,0,0,0,0),(114,254,0,0,0,0,0,0,0),(114,302,0,0,0,0,0,0,0),(114,304,0,0,0,0,0,0,0),(114,306,1,0,0,0,0,0,0),(114,307,0,1,0,0,0,0,0),(114,311,3,0,0,0,0,0,0),(114,316,0,0,0,0,0,0,0),(114,317,1,1,0,0,0,0,0),(114,318,0,1,0,0,0,0,0),(114,319,0,0,0,0,0,0,0),(114,320,3,1,0,0,0,0,0),(115,146,0,0,0,0,0,0,0),(115,148,0,1,0,0,0,0,0),(115,149,0,0,0,0,0,0,0),(115,152,0,0,0,0,0,0,0),(115,154,1,0,0,0,0,0,0),(115,155,0,0,0,0,0,0,0),(115,156,0,0,0,0,0,0,0),(115,158,0,1,0,0,0,0,0),(115,159,1,0,0,0,0,0,0),(115,161,1,1,0,0,0,0,0),(115,162,0,0,0,0,0,0,0),(115,167,0,0,0,0,0,0,0),(115,363,0,0,0,0,0,0,0),(115,364,0,0,0,0,0,0,0),(115,368,0,0,0,0,0,0,0),(115,370,0,0,0,0,0,0,0),(115,376,0,0,0,0,0,0,0),(115,379,0,0,0,0,0,0,0),(115,380,1,0,1,0,0,0,0),(115,381,0,1,0,0,0,0,0),(115,382,0,0,0,0,0,0,0),(115,383,0,0,0,0,0,0,0),(116,73,0,1,0,0,0,0,0),(116,76,0,1,0,0,0,0,0),(116,78,0,0,0,0,0,0,0),(116,79,0,0,0,0,0,0,0),(116,80,1,0,0,0,0,0,0),(116,81,0,1,0,0,0,0,0),(116,82,0,0,1,0,0,0,0),(116,84,1,0,0,0,0,0,0),(116,86,0,0,0,0,0,0,0),(116,87,2,0,0,0,0,0,0),(116,89,0,0,0,0,0,0,0),(116,91,3,3,0,0,0,0,0),(116,92,2,0,0,0,0,0,0),(116,93,0,3,0,0,0,0,0),(116,282,0,0,0,0,0,0,0),(116,287,0,0,0,0,0,0,0),(116,289,0,0,0,0,0,0,0),(116,290,0,0,0,0,0,0,0),(116,293,0,0,0,0,0,0,0),(116,296,0,0,0,0,0,0,0),(116,297,0,0,0,0,0,0,0),(116,298,0,1,0,0,0,0,0),(116,300,0,0,0,0,0,0,0),(116,301,1,0,0,0,0,0,0),(117,3,0,0,0,0,0,0,0),(117,6,0,0,0,0,0,0,0),(117,7,0,0,0,0,0,0,0),(117,8,0,0,0,0,0,0,0),(117,10,0,0,0,0,0,0,0),(117,11,0,0,0,0,0,0,0),(117,12,2,0,0,0,0,0,0),(117,13,0,1,0,0,0,0,0),(117,14,0,0,0,0,0,0,0),(117,16,1,0,0,0,0,0,0),(117,17,0,0,0,0,0,0,0),(117,18,0,0,1,0,0,0,0),(117,23,0,0,0,0,0,0,0),(117,24,0,0,0,0,0,0,0),(117,25,0,0,0,0,0,0,0),(117,26,0,0,0,0,0,0,0),(117,29,0,1,0,0,0,0,0),(117,30,1,1,0,0,0,0,0),(117,188,0,0,0,0,0,0,0),(117,197,0,0,0,0,0,0,0),(117,198,0,0,0,0,0,0,0),(117,202,0,0,0,0,0,0,0),(117,207,0,1,0,0,0,0,0),(117,208,0,0,0,0,0,0,0),(117,211,0,0,0,0,0,0,0),(117,213,0,0,0,0,0,0,0),(117,214,0,0,0,0,0,0,0),(117,226,0,0,0,0,0,0,0),(117,227,1,0,1,0,1,0,0),(117,230,0,0,0,0,0,0,0),(118,56,0,0,0,0,0,0,0),(118,57,0,0,0,0,0,0,0),(118,58,0,2,0,0,0,0,0),(118,59,0,0,0,0,0,0,0),(118,60,0,0,0,0,0,0,0),(118,62,0,0,0,0,0,0,0),(118,64,1,0,1,0,0,0,0),(118,65,1,0,0,0,0,0,0),(118,66,2,1,0,0,0,0,0),(118,67,0,0,0,0,0,0,0),(118,69,0,0,0,0,0,0,0),(118,70,0,0,0,0,0,0,0),(118,72,1,1,0,1,0,0,0),(118,95,0,0,0,0,0,0,0),(118,98,0,0,0,0,0,0,0),(118,101,0,0,0,0,0,0,0),(118,104,0,0,0,0,0,0,0),(118,106,0,0,1,0,0,0,0),(118,110,0,0,0,0,0,0,0),(118,112,0,0,0,0,0,0,0),(118,113,0,0,0,0,0,0,0),(118,116,0,0,0,0,0,0,0),(118,117,0,0,0,0,0,0,0),(118,118,0,0,0,0,0,0,0),(118,119,0,0,0,0,0,0,0),(118,120,0,0,0,0,0,0,0),(118,121,0,0,0,0,0,0,0),(119,125,0,0,0,0,0,0,0),(119,126,0,1,0,0,0,0,0),(119,127,0,0,0,0,0,0,0),(119,129,0,0,1,0,0,0,0),(119,130,0,0,1,0,0,0,0),(119,131,0,0,0,0,0,0,0),(119,132,0,0,0,0,0,0,0),(119,135,0,0,0,0,0,0,0),(119,136,1,3,0,0,0,0,0),(119,137,1,0,0,0,0,0,0),(119,138,0,0,0,0,0,0,0),(119,142,0,0,0,0,0,0,0),(119,143,1,0,0,0,0,0,0),(119,144,1,0,0,0,0,0,0),(119,259,0,0,0,0,0,0,0),(119,261,0,0,0,0,0,0,0),(119,263,0,0,0,0,0,0,0),(119,264,0,0,0,0,0,0,0),(119,267,0,0,0,0,0,0,0),(119,270,0,0,1,0,0,0,0),(119,271,0,0,0,0,0,0,0),(119,272,0,0,0,0,0,0,0),(119,274,0,0,0,0,0,0,0),(119,276,0,1,0,0,0,0,0),(119,277,1,0,0,0,0,0,0),(119,278,1,0,0,0,0,0,0),(119,279,0,0,1,0,0,0,0),(120,124,0,0,0,0,0,0,0),(120,126,0,0,0,0,0,0,0),(120,127,2,0,0,0,0,0,0),(120,129,0,1,0,0,0,0,0),(120,130,0,0,0,0,0,0,0),(120,131,0,0,0,0,0,0,0),(120,132,0,0,0,0,0,0,0),(120,135,0,1,0,0,0,0,0),(120,136,1,0,0,0,0,0,0),(120,137,1,1,0,0,0,0,0),(120,138,0,0,0,0,0,0,0),(120,142,0,0,0,0,0,0,0),(120,143,0,0,0,0,0,0,0),(120,144,0,1,0,0,0,0,0),(120,343,0,0,0,0,0,0,0),(120,344,0,0,0,0,0,0,0),(120,345,0,0,0,0,0,0,0),(120,346,0,0,0,0,0,0,0),(120,349,0,0,0,0,0,0,0),(120,350,0,0,0,0,0,0,0),(120,352,1,0,1,0,0,0,0),(120,355,0,0,0,0,0,0,0),(120,356,0,0,0,0,0,0,0),(120,358,0,1,0,0,0,0,0),(120,359,0,0,0,0,0,0,0),(120,361,0,0,0,0,0,0,0),(121,56,0,0,0,0,0,0,0),(121,57,0,0,0,0,0,0,0),(121,58,0,0,0,0,0,0,0),(121,59,1,0,0,0,0,0,0),(121,62,0,0,0,0,0,0,0),(121,64,0,0,0,0,0,0,0),(121,65,0,0,0,0,0,0,0),(121,66,1,0,0,0,0,0,0),(121,69,0,1,0,0,0,0,0),(121,70,0,0,0,0,0,0,0),(121,71,0,1,0,0,0,0,0),(121,260,0,0,0,0,0,0,0),(121,261,0,0,0,0,0,0,0),(121,264,0,0,0,0,0,0,0),(121,265,0,0,0,0,0,0,0),(121,267,0,0,0,0,0,0,0),(121,269,1,0,0,0,0,0,0),(121,270,0,1,0,0,0,0,0),(121,271,0,0,0,0,0,0,0),(121,274,0,0,0,0,0,0,0),(121,276,0,0,1,0,0,0,0),(121,278,0,0,0,0,0,0,0),(122,3,0,0,0,0,0,0,0),(122,4,0,0,0,0,0,0,0),(122,5,0,0,0,0,0,0,0),(122,7,0,0,0,0,0,0,0),(122,8,0,0,0,0,0,0,0),(122,10,0,0,1,0,0,1,0),(122,11,0,0,0,0,0,0,0),(122,12,0,0,0,0,0,0,0),(122,13,0,0,0,0,0,0,0),(122,16,0,0,0,0,0,0,0),(122,17,0,0,0,0,0,0,0),(122,21,0,1,0,0,0,0,0),(122,29,1,0,0,0,0,0,0),(122,30,0,0,0,0,0,0,0),(122,95,0,0,0,0,0,0,0),(122,100,0,0,0,0,0,0,0),(122,101,0,0,0,0,0,0,0),(122,102,0,0,0,0,0,0,0),(122,103,0,0,0,0,0,0,1),(122,106,0,0,0,0,0,0,0),(122,110,0,0,0,0,0,0,0),(122,113,0,0,0,0,0,0,0),(122,115,0,0,0,0,0,0,0),(122,116,0,0,1,0,0,0,0),(122,117,0,0,0,0,0,0,0),(122,120,0,0,0,0,0,0,0),(122,121,0,0,0,0,0,0,0),(122,123,0,0,0,0,0,0,0),(123,188,0,0,0,0,0,0,0),(123,197,0,0,0,0,0,0,0),(123,206,0,1,0,0,0,0,0),(123,207,0,0,1,0,0,0,0),(123,208,0,0,1,0,0,0,0),(123,213,2,0,0,0,0,0,0),(123,226,1,1,0,0,0,0,0),(123,227,2,2,0,0,0,0,0),(123,230,1,1,0,0,0,0,0),(123,284,0,0,0,0,0,0,0),(123,286,0,0,0,0,0,0,0),(123,287,0,0,0,0,0,0,0),(123,289,1,0,0,0,0,0,0),(123,290,0,1,0,0,0,0,0),(123,292,0,0,0,0,0,0,0),(123,296,1,0,0,0,0,0,0),(123,297,0,1,0,0,0,0,0),(123,300,0,0,0,0,0,0,0),(123,301,0,0,0,0,0,0,0),(124,73,0,0,0,0,0,0,0),(124,76,0,0,0,0,0,0,0),(124,78,0,0,0,0,0,0,0),(124,79,0,0,0,0,0,0,0),(124,80,0,0,0,0,0,0,0),(124,81,0,0,0,0,0,0,1),(124,82,0,0,0,0,0,0,0),(124,84,0,0,0,0,0,0,0),(124,85,0,1,0,0,0,0,0),(124,86,0,0,0,0,0,0,0),(124,87,1,0,0,0,0,0,0),(124,88,2,0,0,0,0,0,0),(124,89,0,0,0,0,0,0,0),(124,90,0,0,0,0,0,0,0),(124,91,0,1,0,0,0,0,0),(124,92,1,0,0,0,0,0,0),(124,93,1,1,0,0,0,0,0),(124,94,0,0,0,0,0,0,0),(124,146,0,0,0,0,0,0,0),(124,147,0,0,0,0,0,0,0),(124,148,0,0,0,0,0,0,0),(124,149,0,0,0,0,0,0,0),(124,152,0,0,0,0,0,0,0),(124,154,0,0,0,0,0,0,0),(124,155,0,0,0,0,0,0,0),(124,156,0,0,0,0,0,0,0),(124,158,0,0,0,0,0,0,0),(124,159,0,0,0,0,0,0,0),(124,161,0,0,0,0,0,0,0),(124,162,0,0,0,0,0,0,0),(124,166,0,0,0,0,0,0,0),(124,167,1,0,0,0,0,0,0),(125,179,1,0,0,0,0,0,0),(125,302,0,0,0,0,0,0,0),(125,304,0,0,0,0,0,0,0),(125,306,0,0,0,0,0,0,0),(125,307,0,1,0,0,0,0,0),(125,308,0,1,0,0,0,0,0),(125,310,0,0,0,0,0,0,0),(125,311,2,0,0,0,0,0,0),(125,316,0,0,0,0,0,0,0),(125,318,1,0,0,0,0,0,0),(125,319,1,2,0,0,0,0,0),(125,363,0,0,0,0,0,0,0),(125,364,0,0,0,0,0,0,0),(125,367,0,0,0,0,0,0,0),(125,368,0,0,0,0,0,0,0),(125,369,0,0,0,0,0,0,0),(125,370,0,0,0,0,0,0,0),(125,376,0,0,0,0,0,0,0),(125,379,0,0,0,0,0,0,0),(125,380,0,0,0,0,0,0,0),(125,381,0,0,0,0,0,0,0),(125,382,0,0,0,0,0,0,0),(125,383,0,0,0,0,0,0,0),(126,168,0,0,0,0,0,0,0),(126,176,0,0,1,0,0,0,0),(126,177,0,1,0,0,0,0,0),(126,180,0,1,0,0,0,0,0),(126,181,1,0,0,0,0,0,0),(126,182,2,0,0,0,0,0,0),(126,186,1,0,0,0,0,0,0),(126,187,1,4,0,0,0,0,0),(126,189,0,0,0,0,0,0,0),(126,190,3,0,0,0,0,0,0),(126,194,1,1,0,0,0,0,0),(126,232,0,0,0,0,0,0,0),(126,236,0,0,0,0,0,0,0),(126,237,0,0,0,0,0,0,0),(126,238,0,1,0,0,0,0,0),(126,239,0,0,0,0,0,0,0),(126,240,0,0,0,0,0,0,0),(126,241,0,0,0,0,0,0,0),(126,244,1,0,0,0,0,0,0),(126,246,1,0,0,0,0,0,0),(126,248,0,0,0,0,0,0,0),(126,249,1,0,0,0,0,0,0),(126,252,0,2,0,0,0,0,0),(127,32,0,0,0,0,0,0,0),(127,34,0,0,0,0,0,0,0),(127,36,0,0,0,0,0,0,0),(127,39,2,0,0,0,0,0,0),(127,40,0,1,0,0,0,0,0),(127,41,1,0,0,0,0,0,0),(127,42,0,0,0,0,0,0,0),(127,43,0,1,0,0,0,0,0),(127,44,0,0,0,0,0,0,0),(127,46,0,0,0,0,0,0,0),(127,47,0,1,0,0,0,0,0),(127,48,0,0,0,0,0,0,0),(127,49,0,0,0,0,0,0,0),(127,50,0,0,0,0,0,0,0),(127,53,1,0,0,0,0,0,0),(127,54,0,0,0,0,0,0,0),(127,343,0,0,0,0,0,0,0),(127,344,0,0,0,0,0,0,0),(127,345,0,0,0,0,0,0,0),(127,346,0,0,0,0,0,0,0),(127,350,0,0,0,0,0,0,0),(127,351,0,0,0,0,0,0,0),(127,352,0,0,0,0,0,0,0),(127,353,0,0,0,0,0,0,0),(127,355,1,0,0,0,0,0,0),(127,356,0,0,0,0,0,0,0),(127,359,0,0,0,0,0,0,0),(127,361,0,0,0,0,0,0,0),(129,168,0,0,0,0,0,0,0),(129,176,0,0,0,0,0,0,0),(129,177,0,0,0,0,0,0,0),(129,178,0,0,1,0,0,0,0),(129,180,0,3,0,0,0,0,0),(129,181,1,0,0,0,0,0,0),(129,182,1,1,0,0,0,0,0),(129,186,1,0,0,0,0,0,0),(129,187,2,2,0,0,0,0,0),(129,189,0,0,0,0,0,0,0),(129,190,1,2,0,0,0,0,0),(129,192,2,0,0,0,0,0,0),(129,194,1,0,0,0,0,0,0),(129,363,0,0,0,0,0,0,0),(129,364,0,0,0,0,0,0,0),(129,366,0,0,0,0,0,0,0),(129,367,0,0,0,0,0,0,0),(129,368,1,0,0,0,0,0,0),(129,370,0,0,0,0,0,0,0),(129,376,1,1,0,0,0,0,0),(129,380,0,0,0,0,0,0,0),(129,382,0,0,0,0,0,0,0),(129,383,0,0,0,0,0,0,0),(130,75,0,0,0,0,0,0,0),(130,76,0,0,0,0,0,0,0),(130,78,0,0,0,0,0,0,0),(130,79,0,0,0,0,0,0,0),(130,80,0,0,0,0,0,0,0),(130,81,0,0,0,0,0,0,0),(130,82,1,0,0,0,0,0,0),(130,84,0,0,0,0,0,0,0),(130,86,0,0,0,0,0,0,0),(130,87,2,1,0,0,0,0,0),(130,88,0,0,0,0,0,0,0),(130,89,0,0,0,0,0,0,0),(130,90,0,0,0,0,0,0,0),(130,91,0,1,0,0,0,0,0),(130,92,0,0,0,0,0,0,0),(130,93,0,0,0,0,0,0,0),(130,179,0,0,0,0,0,0,0),(130,302,0,0,0,0,0,0,0),(130,306,0,0,0,0,0,0,0),(130,307,0,0,0,0,0,0,0),(130,308,0,0,0,0,0,0,0),(130,309,0,0,0,0,0,0,0),(130,311,0,0,0,0,0,0,0),(130,316,0,0,0,0,0,0,0),(130,317,0,0,0,0,0,0,0),(130,319,0,0,0,0,0,0,0),(130,320,0,0,0,0,0,0,0),(131,146,0,0,0,0,0,0,0),(131,147,0,0,0,0,0,0,0),(131,148,0,0,0,0,0,0,0),(131,149,0,0,0,0,0,0,0),(131,152,0,0,0,0,0,0,0),(131,154,2,0,0,0,0,0,0),(131,155,0,0,0,0,0,0,0),(131,156,1,0,0,0,0,0,0),(131,158,0,0,0,0,0,0,0),(131,159,0,0,0,0,0,0,0),(131,161,0,2,0,0,0,0,0),(131,166,1,0,0,0,0,0,0),(131,167,0,0,0,0,0,0,0),(131,196,0,0,0,0,0,0,0),(131,197,0,0,0,0,0,0,0),(131,198,0,0,0,0,0,0,0),(131,200,0,0,0,0,0,0,0),(131,202,0,0,0,0,0,0,0),(131,203,0,0,0,0,0,0,0),(131,206,0,1,0,0,0,0,0),(131,210,0,0,1,0,0,0,0),(131,211,0,2,0,0,0,0,0),(131,213,1,0,0,0,0,0,0),(131,214,0,0,0,0,0,0,0),(131,216,0,0,0,0,0,0,0),(131,217,1,0,0,0,0,0,0),(131,221,0,0,0,0,0,0,0),(131,227,2,1,0,0,0,0,0),(132,96,0,0,0,0,0,0,0),(132,98,0,0,0,0,0,0,0),(132,101,0,0,0,0,0,0,0),(132,104,0,0,0,0,0,0,0),(132,106,1,0,0,0,0,0,0),(132,112,0,0,0,0,0,0,0),(132,113,1,0,0,0,0,0,0),(132,116,1,0,0,0,0,0,0),(132,117,0,1,0,0,0,0,0),(132,118,0,1,0,0,0,0,0),(132,119,1,1,0,0,0,0,0),(132,120,1,0,0,0,0,0,0),(132,282,0,0,0,0,0,0,0),(132,284,0,0,0,0,0,0,0),(132,286,1,0,0,0,0,0,0),(132,287,0,0,1,0,0,0,0),(132,289,1,0,0,0,0,0,0),(132,293,0,0,0,0,0,0,0),(132,296,0,0,1,0,0,0,0),(132,297,0,0,0,0,0,0,0),(132,300,0,1,0,0,0,0,0),(132,301,0,1,0,0,0,0,0),(133,3,0,0,0,0,0,0,0),(133,4,0,0,0,0,0,0,0),(133,5,0,0,0,0,0,0,0),(133,8,0,0,0,0,0,0,0),(133,10,0,0,0,0,0,0,0),(133,12,0,1,0,0,0,0,0),(133,14,0,0,0,0,0,0,0),(133,16,1,1,0,0,0,0,0),(133,17,0,0,0,0,0,0,0),(133,18,0,0,0,0,0,0,0),(133,21,2,0,0,0,0,0,0),(133,22,0,0,0,0,0,0,0),(133,23,0,0,0,0,0,0,0),(133,25,0,0,0,0,0,0,0),(133,26,0,0,0,0,0,0,0),(133,29,1,1,0,0,0,0,0),(133,30,0,1,0,0,0,0,0),(133,260,0,0,0,0,0,0,0),(133,261,0,0,0,0,0,0,0),(133,263,0,0,0,0,0,0,0),(133,267,0,0,0,0,0,0,0),(133,269,0,0,0,0,0,0,0),(133,271,1,0,0,0,0,0,0),(133,274,0,0,0,0,0,0,0),(133,276,0,0,0,0,0,0,0),(133,277,0,1,0,0,0,0,0),(133,278,0,2,0,0,0,0,0),(133,279,1,0,0,0,0,0,0),(133,280,1,0,0,0,0,0,0),(134,56,0,0,1,0,0,0,0),(134,57,1,0,0,0,0,0,0),(134,58,0,0,1,0,0,0,0),(134,60,0,0,0,0,0,0,0),(134,62,0,1,1,0,0,0,0),(134,64,0,0,0,0,0,0,0),(134,65,0,0,0,0,0,0,0),(134,66,1,0,1,0,0,0,0),(134,67,0,0,0,0,0,0,0),(134,69,0,0,0,0,0,0,0),(134,70,0,0,0,0,0,0,0),(134,71,0,0,1,0,0,0,0),(134,72,0,0,0,0,0,0,0),(134,124,0,0,0,0,0,0,0),(134,126,1,0,0,0,0,0,0),(134,129,0,0,1,0,0,0,0),(134,130,1,0,1,0,0,0,0),(134,131,0,0,0,0,0,0,0),(134,132,0,0,0,0,0,0,0),(134,135,0,0,0,0,0,0,0),(134,136,0,1,0,0,0,0,0),(134,137,0,0,0,0,0,0,0),(134,139,0,0,0,0,0,0,0),(134,143,0,0,1,0,0,0,0),(135,56,0,0,0,0,0,0,0),(135,57,0,0,0,0,0,0,0),(135,58,1,0,0,0,0,0,0),(135,59,0,0,0,0,0,0,0),(135,60,0,0,0,0,0,0,0),(135,62,0,0,0,0,0,0,0),(135,64,0,2,0,0,0,0,0),(135,65,2,1,0,0,0,0,0),(135,66,2,0,0,0,0,0,0),(135,67,0,3,0,0,0,0,0),(135,68,0,2,0,0,0,0,0),(135,69,1,0,0,0,0,0,0),(135,70,0,0,0,0,0,0,0),(135,71,1,1,0,0,0,0,0),(135,72,2,0,0,0,0,0,0),(135,343,0,0,0,0,0,0,0),(135,344,0,0,0,0,0,0,0),(135,349,0,0,0,0,0,0,0),(135,350,0,0,0,0,0,0,0),(135,353,0,0,0,0,0,0,0),(135,355,0,0,0,0,0,0,0),(135,356,0,1,0,0,0,0,1),(135,359,0,0,0,0,0,0,0),(135,360,1,0,0,0,0,0,0),(135,361,0,0,0,0,0,0,0),(136,3,0,1,0,0,0,0,0),(136,4,0,0,0,0,0,0,0),(136,5,0,0,0,0,0,0,0),(136,6,0,0,0,0,0,0,0),(136,7,0,0,0,0,0,0,0),(136,10,0,0,0,0,0,0,0),(136,12,0,0,0,0,0,0,0),(136,13,0,0,0,0,0,0,0),(136,16,1,0,0,0,0,0,0),(136,17,1,0,0,0,0,0,0),(136,18,0,0,0,0,0,0,0),(136,23,0,0,1,0,0,0,0),(136,24,0,0,0,0,0,0,0),(136,25,0,0,0,0,0,0,0),(136,26,0,0,0,0,0,0,0),(136,29,0,0,0,0,0,0,0),(136,30,0,1,0,0,0,0,0),(136,124,0,0,0,0,0,0,0),(136,126,0,0,0,0,0,0,0),(136,127,0,0,0,0,0,0,0),(136,129,0,0,0,0,0,0,0),(136,130,0,0,0,0,0,0,0),(136,131,0,0,0,0,0,0,0),(136,132,0,0,0,0,0,0,0),(136,135,0,0,0,0,0,0,0),(136,136,0,0,0,0,0,0,0),(136,137,0,0,0,0,0,0,0),(136,138,1,0,0,0,0,0,0),(136,139,0,0,0,0,0,0,0),(136,143,0,0,0,0,0,0,0),(137,259,0,0,0,0,0,0,0),(137,261,1,0,0,0,0,0,0),(137,263,0,0,0,0,0,0,0),(137,267,1,0,0,0,0,0,0),(137,271,1,1,0,0,0,0,0),(137,274,0,0,0,0,0,0,0),(137,276,0,0,0,0,0,0,0),(137,277,0,0,0,0,0,0,0),(137,278,0,1,0,0,0,0,0),(137,279,0,1,1,0,0,0,0),(137,282,0,0,0,0,0,0,0),(137,287,0,0,0,0,0,0,0),(137,289,0,0,0,0,0,0,0),(137,290,0,0,0,0,0,0,0),(137,292,0,0,1,0,0,0,0),(137,296,0,0,1,0,0,0,0),(137,297,0,0,0,0,0,0,0),(137,298,0,0,1,0,0,0,0),(137,301,0,0,0,0,0,0,0),(138,95,0,0,0,0,0,0,0),(138,98,0,0,0,0,0,0,0),(138,101,0,0,0,0,0,0,0),(138,106,1,0,0,0,0,0,0),(138,109,0,0,0,0,0,0,0),(138,112,0,0,0,0,0,0,0),(138,113,0,0,0,0,0,0,0),(138,116,0,0,0,0,0,0,0),(138,118,0,1,1,0,0,0,0),(138,119,1,1,1,0,0,0,0),(138,120,0,0,0,0,0,0,0),(138,121,0,0,0,0,0,0,0),(138,146,0,0,0,0,0,0,0),(138,147,0,0,1,0,0,0,0),(138,148,0,1,0,0,0,0,0),(138,149,0,0,0,0,0,0,0),(138,154,0,0,0,0,0,0,0),(138,155,0,0,0,0,0,0,0),(138,156,0,0,0,0,0,0,0),(138,158,0,2,0,0,0,0,0),(138,159,1,0,0,0,0,0,0),(138,161,0,1,0,0,0,0,0),(138,163,1,0,0,0,0,0,0),(138,166,2,0,0,0,0,0,0),(138,167,0,0,0,0,0,0,0),(139,197,0,0,0,0,0,0,0),(139,198,0,0,0,0,0,0,0),(139,202,0,0,0,0,0,0,0),(139,207,1,0,0,0,0,0,0),(139,208,1,0,0,0,0,0,0),(139,213,0,0,0,0,0,0,0),(139,214,0,0,0,0,0,0,0),(139,217,0,0,0,0,0,0,0),(139,226,1,0,0,0,0,0,0),(139,227,0,2,0,0,0,0,0),(139,229,0,0,1,0,0,0,0),(139,230,0,0,0,0,0,0,0),(139,302,1,0,0,0,0,0,0),(139,304,0,0,0,0,0,0,0),(139,306,0,0,0,0,0,0,0),(139,307,0,0,0,0,0,0,0),(139,309,0,0,0,0,0,0,0),(139,316,0,0,0,0,0,0,0),(139,317,0,0,0,0,0,0,0),(139,319,1,0,0,0,0,0,0),(139,320,1,1,0,0,0,0,0),(140,73,0,0,0,0,0,0,0),(140,75,0,0,0,0,0,0,0),(140,76,0,0,0,0,0,0,0),(140,77,0,0,0,0,0,0,0),(140,78,0,0,1,0,0,0,0),(140,79,0,0,0,0,0,0,0),(140,80,0,0,0,0,0,0,0),(140,81,0,0,0,0,0,0,0),(140,84,0,0,0,0,0,0,0),(140,85,1,0,1,0,0,0,0),(140,86,0,0,0,0,0,0,0),(140,87,0,0,0,0,0,0,0),(140,90,0,1,0,0,0,0,0),(140,91,1,0,0,0,0,0,0),(140,92,0,0,0,0,0,0,0),(140,94,1,0,0,0,0,0,0),(140,169,0,0,0,0,0,0,0),(140,176,0,0,0,0,0,0,0),(140,177,0,0,0,0,0,0,0),(140,178,0,0,0,0,0,0,0),(140,180,0,0,0,0,0,0,0),(140,181,0,0,0,0,0,0,0),(140,182,0,0,0,0,0,0,0),(140,186,0,0,0,0,0,0,0),(140,187,0,0,0,0,0,0,0),(140,189,0,0,0,0,0,0,0),(140,190,0,0,0,0,0,0,0),(140,192,0,0,1,0,0,0,0),(140,194,0,0,0,0,0,0,0),(142,32,0,0,0,0,0,0,0),(142,34,0,0,0,0,0,0,0),(142,36,0,0,0,0,0,0,0),(142,38,0,1,0,0,0,0,0),(142,39,0,0,0,0,0,0,0),(142,40,0,0,0,0,0,0,0),(142,41,2,0,0,0,0,0,0),(142,42,1,0,0,0,0,0,0),(142,43,0,1,0,0,0,0,0),(142,44,0,0,0,0,0,0,0),(142,46,0,0,0,0,0,0,0),(142,47,1,0,0,0,0,0,0),(142,48,0,0,0,0,0,0,0),(142,49,0,0,0,0,0,0,0),(142,50,0,1,0,0,0,0,0),(142,52,0,0,0,0,0,0,0),(142,53,0,0,0,0,0,0,0),(142,54,0,1,0,0,0,0,0),(142,232,0,0,0,0,0,0,0),(142,235,0,0,0,0,0,0,0),(142,236,0,0,0,0,0,0,0),(142,239,0,0,0,0,0,0,0),(142,241,0,0,0,0,0,0,0),(142,244,0,0,1,0,0,0,0),(142,246,1,0,0,0,0,0,0),(142,248,0,0,1,0,0,0,0),(142,249,0,0,0,0,0,0,0),(142,253,0,0,0,0,0,0,0),(143,232,0,0,0,0,0,0,0),(143,235,0,0,0,0,0,0,0),(143,236,0,0,0,0,0,0,0),(143,239,0,0,0,0,0,0,0),(143,241,0,0,0,0,0,0,0),(143,244,0,0,1,0,0,0,0),(143,246,0,0,0,0,0,0,0),(143,247,0,0,0,0,0,0,0),(143,248,1,0,0,0,0,0,0),(143,249,0,0,0,0,0,0,0),(143,258,0,0,0,0,0,0,0),(143,343,0,0,0,0,0,0,0),(143,344,0,0,0,0,0,0,0),(143,345,0,0,0,0,0,0,0),(143,349,0,0,0,0,0,0,0),(143,350,0,0,0,0,0,0,0),(143,351,0,0,0,0,0,0,0),(143,352,1,1,0,0,0,0,0),(143,353,0,0,1,0,0,1,0),(143,355,0,0,0,0,0,0,0),(143,358,0,0,0,0,0,0,0),(143,359,0,1,0,0,0,0,0),(143,360,2,1,0,0,0,0,0),(143,361,0,0,0,0,0,0,0),(144,33,0,0,0,0,0,0,0),(144,34,0,0,0,0,0,0,0),(144,36,0,1,0,0,0,0,0),(144,38,0,0,0,0,0,0,0),(144,39,0,1,0,0,0,0,0),(144,40,2,3,0,0,0,0,0),(144,41,2,2,0,0,0,0,0),(144,42,1,2,0,0,0,0,0),(144,43,0,0,0,0,0,0,0),(144,45,1,0,0,0,0,0,0),(144,46,1,0,0,0,0,0,0),(144,47,1,1,0,0,0,0,0),(144,48,0,0,0,0,0,0,0),(144,49,1,0,0,0,0,0,0),(144,51,0,0,0,0,0,0,0),(144,52,3,2,0,0,0,0,0),(144,53,5,1,0,0,0,0,0),(144,54,1,2,0,0,0,0,0),(144,363,0,0,0,0,0,0,0),(144,364,0,0,0,0,0,0,0),(144,365,0,0,0,0,0,0,0),(144,367,0,0,0,0,0,0,0),(144,368,0,0,0,0,0,0,0),(144,372,2,0,0,0,0,0,0),(144,374,0,0,0,0,0,0,0),(144,381,0,0,0,0,0,0,0),(144,383,0,0,0,0,0,0,0),(145,168,0,0,0,0,0,0,0),(145,176,0,0,0,0,0,0,0),(145,177,0,0,0,0,0,0,0),(145,178,1,0,0,0,0,0,0),(145,180,0,1,0,0,0,0,0),(145,182,1,0,0,0,0,0,0),(145,186,0,0,0,0,0,0,0),(145,187,0,3,0,0,0,0,0),(145,189,0,0,1,0,0,0,0),(145,190,1,0,0,0,0,0,0),(145,194,2,1,0,0,0,0,0),(145,197,0,0,0,0,0,0,0),(145,198,0,0,0,0,0,0,0),(145,202,0,2,0,0,0,0,0),(145,207,0,1,0,0,0,0,0),(145,213,1,0,0,0,0,0,0),(145,214,0,1,0,0,0,0,0),(145,217,1,0,0,0,0,0,0),(145,225,0,1,0,0,0,0,0),(145,226,1,0,0,0,0,0,0),(145,227,2,0,0,0,0,0,0),(146,95,0,0,0,0,0,0,0),(146,98,0,0,0,0,0,0,0),(146,101,0,0,0,0,0,0,0),(146,102,0,0,0,0,0,0,0),(146,106,1,1,0,0,0,0,0),(146,109,0,0,0,0,0,0,0),(146,110,0,0,0,0,0,0,0),(146,112,0,0,0,0,0,0,0),(146,113,0,0,0,0,0,0,0),(146,115,1,0,0,0,0,0,0),(146,116,1,2,0,0,0,0,0),(146,118,0,0,0,0,0,0,0),(146,119,3,1,0,0,0,0,0),(146,120,0,0,0,0,0,0,0),(146,121,0,0,0,0,0,0,0),(146,123,1,0,0,0,0,0,0),(146,179,1,1,0,0,0,0,0),(146,302,0,0,0,0,0,0,0),(146,304,0,0,0,0,0,0,0),(146,305,0,0,0,0,0,0,0),(146,306,0,0,0,0,0,0,0),(146,307,0,0,0,0,0,0,0),(146,316,0,0,0,0,0,0,0),(146,320,1,0,0,0,0,0,0),(147,146,0,0,0,0,0,0,0),(147,147,0,0,0,0,0,0,0),(147,148,0,2,0,0,0,0,0),(147,149,0,0,0,0,0,0,0),(147,152,0,0,1,0,0,0,0),(147,154,1,1,0,0,0,0,0),(147,155,2,0,0,0,0,0,0),(147,156,0,3,0,0,0,0,0),(147,158,0,0,0,0,0,0,0),(147,159,0,0,0,0,0,0,0),(147,161,2,1,0,0,0,0,0),(147,163,2,0,0,0,0,0,0),(147,167,0,0,0,0,0,0,0),(147,260,0,0,0,0,0,0,0),(147,261,0,0,0,0,0,0,0),(147,263,0,0,1,0,0,0,0),(147,266,0,0,0,0,0,0,0),(147,267,0,0,0,0,0,0,0),(147,269,0,1,0,0,0,0,0),(147,270,0,0,0,0,0,0,0),(147,271,1,0,0,0,0,0,0),(147,274,0,0,0,0,0,0,0),(147,276,0,0,0,0,0,0,0),(147,278,0,1,0,0,0,0,0),(147,279,1,0,0,0,0,0,0),(148,125,0,0,0,0,0,0,0),(148,126,0,0,0,0,0,0,0),(148,127,0,1,0,0,0,0,0),(148,130,0,1,0,0,0,0,0),(148,131,0,1,0,0,1,0,0),(148,132,1,0,0,0,0,0,0),(148,135,0,1,0,0,0,0,0),(148,136,1,1,0,0,0,0,0),(148,137,0,0,0,0,0,0,0),(148,138,0,0,0,0,0,0,0),(148,139,1,0,0,0,0,0,0),(148,143,4,0,1,0,0,0,0),(148,283,0,0,0,0,0,0,0),(148,286,0,0,0,0,0,0,0),(148,287,0,0,0,0,0,0,0),(148,289,0,0,0,0,0,0,0),(148,290,0,0,0,0,0,0,0),(148,292,0,0,0,0,0,0,0),(148,293,0,0,0,0,0,0,0),(148,296,0,0,0,0,0,0,0),(148,297,0,1,0,0,0,0,0),(148,298,0,0,0,0,0,0,0),(148,300,0,0,0,0,0,0,0),(148,301,1,0,0,0,0,0,0),(149,3,0,0,1,0,0,0,1),(149,4,0,0,1,0,0,0,0),(149,5,0,0,0,0,0,0,0),(149,10,0,0,1,1,0,0,0),(149,12,0,0,0,0,0,0,0),(149,13,0,0,0,0,0,0,0),(149,16,0,0,0,0,0,0,0),(149,17,0,0,0,0,0,0,0),(149,21,1,0,0,0,0,0,0),(149,22,0,0,0,0,0,0,0),(149,56,0,0,0,0,0,0,0),(149,57,0,0,0,0,0,0,0),(149,58,0,0,0,0,0,0,0),(149,59,1,0,0,0,0,0,0),(149,62,0,0,0,0,0,0,0),(149,64,0,0,0,0,0,0,0),(149,65,1,0,0,0,0,0,0),(149,66,0,1,0,0,0,0,0),(149,67,0,0,0,0,0,0,0),(149,69,0,0,0,0,0,0,0),(149,70,0,0,0,0,0,0,0),(149,72,0,0,0,0,0,0,0),(150,2,0,0,0,0,0,0,0),(150,5,0,2,0,0,0,0,0),(150,7,0,0,0,0,0,0,0),(150,8,0,0,0,0,0,0,0),(150,11,0,0,0,0,0,0,0),(150,12,1,1,0,0,0,0,0),(150,14,0,0,0,0,0,0,0),(150,16,2,1,0,0,0,0,0),(150,17,1,0,0,0,0,0,0),(150,23,0,0,0,0,0,0,0),(150,25,0,0,0,0,0,0,0),(150,26,0,0,0,0,0,0,0),(150,28,1,1,0,0,0,0,0),(150,30,0,0,0,0,0,0,0),(150,343,0,0,0,0,0,0,0),(150,344,0,0,0,0,0,0,0),(150,346,0,0,0,0,0,0,0),(150,349,0,0,0,0,0,0,0),(150,350,1,0,0,0,0,0,0),(150,353,0,1,0,0,0,0,0),(150,355,1,1,0,0,0,0,0),(150,359,0,0,1,0,0,0,0),(150,360,0,0,0,0,0,0,0),(151,56,0,0,0,0,0,0,0),(151,57,1,0,0,0,0,0,0),(151,58,0,2,0,0,0,0,0),(151,59,0,0,0,0,0,0,0),(151,60,0,0,0,0,0,0,0),(151,62,1,0,0,0,0,0,0),(151,64,1,0,0,0,0,0,0),(151,65,0,0,0,0,0,0,0),(151,66,1,1,0,0,0,0,0),(151,68,0,0,0,0,0,0,0),(151,69,0,0,0,0,0,0,0),(151,70,0,0,0,0,0,0,0),(151,71,1,0,0,0,0,0,0),(151,72,0,1,0,0,0,0,0),(151,282,0,0,0,0,0,0,0),(151,286,0,0,0,0,0,0,0),(151,287,0,0,0,0,0,0,0),(151,289,0,0,0,0,0,0,0),(151,290,0,0,0,0,0,0,0),(151,292,0,0,0,0,0,0,0),(151,293,0,0,0,0,0,0,0),(151,296,0,0,0,0,0,0,0),(151,301,0,0,0,0,0,0,0),(153,179,0,0,0,0,0,0,0),(153,260,0,0,0,0,0,0,0),(153,261,1,0,0,0,0,0,0),(153,263,0,0,0,0,0,0,0),(153,266,0,0,0,0,0,0,0),(153,267,0,0,1,0,0,0,0),(153,269,0,0,0,0,0,0,0),(153,270,1,0,0,0,0,0,0),(153,274,0,1,0,0,0,0,0),(153,276,3,0,0,0,0,0,0),(153,278,0,2,0,0,0,0,0),(153,279,0,1,0,0,0,0,0),(153,302,0,0,0,0,0,0,0),(153,304,0,0,0,0,0,0,0),(153,306,0,1,0,0,0,0,0),(153,308,0,0,0,0,0,0,0),(153,309,0,0,0,0,0,0,0),(153,316,0,0,1,0,0,0,0),(153,317,0,0,0,0,0,0,0),(153,318,0,0,0,0,0,0,0),(153,323,1,0,0,0,0,0,0),(154,95,0,0,0,0,0,0,0),(154,101,0,0,0,0,0,0,0),(154,102,0,0,0,0,0,0,0),(154,106,1,0,0,0,0,0,0),(154,110,0,0,0,0,0,0,0),(154,113,0,0,0,0,0,0,0),(154,115,0,0,0,0,0,0,0),(154,116,1,0,0,0,0,0,0),(154,118,0,0,0,0,0,0,0),(154,119,1,0,0,0,0,0,0),(154,120,0,0,1,0,0,0,0),(154,121,0,0,0,0,0,0,0),(154,123,0,0,0,0,0,0,0),(154,169,0,0,0,0,0,0,0),(154,177,0,0,0,0,0,0,0),(154,178,0,0,0,0,0,0,0),(154,180,1,0,0,0,0,0,0),(154,186,1,0,0,0,0,0,0),(154,187,0,0,0,0,0,0,0),(154,189,0,0,1,0,0,0,0),(154,190,0,2,0,0,0,0,0),(154,192,0,0,0,0,0,0,0),(154,194,0,0,0,0,0,0,0),(156,232,0,0,0,0,0,0,0),(156,236,1,0,0,0,0,0,0),(156,238,1,2,0,0,0,0,0),(156,239,0,0,0,0,0,0,0),(156,241,0,0,0,0,0,0,0),(156,242,0,0,0,0,0,0,0),(156,243,0,1,0,0,0,0,0),(156,246,0,0,0,0,0,0,0),(156,247,1,1,0,0,0,0,0),(156,248,1,0,0,0,0,0,0),(156,249,1,1,0,0,0,0,0),(156,253,0,0,0,0,0,0,0),(156,362,0,1,0,0,0,0,0),(156,366,0,0,0,0,0,0,0),(156,368,0,0,0,0,0,0,0),(156,369,0,0,0,0,0,0,0),(156,374,0,0,0,0,0,0,0),(156,377,0,0,0,0,0,0,0),(156,379,2,0,0,0,0,0,0),(156,382,0,0,0,0,0,0,0),(156,383,1,0,0,0,0,0,0),(158,73,0,0,0,0,0,0,0),(158,75,0,0,0,0,0,0,0),(158,76,0,0,0,0,0,0,0),(158,77,0,0,0,0,0,0,0),(158,78,0,0,0,0,0,0,0),(158,79,0,0,0,0,0,0,0),(158,80,0,2,0,0,0,0,0),(158,81,0,0,0,0,0,0,0),(158,82,1,1,0,0,0,0,0),(158,84,0,1,0,0,0,0,0),(158,85,1,0,0,0,0,0,0),(158,86,2,1,0,0,0,0,0),(158,87,1,0,0,0,0,0,0),(158,88,2,1,0,0,0,0,0),(158,89,0,0,0,0,0,0,0),(158,90,1,0,0,0,0,0,0),(158,91,1,2,0,0,0,0,0),(158,92,1,0,0,0,0,0,0),(158,93,0,0,0,0,0,0,0),(158,233,0,0,0,0,0,0,0),(158,235,0,0,0,0,0,0,0),(158,236,0,0,0,0,0,0,0),(158,239,0,0,0,0,0,0,0),(158,244,0,0,1,0,0,0,0),(158,246,0,0,0,0,0,0,0),(158,247,0,0,0,0,0,0,0),(158,248,0,1,0,0,0,0,0),(158,249,1,0,0,0,0,0,0),(158,252,1,0,0,0,0,0,0),(158,255,0,0,0,0,0,0,0),(159,33,0,0,0,0,0,0,0),(159,35,0,0,0,0,0,0,0),(159,36,0,0,0,0,0,0,0),(159,38,0,0,0,0,0,0,0),(159,39,0,0,0,0,0,0,0),(159,41,0,1,0,0,0,0,0),(159,42,0,0,0,0,0,0,0),(159,44,0,0,0,0,0,0,0),(159,45,1,0,0,0,0,0,0),(159,46,0,0,0,0,0,0,0),(159,47,1,0,1,0,0,0,0),(159,49,0,0,0,0,0,0,0),(159,50,0,0,0,0,0,0,0),(159,52,0,0,0,0,0,0,0),(159,53,0,0,0,0,0,0,0),(159,54,1,0,0,0,0,0,0),(159,197,0,0,0,0,0,0,0),(159,198,0,0,0,0,0,0,0),(159,202,0,0,0,0,0,0,0),(159,207,0,0,0,0,0,0,0),(159,209,0,0,0,0,0,0,0),(159,211,0,0,0,0,0,0,0),(159,214,1,0,0,0,0,0,0),(159,215,0,0,0,0,0,0,0),(159,217,0,0,1,0,0,0,0),(159,227,2,1,1,0,0,0,0),(159,229,0,0,0,0,0,0,0),(161,168,0,0,0,0,0,0,0),(161,176,0,0,0,0,0,0,0),(161,177,0,0,0,0,0,0,0),(161,180,1,1,0,0,0,0,0),(161,186,0,1,0,0,0,0,0),(161,187,2,1,0,0,0,0,0),(161,189,0,0,0,0,0,0,0),(161,190,0,2,0,0,0,0,0),(161,192,2,0,0,0,0,0,0),(161,194,0,0,0,0,0,0,0),(161,260,0,0,0,0,0,0,0),(161,261,0,1,0,0,0,0,0),(161,263,0,0,0,0,0,0,0),(161,267,0,0,0,0,0,0,0),(161,269,0,0,0,0,0,0,0),(161,270,0,0,0,0,0,0,0),(161,274,1,0,0,0,0,0,0),(161,276,1,1,0,0,0,0,0),(161,278,1,0,0,0,0,0,0),(161,279,0,1,0,0,0,0,0),(162,124,0,0,0,0,0,0,0),(162,126,0,0,0,0,0,0,0),(162,127,0,0,0,0,0,0,0),(162,129,0,0,1,0,0,0,0),(162,130,0,0,0,0,0,0,0),(162,132,0,0,0,0,0,0,0),(162,135,0,0,0,0,0,0,0),(162,136,1,0,0,0,0,0,0),(162,137,0,0,0,0,0,0,0),(162,138,0,0,0,0,0,0,0),(162,140,0,0,0,0,0,0,0),(162,141,0,0,0,0,0,0,0),(162,142,0,0,0,0,0,0,0),(162,144,0,1,0,0,0,0,0),(162,179,0,0,0,0,0,0,0),(162,302,0,0,0,0,0,0,0),(162,304,0,0,0,0,0,0,0),(162,306,0,0,0,0,0,0,0),(162,311,0,0,1,0,0,0,0),(162,313,0,0,0,0,0,0,0),(162,317,0,0,0,0,0,0,0),(162,323,1,0,0,0,0,0,0),(163,56,0,0,0,0,0,0,0),(163,57,0,1,0,0,0,0,0),(163,58,0,0,0,0,0,0,0),(163,59,1,0,1,0,0,0,0),(163,60,0,0,0,0,0,0,0),(163,62,0,0,0,0,0,0,0),(163,64,0,0,0,0,0,0,0),(163,65,0,0,0,0,0,0,0),(163,66,0,0,0,0,0,0,0),(163,67,0,0,0,0,0,0,0),(163,68,0,0,0,0,0,0,0),(163,69,0,0,0,0,0,0,0),(163,70,0,0,1,0,0,0,0),(163,71,0,0,0,0,0,0,0),(163,72,0,0,0,0,0,0,0),(163,146,0,0,0,0,0,0,0),(163,152,0,0,1,0,0,0,0),(163,154,0,0,0,0,0,0,0),(163,155,0,0,0,0,0,0,0),(163,156,0,0,0,0,0,0,0),(163,158,0,1,0,0,0,0,0),(163,159,0,0,0,0,0,0,0),(163,161,0,0,0,0,0,0,0),(163,162,0,0,0,0,0,0,0),(163,165,0,0,0,0,0,0,0),(163,166,1,0,0,0,0,0,0),(163,167,0,0,0,0,0,0,0),(164,3,0,0,0,0,0,0,0),(164,5,0,1,0,0,0,0,0),(164,7,0,0,0,0,0,0,0),(164,8,0,0,0,0,0,0,0),(164,12,1,0,0,0,0,0,0),(164,14,0,0,0,0,0,0,0),(164,16,0,0,1,0,0,0,0),(164,17,1,1,0,0,0,0,0),(164,18,1,0,0,0,0,0,0),(164,21,0,0,0,0,0,0,0),(164,25,0,0,0,0,0,0,0),(164,26,0,0,0,0,0,0,0),(164,28,0,0,0,0,0,0,0),(164,29,0,0,0,0,0,0,0),(164,30,0,0,0,0,0,0,0),(164,282,0,0,0,0,0,0,0),(164,287,0,0,0,0,0,0,0),(164,289,0,0,0,0,0,0,0),(164,290,0,0,0,0,0,0,0),(164,292,0,0,0,0,0,0,0),(164,293,0,1,0,0,0,0,0),(164,296,0,0,0,0,0,0,0),(164,297,0,0,0,0,0,0,0),(164,298,1,0,0,0,0,0,0),(164,300,0,0,0,0,0,0,0),(164,301,0,0,0,0,0,0,0),(165,282,0,0,0,0,0,0,0),(165,286,0,0,0,0,0,0,0),(165,289,0,0,0,0,0,0,0),(165,290,0,0,0,0,0,0,0),(165,292,0,0,0,0,0,0,0),(165,293,0,1,0,0,0,0,0),(165,296,0,0,0,0,0,0,0),(165,297,0,0,0,0,0,0,0),(165,298,1,0,0,0,0,0,0),(165,300,0,0,0,0,0,0,0),(165,301,0,0,0,0,0,0,0),(165,342,0,0,0,0,0,0,0),(165,344,0,0,0,0,0,0,0),(165,345,0,0,0,0,0,0,0),(165,346,0,0,0,0,0,0,0),(165,349,1,0,0,0,0,0,0),(165,352,0,2,0,0,0,0,0),(165,353,0,0,0,0,0,0,0),(165,355,1,0,0,0,0,0,0),(165,359,2,0,0,0,0,0,0),(165,360,1,2,0,0,0,0,0),(165,361,0,1,0,0,0,0,0),(166,3,0,0,1,0,0,0,0),(166,7,0,0,0,0,0,0,0),(166,12,0,1,0,0,0,0,0),(166,13,1,0,0,0,0,0,0),(166,16,0,1,0,0,0,0,0),(166,17,1,0,0,0,0,0,0),(166,18,0,0,0,0,0,0,0),(166,21,1,0,0,0,0,0,0),(166,23,0,0,0,0,0,0,0),(166,28,1,0,1,0,0,0,0),(166,146,0,0,0,0,0,0,0),(166,148,0,1,0,0,0,0,0),(166,149,0,0,0,0,0,0,0),(166,152,0,0,0,0,0,0,0),(166,154,0,0,0,0,0,0,0),(166,155,0,0,0,0,0,0,0),(166,159,0,0,0,0,0,0,0),(166,161,0,0,0,0,0,0,0),(166,162,0,0,0,0,0,0,0),(166,163,2,0,0,0,0,0,0),(166,166,0,0,0,0,0,0,0),(166,167,0,1,0,0,0,0,0),(167,55,0,0,0,0,0,0,0),(167,56,0,0,0,0,0,0,0),(167,57,0,0,0,0,0,0,0),(167,58,2,0,0,0,0,0,0),(167,59,2,0,0,0,0,0,0),(167,60,1,1,0,0,0,0,0),(167,64,0,2,0,0,0,0,0),(167,65,1,2,0,0,0,0,0),(167,66,2,1,0,0,0,0,0),(167,67,0,0,0,0,0,0,0),(167,68,0,1,0,0,0,0,0),(167,69,0,0,0,0,0,0,0),(167,70,0,1,0,0,0,0,0),(167,71,3,0,0,0,0,0,0),(167,72,0,2,0,0,0,0,0),(167,302,0,0,0,0,0,0,0),(167,307,0,0,0,0,0,0,0),(167,309,1,0,0,0,0,0,0),(167,311,0,0,0,0,0,0,0),(167,314,1,1,0,0,0,0,0),(167,315,0,0,0,0,0,0,0),(167,316,0,0,0,0,0,0,0),(167,317,0,0,0,0,0,0,0),(167,320,0,1,0,0,0,0,0),(167,324,1,1,0,0,0,0,0),(168,125,0,0,0,0,0,0,0),(168,126,1,0,0,0,0,0,0),(168,127,0,0,0,0,0,0,0),(168,129,0,0,0,0,0,0,0),(168,130,0,1,0,0,0,0,0),(168,131,0,0,0,0,0,0,0),(168,132,1,0,0,0,0,0,0),(168,135,0,0,0,0,0,0,0),(168,136,1,2,0,0,0,0,0),(168,137,1,1,0,0,0,0,0),(168,138,0,0,0,0,0,0,0),(168,141,0,0,0,0,0,0,0),(168,142,0,0,0,0,0,0,0),(168,143,1,0,0,0,0,0,0),(168,169,0,0,0,0,0,0,0),(168,176,0,0,0,0,0,0,0),(168,177,0,0,0,0,0,0,0),(168,178,0,0,0,0,0,0,0),(168,180,0,1,0,0,0,0,0),(168,182,1,0,0,0,0,0,0),(168,186,2,0,0,0,0,0,0),(168,187,0,0,0,0,0,0,0),(168,189,0,0,1,0,0,0,0),(168,190,0,2,0,0,0,0,0),(169,32,0,0,0,0,0,0,0),(169,35,0,0,0,0,0,0,0),(169,36,0,0,0,0,0,0,0),(169,38,0,0,0,0,0,0,0),(169,42,0,0,0,0,0,0,0),(169,43,0,0,0,0,0,0,0),(169,46,1,0,0,0,0,0,0),(169,47,1,1,0,0,0,0,0),(169,50,0,0,1,0,0,0,0),(169,52,0,2,0,0,0,0,0),(169,53,0,1,0,0,0,0,0),(169,54,2,0,0,0,0,0,0),(169,95,0,0,0,0,0,0,0),(169,100,0,0,0,0,0,0,0),(169,101,1,0,0,0,0,0,0),(169,103,0,0,0,0,0,0,0),(169,106,0,0,0,0,0,0,0),(169,109,0,0,0,0,0,0,0),(169,110,0,0,0,0,0,0,0),(169,112,0,0,0,0,0,0,0),(169,113,0,0,0,0,0,0,0),(169,116,1,0,0,0,0,0,0),(169,118,0,0,0,0,0,0,0),(169,119,0,1,0,0,0,0,0),(169,120,0,0,0,0,0,0,0),(169,121,0,0,0,0,0,0,0),(170,188,0,1,0,0,0,0,0),(170,197,0,0,0,0,0,0,0),(170,198,0,0,1,0,0,0,0),(170,202,1,0,0,0,0,0,0),(170,207,1,0,0,0,0,0,0),(170,208,0,0,0,0,0,0,0),(170,209,0,0,1,0,0,0,0),(170,213,0,0,0,0,0,0,0),(170,214,0,0,0,0,0,0,0),(170,215,0,0,0,0,0,0,0),(170,217,1,0,0,0,0,0,0),(170,227,2,3,0,0,0,0,0),(170,229,1,0,1,0,0,0,0),(170,233,0,0,1,0,0,0,0),(170,235,0,0,0,0,0,0,0),(170,236,0,0,0,0,0,0,0),(170,238,0,0,0,0,0,0,0),(170,239,0,0,0,0,0,0,0),(170,243,0,0,1,0,0,0,0),(170,246,0,0,0,0,0,0,0),(170,247,0,0,0,0,0,0,0),(170,248,0,0,0,0,0,0,0),(170,249,1,0,0,0,0,0,0),(170,252,1,0,0,0,0,0,0),(171,75,0,0,0,0,0,0,0),(171,79,0,0,0,0,0,0,0),(171,81,1,0,0,0,0,0,0),(171,85,0,0,0,0,0,0,0),(171,88,1,0,0,0,0,0,0),(171,91,0,1,0,0,0,0,0),(171,92,0,0,0,0,0,0,0),(171,93,0,0,0,0,0,0,0),(171,362,0,0,0,0,0,0,0),(171,366,0,0,0,0,0,0,0),(171,368,0,0,0,0,0,0,0),(171,369,0,0,0,0,0,0,0),(171,381,0,0,0,0,0,0,0),(171,383,0,0,0,0,0,0,0),(171,385,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `players_in_match` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  tr_aft_ins_players_in_match after insert on players_in_match
for each row
begin 

declare l_id int;
declare l_count_goals int ;
declare l_count_assist int;
declare l_yellow int;
declare l_red int;
declare l_penalty int;
declare l_penalty_out int;
declare l_own_goal int;

set l_id = new.id_player;
set l_count_goals = new.count_goals;
set l_count_assist = new.count_assist;
set l_yellow = new.yellow;
set l_red = new.red;
set l_penalty = new.penalty;
set l_penalty_out = new.penalty_out;
set l_own_goal = new.own_goal;



update players_statistics ps
set games = games + 1, 
	goal = goal + l_count_goals, 
	assist = assist + l_count_assist,
	yellow_card = yellow_card + l_yellow, 
    red_card = red_card + l_red, 
    ps.penalty = ps.penalty + l_penalty,
	ps.penalty_out = ps.penalty_out + l_penalty_out, 
    ps.own_goal = ps.own_goal + l_own_goal
where ps.id_player = l_id;
	



end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id_pos` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Руководитель'),(2,'Главный судья'),(3,'Судья 1 категории'),(4,'Судья 2 категории');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesons`
--

DROP TABLE IF EXISTS `sesons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesons` (
  `id_season` int(11) NOT NULL AUTO_INCREMENT,
  `year_end` date DEFAULT NULL,
  `year_start` date DEFAULT NULL,
  PRIMARY KEY (`id_season`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesons`
--

LOCK TABLES `sesons` WRITE;
/*!40000 ALTER TABLE `sesons` DISABLE KEYS */;
INSERT INTO `sesons` VALUES (1,'2019-07-01','2018-08-01'),(2,'2018-07-01','2017-08-01');
/*!40000 ALTER TABLE `sesons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadiums` (
  `id_stadium` int(11) NOT NULL AUTO_INCREMENT,
  `name_stadium` varchar(45) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_stadium`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Спартак 1','Академия Спартака'),(2,'Спартак 2','Академия Спартака'),(3,'Спартак 3','Академия Спартака'),(4,'Спартак 4','Академия Спартака');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(70) DEFAULT NULL,
  `id_pos` int(11) DEFAULT NULL,
  `num_phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `fk_staff_position1_idx` (`id_pos`),
  CONSTRAINT `fk_staff_position1` FOREIGN KEY (`id_pos`) REFERENCES `position` (`id_pos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Бодров Д.',3,NULL),(2,'Боярский Д.',3,NULL),(3,'Аветисов С.',3,NULL),(4,'Бородин И.',3,NULL),(5,'Сергеев А.',3,NULL),(6,'Коржевский В.',3,NULL),(7,NULL,3,NULL),(8,'Ершов Д.',3,NULL),(9,NULL,3,NULL),(10,NULL,3,NULL),(11,NULL,3,NULL),(12,NULL,3,NULL),(13,NULL,3,NULL),(14,NULL,3,NULL),(15,NULL,3,NULL),(16,NULL,3,NULL),(17,NULL,3,NULL),(18,NULL,3,NULL),(19,NULL,3,NULL),(20,NULL,3,NULL),(21,NULL,3,NULL),(22,NULL,3,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_bef_ins_staff before insert on staff
for each row 
begin
	declare l_new_name char(100);
    declare l_f int;
    set l_new_name = new.staff_name;
    
    select count(1)
		into l_f
	from staff
		where staff_name like l_new_name;
        
	if l_f = 0 then 
		set new.staff_name = l_new_name,
			new.id_pos = 3;
	else
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: This name have already exist';
    end if;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `id_division` int(11) DEFAULT NULL,
  `team_name` varchar(100) NOT NULL,
  `creation_date` date DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL COMMENT 'Дубль основной команды',
  PRIMARY KEY (`id_team`),
  KEY `fk_teams_teams1_idx` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,'Усадьба Банная','2015-01-01','Усадьба Банная.png',NULL),(2,1,'Дизайн-окно-Связист','2012-01-01','Дизайн-окно-Связист.png',NULL),(3,1,'Авангард','2010-01-01','Авангард.png',NULL),(4,1,'Титан','2010-01-01','Титан.png',NULL),(5,1,'Бриг','2014-01-01','Бриг.png',NULL),(6,1,'Альбасете','2015-01-01','Альбасете.png',NULL),(7,1,'Селтик','2015-01-02','Селтик.png',NULL),(8,1,'Трансгарант','2015-01-03','Трансгарант.png',NULL),(9,1,'Профит-Хаста','2015-01-04','Профит-Хаста.png',NULL),(10,1,'Регион-13','2015-01-05','Регион-13.png',NULL),(11,1,'Нижгары','2015-01-06','Нижгары.png',NULL),(12,1,'Селтик-2','2015-01-07','Селтик-2.png',NULL),(13,1,'Экспресс Москва','2015-01-08','Экспресс Москва.png',NULL),(14,1,'Бастион','2015-01-09','Бастион.png',NULL),(15,1,'РМА','2015-01-10','РМА.png',NULL),(16,1,'СКА','2015-01-11','СКА.png',NULL),(17,2,'Морс','2015-01-01','морс.png',NULL),(18,2,'Торпедо','2016-01-01','торпедо.png',NULL),(19,2,'Атлетик','2015-01-01','атлетик.png',NULL),(20,2,'Лефортово','2010-01-01','лефортово.png',NULL),(21,2,'Косино','2014-01-01','косино.png',NULL),(22,2,'Аэротрейд','2013-01-01','аэротрейд.png',NULL),(23,2,'Бобби Дэззлер','2014-04-01','Бобби Дэззлер.png',NULL),(24,2,'Гравити','2017-04-01','гравити.png',NULL),(25,2,'Жилкомплекс-Королёв','2011-01-31','Жилкомплекс-Королёв.png',NULL),(26,2,'Заря','2011-02-10','заря.png',NULL),(27,2,'Зубр','2016-02-10','зубр.png',NULL),(28,2,'ЛИТ','2009-02-10','лит.png',NULL),(29,2,'ЛФК Империя','2008-02-10','ЛФК Империя.png',NULL),(30,2,'Прайм','2017-02-10','прайм.png',NULL),(31,2,'Профком Юнайтед','2016-02-10','Профком Юнайтед.png',NULL),(38,2,'СтройЭкспо','2016-02-10','стройЭкспо.png',NULL),(39,2,'Фора','2011-02-10','фора.png',NULL),(40,2,'Фут. академия','2015-02-10','Фут. академия.png',NULL),(41,2,'Чума востока','2016-02-10','Чума востока.png',NULL),(42,2,'Эрствак','2015-02-10','эрствак.png',NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_aft_ins_teams after insert on teams
for each row
begin 

if new.team_name <> 'cвободный агент' then
	insert into tournament_table
	set id_season = (select id_season from sesons
						where curdate() between year_start and year_end),
		id_division = new.id_division,
		id_team = new.id_team,
		games = 0, wins = 0, draws = 0, losses = 0, goals_scored = 0, goals_conceded = 0, points = 0;
end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_user` datetime NOT NULL,
  `updated_user` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `unique_id_UNIQUE` (`unique_id`),
  KEY `fk_users_type_user1_idx` (`id_type`),
  KEY `fk_users_teams1_idx` (`id_team`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,'WNRHKYPF8GR4BVIyDHaH0nK','Glusho Mark','test@test.com','YTk5Mzg1N2MwZWM4ZjAxNjQ4MDdkMjI3ZGEyYzQ4MjJlNGJhMTgyMzA4MTkzNjI4MDI=','0819362802','2019-06-27 09:22:01',NULL),(2,1,1,'mIqXF473KFK6P4uHbF4sCvc','Dmitriy Lox','markableglushko@yandex.com','ZmFmNGIzOWM1NDJmNWYxZGM3NWFiNDE3ODk5NzlhMTkxNTM4OGFmMmU2MDc1NmEyYTU=','e60756a2a5','2019-06-27 11:53:26',NULL),(3,1,1,'wCr1Li4sUvmER2yV0WIXQmO','Ivan','ivan@test.ru','OGQ2NDI5MmY3OTYyMTdkODM1ZTI0NDI2YmM1MjNkNmY4ODAyZmU4YzI4YjU1NTcyYWE=','28b55572aa','2019-06-28 11:06:40',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_first_div_tournament_table`
--

DROP TABLE IF EXISTS `v_first_div_tournament_table`;
/*!50001 DROP VIEW IF EXISTS `v_first_div_tournament_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_first_div_tournament_table` AS SELECT 
 1 AS `name_division`,
 1 AS `id_division`,
 1 AS `team_name`,
 1 AS `id_team`,
 1 AS `games`,
 1 AS `wins`,
 1 AS `draws`,
 1 AS `losses`,
 1 AS `goals_scored`,
 1 AS `goals_conceded`,
 1 AS `sc_con`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_high_div_tournament_table`
--

DROP TABLE IF EXISTS `v_high_div_tournament_table`;
/*!50001 DROP VIEW IF EXISTS `v_high_div_tournament_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_high_div_tournament_table` AS SELECT 
 1 AS `name_division`,
 1 AS `id_division`,
 1 AS `team_name`,
 1 AS `id_team`,
 1 AS `games`,
 1 AS `wins`,
 1 AS `draws`,
 1 AS `losses`,
 1 AS `goals_scored`,
 1 AS `goals_conceded`,
 1 AS `sc_con`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_matches`
--

DROP TABLE IF EXISTS `v_matches`;
/*!50001 DROP VIEW IF EXISTS `v_matches`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_matches` AS SELECT 
 1 AS `id_match`,
 1 AS `name_division`,
 1 AS `id_division`,
 1 AS `id_tour`,
 1 AS `team_home`,
 1 AS `goal_home`,
 1 AS `goal_guest`,
 1 AS `team_guest`,
 1 AS `m_date`,
 1 AS `name_stadium`,
 1 AS `staff_name`,
 1 AS `transfer`,
 1 AS `logo_home`,
 1 AS `logo_guest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_players_in_matche`
--

DROP TABLE IF EXISTS `v_players_in_matche`;
/*!50001 DROP VIEW IF EXISTS `v_players_in_matche`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_players_in_matche` AS SELECT 
 1 AS `id_match`,
 1 AS `id_division`,
 1 AS `id_tour`,
 1 AS `id_player`,
 1 AS `name`,
 1 AS `number`,
 1 AS `team_name`,
 1 AS `count_goals`,
 1 AS `count_assist`,
 1 AS `yellow`,
 1 AS `red`,
 1 AS `penalty`,
 1 AS `penalty_out`,
 1 AS `own_goal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_squad`
--

DROP TABLE IF EXISTS `v_squad`;
/*!50001 DROP VIEW IF EXISTS `v_squad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_squad` AS SELECT 
 1 AS `id_player`,
 1 AS `team_name`,
 1 AS `id_team`,
 1 AS `name`,
 1 AS `name_amplua`,
 1 AS `birthdate`,
 1 AS `number`,
 1 AS `games`,
 1 AS `goal`,
 1 AS `penalty`,
 1 AS `assist`,
 1 AS `yellow_card`,
 1 AS `red_card`,
 1 AS `photo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tournament_table`
--

DROP TABLE IF EXISTS `v_tournament_table`;
/*!50001 DROP VIEW IF EXISTS `v_tournament_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_tournament_table` AS SELECT 
 1 AS `name_division`,
 1 AS `id_division`,
 1 AS `team_name`,
 1 AS `id_team`,
 1 AS `games`,
 1 AS `wins`,
 1 AS `draws`,
 1 AS `losses`,
 1 AS `goals_scored`,
 1 AS `goals_conceded`,
 1 AS `sc_con`,
 1 AS `points`,
 1 AS `logo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'football_main'
--

--
-- Dumping routines for database 'football_main'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertMatches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMatches`( in division int,
								in tour int,
                                in t_home varchar(50),
                                in g_home int,
                                in g_guest int,
                                in t_guest varchar(50),
                                in date_m datetime,
                                in staff varchar(50),
                                in stadium varchar(50),
                                in trans varchar(50)
								)
begin 

/*	declare d_m datetime;

	if date_m is not null then
		set d_m = date_format(date_m,'%Y-%m-%d %H:%i');  
	end if;*/

	if g_home is null or g_guest is null then 
		
        if stadium is null then
			insert into matches 
			set id_season = (select id_season from sesons where curdate() between year_start and year_end),
				id_division = division, 
				id_tour = tour,
				team_home = (select id_team from teams where team_name = t_home),
				team_guest = (select id_team from teams where team_name = t_guest);
        else
			insert into matches 
			set id_season = (select id_season from sesons where curdate() between year_start and year_end),
				id_division = division, 
				id_tour = tour,
				team_home = (select id_team from teams where team_name = t_home),
				team_guest = (select id_team from teams where team_name = t_guest),
				m_date = date_m,
				id_stadium = (select id_stadium from stadiums where name_stadium = stadium);
        end if;
        

    end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertStaff`(in name_ref varchar(70) )
begin 
	
    declare f int default 0; #переменная для проверки условия
    
    select count(1)
     into f
    from staff
     where staff_name like name_ref;
     
     if f = 0 then
		insert into staff
        set staff_name = name_ref, id_pos = 3;
	 else
		select 'This name have already exiat' as waring;
        #SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: This name have already exist';
     end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insPlayerInMatche` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insPlayerInMatche`(
	in t_home varchar(50),
    in t_guest varchar(50),
    in tour int,
    in name_player varchar(50),
    in t_player varchar(50),
    in goals int,
    in assists int,
    in c_yellow int,
    in c_red int,
    in l_penalty int,
    in l_penalty_out int,
    in l_own_goal int)
begin
	declare l_id_match int;
    declare l_id_player int;
	declare f int;
    declare f_2 int default 0;
    #вытаскиваем id матча
    select id_match
     into l_id_match
    from v_matches
    where team_home like t_home and team_guest like t_guest and id_tour = tour;
    #вытаскиваем кол-во. Если 1 то вытаскиваем игрока просто по имени, если нет то вытаскиваем и с командой
    select count(1)
     into f
	from players 
    where name like name_player;
    
    if f > 1 then 
		select id_player
         into l_id_player
        from players
        where name like name_player and id_team = (select id_team from teams where team_name like t_player);
        
		select count(1)
		 into f_2
        from players_in_match pm, v_matches m
        where pm.id_match = m.id_match
        and m.id_tour = tour
        and m.team_home = t_home
        and m.team_guest = t_guest
        and pm.id_player = l_id_player;
        
        
    else 
		select id_player
		 into l_id_player
		from players 
        where name like name_player;
        
    end if;
    
    if l_id_player is null then 
		insert into players
        set name = name_player, id_team = 36;
        
        select id_player
         into l_id_player
        from players
        where name = name_player;
	end if;
    #добавляем игрока
    if f_2 <> 1 then 
		insert into players_in_match
		set id_match = l_id_match,
			id_player = l_id_player,
			count_goals = goals,
			count_assist = assists,
			yellow = c_yellow,
			red = c_red,
			penalty = l_penalty,
			penalty_out = l_penalty_out,
			own_goal = l_own_goal;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insPlayerInMatche2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insPlayerInMatche2`(
	in t_home varchar(50),
    in t_guest varchar(50),
    in tour int,
    in name_player varchar(50),
    in t_player varchar(50),
    in goals int,
    in assists int,
    in c_yellow int,
    in c_red int,
    in l_penalty int,
    in l_penalty_out int,
    in l_own_goal int)
begin
	declare l_id_match int;
    declare l_id_player int;
	declare f int;
    declare f_2 int default 0;
    #вытаскиваем id матча
    select id_match
     into l_id_match
    from v_matches
    where team_home like t_home and team_guest like t_guest and id_tour = tour;
    #вытаскиваем игрока
    select id_player
     into l_id_player
	from players
     where name = name_player;
    #добавляем игрока в матч
    if l_id_player is not null then 
		insert into players_in_match
			set id_match = l_id_match,
				id_player = l_id_player,
				count_goals = goals,
				count_assist = assists,
				yellow = c_yellow,
				red = c_red,
				penalty = l_penalty,
				penalty_out = l_penalty_out,
				own_goal = l_own_goal;
	else 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Player is not found';
        
        insert into players
        set name = name_player, id_team = 36;
        
        select id_player
         into l_id_player
        from players
        where name = name_player;
        
        insert into players_in_match
			set id_match = l_id_match,
				id_player = l_id_player,
				count_goals = goals,
				count_assist = assists,
				yellow = c_yellow,
				red = c_red,
				penalty = l_penalty,
				penalty_out = l_penalty_out,
				own_goal = l_own_goal;
    end if;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_first_div_tournament_table`
--

/*!50001 DROP VIEW IF EXISTS `v_first_div_tournament_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_first_div_tournament_table` AS select `d`.`name_division` AS `name_division`,`tt`.`id_division` AS `id_division`,`t`.`team_name` AS `team_name`,`tt`.`id_team` AS `id_team`,`tt`.`games` AS `games`,`tt`.`wins` AS `wins`,`tt`.`draws` AS `draws`,`tt`.`losses` AS `losses`,`tt`.`goals_scored` AS `goals_scored`,`tt`.`goals_conceded` AS `goals_conceded`,(`tt`.`goals_scored` - `tt`.`goals_conceded`) AS `sc_con`,`tt`.`points` AS `points` from ((`tournament_table` `tt` join `teams` `t`) join `divisions` `d`) where ((`tt`.`id_team` = `t`.`id_team`) and (`tt`.`id_division` = `d`.`id_division`) and (`d`.`id_division` = 2)) order by `tt`.`points` desc,(`tt`.`goals_scored` - `tt`.`goals_conceded`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_high_div_tournament_table`
--

/*!50001 DROP VIEW IF EXISTS `v_high_div_tournament_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_high_div_tournament_table` AS select `d`.`name_division` AS `name_division`,`tt`.`id_division` AS `id_division`,`t`.`team_name` AS `team_name`,`tt`.`id_team` AS `id_team`,`tt`.`games` AS `games`,`tt`.`wins` AS `wins`,`tt`.`draws` AS `draws`,`tt`.`losses` AS `losses`,`tt`.`goals_scored` AS `goals_scored`,`tt`.`goals_conceded` AS `goals_conceded`,(`tt`.`goals_scored` - `tt`.`goals_conceded`) AS `sc_con`,`tt`.`points` AS `points` from ((`tournament_table` `tt` join `teams` `t`) join `divisions` `d`) where ((`tt`.`id_team` = `t`.`id_team`) and (`tt`.`id_division` = `d`.`id_division`) and (`d`.`id_division` = 1)) order by `tt`.`points` desc,(`tt`.`goals_scored` - `tt`.`goals_conceded`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_matches`
--

/*!50001 DROP VIEW IF EXISTS `v_matches`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_matches` AS select `m`.`id_match` AS `id_match`,`d`.`name_division` AS `name_division`,`d`.`id_division` AS `id_division`,`m`.`id_tour` AS `id_tour`,`th`.`team_name` AS `team_home`,`m`.`goal_home` AS `goal_home`,`m`.`goal_guest` AS `goal_guest`,`tg`.`team_name` AS `team_guest`,`m`.`m_date` AS `m_date`,`s`.`name_stadium` AS `name_stadium`,`st`.`staff_name` AS `staff_name`,`m`.`transfer` AS `transfer`,`th`.`logo` AS `logo_home`,`tg`.`logo` AS `logo_guest` from (((((`matches` `m` join `teams` `th` on((`th`.`id_team` = `m`.`team_home`))) join `teams` `tg` on((`tg`.`id_team` = `m`.`team_guest`))) left join `stadiums` `s` on((`s`.`id_stadium` = `m`.`id_stadium`))) left join `divisions` `d` on((`d`.`id_division` = `m`.`id_division`))) left join `staff` `st` on((`st`.`id_staff` = `m`.`id_referee`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_players_in_matche`
--

/*!50001 DROP VIEW IF EXISTS `v_players_in_matche`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_players_in_matche` AS select `pm`.`id_match` AS `id_match`,`m`.`id_division` AS `id_division`,`m`.`id_tour` AS `id_tour`,`p`.`id_player` AS `id_player`,`p`.`name` AS `name`,`p`.`number` AS `number`,`t`.`team_name` AS `team_name`,`pm`.`count_goals` AS `count_goals`,`pm`.`count_assist` AS `count_assist`,`pm`.`yellow` AS `yellow`,`pm`.`red` AS `red`,`pm`.`penalty` AS `penalty`,`pm`.`penalty_out` AS `penalty_out`,`pm`.`own_goal` AS `own_goal` from (((`players_in_match` `pm` join `players` `p` on((`p`.`id_player` = `pm`.`id_player`))) join `matches` `m` on((`m`.`id_match` = `pm`.`id_match`))) join `teams` `t` on((`t`.`id_team` = `p`.`id_team`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_squad`
--

/*!50001 DROP VIEW IF EXISTS `v_squad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_squad` AS select `p`.`id_player` AS `id_player`,`t`.`team_name` AS `team_name`,`t`.`id_team` AS `id_team`,`p`.`name` AS `name`,`a`.`name_amplua` AS `name_amplua`,`p`.`birthdate` AS `birthdate`,`p`.`number` AS `number`,`ps`.`games` AS `games`,(`ps`.`goal` + `ps`.`penalty`) AS `goal`,`ps`.`penalty` AS `penalty`,`ps`.`assist` AS `assist`,`ps`.`yellow_card` AS `yellow_card`,`ps`.`red_card` AS `red_card`,`p`.`photo` AS `photo` from (((`players` `p` join `teams` `t`) join `players_statistics` `ps`) join `amplua` `a`) where ((`p`.`id_team` = `t`.`id_team`) and (`p`.`id_player` = `ps`.`id_player`) and (`p`.`id_amplua` = `a`.`id_amplua`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tournament_table`
--

/*!50001 DROP VIEW IF EXISTS `v_tournament_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tournament_table` AS select `d`.`name_division` AS `name_division`,`tt`.`id_division` AS `id_division`,`t`.`team_name` AS `team_name`,`tt`.`id_team` AS `id_team`,`tt`.`games` AS `games`,`tt`.`wins` AS `wins`,`tt`.`draws` AS `draws`,`tt`.`losses` AS `losses`,`tt`.`goals_scored` AS `goals_scored`,`tt`.`goals_conceded` AS `goals_conceded`,(`tt`.`goals_scored` - `tt`.`goals_conceded`) AS `sc_con`,`tt`.`points` AS `points`,`t`.`logo` AS `logo` from ((`tournament_table` `tt` join `teams` `t`) join `divisions` `d`) where ((`tt`.`id_team` = `t`.`id_team`) and (`tt`.`id_division` = `d`.`id_division`)) order by `tt`.`points` desc,(`tt`.`goals_scored` - `tt`.`goals_conceded`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 22:18:43
