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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 22:13:21
