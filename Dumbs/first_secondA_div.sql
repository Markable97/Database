-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: football_main_realese
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amplua`
--

LOCK TABLES `amplua` WRITE;
/*!40000 ALTER TABLE `amplua` DISABLE KEYS */;
INSERT INTO `amplua` VALUES (5,'Вратарь'),(6,'Защитник'),(7,'Полузащитник'),(8,'Нападающий');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dayofmatch`
--

DROP TABLE IF EXISTS `dayofmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dayofmatch` (
  `match_date` date NOT NULL,
  `id_stadium` int(11) NOT NULL,
  `match_time` time(1) NOT NULL,
  `id_match` int(11) DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `id_division` int(11) DEFAULT NULL,
  `id_tour` int(11) DEFAULT NULL,
  `busy_time` int(1) DEFAULT '0',
  PRIMARY KEY (`match_time`,`id_stadium`,`match_date`),
  KEY `fk_dayOfMatch_matches1_idx` (`id_match`,`id_season`,`id_division`,`id_tour`),
  KEY `fk_dayOfMatch_stadiums1_idx` (`id_stadium`),
  CONSTRAINT `fk_dayOfMatch_matches1` FOREIGN KEY (`id_match`, `id_season`, `id_division`, `id_tour`) REFERENCES `matches` (`id_match`, `id_season`, `id_division`, `id_tour`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_dayOfMatch_stadiums1` FOREIGN KEY (`id_stadium`) REFERENCES `stadiums` (`id_stadium`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dayofmatch`
--

LOCK TABLES `dayofmatch` WRITE;
/*!40000 ALTER TABLE `dayofmatch` DISABLE KEYS */;
INSERT INTO `dayofmatch` VALUES ('2019-08-17',5,'09:30:00.0',4399,NULL,6,7,1),('2019-08-17',6,'09:30:00.0',2864,NULL,4,1,1),('2019-08-24',7,'10:00:00.0',2885,NULL,4,2,1),('2019-08-24',8,'10:00:00.0',2877,NULL,4,2,1),('2019-08-17',5,'10:40:00.0',488,NULL,2,1,1),('2019-08-17',6,'10:40:00.0',489,NULL,2,1,1),('2019-08-18',5,'11:10:00.0',872,NULL,3,1,1),('2019-08-25',5,'11:10:00.0',503,NULL,2,2,1),('2019-08-18',6,'11:10:00.0',871,NULL,3,1,1),('2019-08-25',6,'11:10:00.0',2106,NULL,5,1,1),('2019-08-24',7,'11:10:00.0',2109,NULL,5,2,1),('2019-08-24',8,'11:10:00.0',4106,NULL,6,2,1),('2019-08-17',5,'11:50:00.0',490,NULL,2,1,1),('2019-08-17',6,'11:50:00.0',2865,NULL,4,1,1),('2019-08-18',5,'12:20:00.0',2869,NULL,4,1,1),('2019-08-25',5,'12:20:00.0',2879,NULL,4,2,1),('2019-08-26',5,'12:20:00.0',NULL,NULL,NULL,NULL,0),('2019-08-18',6,'12:20:00.0',4096,NULL,6,1,1),('2019-08-25',6,'12:20:00.0',4107,NULL,6,2,1),('2019-08-26',6,'12:20:00.0',NULL,NULL,NULL,NULL,0),('2019-08-24',7,'12:20:00.0',889,NULL,3,2,1),('2019-08-24',8,'12:20:00.0',2108,NULL,5,2,1),('2019-08-17',5,'13:00:00.0',868,NULL,3,1,1),('2019-08-17',6,'13:00:00.0',869,NULL,3,1,1),('2019-08-18',5,'13:30:00.0',491,NULL,2,1,1),('2019-08-25',5,'13:30:00.0',2881,NULL,4,2,1),('2019-08-26',5,'13:30:00.0',0,NULL,2,0,0),('2019-08-18',6,'13:30:00.0',2099,NULL,5,1,1),('2019-08-25',6,'13:30:00.0',2113,NULL,5,2,1),('2019-08-26',6,'13:30:00.0',NULL,NULL,NULL,NULL,0),('2019-08-26',7,'13:30:00.0',NULL,NULL,NULL,NULL,0),('2019-08-26',8,'13:30:00.0',NULL,NULL,NULL,NULL,0),('2019-08-25',7,'13:50:00.0',886,NULL,3,2,1),('2019-08-25',8,'13:50:00.0',2112,NULL,5,2,1),('2019-08-17',5,'14:10:00.0',870,NULL,3,1,1),('2019-08-17',6,'14:10:00.0',2096,NULL,5,1,1),('2019-08-18',5,'14:40:00.0',492,NULL,2,1,1),('2019-08-25',5,'14:40:00.0',499,NULL,2,2,1),('2019-08-18',6,'14:40:00.0',2873,NULL,4,1,1),('2019-08-25',6,'14:40:00.0',4108,NULL,6,2,1),('2019-08-26',7,'14:40:00.0',0,NULL,2,0,0),('2019-08-26',8,'14:40:00.0',0,NULL,2,0,0),('2019-08-25',7,'15:00:00.0',888,NULL,3,2,1),('2019-08-25',8,'15:00:00.0',2111,NULL,5,2,1),('2019-08-17',5,'15:20:00.0',2098,NULL,5,1,1),('2019-08-17',6,'15:20:00.0',2097,NULL,5,1,1),('2019-08-18',5,'15:50:00.0',2870,NULL,4,1,1),('2019-08-24',5,'15:50:00.0',4400,NULL,1,1,1),('2019-08-25',5,'15:50:00.0',4401,NULL,1,1,1),('2019-08-26',5,'15:50:00.0',4408,NULL,1,2,1),('2019-08-18',6,'15:50:00.0',873,NULL,3,1,1),('2019-08-24',6,'15:50:00.0',882,NULL,3,2,1),('2019-08-25',6,'15:50:00.0',502,NULL,2,2,1),('2019-08-26',6,'15:50:00.0',4407,NULL,1,2,1),('2019-08-18',7,'16:10:00.0',4098,NULL,6,1,1),('2019-08-25',7,'16:10:00.0',2878,NULL,4,2,1),('2019-08-18',8,'16:10:00.0',4097,NULL,6,1,1),('2019-08-25',8,'16:10:00.0',881,NULL,3,2,1),('2019-08-17',5,'16:30:00.0',2866,NULL,4,1,1),('2019-08-17',6,'16:30:00.0',NULL,NULL,NULL,NULL,0),('2019-08-18',5,'17:00:00.0',493,NULL,2,1,1),('2019-08-24',5,'17:00:00.0',887,NULL,3,2,1),('2019-08-25',5,'17:00:00.0',4402,NULL,1,1,1),('2019-08-18',6,'17:00:00.0',494,NULL,2,1,1),('2019-08-24',6,'17:00:00.0',2876,NULL,4,2,1),('2019-08-25',6,'17:00:00.0',506,NULL,2,2,1),('2019-08-18',7,'17:20:00.0',2871,NULL,4,1,1),('2019-08-25',7,'17:20:00.0',2880,NULL,4,2,1),('2019-08-18',8,'17:20:00.0',2872,NULL,4,1,1),('2019-08-25',8,'17:20:00.0',884,NULL,3,2,1),('2019-08-17',5,'17:40:00.0',2867,NULL,4,1,1),('2019-08-17',6,'17:40:00.0',2868,NULL,4,1,1),('2019-08-18',5,'18:10:00.0',874,NULL,3,1,1),('2019-08-24',5,'18:10:00.0',498,NULL,2,2,1),('2019-08-25',5,'18:10:00.0',4403,NULL,1,1,1),('2019-08-18',6,'18:10:00.0',495,NULL,2,1,1),('2019-08-24',6,'18:10:00.0',504,NULL,2,2,1),('2019-08-25',6,'18:10:00.0',500,NULL,2,2,1),('2019-08-18',7,'18:30:00.0',875,NULL,3,1,1),('2019-08-25',7,'18:30:00.0',880,NULL,3,2,1),('2019-08-18',8,'18:30:00.0',4099,NULL,6,1,1),('2019-08-25',8,'18:30:00.0',4104,NULL,6,2,1),('2019-08-17',5,'18:50:00.0',4095,NULL,6,1,1),('2019-08-17',6,'18:50:00.0',4094,NULL,6,1,1),('2019-08-18',5,'19:20:00.0',497,NULL,2,1,1),('2019-08-24',5,'19:20:00.0',883,NULL,3,2,1),('2019-08-25',5,'19:20:00.0',4413,NULL,1,2,1),('2019-08-18',6,'19:20:00.0',496,NULL,2,1,1),('2019-08-24',6,'19:20:00.0',2114,NULL,5,2,1),('2019-08-25',6,'19:20:00.0',885,NULL,3,2,1),('2019-08-18',7,'19:40:00.0',2100,NULL,5,1,1),('2019-08-25',7,'19:40:00.0',2875,NULL,4,2,1),('2019-08-18',8,'19:40:00.0',4100,NULL,6,1,1),('2019-08-25',8,'19:40:00.0',4109,NULL,6,2,1),('2019-08-18',5,'20:30:00.0',876,NULL,3,1,1),('2019-08-24',5,'20:30:00.0',4103,NULL,6,2,1),('2019-08-25',5,'20:30:00.0',505,NULL,2,2,1),('2019-08-18',6,'20:30:00.0',2101,NULL,5,1,1),('2019-08-24',6,'20:30:00.0',4111,NULL,6,2,1),('2019-08-25',6,'20:30:00.0',507,NULL,2,2,1),('2019-08-18',7,'20:50:00.0',877,NULL,3,1,1),('2019-08-25',7,'20:50:00.0',879,NULL,3,2,1),('2019-08-18',8,'20:50:00.0',2102,NULL,5,9,1),('2019-08-25',8,'20:50:00.0',2883,NULL,4,2,1),('2019-08-18',5,'21:40:00.0',878,NULL,3,1,1),('2019-08-25',5,'21:40:00.0',2882,NULL,4,2,1),('2019-08-18',6,'21:40:00.0',2874,NULL,4,1,1),('2019-08-25',6,'21:40:00.0',4110,NULL,6,2,1),('2019-08-24',5,'22:00:00.0',4421,NULL,1,4,1),('2019-08-24',6,'22:00:00.0',NULL,NULL,NULL,NULL,0),('2019-08-24',7,'22:00:00.0',0,NULL,1,0,0),('2019-08-25',7,'22:00:00.0',2110,NULL,5,2,1),('2019-08-24',8,'22:00:00.0',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `dayofmatch` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_bef_ins_dayofmatch before insert on dayofmatch
for each row
begin
	if new.id_match is not null and new.busy_time is null then 
		set new.busy_time = 1;
    end if;
    if new.id_division is null and new.id_match is not null then 
		set new.id_division = (select id_division
								from matches
                                where id_match = new.id_match);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_aft_ins_dayofmatch after insert on dayofmatch
for each row 
begin 
	if new.id_match is not null then
		update matches 
			set m_date = concat_ws(' ',new.match_date, new.match_time),
				id_stadium = new.id_stadium
		where id_match = new.id_match;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_bef_upd_dayofmatch before update on dayofmatch
for each row
begin
	if new.id_match is not null and new.busy_time is null then 
		set new.busy_time = 1;
    end if;
    if new.id_division is null and new.id_match is not null then 
		set new.id_division = (select id_division
								from matches
                                where id_match = new.id_match);
    end if;
    if new.id_match is null then 
		set new.id_division = null;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_aft_upd_dayofmatch after update on dayofmatch
for each row 
begin 
	if new.id_match is not null then
		update matches 
			set m_date = concat_ws(' ',old.match_date, old.match_time),
				id_stadium = old.id_stadium
		where id_match = new.id_match;
    end if;
    if new.id_match = 0 and old.id_match is not null then 
		update matches
			set m_date = null,
				id_stadium = null
        where id_match = old.id_match;    
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `debug_ins`
--

DROP TABLE IF EXISTS `debug_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debug_ins` (
  `mess` varchar(100) DEFAULT NULL,
  `iter` int(11) DEFAULT NULL,
  `id_1` int(11) DEFAULT NULL,
  `id_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debug_ins`
--

LOCK TABLES `debug_ins` WRITE;
/*!40000 ALTER TABLE `debug_ins` DISABLE KEYS */;
/*!40000 ALTER TABLE `debug_ins` ENABLE KEYS */;
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
  `played` int(1) DEFAULT NULL,
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
  CONSTRAINT `fk_matches_teams1` FOREIGN KEY (`team_home`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_matches_teams2` FOREIGN KEY (`team_guest`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (11,4,2,1,19,2,2,26,NULL,NULL,38,NULL,1),(12,4,2,1,25,3,4,21,NULL,NULL,38,NULL,1),(13,4,2,1,16,1,1,30,NULL,NULL,39,NULL,1),(14,4,2,1,32,2,7,15,NULL,NULL,40,NULL,1),(15,4,2,1,24,3,0,20,NULL,NULL,41,NULL,1),(16,4,2,1,18,8,4,29,NULL,NULL,40,NULL,1),(17,4,2,1,34,0,1,23,NULL,NULL,40,NULL,1),(18,4,2,1,33,1,3,28,NULL,NULL,38,NULL,1),(19,4,2,1,27,5,0,31,NULL,NULL,42,'Техническое поражение',1),(20,4,2,1,17,8,2,22,NULL,NULL,39,NULL,1),(21,4,2,2,22,2,2,26,NULL,NULL,39,NULL,1),(22,4,2,2,31,1,5,17,NULL,NULL,39,NULL,1),(23,4,2,2,28,3,2,27,NULL,NULL,45,NULL,1),(24,4,2,2,23,3,3,33,NULL,NULL,44,'Перенос Морс',1),(25,4,2,2,29,4,3,34,NULL,NULL,44,NULL,1),(26,4,2,2,20,2,3,18,NULL,NULL,39,NULL,1),(27,4,2,2,15,12,1,24,NULL,NULL,44,NULL,1),(28,4,2,2,30,2,4,32,NULL,NULL,38,NULL,1),(29,4,2,2,21,1,3,16,NULL,NULL,45,NULL,1),(30,4,2,2,19,6,4,25,NULL,NULL,45,NULL,1),(31,4,2,3,26,1,2,25,NULL,NULL,47,NULL,1),(32,4,2,3,16,3,3,19,NULL,NULL,47,NULL,1),(33,4,2,3,32,3,3,21,NULL,NULL,45,NULL,1),(34,4,2,3,24,2,2,30,NULL,NULL,44,NULL,1),(35,4,2,3,18,2,3,15,NULL,NULL,40,NULL,1),(36,4,2,3,34,0,0,20,NULL,NULL,NULL,'Перенос Витязь',0),(37,4,2,3,33,2,3,29,NULL,NULL,41,NULL,1),(38,4,2,3,27,0,0,23,NULL,NULL,NULL,'Перенос ВиНК',0),(39,4,2,3,17,4,0,28,NULL,NULL,38,NULL,1),(40,4,2,3,22,6,5,31,NULL,NULL,47,NULL,1),(41,4,2,4,31,2,3,26,NULL,NULL,47,NULL,1),(42,4,2,4,28,0,0,22,NULL,NULL,NULL,'Перенос Гарант',0),(43,4,2,4,23,1,8,17,NULL,NULL,45,NULL,1),(44,4,2,4,29,2,4,27,NULL,NULL,39,NULL,1),(45,4,2,4,20,6,3,33,NULL,NULL,47,NULL,1),(46,4,2,4,15,6,0,34,NULL,NULL,45,NULL,1),(47,4,2,4,30,1,4,18,NULL,NULL,40,NULL,1),(48,4,2,4,21,5,4,24,NULL,NULL,44,NULL,1),(49,4,2,4,19,4,2,32,NULL,NULL,38,NULL,1),(50,4,2,4,25,1,6,16,NULL,NULL,41,NULL,1),(51,4,2,5,26,1,5,16,NULL,NULL,38,NULL,1),(52,4,2,5,32,2,1,25,NULL,NULL,47,NULL,1),(53,4,2,5,24,2,8,19,NULL,NULL,39,NULL,1),(54,4,2,5,18,1,1,21,NULL,NULL,38,NULL,1),(55,4,2,5,34,0,2,30,NULL,NULL,39,NULL,1),(56,4,2,5,33,1,9,15,NULL,NULL,39,NULL,1),(57,4,2,5,27,4,2,20,NULL,NULL,45,NULL,1),(58,4,2,5,17,11,2,29,NULL,NULL,45,NULL,1),(59,4,2,5,22,8,4,23,NULL,NULL,53,NULL,1),(60,4,2,5,31,4,4,28,NULL,NULL,47,NULL,1),(61,4,2,6,28,1,4,26,NULL,NULL,39,NULL,1),(62,4,2,6,23,2,5,31,NULL,NULL,40,NULL,1),(63,4,2,6,29,3,8,22,NULL,NULL,54,NULL,1),(64,4,2,6,20,3,2,17,NULL,NULL,40,NULL,1),(65,4,2,6,15,6,2,27,NULL,NULL,40,NULL,1),(66,4,2,6,30,2,3,33,NULL,NULL,38,NULL,1),(67,4,2,6,21,2,0,34,NULL,NULL,45,NULL,1),(68,4,2,6,19,1,3,18,NULL,NULL,45,NULL,1),(69,4,2,6,25,4,4,24,NULL,NULL,53,NULL,1),(70,4,2,6,16,10,0,32,NULL,NULL,54,NULL,1),(71,4,2,7,26,0,0,32,NULL,NULL,NULL,'Перенос Павлино',0),(72,4,2,7,24,2,3,16,NULL,NULL,45,NULL,1),(73,4,2,7,18,6,3,25,NULL,NULL,44,NULL,1),(74,4,2,7,34,2,7,19,NULL,NULL,45,NULL,1),(75,4,2,7,33,1,6,21,NULL,NULL,44,NULL,1),(76,4,2,7,27,0,0,30,NULL,NULL,NULL,'Перенос Колхоз',0),(77,4,2,7,17,7,2,15,NULL,NULL,45,NULL,1),(78,4,2,7,22,3,3,20,NULL,NULL,44,NULL,1),(79,4,2,7,31,2,0,29,NULL,NULL,41,NULL,1),(80,4,2,7,28,1,2,23,NULL,NULL,44,NULL,1),(81,4,2,8,23,6,5,26,NULL,NULL,39,NULL,1),(82,4,2,8,29,4,3,28,NULL,NULL,54,NULL,1),(83,4,2,8,20,6,2,31,NULL,NULL,39,NULL,1),(84,4,2,8,15,5,3,22,NULL,NULL,45,NULL,1),(85,4,2,8,30,4,4,17,NULL,NULL,39,NULL,1),(86,4,2,8,21,2,2,27,NULL,NULL,47,NULL,1),(87,4,2,8,19,5,3,33,NULL,NULL,44,NULL,1),(88,4,2,8,25,6,1,34,NULL,NULL,47,NULL,1),(89,4,2,8,16,0,0,18,NULL,NULL,NULL,'Перенос ЦНДШ',0),(90,4,2,8,32,3,7,24,NULL,NULL,54,NULL,1),(91,4,2,9,26,1,8,24,NULL,NULL,44,NULL,1),(92,4,2,9,18,5,1,32,NULL,NULL,39,NULL,1),(93,4,2,9,34,1,6,16,NULL,NULL,38,NULL,1),(94,4,2,9,33,6,6,25,NULL,NULL,38,NULL,1),(95,4,2,9,27,3,4,19,NULL,NULL,47,NULL,1),(96,4,2,9,17,8,0,21,NULL,NULL,58,NULL,1),(97,4,2,9,22,12,2,30,NULL,NULL,47,NULL,1),(98,4,2,9,31,4,5,15,NULL,NULL,53,NULL,1),(99,4,2,9,28,0,3,20,NULL,NULL,39,NULL,1),(100,4,2,9,23,5,3,29,NULL,NULL,45,NULL,1),(101,4,2,10,29,3,4,26,NULL,NULL,54,NULL,1),(102,4,2,10,20,4,2,23,NULL,NULL,40,NULL,1),(103,4,2,10,15,3,1,28,NULL,NULL,58,NULL,1),(104,4,2,10,30,3,1,31,NULL,NULL,39,NULL,1),(105,4,2,10,21,4,4,22,NULL,NULL,39,NULL,1),(106,4,2,10,19,0,0,17,NULL,NULL,NULL,'Перенос Унион',0),(107,4,2,10,25,3,1,27,NULL,NULL,40,NULL,1),(108,4,2,10,16,5,2,33,NULL,NULL,40,NULL,1),(109,4,2,10,32,6,7,34,NULL,NULL,44,NULL,1),(110,4,2,10,24,0,2,18,NULL,NULL,40,NULL,1),(111,4,2,11,26,1,1,18,NULL,NULL,54,NULL,1),(112,4,2,11,34,2,2,24,NULL,NULL,39,NULL,1),(113,4,2,11,33,4,6,32,NULL,NULL,58,NULL,1),(114,4,2,11,27,2,1,16,NULL,NULL,39,NULL,1),(115,4,2,11,17,4,9,25,NULL,NULL,45,NULL,1),(116,4,2,11,22,7,2,19,NULL,NULL,39,NULL,1),(117,4,2,11,31,3,4,21,NULL,NULL,39,NULL,1),(118,4,2,11,28,6,3,30,NULL,NULL,58,NULL,1),(119,4,2,11,23,2,5,15,NULL,NULL,44,NULL,1),(120,4,2,11,29,4,4,20,NULL,NULL,39,NULL,1),(121,4,3,11,38,0,2,48,NULL,NULL,58,NULL,1),(122,4,3,11,45,0,1,36,NULL,NULL,53,NULL,1),(123,4,3,11,43,5,3,35,NULL,NULL,53,NULL,1),(124,4,3,11,41,1,2,46,NULL,NULL,44,NULL,1),(125,4,3,11,52,3,3,55,NULL,NULL,54,NULL,1),(126,4,3,11,42,5,0,51,NULL,NULL,42,'Техническое поражение',1),(127,4,3,11,49,2,3,47,NULL,NULL,53,NULL,1),(128,4,3,11,37,2,1,44,NULL,NULL,45,NULL,1),(129,4,3,11,39,6,5,50,NULL,NULL,39,NULL,1),(130,4,3,11,54,3,3,53,NULL,NULL,44,NULL,1),(131,4,3,11,40,9,1,56,NULL,NULL,39,NULL,1),(132,4,3,1,53,0,11,35,NULL,NULL,43,NULL,1),(133,4,3,1,40,1,3,45,NULL,NULL,44,NULL,1),(134,4,3,1,44,4,3,51,NULL,NULL,45,NULL,1),(135,4,3,1,39,4,1,42,NULL,NULL,43,NULL,1),(136,4,3,1,49,1,3,52,NULL,NULL,39,NULL,1),(137,4,3,1,56,3,5,37,NULL,NULL,45,NULL,1),(138,4,3,1,47,1,1,46,NULL,NULL,46,NULL,1),(139,4,3,1,38,2,1,43,NULL,NULL,46,NULL,1),(140,4,3,1,54,1,10,41,NULL,NULL,44,NULL,1),(141,4,3,1,50,5,1,55,NULL,NULL,40,NULL,1),(142,4,3,1,48,5,9,36,NULL,NULL,44,NULL,1),(143,4,3,2,45,1,0,37,NULL,NULL,43,NULL,1),(144,4,3,2,43,7,3,40,NULL,NULL,39,NULL,1),(145,4,3,2,36,5,1,53,NULL,NULL,53,NULL,1),(146,4,3,2,55,2,3,44,NULL,NULL,44,NULL,1),(147,4,3,2,42,1,4,49,NULL,NULL,39,NULL,1),(148,4,3,2,51,8,6,39,NULL,NULL,39,NULL,1),(149,4,3,2,46,2,2,50,NULL,NULL,45,NULL,1),(150,4,3,2,41,3,1,38,NULL,NULL,39,NULL,1),(151,4,3,2,56,2,3,48,NULL,NULL,41,NULL,1),(152,4,3,2,35,10,4,47,NULL,NULL,41,NULL,1),(154,4,3,2,52,4,3,54,NULL,NULL,41,'нет игроков',NULL),(155,4,3,3,39,6,3,55,NULL,NULL,40,NULL,1),(156,4,3,3,49,3,5,51,NULL,NULL,45,NULL,1),(157,4,3,3,40,4,2,41,NULL,NULL,44,NULL,1),(158,4,3,3,45,3,3,43,NULL,NULL,38,NULL,1),(159,4,3,3,44,3,3,46,NULL,NULL,44,NULL,1),(160,4,3,3,37,5,4,48,NULL,NULL,38,NULL,1),(161,4,3,3,38,7,2,52,NULL,NULL,47,NULL,1),(162,4,3,3,54,4,4,42,NULL,NULL,45,NULL,1),(163,4,3,3,50,1,10,35,NULL,NULL,44,NULL,1),(164,4,3,3,53,6,1,56,NULL,NULL,45,NULL,1),(165,4,3,3,47,1,2,36,NULL,NULL,38,NULL,1),(166,4,3,4,55,2,6,49,NULL,NULL,53,NULL,1),(167,4,3,4,46,2,4,39,NULL,NULL,39,NULL,1),(168,4,3,4,43,0,3,37,NULL,NULL,44,NULL,1),(169,4,3,4,41,5,2,45,NULL,NULL,53,NULL,1),(170,4,3,4,35,10,3,44,NULL,NULL,40,NULL,1),(171,4,3,4,56,2,3,47,NULL,NULL,54,NULL,1),(172,4,3,4,48,4,2,53,NULL,NULL,40,NULL,1),(173,4,3,4,36,3,1,50,NULL,NULL,38,NULL,1),(174,4,3,4,51,5,5,54,NULL,NULL,53,NULL,1),(175,4,3,4,42,3,0,38,NULL,NULL,39,NULL,1),(176,4,3,4,52,5,5,40,NULL,NULL,53,'нет игроков',NULL),(177,4,3,5,39,0,1,35,NULL,NULL,39,NULL,1),(178,4,3,5,49,1,3,46,NULL,NULL,38,NULL,1),(179,4,3,5,37,1,1,53,NULL,NULL,41,NULL,1),(180,4,3,5,50,8,2,56,NULL,NULL,44,NULL,1),(181,4,3,5,40,3,4,42,NULL,NULL,47,NULL,1),(182,4,3,5,45,9,0,52,NULL,NULL,40,NULL,1),(183,4,3,5,43,1,4,41,NULL,NULL,41,NULL,1),(184,4,3,5,47,3,2,48,NULL,NULL,39,NULL,1),(185,4,3,5,44,0,5,36,NULL,NULL,53,NULL,1),(186,4,3,5,38,5,0,51,NULL,NULL,53,NULL,1),(187,4,3,5,54,2,7,55,NULL,NULL,39,NULL,1),(188,4,3,6,35,4,1,49,NULL,NULL,53,NULL,1),(189,4,3,6,36,3,1,39,NULL,NULL,53,NULL,1),(190,4,3,6,48,6,1,50,NULL,NULL,54,NULL,1),(191,4,3,6,41,3,6,37,NULL,NULL,38,NULL,1),(192,4,3,6,52,0,5,43,NULL,NULL,42,'Техническое поражение',1),(193,4,3,6,42,5,5,45,NULL,NULL,44,NULL,1),(194,4,3,6,51,3,7,40,NULL,NULL,53,NULL,1),(195,4,3,6,46,2,2,54,NULL,NULL,45,NULL,1),(196,4,3,6,55,1,5,38,NULL,NULL,54,NULL,1),(197,4,3,6,53,0,0,47,NULL,NULL,NULL,'Перенос Восход',0),(198,4,3,6,56,1,3,44,NULL,NULL,44,NULL,1),(199,4,3,7,49,2,3,36,NULL,NULL,39,NULL,1),(200,4,3,7,40,3,0,55,NULL,NULL,47,NULL,1),(201,4,3,7,45,5,4,51,NULL,NULL,47,NULL,1),(202,4,3,7,43,4,2,42,NULL,NULL,53,NULL,1),(203,4,3,7,41,0,0,52,NULL,NULL,NULL,'',0),(204,4,3,7,37,6,3,47,NULL,NULL,53,NULL,1),(205,4,3,7,38,2,1,46,NULL,NULL,45,NULL,1),(206,4,3,7,54,3,14,35,NULL,NULL,39,NULL,1),(207,4,3,7,39,8,4,56,NULL,NULL,44,NULL,1),(208,4,3,7,50,3,3,53,NULL,NULL,53,NULL,1),(209,4,3,7,44,3,1,48,NULL,NULL,39,NULL,1),(210,4,3,8,52,1,3,37,NULL,NULL,45,NULL,1),(211,4,3,8,42,0,0,41,NULL,NULL,39,NULL,1),(212,4,3,8,51,3,5,43,NULL,NULL,45,NULL,1),(213,4,3,8,55,6,6,45,NULL,NULL,46,NULL,1),(214,4,3,8,46,2,5,40,NULL,NULL,39,NULL,1),(215,4,3,8,53,3,3,44,NULL,NULL,46,NULL,1),(216,4,3,8,48,1,2,39,NULL,NULL,53,NULL,1),(217,4,3,8,56,0,3,49,NULL,NULL,53,NULL,1),(218,4,3,8,36,4,1,54,NULL,NULL,39,NULL,1),(219,4,3,8,35,8,5,38,NULL,NULL,54,NULL,1),(220,4,3,8,47,3,2,50,NULL,NULL,39,NULL,1),(221,4,3,9,37,3,0,50,NULL,NULL,39,NULL,1),(222,4,3,9,39,3,1,53,NULL,NULL,44,NULL,1),(223,4,3,9,54,5,4,56,NULL,NULL,39,NULL,1),(224,4,3,9,40,3,5,35,NULL,NULL,44,NULL,1),(225,4,3,9,45,0,5,46,NULL,NULL,45,NULL,1),(226,4,3,9,43,3,3,55,NULL,NULL,47,NULL,1),(227,4,3,9,41,7,4,51,NULL,NULL,53,NULL,1),(228,4,3,9,52,1,2,42,NULL,NULL,47,NULL,1),(229,4,3,9,49,1,1,48,NULL,NULL,39,NULL,1),(230,4,3,9,38,3,1,36,NULL,NULL,44,NULL,1),(231,4,3,9,44,2,1,47,NULL,NULL,44,NULL,1),(232,4,3,10,48,3,3,54,NULL,NULL,39,NULL,1),(233,4,3,10,53,2,2,49,NULL,NULL,40,NULL,1),(234,4,3,10,42,3,2,37,NULL,NULL,44,NULL,1),(235,4,3,10,51,4,0,52,NULL,NULL,53,NULL,1),(236,4,3,10,55,2,9,41,NULL,NULL,53,NULL,1),(237,4,3,10,46,2,4,43,NULL,NULL,38,NULL,1),(238,4,3,10,35,8,3,45,NULL,NULL,40,NULL,1),(239,4,3,10,36,2,3,40,NULL,NULL,53,NULL,1),(240,4,3,10,56,1,7,38,NULL,NULL,45,NULL,1),(241,4,3,10,47,4,3,39,NULL,NULL,58,NULL,1),(242,4,3,10,50,4,3,44,NULL,NULL,39,NULL,1);
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
if goal_h is not null and new.id_referee is not null then 

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
/*Если матч сыгран и надо поменять данные, иначе все как было*/
if new.played = 1 then 

	if (goal_h > goal_v and old.goal_home > old.goal_guest) or (goal_h < goal_v and old.goal_home < old.goal_guest) then
		#Победитель или проигравший не поменялся
        #HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v
		where id_team = team_home;
        #GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_guest + goal_v,
			goals_conceded = goals_conceded - old.goal_home + goal_h
		where id_team = team_guest;
	elseif goal_h > goal_v and old.goal_home < old.goal_guest then
		#Победитель поменялся 1 случай - домашня команда проигрывала, но победила
		#HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v,
            wins = wins + 1,
            losses = losses - 1,
            points = points + 3
		where id_team = team_home;
        #GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_guest + goal_v,
			goals_conceded = goals_conceded - old.goal_home + goal_h,
            wins = wins - 1,
            losses = losses + 1,
            points = points - 3
		where id_team = team_guest;
	elseif goal_h < goal_v and old.goal_home > old.goal_guest then
		#Победитель поменялся 2 случай - домашня команда выигрывала, но проиграла
		#HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v,
            wins = wins - 1,
            losses = losses + 1,
            points = points - 3
		where id_team = team_home;
        #GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_guest + goal_v,
			goals_conceded = goals_conceded - old.goal_home + goal_h,
            wins = wins + 1,
            losses = losses - 1,
            points = points + 3
		where id_team = team_guest;
	elseif goal_h = goal_v and  old.goal_home = old.goal_guest then  
		# 3 случай ничья была, ничья осталась
		#HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v
		where id_team = team_home;
        #GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_guest + goal_v,
			goals_conceded = goals_conceded - old.goal_home + goal_h
		where id_team = team_guest;
	elseif goal_h = goal_v and old.goal_home > old.goal_guest then
		# 4 случай - ничья, но домашняя выигрывала
        #HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v,
            points = points - 3 + 1,
            wins = wins - 1,
            draws = draws + 1
		where id_team = team_home;
        #GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_guest + goal_v,
			goals_conceded = goals_conceded - old.goal_home + goal_h,
            points = points + 1,
            losses = losses - 1,
            draws = draws + 1
		where id_team = team_guest;
    elseif goal_h = goal_v and old.goal_home < old.goal_guest then
		# DRAW - before guest win
        # HOME
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v,
            draws = draws + 1,
            losses = losses - 1,
            points = points + 1
		where id_team = team_home;
        # GUEST
        update tournament_table
        set goals_scored = goals_scored - old.goal_home + goal_h,
			goals_conceded = goals_conceded = old.goal_guest + goal_v,
            wins = wins - 1,
            draws = draws + 1,
            points = points - 3 + 1
		where id_team = team_guest;
    end if;

else
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
  `url_site` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_player`),
  KEY `fk_players_teams_idx` (`id_team`),
  KEY `fk_players_amplua1_idx` (`id_amplua`),
  CONSTRAINT `fk_players_amplua1` FOREIGN KEY (`id_amplua`) REFERENCES `amplua` (`id_amplua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_teams` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,19,'Горячев Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player34171'),(2,19,'Козлов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28501'),(3,19,'Рунчев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3862'),(4,19,'Саная Ираклий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player54070'),(5,19,'Акишбая Омян%',NULL,NULL,NULL,NULL,'http://lfl.ru/player58104'),(6,19,'Мовсисян Виген%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71943'),(7,19,'Наимов Фариер%',NULL,NULL,NULL,NULL,'http://lfl.ru/player68659'),(8,19,'Бордунов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player34170'),(9,19,'Наимов Мурид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151550'),(10,19,'Хубутия Дато%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45290'),(11,19,'Хухуа Георгий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174692'),(12,26,'Гох Амаль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44203'),(13,26,'Борг Тимур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31336'),(14,26,'Грибанов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player165832'),(15,26,'Ковтун Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12073'),(16,26,'Мазенков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15376'),(17,26,'Чирков Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player27159'),(18,26,'Бубнов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player77381'),(19,26,'Кочетков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player138247'),(20,26,'Фадеев Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player7946'),(21,26,'Лебедев Василий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15383'),(22,25,'Поминов Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24720'),(23,25,'Александров Валентин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player33389'),(24,25,'Богонатов Филипп%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11260'),(25,25,'Карьков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11562'),(26,25,'Сурков Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97433'),(27,25,'Толокнов Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12718'),(28,25,'Адеишвили Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11341'),(29,25,'Берсенев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12585'),(30,25,'Меньшов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10963'),(31,25,'Протасевич Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player134703'),(32,25,'Протасевич Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player157683'),(33,25,'Сапожников Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player39326'),(34,25,'Асанидзе Леван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player63351'),(35,25,'Боев Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11553'),(36,25,'Казаков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player30776'),(37,21,'Егорычев Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player72035'),(38,21,'Кибиров Асланбек%',NULL,NULL,NULL,NULL,'http://lfl.ru/player51284'),(39,21,'Моисеев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23248'),(40,21,'Никонов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11906'),(41,21,'Стуклов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6476'),(42,21,'Цыбулевский Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player921'),(43,21,'Широков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11557'),(44,21,'Куксов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player91585'),(45,21,'Хохлов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11564'),(46,16,'Никитин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16117'),(47,16,'Бураков Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13748'),(48,16,'Мавлянов Джамал%',NULL,NULL,NULL,NULL,'http://lfl.ru/player92266'),(49,16,'Пикарь Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25879'),(50,16,'Головин Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player18527'),(51,16,'Кругляк Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16639'),(52,16,'Левченко Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player27843'),(53,16,'Сухарев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151730'),(54,16,'Булгаков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5213'),(55,30,'Катасонов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12085'),(56,30,'Батов Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10960'),(57,30,'Брагин Феликс%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12102'),(58,30,'Курилов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player49848'),(59,30,'Андрюшко Назарий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player29979'),(60,30,'Клепиков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12051'),(61,30,'Лускан Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player163822'),(62,30,'Прилепин Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11273'),(63,30,'Федюшин Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53651'),(64,30,'Зыков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10918'),(65,30,'Сапожников Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player99774'),(66,30,'Халяпин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player37625'),(67,30,'Шуркин Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11959'),(68,32,'Инкин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player95884'),(69,32,'Баурин Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71057'),(70,32,'Грязнов Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174237'),(71,32,'Медведев Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3510'),(72,32,'Строкань Степан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12146'),(73,32,'Алёшин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28513'),(74,32,'Корешков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10944'),(75,32,'Панин Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player129995'),(76,32,'Смирнов Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player36424'),(77,32,'Темроков Тимур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12047'),(78,32,'Пестерев Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player1616'),(79,32,'Резник Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174238'),(80,32,'Тарутин Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player60410'),(81,15,'Ульянов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11163'),(82,15,'Казачёнок Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player128037'),(83,15,'Сайфулин Ринат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32882'),(84,15,'Галбура Мариан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174596'),(85,15,'Кунин Аркадий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player82949'),(86,15,'Лазарев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player99830'),(87,15,'Назаралиев Толиб%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25819'),(88,15,'Петухов Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109281'),(89,15,'Суходоев Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56992'),(90,15,'Крикунов Тарас%',NULL,NULL,NULL,NULL,'http://lfl.ru/player75353'),(91,24,'Багдасаров Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32579'),(92,24,'Боровиков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player2244'),(93,24,'Долгих Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5382'),(94,24,'Краснов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19191'),(95,24,'Курбанов Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11748'),(96,24,'Логвинов Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12544'),(97,24,'Васильев Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109114'),(98,24,'Ерогин Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6609'),(99,24,'Жигачев Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player77359'),(100,24,'Лукманов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24501'),(101,24,'Мулашев Рамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player61325'),(102,24,'Фролов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player108049'),(103,24,'Яков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109913'),(104,24,'Захаров Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5414'),(105,20,'Кочетов Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53258'),(106,20,'Черепенько Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player153866'),(107,20,'Клочков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11646'),(108,20,'Коринец Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10740'),(109,20,'Кузьмич Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10507'),(110,20,'Рыжов Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player39601'),(111,20,'Шкурко Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player29665'),(112,20,'Киренков Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13299'),(113,20,'Рябцев Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98741'),(114,18,'Малашков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player33676'),(115,18,'Шахнович Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player102597'),(116,18,'Барсуков Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player4460'),(117,18,'Журавлёв Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10074'),(118,18,'Лесив Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player81928'),(119,18,'Сухоруков Валерий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14473'),(120,18,'Вахитов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player72178'),(121,18,'Давыдов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25432'),(122,18,'Чуйков Мигран%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10978'),(123,18,'Артамонов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6471'),(124,18,'Зюкин Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player82646'),(125,18,'Логвинов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player100545'),(126,18,'Молотков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13953'),(127,18,'Монахов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15438'),(128,29,'Степанов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97110'),(129,29,'Архипцев Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12909'),(130,29,'Воробьёв Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11785'),(131,29,'Трушель Пётр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10791'),(132,29,'Шушунов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12696'),(133,29,'Васильев Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player43945'),(134,29,'Емельянов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player167393'),(135,29,'Епифанов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player96981'),(136,29,'Мельников Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13393'),(137,29,'Пальцев Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5534'),(138,29,'Седых Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12075'),(139,29,'Грановский Борис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12682'),(140,29,'Разяпов Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12691'),(141,29,'Степанов Святослав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player26436'),(142,34,'Верниш Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player96408'),(143,34,'Дупляков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9740'),(144,34,'Медников Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173040'),(145,34,'Ходырев Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56038'),(146,34,'Волосевич Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50419'),(147,34,'Госпарян Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player115122'),(148,34,'Колесов Данил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40585'),(149,34,'Прудников Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player1331'),(150,34,'Рябцев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87816'),(151,34,'Московский Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40586'),(152,34,'Трефилов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player2311'),(153,23,'Жаров Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139123'),(154,23,'Рогачевский Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player67902'),(155,23,'Никулин Валерий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88112'),(156,23,'Бузыканов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player33923'),(157,23,'Гулевский Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88113'),(158,23,'Гульбасов Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173299'),(159,23,'Маркин Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97552'),(160,23,'Самочернов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player126422'),(161,23,'Бузыканов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88111'),(162,23,'Вахитов Динар%',NULL,NULL,NULL,NULL,'http://lfl.ru/player57733'),(163,33,'Мазур Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12071'),(164,33,'Комков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11471'),(165,33,'Наджаров Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15094'),(166,33,'Чубов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player2799'),(167,33,'Глушко Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12782'),(168,33,'Толстик Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70770'),(169,33,'Фомин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player163107'),(170,33,'Кишов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10962'),(171,33,'Тихонов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24028'),(172,28,'Беспалов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20706'),(173,28,'Бурау Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player136061'),(174,28,'Веселов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player67342'),(175,28,'Гневушев Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19281'),(176,28,'Крючков Георгий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12271'),(177,28,'Пажитнов Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45611'),(178,28,'Пальчиков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9881'),(179,28,'Туркин Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5765'),(180,28,'Пешехонов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151281'),(181,28,'Санталов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player69311'),(182,17,'Ковалёв Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player73976'),(183,17,'Ярусов Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player137571'),(184,17,'Головня Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player144034'),(185,17,'Каширский Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player112845'),(186,17,'Макаров Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174671'),(187,17,'Петриковский Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player91194'),(188,17,'Желанов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player107312'),(189,17,'Лёвин Василий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87767'),(190,17,'Ненашев Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88201'),(191,17,'Роганов Георгий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player144236'),(192,17,'Трифонов Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player120383'),(193,17,'Фирсаков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player75807'),(194,17,'Чоладзе Джемали%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88412'),(195,17,'Лопатин Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98272'),(196,17,'Старыгин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31200'),(197,22,'Бредихин Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player59235'),(198,22,'Кадурин Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28461'),(199,22,'Кубарев Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40667'),(200,22,'Цай Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11753'),(201,22,'Великов Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16933'),(202,22,'Канбеков Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player73117'),(203,22,'Кисловский Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12738'),(204,22,'Лазинин Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97867'),(205,22,'Лазинин Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20684'),(206,22,'Попов Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player55380'),(207,22,'Сомов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12217'),(208,22,'Чупров Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11752'),(209,22,'Козиков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40841'),(210,22,'Белов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player62424'),(211,22,'Налейкин Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16944'),(212,22,'Фарзалиев Джавид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12170'),(213,22,'Арбеков Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3666'),(214,26,'Мареев Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78887'),(215,26,'Собянин Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15384'),(216,26,'Собянин Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player59512'),(217,26,'Ларечнев Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15840'),(218,31,'Москалёв Ян%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89501'),(219,31,'Гончаров Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28954'),(220,31,'Насыров Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173038'),(221,31,'Правдин Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player115012'),(222,31,'Смирнов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175182'),(223,31,'Брагин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player57276'),(224,31,'Брукман Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player41494'),(225,31,'Кулаев Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31121'),(226,31,'Никитин Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player34187'),(227,31,'Щетинин Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player124338'),(228,31,'Войтенко Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player170712'),(229,31,'Кувиков Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78011'),(230,31,'Николаев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78875'),(231,28,'Янчинский Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player58265'),(232,28,'Голубев Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9877'),(233,28,'Соболев Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player108849'),(234,28,'Шкуров Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player95714'),(235,28,'Голубев Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9878'),(236,28,'Фёдоров Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71358'),(237,28,'Пальчиков Леонид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player69491'),(238,27,'Крестьянинов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12917'),(239,27,'Деркунский Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10266'),(240,27,'Иванов Григорий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player149924'),(241,27,'Лащенков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10269'),(242,27,'Акишин Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12171'),(243,27,'Белокуров Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10259'),(244,27,'Гаврилов Василий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11286'),(245,27,'Казаков Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player75892'),(246,27,'Козловский Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10710'),(247,27,'Ульянов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10257'),(248,27,'Кугачёв Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13410'),(249,27,'Марач Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174455'),(250,27,'Фёдоров Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70851'),(251,23,'Комарынец Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130063'),(252,23,'Лазария Мишико%',NULL,NULL,NULL,NULL,'http://lfl.ru/player108901'),(253,23,'Мухер Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player93322'),(254,23,'Романов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130061'),(255,33,'Акчулпанов Радмир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3636'),(256,33,'Ибатуллин Рушан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13382'),(257,33,'Сидяев Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player115913'),(258,33,'Татаренко Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130274'),(259,33,'Юнусов Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12697'),(260,29,'Смолин Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12120'),(261,34,'Лукашин Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174971'),(262,34,'Паршиков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player140012'),(263,34,'Яковлев Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player4131'),(264,34,'Нечаев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player2109'),(265,34,'Павлов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175298'),(266,34,'Пасеков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player2312'),(267,20,'Герасимов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16061'),(268,20,'Лапшин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11648'),(269,20,'Ефремов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10675'),(270,20,'Пименов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player43173'),(271,18,'Пронин Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130263'),(272,18,'Сайденцаль Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19481'),(273,18,'Филиппов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player138333'),(274,18,'Поповичев Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11633'),(275,15,'Сергеев Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8792'),(276,15,'Жедик Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10574'),(277,15,'Щуров Василий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player42070'),(278,15,'Клюев Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player142342'),(279,24,'Волков Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player17848'),(280,24,'Иванов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56606'),(281,24,'Иванов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10506'),(282,24,'Тюрин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162374'),(283,24,'Безгляднов Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150'),(284,24,'Васильев Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109115'),(285,30,'Федичкин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10254'),(286,30,'Гуськов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player62978'),(287,30,'Почечуев Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32811'),(288,30,'Назаров Анатолий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player18473'),(289,30,'Распопин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28042'),(290,32,'Ягунов Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player99843'),(291,32,'Дурягин Данил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player157559'),(292,32,'Науменко Данила%',NULL,NULL,NULL,NULL,'http://lfl.ru/player152967'),(293,32,'Шаменков Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151430'),(294,21,'Филин Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player47732'),(295,21,'Забиров Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10614'),(296,21,'Мухарёв Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25543'),(297,21,'Мухарметов Рамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player94060'),(298,21,'Горшенин Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player80675'),(299,21,'Иванов Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13609'),(300,21,'Чичварихин Глеб%',NULL,NULL,NULL,NULL,'http://lfl.ru/player90441'),(301,16,'Доркин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5188'),(302,16,'Егоров Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15413'),(303,16,'Шумейко Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player17963'),(304,19,'Рогулёв Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11192'),(305,19,'Федотов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28379'),(306,19,'Царевский Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174867'),(307,25,'Лобов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25808'),(308,25,'Кривов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10967'),(309,25,'Дунаев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162238'),(310,25,'Иванов Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11229'),(311,25,'Коен Леонид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21806'),(312,16,'Тахтаров Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9131'),(313,16,'Агеенков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5137'),(314,16,'Райский Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player90957'),(315,32,'Голованов Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player172474'),(316,21,'Лапшов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11836'),(317,21,'Сурков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24484'),(318,30,'Егоров Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3291'),(319,30,'Шурмин Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12629'),(320,18,'Коробков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44563'),(321,18,'Коробков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5020'),(322,15,'Сайфулин Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174643'),(323,15,'Василевский Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player73293'),(324,15,'Харитонов Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player58180'),(325,33,'Мамонтов Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25150'),(326,29,'Бодров Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12355'),(327,17,'Передерий Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player146527'),(328,28,'Медведев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20711'),(329,28,'Джанабаев Рафаэль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175617'),(330,22,'Ретунский Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40348'),(331,31,'Тулайкин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12412'),(332,31,'Козлов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player26477'),(333,31,'Булышев Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player168547'),(334,31,'Кощеев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player34784'),(335,31,'Кузнецов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player63357'),(336,31,'Сафин Ильгиз%',NULL,NULL,NULL,NULL,'http://lfl.ru/player153727'),(337,31,'Янин Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player73161'),(338,26,'Кожиченков Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11779'),(339,26,'Мороз Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15582'),(340,23,'Абросимов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162745'),(341,23,'Курдюков Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player157269'),(342,23,'Морозов Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player63991'),(343,23,'Елисеев Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8403'),(344,17,'Губанов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player81000'),(345,29,'Кудрявцев Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player62129'),(346,29,'Тушев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player170337'),(347,27,'Брындин Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71011'),(348,20,'Иванов Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player132030'),(349,20,'Мусралиев Тимур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12842'),(350,20,'Прянишников Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87322'),(351,20,'Яковлев Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player157740'),(352,33,'Медведев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10928'),(353,33,'Никитин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11683'),(354,33,'Брайович Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player155986'),(355,33,'Лаврук Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10910'),(356,33,'Миронов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player47304'),(357,15,'Соловьёв Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32279'),(358,34,'Лазарев Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player18717'),(359,30,'Корольков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89099'),(360,18,'Чайкин Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11540'),(361,18,'Важин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24057'),(362,18,'Игумнов Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14352'),(363,18,'Рыжков Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19057'),(364,21,'Юрцев Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23633'),(365,24,'Лосев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5614'),(366,32,'Скрипников Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89727'),(367,25,'Фурикевич Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10959'),(368,32,'Стасев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player54174'),(369,32,'Брежнев Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28517'),(370,25,'Григорян Аркадий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10958'),(371,24,'Старков Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player108040'),(372,18,'Быковский Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player143486'),(373,34,'Абаев Альберт%',NULL,NULL,NULL,NULL,'http://lfl.ru/player170340'),(374,34,'Соколов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20349'),(375,30,'Юсипов Ильдар%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12996'),(376,27,'Бавченков Пётр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10262'),(377,27,'Сушилин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45105'),(378,20,'Мотошин Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10313'),(379,17,'Пацекин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player111740'),(380,23,'Осипов Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44999'),(381,23,'Морозов Семён%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28360'),(382,23,'Радченко Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player93818'),(383,23,'Рыбаков Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player112802'),(384,22,'Горасин Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player627'),(385,22,'Мищенко Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player76872'),(386,33,'Бабушкин Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177524'),(387,33,'Лащёнов Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177525'),(388,16,'Ускоев Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31067'),(389,18,'Джураев Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109463'),(390,25,'Снегирёв Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174239'),(391,34,'Курамшин Альфред%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28497'),(392,33,'Воробьёв Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130028'),(393,17,'Степаненко Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177788'),(394,17,'Рубцов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player67232'),(395,31,'Дасаев Рашит%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151552'),(396,29,'Раевский Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6449'),(397,29,'Ивашкевич Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162537'),(398,29,'Соменков Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8065'),(399,31,'Башлаев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40380'),(400,22,'Борисенко Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12734'),(401,22,'Бураков Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98221'),(402,27,'Московченко Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5778'),(403,19,'Ляхов Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player127766'),(404,33,'Болдиреску Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player156710'),(405,32,'Быковский Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player153072'),(406,34,'Яшкин Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player178645'),(407,34,'Петров Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174659'),(408,34,'Земцов Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player178617'),(409,25,'Мытарев Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20278'),(410,25,'Чушенков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15875'),(411,17,'Митрога Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177789'),(412,31,'Лободанов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player22906'),(413,31,'Арифуллин Шамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177922'),(414,31,'Анисин Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98734'),(415,31,'Веселов Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173036'),(416,15,'Абдулин Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150117'),(417,26,'Кононенко Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11603'),(418,20,'Пехтелев Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70970'),(419,20,'Сычёв Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player61647'),(420,23,'Кузьмин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player33934'),(421,31,'Хусаинов Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151554'),(422,22,'Багандов Муса%',NULL,NULL,NULL,NULL,'http://lfl.ru/player117084'),(423,25,'Вайгельман Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player143118'),(424,25,'Альбиков Ильяс%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23000'),(425,27,'Стеблин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player9638'),(426,16,'Иванов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12198'),(427,32,'Селин Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player60382'),(428,18,'Васюхник Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player179493'),(429,24,'Болдырев Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109116'),(430,19,'Мурадов Астан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71655'),(431,31,'Сотрудников Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player179741'),(432,23,'Конивцов Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173573'),(433,23,'Ивашкевич Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130438'),(434,38,'Ивлиев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player69275'),(435,38,'Михеев Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player39320'),(436,38,'Морозов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player94159'),(437,38,'Сердюк Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player108943'),(438,38,'Антонов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player55784'),(439,38,'Митин Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player57084'),(440,38,'Сахаров Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13058'),(441,38,'Аминов Борис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6135'),(442,38,'Егикян Арен%',NULL,NULL,NULL,NULL,'http://lfl.ru/player69045'),(443,38,'Стасевич Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13080'),(444,48,'Комаров Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player159473'),(445,48,'Драган Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13102'),(446,48,'Райков Аркадий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player93183'),(447,48,'Беляев Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13714'),(448,48,'Майоршин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player159472'),(449,48,'Паршиков Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player113714'),(450,48,'Ханжин Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player64964'),(451,48,'Разуваев Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6073'),(452,45,'Панов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12698'),(453,45,'Комолов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12715'),(454,45,'Паламарчук Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12592'),(455,45,'Юрченко Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12111'),(456,45,'Илькин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10237'),(457,45,'Кондрашкин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12631'),(458,45,'Коротков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12717'),(459,45,'Миннуллин Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12702'),(460,45,'Стрелин Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12904'),(461,45,'Крутовских Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3081'),(462,45,'Соловьёв Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10235'),(463,36,'Данилов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player30970'),(464,36,'Азарян Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11814'),(465,36,'Бочаров Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13631'),(466,36,'Обуховский Глеб%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12077'),(467,36,'Таршинаев Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player59855'),(468,36,'Чикалов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12165'),(469,36,'Бабкин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12168'),(470,36,'Богданов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player27141'),(471,36,'Колосов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11507'),(472,36,'Нвибана Феликс%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79773'),(473,36,'Губинов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12297'),(474,36,'Косолапов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player167630'),(475,43,'Соломин Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10402'),(476,43,'Беляев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player142529'),(477,43,'Горбунов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176943'),(478,43,'Шиганов Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player42720'),(479,43,'Бойро Али%',NULL,NULL,NULL,NULL,'http://lfl.ru/player172739'),(480,43,'Кучеров Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88746'),(481,43,'Орлов Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11184'),(482,43,'Просалов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12946'),(483,43,'Рябых Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player179501'),(484,43,'Сивченко Яков%',NULL,NULL,NULL,NULL,'http://lfl.ru/player49732'),(485,43,'Тагиров Ренат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79800'),(486,43,'Федосов Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6610'),(487,43,'Гомля Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151597'),(488,43,'Пустовит Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player135119'),(489,35,'Туаев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player156416'),(490,35,'Балашов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3196'),(491,35,'Цыплухин Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player110356'),(492,35,'Шибаев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player26639'),(493,35,'Глебов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player93375'),(494,35,'Ерицян Гагик%',NULL,NULL,NULL,NULL,'http://lfl.ru/player47041'),(495,35,'Колеев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25887'),(496,35,'Науменко Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player179609'),(497,35,'Сахаров Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player69793'),(498,35,'Глотов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151995'),(499,35,'Романов Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28419'),(500,41,'Миронов Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8072'),(501,41,'Кастров Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24436'),(502,41,'Махарейшвили Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130157'),(503,41,'Невмывайченко Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player4759'),(504,41,'Галыгин Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player47136'),(505,41,'Журавлёв Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11630'),(506,41,'Филиппов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player17843'),(507,41,'Якушин Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25651'),(508,41,'Гусаров Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10415'),(509,41,'Маркин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130221'),(510,41,'Сергеев Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56920'),(511,46,'Голаков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player154994'),(512,46,'Адигамов Данила%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53949'),(513,46,'Морозкин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56256'),(514,46,'Приставка Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97568'),(515,46,'Калинин Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player36133'),(516,46,'Комилов Джамшит%',NULL,NULL,NULL,NULL,'http://lfl.ru/player179030'),(517,46,'Павлютенков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player118536'),(518,46,'Чермошенцев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player41468'),(519,46,'Бочалов Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53951'),(520,52,'Манто Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12551'),(521,52,'Собольков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11095'),(522,52,'Илюшкин Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player122707'),(523,52,'Терновых Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player152471'),(524,52,'Дедов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174459'),(525,52,'Добронос Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player76547'),(526,52,'Передреев Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player52223'),(527,52,'Портной Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88892'),(528,52,'Салабаев Радик%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175048'),(529,52,'Соболев Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23246'),(530,52,'Яковлев Елисей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player94168'),(531,52,'Кириченко Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player39562'),(532,52,'Собольков Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10639'),(533,55,'Кузнецов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15853'),(534,55,'Тимохин Василий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21491'),(535,55,'Шаргунов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15042'),(536,55,'Албул Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28837'),(537,55,'Панин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16358'),(538,55,'Писанных Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32108'),(539,55,'Савун Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player42633'),(540,55,'Серов Лев%',NULL,NULL,NULL,NULL,'http://lfl.ru/player72076'),(541,55,'Захаров Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44268'),(542,55,'Ракчеев Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177140'),(543,49,'Воробьёв Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player131408'),(544,49,'Джангралиев Арман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player134995'),(545,49,'Жильцов Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player37634'),(546,49,'Колдаев Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5585'),(547,49,'Лазирко Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109305'),(548,49,'Ванин Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6172'),(549,49,'Кабанов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28240'),(550,49,'Кислов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19355'),(551,49,'Кистанов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78748'),(552,49,'Павликов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70984'),(553,49,'Семёнов Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109758'),(554,49,'Синецкий Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player61229'),(555,49,'Конев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78749'),(556,49,'Резников Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71722'),(557,47,'Московкин Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player52570'),(558,47,'Белов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player72323'),(559,47,'Филонов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50328'),(560,47,'Шатрович Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player41866'),(561,47,'Юшваев Ролланд%',NULL,NULL,NULL,NULL,'http://lfl.ru/player60523'),(562,47,'Батарев Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player161610'),(563,47,'Прохоров Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50054'),(564,47,'Прохоров Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50053'),(565,47,'Прохоров Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50004'),(566,47,'Сидоров Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player112461'),(567,37,'Чудаков Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player90561'),(568,37,'Люхманов Тимур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11596'),(569,37,'Мамонтов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23285'),(570,37,'Мансуров Булат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12919'),(571,37,'Нецкин Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31859'),(572,37,'Семионичев Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player16646'),(573,37,'Власов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79835'),(574,37,'Симаков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25157'),(575,37,'Петрушин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87742'),(576,44,'Божиков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11411'),(577,44,'Верещако Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13378'),(578,44,'Илюхин Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11644'),(579,44,'Николаев Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89811'),(580,44,'Тамарков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15857'),(581,44,'Краснов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player68828'),(582,44,'Морозов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162688'),(583,44,'Пульников Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player113767'),(584,44,'Сенин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13387'),(585,44,'Тарасов Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13388'),(586,44,'Бондарев Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player163166'),(587,44,'Рыжов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21326'),(588,39,'Ерофеев Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player148319'),(589,39,'Гнездилов Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21698'),(590,39,'Колонтаевский Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8591'),(591,39,'Александров Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player38770'),(592,39,'Касаткин Ян%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173997'),(593,39,'Козаченко Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player90301'),(594,39,'Кругляков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151657'),(595,39,'Курило Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player170700'),(596,39,'Смирнов Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44561'),(597,39,'Вавилов Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130436'),(598,39,'Садыков Ринат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139922'),(599,39,'Тригуб Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19784'),(600,50,'Огородников Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player38402'),(601,50,'Воронцов Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player38400'),(602,50,'Колесников Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11649'),(603,50,'Петраков Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player38404'),(604,50,'Усков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45556'),(605,50,'Белов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player33775'),(606,50,'Борисов Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89344'),(607,50,'Сулейманов Фамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20323'),(608,50,'Андреев Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150779'),(609,50,'Шишигин Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28181'),(610,54,'Нарзиев Умид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player171923'),(611,54,'Таланкин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70448'),(612,54,'Беляев Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player159493'),(613,54,'Иншаков Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11191'),(614,54,'Лёвшин Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12038'),(615,54,'Птицин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11777'),(616,54,'Целуев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32724'),(617,54,'Чайка Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174804'),(618,54,'Жиров Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10901'),(619,54,'Кабазов Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12014'),(620,54,'Кущ Анатолий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player178373'),(621,54,'Сергеев Георгий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12754'),(622,54,'Тарасов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10447'),(623,54,'Радель Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player68609'),(624,53,'Федотов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player61718'),(625,53,'Литвищенко Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player143188'),(626,53,'Макущенко Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32586'),(627,53,'Никулин Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87317'),(628,53,'Первухин Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player42666'),(629,53,'Скамьин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78555'),(630,53,'Чёлушкин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24199'),(631,53,'Домышлинец Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player120890'),(632,53,'Маликов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24203'),(633,53,'Ступин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45579'),(634,40,'Савкин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13254'),(635,40,'Мазурин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11451'),(636,40,'Сафронов Клим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11798'),(637,40,'Ежаков Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player57017'),(638,40,'Зарипов Шамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44562'),(639,40,'Мурадов Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40232'),(640,40,'Нагервадзе Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11019'),(641,40,'Романов Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150880'),(642,40,'Стасенко Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79854'),(643,40,'Фёдоров Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player143869'),(644,40,'Филонов Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176405'),(645,40,'Звонов Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11913'),(646,40,'Старостин Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12442'),(647,56,'Дмитриев Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player158490'),(648,56,'Беленький Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28268'),(649,56,'Борзов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14130'),(650,56,'Грачёв Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player126112'),(651,56,'Злочевский Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14114'),(652,56,'Комоско Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8141'),(653,56,'Аверин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player26620'),(654,56,'Сибирский Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player136200'),(655,56,'Бурцев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player42734'),(656,56,'Шаров Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98405'),(657,53,'Максимов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24196'),(658,35,'Мякушко Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11270'),(659,35,'Орлов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player27372'),(660,35,'Сорокин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14453'),(661,35,'Горбунов Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player75178'),(662,40,'Иванов Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8192'),(663,40,'Химанов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13257'),(664,40,'Громадин Глеб%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151388'),(665,40,'Денисов Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player39315'),(666,40,'Хамзин Дамир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15341'),(667,40,'Шилин Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31060'),(668,40,'Рыков Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player160360'),(669,45,'Рыжиков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player126595'),(670,45,'Савельев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10239'),(671,45,'Севастьянов Всеволод%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12935'),(672,45,'Гайдо Григорий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3360'),(673,44,'Архипкин Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151289'),(674,44,'Попов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11517'),(675,44,'Суворов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109563'),(676,51,'Шуклин Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11378'),(677,51,'Гришин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11364'),(678,51,'Перин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11551'),(679,51,'Ровенский Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11071'),(680,51,'Зимин Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10956'),(681,51,'Карсанов Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11197'),(682,51,'Ларин Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40402'),(683,51,'Титяев Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11372'),(684,51,'Тихомиров Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player54059'),(685,51,'Головачёв Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13452'),(686,51,'Казначеев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13370'),(687,39,'Новиков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21703'),(688,39,'Акимов Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player77929'),(689,39,'Бондарчук Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150467'),(690,39,'Данченко Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150466'),(691,39,'Королёв Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player17885'),(692,39,'Кузин Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player18940'),(693,39,'Кириллов Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player17919'),(694,42,'Королёв Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15949'),(695,42,'Романов Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174457'),(696,42,'Ступин Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15789'),(697,42,'Гатаулин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174394'),(698,42,'Лобаненко Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15097'),(699,42,'Томберг Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78596'),(700,42,'Шило Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player62879'),(701,42,'Янкин Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player132075'),(702,42,'Трепышко Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174549'),(703,49,'Лавров Семён%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109304'),(704,49,'Сергиенков Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71889'),(705,49,'Шокин Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player44987'),(706,56,'Ершов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15714'),(707,56,'Мушаков Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14122'),(708,56,'Сеничев Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14116'),(709,56,'Артёмов Анатолий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151190'),(710,56,'Сергушков Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player15149'),(711,37,'Беляйкин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11593'),(712,37,'Борисов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player95125'),(713,37,'Курилов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player70825'),(714,37,'Максимцев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23175'),(715,47,'Лисица Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11747'),(716,47,'Севостьянов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13407'),(717,47,'Бежовец Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player86550'),(718,47,'Филонов Фёдор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11330'),(719,46,'Кешфиев Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173396'),(720,46,'Молчановский Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173451'),(721,46,'Смирнов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player113983'),(722,46,'Червонцев Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97567'),(723,46,'Кудряшов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player95857'),(724,38,'Скачков Матвей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player152281'),(725,38,'Окунев-Раракин Вадим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130303'),(726,43,'Гервасиев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player77730'),(727,43,'Кузнецов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12839'),(728,43,'Хачатрян Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11807'),(729,43,'Батурин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89278'),(730,43,'Зубов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139240'),(731,43,'Махоткин Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10979'),(732,43,'Мелешкин Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player14374'),(733,43,'Соловьёв Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10828'),(734,43,'Хачатрян Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player138203'),(735,43,'Шабайкин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player4389'),(736,43,'Кондратьев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player163380'),(737,54,'Большаков Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10741'),(738,54,'Бороздов Олег%',NULL,NULL,NULL,NULL,'http://lfl.ru/player144908'),(739,54,'Войнов Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12632'),(740,54,'Вартик Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player37287'),(741,41,'Лескин Валентин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player245'),(742,50,'Киселёв Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player38397'),(743,50,'Яцула Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31627'),(744,55,'Милешкин Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32507'),(745,55,'Есин Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87391'),(746,55,'Хан Пётр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174383'),(747,48,'Сидоров Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player158798'),(748,48,'Ловцов Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player99603'),(749,48,'Малеев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174726'),(750,48,'Земенков Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174662'),(751,48,'Насыров Ильфат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player169792'),(752,48,'Кафиев Армин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player3600'),(753,36,'Сулимин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19888'),(754,36,'Олейник Степан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player165064'),(755,36,'Сома Керри%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20205'),(756,36,'Агапеев Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11508'),(757,45,'Васильев Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player5854'),(758,37,'Ермаков Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player103234'),(759,37,'Горбачёв Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25158'),(760,43,'Чудаков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71556'),(761,36,'Булыгин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player58828'),(762,36,'Романов Равиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player51302'),(763,53,'Алтухов Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player51374'),(764,53,'Герасимов Шариф%',NULL,NULL,NULL,NULL,'http://lfl.ru/player20742'),(765,53,'Януш Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player47024'),(766,53,'Плотников Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player166183'),(767,55,'Тимофеев Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player8167'),(768,44,'Тащян Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139781'),(769,44,'Чеботарёв Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21384'),(770,42,'Вдовенко Владимир%',NULL,NULL,NULL,NULL,'http://lfl.ru/player142528'),(771,42,'Содиков Достонбек%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175189'),(772,42,'Марута Валерий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player68727'),(773,51,'Каракин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12429'),(774,51,'Шумков Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11509'),(775,51,'Завьялов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10627'),(776,51,'Кареев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player87986'),(777,39,'Рубченков Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player21367'),(778,46,'Бычков Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53952'),(779,50,'Яцула Пётр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31628'),(780,50,'Орешин Святослав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151777'),(781,50,'Забродин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player7871'),(782,50,'Ветков Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player164104'),(783,41,'Агакишиев Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28178'),(784,38,'Гуренко Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player131000'),(785,38,'Сиворонов Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player152657'),(786,56,'Волков Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175071'),(787,48,'Комаров Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175274'),(788,35,'Фалилеев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79796'),(789,35,'Гасанов Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player40759'),(790,35,'Каштанов Роман%',NULL,NULL,NULL,NULL,'http://lfl.ru/player102128'),(791,47,'Толстых Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player162971'),(792,55,'Куликов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player27098'),(793,49,'Капкаев Равиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player53299'),(794,51,'Жариков Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player55405'),(795,51,'Горчаков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11374'),(796,40,'Казакевич Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player107980'),(797,41,'Фрулёв Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player23001'),(798,43,'Казаков Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12115'),(799,43,'Якубянц Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player6494'),(800,44,'Михайлов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13383'),(801,46,'Александров Леонид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173395'),(802,48,'Ковальчук Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player130968'),(803,38,'Михайлов Артур%',NULL,NULL,NULL,NULL,'http://lfl.ru/player19405'),(804,54,'Степанян Карен%',NULL,NULL,NULL,NULL,'http://lfl.ru/player157196'),(805,54,'Хопёрский Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player121734'),(806,54,'Харашвили Бека%',NULL,NULL,NULL,NULL,'http://lfl.ru/player175683'),(807,42,'Колесников Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player56852'),(808,42,'Юренков Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player80783'),(809,42,'Ванюков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player147236'),(810,42,'Пестров Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player98118'),(811,42,'Титов Егор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player92987'),(812,35,'Антонов Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player68574'),(813,35,'Алёшин Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player50603'),(814,53,'Погорелец Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78842'),(815,53,'Проскуряков Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player79282'),(816,53,'Черевашенко Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174723'),(817,56,'Мирзоян Давид%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174642'),(818,56,'Морковкин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71861'),(819,56,'Шишков Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player75302'),(820,47,'Ястреб Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player172740'),(821,36,'Демидов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player116858'),(822,36,'Поляев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11505'),(823,36,'Данилов Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player30969'),(824,55,'Шпак Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player153682'),(825,49,'Солдатов Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player94062'),(826,39,'Безусский Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player170630'),(827,43,'Андреев Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player25378'),(828,41,'Артамонов Виктор%',NULL,NULL,NULL,NULL,'http://lfl.ru/player22994'),(829,41,'Ляхов Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11349'),(830,45,'Гуриненко Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10236'),(831,35,'Галкин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player150615'),(832,44,'Емелюков Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player12388'),(833,56,'Григорьев Иван%',NULL,NULL,NULL,NULL,'http://lfl.ru/player71862'),(834,47,'Лобунько Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139184'),(835,47,'Чернышов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player31074'),(836,48,'Загребельный Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176143'),(837,48,'Крылов Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player139689'),(838,48,'Воробьёв Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32415'),(839,53,'Фурманенко Евгений%',NULL,NULL,NULL,NULL,'http://lfl.ru/player92197'),(840,53,'Барсков Даниил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player114316'),(841,36,'Башаев Ринат%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28919'),(842,54,'Абрамов Константин%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176444'),(843,42,'Колесников Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player174456'),(844,42,'Соболев Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176418'),(845,42,'Спицын Николай%',NULL,NULL,NULL,NULL,'http://lfl.ru/player96885'),(846,38,'Пезиков Степан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player82497'),(847,38,'Чархифалакян Ара%',NULL,NULL,NULL,NULL,'http://lfl.ru/player26012'),(848,49,'Кряжев Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player134996'),(849,46,'Любавский Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109301'),(850,53,'Панченко Руслан%',NULL,NULL,NULL,NULL,'http://lfl.ru/player77321'),(851,53,'Беркович Анатолий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24201'),(852,53,'Куделин Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player169458'),(853,40,'Марченко Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player61494'),(854,42,'Журавлёв Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11615'),(855,48,'Голубин Андрей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player89875'),(856,48,'Куприянов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player7189'),(857,38,'Михайлов Игорь%',NULL,NULL,NULL,NULL,'http://lfl.ru/player46558'),(858,51,'Андросов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player1184'),(859,36,'Евстигнеев Кирилл%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11506'),(860,36,'Белык Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player78862'),(861,37,'Порохин Ярослав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176564'),(862,42,'Курылёв Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player125874'),(863,51,'Гордеев Михаил%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11377'),(864,40,'Козин Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player45493'),(865,46,'Мисин Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player109303'),(866,46,'Сталеров Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player24719'),(867,40,'Гнездилов Денис%',NULL,NULL,NULL,NULL,'http://lfl.ru/player97143'),(868,40,'Юдинцев Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player88279'),(869,43,'Зюзин Никита%',NULL,NULL,NULL,NULL,'http://lfl.ru/player153234'),(870,42,'Снегирёв Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player413'),(871,46,'Гитлин Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player32128'),(872,46,'Гришанов Антон%',NULL,NULL,NULL,NULL,'http://lfl.ru/player173394'),(873,46,'Карпухин Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player43098'),(874,39,'Хандожко Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player90820'),(875,56,'Менцингер Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player151191'),(876,44,'Лазарев Виталий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player176212'),(877,52,'Соловьёв Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player161584'),(878,52,'Поминальный Станислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player52225'),(879,51,'Галкин Юрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player11521'),(880,39,'Гаджиев Шамиль%',NULL,NULL,NULL,NULL,'http://lfl.ru/player46554'),(881,39,'Махно Алексей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player18595'),(882,56,'Гришкевич Вячеслав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player1848'),(883,47,'Кузнецов Сергей%',NULL,NULL,NULL,NULL,'http://lfl.ru/player28333'),(884,54,'Филимонов Илья%',NULL,NULL,NULL,NULL,'http://lfl.ru/player177941'),(885,35,'Белов Владислав%',NULL,NULL,NULL,NULL,'http://lfl.ru/player165497'),(886,55,'Соколов Павел%',NULL,NULL,NULL,NULL,'http://lfl.ru/player13681'),(887,53,'Урзика Александр%',NULL,NULL,NULL,NULL,'http://lfl.ru/player148828'),(888,52,'Цыцаркин Максим%',NULL,NULL,NULL,NULL,'http://lfl.ru/player10714'),(889,52,'Кацубинский Артём%',NULL,NULL,NULL,NULL,'http://lfl.ru/player93046'),(890,47,'Сорокин Дмитрий%',NULL,NULL,NULL,NULL,'http://lfl.ru/player106953');
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
  `in_game` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_match`,`id_player`),
  KEY `fk_players_in_match_players1_idx` (`id_player`),
  KEY `fk_players_in_match_matches1_idx` (`id_match`),
  CONSTRAINT `id_match` FOREIGN KEY (`id_match`) REFERENCES `matches` (`id_match`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `id_player` FOREIGN KEY (`id_player`) REFERENCES `players` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_in_match`
--

LOCK TABLES `players_in_match` WRITE;
/*!40000 ALTER TABLE `players_in_match` DISABLE KEYS */;
INSERT INTO `players_in_match` VALUES (11,1,0,0,0,0,0,0,0,NULL),(11,2,0,0,0,0,0,0,0,NULL),(11,3,0,0,0,0,0,0,0,NULL),(11,4,0,0,0,0,0,0,0,NULL),(11,5,0,0,0,0,0,0,0,NULL),(11,6,0,0,0,0,0,0,0,NULL),(11,7,0,0,1,0,0,0,0,NULL),(11,8,0,0,0,0,0,0,0,NULL),(11,9,2,0,0,0,0,0,0,NULL),(11,10,0,0,0,0,0,0,0,NULL),(11,11,0,0,0,0,0,0,0,NULL),(11,12,0,0,0,0,0,0,0,NULL),(11,13,0,0,0,0,0,0,0,NULL),(11,14,0,0,0,0,0,0,0,NULL),(11,15,0,0,0,0,0,0,0,NULL),(11,16,0,0,0,0,0,0,0,NULL),(11,17,0,0,0,0,0,0,0,NULL),(11,18,0,0,0,0,0,0,0,NULL),(11,19,1,0,0,0,0,0,0,NULL),(11,20,1,0,0,0,0,0,0,NULL),(11,21,0,0,0,0,0,0,0,NULL),(12,22,0,0,0,0,0,0,0,NULL),(12,23,0,0,0,0,0,0,0,NULL),(12,24,0,0,0,0,0,0,0,NULL),(12,25,0,0,0,0,0,0,0,NULL),(12,26,0,0,0,0,0,0,0,NULL),(12,27,0,0,0,0,0,0,0,NULL),(12,28,0,0,0,0,0,0,0,NULL),(12,29,1,0,0,0,0,0,0,NULL),(12,30,0,0,0,0,0,0,0,NULL),(12,31,0,0,0,0,0,0,0,NULL),(12,32,0,2,0,0,0,0,0,NULL),(12,33,1,0,0,0,0,0,0,NULL),(12,34,0,0,0,0,0,0,0,NULL),(12,35,0,0,0,0,0,0,0,NULL),(12,36,1,0,1,0,0,0,0,NULL),(12,37,0,0,0,0,0,0,0,NULL),(12,38,1,0,0,0,0,0,0,NULL),(12,39,1,0,0,0,1,0,0,NULL),(12,40,0,0,0,0,0,0,0,NULL),(12,41,0,0,0,0,0,0,0,NULL),(12,42,0,0,0,0,0,0,0,NULL),(12,43,1,0,0,0,0,0,0,NULL),(12,44,0,0,0,0,0,0,0,NULL),(12,45,0,0,0,0,0,0,0,NULL),(13,46,0,0,0,0,0,0,0,NULL),(13,47,0,0,0,0,0,0,0,NULL),(13,48,0,0,0,0,0,0,0,NULL),(13,49,0,0,0,0,0,0,0,NULL),(13,50,0,0,0,0,0,0,0,NULL),(13,51,0,0,0,0,0,0,0,NULL),(13,52,0,0,0,0,0,0,0,NULL),(13,53,0,0,0,0,0,0,0,NULL),(13,54,1,0,0,0,0,0,0,NULL),(13,55,0,0,0,0,0,0,0,NULL),(13,56,0,0,0,0,0,0,0,NULL),(13,57,0,0,0,0,0,0,0,NULL),(13,58,0,0,0,0,0,0,0,NULL),(13,59,0,0,0,0,0,0,0,NULL),(13,60,0,0,0,0,0,0,0,NULL),(13,61,0,0,0,0,0,0,0,NULL),(13,62,0,0,0,0,0,0,0,NULL),(13,63,0,0,0,0,0,0,0,NULL),(13,64,0,0,0,0,0,0,0,NULL),(13,65,0,0,0,0,0,0,0,NULL),(13,66,0,0,0,0,0,0,0,NULL),(13,67,1,0,0,0,0,0,0,NULL),(14,68,0,0,0,0,0,0,0,NULL),(14,69,0,0,0,0,0,0,0,NULL),(14,70,0,0,0,0,0,0,0,NULL),(14,71,0,0,0,0,0,0,0,NULL),(14,72,0,0,0,0,0,0,0,NULL),(14,73,0,0,0,0,0,0,0,NULL),(14,74,0,0,0,0,0,0,0,NULL),(14,75,0,0,0,0,0,0,0,NULL),(14,76,0,0,0,0,0,0,0,NULL),(14,77,1,0,0,0,0,0,0,NULL),(14,78,0,0,0,0,0,0,0,NULL),(14,79,0,0,0,0,0,0,0,NULL),(14,80,0,0,0,0,0,0,0,NULL),(14,81,0,0,0,0,0,0,0,NULL),(14,82,1,0,0,0,0,0,0,NULL),(14,83,0,0,0,0,0,0,0,NULL),(14,84,1,0,0,0,0,0,0,NULL),(14,85,1,0,0,0,0,0,1,NULL),(14,86,1,0,0,0,0,0,0,NULL),(14,87,0,0,0,0,0,0,0,NULL),(14,88,0,0,0,0,0,0,0,NULL),(14,89,0,0,1,0,0,0,0,NULL),(14,90,3,0,0,0,0,0,0,NULL),(15,91,0,0,0,0,0,0,0,NULL),(15,92,0,1,0,0,0,0,0,NULL),(15,93,0,0,0,0,0,0,0,NULL),(15,94,0,0,0,0,0,0,0,NULL),(15,95,0,0,0,0,0,0,0,NULL),(15,96,1,0,0,0,0,0,0,NULL),(15,97,0,0,0,0,0,0,0,NULL),(15,98,0,0,0,0,0,0,0,NULL),(15,99,0,1,0,0,0,0,0,NULL),(15,100,0,0,0,0,0,0,0,NULL),(15,101,0,1,0,0,0,0,0,NULL),(15,102,0,0,0,0,0,0,0,NULL),(15,103,1,0,0,0,0,0,0,NULL),(15,104,1,0,0,0,0,0,0,NULL),(15,105,0,0,0,0,0,0,0,NULL),(15,106,0,0,0,0,0,0,0,NULL),(15,107,0,0,0,0,0,0,0,NULL),(15,108,0,0,0,0,0,0,0,NULL),(15,109,0,0,0,0,0,0,0,NULL),(15,110,0,0,0,0,0,0,0,NULL),(15,111,0,0,0,0,0,0,0,NULL),(15,112,0,0,0,0,0,0,0,NULL),(15,113,0,0,0,0,0,0,0,NULL),(16,114,1,0,0,0,0,0,0,NULL),(16,115,0,0,0,0,0,0,0,NULL),(16,116,0,0,0,0,0,0,0,NULL),(16,117,1,0,0,0,0,0,0,NULL),(16,118,0,0,0,0,0,0,0,NULL),(16,119,0,0,0,0,0,0,0,NULL),(16,120,0,0,0,0,0,0,0,NULL),(16,121,0,0,0,0,0,0,0,NULL),(16,122,0,0,0,0,0,0,0,NULL),(16,123,2,0,0,0,0,0,0,NULL),(16,124,1,0,0,0,0,0,0,NULL),(16,125,1,0,0,0,0,0,0,NULL),(16,126,2,0,0,0,0,0,0,NULL),(16,127,0,0,0,0,0,0,1,NULL),(16,128,0,0,0,0,0,0,0,NULL),(16,129,0,0,0,0,0,0,0,NULL),(16,130,0,0,1,0,0,0,0,NULL),(16,131,0,0,0,0,0,0,0,NULL),(16,132,0,0,0,0,0,0,0,NULL),(16,133,1,0,0,0,0,0,0,NULL),(16,134,0,0,0,0,0,0,0,NULL),(16,135,1,0,0,0,0,0,0,NULL),(16,136,0,0,0,0,0,0,0,NULL),(16,137,0,0,0,0,0,0,0,NULL),(16,138,0,0,0,0,0,0,0,NULL),(16,139,1,0,0,0,0,0,0,NULL),(16,140,0,0,0,0,0,0,0,NULL),(16,141,0,0,0,0,0,0,0,NULL),(17,142,0,0,0,0,0,0,0,NULL),(17,143,0,0,0,0,0,0,0,NULL),(17,144,0,0,1,0,0,0,0,NULL),(17,145,0,0,0,0,0,0,0,NULL),(17,146,0,0,0,0,0,0,0,NULL),(17,147,0,0,0,0,0,0,0,NULL),(17,148,0,0,0,0,0,0,0,NULL),(17,149,0,0,0,0,0,0,0,NULL),(17,150,0,0,0,0,0,0,0,NULL),(17,151,0,0,0,0,0,0,0,NULL),(17,152,0,0,0,0,0,0,0,NULL),(17,153,0,0,0,0,0,0,0,NULL),(17,154,0,0,0,0,0,0,0,NULL),(17,155,1,0,0,0,0,0,0,NULL),(17,156,0,0,0,0,0,0,0,NULL),(17,157,0,0,0,0,0,0,0,NULL),(17,158,0,0,0,0,0,0,0,NULL),(17,159,0,1,0,0,0,0,0,NULL),(17,160,0,0,0,0,0,0,0,NULL),(17,161,0,0,0,0,0,0,0,NULL),(17,162,0,0,0,0,0,0,0,NULL),(18,163,0,0,0,0,0,0,0,NULL),(18,164,1,0,0,0,0,0,0,NULL),(18,165,0,0,0,0,0,0,0,NULL),(18,166,0,0,0,0,0,0,0,NULL),(18,167,0,0,0,0,0,0,0,NULL),(18,168,0,0,0,0,0,0,0,NULL),(18,169,0,0,0,0,0,0,0,NULL),(18,170,0,0,0,0,0,0,0,NULL),(18,171,0,0,0,0,0,0,0,NULL),(18,172,0,0,0,0,0,0,0,NULL),(18,173,0,0,0,0,0,0,0,NULL),(18,174,0,0,0,0,0,0,0,NULL),(18,175,0,0,0,0,0,0,0,NULL),(18,176,1,0,0,0,0,0,0,NULL),(18,177,0,0,0,0,0,0,0,NULL),(18,178,0,0,0,0,0,0,0,NULL),(18,179,2,0,0,0,0,0,0,NULL),(18,180,0,0,0,0,0,0,0,NULL),(18,181,0,0,0,0,0,0,0,NULL),(20,182,0,0,0,0,0,0,0,NULL),(20,183,0,0,0,0,0,0,0,NULL),(20,184,0,0,0,0,0,0,0,NULL),(20,185,0,0,0,0,0,0,0,NULL),(20,186,0,0,0,0,0,0,0,NULL),(20,187,0,0,0,0,0,0,0,NULL),(20,188,0,0,0,0,0,0,0,NULL),(20,189,2,0,0,0,0,0,0,NULL),(20,190,2,0,0,0,0,0,0,NULL),(20,191,1,0,0,0,0,0,0,NULL),(20,192,1,0,0,0,0,0,0,NULL),(20,193,0,0,0,0,0,0,0,NULL),(20,194,0,0,0,0,0,0,0,NULL),(20,195,2,0,0,0,0,0,0,NULL),(20,196,0,0,0,0,0,0,0,NULL),(20,197,0,0,0,0,0,0,0,NULL),(20,198,0,0,0,0,0,0,0,NULL),(20,199,0,0,0,0,0,0,0,NULL),(20,200,0,0,0,0,0,0,0,NULL),(20,201,0,0,0,0,0,0,0,NULL),(20,202,1,0,0,0,0,0,0,NULL),(20,203,0,0,0,0,0,0,0,NULL),(20,204,0,0,1,0,0,0,0,NULL),(20,205,0,0,0,0,0,0,0,NULL),(20,206,0,0,0,0,0,0,0,NULL),(20,207,0,0,0,0,0,0,0,NULL),(20,208,0,0,0,0,0,0,0,NULL),(20,209,1,0,0,0,0,0,0,NULL),(21,12,0,0,0,0,0,0,0,NULL),(21,13,0,0,0,0,0,0,0,NULL),(21,15,0,0,1,0,0,0,0,NULL),(21,17,0,0,0,0,0,0,0,NULL),(21,18,0,0,0,0,0,0,0,NULL),(21,197,0,0,0,0,0,0,0,NULL),(21,199,0,0,0,0,0,0,0,NULL),(21,201,0,0,0,0,0,0,0,NULL),(21,202,0,0,0,0,0,0,0,NULL),(21,203,0,0,0,0,0,0,0,NULL),(21,204,0,0,0,0,0,0,0,NULL),(21,205,0,0,0,0,0,0,0,NULL),(21,206,0,0,0,0,0,0,0,NULL),(21,208,0,0,0,0,0,0,0,NULL),(21,209,0,0,0,0,0,0,0,NULL),(21,210,0,0,0,0,0,0,0,NULL),(21,211,1,0,0,0,0,0,0,NULL),(21,212,0,0,0,0,0,0,0,NULL),(21,213,1,0,0,0,0,0,0,NULL),(21,214,0,0,0,0,0,0,0,NULL),(21,215,0,0,0,0,0,0,0,NULL),(21,216,1,0,0,0,0,0,0,NULL),(21,217,1,0,0,0,0,0,0,NULL),(22,182,0,0,0,0,0,0,0,NULL),(22,183,0,0,0,0,0,0,0,NULL),(22,187,0,0,0,0,0,0,0,NULL),(22,188,2,0,1,0,0,0,0,NULL),(22,189,0,0,0,0,0,0,0,NULL),(22,190,1,0,0,0,0,0,0,NULL),(22,191,0,0,1,0,0,0,0,NULL),(22,193,0,0,0,0,0,0,0,NULL),(22,194,0,0,0,0,0,0,0,NULL),(22,196,2,0,0,0,0,0,0,NULL),(22,218,0,0,0,0,0,0,0,NULL),(22,219,0,0,0,0,0,0,0,NULL),(22,220,0,0,0,0,0,0,0,NULL),(22,221,0,0,0,0,0,0,0,NULL),(22,222,0,0,0,0,0,0,0,NULL),(22,223,0,0,0,0,0,0,0,NULL),(22,224,0,0,0,0,0,0,0,NULL),(22,225,0,0,1,0,0,0,0,NULL),(22,226,0,0,0,0,0,0,0,NULL),(22,227,0,0,0,0,0,0,0,NULL),(22,228,0,0,0,0,0,0,0,NULL),(22,229,1,0,0,0,0,0,0,NULL),(22,230,0,0,0,0,0,0,0,NULL),(23,174,1,0,0,0,0,0,0,NULL),(23,175,0,0,0,0,0,0,0,NULL),(23,179,0,0,0,0,0,0,0,NULL),(23,180,0,0,0,0,0,0,0,NULL),(23,181,0,0,0,0,1,0,0,NULL),(23,231,0,0,0,0,0,0,0,NULL),(23,232,0,0,1,0,0,0,0,NULL),(23,233,0,0,0,0,0,0,0,NULL),(23,234,0,0,1,0,0,0,0,NULL),(23,235,1,0,0,0,0,0,0,NULL),(23,236,0,0,0,0,0,0,0,NULL),(23,237,0,0,0,0,0,0,0,NULL),(23,238,0,0,0,0,0,0,0,NULL),(23,239,0,0,1,0,0,0,0,NULL),(23,240,0,0,0,0,0,0,0,NULL),(23,241,0,0,0,0,0,0,0,NULL),(23,242,0,0,0,0,0,0,0,NULL),(23,243,0,0,0,0,0,0,0,NULL),(23,244,0,0,0,0,0,0,0,NULL),(23,245,1,0,1,0,0,0,0,NULL),(23,246,1,0,0,0,0,0,0,NULL),(23,247,0,0,0,0,0,0,0,NULL),(23,248,0,0,0,0,0,0,0,NULL),(23,249,0,0,0,0,0,0,0,NULL),(23,250,0,0,0,0,0,0,0,NULL),(24,154,0,0,1,0,0,0,0,NULL),(24,155,0,0,0,0,0,0,0,NULL),(24,156,1,1,0,0,0,0,0,NULL),(24,159,0,1,0,0,0,0,0,NULL),(24,161,0,0,0,0,0,0,0,NULL),(24,162,1,0,0,0,0,0,0,NULL),(24,164,0,0,0,0,0,0,0,NULL),(24,165,1,0,0,0,0,0,0,NULL),(24,166,0,0,0,0,0,0,0,NULL),(24,167,1,0,0,0,0,0,0,NULL),(24,169,0,0,0,0,0,0,0,NULL),(24,171,0,0,0,0,0,0,0,NULL),(24,251,0,0,0,0,0,0,0,NULL),(24,252,0,0,0,0,0,0,0,NULL),(24,253,1,0,0,0,0,0,0,NULL),(24,254,0,0,0,0,0,0,0,NULL),(24,255,0,0,0,0,0,0,0,NULL),(24,256,0,0,0,0,0,0,0,NULL),(24,257,1,0,0,0,0,0,0,NULL),(24,258,0,0,0,0,0,0,0,NULL),(24,259,0,0,0,0,0,0,0,NULL),(25,128,0,0,0,0,0,0,0,NULL),(25,129,1,0,0,0,0,0,0,NULL),(25,130,0,0,0,0,0,0,0,NULL),(25,131,0,0,0,0,0,0,0,NULL),(25,132,0,0,0,0,0,0,0,NULL),(25,136,1,0,0,0,0,0,0,NULL),(25,137,0,0,0,0,0,0,0,NULL),(25,138,0,0,0,0,0,0,0,NULL),(25,139,0,0,0,0,0,0,0,NULL),(25,140,1,0,0,0,0,0,0,NULL),(25,143,0,0,0,0,0,0,0,NULL),(25,145,0,0,0,0,0,0,0,NULL),(25,147,0,2,0,0,0,0,0,NULL),(25,150,2,0,0,0,0,0,0,NULL),(25,151,0,0,0,0,0,0,0,NULL),(25,260,1,0,0,0,0,0,0,NULL),(25,261,0,0,0,0,0,0,0,NULL),(25,262,0,0,0,0,0,0,0,NULL),(25,263,1,0,0,0,0,0,0,NULL),(25,264,0,1,0,0,0,0,0,NULL),(25,265,0,0,0,0,0,0,0,NULL),(25,266,0,0,1,0,0,0,0,NULL),(26,106,0,0,0,0,0,0,0,NULL),(26,107,0,0,0,0,0,0,0,NULL),(26,110,1,0,0,0,0,0,0,NULL),(26,111,0,0,0,0,0,0,0,NULL),(26,112,1,0,1,0,0,0,0,NULL),(26,114,0,0,0,0,0,0,0,NULL),(26,115,0,0,0,0,0,0,0,NULL),(26,116,0,0,0,0,0,0,0,NULL),(26,120,0,0,1,0,0,0,0,NULL),(26,121,0,0,1,0,0,0,0,NULL),(26,122,0,0,0,0,0,0,0,NULL),(26,123,0,0,0,0,1,0,0,NULL),(26,124,0,0,1,0,0,0,0,NULL),(26,125,0,0,0,0,0,0,0,NULL),(26,127,0,0,0,0,0,0,0,NULL),(26,267,0,0,0,0,0,0,0,NULL),(26,268,0,0,0,0,0,0,0,NULL),(26,269,0,0,1,0,0,0,0,NULL),(26,270,0,0,1,0,0,0,0,NULL),(26,271,1,0,0,0,0,0,0,NULL),(26,272,0,0,0,0,0,0,0,NULL),(26,273,0,0,0,0,0,0,0,NULL),(26,274,1,0,0,0,0,0,0,NULL),(27,81,0,0,0,0,0,0,0,NULL),(27,82,1,0,0,0,0,0,0,NULL),(27,83,1,0,0,0,0,0,0,NULL),(27,85,1,0,0,0,0,0,0,NULL),(27,86,1,0,0,0,0,0,0,NULL),(27,88,2,0,0,0,0,0,0,NULL),(27,90,4,0,0,0,0,0,0,NULL),(27,92,0,0,0,0,0,0,0,NULL),(27,93,0,0,0,0,0,0,0,NULL),(27,95,0,0,0,0,0,0,0,NULL),(27,96,0,0,0,0,0,0,0,NULL),(27,97,0,0,0,0,0,0,0,NULL),(27,99,0,0,0,0,0,0,0,NULL),(27,100,0,0,0,0,0,0,0,NULL),(27,101,1,0,0,0,0,0,0,NULL),(27,102,0,0,0,0,0,0,0,NULL),(27,103,0,0,0,0,0,0,0,NULL),(27,104,0,0,0,0,0,0,0,NULL),(27,275,0,0,0,0,0,0,0,NULL),(27,276,1,0,0,0,0,0,0,NULL),(27,277,1,0,0,0,0,0,0,NULL),(27,278,0,0,0,0,0,0,0,NULL),(27,279,0,0,0,0,0,0,0,NULL),(27,280,0,0,0,0,0,0,0,NULL),(27,281,0,0,1,0,0,0,0,NULL),(27,282,0,0,0,0,0,0,0,NULL),(27,283,0,0,0,0,0,0,0,NULL),(27,284,0,0,0,0,0,0,0,NULL),(28,58,0,0,0,0,0,0,0,NULL),(28,59,0,0,0,0,0,0,0,NULL),(28,60,0,0,0,0,0,0,0,NULL),(28,61,0,0,0,0,0,0,0,NULL),(28,63,0,0,0,0,0,0,0,NULL),(28,64,0,0,0,0,0,0,0,NULL),(28,65,0,0,0,0,0,0,0,NULL),(28,66,0,0,0,0,0,0,0,NULL),(28,67,0,0,0,0,0,0,0,NULL),(28,71,0,0,1,0,0,0,0,NULL),(28,74,0,0,0,0,0,0,0,NULL),(28,75,0,0,0,0,0,0,0,NULL),(28,76,2,0,0,0,0,0,0,NULL),(28,77,2,2,0,0,0,0,0,NULL),(28,285,0,0,0,0,0,0,0,NULL),(28,286,0,0,0,0,0,0,0,NULL),(28,287,1,0,0,0,0,0,0,NULL),(28,288,0,0,0,0,0,0,0,NULL),(28,289,1,0,0,0,0,0,0,NULL),(28,290,0,0,0,0,0,0,0,NULL),(28,291,0,0,0,0,0,0,0,NULL),(28,292,0,0,0,0,0,0,0,NULL),(28,293,0,0,0,0,0,0,0,NULL),(29,38,0,0,0,0,0,0,0,NULL),(29,39,0,0,0,0,0,0,0,NULL),(29,40,0,0,0,0,0,0,0,NULL),(29,42,0,0,0,0,0,0,0,NULL),(29,43,1,0,0,0,0,0,0,NULL),(29,44,0,0,1,0,0,0,0,NULL),(29,45,0,0,0,0,0,0,0,NULL),(29,46,0,0,0,0,0,0,0,NULL),(29,47,0,0,0,0,0,0,0,NULL),(29,48,0,0,0,0,0,0,0,NULL),(29,49,0,0,0,0,0,0,0,NULL),(29,50,0,0,0,0,0,0,0,NULL),(29,52,0,0,0,0,0,0,0,NULL),(29,53,0,0,0,0,0,0,0,NULL),(29,54,2,0,0,0,0,0,0,NULL),(29,294,0,0,0,0,0,0,0,NULL),(29,295,0,0,0,0,0,0,0,NULL),(29,296,0,0,2,0,0,0,0,NULL),(29,297,0,0,0,0,0,0,0,NULL),(29,298,0,0,0,0,0,0,0,NULL),(29,299,0,0,0,0,0,0,0,NULL),(29,300,0,0,0,0,0,0,0,NULL),(29,301,0,0,0,0,0,0,0,NULL),(29,302,0,0,0,0,0,0,0,NULL),(29,303,1,0,0,0,0,0,0,NULL),(30,1,0,0,0,0,0,0,0,NULL),(30,2,0,0,0,0,0,0,0,NULL),(30,3,0,0,0,0,0,0,0,NULL),(30,4,0,0,0,0,0,0,0,NULL),(30,7,3,0,0,0,0,0,0,NULL),(30,9,1,0,0,0,0,0,0,NULL),(30,10,1,0,0,0,0,0,0,NULL),(30,11,0,0,0,0,0,0,0,NULL),(30,22,0,0,0,0,0,0,0,NULL),(30,23,0,0,0,0,0,0,0,NULL),(30,24,0,1,0,0,0,0,1,NULL),(30,27,0,0,1,0,0,0,0,NULL),(30,28,0,0,0,0,0,0,0,NULL),(30,29,0,0,0,0,0,0,0,NULL),(30,30,1,1,0,0,0,0,0,NULL),(30,32,0,0,0,0,0,0,0,NULL),(30,33,2,1,0,0,0,0,0,NULL),(30,35,0,0,0,0,0,0,0,NULL),(30,36,1,0,0,0,0,0,0,NULL),(30,304,0,0,0,0,0,0,0,NULL),(30,305,0,0,0,0,0,0,0,NULL),(30,306,0,0,1,0,0,0,0,NULL),(31,12,0,0,0,0,0,0,0,NULL),(31,13,1,0,1,0,0,0,0,NULL),(31,15,0,0,0,0,0,0,0,NULL),(31,17,0,0,1,0,0,0,0,NULL),(31,18,0,0,0,0,0,0,0,NULL),(31,19,0,0,0,0,0,0,0,NULL),(31,20,0,0,0,0,0,0,0,NULL),(31,23,1,0,0,0,0,0,0,NULL),(31,24,0,0,1,0,0,0,0,NULL),(31,29,0,0,0,0,0,0,0,NULL),(31,30,1,0,0,0,0,0,0,NULL),(31,32,0,0,0,0,0,0,0,NULL),(31,34,0,1,0,0,0,0,0,NULL),(31,216,0,0,0,0,0,0,0,NULL),(31,217,0,0,0,0,0,0,0,NULL),(31,307,0,0,0,0,0,0,0,NULL),(31,308,0,0,0,0,0,0,0,NULL),(31,309,0,0,0,0,0,0,0,NULL),(31,310,0,1,0,0,0,0,0,NULL),(31,311,0,0,0,0,0,0,0,NULL),(32,1,0,0,0,0,0,0,0,NULL),(32,2,0,0,0,0,0,0,0,NULL),(32,3,0,0,1,0,0,0,0,NULL),(32,4,0,0,1,0,0,0,0,NULL),(32,6,0,0,0,0,0,0,0,NULL),(32,7,1,0,0,0,0,0,0,NULL),(32,9,0,0,0,0,0,0,0,NULL),(32,10,0,0,0,0,0,0,0,NULL),(32,11,0,0,0,0,0,0,0,NULL),(32,46,0,0,0,0,0,0,0,NULL),(32,47,0,0,0,0,0,0,0,NULL),(32,48,1,0,1,0,0,0,0,NULL),(32,49,0,0,0,0,0,0,0,NULL),(32,50,0,0,0,0,0,0,1,NULL),(32,53,0,0,1,0,0,0,0,NULL),(32,54,0,0,0,0,0,0,0,NULL),(32,302,1,0,0,0,0,0,1,NULL),(32,303,0,0,0,0,0,0,0,NULL),(32,304,0,0,0,0,0,0,0,NULL),(32,305,0,0,0,0,0,0,0,NULL),(32,306,0,0,0,0,0,0,0,NULL),(32,312,0,0,0,0,0,0,0,NULL),(32,313,0,0,0,0,0,0,0,NULL),(32,314,1,0,0,0,0,0,0,NULL),(33,38,0,0,0,0,0,0,0,NULL),(33,40,0,0,0,0,0,0,0,NULL),(33,43,2,0,0,0,0,0,0,NULL),(33,45,1,0,1,0,0,0,0,NULL),(33,68,0,0,0,0,0,0,0,NULL),(33,71,0,0,1,0,0,0,0,NULL),(33,74,0,0,0,0,0,0,0,NULL),(33,75,0,0,0,0,0,0,0,NULL),(33,76,2,0,0,0,0,0,0,NULL),(33,77,0,0,0,0,0,0,0,NULL),(33,291,0,0,0,0,0,0,0,NULL),(33,292,0,0,0,0,0,0,0,NULL),(33,293,1,0,0,0,0,0,0,NULL),(33,294,0,0,0,0,0,0,0,NULL),(33,298,0,0,0,0,0,0,0,NULL),(33,299,0,0,0,0,0,0,0,NULL),(33,315,0,0,0,0,0,0,0,NULL),(33,316,0,0,1,0,0,0,0,NULL),(33,317,0,0,0,0,0,0,0,NULL),(34,56,0,0,0,0,0,0,0,NULL),(34,57,0,0,0,0,0,0,0,NULL),(34,58,0,0,1,0,0,0,0,NULL),(34,59,0,0,0,0,0,0,0,NULL),(34,60,0,0,0,0,0,0,0,NULL),(34,62,0,0,0,0,0,0,0,NULL),(34,64,0,0,0,0,0,0,0,NULL),(34,66,1,0,0,0,0,0,0,NULL),(34,67,1,0,0,0,0,0,0,NULL),(34,92,0,0,0,0,0,0,0,NULL),(34,94,0,0,0,0,0,0,0,NULL),(34,95,0,0,0,0,0,0,0,NULL),(34,96,1,0,0,0,0,0,0,NULL),(34,97,0,0,0,0,1,0,0,NULL),(34,100,0,0,0,0,0,0,0,NULL),(34,102,0,0,0,0,0,0,0,NULL),(34,103,0,0,0,0,0,0,0,NULL),(34,104,0,0,0,0,0,0,0,NULL),(34,279,0,0,0,0,0,0,0,NULL),(34,280,0,0,0,0,0,0,0,NULL),(34,283,0,0,0,0,0,0,0,NULL),(34,284,0,0,0,0,0,0,0,NULL),(34,285,0,0,0,0,0,0,0,NULL),(34,286,0,0,0,0,0,0,0,NULL),(34,287,0,0,0,0,0,0,0,NULL),(34,318,0,0,0,0,0,0,0,NULL),(34,319,0,0,0,0,0,0,0,NULL),(35,82,0,0,0,0,0,0,0,NULL),(35,83,0,0,0,0,0,0,0,NULL),(35,86,1,0,0,0,0,0,0,NULL),(35,88,2,0,0,0,0,0,0,NULL),(35,90,0,0,0,0,0,0,0,NULL),(35,115,0,0,0,0,0,0,0,NULL),(35,116,0,0,0,0,0,0,0,NULL),(35,117,0,0,0,0,0,0,0,NULL),(35,120,0,0,0,0,0,0,0,NULL),(35,122,1,0,1,0,0,0,0,NULL),(35,123,0,0,0,0,0,0,0,NULL),(35,124,0,0,0,0,0,0,0,NULL),(35,125,0,0,0,0,0,0,0,NULL),(35,126,1,0,0,0,0,0,0,NULL),(35,271,0,0,0,0,0,0,0,NULL),(35,273,0,0,0,0,0,0,0,NULL),(35,274,0,0,0,0,0,0,0,NULL),(35,276,0,0,0,0,0,0,0,NULL),(35,278,0,0,0,0,0,0,0,NULL),(35,290,0,0,0,0,0,0,0,NULL),(35,320,0,0,0,0,0,0,0,NULL),(35,321,0,0,1,0,0,0,0,NULL),(35,322,0,0,0,0,0,0,0,NULL),(35,323,0,0,0,0,0,0,0,NULL),(35,324,0,0,1,0,0,0,0,NULL),(37,131,0,0,0,0,0,0,0,NULL),(37,133,0,0,0,0,0,0,0,NULL),(37,135,0,0,0,0,0,0,0,NULL),(37,136,0,0,0,0,1,0,0,NULL),(37,137,0,0,0,0,0,0,0,NULL),(37,138,0,0,0,0,0,0,0,NULL),(37,139,0,0,0,0,0,0,0,NULL),(37,140,1,0,0,0,0,0,0,NULL),(37,141,0,0,0,0,0,0,0,NULL),(37,164,0,0,0,0,0,0,0,NULL),(37,166,0,0,0,0,0,0,0,NULL),(37,167,0,0,0,0,0,0,0,NULL),(37,169,0,0,0,0,0,0,0,NULL),(37,171,1,0,0,0,0,0,0,NULL),(37,255,0,0,0,0,0,0,0,NULL),(37,256,0,0,0,0,0,0,0,NULL),(37,257,0,0,0,0,0,0,0,NULL),(37,259,1,0,0,0,0,0,0,NULL),(37,260,1,0,0,0,0,0,0,NULL),(37,325,0,0,0,0,0,0,0,NULL),(37,326,0,0,0,0,0,0,0,NULL),(39,173,0,0,0,0,0,0,0,NULL),(39,174,0,0,0,0,0,0,0,NULL),(39,176,0,0,0,0,0,0,0,NULL),(39,178,0,0,0,0,0,0,0,NULL),(39,180,0,0,0,0,0,0,0,NULL),(39,181,0,0,0,0,0,0,0,NULL),(39,182,0,0,0,0,0,0,0,NULL),(39,183,0,0,0,0,0,0,0,NULL),(39,184,0,0,0,0,0,0,0,NULL),(39,185,1,0,0,0,0,0,0,NULL),(39,186,1,0,0,0,0,0,0,NULL),(39,189,0,0,0,0,0,0,0,NULL),(39,190,0,0,0,0,0,0,0,NULL),(39,191,0,0,0,0,0,0,0,NULL),(39,193,1,0,0,0,0,0,0,NULL),(39,194,0,0,0,0,0,0,0,NULL),(39,195,0,0,0,0,0,0,0,NULL),(39,196,1,0,0,0,0,0,0,NULL),(39,232,0,0,0,0,0,0,0,NULL),(39,233,0,0,0,0,0,0,0,NULL),(39,236,0,0,0,0,0,0,0,NULL),(39,237,0,0,0,0,0,0,0,NULL),(39,327,0,0,0,0,0,0,0,NULL),(39,328,0,0,2,0,0,0,0,NULL),(39,329,0,0,1,0,0,0,0,NULL),(40,197,0,0,0,0,0,0,0,NULL),(40,198,0,0,0,0,0,0,0,NULL),(40,199,0,0,0,0,0,0,0,NULL),(40,201,0,0,0,0,1,0,0,NULL),(40,202,0,0,0,0,0,0,0,NULL),(40,203,0,0,0,0,0,0,0,NULL),(40,204,0,0,0,0,0,0,0,NULL),(40,205,0,0,0,0,0,0,0,NULL),(40,206,0,0,0,0,0,0,0,NULL),(40,208,2,0,0,0,0,0,1,NULL),(40,209,1,0,0,0,0,0,0,NULL),(40,210,2,0,1,0,0,0,0,NULL),(40,211,0,0,0,0,0,0,0,NULL),(40,212,0,0,0,0,0,0,0,NULL),(40,213,0,0,0,0,0,0,0,NULL),(40,220,0,0,0,0,0,0,0,NULL),(40,223,1,0,0,0,0,0,0,NULL),(40,224,0,0,0,0,0,0,0,NULL),(40,225,0,0,0,0,0,0,0,NULL),(40,226,1,0,0,0,0,0,0,NULL),(40,227,0,0,0,0,0,0,0,NULL),(40,229,0,0,0,0,0,0,0,NULL),(40,230,0,0,0,0,0,0,0,NULL),(40,330,0,0,0,0,0,0,0,NULL),(40,331,0,0,0,0,0,0,0,NULL),(40,332,0,0,1,0,0,0,0,NULL),(40,333,0,0,1,0,0,0,0,NULL),(40,334,2,0,0,0,0,0,0,NULL),(40,335,0,0,0,0,0,0,0,NULL),(40,336,0,0,0,0,0,0,0,NULL),(41,12,0,0,0,0,0,0,0,NULL),(41,13,0,0,0,0,0,0,0,NULL),(41,15,0,0,1,0,0,0,0,NULL),(41,16,0,0,0,0,0,0,0,NULL),(41,17,0,0,0,0,0,0,0,NULL),(41,18,0,0,1,0,0,0,0,NULL),(41,19,1,0,0,0,0,0,0,NULL),(41,20,0,0,0,0,0,0,0,NULL),(41,21,0,0,1,0,0,0,0,NULL),(41,214,0,0,0,0,0,0,0,NULL),(41,216,1,0,0,0,0,0,0,NULL),(41,217,0,0,0,0,0,0,0,NULL),(41,218,0,0,0,0,0,0,0,NULL),(41,219,0,0,0,0,0,0,0,NULL),(41,223,0,0,0,0,0,0,0,NULL),(41,224,0,0,0,0,0,0,0,NULL),(41,225,0,0,0,0,0,0,0,NULL),(41,226,0,0,0,0,0,0,0,NULL),(41,227,0,0,0,0,0,0,0,NULL),(41,229,1,0,0,0,0,0,0,NULL),(41,332,0,0,0,0,0,0,0,NULL),(41,333,0,0,0,0,0,0,0,NULL),(41,334,0,0,0,0,0,0,0,NULL),(41,336,1,0,0,0,0,0,0,NULL),(41,337,0,0,0,0,0,0,0,NULL),(41,338,0,0,0,0,0,0,0,NULL),(41,339,1,0,0,0,0,0,0,NULL),(43,155,0,0,0,0,0,0,0,NULL),(43,156,0,0,0,0,0,0,0,NULL),(43,157,0,0,0,0,0,0,0,NULL),(43,158,0,0,0,0,0,0,0,NULL),(43,159,1,0,0,0,0,0,0,NULL),(43,160,0,0,0,0,0,0,0,NULL),(43,161,0,0,0,0,0,0,0,NULL),(43,162,0,0,0,0,0,0,0,NULL),(43,182,0,0,0,0,0,0,0,NULL),(43,183,0,0,0,0,0,0,0,NULL),(43,184,0,0,1,0,0,0,0,NULL),(43,186,0,0,0,0,0,0,0,NULL),(43,189,0,0,0,0,0,0,0,NULL),(43,193,0,0,0,0,0,0,0,NULL),(43,194,1,0,0,0,0,0,0,NULL),(43,195,1,0,0,0,0,0,0,NULL),(43,196,5,0,0,0,0,0,0,NULL),(43,251,0,0,0,0,0,0,0,NULL),(43,254,0,0,0,0,0,0,0,NULL),(43,327,0,0,0,0,0,0,0,NULL),(43,340,0,0,0,0,0,0,0,NULL),(43,341,0,0,0,0,0,0,0,NULL),(43,342,0,0,0,0,0,0,0,NULL),(43,343,0,0,0,0,0,0,0,NULL),(43,344,1,0,0,0,0,0,0,NULL),(44,129,0,0,0,0,0,0,0,NULL),(44,131,0,0,0,0,0,0,0,NULL),(44,132,0,0,0,0,0,0,0,NULL),(44,135,0,0,0,0,0,0,0,NULL),(44,136,1,0,0,0,0,1,0,NULL),(44,137,0,0,0,0,0,0,0,NULL),(44,139,0,0,0,0,0,0,0,NULL),(44,140,1,0,0,0,0,0,0,NULL),(44,238,0,0,0,0,0,0,0,NULL),(44,239,0,0,0,0,0,0,0,NULL),(44,242,1,0,0,0,0,0,0,NULL),(44,243,0,0,0,0,0,0,0,NULL),(44,244,0,0,0,0,0,0,0,NULL),(44,246,0,0,0,0,0,0,0,NULL),(44,247,1,0,0,0,1,0,0,NULL),(44,249,0,0,0,0,0,0,0,NULL),(44,250,1,0,0,0,0,0,0,NULL),(44,326,0,0,0,0,0,0,0,NULL),(44,345,0,0,0,0,0,0,0,NULL),(44,346,0,0,0,0,0,0,0,NULL),(44,347,0,0,0,0,0,0,0,NULL),(45,106,0,0,0,0,0,0,0,NULL),(45,111,2,0,0,0,0,0,0,NULL),(45,112,1,0,0,0,0,0,0,NULL),(45,163,0,0,0,0,0,0,0,NULL),(45,165,0,0,0,0,0,0,0,NULL),(45,169,2,0,0,0,0,0,0,NULL),(45,255,0,0,0,0,0,0,0,NULL),(45,259,1,0,0,0,0,0,0,NULL),(45,267,0,0,0,0,0,0,0,NULL),(45,268,0,0,0,0,0,0,0,NULL),(45,269,0,0,0,0,0,0,0,NULL),(45,348,2,0,0,0,0,0,0,NULL),(45,349,0,0,0,0,0,0,0,NULL),(45,350,1,0,0,0,0,0,0,NULL),(45,351,0,0,0,0,0,0,0,NULL),(45,352,0,0,0,0,0,0,0,NULL),(45,353,0,0,0,0,0,0,0,NULL),(45,354,0,0,0,0,0,0,0,NULL),(45,355,0,0,0,0,0,0,0,NULL),(45,356,0,0,0,0,0,0,0,NULL),(46,82,0,0,0,0,0,0,0,NULL),(46,83,1,0,0,0,0,0,0,NULL),(46,85,0,0,0,0,0,0,0,NULL),(46,88,2,0,1,0,0,0,0,NULL),(46,143,0,0,0,0,0,0,0,NULL),(46,144,0,0,0,0,0,0,0,NULL),(46,145,0,0,0,0,0,0,0,NULL),(46,147,0,0,1,0,0,0,0,NULL),(46,148,0,0,0,0,0,0,0,NULL),(46,149,0,0,0,0,0,0,0,NULL),(46,151,0,0,0,0,0,0,0,NULL),(46,152,0,0,0,0,0,0,0,NULL),(46,263,0,0,0,0,0,0,0,NULL),(46,265,0,0,0,0,0,0,0,NULL),(46,277,0,0,0,0,0,0,0,NULL),(46,278,0,0,0,0,0,0,0,NULL),(46,290,0,0,0,0,0,0,0,NULL),(46,322,0,0,0,0,0,0,0,NULL),(46,323,2,0,0,0,0,0,0,NULL),(46,324,0,0,0,0,0,0,0,NULL),(46,357,1,0,0,0,0,0,0,NULL),(46,358,0,0,0,0,0,0,0,NULL),(47,57,0,0,0,0,0,0,0,NULL),(47,58,0,0,0,0,0,0,0,NULL),(47,59,0,0,0,0,0,0,0,NULL),(47,62,0,0,0,0,0,0,0,NULL),(47,63,0,0,0,0,0,0,0,NULL),(47,64,0,0,0,0,0,0,0,NULL),(47,65,0,0,0,0,0,0,0,NULL),(47,66,0,0,0,0,0,0,0,NULL),(47,67,0,0,0,0,0,0,0,NULL),(47,116,0,0,0,0,0,0,0,NULL),(47,117,1,0,0,0,0,0,0,NULL),(47,120,1,0,0,0,0,0,0,NULL),(47,121,0,0,0,0,0,0,0,NULL),(47,123,1,0,0,0,0,0,0,NULL),(47,125,0,0,0,0,0,0,0,NULL),(47,127,0,0,0,0,0,0,0,NULL),(47,271,0,0,0,0,0,0,0,NULL),(47,274,0,0,0,0,0,0,0,NULL),(47,285,0,0,0,0,0,0,0,NULL),(47,286,0,0,0,0,0,0,0,NULL),(47,287,0,0,1,0,0,0,0,NULL),(47,289,0,0,0,0,0,0,0,NULL),(47,319,0,0,0,0,0,0,0,NULL),(47,320,0,0,0,0,0,0,0,NULL),(47,321,0,0,0,0,0,0,0,NULL),(47,359,1,0,0,0,0,0,0,NULL),(47,360,0,0,0,0,0,0,0,NULL),(47,361,1,0,0,0,0,0,0,NULL),(47,362,0,0,0,0,0,0,0,NULL),(47,363,0,0,0,0,0,0,0,NULL),(48,38,0,0,1,0,0,0,0,NULL),(48,39,0,0,0,0,0,0,0,NULL),(48,40,0,0,0,0,0,0,0,NULL),(48,42,1,0,0,0,0,0,0,NULL),(48,43,0,0,0,0,0,0,0,NULL),(48,45,0,0,0,0,0,0,0,NULL),(48,91,0,0,0,0,0,0,0,NULL),(48,92,1,0,0,0,0,0,0,NULL),(48,93,0,0,0,0,0,0,0,NULL),(48,95,0,0,0,0,0,0,0,NULL),(48,98,0,0,0,0,0,0,0,NULL),(48,99,0,0,0,0,0,0,0,NULL),(48,100,0,0,0,0,0,0,0,NULL),(48,102,0,0,0,0,0,0,0,NULL),(48,103,0,0,0,0,0,0,0,NULL),(48,104,0,0,0,0,0,0,0,NULL),(48,281,0,0,0,0,0,0,0,NULL),(48,282,1,0,0,0,0,0,0,NULL),(48,283,1,0,0,0,0,0,0,NULL),(48,284,1,0,0,0,0,0,0,NULL),(48,294,0,0,0,0,0,0,0,NULL),(48,296,2,0,0,0,0,0,0,NULL),(48,297,1,0,0,0,0,0,0,NULL),(48,299,0,0,0,0,0,0,0,NULL),(48,316,0,0,0,0,0,0,0,NULL),(48,317,0,0,0,0,0,0,0,NULL),(48,364,1,0,0,0,0,0,0,NULL),(48,365,0,0,0,0,0,0,0,NULL),(49,1,0,0,0,0,0,0,1,NULL),(49,2,0,0,1,0,0,0,0,NULL),(49,3,0,0,0,0,0,0,0,NULL),(49,4,0,0,1,0,0,0,0,NULL),(49,5,1,0,1,0,0,0,0,NULL),(49,7,2,0,0,0,0,0,0,NULL),(49,8,0,0,0,0,0,0,0,NULL),(49,9,0,0,0,0,0,0,0,NULL),(49,10,1,0,0,0,0,0,0,NULL),(49,68,0,0,0,0,0,0,0,NULL),(49,71,0,0,1,0,0,0,0,NULL),(49,74,0,0,0,0,0,0,0,NULL),(49,75,1,0,0,0,0,0,0,NULL),(49,76,0,0,0,0,0,0,0,NULL),(49,77,0,0,0,0,0,0,0,NULL),(49,291,0,0,0,0,0,0,0,NULL),(49,292,0,0,0,0,0,0,0,NULL),(49,293,0,0,0,0,0,0,0,NULL),(49,304,0,0,0,0,0,0,0,NULL),(49,315,0,0,0,0,0,0,0,NULL),(49,366,0,0,0,0,0,0,0,NULL),(50,23,0,0,0,0,0,0,0,NULL),(50,24,0,0,0,0,0,0,0,NULL),(50,27,0,0,0,0,0,0,0,NULL),(50,28,0,0,0,0,0,0,0,NULL),(50,29,0,0,0,0,0,0,0,NULL),(50,30,1,0,1,0,0,0,0,NULL),(50,32,0,0,0,0,0,0,0,NULL),(50,34,0,0,1,0,0,0,0,NULL),(50,36,0,0,1,0,0,0,0,NULL),(50,46,0,0,0,0,0,0,0,NULL),(50,47,0,0,0,0,0,0,0,NULL),(50,48,0,0,0,0,0,0,0,NULL),(50,49,0,0,1,0,0,0,0,NULL),(50,50,0,0,0,0,0,0,0,NULL),(50,51,0,0,0,0,0,0,0,NULL),(50,52,2,0,0,0,0,0,0,NULL),(50,53,0,0,0,0,0,0,0,NULL),(50,54,4,0,0,0,0,0,0,NULL),(50,302,0,0,0,0,0,0,0,NULL),(50,303,0,0,0,0,0,0,0,NULL),(50,307,0,0,0,0,0,0,0,NULL),(50,310,0,0,0,0,0,0,0,NULL),(50,367,0,0,0,0,0,0,0,NULL),(51,12,0,0,0,0,0,0,0,NULL),(51,13,0,0,0,0,0,0,0,NULL),(51,15,0,0,0,0,0,0,0,NULL),(51,16,0,0,0,0,0,0,0,NULL),(51,17,0,0,0,0,0,0,0,NULL),(51,18,0,0,0,0,0,0,0,NULL),(51,19,0,0,0,0,0,0,0,NULL),(51,21,0,0,0,0,0,0,0,NULL),(51,46,0,0,0,0,0,0,0,NULL),(51,47,1,0,0,0,0,0,0,NULL),(51,48,0,0,0,0,0,0,0,NULL),(51,49,0,0,0,0,0,0,0,NULL),(51,50,0,0,0,0,0,0,0,NULL),(51,51,2,0,0,0,0,0,0,NULL),(51,52,0,0,0,0,0,0,0,NULL),(51,53,1,0,0,0,0,0,0,NULL),(51,54,1,0,0,0,0,0,0,NULL),(51,216,0,0,0,0,0,0,0,NULL),(51,217,0,0,0,0,0,0,0,NULL),(51,302,0,0,0,0,0,0,0,NULL),(51,312,0,0,0,0,0,0,0,NULL),(51,314,0,0,0,0,0,0,0,NULL),(51,339,1,0,0,0,0,0,0,NULL),(52,24,0,0,0,0,0,0,0,NULL),(52,28,0,0,1,0,0,0,0,NULL),(52,30,0,0,0,0,0,0,0,NULL),(52,31,0,0,0,0,0,0,0,NULL),(52,33,1,0,0,0,0,0,0,NULL),(52,34,0,0,0,0,0,0,0,NULL),(52,68,0,0,0,0,0,0,0,NULL),(52,69,0,0,0,0,0,0,0,NULL),(52,71,0,0,0,0,0,0,0,NULL),(52,75,0,0,0,0,0,0,0,NULL),(52,76,0,0,0,0,0,0,0,NULL),(52,77,0,0,0,0,0,0,0,NULL),(52,291,0,0,0,0,0,0,0,NULL),(52,293,1,0,0,0,0,0,0,NULL),(52,307,0,0,0,0,0,0,0,NULL),(52,309,0,0,0,0,0,0,0,NULL),(52,310,0,0,0,0,0,0,0,NULL),(52,311,0,0,1,0,0,0,0,NULL),(52,315,0,0,0,0,0,0,0,NULL),(52,368,1,0,0,0,0,0,0,NULL),(52,369,0,0,0,0,0,0,0,NULL),(52,370,0,0,0,0,0,0,0,NULL),(53,1,0,0,0,0,0,0,0,NULL),(53,2,0,0,0,0,0,0,0,NULL),(53,3,0,0,0,0,0,0,0,NULL),(53,4,0,0,0,0,0,0,0,NULL),(53,5,1,0,0,0,0,0,0,NULL),(53,7,2,0,0,0,0,0,0,NULL),(53,8,2,0,0,0,0,0,0,NULL),(53,9,1,0,0,0,1,0,0,NULL),(53,10,0,0,0,0,0,0,0,NULL),(53,11,1,0,0,0,0,0,0,NULL),(53,92,0,0,0,0,0,0,0,NULL),(53,93,1,0,0,0,0,0,0,NULL),(53,95,0,0,0,0,0,0,0,NULL),(53,96,0,0,0,0,0,0,0,NULL),(53,99,0,0,0,0,0,0,0,NULL),(53,100,0,0,0,0,0,0,0,NULL),(53,103,0,0,0,0,0,0,0,NULL),(53,104,1,0,0,0,0,0,0,NULL),(53,279,0,0,0,0,0,0,0,NULL),(53,304,0,0,0,0,0,0,0,NULL),(53,371,0,0,0,0,0,0,0,NULL),(54,37,0,0,0,0,0,0,0,NULL),(54,38,0,0,0,0,0,0,0,NULL),(54,39,0,0,1,1,0,0,0,NULL),(54,40,0,0,0,0,0,0,0,NULL),(54,42,0,0,0,0,0,0,0,NULL),(54,45,0,0,0,0,0,0,0,NULL),(54,115,0,0,0,0,0,0,0,NULL),(54,116,0,0,0,0,0,0,0,NULL),(54,117,0,0,0,0,0,0,0,NULL),(54,120,0,0,0,0,0,0,0,NULL),(54,121,0,0,0,0,0,0,0,NULL),(54,123,0,0,0,0,0,0,0,NULL),(54,125,0,0,0,0,0,0,0,NULL),(54,271,0,0,0,0,0,0,0,NULL),(54,272,0,0,0,0,0,0,0,NULL),(54,274,0,0,0,0,0,0,0,NULL),(54,296,1,0,0,0,0,0,0,NULL),(54,297,0,0,0,0,0,0,0,NULL),(54,299,0,0,0,0,0,0,0,NULL),(54,316,0,0,0,0,0,0,0,NULL),(54,317,0,0,0,0,0,0,0,NULL),(54,320,1,0,0,0,0,0,0,NULL),(54,321,0,0,0,0,0,0,0,NULL),(54,361,0,0,0,0,0,0,0,NULL),(54,362,0,0,0,0,0,0,0,NULL),(54,363,0,0,0,0,0,0,0,NULL),(54,372,0,0,0,0,0,0,0,NULL),(55,59,1,0,0,0,0,0,0,NULL),(55,62,0,0,0,0,0,0,0,NULL),(55,63,0,0,0,0,0,0,0,NULL),(55,64,0,0,0,0,0,0,0,NULL),(55,66,0,0,0,0,0,0,0,NULL),(55,67,1,0,0,0,0,0,0,NULL),(55,143,0,0,0,0,0,0,0,NULL),(55,145,0,0,0,0,0,0,0,NULL),(55,147,0,0,0,0,0,0,0,NULL),(55,148,0,0,0,0,0,0,0,NULL),(55,150,0,0,0,0,0,0,0,NULL),(55,151,0,0,0,0,0,0,0,NULL),(55,152,0,0,0,0,0,0,0,NULL),(55,262,0,0,0,0,0,0,0,NULL),(55,263,0,0,0,0,0,0,0,NULL),(55,285,0,0,0,0,0,0,0,NULL),(55,289,0,0,0,0,0,0,0,NULL),(55,319,0,0,0,0,0,0,0,NULL),(55,358,0,0,0,0,0,0,0,NULL),(55,373,0,0,0,0,0,0,0,NULL),(55,374,0,0,0,0,0,0,0,NULL),(55,375,0,0,0,0,0,0,0,NULL),(56,82,0,0,0,0,0,0,0,NULL),(56,84,2,0,0,0,0,0,0,NULL),(56,88,2,0,0,0,0,0,0,NULL),(56,89,0,0,0,0,0,0,0,NULL),(56,90,1,0,0,0,0,0,0,NULL),(56,163,0,0,0,0,0,0,0,NULL),(56,164,0,0,1,0,0,0,0,NULL),(56,166,0,0,0,0,0,0,0,NULL),(56,168,1,0,0,0,0,0,0,NULL),(56,169,0,0,0,0,0,0,0,NULL),(56,170,0,0,0,0,0,0,0,NULL),(56,255,0,0,2,0,0,0,0,NULL),(56,257,0,0,0,0,0,0,0,NULL),(56,259,0,0,0,0,0,0,0,NULL),(56,277,0,0,0,0,0,0,0,NULL),(56,278,0,0,0,0,0,0,0,NULL),(56,290,0,0,0,0,0,0,0,NULL),(56,323,0,0,0,0,0,0,0,NULL),(56,357,4,0,0,0,0,0,0,NULL),(57,106,0,0,0,0,0,0,0,NULL),(57,110,0,0,0,0,0,0,0,NULL),(57,112,2,0,1,0,0,0,0,NULL),(57,238,0,0,0,0,0,0,0,NULL),(57,239,0,0,1,0,0,0,0,NULL),(57,241,0,0,0,0,0,0,0,NULL),(57,242,1,0,0,0,0,0,0,NULL),(57,243,0,0,1,0,0,0,0,NULL),(57,244,0,0,0,0,0,0,0,NULL),(57,247,0,0,0,0,0,0,0,NULL),(57,249,0,0,0,0,0,0,0,NULL),(57,250,1,0,1,0,0,0,0,NULL),(57,267,0,0,0,0,0,0,0,NULL),(57,268,0,0,0,0,0,0,0,NULL),(57,269,0,0,0,0,0,0,0,NULL),(57,270,0,0,0,0,0,0,0,NULL),(57,347,0,0,0,0,0,0,0,NULL),(57,348,0,0,0,0,0,1,0,NULL),(57,349,0,0,0,0,0,0,0,NULL),(57,350,0,0,0,0,0,0,0,NULL),(57,376,1,0,0,0,0,0,0,NULL),(57,377,1,0,1,0,0,0,0,NULL),(57,378,0,0,0,0,0,0,0,NULL),(58,129,0,0,0,0,0,0,1,NULL),(58,130,0,0,1,0,0,0,0,NULL),(58,131,0,0,0,0,0,0,0,NULL),(58,132,0,0,0,0,0,0,0,NULL),(58,135,0,0,0,0,0,0,0,NULL),(58,136,2,0,0,0,0,0,0,NULL),(58,139,0,0,0,0,0,0,0,NULL),(58,140,0,0,0,0,0,0,0,NULL),(58,182,1,0,0,0,0,0,0,NULL),(58,183,2,0,0,0,0,0,0,NULL),(58,184,2,0,0,0,0,0,0,NULL),(58,185,0,0,0,0,0,0,0,NULL),(58,186,0,0,0,0,0,0,0,NULL),(58,194,1,0,0,0,0,0,0,NULL),(58,196,4,0,0,0,0,0,0,NULL),(58,260,0,0,0,0,0,0,0,NULL),(58,326,0,0,0,0,0,0,0,NULL),(58,345,0,0,0,0,0,0,0,NULL),(58,346,0,0,0,0,0,0,0,NULL),(58,379,0,0,1,0,0,0,0,NULL),(59,155,0,0,0,0,0,0,0,NULL),(59,156,1,1,0,0,0,0,0,NULL),(59,157,1,0,0,0,0,0,0,NULL),(59,159,0,0,0,0,0,0,0,NULL),(59,161,1,0,0,0,0,0,0,NULL),(59,162,0,0,0,0,0,0,0,NULL),(59,197,0,0,0,0,0,0,0,NULL),(59,198,0,0,0,0,0,0,0,NULL),(59,199,0,0,0,0,0,0,0,NULL),(59,201,0,0,0,0,0,0,0,NULL),(59,202,0,0,0,0,0,0,0,NULL),(59,203,1,0,0,0,0,0,0,NULL),(59,208,0,0,0,0,0,0,0,NULL),(59,209,1,0,0,0,0,0,0,NULL),(59,210,3,0,0,0,0,0,0,NULL),(59,211,1,0,0,0,0,0,0,NULL),(59,212,1,0,0,0,0,0,0,NULL),(59,213,0,0,0,0,0,0,0,NULL),(59,254,1,0,0,0,0,0,0,NULL),(59,330,1,0,0,0,0,0,0,NULL),(59,341,0,0,0,0,0,0,0,NULL),(59,342,0,0,0,0,0,0,0,NULL),(59,343,0,0,0,0,0,0,0,NULL),(59,380,0,0,0,0,0,0,0,NULL),(59,381,0,0,0,0,0,0,0,NULL),(59,382,0,0,0,0,0,0,0,NULL),(60,174,2,0,0,0,0,0,0,NULL),(60,176,0,0,0,0,0,0,0,NULL),(60,178,0,0,0,0,0,0,0,NULL),(60,179,0,0,0,0,0,0,0,NULL),(60,180,0,0,0,0,0,0,0,NULL),(60,181,0,0,0,0,0,0,0,NULL),(60,218,0,0,0,0,0,0,0,NULL),(60,219,0,0,0,0,0,0,0,NULL),(60,220,0,0,1,0,0,0,0,NULL),(60,223,2,0,0,0,0,0,0,NULL),(60,224,0,0,0,0,0,0,0,NULL),(60,226,1,0,0,0,0,0,0,NULL),(60,227,0,0,0,0,0,0,0,NULL),(60,231,0,0,0,0,0,0,0,NULL),(60,232,0,0,0,0,0,0,0,NULL),(60,235,0,0,0,0,0,0,0,NULL),(60,237,2,0,0,0,0,0,0,NULL),(60,329,0,0,0,0,0,0,0,NULL),(60,332,0,0,0,0,0,0,0,NULL),(60,333,0,0,0,0,1,0,0,NULL),(60,334,0,0,0,0,0,0,0,NULL),(60,336,0,0,0,0,0,0,0,NULL),(60,337,0,0,0,0,0,0,0,NULL),(61,12,0,0,0,0,0,0,0,NULL),(61,13,0,0,0,0,0,0,0,NULL),(61,15,0,0,0,0,0,0,0,NULL),(61,19,2,0,0,0,0,0,0,NULL),(61,174,0,0,0,0,0,0,0,NULL),(61,176,0,0,0,0,0,0,0,NULL),(61,178,0,0,0,0,0,0,0,NULL),(61,180,0,0,0,0,0,0,0,NULL),(61,181,1,0,0,0,0,0,0,NULL),(61,214,0,0,0,0,0,0,0,NULL),(61,216,1,0,0,0,0,0,0,NULL),(61,217,1,0,0,0,0,0,0,NULL),(61,232,0,0,0,0,0,0,0,NULL),(61,233,0,0,0,0,0,0,0,NULL),(61,237,0,0,0,0,0,0,0,NULL),(61,328,0,0,0,0,0,0,0,NULL),(61,329,0,0,0,0,0,0,0,NULL),(61,339,0,0,0,0,0,0,0,NULL),(62,154,0,0,0,0,0,0,0,NULL),(62,156,0,1,0,0,0,0,0,NULL),(62,157,0,0,0,0,0,0,0,NULL),(62,159,1,0,0,0,0,0,0,NULL),(62,161,1,0,0,0,0,0,0,NULL),(62,219,0,0,0,0,0,0,0,NULL),(62,223,0,0,0,0,0,0,0,NULL),(62,224,0,0,0,0,0,0,0,NULL),(62,226,1,2,0,0,0,0,0,NULL),(62,227,1,0,0,0,0,0,0,NULL),(62,251,0,0,0,0,0,0,0,NULL),(62,253,0,1,0,0,0,0,0,NULL),(62,331,0,0,0,0,0,0,0,NULL),(62,332,0,0,0,0,0,0,0,NULL),(62,333,1,0,0,0,0,0,0,NULL),(62,334,0,1,0,0,0,0,0,NULL),(62,336,2,0,0,0,0,0,0,NULL),(62,381,0,0,0,0,0,0,0,NULL),(62,383,0,0,0,0,0,0,0,NULL),(63,129,0,0,0,0,0,0,0,NULL),(63,130,0,0,0,0,0,0,0,NULL),(63,131,0,0,0,0,0,0,0,NULL),(63,132,0,0,0,0,0,0,0,NULL),(63,133,0,0,0,0,0,0,0,NULL),(63,139,0,0,0,0,0,0,0,NULL),(63,140,3,0,0,0,0,0,0,NULL),(63,141,0,0,0,0,0,0,0,NULL),(63,197,0,0,0,0,0,0,0,NULL),(63,199,0,0,0,0,0,0,0,NULL),(63,201,0,0,0,0,0,0,0,NULL),(63,205,0,0,0,0,0,0,0,NULL),(63,206,2,0,0,0,0,0,0,NULL),(63,208,0,0,0,0,0,0,0,NULL),(63,209,2,0,0,0,0,0,0,NULL),(63,210,3,0,0,0,0,0,0,NULL),(63,211,0,0,0,0,0,0,0,NULL),(63,212,0,0,0,0,0,0,0,NULL),(63,213,1,0,0,0,0,0,0,NULL),(63,260,0,0,0,0,0,0,0,NULL),(63,326,0,0,0,0,0,0,0,NULL),(63,330,0,0,0,0,0,0,0,NULL),(63,345,0,0,0,0,0,0,0,NULL),(63,384,0,0,0,0,0,0,0,NULL),(63,385,0,0,0,0,0,0,0,NULL),(64,106,0,0,0,0,0,0,0,NULL),(64,107,0,0,0,0,0,0,0,NULL),(64,110,0,0,0,0,0,0,0,NULL),(64,111,0,0,0,0,0,0,0,NULL),(64,182,0,0,0,0,0,0,0,NULL),(64,183,0,0,0,0,0,0,0,NULL),(64,185,0,0,0,0,0,0,0,NULL),(64,187,0,0,0,0,0,0,0,NULL),(64,189,0,0,0,0,0,0,0,NULL),(64,190,0,0,0,0,0,0,0,NULL),(64,193,0,0,0,0,0,0,0,NULL),(64,194,0,0,0,0,0,0,0,NULL),(64,196,2,0,0,0,0,0,0,NULL),(64,268,0,0,0,0,0,0,0,NULL),(64,269,0,0,0,0,0,0,0,NULL),(64,270,1,0,0,0,0,0,0,NULL),(64,348,1,0,0,0,0,0,0,NULL),(64,350,0,0,0,0,0,0,0,NULL),(64,378,1,0,0,0,0,0,0,NULL),(64,379,0,0,0,0,0,0,0,NULL),(65,82,0,0,0,0,0,0,0,NULL),(65,83,0,0,0,0,0,0,0,NULL),(65,84,1,0,0,0,0,0,0,NULL),(65,86,3,0,0,0,0,0,0,NULL),(65,88,1,0,0,0,0,0,0,NULL),(65,238,0,0,0,0,0,0,0,NULL),(65,239,0,0,0,0,0,0,0,NULL),(65,240,0,0,0,0,0,0,0,NULL),(65,241,0,0,0,0,0,0,0,NULL),(65,242,0,0,0,0,0,0,0,NULL),(65,243,0,0,0,0,0,0,0,NULL),(65,244,1,0,0,0,0,0,0,NULL),(65,246,0,0,0,0,0,0,0,NULL),(65,247,1,0,0,0,0,0,0,NULL),(65,248,0,0,0,0,0,0,0,NULL),(65,277,0,0,0,0,0,0,0,NULL),(65,290,0,0,0,0,0,0,0,NULL),(65,324,1,0,1,0,0,0,0,NULL),(65,357,0,0,0,0,0,0,0,NULL),(65,376,0,0,0,0,0,0,0,NULL),(66,57,0,0,0,0,0,0,0,NULL),(66,58,1,0,0,0,0,0,0,NULL),(66,59,0,0,0,0,0,0,0,NULL),(66,60,0,0,0,0,0,0,0,NULL),(66,62,0,0,0,0,0,0,0,NULL),(66,63,1,0,0,0,0,0,0,NULL),(66,64,0,0,0,0,0,0,0,NULL),(66,65,0,0,0,0,0,0,0,NULL),(66,66,0,0,0,0,0,0,0,NULL),(66,67,0,0,0,0,0,0,0,NULL),(66,163,0,0,0,0,0,0,0,NULL),(66,164,0,0,0,0,0,0,0,NULL),(66,166,0,0,1,0,0,0,0,NULL),(66,167,2,0,0,0,1,0,0,NULL),(66,169,0,0,0,0,0,0,0,NULL),(66,170,0,0,0,0,0,0,0,NULL),(66,259,0,0,0,0,0,0,0,NULL),(66,285,0,0,0,0,0,0,0,NULL),(66,289,0,0,0,0,0,0,0,NULL),(66,318,0,0,0,0,0,0,0,NULL),(66,319,0,0,0,0,0,0,0,NULL),(66,386,0,0,0,0,0,0,0,NULL),(66,387,0,0,0,0,0,0,0,NULL),(67,38,0,0,0,0,0,0,0,NULL),(67,41,0,0,0,0,0,0,0,NULL),(67,42,0,0,0,0,0,0,0,NULL),(67,45,0,0,0,0,0,0,0,NULL),(67,143,0,0,0,0,0,0,0,NULL),(67,144,0,0,0,0,0,0,0,NULL),(67,145,0,0,0,0,0,0,0,NULL),(67,148,0,0,0,0,0,0,0,NULL),(67,149,0,0,0,0,0,0,0,NULL),(67,150,0,0,0,0,0,0,0,NULL),(67,151,0,0,0,0,0,0,0,NULL),(67,152,0,0,0,0,0,0,0,NULL),(67,262,0,0,0,0,0,0,0,NULL),(67,263,0,0,0,0,0,0,0,NULL),(67,264,0,0,0,0,0,0,0,NULL),(67,295,0,0,0,0,0,0,0,NULL),(67,296,1,0,0,0,0,0,0,NULL),(67,299,1,0,0,0,0,0,0,NULL),(67,300,0,0,0,0,0,0,0,NULL),(67,316,0,0,0,0,0,0,0,NULL),(67,317,0,0,0,0,0,0,0,NULL),(67,358,0,0,0,0,0,0,0,NULL),(67,373,0,0,1,0,0,0,0,NULL),(67,374,0,0,1,0,0,0,0,NULL),(68,1,0,0,0,0,0,0,0,NULL),(68,2,0,0,0,0,0,0,0,NULL),(68,3,0,0,0,0,0,0,0,NULL),(68,4,0,0,0,0,0,0,0,NULL),(68,5,0,0,1,0,0,0,0,NULL),(68,7,1,0,0,0,0,0,0,NULL),(68,8,0,0,0,0,0,0,0,NULL),(68,9,0,0,0,0,0,0,0,NULL),(68,10,0,0,0,0,0,0,0,NULL),(68,11,0,0,0,0,0,0,0,NULL),(68,114,0,0,0,0,0,0,0,NULL),(68,116,0,0,0,0,0,0,0,NULL),(68,117,0,0,0,0,0,0,0,NULL),(68,120,0,0,0,0,0,0,0,NULL),(68,121,1,0,0,0,0,0,0,NULL),(68,122,0,0,0,0,0,0,0,NULL),(68,123,0,0,0,0,0,0,0,NULL),(68,126,0,0,0,0,0,0,0,NULL),(68,127,1,0,0,0,0,0,0,NULL),(68,271,0,0,0,0,0,0,0,NULL),(68,274,1,0,1,0,0,0,0,NULL),(68,304,0,0,0,0,0,0,0,NULL),(68,306,0,0,1,0,0,0,0,NULL),(68,320,0,0,0,0,0,0,0,NULL),(68,321,0,0,0,0,0,0,0,NULL),(68,360,0,0,0,0,0,0,0,NULL),(68,361,0,0,1,0,0,0,0,NULL),(68,362,0,0,0,0,0,0,0,NULL),(68,363,0,0,0,0,0,0,0,NULL),(69,24,0,1,0,0,0,0,0,NULL),(69,29,0,0,0,0,0,0,0,NULL),(69,30,0,1,0,0,0,0,0,NULL),(69,31,1,0,0,0,0,0,0,NULL),(69,32,0,0,0,0,0,0,0,NULL),(69,33,0,0,0,0,0,0,0,NULL),(69,36,3,1,0,0,0,0,0,NULL),(69,92,1,0,0,0,0,0,0,NULL),(69,93,0,0,0,0,0,0,0,NULL),(69,94,0,1,0,0,0,0,0,NULL),(69,96,0,0,0,0,0,0,0,NULL),(69,97,0,0,0,0,0,0,0,NULL),(69,98,0,0,0,0,0,0,0,NULL),(69,99,0,0,0,0,0,0,0,NULL),(69,100,0,2,0,0,0,0,0,NULL),(69,101,0,0,0,0,0,0,0,NULL),(69,104,1,0,0,0,0,0,0,NULL),(69,282,0,0,0,0,0,0,0,NULL),(69,283,2,0,0,0,0,0,0,NULL),(69,284,0,0,0,0,0,0,0,NULL),(69,307,0,0,0,0,0,0,0,NULL),(69,311,0,0,0,0,0,0,0,NULL),(69,365,0,0,0,0,0,0,0,NULL),(69,370,0,0,1,0,0,0,0,NULL),(69,371,0,0,0,0,0,0,0,NULL),(70,46,0,0,0,0,0,0,0,NULL),(70,47,0,0,0,0,0,0,0,NULL),(70,48,2,0,1,0,0,0,0,NULL),(70,49,0,0,0,0,0,0,0,NULL),(70,51,0,0,0,0,0,0,0,NULL),(70,52,1,0,0,0,0,0,0,NULL),(70,53,1,0,0,0,0,0,0,NULL),(70,54,5,0,0,0,0,0,0,NULL),(70,68,0,0,0,0,0,0,0,NULL),(70,69,0,0,0,0,0,0,0,NULL),(70,75,0,0,1,0,0,0,0,NULL),(70,76,0,0,0,0,0,0,0,NULL),(70,77,0,0,0,0,0,0,0,NULL),(70,291,0,0,0,0,0,0,0,NULL),(70,302,1,0,0,0,0,0,0,NULL),(70,303,0,0,0,0,0,0,0,NULL),(70,312,0,0,1,0,0,0,0,NULL),(70,315,0,0,0,0,0,0,0,NULL),(70,366,0,0,0,0,0,0,0,NULL),(70,369,0,0,1,0,0,0,0,NULL),(72,46,0,0,0,0,0,0,0,NULL),(72,48,0,0,0,0,0,0,0,NULL),(72,50,0,0,0,0,0,0,0,NULL),(72,51,1,0,0,0,0,0,0,NULL),(72,52,0,0,0,0,0,0,0,NULL),(72,53,1,0,0,0,0,0,0,NULL),(72,54,0,0,0,0,0,0,0,NULL),(72,92,0,0,0,0,0,0,0,NULL),(72,94,0,0,0,0,0,0,0,NULL),(72,96,0,0,0,0,0,0,0,NULL),(72,97,0,0,0,0,0,0,0,NULL),(72,99,0,0,0,0,0,0,0,NULL),(72,100,0,0,0,0,0,0,0,NULL),(72,104,0,0,1,0,0,0,0,NULL),(72,282,0,0,0,0,0,0,0,NULL),(72,283,2,0,0,0,0,0,0,NULL),(72,284,0,0,0,0,0,0,0,NULL),(72,302,0,0,0,0,0,0,0,NULL),(72,312,0,0,0,0,0,0,0,NULL),(72,365,0,0,0,0,0,0,1,NULL),(72,371,0,0,0,0,0,0,0,NULL),(72,388,0,0,0,0,0,0,0,NULL),(73,23,0,0,0,0,0,0,0,NULL),(73,24,0,0,0,0,0,0,0,NULL),(73,25,0,0,0,0,0,0,0,NULL),(73,27,1,0,0,0,0,0,0,NULL),(73,28,0,0,0,0,0,0,0,NULL),(73,29,0,0,0,0,0,0,0,NULL),(73,34,0,0,0,0,0,0,0,NULL),(73,36,1,1,0,0,0,0,0,NULL),(73,115,0,0,0,0,0,0,0,NULL),(73,116,0,0,0,0,0,0,0,NULL),(73,117,0,0,0,0,0,0,0,NULL),(73,120,0,0,0,0,0,0,0,NULL),(73,121,0,0,0,0,0,0,0,NULL),(73,122,0,0,0,0,0,0,0,NULL),(73,123,3,0,0,0,0,0,0,NULL),(73,127,0,0,0,0,0,0,0,NULL),(73,271,0,0,0,0,0,0,0,NULL),(73,272,1,0,0,0,0,0,0,NULL),(73,307,0,0,0,0,0,0,0,NULL),(73,320,0,0,0,0,0,0,0,NULL),(73,321,1,0,0,0,0,0,0,NULL),(73,361,0,0,0,0,0,0,0,NULL),(73,362,1,0,0,0,0,0,0,NULL),(73,363,0,0,0,0,0,0,0,NULL),(73,389,0,0,0,0,0,0,0,NULL),(73,390,1,1,0,0,0,0,0,NULL),(74,1,0,0,0,0,0,0,0,NULL),(74,2,0,0,0,0,0,0,0,NULL),(74,3,0,0,0,0,0,0,0,NULL),(74,4,1,0,0,0,0,0,0,NULL),(74,5,1,0,0,0,0,0,0,NULL),(74,7,2,0,0,0,0,0,0,NULL),(74,8,0,0,0,0,0,0,0,NULL),(74,9,1,0,0,0,0,0,0,NULL),(74,10,1,0,0,0,0,0,0,NULL),(74,142,0,0,0,0,0,0,0,NULL),(74,143,0,0,0,0,0,0,0,NULL),(74,144,0,1,0,0,0,0,0,NULL),(74,145,0,0,0,0,0,0,0,NULL),(74,148,0,0,0,0,0,0,0,NULL),(74,149,0,0,0,0,0,0,0,NULL),(74,150,0,1,0,0,0,0,0,NULL),(74,151,0,0,0,0,0,0,0,NULL),(74,152,0,0,0,0,0,0,0,NULL),(74,263,0,0,0,0,0,0,0,NULL),(74,264,0,0,0,0,0,0,0,NULL),(74,304,1,0,0,0,0,0,0,NULL),(74,306,0,0,0,0,0,0,0,NULL),(74,358,0,0,0,0,0,0,0,NULL),(74,374,0,0,0,0,0,0,0,NULL),(74,391,2,0,0,0,0,0,0,NULL),(75,38,0,0,0,0,0,0,0,NULL),(75,40,0,0,0,0,0,0,0,NULL),(75,41,0,0,1,0,0,0,0,NULL),(75,42,0,0,0,0,0,0,0,NULL),(75,43,0,0,0,0,0,0,0,NULL),(75,45,2,0,0,0,0,0,0,NULL),(75,163,0,0,0,0,0,0,0,NULL),(75,164,0,0,0,0,0,0,0,NULL),(75,165,0,0,0,0,0,0,0,NULL),(75,166,0,0,0,0,0,0,0,NULL),(75,167,0,0,0,0,0,0,0,NULL),(75,255,1,0,1,0,0,0,0,NULL),(75,257,0,0,0,0,0,0,0,NULL),(75,294,0,0,0,0,0,0,0,NULL),(75,296,0,0,0,0,0,0,0,NULL),(75,297,2,0,0,0,1,0,0,NULL),(75,298,0,0,0,0,0,0,0,NULL),(75,299,0,0,0,0,0,0,0,NULL),(75,316,0,0,0,0,0,0,0,NULL),(75,317,1,0,0,0,0,0,0,NULL),(75,386,0,0,0,0,0,0,0,NULL),(75,387,0,0,0,0,0,0,0,NULL),(75,392,0,0,0,0,0,0,0,NULL),(77,70,0,0,0,0,0,0,0,NULL),(77,82,0,0,0,0,0,0,0,NULL),(77,85,0,0,0,0,0,0,0,NULL),(77,86,1,0,0,0,0,0,0,NULL),(77,88,0,0,0,0,0,0,0,NULL),(77,90,0,0,0,0,0,0,0,NULL),(77,182,0,0,0,0,0,0,0,NULL),(77,183,0,0,0,0,0,0,0,NULL),(77,185,1,0,0,0,0,0,0,NULL),(77,189,0,0,0,0,0,0,0,NULL),(77,190,1,0,1,0,0,0,0,NULL),(77,193,0,0,0,0,0,0,0,NULL),(77,194,0,0,0,0,0,0,0,NULL),(77,196,2,0,0,0,0,0,0,NULL),(77,277,1,0,0,0,0,0,0,NULL),(77,290,0,0,0,0,0,0,0,NULL),(77,322,0,0,0,0,0,0,0,NULL),(77,357,0,0,0,0,0,0,0,NULL),(77,379,0,0,0,0,0,0,0,NULL),(77,393,0,0,0,0,0,0,0,NULL),(77,394,3,0,0,0,0,0,0,NULL),(78,107,1,0,0,0,0,0,0,NULL),(78,109,0,0,0,0,0,0,0,NULL),(78,111,1,0,0,0,0,0,0,NULL),(78,112,0,0,0,0,0,0,0,NULL),(78,197,0,0,0,0,0,0,0,NULL),(78,199,0,0,1,0,0,0,0,NULL),(78,201,1,0,0,0,1,0,0,NULL),(78,205,0,0,0,0,0,0,0,NULL),(78,208,0,0,0,0,0,0,0,NULL),(78,209,0,0,0,0,0,0,0,NULL),(78,210,1,0,0,0,0,0,0,NULL),(78,211,0,0,0,0,0,0,0,NULL),(78,212,0,0,0,0,0,0,0,NULL),(78,213,0,0,0,0,0,0,0,NULL),(78,269,0,0,0,0,0,0,0,NULL),(78,270,0,0,0,0,0,0,0,NULL),(78,348,0,0,0,0,0,0,0,NULL),(78,350,0,0,0,0,0,0,0,NULL),(78,378,1,0,0,0,0,0,0,NULL),(78,384,0,0,0,0,0,0,0,NULL),(79,129,0,0,0,0,0,0,0,NULL),(79,130,0,0,0,0,0,0,0,NULL),(79,131,0,0,0,0,0,0,0,NULL),(79,132,0,0,0,0,0,0,0,NULL),(79,133,0,0,0,0,0,0,0,NULL),(79,136,0,0,0,0,0,0,0,NULL),(79,139,0,0,0,0,0,0,0,NULL),(79,141,0,0,0,0,0,0,0,NULL),(79,219,0,0,0,0,0,0,0,NULL),(79,221,0,0,0,0,0,0,0,NULL),(79,222,0,0,0,0,0,0,0,NULL),(79,223,0,0,0,0,0,0,0,NULL),(79,224,0,0,1,0,0,0,0,NULL),(79,226,1,0,0,0,0,0,0,NULL),(79,227,0,0,0,0,0,0,0,NULL),(79,326,0,0,0,0,0,0,0,NULL),(79,331,0,0,0,0,0,0,0,NULL),(79,332,1,0,1,0,0,0,0,NULL),(79,333,0,0,0,0,0,0,0,NULL),(79,334,0,0,0,0,0,0,0,NULL),(79,336,0,0,0,0,0,0,0,NULL),(79,395,0,0,0,0,0,0,0,NULL),(80,154,0,0,0,0,0,0,0,NULL),(80,156,0,0,0,0,0,0,0,NULL),(80,159,0,1,0,0,0,0,0,NULL),(80,160,0,1,0,0,0,0,0,NULL),(80,161,1,0,0,0,0,0,0,NULL),(80,162,0,0,0,0,0,0,0,NULL),(80,175,0,0,0,0,0,0,0,NULL),(80,178,0,0,0,0,0,0,0,NULL),(80,179,0,0,0,0,0,0,0,NULL),(80,180,0,0,0,0,0,0,0,NULL),(80,181,0,0,0,0,0,0,0,NULL),(80,234,0,0,1,0,0,0,0,NULL),(80,236,0,0,0,0,0,0,0,NULL),(80,237,1,0,0,0,0,0,0,NULL),(80,251,0,0,0,0,0,0,0,NULL),(80,254,1,0,0,0,0,0,0,NULL),(80,328,0,0,0,0,0,0,0,NULL),(80,329,0,0,0,0,0,0,0,NULL),(80,341,0,0,0,0,0,0,0,NULL),(80,342,0,0,0,0,0,0,0,NULL),(80,381,0,0,0,0,0,0,0,NULL),(81,12,0,0,0,0,0,0,0,NULL),(81,13,0,0,1,0,0,0,0,NULL),(81,15,0,0,1,0,0,0,0,NULL),(81,17,0,0,0,0,0,0,0,NULL),(81,154,0,0,0,0,0,0,0,NULL),(81,156,0,1,0,0,1,0,0,NULL),(81,157,0,0,0,0,0,0,0,NULL),(81,158,1,0,0,0,0,0,0,NULL),(81,159,0,0,0,0,0,0,0,NULL),(81,160,0,0,0,0,0,0,0,NULL),(81,161,4,0,0,0,0,0,0,NULL),(81,215,0,0,1,0,0,0,0,NULL),(81,216,0,0,0,0,0,0,0,NULL),(81,217,1,0,0,0,0,0,0,NULL),(81,253,0,2,0,0,0,0,0,NULL),(81,254,0,1,0,0,0,0,0,NULL),(81,339,4,0,0,0,0,0,0,NULL),(81,381,0,0,0,0,0,0,0,NULL),(82,129,0,0,0,0,0,0,0,NULL),(82,130,0,0,0,0,0,0,0,NULL),(82,131,0,0,0,0,0,0,0,NULL),(82,135,1,0,0,0,0,0,0,NULL),(82,136,0,0,0,0,0,0,0,NULL),(82,140,1,0,1,0,0,0,0,NULL),(82,173,1,0,0,0,0,0,0,NULL),(82,174,0,0,0,0,0,0,0,NULL),(82,176,0,0,0,0,0,0,0,NULL),(82,178,0,0,2,0,0,0,0,NULL),(82,179,0,0,0,0,0,0,0,NULL),(82,180,0,0,0,0,0,0,0,NULL),(82,181,0,0,0,0,2,0,0,NULL),(82,326,0,0,0,0,0,0,0,NULL),(82,328,0,0,0,0,0,0,0,NULL),(82,329,0,0,0,0,0,0,0,NULL),(82,396,1,0,1,0,0,0,0,NULL),(82,397,0,0,0,0,0,0,0,NULL),(82,398,1,0,0,0,0,0,0,NULL),(83,106,0,0,0,0,0,0,0,NULL),(83,107,0,0,0,0,0,0,0,NULL),(83,109,0,0,0,0,0,0,0,NULL),(83,110,1,0,0,0,0,0,0,NULL),(83,111,1,0,0,0,0,0,0,NULL),(83,112,0,0,0,0,0,0,0,NULL),(83,219,0,0,0,0,0,0,0,NULL),(83,222,0,0,0,0,0,0,0,NULL),(83,223,0,0,0,0,0,0,0,NULL),(83,224,1,0,0,0,0,0,1,NULL),(83,226,1,1,0,0,0,0,0,NULL),(83,227,0,0,0,0,0,0,0,NULL),(83,268,0,0,0,0,0,0,0,NULL),(83,269,0,0,0,0,0,0,0,NULL),(83,270,0,0,1,0,0,0,0,NULL),(83,332,0,0,1,0,0,0,0,NULL),(83,333,0,0,0,0,0,0,0,NULL),(83,334,0,1,0,0,0,0,0,NULL),(83,337,0,0,0,0,0,0,0,NULL),(83,348,3,0,0,0,0,0,0,NULL),(83,350,0,0,0,0,0,0,0,NULL),(83,399,0,0,0,0,0,0,0,NULL),(84,82,0,0,0,0,0,0,0,NULL),(84,83,0,0,0,0,0,0,0,NULL),(84,84,0,0,0,0,0,0,0,NULL),(84,86,0,0,0,0,0,0,0,NULL),(84,88,0,0,1,0,0,0,0,NULL),(84,90,3,0,0,0,1,0,0,NULL),(84,197,0,0,0,0,0,0,0,NULL),(84,201,0,0,0,0,1,0,0,NULL),(84,204,0,0,1,0,0,0,0,NULL),(84,207,0,0,0,0,0,0,0,NULL),(84,208,0,0,1,0,0,0,0,NULL),(84,209,1,0,0,0,0,0,0,NULL),(84,210,0,0,0,0,0,0,0,NULL),(84,211,0,0,1,0,0,0,0,NULL),(84,213,1,0,1,0,0,0,0,NULL),(84,290,0,0,0,0,0,0,0,NULL),(84,322,0,0,0,0,0,0,0,NULL),(84,323,1,0,0,0,0,0,0,NULL),(84,324,0,0,1,0,0,0,0,NULL),(84,400,0,0,1,0,0,0,0,NULL),(84,401,0,0,0,0,0,0,0,NULL),(85,59,0,0,0,0,0,0,0,NULL),(85,61,1,0,0,0,0,0,0,NULL),(85,63,1,0,1,0,0,0,0,NULL),(85,185,0,0,0,0,0,0,0,NULL),(85,187,0,0,0,0,0,0,0,NULL),(85,190,1,0,0,0,0,0,0,NULL),(85,194,2,0,0,0,0,0,0,NULL),(85,196,0,0,0,0,0,0,0,NULL),(85,286,0,0,0,0,0,0,0,NULL),(85,287,1,0,0,0,0,0,0,NULL),(85,288,0,0,0,0,0,0,0,NULL),(85,289,1,0,0,0,0,0,0,NULL),(85,318,0,0,0,0,0,0,0,NULL),(85,394,1,0,0,0,0,0,0,NULL),(86,38,0,0,0,0,0,0,0,NULL),(86,41,0,0,0,0,0,0,0,NULL),(86,42,0,0,0,0,0,0,0,NULL),(86,43,0,0,0,0,0,0,0,NULL),(86,45,1,0,0,0,0,0,0,NULL),(86,239,0,0,0,0,0,0,0,NULL),(86,240,0,0,0,0,0,0,0,NULL),(86,241,0,0,0,0,0,0,0,NULL),(86,242,0,0,0,0,0,0,0,NULL),(86,243,0,0,0,0,0,0,0,NULL),(86,244,0,0,0,0,0,0,0,NULL),(86,246,0,0,0,0,0,0,0,NULL),(86,247,2,0,0,0,0,0,0,NULL),(86,248,0,0,0,0,0,0,0,NULL),(86,294,0,0,0,0,0,0,0,NULL),(86,296,0,0,1,0,0,0,0,NULL),(86,297,0,0,0,0,1,0,0,NULL),(86,299,0,0,0,0,0,0,0,NULL),(86,317,0,0,0,0,0,0,0,NULL),(86,347,0,0,0,0,0,0,0,NULL),(86,376,0,0,0,0,0,0,0,NULL),(86,402,0,0,0,0,0,0,0,NULL),(87,1,0,0,0,0,0,0,0,NULL),(87,2,0,0,0,0,0,0,0,NULL),(87,5,1,0,0,0,0,0,0,NULL),(87,6,0,0,0,0,0,0,0,NULL),(87,7,1,0,1,0,0,0,0,NULL),(87,8,1,0,0,0,0,0,0,NULL),(87,9,1,0,1,0,0,0,0,NULL),(87,10,1,0,0,0,0,0,0,NULL),(87,163,0,0,0,0,0,0,0,NULL),(87,164,1,0,0,0,0,0,0,NULL),(87,165,0,0,1,0,0,0,0,NULL),(87,166,0,0,0,0,0,0,0,NULL),(87,167,2,0,0,0,0,0,0,NULL),(87,169,0,0,0,0,0,0,0,NULL),(87,255,0,0,0,0,0,0,0,NULL),(87,259,0,0,0,0,0,0,0,NULL),(87,304,0,0,0,0,0,0,0,NULL),(87,306,0,0,0,0,0,0,0,NULL),(87,387,0,0,0,0,0,0,0,NULL),(87,392,0,0,0,0,0,0,0,NULL),(87,403,0,0,0,0,0,0,0,NULL),(87,404,0,0,0,0,0,0,0,NULL),(88,22,0,0,0,0,0,0,0,NULL),(88,23,0,0,0,0,0,0,0,NULL),(88,24,0,0,0,0,0,0,0,NULL),(88,25,0,0,0,0,0,0,0,NULL),(88,27,0,0,0,0,0,0,0,NULL),(88,28,0,0,0,0,0,0,0,NULL),(88,30,1,1,0,0,0,0,0,NULL),(88,31,1,0,1,0,0,0,0,NULL),(88,32,3,0,0,0,0,0,0,NULL),(88,33,0,0,0,0,0,0,0,NULL),(88,36,1,4,0,0,0,0,0,NULL),(88,143,0,0,0,0,0,0,0,NULL),(88,145,0,0,0,0,0,0,0,NULL),(88,147,0,0,0,0,0,0,0,NULL),(88,150,0,0,0,0,0,0,0,NULL),(88,151,0,0,0,0,0,0,0,NULL),(88,152,1,0,0,0,0,0,0,NULL),(88,263,0,0,0,0,0,0,0,NULL),(88,264,0,0,0,0,0,0,0,NULL),(88,358,0,0,0,0,0,0,0,NULL),(88,370,0,0,0,0,0,0,0,NULL),(88,374,0,0,0,0,0,0,0,NULL),(88,390,0,0,0,0,0,0,0,NULL),(90,71,0,0,0,0,0,0,0,NULL),(90,73,0,0,1,0,0,0,0,NULL),(90,75,1,0,0,0,0,0,0,NULL),(90,76,0,0,0,0,0,0,0,NULL),(90,77,2,0,0,0,0,0,0,NULL),(90,92,1,0,0,0,0,0,0,NULL),(90,94,0,0,0,0,0,0,0,NULL),(90,97,1,0,0,0,0,0,0,NULL),(90,100,0,0,0,0,0,0,0,NULL),(90,102,0,0,0,0,0,0,0,NULL),(90,104,0,0,0,0,0,0,0,NULL),(90,279,0,0,0,0,0,0,0,NULL),(90,280,0,0,0,0,0,0,0,NULL),(90,281,0,0,0,0,0,0,0,NULL),(90,282,1,0,0,0,0,0,0,NULL),(90,283,4,0,0,0,0,0,0,NULL),(90,291,0,0,0,0,0,0,0,NULL),(90,292,0,0,0,0,0,0,0,NULL),(90,315,0,0,0,0,0,0,0,NULL),(90,365,0,0,0,0,0,0,0,NULL),(90,366,0,0,0,0,0,0,0,NULL),(90,405,0,0,0,0,0,0,0,NULL),(91,12,0,0,0,0,0,0,0,NULL),(91,13,0,0,0,0,0,0,0,NULL),(91,15,0,0,0,0,0,0,0,NULL),(91,16,0,0,0,0,0,0,0,NULL),(91,17,0,0,0,0,0,0,0,NULL),(91,18,0,0,0,0,0,0,0,NULL),(91,19,0,0,0,0,0,0,0,NULL),(91,21,0,0,0,0,0,0,0,NULL),(91,92,1,0,0,0,0,0,0,NULL),(91,93,0,0,0,0,0,0,0,NULL),(91,94,0,0,0,0,0,0,0,NULL),(91,96,3,0,0,0,0,0,0,NULL),(91,97,1,0,0,0,0,0,0,NULL),(91,98,1,0,0,0,0,0,0,NULL),(91,99,0,0,0,0,0,0,0,NULL),(91,100,0,0,0,0,0,0,0,NULL),(91,103,0,0,0,0,0,0,0,NULL),(91,104,1,0,0,0,0,0,0,NULL),(91,214,0,0,0,0,0,0,0,NULL),(91,216,1,0,0,0,0,0,0,NULL),(91,217,0,0,0,0,0,0,0,NULL),(91,279,0,0,0,0,0,0,0,NULL),(91,282,0,0,0,0,0,0,0,NULL),(91,283,1,0,0,0,0,0,0,NULL),(91,284,0,0,0,0,0,0,0,NULL),(91,339,0,0,0,0,0,0,0,NULL),(91,365,0,0,0,0,0,0,0,NULL),(91,371,0,0,0,0,0,0,0,NULL),(92,71,0,0,1,0,0,0,0,NULL),(92,72,0,0,0,0,0,0,0,NULL),(92,74,0,0,0,0,0,0,0,NULL),(92,75,0,0,1,0,0,0,0,NULL),(92,76,0,0,0,0,0,0,0,NULL),(92,77,0,0,0,0,0,0,0,NULL),(92,115,0,0,0,1,0,0,0,NULL),(92,116,0,0,0,0,0,0,0,NULL),(92,120,0,0,0,0,0,0,0,NULL),(92,121,0,0,0,0,0,0,0,NULL),(92,125,0,0,0,0,0,0,0,NULL),(92,126,0,0,0,0,0,0,0,NULL),(92,127,0,0,0,0,0,0,0,NULL),(92,272,2,0,0,0,0,0,0,NULL),(92,293,0,0,0,0,0,0,0,NULL),(92,315,0,0,0,0,0,0,0,NULL),(92,320,2,0,0,0,0,0,0,NULL),(92,321,1,0,0,0,0,0,0,NULL),(92,361,0,0,0,0,0,0,0,NULL),(92,362,0,0,0,0,0,0,0,NULL),(92,363,0,0,0,0,0,0,0,NULL),(92,366,0,0,0,0,0,0,0,NULL),(92,369,1,0,0,0,0,0,0,NULL),(92,405,0,0,0,0,0,0,0,NULL),(93,46,0,0,0,0,0,0,0,NULL),(93,47,0,0,0,0,0,0,0,NULL),(93,48,1,0,0,0,0,0,0,NULL),(93,49,0,0,0,0,0,0,0,NULL),(93,50,0,0,0,0,0,0,0,NULL),(93,51,1,0,0,0,0,0,0,NULL),(93,52,0,0,0,0,0,0,0,NULL),(93,53,2,0,0,0,0,0,0,NULL),(93,54,2,0,0,0,0,0,0,NULL),(93,143,0,0,0,0,0,0,0,NULL),(93,145,0,0,0,0,0,0,0,NULL),(93,147,0,0,0,0,0,0,0,NULL),(93,152,0,0,0,0,0,0,0,NULL),(93,262,0,0,0,0,0,0,0,NULL),(93,263,0,0,0,0,0,0,0,NULL),(93,264,0,0,0,0,0,0,0,NULL),(93,302,0,0,0,0,0,0,0,NULL),(93,312,0,0,0,0,0,0,0,NULL),(93,314,0,0,0,0,0,0,0,NULL),(93,374,0,0,0,0,0,0,0,NULL),(93,406,0,0,0,0,0,0,0,NULL),(93,407,1,0,0,0,0,0,0,NULL),(93,408,0,0,0,0,0,0,0,NULL),(94,27,0,1,0,0,0,0,0,NULL),(94,30,0,1,0,0,0,0,0,NULL),(94,32,4,0,0,0,0,0,0,NULL),(94,34,0,0,0,0,0,0,0,NULL),(94,36,1,2,0,0,0,0,0,NULL),(94,163,0,0,0,0,0,0,0,NULL),(94,164,0,0,0,0,0,0,0,NULL),(94,165,1,0,0,0,0,0,0,NULL),(94,166,0,0,0,0,0,0,0,NULL),(94,167,2,0,0,0,0,0,0,NULL),(94,168,1,0,0,0,0,0,0,NULL),(94,169,0,0,0,0,0,0,0,NULL),(94,255,0,0,0,0,0,0,0,NULL),(94,259,0,0,0,0,0,0,0,NULL),(94,311,1,0,0,0,0,0,0,NULL),(94,370,0,0,0,0,0,0,0,NULL),(94,387,0,0,0,0,0,0,0,NULL),(94,392,0,0,0,0,0,0,0,NULL),(94,404,2,0,0,0,0,0,0,NULL),(94,409,0,0,0,0,0,0,0,NULL),(94,410,0,0,0,0,0,0,0,NULL),(95,1,0,0,0,0,0,0,0,NULL),(95,2,0,0,0,0,0,0,0,NULL),(95,5,0,0,1,0,0,0,0,NULL),(95,6,0,0,0,0,0,0,0,NULL),(95,7,1,0,0,0,0,0,0,NULL),(95,8,0,0,0,0,0,0,0,NULL),(95,9,3,0,0,0,0,0,0,NULL),(95,10,0,0,0,0,0,0,0,NULL),(95,239,0,0,0,0,0,0,0,NULL),(95,241,0,0,0,0,0,0,0,NULL),(95,242,0,0,0,0,0,0,0,NULL),(95,243,0,0,0,0,0,0,0,NULL),(95,244,1,0,0,0,0,0,0,NULL),(95,247,0,0,0,0,0,0,0,NULL),(95,249,0,0,0,0,0,0,0,NULL),(95,250,2,0,1,0,0,0,0,NULL),(95,304,0,0,0,0,0,0,0,NULL),(95,306,0,0,0,0,0,0,0,NULL),(95,402,0,0,0,0,0,0,0,NULL),(95,403,0,0,0,0,0,0,0,NULL),(96,38,0,0,0,0,0,0,0,NULL),(96,40,0,0,0,0,0,0,0,NULL),(96,43,0,0,0,0,0,0,0,NULL),(96,45,0,0,0,0,0,0,0,NULL),(96,182,0,0,0,0,0,0,0,NULL),(96,183,0,0,0,0,1,0,0,NULL),(96,185,0,0,0,0,0,0,0,NULL),(96,187,0,0,0,0,0,0,0,NULL),(96,193,0,0,0,0,0,0,0,NULL),(96,194,0,0,0,0,0,0,0,NULL),(96,196,3,0,0,0,0,0,0,NULL),(96,294,0,0,0,0,0,0,0,NULL),(96,297,0,0,0,0,0,0,0,NULL),(96,298,0,0,0,0,0,0,0,NULL),(96,299,0,0,0,0,0,0,0,NULL),(96,317,0,0,0,0,0,0,0,NULL),(96,379,0,0,0,0,0,0,0,NULL),(96,393,0,0,0,0,0,0,0,NULL),(96,394,3,0,0,0,0,0,0,NULL),(96,411,1,0,0,0,0,0,0,NULL),(97,57,0,0,0,0,0,0,0,NULL),(97,59,1,0,0,0,0,0,0,NULL),(97,60,0,0,0,0,0,0,0,NULL),(97,62,0,0,0,0,0,0,0,NULL),(97,63,0,0,0,0,0,0,0,NULL),(97,64,0,0,1,0,0,0,0,NULL),(97,65,0,0,0,0,0,0,0,NULL),(97,66,0,0,0,0,0,0,0,NULL),(97,67,0,0,0,0,0,0,0,NULL),(97,197,0,0,0,0,0,0,0,NULL),(97,198,0,0,0,0,0,0,0,NULL),(97,199,0,0,1,0,0,0,0,NULL),(97,201,3,0,0,0,0,0,0,NULL),(97,208,0,0,0,0,0,0,0,NULL),(97,209,0,0,0,0,0,0,0,NULL),(97,210,0,0,0,0,0,0,0,NULL),(97,211,3,0,0,0,0,0,0,NULL),(97,212,2,0,0,0,0,0,0,NULL),(97,213,2,0,0,0,0,0,0,NULL),(97,286,0,0,0,0,0,0,0,NULL),(97,318,0,0,0,0,0,0,0,NULL),(97,319,0,0,0,0,0,0,0,NULL),(97,359,1,0,0,0,0,0,0,NULL),(97,385,2,0,1,0,0,0,0,NULL),(98,82,0,0,0,0,0,0,0,NULL),(98,83,0,0,0,0,0,0,0,NULL),(98,84,0,0,0,0,0,0,0,NULL),(98,85,2,0,0,0,0,0,0,NULL),(98,87,0,0,0,0,0,0,0,NULL),(98,88,1,0,0,0,0,0,0,NULL),(98,90,1,0,0,0,0,0,0,NULL),(98,219,0,0,0,0,0,0,0,NULL),(98,222,0,0,0,0,0,0,0,NULL),(98,223,0,0,0,0,0,0,0,NULL),(98,224,2,0,0,0,0,0,0,NULL),(98,226,0,2,0,0,0,0,0,NULL),(98,277,0,0,0,0,0,0,0,NULL),(98,324,0,0,0,0,0,0,0,NULL),(98,332,0,0,0,0,0,0,0,NULL),(98,333,1,0,0,0,0,0,0,NULL),(98,334,1,0,0,0,0,0,0,NULL),(98,357,1,0,0,0,0,0,0,NULL),(98,412,0,0,0,0,0,0,0,NULL),(98,413,0,0,0,0,0,0,0,NULL),(98,414,0,0,0,0,0,0,0,NULL),(98,415,0,2,0,0,0,0,0,NULL),(98,416,0,0,0,0,0,0,0,NULL),(99,106,0,0,0,0,0,0,0,NULL),(99,107,0,0,0,0,0,0,0,NULL),(99,110,0,0,0,0,0,0,0,NULL),(99,111,0,0,0,0,0,0,0,NULL),(99,112,0,0,0,0,1,0,0,NULL),(99,172,0,0,0,0,0,0,0,NULL),(99,174,0,0,0,0,0,0,0,NULL),(99,175,0,0,0,0,0,0,0,NULL),(99,179,0,0,0,0,0,0,0,NULL),(99,180,0,0,0,0,0,0,0,NULL),(99,181,0,0,1,0,0,0,0,NULL),(99,232,0,0,0,0,0,0,0,NULL),(99,233,0,0,1,0,0,0,0,NULL),(99,235,0,0,0,0,0,0,0,NULL),(99,237,0,0,1,0,0,0,0,NULL),(99,268,0,0,1,0,0,0,0,NULL),(99,269,1,0,0,0,0,0,0,NULL),(99,270,0,0,0,0,0,0,0,NULL),(99,348,1,0,0,0,0,0,0,NULL),(99,350,0,0,0,0,0,0,0,NULL),(99,351,0,0,0,0,0,0,0,NULL),(99,378,0,0,0,0,0,0,0,NULL),(100,129,0,0,0,0,0,0,0,NULL),(100,130,0,0,1,0,0,0,0,NULL),(100,131,0,0,0,0,0,0,0,NULL),(100,133,0,0,0,0,0,0,0,NULL),(100,135,0,0,0,0,0,0,0,NULL),(100,136,0,0,0,0,0,0,0,NULL),(100,140,1,0,0,0,0,0,0,NULL),(100,155,0,0,0,0,0,0,0,NULL),(100,156,0,2,1,0,0,0,0,NULL),(100,157,2,0,0,0,0,0,0,NULL),(100,158,0,1,0,0,0,0,0,NULL),(100,160,0,0,0,0,0,0,0,NULL),(100,161,1,0,0,0,0,0,0,NULL),(100,254,0,0,0,0,0,0,0,NULL),(100,326,0,0,0,0,0,0,0,NULL),(100,340,0,0,0,0,0,0,0,NULL),(100,342,0,0,0,0,0,0,0,NULL),(100,346,0,0,0,0,0,0,0,NULL),(100,381,0,0,0,0,0,0,0,NULL),(100,383,2,1,0,0,0,0,0,NULL),(100,396,0,0,0,0,0,0,0,NULL),(100,397,1,0,0,0,0,0,0,NULL),(100,398,1,0,0,0,0,0,0,NULL),(101,12,0,0,0,0,0,0,0,NULL),(101,13,0,0,0,0,0,0,0,NULL),(101,15,2,0,0,0,0,0,0,NULL),(101,16,0,0,0,0,0,0,0,NULL),(101,19,0,0,0,0,0,0,0,NULL),(101,21,0,0,0,0,0,0,1,NULL),(101,129,0,0,0,0,0,0,0,NULL),(101,131,0,0,0,0,0,0,0,NULL),(101,133,0,0,0,0,0,0,0,NULL),(101,136,1,0,1,0,0,0,0,NULL),(101,139,0,0,0,0,0,0,0,NULL),(101,140,1,0,0,0,0,0,0,NULL),(101,215,0,0,0,0,0,0,0,NULL),(101,216,0,0,1,0,0,0,0,NULL),(101,326,0,0,0,0,0,0,0,NULL),(101,339,0,0,0,0,0,0,0,NULL),(101,345,0,0,0,0,0,0,0,NULL),(101,346,0,0,0,0,0,0,0,NULL),(101,398,0,0,0,0,0,0,1,NULL),(101,417,1,0,0,0,0,0,0,NULL),(102,110,0,0,0,0,0,0,0,NULL),(102,111,1,0,0,0,0,0,0,NULL),(102,112,0,0,1,0,0,0,0,NULL),(102,155,0,0,0,0,0,0,0,NULL),(102,156,1,1,0,0,0,0,0,NULL),(102,157,0,0,0,0,0,0,0,NULL),(102,159,0,0,0,0,0,0,0,NULL),(102,160,0,0,0,0,0,0,0,NULL),(102,161,1,0,0,0,0,0,0,NULL),(102,251,0,0,2,0,0,0,0,NULL),(102,267,0,0,0,0,0,0,0,NULL),(102,269,2,0,0,0,0,0,0,NULL),(102,348,1,0,0,0,0,0,0,NULL),(102,350,0,0,1,0,0,0,0,NULL),(102,380,0,0,0,0,0,0,0,NULL),(102,381,0,0,0,0,0,0,0,NULL),(102,418,0,0,0,0,0,0,0,NULL),(102,419,0,0,0,0,0,0,0,NULL),(102,420,0,0,0,0,0,0,0,NULL),(103,82,1,0,0,0,0,0,0,NULL),(103,83,0,0,0,0,0,0,0,NULL),(103,84,0,0,0,0,0,0,0,NULL),(103,86,1,0,0,0,0,0,0,NULL),(103,88,0,0,0,0,0,0,0,NULL),(103,90,1,0,0,0,0,0,0,NULL),(103,173,0,0,0,0,0,0,0,NULL),(103,174,0,0,0,0,0,0,0,NULL),(103,176,0,0,1,0,0,0,0,NULL),(103,178,0,0,1,0,0,0,0,NULL),(103,181,0,0,0,0,0,0,0,NULL),(103,232,0,0,0,0,0,0,0,NULL),(103,235,0,0,1,0,0,0,0,NULL),(103,237,1,0,0,0,0,0,0,NULL),(103,276,0,0,0,0,0,0,0,NULL),(103,277,0,0,0,0,0,0,0,NULL),(103,278,0,0,0,0,0,0,0,NULL),(103,290,0,0,0,0,0,0,0,NULL),(103,328,0,0,0,0,0,0,0,NULL),(103,329,0,0,0,0,0,0,0,NULL),(104,57,0,0,1,0,0,0,0,NULL),(104,59,0,0,1,0,0,0,0,NULL),(104,62,1,0,0,0,0,0,0,NULL),(104,63,2,0,0,0,0,0,0,NULL),(104,64,0,0,0,0,0,0,0,NULL),(104,66,0,0,0,0,0,0,0,NULL),(104,218,0,0,0,0,0,0,0,NULL),(104,220,1,0,0,0,0,0,0,NULL),(104,222,0,0,0,0,0,0,0,NULL),(104,223,0,0,1,0,0,0,0,NULL),(104,224,0,0,0,0,0,0,0,NULL),(104,285,0,0,0,0,0,0,0,NULL),(104,286,0,0,0,0,0,0,0,NULL),(104,289,0,0,0,0,0,0,0,NULL),(104,331,0,0,0,0,0,0,0,NULL),(104,332,0,0,0,0,0,0,0,NULL),(104,333,0,0,1,0,0,0,0,NULL),(104,334,0,0,0,0,0,0,0,NULL),(104,336,0,0,0,0,0,0,0,NULL),(104,337,0,0,0,0,0,0,0,NULL),(104,359,0,0,1,0,0,0,0,NULL),(104,415,0,0,0,0,0,0,0,NULL),(104,421,0,0,0,0,0,0,0,NULL),(105,38,1,0,0,0,0,0,0,NULL),(105,40,0,0,0,0,0,0,0,NULL),(105,41,0,0,0,0,0,0,0,NULL),(105,42,1,0,1,0,0,0,0,NULL),(105,43,0,0,0,0,0,0,0,NULL),(105,45,2,0,0,0,0,0,0,NULL),(105,197,0,0,0,0,0,0,0,NULL),(105,199,0,0,0,0,0,0,0,NULL),(105,201,1,0,1,0,1,0,0,NULL),(105,205,0,0,0,0,0,0,0,NULL),(105,206,0,0,0,0,0,0,0,NULL),(105,209,1,0,0,0,0,0,0,NULL),(105,212,0,0,0,0,0,0,0,NULL),(105,213,0,0,0,0,0,0,0,NULL),(105,294,0,0,0,0,0,0,0,NULL),(105,296,0,0,0,0,0,0,0,NULL),(105,297,0,0,0,0,0,0,0,NULL),(105,299,0,0,0,0,0,0,0,NULL),(105,316,0,0,0,0,0,0,0,NULL),(105,317,0,0,0,0,0,0,0,NULL),(105,330,0,0,0,0,0,0,0,NULL),(105,385,1,0,0,0,0,0,0,NULL),(105,422,0,0,0,0,0,0,0,NULL),(107,23,0,0,0,0,0,0,0,NULL),(107,29,0,0,0,0,0,0,0,NULL),(107,30,0,0,0,0,0,0,0,NULL),(107,31,0,1,0,0,0,0,0,NULL),(107,33,0,0,0,0,0,0,0,NULL),(107,34,1,0,0,0,0,0,0,NULL),(107,36,2,0,0,0,0,0,0,NULL),(107,239,0,0,0,0,0,0,0,NULL),(107,241,0,0,0,0,0,0,0,NULL),(107,242,0,0,0,0,0,0,0,NULL),(107,243,0,0,0,0,0,0,0,NULL),(107,244,0,0,0,0,0,0,0,NULL),(107,246,1,0,0,0,0,0,0,NULL),(107,247,0,0,0,0,0,0,0,NULL),(107,248,0,0,0,0,0,0,0,NULL),(107,249,0,0,0,0,0,0,0,NULL),(107,307,0,0,0,0,0,0,0,NULL),(107,311,0,1,0,0,0,0,0,NULL),(107,370,0,0,0,0,0,0,0,NULL),(107,376,0,0,0,0,0,0,0,NULL),(107,410,0,0,0,0,0,0,0,NULL),(107,423,0,0,0,0,0,0,0,NULL),(107,424,0,1,0,0,0,0,0,NULL),(107,425,0,0,0,0,0,0,0,NULL),(108,46,0,0,0,0,0,0,0,NULL),(108,47,1,0,0,0,0,0,0,NULL),(108,48,0,0,0,0,0,0,0,NULL),(108,49,0,0,0,0,0,0,0,NULL),(108,51,1,0,0,0,0,0,0,NULL),(108,52,0,0,0,0,0,0,0,NULL),(108,53,1,0,0,0,0,0,0,NULL),(108,54,2,0,0,0,0,0,0,NULL),(108,165,0,0,0,0,0,0,0,NULL),(108,166,0,0,0,0,0,0,0,NULL),(108,167,0,0,0,0,0,0,0,NULL),(108,168,0,0,0,0,0,0,0,NULL),(108,170,1,0,0,0,0,0,0,NULL),(108,256,0,0,0,0,0,0,0,NULL),(108,258,1,0,0,0,0,0,0,NULL),(108,259,0,0,0,0,0,0,0,NULL),(108,302,0,0,0,0,0,0,0,NULL),(108,303,0,0,0,0,0,0,0,NULL),(108,312,0,0,0,0,0,0,0,NULL),(108,314,0,0,0,0,0,0,0,NULL),(108,386,0,0,0,0,0,0,0,NULL),(108,426,0,0,0,0,0,0,0,NULL),(109,69,1,0,0,0,0,0,0,NULL),(109,74,0,0,0,0,0,0,0,NULL),(109,75,1,0,0,0,0,0,0,NULL),(109,76,1,0,0,0,0,0,0,NULL),(109,77,0,0,0,0,0,0,1,NULL),(109,143,0,0,0,0,0,0,0,NULL),(109,147,4,0,0,0,0,0,0,NULL),(109,148,0,0,0,0,0,0,0,NULL),(109,151,2,0,0,0,0,0,0,NULL),(109,152,0,0,0,0,0,0,0,NULL),(109,261,0,0,0,0,0,0,0,NULL),(109,263,0,0,0,0,0,0,0,NULL),(109,266,0,0,1,0,0,0,0,NULL),(109,291,0,0,0,0,0,0,0,NULL),(109,315,0,0,0,0,0,0,0,NULL),(109,358,0,0,0,0,0,0,0,NULL),(109,366,0,0,0,0,0,0,0,NULL),(109,369,3,0,0,0,0,0,0,NULL),(109,405,0,0,0,0,0,0,0,NULL),(109,427,0,0,0,0,0,0,0,NULL),(110,92,0,0,0,0,0,0,0,NULL),(110,94,0,0,0,0,0,0,0,NULL),(110,96,0,0,0,0,0,0,0,NULL),(110,99,0,0,0,0,0,0,0,NULL),(110,100,0,0,0,0,0,0,0,NULL),(110,104,0,0,0,0,0,0,0,NULL),(110,116,0,0,1,0,0,0,0,NULL),(110,117,1,0,0,0,0,0,0,NULL),(110,120,0,0,0,0,0,0,0,NULL),(110,121,0,0,0,0,0,0,0,NULL),(110,125,1,0,0,0,0,0,0,NULL),(110,280,0,0,0,0,0,0,0,NULL),(110,282,0,0,0,0,0,0,0,NULL),(110,283,0,0,0,0,0,0,0,NULL),(110,284,0,0,0,0,0,0,0,NULL),(110,321,0,0,0,0,0,0,0,NULL),(110,360,0,0,0,0,0,0,0,NULL),(110,361,0,0,1,0,0,0,0,NULL),(110,362,0,0,0,0,0,0,0,NULL),(110,365,0,0,0,0,0,0,0,NULL),(110,371,0,0,1,0,0,0,0,NULL),(111,12,0,0,0,0,0,0,0,NULL),(111,13,0,0,0,0,0,0,0,NULL),(111,15,0,0,0,0,0,0,0,NULL),(111,16,0,0,0,0,0,0,0,NULL),(111,17,0,0,0,0,0,0,0,NULL),(111,19,1,0,1,0,0,0,0,NULL),(111,21,0,0,0,0,0,0,0,NULL),(111,115,0,0,0,0,0,0,0,NULL),(111,116,0,0,0,0,0,0,0,NULL),(111,121,0,0,0,0,0,0,0,NULL),(111,125,0,0,0,0,0,0,0,NULL),(111,126,0,0,0,0,0,0,0,NULL),(111,215,0,0,0,0,0,0,0,NULL),(111,216,0,0,1,0,0,0,0,NULL),(111,217,0,0,0,0,0,0,0,NULL),(111,271,0,0,0,0,0,0,0,NULL),(111,320,1,0,0,0,0,0,0,NULL),(111,321,0,0,0,0,0,0,0,NULL),(111,361,0,0,0,0,0,0,0,NULL),(111,362,0,0,0,0,0,0,0,NULL),(111,363,0,0,1,0,0,0,0,NULL),(111,372,0,0,0,0,0,0,0,NULL),(111,417,0,0,1,0,0,0,0,NULL),(111,428,0,0,0,0,0,0,0,NULL),(112,91,0,0,0,0,0,0,0,NULL),(112,92,1,0,0,0,0,0,0,NULL),(112,94,1,0,0,0,0,0,0,NULL),(112,95,0,0,0,0,0,0,0,NULL),(112,97,0,0,0,0,0,0,0,NULL),(112,98,0,0,0,0,0,0,0,NULL),(112,99,0,0,0,0,0,0,0,NULL),(112,103,0,0,0,0,0,0,0,NULL),(112,104,0,0,0,0,0,0,0,NULL),(112,143,0,0,0,0,0,0,0,NULL),(112,145,0,0,0,0,0,0,0,NULL),(112,147,1,0,0,0,0,0,0,NULL),(112,148,0,1,0,0,0,1,0,NULL),(112,150,0,0,0,0,0,0,0,NULL),(112,152,1,0,0,0,0,0,0,NULL),(112,261,0,0,0,0,0,0,0,NULL),(112,263,0,0,0,0,0,0,0,NULL),(112,264,0,1,0,0,0,0,0,NULL),(112,280,0,0,0,0,0,0,0,NULL),(112,283,0,0,0,0,0,0,0,NULL),(112,358,0,0,0,0,0,0,0,NULL),(112,365,0,0,0,0,0,0,0,NULL),(112,374,0,0,0,0,0,0,0,NULL),(112,407,0,0,0,0,0,0,0,NULL),(112,429,0,0,0,0,0,0,0,NULL),(113,69,0,0,0,0,0,0,0,NULL),(113,71,0,0,0,0,0,0,0,NULL),(113,72,0,0,0,0,0,0,0,NULL),(113,75,2,0,0,0,0,0,0,NULL),(113,76,1,0,0,0,0,0,0,NULL),(113,77,0,0,0,0,0,0,0,NULL),(113,80,1,0,0,0,0,0,0,NULL),(113,163,0,0,0,0,0,0,0,NULL),(113,164,0,0,0,0,0,0,0,NULL),(113,167,2,0,0,0,0,0,0,NULL),(113,168,0,0,0,0,0,0,0,NULL),(113,169,0,0,0,0,0,0,0,NULL),(113,170,1,0,0,0,0,0,0,NULL),(113,255,0,0,0,0,0,0,0,NULL),(113,257,0,0,0,0,0,0,0,NULL),(113,259,1,0,0,0,0,0,0,NULL),(113,291,1,0,0,0,0,0,0,NULL),(113,366,0,0,0,0,0,0,0,NULL),(113,369,1,0,0,0,0,0,0,NULL),(113,405,0,0,0,0,0,0,0,NULL),(114,46,0,0,0,0,0,0,0,NULL),(114,47,0,0,0,0,0,0,0,NULL),(114,48,0,0,0,0,0,0,0,NULL),(114,49,0,0,0,0,0,0,0,NULL),(114,51,0,0,0,0,0,0,0,NULL),(114,52,0,0,0,0,0,0,0,NULL),(114,53,0,0,0,0,0,0,0,NULL),(114,54,1,0,0,0,0,0,0,NULL),(114,238,0,0,0,0,0,0,0,NULL),(114,239,0,0,1,0,0,0,0,NULL),(114,240,0,0,0,0,0,0,0,NULL),(114,241,0,0,0,0,0,0,0,NULL),(114,244,1,0,0,0,0,0,0,NULL),(114,246,0,0,0,0,0,0,0,NULL),(114,247,0,0,0,0,0,0,0,NULL),(114,250,1,0,1,0,0,0,0,NULL),(114,302,0,0,0,0,0,0,0,NULL),(114,303,0,0,0,0,0,0,0,NULL),(114,312,0,0,0,0,0,0,0,NULL),(114,314,0,0,0,0,0,0,0,NULL),(115,23,0,0,0,0,0,0,0,NULL),(115,24,0,0,0,0,0,0,0,NULL),(115,29,0,0,0,0,0,0,0,NULL),(115,30,0,3,0,0,0,0,0,NULL),(115,31,0,1,0,0,0,0,0,NULL),(115,33,0,1,0,0,0,0,0,NULL),(115,34,3,1,0,0,0,0,0,NULL),(115,36,1,0,0,0,0,0,0,NULL),(115,182,0,0,0,0,0,0,0,NULL),(115,183,0,0,0,1,0,0,0,NULL),(115,187,0,0,1,0,0,0,0,NULL),(115,190,0,0,0,0,0,0,0,NULL),(115,194,2,0,0,0,0,0,0,NULL),(115,196,0,0,0,0,0,0,0,NULL),(115,307,0,0,0,0,0,0,0,NULL),(115,311,0,0,1,0,0,0,0,NULL),(115,393,0,0,0,0,0,0,0,NULL),(115,394,2,0,0,0,0,0,0,NULL),(115,423,1,0,0,0,0,0,0,NULL),(115,424,4,2,0,0,0,0,0,NULL),(116,1,0,0,1,0,0,0,0,NULL),(116,2,0,0,0,0,0,0,0,NULL),(116,4,0,0,1,0,0,0,0,NULL),(116,5,0,0,0,0,0,0,0,NULL),(116,7,1,0,0,0,0,0,0,NULL),(116,8,1,0,0,0,0,0,0,NULL),(116,9,0,0,0,0,0,0,0,NULL),(116,10,0,0,0,0,0,0,0,NULL),(116,11,0,0,0,0,0,0,0,NULL),(116,197,0,0,0,0,0,0,0,NULL),(116,199,0,0,0,0,0,0,0,NULL),(116,201,3,0,0,0,0,0,0,NULL),(116,203,0,0,0,0,0,0,0,NULL),(116,209,1,0,0,0,0,0,0,NULL),(116,210,1,0,0,0,0,0,0,NULL),(116,211,1,0,0,0,0,0,0,NULL),(116,212,1,0,0,0,0,0,0,NULL),(116,304,0,0,0,0,0,0,0,NULL),(116,305,0,0,0,0,0,0,0,NULL),(116,306,0,0,1,0,0,0,0,NULL),(116,330,0,0,0,0,0,0,0,NULL),(116,385,0,0,0,0,0,0,0,NULL),(116,403,0,0,0,0,0,0,0,NULL),(116,422,0,0,0,0,0,0,0,NULL),(116,430,0,0,0,0,0,0,0,NULL),(117,38,0,0,0,0,0,0,0,NULL),(117,39,0,0,0,0,0,0,0,NULL),(117,40,0,0,0,0,0,0,0,NULL),(117,41,0,0,0,0,0,0,0,NULL),(117,42,1,0,0,0,0,1,0,NULL),(117,43,1,0,0,0,0,0,0,NULL),(117,45,1,0,0,0,0,0,0,NULL),(117,220,0,0,0,0,0,0,0,NULL),(117,224,0,0,1,0,0,0,0,NULL),(117,226,1,1,0,0,0,0,0,NULL),(117,294,0,0,0,0,0,0,0,NULL),(117,296,0,0,0,0,0,0,0,NULL),(117,298,0,0,0,0,0,0,0,NULL),(117,299,1,0,0,0,0,0,0,NULL),(117,332,0,0,1,0,0,0,0,NULL),(117,333,0,0,1,0,0,0,0,NULL),(117,334,0,0,0,0,0,0,0,NULL),(117,336,1,0,0,0,0,0,0,NULL),(117,395,0,0,0,0,0,0,0,NULL),(117,399,0,0,0,0,0,0,0,NULL),(117,412,0,0,0,0,0,0,0,NULL),(117,421,1,1,0,0,0,0,0,NULL),(117,431,0,0,0,0,0,0,0,NULL),(118,58,0,0,0,0,0,0,0,NULL),(118,59,1,0,0,0,0,0,0,NULL),(118,62,1,0,0,0,0,0,0,NULL),(118,64,0,0,0,0,0,0,0,NULL),(118,66,0,0,0,0,0,0,0,NULL),(118,173,3,0,0,0,0,0,0,NULL),(118,175,0,0,0,0,0,0,0,NULL),(118,176,0,0,0,0,0,0,0,NULL),(118,178,2,0,0,0,0,0,0,NULL),(118,180,0,0,0,0,0,0,0,NULL),(118,232,1,0,0,0,0,0,0,NULL),(118,233,0,0,0,0,0,0,0,NULL),(118,236,0,0,0,0,0,0,0,NULL),(118,288,0,0,0,0,0,0,0,NULL),(118,289,1,0,0,0,0,0,0,NULL),(118,318,0,0,0,0,0,0,0,NULL),(118,328,0,0,0,0,0,0,0,NULL),(118,329,0,0,0,0,0,0,0,NULL),(118,359,0,0,0,0,0,0,0,NULL),(119,82,0,0,0,0,0,0,0,NULL),(119,83,0,0,0,0,0,0,0,NULL),(119,84,0,0,0,0,0,0,0,NULL),(119,85,0,0,0,0,0,0,0,NULL),(119,88,2,0,0,0,0,0,0,NULL),(119,155,0,0,0,0,0,0,0,NULL),(119,156,0,0,0,0,0,0,0,NULL),(119,158,0,1,0,0,0,0,0,NULL),(119,159,1,0,0,0,0,0,0,NULL),(119,160,0,0,0,0,0,0,0,NULL),(119,161,0,0,0,0,0,0,0,NULL),(119,162,0,0,0,0,0,0,0,NULL),(119,254,1,0,0,0,0,0,0,NULL),(119,276,0,0,0,0,0,0,0,NULL),(119,277,0,0,0,0,0,0,0,NULL),(119,278,0,0,0,0,0,0,0,NULL),(119,290,0,0,0,0,0,0,0,NULL),(119,324,1,0,0,0,0,0,0,NULL),(119,342,0,0,0,0,0,0,0,NULL),(119,357,2,0,0,0,0,0,0,NULL),(119,380,0,0,0,0,0,0,0,NULL),(119,383,0,1,0,0,0,0,0,NULL),(119,432,0,0,0,0,0,0,0,NULL),(119,433,0,0,0,0,0,0,0,NULL),(120,106,0,0,0,0,0,0,0,NULL),(120,107,0,0,0,1,0,0,0,NULL),(120,109,0,0,1,0,0,0,0,NULL),(120,110,0,0,0,0,0,0,0,NULL),(120,111,1,0,0,0,0,0,0,NULL),(120,112,2,0,0,0,1,0,0,NULL),(120,131,0,0,0,0,0,0,0,NULL),(120,133,0,0,0,0,0,0,0,NULL),(120,135,1,0,0,0,0,0,0,NULL),(120,136,0,0,0,0,1,0,0,NULL),(120,137,0,0,0,0,0,0,0,NULL),(120,139,0,0,0,0,0,0,0,NULL),(120,140,1,0,0,0,0,0,0,NULL),(120,267,0,0,0,0,0,0,0,NULL),(120,268,0,0,0,0,0,0,0,NULL),(120,326,0,0,0,0,0,0,0,NULL),(120,345,0,0,0,0,0,0,0,NULL),(120,348,0,0,0,0,0,0,0,NULL),(120,350,0,0,0,0,0,0,0,NULL),(120,397,1,0,0,0,0,0,0,NULL),(120,398,0,0,0,0,0,0,0,NULL),(121,434,0,0,0,0,0,0,0,NULL),(121,435,0,0,0,0,0,0,0,NULL),(121,436,0,0,0,0,0,0,0,NULL),(121,437,0,0,0,0,0,0,0,NULL),(121,438,0,0,0,0,0,0,0,NULL),(121,439,0,0,0,0,0,0,0,NULL),(121,440,0,0,1,0,0,0,0,NULL),(121,441,0,0,0,0,0,0,0,NULL),(121,442,0,0,0,0,0,0,0,NULL),(121,443,0,0,1,0,0,0,0,NULL),(121,444,0,0,0,0,0,0,0,NULL),(121,445,0,0,0,0,0,0,0,NULL),(121,446,0,0,0,0,0,0,0,NULL),(121,447,1,0,0,0,0,0,0,NULL),(121,448,0,0,0,0,0,0,0,NULL),(121,449,0,0,0,0,0,0,0,NULL),(121,450,0,0,0,0,0,0,0,NULL),(121,451,1,0,0,0,0,0,0,NULL),(122,452,0,0,0,0,0,0,0,NULL),(122,453,0,0,0,0,0,0,0,NULL),(122,454,0,0,0,0,0,0,0,NULL),(122,455,0,0,0,0,0,0,0,NULL),(122,456,0,0,0,0,0,0,0,NULL),(122,457,0,0,0,0,0,0,0,NULL),(122,458,0,0,0,0,0,0,0,NULL),(122,459,0,0,0,0,0,0,0,NULL),(122,460,0,0,0,0,0,0,0,NULL),(122,461,0,0,0,0,0,0,0,NULL),(122,462,0,0,0,0,0,0,0,NULL),(122,463,0,0,0,0,0,0,0,NULL),(122,464,0,0,0,0,0,0,0,NULL),(122,465,1,0,0,0,0,0,0,NULL),(122,466,0,0,0,0,0,0,0,NULL),(122,467,0,0,0,0,0,0,0,NULL),(122,468,0,0,0,0,0,0,0,NULL),(122,469,0,0,0,0,0,0,0,NULL),(122,470,0,0,0,0,0,0,0,NULL),(122,471,0,0,0,0,0,0,0,NULL),(122,472,0,0,0,0,0,0,0,NULL),(122,473,0,0,0,0,0,0,0,NULL),(122,474,0,0,0,0,0,0,0,NULL),(123,475,0,0,0,0,0,0,0,NULL),(123,476,0,0,0,0,0,0,0,NULL),(123,477,0,0,0,0,0,0,0,NULL),(123,478,0,0,0,0,0,0,0,NULL),(123,479,2,0,0,0,0,0,0,NULL),(123,480,0,0,0,0,0,0,0,NULL),(123,481,1,0,0,0,0,0,0,NULL),(123,482,0,0,0,0,0,0,0,NULL),(123,483,2,0,0,0,0,0,0,NULL),(123,484,0,0,0,0,0,0,0,NULL),(123,485,0,0,0,0,0,0,0,NULL),(123,486,0,0,0,0,0,0,0,NULL),(123,487,0,0,0,0,0,0,0,NULL),(123,488,0,0,0,0,0,0,0,NULL),(123,489,0,0,0,0,0,0,0,NULL),(123,490,0,0,0,0,0,0,0,NULL),(123,491,0,0,1,0,0,0,0,NULL),(123,492,0,0,1,0,0,0,0,NULL),(123,493,0,0,2,0,0,0,0,NULL),(123,494,0,0,0,0,0,0,0,NULL),(123,495,0,0,0,0,0,0,0,NULL),(123,496,1,0,0,0,0,0,0,NULL),(123,497,1,0,0,0,0,0,0,NULL),(123,498,1,0,0,0,0,0,0,NULL),(123,499,0,0,0,0,0,0,0,NULL),(124,500,0,0,0,0,0,0,0,NULL),(124,501,0,0,0,0,0,0,0,NULL),(124,502,0,0,0,0,0,0,0,NULL),(124,503,0,0,0,0,0,0,0,NULL),(124,504,0,0,0,0,0,0,0,NULL),(124,505,0,0,0,0,0,0,0,NULL),(124,506,0,0,0,0,0,0,0,NULL),(124,507,0,0,0,0,0,0,0,NULL),(124,508,0,0,0,0,0,0,0,NULL),(124,509,0,0,0,0,0,0,0,NULL),(124,510,1,0,0,0,0,0,0,NULL),(124,511,0,0,0,0,0,0,0,NULL),(124,512,0,0,0,0,0,0,0,NULL),(124,513,1,0,0,0,0,0,0,NULL),(124,514,0,0,0,0,0,0,0,NULL),(124,515,0,0,0,0,0,1,0,NULL),(124,516,1,0,0,0,0,0,0,NULL),(124,517,0,0,0,0,0,0,0,NULL),(124,518,0,0,0,0,0,0,0,NULL),(124,519,0,0,0,0,0,0,0,NULL),(125,520,0,0,0,0,0,0,0,NULL),(125,521,1,0,1,0,0,0,0,NULL),(125,522,0,0,0,0,0,0,0,NULL),(125,523,0,0,0,0,0,0,0,NULL),(125,524,0,0,0,0,0,0,0,NULL),(125,525,0,0,0,0,0,0,0,NULL),(125,526,0,0,0,0,0,0,0,NULL),(125,527,0,0,0,0,0,0,0,NULL),(125,528,0,0,1,0,0,0,0,NULL),(125,529,1,0,0,0,0,0,0,NULL),(125,530,1,0,0,0,0,0,0,NULL),(125,531,0,0,0,0,0,0,0,NULL),(125,532,0,0,0,0,0,0,0,NULL),(125,533,0,0,0,0,0,0,0,NULL),(125,534,1,0,0,0,0,0,0,NULL),(125,535,0,0,0,0,0,0,0,NULL),(125,536,0,0,0,0,0,0,0,NULL),(125,537,0,0,0,0,0,0,0,NULL),(125,538,0,0,0,0,0,0,0,NULL),(125,539,0,0,0,0,0,0,0,NULL),(125,540,0,0,0,0,0,0,0,NULL),(125,541,1,0,0,0,0,0,0,NULL),(125,542,1,0,0,0,0,0,0,NULL),(127,543,0,0,0,0,0,0,0,NULL),(127,544,0,0,1,0,1,0,0,NULL),(127,545,0,0,0,0,0,0,0,NULL),(127,546,0,0,0,0,0,0,0,NULL),(127,547,0,0,0,0,0,0,0,NULL),(127,548,0,0,0,0,0,0,0,NULL),(127,549,0,0,0,0,0,0,0,NULL),(127,550,1,0,0,0,0,0,0,NULL),(127,551,0,0,0,0,0,0,0,NULL),(127,552,0,0,0,0,0,0,0,NULL),(127,553,0,0,1,0,0,0,0,NULL),(127,554,0,0,0,0,0,0,0,NULL),(127,555,0,0,0,0,0,0,0,NULL),(127,556,0,0,0,0,0,0,0,NULL),(127,557,0,0,0,0,0,0,0,NULL),(127,558,1,0,0,0,0,0,0,NULL),(127,559,1,0,0,0,0,0,0,NULL),(127,560,0,0,0,0,0,0,0,NULL),(127,561,0,0,0,0,0,0,0,NULL),(127,562,0,0,1,0,0,0,0,NULL),(127,563,0,0,0,0,0,0,0,NULL),(127,564,0,0,0,0,0,0,0,NULL),(127,565,0,0,0,0,0,0,0,NULL),(127,566,1,0,0,0,0,0,0,NULL),(128,567,0,0,0,0,0,0,0,NULL),(128,568,0,0,0,0,0,0,0,NULL),(128,569,0,0,0,0,0,0,0,NULL),(128,570,0,1,1,0,0,0,0,NULL),(128,571,0,0,0,0,0,0,0,NULL),(128,572,0,1,0,0,0,0,0,NULL),(128,573,0,0,0,0,0,0,0,NULL),(128,574,0,0,0,0,0,0,0,NULL),(128,575,2,0,1,0,0,0,0,NULL),(128,576,0,0,0,0,0,0,0,NULL),(128,577,0,0,0,0,0,0,0,NULL),(128,578,0,0,0,0,0,0,0,NULL),(128,579,0,0,0,0,0,0,0,NULL),(128,580,0,0,0,0,0,0,0,NULL),(128,581,0,0,0,0,0,0,0,NULL),(128,582,0,0,0,0,0,0,0,NULL),(128,583,0,0,0,0,0,0,0,NULL),(128,584,0,0,0,0,0,0,0,NULL),(128,585,0,0,0,0,0,0,0,NULL),(128,586,1,0,0,0,0,0,0,NULL),(128,587,0,0,1,0,0,0,0,NULL),(129,588,0,0,0,0,0,0,0,NULL),(129,589,0,2,0,0,0,0,0,NULL),(129,590,0,0,0,0,0,0,0,NULL),(129,591,5,1,0,0,0,0,0,NULL),(129,592,0,0,2,0,0,0,0,NULL),(129,593,0,1,0,0,0,0,0,NULL),(129,594,0,0,0,0,0,0,0,NULL),(129,595,0,0,0,0,0,0,0,NULL),(129,596,1,0,0,0,0,0,0,NULL),(129,597,0,0,0,0,0,0,0,NULL),(129,598,0,0,0,0,0,0,0,NULL),(129,599,0,1,0,0,0,0,0,NULL),(129,600,0,0,0,0,0,0,0,NULL),(129,601,0,0,0,0,0,0,0,NULL),(129,602,0,0,1,0,0,0,0,NULL),(129,603,0,0,0,0,0,0,0,NULL),(129,604,0,0,1,0,0,0,0,NULL),(129,605,0,0,0,0,0,0,0,NULL),(129,606,2,0,0,0,0,0,0,NULL),(129,607,0,0,0,0,0,0,0,NULL),(129,608,0,0,0,0,0,0,0,NULL),(129,609,3,1,0,0,0,0,0,NULL),(130,610,0,0,0,0,0,0,0,NULL),(130,611,0,0,1,0,0,0,0,NULL),(130,612,0,0,1,0,0,0,0,NULL),(130,613,2,0,0,0,0,0,0,NULL),(130,614,0,0,0,0,0,0,0,NULL),(130,615,0,0,0,0,0,0,0,NULL),(130,616,0,0,0,0,0,0,0,NULL),(130,617,0,0,0,0,0,0,0,NULL),(130,618,0,0,0,0,1,0,0,NULL),(130,619,0,0,0,0,0,0,0,NULL),(130,620,0,0,0,0,0,0,0,NULL),(130,621,0,1,1,0,0,0,0,NULL),(130,622,0,0,0,0,0,0,0,NULL),(130,623,0,1,0,0,0,0,0,NULL),(130,624,0,0,0,0,0,0,0,NULL),(130,625,0,0,0,0,0,0,0,NULL),(130,626,0,0,0,0,0,0,0,NULL),(130,627,1,0,0,0,0,0,0,NULL),(130,628,1,0,1,0,0,0,0,NULL),(130,629,1,0,0,0,0,0,0,NULL),(130,630,0,0,0,0,0,0,0,NULL),(130,631,0,0,0,0,0,0,0,NULL),(130,632,0,0,0,0,0,0,0,NULL),(130,633,0,0,0,0,0,0,0,NULL),(131,634,0,0,0,0,0,0,0,NULL),(131,635,0,0,0,0,0,0,0,NULL),(131,636,0,0,0,0,0,0,0,NULL),(131,637,2,0,0,0,0,0,0,NULL),(131,638,0,0,0,0,0,0,0,NULL),(131,639,0,0,0,0,0,0,0,NULL),(131,640,1,0,0,0,0,0,0,NULL),(131,641,1,0,0,0,0,0,0,NULL),(131,642,0,0,0,0,0,0,0,NULL),(131,643,1,0,0,0,0,0,0,NULL),(131,644,2,0,0,0,0,0,0,NULL),(131,645,0,0,0,0,0,0,0,NULL),(131,646,2,0,0,0,0,0,0,NULL),(131,647,0,0,0,0,0,0,0,NULL),(131,648,0,0,0,0,0,0,0,NULL),(131,649,0,0,0,0,0,0,0,NULL),(131,650,0,0,0,0,0,0,0,NULL),(131,651,0,0,0,0,0,0,0,NULL),(131,652,0,0,0,0,0,0,0,NULL),(131,653,0,0,0,0,0,0,0,NULL),(131,654,0,0,0,0,0,0,0,NULL),(131,655,0,0,0,0,0,0,0,NULL),(131,656,1,0,0,0,0,0,0,NULL),(132,490,1,0,0,0,0,0,0,NULL),(132,491,0,0,0,0,0,0,0,NULL),(132,492,1,0,0,0,0,0,0,NULL),(132,494,1,0,0,0,0,0,0,NULL),(132,495,1,2,0,0,0,0,0,NULL),(132,497,3,5,0,0,0,0,0,NULL),(132,498,0,0,0,0,0,0,0,NULL),(132,624,0,0,0,0,0,0,0,NULL),(132,625,0,0,0,0,0,0,0,NULL),(132,626,0,0,0,0,0,0,0,NULL),(132,627,0,0,0,0,0,0,0,NULL),(132,630,0,0,0,0,0,0,0,NULL),(132,631,0,0,0,0,0,0,0,NULL),(132,657,0,0,0,0,0,0,0,NULL),(132,658,0,0,0,0,0,0,0,NULL),(132,659,0,0,0,0,0,0,0,NULL),(132,660,2,1,0,0,0,0,0,NULL),(132,661,2,1,0,0,0,0,0,NULL),(133,452,0,0,0,0,0,0,0,NULL),(133,453,0,0,1,0,0,0,1,NULL),(133,454,0,0,0,0,0,0,0,NULL),(133,455,0,1,0,0,0,0,0,NULL),(133,456,0,1,0,0,0,0,0,NULL),(133,457,0,1,0,0,0,0,0,NULL),(133,458,0,0,0,0,0,0,0,NULL),(133,460,0,0,0,0,0,0,0,NULL),(133,461,0,0,0,0,0,0,0,NULL),(133,462,2,0,0,0,0,0,0,NULL),(133,634,0,0,0,0,0,0,0,NULL),(133,636,0,0,0,0,0,0,0,NULL),(133,638,0,0,0,0,0,0,0,NULL),(133,646,0,0,0,0,0,0,0,NULL),(133,662,0,0,0,0,0,0,0,NULL),(133,663,0,0,0,0,0,0,0,NULL),(133,664,0,0,0,0,0,0,0,NULL),(133,665,0,0,0,0,0,0,0,NULL),(133,666,0,0,0,0,0,0,0,NULL),(133,667,0,0,0,0,0,0,0,NULL),(133,668,0,0,0,0,0,0,0,NULL),(133,669,0,0,0,0,0,0,0,NULL),(133,670,0,0,0,0,0,0,0,NULL),(133,671,0,0,0,0,0,0,0,NULL),(133,672,1,0,0,0,0,0,0,NULL),(134,576,0,0,0,0,0,0,0,NULL),(134,577,0,0,0,0,0,0,0,NULL),(134,578,0,0,0,0,0,0,0,NULL),(134,580,1,0,0,0,0,0,0,NULL),(134,583,0,0,0,0,0,0,0,NULL),(134,586,2,0,0,0,0,0,0,NULL),(134,587,1,0,0,0,0,0,0,NULL),(134,673,0,0,0,0,0,0,0,NULL),(134,674,0,0,0,0,0,0,0,NULL),(134,675,0,0,0,0,0,0,0,NULL),(134,676,0,0,0,0,0,0,0,NULL),(134,677,0,0,0,0,0,0,0,NULL),(134,678,0,0,0,0,0,0,0,NULL),(134,679,0,0,0,0,0,0,0,NULL),(134,680,0,0,1,0,0,0,0,NULL),(134,681,1,0,1,0,0,0,0,NULL),(134,682,2,0,1,0,0,0,0,NULL),(134,683,0,0,0,0,0,0,0,NULL),(134,684,0,0,0,0,0,0,0,NULL),(134,685,0,0,0,0,0,0,0,NULL),(134,686,0,0,0,0,0,0,0,NULL),(135,590,1,0,0,0,0,0,0,NULL),(135,592,0,0,0,0,0,0,0,NULL),(135,594,0,0,0,0,0,0,0,NULL),(135,595,1,0,0,0,0,0,0,NULL),(135,597,0,0,0,0,0,0,0,NULL),(135,598,0,0,0,0,0,0,0,NULL),(135,687,0,0,0,0,0,0,0,NULL),(135,688,0,0,0,0,0,0,0,NULL),(135,689,0,0,0,0,0,0,0,NULL),(135,690,0,0,0,0,0,0,0,NULL),(135,691,1,0,0,0,0,0,0,NULL),(135,692,1,0,0,0,0,0,0,NULL),(135,693,0,0,0,0,0,0,0,NULL),(135,694,0,0,0,0,0,0,0,NULL),(135,695,0,0,0,0,0,0,0,NULL),(135,696,0,0,0,0,0,0,0,NULL),(135,697,0,0,0,0,0,0,0,NULL),(135,698,0,0,0,0,0,0,0,NULL),(135,699,0,0,1,0,0,0,0,NULL),(135,700,0,0,0,0,0,0,0,NULL),(135,701,0,0,0,0,0,0,0,NULL),(135,702,1,0,0,0,0,0,0,NULL),(136,543,0,0,0,0,0,0,0,NULL),(136,544,0,0,0,0,0,0,0,NULL),(136,545,0,0,0,0,0,0,0,NULL),(136,547,0,0,0,0,0,0,0,NULL),(136,550,0,0,0,0,0,0,0,NULL),(136,551,0,0,0,0,0,0,0,NULL),(136,552,0,0,0,0,0,0,0,NULL),(136,554,0,1,0,0,0,0,0,NULL),(136,555,0,0,0,0,0,0,0,NULL),(136,556,0,0,0,0,0,0,0,NULL),(136,703,1,0,0,0,0,0,0,NULL),(136,704,0,0,0,0,0,0,0,NULL),(136,705,0,0,0,0,0,0,0,NULL),(137,568,1,0,0,0,0,0,0,NULL),(137,569,0,0,0,0,0,0,0,NULL),(137,570,0,0,0,0,0,0,0,NULL),(137,571,0,0,0,0,0,0,0,NULL),(137,573,2,1,0,0,0,0,0,NULL),(137,574,0,0,0,0,0,0,0,NULL),(137,647,0,0,0,0,0,0,0,NULL),(137,649,0,0,0,0,0,0,0,NULL),(137,650,0,0,0,0,0,0,0,NULL),(137,652,0,0,0,0,0,0,0,NULL),(137,653,0,0,0,0,0,0,0,NULL),(137,655,1,0,0,0,0,0,0,NULL),(137,656,0,0,0,0,0,0,0,NULL),(137,706,0,0,0,0,0,0,0,NULL),(137,707,0,0,0,0,0,0,0,NULL),(137,708,0,0,0,0,0,0,0,NULL),(137,709,0,0,0,0,0,0,0,NULL),(137,710,2,0,0,0,0,0,0,NULL),(137,711,0,0,0,0,0,0,0,NULL),(137,712,0,2,0,0,0,0,0,NULL),(137,713,2,2,0,0,0,0,0,NULL),(137,714,0,0,0,0,0,0,0,NULL),(138,511,0,0,0,0,0,0,0,NULL),(138,513,0,0,0,0,0,0,0,NULL),(138,515,0,0,0,0,0,0,0,NULL),(138,519,0,0,0,0,0,0,0,NULL),(138,557,0,0,0,0,0,0,0,NULL),(138,558,0,0,0,0,0,0,0,NULL),(138,559,0,0,0,0,0,0,0,NULL),(138,560,0,0,0,0,0,0,0,NULL),(138,562,0,0,0,0,0,0,0,NULL),(138,563,0,0,0,0,0,0,0,NULL),(138,564,1,0,0,0,0,0,0,NULL),(138,565,0,0,1,0,0,0,0,NULL),(138,715,0,0,0,0,0,0,0,NULL),(138,716,0,0,0,0,0,0,0,NULL),(138,717,0,0,0,0,0,0,0,NULL),(138,718,0,0,0,0,0,0,0,NULL),(138,719,0,0,0,0,0,0,0,NULL),(138,720,0,0,0,0,0,0,0,NULL),(138,721,0,0,0,0,0,0,0,NULL),(138,722,0,0,0,0,0,0,0,NULL),(138,723,0,0,0,0,1,0,0,NULL),(139,434,0,0,0,0,0,0,0,NULL),(139,435,0,0,0,0,0,0,0,NULL),(139,436,0,0,0,0,0,0,0,NULL),(139,437,0,0,1,0,0,0,0,NULL),(139,438,0,0,0,0,0,0,0,NULL),(139,441,1,0,0,0,0,0,0,NULL),(139,442,1,0,0,0,0,0,0,NULL),(139,443,0,1,1,0,0,0,0,NULL),(139,475,0,0,0,0,0,0,0,NULL),(139,478,0,0,0,0,0,0,0,NULL),(139,479,0,0,0,0,0,0,0,NULL),(139,480,0,0,0,0,0,0,0,NULL),(139,481,1,0,0,0,0,0,0,NULL),(139,482,0,0,0,0,0,0,0,NULL),(139,486,0,0,0,0,0,0,0,NULL),(139,487,0,0,0,0,0,0,0,NULL),(139,724,0,0,0,0,0,0,0,NULL),(139,725,0,1,2,0,0,0,0,NULL),(139,726,0,0,0,0,0,0,0,NULL),(139,727,0,0,0,0,0,0,0,NULL),(139,728,0,0,0,0,0,0,0,NULL),(139,729,0,0,0,0,0,0,0,NULL),(139,730,0,0,0,0,0,0,0,NULL),(139,731,0,0,0,0,0,0,0,NULL),(139,732,0,0,0,0,0,0,0,NULL),(139,733,0,0,0,0,0,0,0,NULL),(139,734,0,0,0,0,0,0,0,NULL),(139,735,0,0,0,0,0,0,0,NULL),(139,736,0,0,0,0,0,0,0,NULL),(140,500,0,0,0,0,0,0,0,NULL),(140,501,1,0,0,0,0,0,0,NULL),(140,502,0,0,0,0,0,0,0,NULL),(140,504,1,0,0,0,0,0,0,NULL),(140,507,1,0,0,0,0,0,0,NULL),(140,508,4,2,0,0,0,0,0,NULL),(140,509,1,0,0,0,0,0,0,NULL),(140,610,0,0,0,0,0,0,0,NULL),(140,611,1,0,0,0,0,0,0,NULL),(140,612,0,0,0,0,0,0,0,NULL),(140,614,0,0,0,0,0,0,0,NULL),(140,615,0,0,0,0,0,0,0,NULL),(140,616,0,0,0,0,0,0,0,NULL),(140,621,0,0,0,0,0,0,0,NULL),(140,737,0,0,0,0,0,0,0,NULL),(140,738,0,0,0,0,0,0,0,NULL),(140,739,0,0,0,0,0,0,0,NULL),(140,740,0,0,0,0,0,0,0,NULL),(140,741,2,0,0,0,0,0,0,NULL),(141,533,0,0,0,0,0,0,0,NULL),(141,534,0,0,0,0,0,0,0,NULL),(141,535,0,0,0,0,0,0,0,NULL),(141,536,0,0,0,0,0,0,0,NULL),(141,537,0,0,0,0,0,0,0,NULL),(141,538,0,0,0,0,0,0,0,NULL),(141,539,0,0,0,0,0,0,0,NULL),(141,540,0,0,0,0,0,0,0,NULL),(141,541,1,0,0,0,0,0,0,NULL),(141,600,0,0,0,0,0,0,0,NULL),(141,601,0,0,0,0,0,0,0,NULL),(141,602,0,0,0,0,0,0,0,NULL),(141,603,1,0,0,0,0,0,0,NULL),(141,604,1,0,0,0,0,0,0,NULL),(141,605,0,0,0,0,0,0,0,NULL),(141,606,0,0,0,0,0,0,0,NULL),(141,608,1,0,0,0,0,0,0,NULL),(141,609,1,2,0,0,0,0,0,NULL),(141,742,1,2,0,0,0,0,0,NULL),(141,743,0,0,0,0,0,0,0,NULL),(141,744,0,0,0,0,0,0,0,NULL),(141,745,0,0,0,0,0,0,0,NULL),(141,746,0,0,0,0,0,0,0,NULL),(142,444,0,0,0,0,0,0,0,NULL),(142,446,0,0,0,0,0,0,0,NULL),(142,447,0,0,0,0,0,0,0,NULL),(142,449,1,0,0,0,0,0,0,NULL),(142,451,1,0,0,0,0,0,0,NULL),(142,464,1,0,0,0,0,0,0,NULL),(142,465,0,0,0,0,0,0,0,NULL),(142,466,2,0,0,0,0,0,0,NULL),(142,467,0,0,0,0,0,0,0,NULL),(142,469,2,0,0,0,0,0,0,NULL),(142,471,1,0,0,0,0,0,0,NULL),(142,474,1,0,0,0,0,0,0,NULL),(142,747,0,0,0,0,0,0,0,NULL),(142,748,1,0,0,0,0,0,0,NULL),(142,749,0,0,0,0,0,0,0,NULL),(142,750,1,0,0,0,0,0,0,NULL),(142,751,0,0,0,0,0,0,0,NULL),(142,752,1,0,0,0,0,0,0,NULL),(142,753,0,0,0,0,0,0,0,NULL),(142,754,0,0,0,0,0,0,0,NULL),(142,755,1,0,0,0,0,0,0,NULL),(142,756,1,0,0,0,0,0,0,NULL),(143,454,0,0,0,0,0,0,0,NULL),(143,455,0,0,1,0,0,0,0,NULL),(143,456,0,1,0,0,0,0,0,NULL),(143,457,0,0,0,0,0,0,0,NULL),(143,458,0,0,0,0,0,0,0,NULL),(143,461,0,0,0,0,0,0,0,NULL),(143,462,0,0,0,0,0,0,0,NULL),(143,568,0,0,1,0,0,0,0,NULL),(143,569,0,0,0,0,0,0,0,NULL),(143,570,0,0,0,0,0,0,0,NULL),(143,573,0,0,0,0,0,0,0,NULL),(143,574,0,0,0,0,0,0,0,NULL),(143,575,0,0,1,0,0,0,0,NULL),(143,669,1,0,0,0,0,0,0,NULL),(143,671,0,0,0,0,0,0,0,NULL),(143,672,0,0,0,0,0,0,0,NULL),(143,711,0,0,0,0,0,0,0,NULL),(143,712,0,0,0,0,0,0,0,NULL),(143,713,0,0,0,0,0,0,0,NULL),(143,714,0,0,0,0,0,0,0,NULL),(143,757,0,0,0,0,0,0,0,NULL),(143,758,0,0,0,0,0,0,0,NULL),(143,759,0,0,0,0,0,0,0,NULL),(144,475,0,0,0,0,0,0,0,NULL),(144,476,2,0,0,0,0,0,0,NULL),(144,478,0,0,0,0,0,0,0,NULL),(144,479,0,0,0,0,0,0,0,NULL),(144,480,1,0,0,0,0,0,0,NULL),(144,481,1,0,0,0,0,0,0,NULL),(144,486,1,0,1,0,0,0,0,NULL),(144,487,2,0,0,0,0,0,0,NULL),(144,634,0,0,0,0,0,0,0,NULL),(144,636,0,0,0,0,0,0,0,NULL),(144,637,1,0,0,0,0,0,0,NULL),(144,638,0,0,1,0,0,0,0,NULL),(144,640,0,0,0,0,0,0,0,NULL),(144,643,1,0,0,0,0,0,0,NULL),(144,646,1,0,0,0,0,0,0,NULL),(144,662,0,0,0,0,0,0,0,NULL),(144,666,0,0,0,0,0,0,0,NULL),(144,667,0,0,1,0,0,0,0,NULL),(144,668,0,0,0,0,0,0,0,NULL),(144,726,0,0,0,0,0,0,0,NULL),(144,728,0,0,0,0,0,0,0,NULL),(144,731,0,0,0,0,0,0,0,NULL),(144,734,0,0,0,0,0,0,0,NULL),(144,736,0,0,0,0,0,0,0,NULL),(144,760,0,0,1,0,0,0,0,NULL),(145,464,0,0,0,0,0,0,0,NULL),(145,465,1,0,0,0,0,0,0,NULL),(145,466,0,0,0,0,0,0,0,NULL),(145,467,0,0,1,0,0,0,0,NULL),(145,468,0,0,0,0,0,0,0,NULL),(145,469,1,0,0,0,0,0,0,NULL),(145,471,0,0,0,0,0,0,0,NULL),(145,473,2,0,0,0,0,0,0,NULL),(145,474,1,0,0,0,0,0,0,NULL),(145,624,0,0,0,0,0,0,0,NULL),(145,625,0,0,0,0,0,0,0,NULL),(145,630,0,0,0,0,0,0,0,NULL),(145,631,0,0,0,0,0,0,0,NULL),(145,633,0,1,0,0,0,0,0,NULL),(145,657,0,0,0,0,0,0,0,NULL),(145,755,0,0,0,0,0,0,0,NULL),(145,761,0,0,0,0,0,0,0,NULL),(145,762,0,0,0,0,0,0,0,NULL),(145,763,1,0,0,0,0,0,0,NULL),(145,764,0,0,0,0,0,0,0,NULL),(145,765,0,0,0,0,0,0,0,NULL),(145,766,0,0,0,0,0,0,0,NULL),(146,534,0,0,0,0,0,0,0,NULL),(146,535,0,0,0,0,0,0,0,NULL),(146,536,0,0,0,0,0,0,0,NULL),(146,537,0,0,0,0,0,0,0,NULL),(146,539,0,0,0,0,0,0,0,NULL),(146,540,0,0,0,0,0,0,0,NULL),(146,541,2,0,0,0,0,0,0,NULL),(146,576,0,0,0,0,0,0,0,NULL),(146,577,0,0,0,0,0,0,0,NULL),(146,580,0,0,0,0,0,0,0,NULL),(146,582,0,0,0,0,0,0,0,NULL),(146,583,0,0,0,0,0,0,0,NULL),(146,587,1,0,0,0,0,0,0,NULL),(146,673,0,0,0,0,0,0,0,NULL),(146,675,0,0,0,0,0,0,0,NULL),(146,744,0,0,0,0,0,0,0,NULL),(146,745,0,0,0,0,0,0,0,NULL),(146,767,0,0,0,0,0,0,0,NULL),(146,768,2,0,0,0,0,1,0,NULL),(146,769,0,0,0,0,0,0,0,NULL),(147,543,0,0,0,0,0,0,0,NULL),(147,544,0,0,0,0,0,0,0,NULL),(147,547,0,0,0,0,0,0,0,NULL),(147,548,0,1,0,0,0,0,0,NULL),(147,550,0,0,0,0,0,0,0,NULL),(147,551,0,0,0,0,0,0,0,NULL),(147,552,0,0,0,0,0,0,0,NULL),(147,553,0,0,0,0,0,0,0,NULL),(147,554,1,0,0,0,0,0,0,NULL),(147,555,2,1,1,0,0,0,0,NULL),(147,556,0,0,0,0,0,0,0,NULL),(147,694,0,0,0,0,0,0,0,NULL),(147,695,0,0,0,0,0,0,0,NULL),(147,698,0,0,1,0,0,0,0,NULL),(147,699,0,0,0,0,0,0,0,NULL),(147,701,0,0,0,0,0,0,0,NULL),(147,702,1,0,0,0,0,0,0,NULL),(147,703,0,0,1,0,0,0,0,NULL),(147,705,1,1,0,0,0,0,0,NULL),(147,770,0,0,0,0,0,0,0,NULL),(147,771,0,0,0,0,0,0,0,NULL),(147,772,0,0,0,0,0,0,0,NULL),(148,589,0,0,0,0,0,0,0,NULL),(148,590,1,0,0,0,0,0,0,NULL),(148,592,0,0,0,0,0,0,0,NULL),(148,594,0,0,0,0,0,0,0,NULL),(148,598,4,0,0,0,0,0,0,NULL),(148,676,0,0,0,0,0,0,0,NULL),(148,678,0,0,0,0,0,0,0,NULL),(148,679,0,0,0,0,0,0,0,NULL),(148,680,0,0,0,0,0,0,0,NULL),(148,681,0,0,0,0,0,0,0,NULL),(148,682,5,0,0,0,0,0,0,NULL),(148,684,1,0,0,0,0,0,0,NULL),(148,687,0,0,0,0,0,0,0,NULL),(148,688,0,0,0,0,0,0,0,NULL),(148,691,0,0,0,0,0,0,0,NULL),(148,692,0,0,0,0,0,0,0,NULL),(148,773,0,0,0,0,0,0,0,NULL),(148,774,0,0,0,0,0,0,0,NULL),(148,775,0,0,0,0,0,0,0,NULL),(148,776,2,0,0,0,0,0,0,NULL),(148,777,1,0,0,0,0,0,0,NULL),(149,511,0,0,0,0,0,0,0,NULL),(149,512,0,0,0,0,0,0,0,NULL),(149,513,0,0,0,0,0,0,0,NULL),(149,514,0,0,0,0,0,0,0,NULL),(149,515,1,0,0,0,0,0,0,NULL),(149,518,0,0,0,0,0,0,0,NULL),(149,519,0,0,0,0,0,0,0,NULL),(149,601,0,0,0,0,0,0,0,NULL),(149,602,0,0,1,0,0,0,0,NULL),(149,604,0,1,1,0,0,0,0,NULL),(149,605,0,0,1,0,0,0,0,NULL),(149,606,0,0,0,0,0,0,0,NULL),(149,608,0,0,1,0,0,0,0,NULL),(149,609,1,1,0,0,0,0,0,NULL),(149,720,0,0,0,0,0,0,0,NULL),(149,721,0,0,0,0,0,0,0,NULL),(149,722,0,0,0,0,0,0,0,NULL),(149,723,1,0,1,0,0,0,0,NULL),(149,742,0,0,0,0,0,0,0,NULL),(149,778,0,0,0,0,0,0,0,NULL),(149,779,0,0,0,0,0,0,0,NULL),(149,780,0,0,0,0,0,0,0,NULL),(149,781,1,0,0,0,0,0,0,NULL),(149,782,0,0,0,0,0,0,0,NULL),(150,434,0,0,0,0,0,0,0,NULL),(150,435,0,0,1,0,0,0,0,NULL),(150,436,0,0,0,0,0,0,0,NULL),(150,437,0,0,0,0,0,0,0,NULL),(150,442,1,0,0,0,0,0,0,NULL),(150,443,0,0,1,0,0,0,0,NULL),(150,501,0,0,0,0,0,0,0,NULL),(150,502,0,0,0,0,0,0,0,NULL),(150,503,0,0,0,0,0,0,0,NULL),(150,504,0,0,0,0,0,0,0,NULL),(150,507,0,0,0,0,0,0,0,NULL),(150,508,2,0,0,0,0,0,0,NULL),(150,509,0,0,0,0,0,0,0,NULL),(150,510,0,0,0,0,0,0,0,NULL),(150,724,0,0,0,0,0,0,0,NULL),(150,741,1,0,0,0,0,0,0,NULL),(150,783,0,0,0,0,0,0,0,NULL),(150,784,0,0,0,0,0,0,0,NULL),(150,785,0,0,0,0,0,0,0,NULL),(151,444,0,0,0,0,0,0,0,NULL),(151,445,0,0,0,0,0,0,0,NULL),(151,446,0,0,1,0,0,0,0,NULL),(151,447,1,0,0,0,0,0,0,NULL),(151,448,0,0,1,0,0,0,0,NULL),(151,450,2,0,0,0,0,0,0,NULL),(151,451,0,0,0,0,0,0,0,NULL),(151,648,1,0,0,0,0,0,0,NULL),(151,649,0,0,1,0,0,0,0,NULL),(151,650,0,0,0,0,0,0,0,NULL),(151,652,0,0,0,0,0,0,0,NULL),(151,653,0,0,0,0,0,0,0,NULL),(151,655,0,0,0,0,0,0,0,NULL),(151,656,0,0,0,0,0,0,0,NULL),(151,706,0,0,0,0,0,0,0,NULL),(151,707,0,0,0,0,0,0,0,NULL),(151,708,1,0,0,0,0,0,0,NULL),(151,710,0,0,1,0,0,0,0,NULL),(151,749,0,0,0,0,0,0,0,NULL),(151,751,0,0,0,0,0,0,0,NULL),(151,786,0,0,0,0,0,0,0,NULL),(151,787,0,0,0,0,0,0,0,NULL),(152,490,0,0,0,0,0,0,0,NULL),(152,492,0,0,0,0,0,0,0,NULL),(152,494,2,0,0,0,0,0,0,NULL),(152,495,3,2,0,0,1,0,0,NULL),(152,497,1,3,0,0,0,0,0,NULL),(152,559,1,0,0,0,0,0,0,NULL),(152,562,0,0,0,0,0,0,0,NULL),(152,563,0,0,1,0,0,0,0,NULL),(152,564,2,0,0,0,0,0,0,NULL),(152,565,0,0,0,0,0,0,0,NULL),(152,658,1,0,0,0,0,0,0,NULL),(152,661,2,1,0,0,0,0,0,NULL),(152,715,0,0,1,0,0,0,0,NULL),(152,716,0,0,0,0,0,0,0,NULL),(152,717,0,0,0,0,0,0,0,NULL),(152,718,0,0,0,0,0,0,0,NULL),(152,788,0,0,0,0,0,0,0,NULL),(152,789,0,1,0,0,0,0,0,NULL),(152,790,0,2,0,0,0,0,0,NULL),(152,791,1,0,0,0,0,0,0,NULL),(155,533,0,0,0,0,0,0,0,NULL),(155,535,0,0,0,0,0,0,0,NULL),(155,536,0,0,0,0,0,0,0,NULL),(155,537,2,0,0,0,0,0,0,NULL),(155,538,0,0,0,0,0,0,0,NULL),(155,539,0,0,0,0,0,0,0,NULL),(155,540,0,0,1,0,0,0,0,NULL),(155,590,1,0,0,0,0,0,0,NULL),(155,592,0,0,0,0,0,0,0,NULL),(155,594,0,0,0,0,0,0,0,NULL),(155,597,0,0,0,0,0,0,0,NULL),(155,598,0,0,0,0,0,0,0,NULL),(155,599,0,0,0,0,0,0,0,NULL),(155,687,0,0,0,0,0,0,0,NULL),(155,688,0,0,0,0,0,0,0,NULL),(155,689,1,0,0,0,0,0,0,NULL),(155,692,2,0,1,0,1,0,0,NULL),(155,744,0,0,0,0,0,0,0,NULL),(155,745,0,0,0,0,0,0,0,NULL),(155,746,0,0,0,0,0,0,0,NULL),(155,777,1,0,0,0,0,0,0,NULL),(155,792,1,0,0,0,0,0,0,NULL),(156,544,1,0,0,0,0,0,0,NULL),(156,545,0,0,0,0,0,0,0,NULL),(156,546,0,0,0,0,0,0,0,NULL),(156,547,0,0,1,0,0,0,0,NULL),(156,548,0,0,0,0,0,0,0,NULL),(156,550,0,0,0,0,0,0,0,NULL),(156,551,0,0,0,0,0,0,0,NULL),(156,553,0,0,0,0,0,0,0,NULL),(156,554,2,0,0,0,0,0,0,NULL),(156,556,0,0,0,0,0,0,0,NULL),(156,677,0,0,0,0,0,0,0,NULL),(156,679,0,0,0,0,0,0,0,NULL),(156,680,0,0,0,0,0,0,0,NULL),(156,681,1,0,0,0,0,0,0,NULL),(156,682,3,0,0,0,0,0,0,NULL),(156,683,1,0,1,0,0,0,0,NULL),(156,684,0,0,0,0,0,0,0,NULL),(156,685,0,0,0,0,0,0,0,NULL),(156,703,0,0,0,0,0,0,0,NULL),(156,775,0,0,0,0,0,0,0,NULL),(156,776,0,0,0,0,0,0,0,NULL),(156,793,0,0,0,0,0,0,0,NULL),(156,794,0,0,0,0,0,0,0,NULL),(156,795,0,0,0,0,0,0,0,NULL),(157,500,0,0,0,0,0,0,0,NULL),(157,501,0,0,0,0,0,0,0,NULL),(157,502,0,0,0,0,0,0,0,NULL),(157,503,0,0,0,0,0,0,0,NULL),(157,507,0,0,0,0,0,0,0,NULL),(157,508,2,0,0,0,0,0,0,NULL),(157,509,0,0,0,0,0,0,0,NULL),(157,510,0,2,0,0,0,0,0,NULL),(157,634,0,0,0,0,0,0,0,NULL),(157,635,0,0,0,0,0,0,0,NULL),(157,638,1,0,0,0,0,0,0,NULL),(157,640,0,0,0,0,0,0,0,NULL),(157,643,0,0,0,0,0,0,0,NULL),(157,645,0,0,0,0,0,0,0,NULL),(157,646,1,0,0,0,0,0,0,NULL),(157,662,0,0,0,0,0,0,0,NULL),(157,663,0,0,0,0,0,0,0,NULL),(157,666,0,0,0,0,0,0,0,NULL),(157,741,0,0,0,0,0,0,0,NULL),(157,796,2,0,0,0,0,0,0,NULL),(157,797,0,0,0,0,0,0,0,NULL),(158,453,1,0,0,0,0,0,0,NULL),(158,454,2,0,0,0,0,0,0,NULL),(158,455,0,0,1,0,0,0,0,NULL),(158,456,0,0,0,0,0,0,0,NULL),(158,457,0,0,0,0,0,0,0,NULL),(158,458,0,0,0,0,0,0,0,NULL),(158,459,0,0,0,0,0,0,0,NULL),(158,460,0,0,1,0,0,0,0,NULL),(158,461,0,0,0,0,0,0,0,NULL),(158,462,0,0,0,0,0,0,0,NULL),(158,478,0,0,1,0,0,0,0,NULL),(158,479,1,0,1,0,0,0,0,NULL),(158,481,2,0,0,0,0,0,0,NULL),(158,482,0,0,1,0,0,0,0,NULL),(158,669,0,0,0,0,0,0,0,NULL),(158,670,0,0,0,0,0,0,0,NULL),(158,672,0,0,0,0,0,0,0,NULL),(158,726,0,0,0,0,0,0,0,NULL),(158,728,0,0,1,0,0,0,0,NULL),(158,730,0,0,0,0,0,0,0,NULL),(158,731,0,0,0,0,0,0,0,NULL),(158,734,0,0,0,0,0,0,0,NULL),(158,757,0,0,0,0,0,0,0,NULL),(158,798,0,0,0,0,0,0,0,NULL),(158,799,0,0,0,0,0,0,0,NULL),(159,511,0,0,0,0,0,0,0,NULL),(159,512,0,0,0,0,0,0,0,NULL),(159,513,0,0,0,0,0,0,0,NULL),(159,514,0,0,0,0,0,0,0,NULL),(159,518,0,0,0,0,0,0,0,NULL),(159,519,0,0,0,0,0,0,0,NULL),(159,576,0,0,0,0,0,0,0,NULL),(159,577,0,0,0,0,0,0,0,NULL),(159,578,0,0,0,0,0,0,0,NULL),(159,579,0,0,0,0,0,0,0,NULL),(159,580,0,0,0,0,0,0,0,NULL),(159,581,0,0,0,0,0,0,0,NULL),(159,582,1,0,0,0,0,0,0,NULL),(159,583,0,0,0,0,0,0,0,NULL),(159,584,0,0,0,0,0,0,0,NULL),(159,587,0,0,0,0,0,0,0,NULL),(159,673,0,0,0,0,0,0,0,NULL),(159,719,2,0,0,0,0,0,0,NULL),(159,720,0,0,0,0,0,0,0,NULL),(159,722,0,0,0,0,0,0,0,NULL),(159,769,1,0,0,0,0,0,0,NULL),(159,778,1,0,0,0,0,0,0,NULL),(159,800,1,0,0,0,0,0,0,NULL),(159,801,0,0,0,0,0,0,0,NULL),(160,445,0,0,0,0,0,0,0,NULL),(160,446,0,0,0,0,0,0,0,NULL),(160,447,1,0,0,0,0,0,0,NULL),(160,448,1,0,0,0,0,0,0,NULL),(160,449,0,0,0,0,0,0,0,NULL),(160,450,1,0,0,0,0,0,0,NULL),(160,451,1,0,0,0,0,0,0,NULL),(160,568,1,0,0,0,0,0,0,NULL),(160,569,0,0,0,0,0,0,0,NULL),(160,570,0,2,0,0,0,0,0,NULL),(160,571,1,0,0,0,0,0,0,NULL),(160,572,0,0,0,0,0,0,0,NULL),(160,573,2,0,0,0,0,0,0,NULL),(160,575,1,2,0,0,0,0,0,NULL),(160,712,0,0,0,0,0,0,0,NULL),(160,713,0,0,0,0,0,0,0,NULL),(160,748,0,0,0,0,0,0,0,NULL),(160,749,0,0,0,0,0,0,0,NULL),(160,751,0,0,0,0,0,0,0,NULL),(160,758,0,0,0,0,0,0,0,NULL),(160,802,0,0,0,0,0,0,0,NULL),(161,434,0,0,0,0,0,0,0,NULL),(161,435,0,0,0,0,0,0,0,NULL),(161,436,0,0,0,0,0,0,0,NULL),(161,437,0,0,0,0,0,0,0,NULL),(161,438,2,0,0,0,0,0,0,NULL),(161,439,1,0,0,0,0,0,0,NULL),(161,441,0,1,0,0,0,0,0,NULL),(161,442,0,0,1,0,0,0,0,NULL),(161,443,2,1,1,0,0,0,0,NULL),(161,803,2,0,0,0,0,0,0,NULL),(162,610,0,0,0,0,0,0,0,NULL),(162,611,0,1,0,0,0,0,0,NULL),(162,612,0,0,0,0,0,0,0,NULL),(162,613,0,1,0,0,0,0,0,NULL),(162,614,0,0,0,0,0,0,0,NULL),(162,615,0,0,0,0,0,0,0,NULL),(162,616,0,0,1,0,0,0,0,NULL),(162,617,0,0,0,0,0,0,0,NULL),(162,621,1,0,0,0,0,0,0,NULL),(162,623,1,1,0,0,0,0,0,NULL),(162,694,0,0,0,0,0,0,0,NULL),(162,695,0,0,0,0,0,0,0,NULL),(162,697,1,0,0,0,0,0,0,NULL),(162,699,0,0,0,0,0,0,0,NULL),(162,700,0,0,0,0,0,0,0,NULL),(162,701,0,0,0,0,0,0,0,NULL),(162,739,0,0,0,0,0,0,0,NULL),(162,740,1,1,0,0,0,0,0,NULL),(162,770,0,0,0,0,0,0,0,NULL),(162,771,0,0,0,0,0,0,0,NULL),(162,772,0,0,0,0,0,0,0,NULL),(162,804,0,0,0,0,0,0,0,NULL),(162,805,0,0,0,0,0,0,0,NULL),(162,806,1,0,0,0,0,0,0,NULL),(162,807,0,0,1,0,0,0,0,NULL),(162,808,2,0,0,0,0,0,0,NULL),(162,809,0,0,0,0,0,0,0,NULL),(162,810,1,0,0,0,0,0,0,NULL),(162,811,0,0,0,0,0,0,0,NULL),(163,490,0,0,0,0,0,0,0,NULL),(163,492,0,0,0,0,0,0,0,NULL),(163,494,1,1,0,0,0,0,0,NULL),(163,495,3,4,0,0,0,0,0,NULL),(163,497,2,4,0,0,0,0,0,NULL),(163,498,3,0,0,0,0,0,0,NULL),(163,601,0,0,0,0,0,0,0,NULL),(163,602,0,0,0,0,0,0,0,NULL),(163,603,0,0,0,0,0,0,0,NULL),(163,604,0,0,0,0,0,0,0,NULL),(163,605,0,0,0,0,0,0,0,NULL),(163,606,0,0,0,0,0,0,0,NULL),(163,608,0,0,0,0,0,0,0,NULL),(163,609,1,0,0,0,0,0,0,NULL),(163,659,1,0,0,0,0,0,0,NULL),(163,742,0,0,0,0,0,0,0,NULL),(163,743,0,0,0,0,0,0,0,NULL),(163,779,0,1,0,0,0,0,0,NULL),(163,781,0,0,0,0,0,0,0,NULL),(163,788,0,0,0,0,0,0,0,NULL),(163,790,0,0,0,0,0,0,0,NULL),(163,812,0,0,0,0,0,0,0,NULL),(163,813,0,0,0,0,0,0,0,NULL),(164,624,0,0,0,0,0,0,0,NULL),(164,625,0,0,0,0,0,0,0,NULL),(164,627,3,1,0,0,0,0,0,NULL),(164,628,2,2,0,0,0,0,0,NULL),(164,630,0,0,1,0,0,0,0,NULL),(164,631,0,2,0,0,0,0,0,NULL),(164,633,0,0,0,0,0,0,0,NULL),(164,648,0,0,0,0,0,0,0,NULL),(164,649,0,0,0,0,0,0,0,NULL),(164,650,0,0,0,0,0,0,0,NULL),(164,655,0,0,1,0,0,0,0,NULL),(164,656,0,0,0,0,0,0,0,NULL),(164,706,0,0,0,0,0,0,0,NULL),(164,707,0,0,0,0,0,0,0,NULL),(164,708,0,0,0,0,0,0,0,NULL),(164,709,0,0,1,0,0,0,0,NULL),(164,710,0,0,0,0,0,0,0,NULL),(164,763,1,1,0,0,0,0,0,NULL),(164,814,0,0,0,0,0,0,0,NULL),(164,815,0,0,0,0,0,0,0,NULL),(164,816,0,0,0,0,0,0,0,NULL),(164,817,0,0,0,0,0,0,0,NULL),(164,818,1,0,0,0,0,0,0,NULL),(164,819,0,0,0,0,0,0,0,NULL),(165,463,0,0,0,0,0,0,0,NULL),(165,464,0,0,0,0,0,0,0,NULL),(165,465,0,0,0,0,0,0,0,NULL),(165,467,0,0,0,0,0,0,0,NULL),(165,468,0,0,0,0,0,0,0,NULL),(165,469,0,0,1,0,0,0,0,NULL),(165,470,0,0,0,0,0,0,0,NULL),(165,471,0,0,0,0,1,0,0,NULL),(165,473,0,0,0,0,0,0,0,NULL),(165,474,0,0,0,0,0,0,0,NULL),(165,529,0,0,0,0,0,0,0,NULL),(165,557,0,0,0,0,0,0,0,NULL),(165,558,0,0,0,0,0,0,0,NULL),(165,559,0,0,0,0,0,0,0,NULL),(165,560,0,0,0,0,0,0,0,NULL),(165,561,0,0,0,0,0,0,0,NULL),(165,563,0,0,0,0,0,0,0,NULL),(165,564,0,0,0,0,0,1,0,NULL),(165,565,0,0,0,0,0,0,0,NULL),(165,718,1,0,0,0,0,0,0,NULL),(165,754,0,0,0,0,0,0,0,NULL),(165,755,1,0,0,0,0,0,0,NULL),(165,820,0,0,0,0,0,0,0,NULL),(165,821,0,0,0,0,0,0,0,NULL),(165,822,0,0,0,0,0,0,0,NULL),(165,823,0,0,0,0,0,0,0,NULL),(166,535,1,0,0,0,0,0,0,NULL),(166,536,0,0,0,0,0,0,0,NULL),(166,537,0,0,0,0,0,0,0,NULL),(166,538,0,0,0,0,0,0,0,NULL),(166,539,1,0,0,0,0,0,0,NULL),(166,541,0,0,0,0,0,0,0,NULL),(166,544,0,0,0,0,0,0,0,NULL),(166,545,0,0,0,0,0,0,0,NULL),(166,548,1,1,0,0,0,0,0,NULL),(166,551,1,0,0,0,0,0,0,NULL),(166,553,1,0,0,0,0,0,0,NULL),(166,554,2,0,0,0,0,0,0,NULL),(166,555,1,0,0,0,0,0,0,NULL),(166,703,0,0,0,0,0,0,0,NULL),(166,704,0,2,0,0,0,0,0,NULL),(166,767,0,0,1,0,0,0,0,NULL),(166,792,0,0,0,0,0,0,0,NULL),(166,824,0,0,0,0,0,0,0,NULL),(166,825,0,0,0,0,0,0,0,NULL),(167,511,0,0,0,0,0,0,0,NULL),(167,512,0,0,0,0,0,0,0,NULL),(167,513,0,0,0,0,0,0,0,NULL),(167,514,0,0,0,0,0,0,0,NULL),(167,518,0,0,0,0,0,0,0,NULL),(167,519,0,0,0,0,0,0,0,NULL),(167,589,0,2,1,0,0,0,0,NULL),(167,592,0,0,0,0,0,0,0,NULL),(167,594,0,0,1,0,0,0,0,NULL),(167,598,0,0,1,0,0,0,0,NULL),(167,687,0,0,0,0,0,0,0,NULL),(167,688,0,0,0,0,0,0,0,NULL),(167,689,2,1,0,0,0,0,0,NULL),(167,692,1,0,0,0,0,0,0,NULL),(167,693,1,0,0,0,0,0,0,NULL),(167,722,2,0,1,0,0,0,0,NULL),(167,778,0,0,0,0,0,0,0,NULL),(167,826,0,0,0,0,0,0,0,NULL),(168,475,0,0,0,0,0,0,0,NULL),(168,478,0,0,0,0,0,0,0,NULL),(168,480,0,0,0,0,0,0,0,NULL),(168,481,0,0,0,0,0,0,0,NULL),(168,482,0,0,0,0,0,0,0,NULL),(168,486,0,0,0,0,0,0,0,NULL),(168,488,0,0,0,0,0,0,0,NULL),(168,567,0,0,0,0,0,0,0,NULL),(168,568,0,0,0,0,0,0,0,NULL),(168,569,0,0,0,0,0,0,0,NULL),(168,570,0,0,0,0,0,0,0,NULL),(168,571,0,0,0,0,0,0,0,NULL),(168,572,0,0,0,0,0,0,0,NULL),(168,573,0,0,0,0,0,0,0,NULL),(168,575,1,0,0,0,0,0,0,NULL),(168,712,0,0,0,0,0,0,0,NULL),(168,713,2,0,0,0,0,0,0,NULL),(168,726,0,0,0,0,0,0,0,NULL),(168,730,0,0,0,0,0,0,0,NULL),(168,731,0,0,0,0,0,0,0,NULL),(168,732,0,0,0,0,0,0,0,NULL),(168,733,0,0,0,0,0,0,0,NULL),(168,736,0,0,0,0,0,0,0,NULL),(168,759,0,0,0,0,0,0,0,NULL),(168,827,0,0,0,0,0,0,0,NULL),(169,452,0,0,0,0,0,0,0,NULL),(169,454,0,1,0,0,0,0,0,NULL),(169,455,0,0,0,0,0,0,0,NULL),(169,456,0,0,0,0,0,0,0,NULL),(169,457,0,0,0,0,0,0,0,NULL),(169,458,0,0,0,0,0,0,0,NULL),(169,459,0,0,0,0,0,0,0,NULL),(169,460,1,0,0,0,0,0,0,NULL),(169,461,0,0,0,0,0,0,0,NULL),(169,462,0,1,0,0,0,0,0,NULL),(169,500,0,1,0,0,0,0,0,NULL),(169,502,0,0,0,0,0,0,0,NULL),(169,504,0,0,0,0,0,0,0,NULL),(169,507,1,0,0,0,0,0,0,NULL),(169,508,1,1,0,0,1,0,0,NULL),(169,509,1,0,0,0,0,0,0,NULL),(169,510,0,1,0,0,0,0,0,NULL),(169,669,1,0,0,0,0,0,0,NULL),(169,670,0,0,0,0,0,0,0,NULL),(169,671,0,0,0,0,0,0,0,NULL),(169,741,0,0,0,0,0,0,0,NULL),(169,797,0,0,0,0,0,0,0,NULL),(169,828,1,0,0,0,0,0,0,NULL),(169,829,0,0,0,0,0,0,0,NULL),(169,830,0,0,0,0,0,0,0,NULL),(170,490,1,1,0,0,0,0,0,NULL),(170,491,0,0,0,0,0,0,0,NULL),(170,492,0,0,0,0,0,0,0,NULL),(170,495,4,0,0,0,0,0,0,NULL),(170,497,1,4,0,0,0,0,0,NULL),(170,576,0,0,0,0,0,0,0,NULL),(170,577,0,0,0,0,0,0,0,NULL),(170,579,0,0,0,0,0,0,0,NULL),(170,581,0,0,0,0,0,0,0,NULL),(170,582,0,0,0,0,0,0,0,NULL),(170,583,1,0,0,0,0,0,0,NULL),(170,586,0,0,0,0,0,0,0,NULL),(170,659,1,0,0,0,0,0,0,NULL),(170,661,0,1,0,0,0,0,0,NULL),(170,673,0,0,0,0,0,0,0,NULL),(170,788,0,0,0,0,0,0,0,NULL),(170,790,2,0,0,0,0,0,0,NULL),(170,800,1,0,0,0,0,0,0,NULL),(170,831,1,1,0,0,0,0,0,NULL),(170,832,1,0,0,0,0,0,0,NULL),(171,557,0,0,0,0,0,0,0,NULL),(171,558,0,0,0,0,0,0,0,NULL),(171,559,0,0,0,0,0,0,0,NULL),(171,560,0,0,0,0,0,0,0,NULL),(171,561,0,0,0,0,0,0,0,NULL),(171,562,0,0,0,0,0,0,0,NULL),(171,563,0,0,0,0,0,0,0,NULL),(171,564,0,0,0,0,0,0,0,NULL),(171,565,0,0,0,0,0,0,0,NULL),(171,566,1,0,0,0,0,0,0,NULL),(171,648,0,0,0,0,0,0,0,NULL),(171,649,0,0,0,0,0,0,0,NULL),(171,650,0,0,0,0,0,0,0,NULL),(171,655,0,0,0,0,0,0,0,NULL),(171,656,0,0,0,0,0,0,0,NULL),(171,706,0,0,0,0,0,0,0,NULL),(171,707,0,0,0,0,0,0,0,NULL),(171,709,0,0,0,0,0,0,0,NULL),(171,710,1,0,0,0,0,0,0,NULL),(171,715,0,0,0,0,0,0,0,NULL),(171,716,0,0,0,0,0,0,0,NULL),(171,718,0,0,1,0,0,0,0,NULL),(171,791,1,0,0,0,0,0,0,NULL),(171,818,0,0,1,0,0,0,0,NULL),(171,820,0,0,0,0,0,0,0,NULL),(171,833,1,0,0,0,0,0,0,NULL),(171,834,0,0,0,0,0,0,0,NULL),(171,835,1,0,0,0,0,0,0,NULL),(172,446,0,0,0,0,0,0,0,NULL),(172,447,0,0,0,0,0,0,0,NULL),(172,448,0,0,0,0,0,0,0,NULL),(172,449,0,0,0,0,0,0,0,NULL),(172,451,1,0,0,0,0,0,0,NULL),(172,624,0,0,0,0,0,0,0,NULL),(172,625,0,0,0,0,0,0,0,NULL),(172,630,0,0,0,0,0,0,0,NULL),(172,631,0,0,0,0,1,0,0,NULL),(172,632,0,0,0,0,0,0,0,NULL),(172,633,0,0,0,0,0,0,0,NULL),(172,747,0,0,0,0,0,0,0,NULL),(172,748,2,0,0,0,0,0,0,NULL),(172,750,0,0,1,0,0,0,0,NULL),(172,765,1,0,0,0,0,0,0,NULL),(172,814,0,0,0,0,0,0,0,NULL),(172,816,0,0,0,0,0,0,0,NULL),(172,836,0,0,0,0,0,0,0,NULL),(172,837,0,0,0,0,0,0,0,NULL),(172,838,1,0,0,0,0,0,0,NULL),(172,839,0,0,1,0,0,0,0,NULL),(172,840,0,1,0,0,0,0,0,NULL),(173,463,0,0,0,0,0,0,0,NULL),(173,464,0,0,0,0,0,0,0,NULL),(173,465,0,0,0,0,0,0,0,NULL),(173,467,0,0,0,0,0,0,0,NULL),(173,468,0,0,0,0,0,0,0,NULL),(173,469,0,0,0,0,0,0,0,NULL),(173,470,0,0,0,0,0,0,0,NULL),(173,471,0,0,0,0,0,0,0,NULL),(173,473,0,0,0,0,0,0,0,NULL),(173,474,2,0,0,0,0,0,0,NULL),(173,601,0,0,0,0,0,0,0,NULL),(173,602,0,0,0,0,0,0,0,NULL),(173,603,0,0,0,0,0,0,0,NULL),(173,604,0,0,0,0,0,0,0,NULL),(173,605,0,0,0,0,0,0,0,NULL),(173,606,0,0,0,0,0,0,0,NULL),(173,608,0,0,0,0,0,0,0,NULL),(173,609,1,0,0,0,0,0,0,NULL),(173,742,0,0,0,0,0,0,0,NULL),(173,743,0,0,1,0,0,0,0,NULL),(173,754,0,0,0,0,0,0,0,NULL),(173,755,0,0,0,0,0,0,0,NULL),(173,756,0,0,0,0,0,0,0,NULL),(173,762,0,0,0,0,0,0,0,NULL),(173,779,0,0,0,0,0,0,0,NULL),(173,780,0,0,0,0,0,0,0,NULL),(173,823,1,0,0,0,0,0,0,NULL),(173,841,0,0,0,0,0,0,0,NULL),(174,610,0,0,0,0,0,0,0,NULL),(174,613,1,0,0,0,0,0,0,NULL),(174,614,0,0,0,0,0,0,0,NULL),(174,615,0,0,0,0,0,0,0,NULL),(174,617,0,2,0,0,0,0,0,NULL),(174,621,2,0,0,0,0,0,0,NULL),(174,622,0,2,0,0,0,0,0,NULL),(174,623,0,0,0,0,0,0,0,NULL),(174,676,0,0,0,0,0,0,0,NULL),(174,679,0,0,0,0,0,0,0,NULL),(174,680,1,0,0,0,0,0,0,NULL),(174,681,1,0,0,0,0,0,0,NULL),(174,682,2,0,0,0,0,0,0,NULL),(174,684,0,0,0,0,0,0,0,NULL),(174,685,1,0,0,0,0,0,0,NULL),(174,686,0,0,0,0,0,0,0,NULL),(174,738,0,0,0,0,0,0,0,NULL),(174,740,1,0,0,0,0,0,0,NULL),(174,774,0,0,0,0,0,0,0,NULL),(174,775,0,0,0,0,0,0,0,NULL),(174,794,0,0,0,0,0,0,0,NULL),(174,805,0,0,0,0,0,0,0,NULL),(174,806,0,1,0,0,0,0,0,NULL),(174,842,1,0,0,0,0,0,0,NULL),(175,434,0,0,0,0,0,0,0,NULL),(175,435,0,0,0,0,0,0,0,NULL),(175,436,0,0,0,0,0,0,0,NULL),(175,437,0,0,0,0,0,0,0,NULL),(175,438,0,0,2,0,0,0,0,NULL),(175,439,0,0,0,0,0,0,0,NULL),(175,441,0,0,0,0,0,0,0,NULL),(175,442,0,0,1,0,0,0,0,NULL),(175,443,0,0,0,0,0,0,0,NULL),(175,694,0,0,0,0,0,0,0,NULL),(175,695,1,0,0,0,0,0,0,NULL),(175,696,0,0,0,0,0,0,0,NULL),(175,697,0,0,0,0,0,0,0,NULL),(175,698,1,0,0,0,0,0,0,NULL),(175,699,0,0,0,0,0,0,0,NULL),(175,701,0,0,0,0,0,0,0,NULL),(175,702,0,0,0,0,0,0,0,NULL),(175,724,0,0,0,0,0,0,0,NULL),(175,770,0,0,0,0,0,0,0,NULL),(175,772,1,0,0,0,0,0,0,NULL),(175,807,0,0,0,0,0,0,0,NULL),(175,810,0,0,0,0,0,0,0,NULL),(175,843,0,0,0,0,0,0,0,NULL),(175,844,0,0,0,0,0,0,0,NULL),(175,845,0,0,0,0,0,0,0,NULL),(175,846,0,0,1,0,0,0,0,NULL),(175,847,0,0,0,0,0,0,0,NULL),(177,490,0,0,0,0,0,0,0,NULL),(177,492,0,0,0,0,0,0,0,NULL),(177,495,0,0,0,0,0,0,0,NULL),(177,497,0,1,0,0,0,0,0,NULL),(177,498,0,0,0,0,0,0,0,NULL),(177,499,1,0,0,0,0,0,0,NULL),(177,589,0,0,0,0,0,0,0,NULL),(177,592,0,0,1,0,0,0,0,NULL),(177,594,0,0,0,0,0,0,0,NULL),(177,597,0,0,0,0,0,0,0,NULL),(177,598,0,0,0,0,0,0,0,NULL),(177,660,0,0,0,0,0,0,0,NULL),(177,661,0,0,1,0,0,0,0,NULL),(177,687,0,0,0,0,0,0,0,NULL),(177,688,0,0,0,0,0,0,0,NULL),(177,689,0,0,0,0,0,0,0,NULL),(177,692,0,0,1,0,0,0,0,NULL),(177,693,0,0,0,0,0,0,0,NULL),(177,777,0,0,0,0,0,0,0,NULL),(177,788,0,0,0,0,0,0,0,NULL),(177,826,0,0,0,0,0,0,0,NULL),(177,831,0,0,0,0,0,0,0,NULL),(178,511,0,0,0,0,0,0,0,NULL),(178,512,0,0,0,0,0,0,0,NULL),(178,513,0,0,0,0,0,0,0,NULL),(178,514,0,0,0,0,0,0,0,NULL),(178,518,0,0,0,0,0,0,0,NULL),(178,544,1,0,0,0,0,0,0,NULL),(178,545,0,0,0,0,0,0,0,NULL),(178,546,0,0,0,0,0,0,0,NULL),(178,548,0,0,0,0,0,0,0,NULL),(178,549,0,0,0,0,0,0,0,NULL),(178,551,0,0,0,0,0,0,0,NULL),(178,553,0,0,0,0,0,0,0,NULL),(178,554,0,0,0,0,0,0,0,NULL),(178,555,0,0,0,0,0,0,0,NULL),(178,703,0,0,0,0,0,0,0,NULL),(178,705,0,0,0,0,0,0,0,NULL),(178,720,0,0,0,0,0,0,0,NULL),(178,723,1,0,0,0,0,0,0,NULL),(178,778,0,0,0,0,0,0,0,NULL),(178,848,0,0,0,0,0,0,0,NULL),(178,849,2,0,0,0,0,0,0,NULL),(179,567,0,0,0,0,0,0,0,NULL),(179,568,0,0,0,0,0,0,0,NULL),(179,569,0,0,0,0,0,0,0,NULL),(179,571,0,0,0,0,0,0,0,NULL),(179,572,0,0,0,0,0,0,0,NULL),(179,573,0,0,0,0,0,0,0,NULL),(179,574,0,0,0,0,0,0,0,NULL),(179,575,0,1,0,0,0,0,0,NULL),(179,624,0,0,0,0,0,0,0,NULL),(179,625,0,0,0,0,0,0,0,NULL),(179,626,0,0,0,0,0,0,0,NULL),(179,627,0,0,0,0,0,0,0,NULL),(179,628,0,0,0,0,0,0,0,NULL),(179,630,0,0,0,0,0,0,0,NULL),(179,631,0,1,0,0,0,0,0,NULL),(179,633,0,0,0,0,0,0,0,NULL),(179,712,0,0,0,0,0,0,0,NULL),(179,713,1,0,0,0,0,0,0,NULL),(179,714,0,0,0,0,0,0,0,NULL),(179,759,0,0,0,0,0,0,0,NULL),(179,763,1,0,0,0,0,0,0,NULL),(179,850,0,0,0,0,0,0,0,NULL),(179,851,0,0,1,0,0,0,0,NULL),(179,852,0,0,0,0,0,0,0,NULL),(180,601,0,0,0,0,0,0,0,NULL),(180,602,0,0,0,0,0,0,0,NULL),(180,603,0,1,0,0,0,0,0,NULL),(180,604,1,2,0,0,0,0,0,NULL),(180,605,0,1,0,0,0,0,0,NULL),(180,606,1,1,0,0,0,0,0,NULL),(180,608,0,0,0,0,0,0,0,NULL),(180,609,2,1,0,0,0,0,0,NULL),(180,649,0,0,0,0,0,0,0,NULL),(180,650,0,0,0,0,0,0,0,NULL),(180,651,1,0,0,0,0,0,0,NULL),(180,656,0,0,0,0,0,0,0,NULL),(180,706,0,0,0,0,0,0,0,NULL),(180,707,0,0,0,0,0,0,0,NULL),(180,708,0,0,0,0,0,0,0,NULL),(180,710,0,0,0,0,0,0,0,NULL),(180,742,1,1,0,0,0,0,0,NULL),(180,743,0,0,0,0,0,0,0,NULL),(180,779,0,0,0,0,0,0,0,NULL),(180,781,3,1,0,0,0,0,0,NULL),(180,786,0,0,0,0,0,0,0,NULL),(180,817,0,0,0,0,0,0,0,NULL),(180,818,1,0,0,0,0,0,0,NULL),(180,833,0,0,0,0,0,0,0,NULL),(181,634,0,0,0,0,0,0,0,NULL),(181,635,0,0,0,0,0,0,0,NULL),(181,637,1,0,0,0,0,0,0,NULL),(181,638,1,0,1,0,1,0,0,NULL),(181,640,0,0,0,0,0,0,0,NULL),(181,641,0,0,1,0,0,0,0,NULL),(181,643,0,0,0,0,0,0,0,NULL),(181,644,0,0,0,0,0,0,0,NULL),(181,645,0,0,0,0,0,0,0,NULL),(181,646,0,0,0,0,0,0,0,NULL),(181,667,0,0,0,0,0,0,0,NULL),(181,696,0,0,0,0,0,0,0,NULL),(181,697,0,0,0,0,0,0,0,NULL),(181,699,0,0,0,0,0,0,0,NULL),(181,700,1,0,0,0,0,0,0,NULL),(181,701,0,0,0,0,0,0,0,NULL),(181,770,0,0,0,0,0,0,0,NULL),(181,772,1,0,0,0,0,0,0,NULL),(181,807,1,0,0,0,0,0,0,NULL),(181,810,0,0,0,0,0,0,0,NULL),(181,811,0,0,1,0,1,0,0,NULL),(181,843,0,0,0,0,0,0,0,NULL),(181,844,0,0,0,0,0,0,0,NULL),(181,853,0,0,0,0,0,0,0,NULL),(181,854,0,0,0,0,0,0,0,NULL),(182,453,0,1,0,0,0,0,0,NULL),(182,454,1,0,0,0,0,0,0,NULL),(182,455,1,1,0,0,0,0,0,NULL),(182,457,0,0,1,0,0,0,0,NULL),(182,458,0,0,0,0,0,0,0,NULL),(182,459,1,3,0,0,0,0,0,NULL),(182,460,1,1,0,0,0,0,0,NULL),(182,461,1,0,0,0,0,0,0,NULL),(182,462,1,3,0,0,0,0,0,NULL),(182,669,3,0,0,0,0,0,0,NULL),(182,757,0,0,0,0,0,0,0,NULL),(183,480,0,0,0,0,0,0,0,NULL),(183,481,1,0,0,0,0,0,0,NULL),(183,485,0,0,0,0,0,0,0,NULL),(183,488,0,0,0,0,0,0,0,NULL),(183,501,0,0,0,0,0,0,0,NULL),(183,503,0,0,0,0,0,0,0,NULL),(183,507,0,1,0,0,0,0,0,NULL),(183,508,3,1,0,0,0,0,0,NULL),(183,509,1,1,0,0,0,0,0,NULL),(183,726,0,0,0,0,0,0,0,NULL),(183,731,0,0,0,0,0,0,0,NULL),(183,732,0,0,0,0,0,0,0,NULL),(183,734,0,0,0,0,0,0,0,NULL),(183,741,0,1,0,0,0,0,0,NULL),(183,797,0,0,0,0,0,0,0,NULL),(183,798,0,0,0,0,0,0,0,NULL),(183,828,0,0,0,0,0,0,0,NULL),(183,829,0,0,0,0,0,0,0,NULL),(184,444,0,0,0,0,0,0,0,NULL),(184,446,0,0,1,0,0,0,0,NULL),(184,447,0,0,0,0,0,0,0,NULL),(184,448,0,0,0,0,0,0,0,NULL),(184,451,2,0,0,0,0,0,0,NULL),(184,557,0,0,0,0,0,0,0,NULL),(184,562,0,0,0,0,0,0,0,NULL),(184,563,0,0,0,0,0,0,0,NULL),(184,564,0,0,0,0,0,0,0,NULL),(184,565,0,0,0,0,0,0,0,NULL),(184,566,1,0,0,0,0,0,0,NULL),(184,715,0,0,0,0,0,0,0,NULL),(184,716,0,0,0,0,0,0,0,NULL),(184,718,0,0,0,0,0,0,0,NULL),(184,749,0,0,0,0,0,0,0,NULL),(184,787,0,0,1,0,0,0,0,NULL),(184,791,0,0,0,0,0,0,0,NULL),(184,834,1,0,0,0,1,0,0,NULL),(184,836,0,0,0,0,0,0,0,NULL),(184,837,0,0,0,0,0,0,0,NULL),(184,855,0,0,0,0,0,0,0,NULL),(184,856,0,0,0,0,0,0,0,NULL),(185,463,0,0,0,0,0,0,0,NULL),(185,465,1,0,0,0,0,0,0,NULL),(185,466,0,0,0,0,0,0,0,NULL),(185,467,0,0,0,0,0,0,0,NULL),(185,468,0,0,0,0,0,0,0,NULL),(185,469,0,0,0,0,0,0,0,NULL),(185,470,0,0,0,0,0,0,0,NULL),(185,471,0,0,0,0,0,0,0,NULL),(185,473,1,0,0,0,1,0,0,NULL),(185,474,0,0,0,0,0,0,0,NULL),(185,576,0,0,0,0,0,0,0,NULL),(185,577,0,0,0,0,0,0,0,NULL),(185,578,0,0,0,0,0,0,0,NULL),(185,580,0,0,0,0,0,0,0,NULL),(185,581,0,0,0,0,0,0,0,NULL),(185,582,0,0,0,0,0,0,0,NULL),(185,583,0,0,0,0,0,0,0,NULL),(185,586,0,0,0,0,0,0,0,NULL),(185,587,0,0,0,0,0,0,0,NULL),(185,673,0,0,0,0,0,0,0,NULL),(185,755,2,0,0,0,0,0,0,NULL),(185,769,0,0,0,0,0,0,0,NULL),(185,800,0,0,0,0,0,0,0,NULL),(185,823,0,0,0,0,0,0,0,NULL),(186,434,0,0,0,0,0,0,0,NULL),(186,435,0,0,0,0,0,0,0,NULL),(186,437,0,0,0,0,0,0,0,NULL),(186,439,0,0,0,0,0,0,0,NULL),(186,441,0,4,0,0,0,0,0,NULL),(186,442,2,0,0,0,0,0,0,NULL),(186,443,2,0,0,0,0,0,0,NULL),(186,676,0,0,0,0,0,0,0,NULL),(186,679,0,0,0,0,0,0,0,NULL),(186,680,0,0,0,0,0,0,0,NULL),(186,682,0,0,0,0,0,0,0,NULL),(186,683,0,0,0,0,0,0,0,NULL),(186,686,0,0,0,0,0,0,0,NULL),(186,724,0,0,0,0,0,0,0,NULL),(186,725,0,0,0,0,0,0,0,NULL),(186,794,0,0,0,0,0,0,0,NULL),(186,803,1,0,0,0,0,0,0,NULL),(186,822,0,0,0,0,0,0,0,NULL),(186,847,0,0,0,0,0,0,0,NULL),(186,857,0,0,0,0,0,0,0,NULL),(186,858,0,0,0,0,0,0,0,NULL),(187,533,0,0,0,0,0,0,0,NULL),(187,534,0,0,0,0,0,0,0,NULL),(187,535,0,0,0,0,0,0,0,NULL),(187,536,0,0,1,0,0,0,0,NULL),(187,537,1,0,0,0,0,0,0,NULL),(187,538,0,0,0,0,0,0,0,NULL),(187,540,0,0,0,0,0,0,0,NULL),(187,541,2,0,0,0,0,0,0,NULL),(187,610,0,0,0,0,0,0,0,NULL),(187,612,0,0,0,0,0,0,0,NULL),(187,613,1,0,0,0,0,0,0,NULL),(187,614,0,0,0,0,0,0,0,NULL),(187,615,0,0,0,0,0,0,0,NULL),(187,617,0,0,0,0,0,0,0,NULL),(187,621,0,0,0,0,0,0,0,NULL),(187,737,0,0,0,0,0,0,0,NULL),(187,739,0,0,0,0,0,0,1,NULL),(187,767,2,0,0,0,0,0,0,NULL),(187,792,1,0,0,0,0,0,0,NULL),(187,806,0,1,0,0,0,0,0,NULL),(187,824,0,0,0,0,0,0,0,NULL),(187,842,1,0,0,0,0,0,0,NULL),(188,489,0,0,0,0,0,0,0,NULL),(188,490,0,0,0,0,0,0,0,NULL),(188,492,0,0,0,0,0,0,0,NULL),(188,494,1,0,0,0,0,0,0,NULL),(188,495,1,1,0,0,0,0,0,NULL),(188,497,2,2,0,0,0,0,0,NULL),(188,498,0,0,0,0,0,0,0,NULL),(188,499,0,0,0,0,0,0,0,NULL),(188,543,0,0,0,0,0,0,0,NULL),(188,544,1,0,0,0,0,0,0,NULL),(188,545,0,0,0,0,0,0,0,NULL),(188,546,0,0,0,0,0,0,0,NULL),(188,548,0,0,0,0,0,0,0,NULL),(188,549,0,0,0,0,0,0,0,NULL),(188,553,0,0,0,0,0,0,0,NULL),(188,554,0,0,0,0,0,0,0,NULL),(188,556,0,0,0,0,0,0,0,NULL),(188,659,0,0,0,0,0,0,0,NULL),(188,661,0,1,0,0,0,0,0,NULL),(188,703,0,0,0,0,0,0,0,NULL),(188,812,0,0,0,0,0,0,0,NULL),(188,831,0,0,0,0,0,0,0,NULL),(189,463,0,0,0,0,0,0,0,NULL),(189,464,0,0,0,0,0,0,0,NULL),(189,465,1,0,0,0,0,0,0,NULL),(189,468,0,0,0,0,0,0,0,NULL),(189,469,0,0,0,0,0,0,0,NULL),(189,470,1,0,0,0,0,0,0,NULL),(189,471,0,0,0,0,0,0,0,NULL),(189,473,0,0,0,0,0,0,0,NULL),(189,474,0,0,0,0,0,0,0,NULL),(189,589,0,0,0,0,0,0,0,NULL),(189,590,0,0,0,0,0,0,0,NULL),(189,592,0,0,0,0,0,0,0,NULL),(189,594,0,0,0,0,0,0,0,NULL),(189,597,0,0,0,0,0,0,0,NULL),(189,598,0,0,0,0,0,0,0,NULL),(189,599,0,0,0,0,0,0,0,NULL),(189,687,0,0,0,0,0,0,0,NULL),(189,689,0,0,0,0,0,0,0,NULL),(189,691,1,0,0,0,0,0,0,NULL),(189,692,0,0,0,0,0,0,0,NULL),(189,755,0,0,0,0,0,0,0,NULL),(189,756,0,0,0,0,0,0,0,NULL),(189,777,0,0,0,0,0,0,0,NULL),(189,821,0,0,0,0,0,0,0,NULL),(189,823,1,0,0,0,0,0,0,NULL),(189,826,0,0,0,0,0,0,0,NULL),(189,859,0,0,0,0,0,0,0,NULL),(189,860,0,0,0,0,0,0,0,NULL),(190,444,0,0,0,0,0,0,0,NULL),(190,447,1,0,0,0,0,0,0,NULL),(190,448,0,0,0,0,0,0,0,NULL),(190,451,1,0,0,0,0,0,0,NULL),(190,601,0,0,0,0,0,0,0,NULL),(190,602,0,0,0,0,0,0,0,NULL),(190,604,0,1,0,0,0,0,0,NULL),(190,605,0,0,0,0,0,0,0,NULL),(190,608,0,0,0,0,0,0,0,NULL),(190,609,1,0,1,0,0,0,0,NULL),(190,742,0,0,0,0,0,0,0,NULL),(190,748,1,0,0,0,0,0,0,NULL),(190,779,0,0,0,0,0,0,0,NULL),(190,787,1,0,0,0,0,0,0,NULL),(190,836,0,0,0,0,0,0,0,NULL),(190,837,0,0,0,0,0,0,0,NULL),(190,838,2,0,0,0,0,0,0,NULL),(190,855,0,0,0,0,0,0,0,NULL),(191,500,0,0,0,0,0,0,0,NULL),(191,501,0,0,0,0,0,0,0,NULL),(191,502,0,0,0,0,0,0,0,NULL),(191,504,0,0,0,0,0,0,0,NULL),(191,507,0,0,0,0,0,0,0,NULL),(191,508,2,0,0,0,0,0,0,NULL),(191,509,0,0,0,0,0,0,0,NULL),(191,568,0,0,0,0,0,0,0,NULL),(191,569,0,1,0,0,0,0,0,NULL),(191,571,0,0,0,0,0,0,0,NULL),(191,572,0,0,0,0,0,0,0,NULL),(191,573,1,2,0,0,0,0,0,NULL),(191,575,2,0,0,0,0,0,0,NULL),(191,712,0,0,0,0,0,0,0,NULL),(191,713,3,0,1,0,0,0,0,NULL),(191,741,0,0,0,0,0,0,0,NULL),(191,758,0,0,0,0,0,0,0,NULL),(191,759,0,0,0,0,0,0,0,NULL),(191,797,0,0,0,0,0,0,0,NULL),(191,828,0,0,0,0,0,0,0,NULL),(191,829,1,0,0,0,0,0,0,NULL),(191,861,0,1,0,0,0,0,0,NULL),(193,454,2,0,0,0,1,0,0,NULL),(193,455,1,1,0,0,0,0,0,NULL),(193,456,0,0,0,0,0,0,0,NULL),(193,458,0,0,0,0,0,0,0,NULL),(193,459,0,0,0,0,0,0,0,NULL),(193,461,0,1,0,0,0,0,0,NULL),(193,462,0,0,0,0,0,0,0,NULL),(193,669,0,0,0,0,0,0,0,NULL),(193,672,1,0,0,0,0,0,0,NULL),(193,694,0,0,0,0,0,0,0,NULL),(193,696,0,0,0,0,0,0,0,NULL),(193,697,1,0,0,0,0,0,0,NULL),(193,698,0,0,0,0,0,0,0,NULL),(193,699,0,0,0,0,0,0,0,NULL),(193,700,0,0,0,0,0,0,0,NULL),(193,701,0,0,0,0,0,0,0,NULL),(193,757,0,0,0,0,0,0,0,NULL),(193,770,0,0,0,0,0,0,0,NULL),(193,772,1,0,0,0,0,0,0,NULL),(193,809,1,0,0,0,0,0,0,NULL),(193,810,0,0,0,0,0,0,0,NULL),(193,844,0,0,0,0,0,0,0,NULL),(193,862,2,0,0,0,0,0,0,NULL),(194,634,0,0,0,0,0,0,0,NULL),(194,635,0,0,0,0,0,0,0,NULL),(194,640,0,0,0,0,0,0,0,NULL),(194,643,2,0,0,0,0,0,0,NULL),(194,644,4,0,0,0,0,0,0,NULL),(194,645,0,0,0,0,0,0,0,NULL),(194,646,0,0,0,0,0,0,0,NULL),(194,663,0,0,0,0,0,0,0,NULL),(194,665,0,0,0,0,0,0,0,NULL),(194,666,0,0,0,0,0,0,0,NULL),(194,667,0,0,0,0,0,0,0,NULL),(194,677,0,0,0,0,0,0,1,NULL),(194,678,0,0,0,0,0,0,0,NULL),(194,680,0,0,0,0,0,0,0,NULL),(194,682,3,0,0,0,0,0,0,NULL),(194,685,0,0,0,0,0,0,0,NULL),(194,774,0,0,0,0,0,0,0,NULL),(194,776,0,0,0,0,0,0,0,NULL),(194,794,0,0,0,0,0,0,0,NULL),(194,795,0,0,0,0,0,0,0,NULL),(194,796,0,0,0,0,0,0,0,NULL),(194,822,0,0,0,0,0,0,0,NULL),(194,863,0,0,0,0,0,0,0,NULL),(194,864,0,0,0,0,0,0,0,NULL),(195,513,0,0,0,0,0,0,0,NULL),(195,514,0,0,0,0,0,0,0,NULL),(195,515,1,0,0,0,0,0,0,NULL),(195,519,0,0,0,0,0,0,0,NULL),(195,610,0,0,0,0,0,0,0,NULL),(195,611,0,0,0,0,0,0,0,NULL),(195,613,0,0,0,0,0,0,0,NULL),(195,614,1,0,0,0,0,0,0,NULL),(195,615,0,0,0,0,0,0,0,NULL),(195,621,1,1,0,0,0,0,0,NULL),(195,719,1,0,0,0,0,0,0,NULL),(195,720,0,0,0,0,0,0,0,NULL),(195,737,0,0,0,0,0,0,0,NULL),(195,738,0,0,1,0,0,0,0,NULL),(195,739,0,0,0,0,0,0,0,NULL),(195,740,0,0,0,0,0,0,0,NULL),(195,778,0,0,0,0,0,0,0,NULL),(195,805,0,0,0,0,0,0,0,NULL),(195,849,0,0,0,0,0,0,0,NULL),(195,865,0,0,0,0,0,0,0,NULL),(195,866,0,0,1,0,0,0,0,NULL),(196,434,0,0,0,0,0,0,0,NULL),(196,436,0,0,0,0,0,0,0,NULL),(196,438,1,0,0,0,0,0,0,NULL),(196,439,0,0,0,0,0,0,0,NULL),(196,441,0,1,0,0,0,0,0,NULL),(196,442,0,0,0,0,0,0,0,NULL),(196,443,4,0,0,0,0,0,0,NULL),(196,533,0,0,0,0,0,0,0,NULL),(196,534,0,0,0,0,0,0,0,NULL),(196,535,0,0,0,0,0,0,0,NULL),(196,536,0,0,0,0,0,0,0,NULL),(196,537,0,0,0,0,0,0,0,NULL),(196,539,0,0,0,0,0,0,0,NULL),(196,540,0,0,0,0,0,0,0,NULL),(196,541,1,0,0,0,0,1,0,NULL),(196,542,0,0,0,0,0,0,0,NULL),(196,724,0,0,1,0,0,0,0,NULL),(196,725,0,0,0,0,0,0,0,NULL),(196,744,0,0,0,0,0,0,0,NULL),(196,767,0,0,0,0,0,0,0,NULL),(196,803,0,0,0,0,0,0,0,NULL),(196,847,0,1,0,0,0,0,0,NULL),(198,577,0,0,0,0,0,0,0,NULL),(198,580,0,0,0,0,0,0,0,NULL),(198,581,1,0,0,0,0,0,0,NULL),(198,582,1,0,0,0,0,0,0,NULL),(198,583,0,0,0,0,0,0,0,NULL),(198,587,0,0,0,0,0,0,0,NULL),(198,647,0,0,0,0,0,0,0,NULL),(198,649,0,0,0,0,0,0,0,NULL),(198,650,0,0,0,0,0,0,0,NULL),(198,651,0,0,0,0,0,0,0,NULL),(198,655,0,0,0,0,0,0,0,NULL),(198,656,0,0,0,0,0,0,0,NULL),(198,673,0,0,0,0,0,0,0,NULL),(198,708,0,0,0,0,0,0,0,NULL),(198,709,0,0,1,0,0,0,0,NULL),(198,710,0,0,0,0,0,0,0,NULL),(198,769,0,0,0,0,0,0,0,NULL),(198,786,0,0,0,0,0,0,0,NULL),(198,800,1,0,0,0,0,0,0,NULL),(198,817,0,0,0,0,0,0,0,NULL),(198,818,1,0,0,0,0,0,0,NULL),(199,464,0,0,0,0,0,0,0,NULL),(199,465,0,0,0,0,0,0,0,NULL),(199,467,0,0,0,0,0,0,0,NULL),(199,468,0,0,0,0,0,0,0,NULL),(199,469,0,0,0,0,0,0,0,NULL),(199,470,1,0,0,0,0,0,0,NULL),(199,471,0,0,0,0,0,0,0,NULL),(199,473,0,0,0,0,0,0,0,NULL),(199,474,1,0,0,0,0,0,0,NULL),(199,544,0,0,0,0,0,0,0,NULL),(199,545,0,0,0,0,0,0,0,NULL),(199,546,0,0,0,0,0,0,0,NULL),(199,547,0,0,0,0,0,0,0,NULL),(199,548,0,0,0,0,0,0,0,NULL),(199,549,0,0,0,0,0,0,0,NULL),(199,553,1,0,0,0,0,0,0,NULL),(199,554,0,0,0,0,0,0,0,NULL),(199,555,0,0,0,0,0,0,0,NULL),(199,556,0,0,0,0,0,0,0,NULL),(199,703,1,0,0,0,0,0,0,NULL),(199,755,0,0,0,0,0,0,0,NULL),(199,761,0,0,0,0,0,0,0,NULL),(199,860,1,0,0,0,0,0,0,NULL),(200,533,0,0,0,0,0,0,0,NULL),(200,534,0,0,0,0,0,0,0,NULL),(200,535,0,0,0,0,0,0,0,NULL),(200,536,0,0,0,0,0,0,0,NULL),(200,537,0,0,0,0,0,0,0,NULL),(200,538,0,0,0,0,0,0,0,NULL),(200,540,0,0,1,0,0,0,0,NULL),(200,542,0,0,0,0,0,0,0,NULL),(200,635,0,0,0,0,0,0,0,NULL),(200,640,0,0,0,0,0,0,0,NULL),(200,641,0,0,0,0,0,0,0,NULL),(200,643,0,0,0,0,0,0,0,NULL),(200,644,2,0,0,0,0,0,0,NULL),(200,645,0,0,0,0,0,0,0,NULL),(200,646,0,0,0,0,0,0,0,NULL),(200,662,0,0,0,0,0,0,0,NULL),(200,666,0,0,1,0,0,0,0,NULL),(200,667,0,0,1,0,0,0,0,NULL),(200,746,0,0,0,0,0,0,0,NULL),(200,796,1,0,0,0,0,0,0,NULL),(200,867,0,0,0,0,0,0,0,NULL),(200,868,0,0,0,0,0,0,0,NULL),(201,453,0,0,0,0,0,0,0,NULL),(201,454,1,0,0,0,0,0,0,NULL),(201,455,1,0,0,0,0,0,0,NULL),(201,456,1,0,0,0,0,0,0,NULL),(201,457,1,0,0,0,0,0,0,NULL),(201,458,0,1,1,0,0,0,0,NULL),(201,459,0,1,0,0,0,0,0,NULL),(201,460,0,0,0,0,0,0,0,NULL),(201,462,0,2,0,0,0,0,0,NULL),(201,669,1,0,0,0,0,0,0,NULL),(201,672,0,0,0,0,0,0,0,NULL),(201,677,0,0,2,0,0,0,0,NULL),(201,680,0,0,0,0,0,0,0,NULL),(201,682,1,0,1,0,0,1,0,NULL),(201,683,0,0,0,0,0,0,0,NULL),(201,685,2,0,0,0,0,0,0,NULL),(201,686,1,0,0,0,0,0,0,NULL),(201,757,0,0,0,0,0,0,0,NULL),(201,774,0,0,1,0,0,0,0,NULL),(201,776,0,0,0,0,0,0,0,NULL),(201,794,0,0,0,0,0,0,0,NULL),(201,822,0,0,0,0,0,0,0,NULL),(201,863,0,0,0,0,0,0,0,NULL),(202,476,0,0,0,0,0,0,0,NULL),(202,477,0,0,0,0,0,0,0,NULL),(202,478,0,0,0,0,0,0,0,NULL),(202,479,1,0,1,0,0,0,0,NULL),(202,480,0,0,0,0,0,0,0,NULL),(202,481,1,0,0,0,0,0,0,NULL),(202,482,0,0,0,0,0,0,0,NULL),(202,485,0,0,0,0,0,0,0,NULL),(202,487,0,0,0,0,0,0,0,NULL),(202,488,2,0,0,0,0,0,0,NULL),(202,698,0,0,0,0,0,0,0,NULL),(202,701,1,0,0,0,0,0,0,NULL),(202,726,0,0,0,0,0,0,0,NULL),(202,731,0,0,0,0,0,0,0,NULL),(202,734,0,0,0,0,0,0,0,NULL),(202,770,0,0,0,0,0,0,0,NULL),(202,772,0,0,0,0,0,0,0,NULL),(202,798,0,0,0,0,0,0,0,NULL),(202,807,0,0,0,0,0,0,0,NULL),(202,810,0,0,0,0,0,0,0,NULL),(202,811,1,0,0,0,0,0,0,NULL),(202,827,0,0,0,0,0,0,0,NULL),(202,843,0,0,0,0,0,0,0,NULL),(202,844,0,0,0,0,0,0,0,NULL),(202,854,0,0,0,0,0,0,0,NULL),(202,862,0,0,0,0,0,0,0,NULL),(202,869,0,0,0,0,0,0,0,NULL),(202,870,0,0,0,0,0,0,0,NULL),(204,557,0,0,0,0,0,0,0,NULL),(204,559,0,0,0,0,0,0,0,NULL),(204,562,0,0,0,0,0,0,0,NULL),(204,563,0,0,0,0,0,0,0,NULL),(204,564,0,0,0,0,0,0,0,NULL),(204,565,0,0,0,0,0,0,0,NULL),(204,566,1,0,0,0,0,0,0,NULL),(204,569,1,2,0,0,0,0,0,NULL),(204,571,0,0,0,0,0,0,0,NULL),(204,572,0,0,0,0,0,0,0,NULL),(204,573,0,2,0,0,0,0,0,NULL),(204,575,4,1,0,0,0,0,0,NULL),(204,711,0,0,0,0,0,0,0,NULL),(204,712,0,0,0,0,0,0,0,NULL),(204,713,1,0,0,0,0,0,0,NULL),(204,714,0,0,0,0,0,0,0,NULL),(204,718,0,0,0,0,0,0,0,NULL),(204,834,0,0,0,0,0,0,0,NULL),(204,835,2,0,0,0,0,0,0,NULL),(205,434,0,0,1,0,0,0,0,NULL),(205,435,0,0,1,0,0,0,0,NULL),(205,436,0,0,0,0,0,0,0,NULL),(205,437,0,0,0,0,0,0,0,NULL),(205,438,0,0,0,0,0,0,0,NULL),(205,439,0,0,0,0,0,0,0,NULL),(205,441,0,1,0,0,0,0,0,NULL),(205,442,0,0,0,0,0,0,0,NULL),(205,443,0,0,0,0,0,0,0,NULL),(205,511,0,0,0,0,0,0,0,NULL),(205,512,0,0,0,0,0,0,0,NULL),(205,513,0,0,0,0,0,0,0,NULL),(205,514,1,0,0,0,0,0,0,NULL),(205,518,0,0,0,0,0,0,0,NULL),(205,519,0,0,0,0,0,0,0,NULL),(205,720,0,0,0,0,0,0,0,NULL),(205,721,0,0,0,0,0,0,0,NULL),(205,724,0,0,1,0,0,0,0,NULL),(205,785,0,0,0,0,0,0,0,NULL),(205,803,1,1,0,0,0,0,0,NULL),(205,847,1,0,0,0,0,0,0,NULL),(205,849,0,0,0,0,0,0,0,NULL),(205,866,0,0,1,0,0,0,0,NULL),(205,871,0,0,0,0,0,0,0,NULL),(205,872,0,0,0,0,0,0,0,NULL),(205,873,0,0,0,0,0,0,0,NULL),(206,489,0,0,0,0,0,0,0,NULL),(206,490,0,1,0,1,0,0,0,NULL),(206,492,0,0,0,0,0,0,0,NULL),(206,494,4,0,0,0,0,0,0,NULL),(206,495,4,4,0,0,0,0,0,NULL),(206,497,4,4,0,0,0,0,0,NULL),(206,610,0,0,0,0,0,0,0,NULL),(206,612,0,0,0,0,0,0,0,NULL),(206,615,0,0,0,0,0,0,0,NULL),(206,617,0,0,0,0,0,0,0,NULL),(206,623,1,1,0,0,0,0,0,NULL),(206,659,0,1,0,0,0,0,0,NULL),(206,660,0,3,0,0,0,0,0,NULL),(206,661,2,1,0,0,0,0,0,NULL),(206,740,0,0,0,1,0,0,0,NULL),(206,805,0,0,0,0,0,0,0,NULL),(206,842,2,0,0,0,0,0,0,NULL),(207,589,2,1,0,0,0,0,0,NULL),(207,590,0,0,0,0,0,0,0,NULL),(207,591,2,0,0,0,0,0,0,NULL),(207,592,0,0,0,0,0,0,0,NULL),(207,595,0,0,0,0,0,0,0,NULL),(207,598,0,0,0,0,0,0,0,NULL),(207,599,0,0,0,0,0,0,0,NULL),(207,648,1,0,0,0,0,0,0,NULL),(207,649,1,0,0,0,0,0,0,NULL),(207,650,0,0,0,0,0,0,0,NULL),(207,655,0,0,0,0,0,0,0,NULL),(207,656,0,0,0,0,1,0,0,NULL),(207,687,0,0,0,0,0,0,0,NULL),(207,688,1,0,0,0,0,0,0,NULL),(207,707,0,0,0,0,0,0,0,NULL),(207,708,0,0,0,0,0,0,0,NULL),(207,710,0,0,0,0,0,0,0,NULL),(207,777,1,0,0,0,0,0,0,NULL),(207,818,0,0,0,0,0,0,0,NULL),(207,874,2,0,0,0,0,0,0,NULL),(207,875,1,0,0,0,0,0,0,NULL),(208,601,0,0,0,0,0,0,0,NULL),(208,602,0,0,0,0,0,0,0,NULL),(208,603,0,0,1,0,0,0,0,NULL),(208,604,0,0,0,0,0,0,0,NULL),(208,605,0,0,0,0,0,0,0,NULL),(208,606,0,1,0,0,0,0,0,NULL),(208,608,0,0,0,0,0,0,0,NULL),(208,609,2,1,1,0,0,0,0,NULL),(208,624,0,0,0,0,0,0,0,NULL),(208,625,0,0,0,0,0,0,0,NULL),(208,627,1,0,0,0,1,0,0,NULL),(208,628,0,0,0,0,0,0,0,NULL),(208,630,0,0,0,0,0,0,0,NULL),(208,631,0,0,0,0,0,0,0,NULL),(208,632,0,0,0,0,0,0,0,NULL),(208,742,0,0,0,0,0,0,0,NULL),(208,743,0,1,0,0,0,0,0,NULL),(208,779,0,0,0,0,0,0,0,NULL),(208,782,1,0,0,0,0,0,0,NULL),(208,816,0,0,0,0,0,0,0,NULL),(208,840,0,0,0,0,0,0,0,NULL),(208,850,1,0,0,0,0,0,0,NULL),(208,851,0,0,0,0,0,0,0,NULL),(209,444,0,0,0,0,0,0,0,NULL),(209,445,0,0,0,0,0,0,0,NULL),(209,446,0,0,1,0,0,0,0,NULL),(209,447,1,0,0,0,0,0,0,NULL),(209,448,0,0,0,0,0,0,0,NULL),(209,451,0,0,0,0,0,0,0,NULL),(209,576,0,0,0,0,0,0,0,NULL),(209,578,1,0,0,0,0,0,0,NULL),(209,579,0,0,1,0,0,0,0,NULL),(209,580,0,0,0,0,0,0,0,NULL),(209,586,2,0,0,0,0,0,0,NULL),(209,673,0,0,0,0,0,0,0,NULL),(209,769,0,0,0,0,0,0,0,NULL),(209,787,0,0,0,0,0,0,0,NULL),(209,800,0,0,0,0,0,0,0,NULL),(209,837,0,0,0,0,0,0,0,NULL),(209,855,0,0,0,0,0,0,0,NULL),(209,876,0,0,0,0,0,0,0,NULL),(210,521,0,0,0,0,0,0,0,NULL),(210,522,0,0,1,0,0,0,0,NULL),(210,525,0,0,0,0,0,0,0,NULL),(210,527,0,0,0,0,0,0,0,NULL),(210,528,0,0,0,0,0,0,0,NULL),(210,530,0,0,0,0,0,0,0,NULL),(210,532,1,0,1,0,0,0,0,NULL),(210,568,0,0,0,0,0,0,0,NULL),(210,569,0,0,0,0,0,0,0,NULL),(210,570,0,1,0,0,0,0,0,NULL),(210,571,0,0,0,0,0,0,0,NULL),(210,572,0,0,0,0,0,0,0,NULL),(210,573,0,0,0,0,0,0,0,NULL),(210,575,0,0,0,0,1,0,0,NULL),(210,712,0,0,0,0,0,0,0,NULL),(210,713,2,0,0,0,0,0,0,NULL),(210,758,0,0,0,0,0,0,0,NULL),(210,759,0,0,0,0,0,0,0,NULL),(210,877,0,0,0,0,0,0,0,NULL),(210,878,0,0,1,0,0,0,0,NULL),(211,500,0,0,0,0,0,0,0,NULL),(211,501,0,0,0,0,0,0,0,NULL),(211,502,0,0,0,0,0,0,0,NULL),(211,508,0,0,0,0,0,0,0,NULL),(211,509,0,0,0,0,0,0,0,NULL),(211,510,0,0,0,0,0,0,0,NULL),(211,697,0,0,0,0,0,0,0,NULL),(211,700,0,0,0,0,0,0,0,NULL),(211,741,0,0,0,0,0,0,0,NULL),(211,770,0,0,0,0,0,0,0,NULL),(211,772,0,0,0,0,0,0,0,NULL),(211,797,0,0,0,0,0,0,0,NULL),(211,807,0,0,0,0,0,0,0,NULL),(211,810,0,0,0,0,0,0,0,NULL),(211,811,0,0,0,0,0,0,0,NULL),(211,828,0,0,0,0,0,0,0,NULL),(211,844,0,0,0,0,0,0,0,NULL),(211,854,0,0,0,0,0,0,0,NULL),(211,862,0,0,0,0,0,0,0,NULL),(212,479,2,0,0,0,0,0,0,NULL),(212,480,1,0,0,0,0,0,0,NULL),(212,481,1,0,0,0,0,0,0,NULL),(212,482,0,0,0,0,0,0,0,NULL),(212,486,0,0,1,0,0,0,0,NULL),(212,487,0,0,0,0,0,0,0,NULL),(212,488,1,0,0,0,0,0,0,NULL),(212,676,0,0,0,0,0,0,0,NULL),(212,679,0,0,1,0,0,0,0,NULL),(212,680,0,0,0,0,0,0,0,NULL),(212,681,1,0,0,0,0,0,0,NULL),(212,682,1,0,0,0,0,0,0,NULL),(212,686,1,0,0,0,0,0,0,NULL),(212,726,0,0,0,0,0,0,0,NULL),(212,731,0,0,0,0,0,0,0,NULL),(212,734,0,0,0,0,0,0,0,NULL),(212,774,0,0,0,0,0,0,0,NULL),(212,795,0,0,0,0,0,0,0,NULL),(212,798,0,0,0,0,0,0,0,NULL),(212,879,0,0,0,0,0,0,0,NULL),(213,455,1,1,0,0,0,0,0,NULL),(213,456,0,0,0,0,0,0,0,NULL),(213,457,1,1,0,0,0,0,0,NULL),(213,458,0,0,0,0,0,0,0,NULL),(213,459,0,0,0,0,0,0,0,NULL),(213,460,0,0,0,0,0,0,0,NULL),(213,462,2,2,0,0,0,0,0,NULL),(213,533,0,0,0,0,0,0,0,NULL),(213,534,0,0,0,0,0,0,0,NULL),(213,535,0,0,0,0,0,0,0,NULL),(213,536,0,0,0,0,0,0,0,NULL),(213,537,1,0,0,0,0,0,0,NULL),(213,538,2,0,0,0,0,0,0,NULL),(213,540,0,0,0,0,0,0,0,NULL),(213,541,3,0,0,0,0,0,0,NULL),(213,670,0,0,0,0,0,0,0,NULL),(213,672,2,0,0,0,0,0,0,NULL),(213,746,0,0,0,0,0,0,0,NULL),(213,757,0,0,0,0,0,0,0,NULL),(213,767,0,0,0,0,0,0,0,NULL),(214,513,0,0,0,0,0,0,0,NULL),(214,514,0,0,0,0,0,0,0,NULL),(214,515,1,0,0,0,0,0,0,NULL),(214,517,0,0,0,0,0,0,0,NULL),(214,519,0,0,0,0,0,0,0,NULL),(214,634,0,0,0,0,0,0,0,NULL),(214,635,0,0,0,0,0,0,0,NULL),(214,637,2,0,0,0,0,0,0,NULL),(214,638,1,0,0,0,0,0,0,NULL),(214,640,0,0,0,0,0,0,0,NULL),(214,644,2,0,0,0,0,0,0,NULL),(214,645,0,0,0,0,0,0,0,NULL),(214,646,0,0,1,0,0,0,0,NULL),(214,663,0,0,0,0,0,0,0,NULL),(214,665,0,0,0,0,0,0,0,NULL),(214,667,0,0,0,0,0,0,0,NULL),(214,719,0,0,0,0,1,0,0,NULL),(214,720,0,0,0,0,0,0,0,NULL),(214,778,0,0,1,0,0,0,0,NULL),(214,849,0,0,0,0,0,0,0,NULL),(214,872,0,0,0,0,0,0,0,NULL),(214,873,0,0,0,0,0,0,0,NULL),(215,576,0,0,0,0,0,0,0,NULL),(215,579,0,0,0,0,0,0,0,NULL),(215,580,0,0,0,0,0,0,0,NULL),(215,581,0,0,0,0,0,0,0,NULL),(215,583,0,0,0,0,0,0,0,NULL),(215,584,0,0,1,0,0,0,0,NULL),(215,586,0,0,0,0,0,0,0,NULL),(215,587,0,0,0,0,0,0,0,NULL),(215,624,0,0,0,0,0,0,0,NULL),(215,625,0,0,0,0,0,0,0,NULL),(215,626,0,0,0,0,0,0,0,NULL),(215,627,1,0,0,0,0,0,0,NULL),(215,628,0,0,0,0,0,0,0,NULL),(215,629,0,0,0,0,0,0,0,NULL),(215,631,0,0,0,0,0,0,0,NULL),(215,765,0,0,0,0,0,0,0,NULL),(215,800,2,0,0,0,0,0,0,NULL),(215,814,0,0,0,0,0,0,0,NULL),(215,815,0,0,0,0,0,0,0,NULL),(215,832,0,0,0,0,0,0,0,NULL),(215,840,0,0,0,0,0,0,0,NULL),(215,850,0,0,0,0,0,0,0,NULL),(215,851,2,0,0,0,0,0,0,NULL),(215,876,1,0,0,0,0,0,0,NULL),(216,444,0,0,0,0,0,0,0,NULL),(216,446,0,0,0,0,0,0,0,NULL),(216,447,0,0,0,0,0,0,0,NULL),(216,448,0,0,0,0,0,0,0,NULL),(216,450,1,0,0,0,0,0,0,NULL),(216,451,0,0,1,0,0,0,0,NULL),(216,590,0,0,0,0,0,0,0,NULL),(216,591,1,0,0,0,0,0,0,NULL),(216,592,0,0,0,0,0,0,0,NULL),(216,598,1,0,0,0,0,0,0,NULL),(216,687,0,0,0,0,0,0,0,NULL),(216,693,0,0,0,0,0,0,0,NULL),(216,749,0,0,0,0,0,0,0,NULL),(216,750,0,0,0,0,0,0,0,NULL),(216,787,0,0,0,0,0,0,0,NULL),(216,826,0,0,0,0,0,0,0,NULL),(216,837,0,0,0,0,0,0,0,NULL),(216,855,0,0,0,0,0,0,0,NULL),(216,880,0,0,0,0,0,0,0,NULL),(216,881,0,0,0,0,0,0,0,NULL),(217,543,0,0,0,0,0,0,0,NULL),(217,544,0,0,0,0,0,0,0,NULL),(217,545,0,0,0,0,0,0,0,NULL),(217,546,0,0,1,0,0,0,0,NULL),(217,547,0,0,0,0,0,0,0,NULL),(217,548,0,0,0,0,0,0,0,NULL),(217,550,0,0,0,0,0,0,0,NULL),(217,553,1,0,0,0,0,0,0,NULL),(217,555,0,0,0,0,0,0,0,NULL),(217,648,0,0,0,0,0,0,0,NULL),(217,651,0,0,0,0,0,0,0,NULL),(217,652,0,0,0,0,0,0,0,NULL),(217,653,0,0,0,0,0,0,0,NULL),(217,655,0,0,0,0,0,0,0,NULL),(217,656,0,0,0,0,0,0,0,NULL),(217,703,1,0,0,0,0,0,0,NULL),(217,704,1,0,0,0,0,0,0,NULL),(217,707,0,0,0,0,0,0,0,NULL),(217,709,0,0,0,0,0,0,0,NULL),(217,710,0,0,0,0,0,0,0,NULL),(217,817,0,0,1,0,0,0,0,NULL),(217,875,0,0,0,0,0,0,0,NULL),(217,882,0,0,0,0,0,0,0,NULL),(218,463,0,0,0,0,0,0,0,NULL),(218,464,0,0,0,0,0,0,0,NULL),(218,465,1,0,0,0,0,0,0,NULL),(218,466,0,0,0,0,0,0,0,NULL),(218,467,0,0,0,0,0,0,0,NULL),(218,468,0,0,0,0,0,0,0,NULL),(218,469,1,0,0,0,0,0,0,NULL),(218,470,2,0,0,0,0,0,0,NULL),(218,471,0,0,0,0,0,0,0,NULL),(218,473,0,0,0,0,0,0,0,NULL),(218,474,0,0,0,0,0,0,0,NULL),(218,610,0,0,0,0,0,0,0,NULL),(218,611,0,0,0,0,0,0,0,NULL),(218,612,0,0,0,0,0,0,0,NULL),(218,619,0,0,0,0,0,0,0,NULL),(218,621,0,0,0,0,0,0,0,NULL),(218,737,0,0,0,0,0,0,0,NULL),(218,738,0,0,0,0,1,0,0,NULL),(218,739,0,0,0,0,0,0,0,NULL),(218,755,0,0,0,0,0,0,0,NULL),(218,756,0,0,0,0,0,0,0,NULL),(218,823,0,0,0,0,0,0,0,NULL),(218,859,0,0,0,0,0,0,0,NULL),(219,434,0,0,0,0,0,0,0,NULL),(219,435,0,0,0,0,0,0,0,NULL),(219,436,0,0,0,0,0,0,0,NULL),(219,437,0,0,0,0,0,0,0,NULL),(219,438,0,0,0,0,0,0,0,NULL),(219,439,0,0,0,0,0,0,0,NULL),(219,441,4,0,0,0,0,0,0,NULL),(219,442,1,0,0,0,0,0,0,NULL),(219,443,0,1,1,0,0,0,0,NULL),(219,491,1,0,0,0,0,0,0,NULL),(219,494,0,2,0,0,0,0,0,NULL),(219,495,5,1,0,0,0,0,0,NULL),(219,497,1,3,0,0,0,0,0,NULL),(219,499,0,0,0,0,0,0,0,NULL),(219,660,0,0,0,0,0,0,0,NULL),(219,725,0,3,0,0,0,0,0,NULL),(219,803,0,1,0,0,0,0,0,NULL),(219,831,1,1,0,0,0,0,0,NULL),(219,847,0,0,0,0,0,0,0,NULL),(219,857,0,0,0,0,0,0,0,NULL),(220,558,0,0,0,0,0,0,0,NULL),(220,559,0,0,0,0,0,0,0,NULL),(220,561,0,0,0,0,0,0,0,NULL),(220,562,0,0,0,0,0,0,0,NULL),(220,563,0,0,0,0,0,0,0,NULL),(220,564,1,0,1,0,0,0,0,NULL),(220,565,0,0,0,0,0,0,0,NULL),(220,566,2,0,0,0,0,0,0,NULL),(220,601,0,0,1,0,0,0,0,NULL),(220,602,0,0,0,0,0,0,0,NULL),(220,603,0,0,0,0,0,0,0,NULL),(220,604,0,1,0,0,0,0,0,NULL),(220,605,0,0,0,0,0,0,0,NULL),(220,606,1,0,0,0,0,0,0,NULL),(220,609,0,1,0,0,0,0,0,NULL),(220,718,0,0,0,0,0,0,0,NULL),(220,779,0,0,0,0,0,0,0,NULL),(220,781,1,0,1,0,0,0,0,NULL),(220,791,0,0,0,0,0,0,0,NULL),(220,834,0,0,0,0,0,0,0,NULL),(220,883,0,0,0,0,0,0,0,NULL),(221,567,0,0,0,0,0,0,0,NULL),(221,568,0,1,0,0,0,0,0,NULL),(221,569,0,0,0,0,0,0,0,NULL),(221,570,0,0,0,0,0,0,0,NULL),(221,573,0,1,0,0,0,0,0,NULL),(221,574,0,0,0,0,0,0,0,NULL),(221,575,2,0,0,0,0,0,0,NULL),(221,600,0,0,0,0,0,0,0,NULL),(221,601,0,0,1,0,0,0,0,NULL),(221,602,0,0,1,0,0,0,0,NULL),(221,604,0,0,0,0,0,0,0,NULL),(221,605,0,0,0,0,0,0,0,NULL),(221,606,0,0,0,0,0,0,0,NULL),(221,607,0,0,0,0,0,0,0,NULL),(221,608,0,0,0,0,0,0,0,NULL),(221,609,0,0,0,0,0,0,0,NULL),(221,711,0,0,0,0,0,0,0,NULL),(221,712,0,0,0,0,0,0,0,NULL),(221,713,1,0,0,0,0,0,0,NULL),(221,743,0,0,0,0,0,0,0,NULL),(221,779,0,0,0,0,0,0,0,NULL),(222,589,0,0,0,0,0,0,0,NULL),(222,590,0,0,0,0,0,0,0,NULL),(222,591,1,1,0,0,0,0,0,NULL),(222,592,0,0,0,0,0,0,0,NULL),(222,594,0,0,0,0,0,0,0,NULL),(222,595,0,0,0,0,0,0,0,NULL),(222,597,0,0,0,0,0,0,0,NULL),(222,598,1,0,0,0,0,0,0,NULL),(222,599,1,0,0,0,0,0,0,NULL),(222,624,0,0,0,0,0,0,0,NULL),(222,625,0,0,0,0,0,0,0,NULL),(222,626,0,0,0,0,0,0,0,NULL),(222,627,0,0,0,0,0,0,0,NULL),(222,628,0,0,0,0,0,0,0,NULL),(222,630,0,0,0,0,0,0,0,NULL),(222,631,1,0,0,0,0,0,0,NULL),(222,633,0,0,0,0,0,0,0,NULL),(222,687,0,0,0,0,0,0,0,NULL),(222,689,0,0,0,0,0,0,0,NULL),(222,763,0,0,0,0,0,0,0,NULL),(222,765,0,0,0,0,0,0,0,NULL),(223,611,0,0,0,0,0,0,0,NULL),(223,613,0,0,0,0,0,0,0,NULL),(223,614,0,0,1,0,0,0,0,NULL),(223,616,0,0,0,0,0,0,0,NULL),(223,618,1,0,0,0,0,0,0,NULL),(223,619,1,0,0,0,0,0,0,NULL),(223,621,1,0,0,0,0,0,0,NULL),(223,622,2,0,0,0,0,0,0,NULL),(223,647,0,0,0,0,0,0,0,NULL),(223,649,0,0,1,0,0,0,0,NULL),(223,651,0,0,0,0,0,0,0,NULL),(223,653,0,0,0,0,0,0,0,NULL),(223,656,0,0,0,0,0,0,0,NULL),(223,707,0,0,0,0,0,0,0,NULL),(223,708,0,0,0,0,0,0,0,NULL),(223,709,1,0,0,0,0,0,0,NULL),(223,710,1,0,0,0,0,0,0,NULL),(223,737,0,0,0,0,0,0,0,NULL),(223,739,0,0,0,0,0,0,0,NULL),(223,805,0,0,0,0,0,0,0,NULL),(223,817,0,0,0,0,0,0,0,NULL),(223,818,1,0,0,0,0,0,0,NULL),(223,833,1,0,2,0,0,0,0,NULL),(223,875,0,0,0,0,0,0,0,NULL),(223,882,0,0,0,0,0,0,0,NULL),(223,884,0,0,1,0,0,0,0,NULL),(224,489,0,0,0,0,0,0,0,NULL),(224,490,0,0,1,0,0,0,0,NULL),(224,491,0,0,0,0,0,0,0,NULL),(224,494,0,1,0,0,0,0,0,NULL),(224,495,5,0,0,0,0,0,0,NULL),(224,497,0,3,0,0,0,0,0,NULL),(224,635,0,0,0,0,0,0,0,NULL),(224,637,2,0,0,0,0,0,0,NULL),(224,638,0,0,0,0,0,0,0,NULL),(224,639,1,0,0,0,0,0,0,NULL),(224,640,0,0,0,0,0,0,0,NULL),(224,643,0,0,0,0,0,0,0,NULL),(224,644,0,0,0,0,0,0,0,NULL),(224,645,0,0,0,0,0,0,0,NULL),(224,659,0,0,0,0,0,0,0,NULL),(224,660,0,1,0,0,0,0,0,NULL),(224,661,0,0,0,0,0,0,0,NULL),(224,864,0,0,0,0,0,0,0,NULL),(224,867,0,0,0,0,0,0,0,NULL),(224,885,0,0,1,0,0,0,0,NULL),(225,455,0,0,0,0,0,0,0,NULL),(225,456,0,0,0,0,0,0,0,NULL),(225,457,0,0,0,0,0,0,0,NULL),(225,458,0,0,0,0,0,0,0,NULL),(225,459,0,0,0,0,0,0,0,NULL),(225,460,0,0,0,0,0,0,0,NULL),(225,461,0,0,1,0,0,0,0,NULL),(225,462,0,0,1,0,0,1,0,NULL),(225,511,0,0,0,0,0,0,0,NULL),(225,512,0,0,0,0,0,0,0,NULL),(225,513,0,0,1,0,0,0,0,NULL),(225,514,0,0,0,0,0,0,0,NULL),(225,515,1,0,0,0,0,0,0,NULL),(225,517,0,0,0,0,0,0,0,NULL),(225,518,0,0,0,0,0,0,0,NULL),(225,519,1,0,0,0,0,0,0,NULL),(225,669,0,0,0,0,0,0,0,NULL),(225,670,0,0,0,0,0,0,0,NULL),(225,672,0,0,0,0,0,0,0,NULL),(225,719,3,0,1,0,0,0,0,NULL),(225,720,0,0,0,0,0,0,0,NULL),(225,757,0,0,0,0,0,0,0,NULL),(225,778,0,0,1,0,0,0,0,NULL),(225,830,0,0,0,0,0,0,0,NULL),(225,849,0,0,0,0,0,0,0,NULL),(225,873,0,0,0,0,0,0,0,NULL),(226,475,0,0,0,0,0,0,0,NULL),(226,476,0,0,1,0,0,0,0,NULL),(226,478,0,0,0,0,0,0,0,NULL),(226,479,1,0,0,0,0,0,0,NULL),(226,480,0,0,0,0,0,0,0,NULL),(226,481,2,0,0,0,0,0,0,NULL),(226,484,0,0,0,0,0,0,0,NULL),(226,488,0,0,0,0,0,0,0,NULL),(226,533,0,0,0,0,0,0,0,NULL),(226,534,1,0,0,0,0,0,0,NULL),(226,535,0,0,0,0,0,0,0,NULL),(226,536,0,0,0,0,0,0,0,NULL),(226,537,0,0,0,0,0,0,0,NULL),(226,540,0,0,0,0,0,0,0,NULL),(226,541,2,0,0,0,0,0,0,NULL),(226,542,0,0,0,0,0,0,0,NULL),(226,730,0,0,0,0,0,0,0,NULL),(226,731,0,0,0,0,0,0,0,NULL),(226,744,0,0,0,0,0,0,0,NULL),(226,746,0,0,0,0,0,0,0,NULL),(226,767,0,0,0,0,0,0,0,NULL),(226,869,0,0,0,0,0,0,0,NULL),(226,886,0,0,0,0,0,0,0,NULL),(227,500,0,0,0,0,0,0,0,NULL),(227,501,0,0,0,0,0,0,0,NULL),(227,502,0,0,1,0,0,0,0,NULL),(227,505,0,0,0,0,0,0,0,NULL),(227,507,1,0,0,0,0,0,0,NULL),(227,508,3,1,0,0,0,0,0,NULL),(227,510,0,0,0,0,0,0,0,NULL),(227,676,0,0,0,0,0,0,0,NULL),(227,678,0,0,0,0,0,0,0,NULL),(227,679,0,0,0,0,0,0,0,NULL),(227,681,1,0,0,0,0,0,0,NULL),(227,682,3,0,0,0,0,0,0,NULL),(227,685,0,0,0,0,0,0,0,NULL),(227,741,2,0,0,0,0,0,0,NULL),(227,794,0,0,0,0,0,0,0,NULL),(227,795,0,0,0,0,0,0,0,NULL),(227,797,1,0,0,0,0,0,0,NULL),(227,829,0,0,0,0,0,0,0,NULL),(227,879,0,0,0,0,0,0,0,NULL),(228,520,0,0,0,0,0,0,0,NULL),(228,521,0,0,0,0,0,0,0,NULL),(228,522,0,0,0,0,0,0,0,NULL),(228,523,0,0,0,0,0,0,0,NULL),(228,524,0,0,0,0,0,0,0,NULL),(228,525,0,0,0,0,0,0,0,NULL),(228,527,0,0,0,0,0,0,0,NULL),(228,528,0,0,0,0,0,0,0,NULL),(228,531,0,0,1,0,0,0,0,NULL),(228,532,1,0,0,0,0,0,0,NULL),(228,696,0,0,0,0,0,0,0,NULL),(228,697,1,0,0,0,0,0,0,NULL),(228,700,0,0,0,0,0,0,0,NULL),(228,701,0,0,0,0,0,0,0,NULL),(228,770,0,0,0,0,0,0,0,NULL),(228,772,0,0,0,0,0,0,0,NULL),(228,807,0,0,0,0,0,0,0,NULL),(228,810,1,0,0,0,0,0,0,NULL),(228,811,0,0,0,0,0,0,0,NULL),(228,843,0,0,0,0,0,0,0,NULL),(228,844,0,0,0,0,0,0,0,NULL),(228,854,0,0,0,0,0,0,0,NULL),(228,862,0,0,0,0,0,0,0,NULL),(228,878,0,0,1,0,0,0,0,NULL),(229,444,0,0,0,0,0,0,0,NULL),(229,447,0,0,0,0,0,0,0,NULL),(229,448,0,0,0,0,0,0,0,NULL),(229,449,0,0,0,0,0,0,0,NULL),(229,450,1,0,0,0,0,0,0,NULL),(229,451,0,0,0,0,0,0,0,NULL),(229,544,0,0,0,0,0,0,0,NULL),(229,545,0,0,0,0,0,0,0,NULL),(229,546,0,0,0,0,0,0,0,NULL),(229,547,0,0,0,0,0,0,0,NULL),(229,548,0,0,0,0,0,0,0,NULL),(229,549,0,0,0,0,0,0,0,NULL),(229,550,0,0,0,0,0,0,0,NULL),(229,551,0,0,0,0,0,0,0,NULL),(229,552,0,0,0,0,0,0,0,NULL),(229,553,0,0,0,0,0,0,0,NULL),(229,554,0,0,0,0,0,0,0,NULL),(229,555,0,0,0,0,0,0,0,NULL),(229,556,1,0,0,0,0,0,0,NULL),(229,703,0,0,0,0,0,0,0,NULL),(229,704,0,0,0,0,0,0,0,NULL),(229,749,0,0,0,0,0,0,0,NULL),(229,787,0,0,0,0,0,0,0,NULL),(229,837,0,0,0,0,0,0,0,NULL),(229,855,0,0,0,0,0,0,0,NULL),(230,434,0,0,0,0,0,0,0,NULL),(230,435,0,0,0,0,0,0,0,NULL),(230,437,0,0,0,0,0,0,0,NULL),(230,438,1,1,0,0,0,0,0,NULL),(230,439,0,0,0,0,0,0,0,NULL),(230,440,0,0,0,0,0,0,0,NULL),(230,441,2,1,0,0,0,0,0,NULL),(230,442,0,0,0,0,0,0,0,NULL),(230,464,0,0,0,0,0,0,0,NULL),(230,466,0,0,0,0,0,0,0,NULL),(230,468,0,0,0,0,0,0,0,NULL),(230,469,0,0,0,0,0,0,0,NULL),(230,470,0,0,0,0,0,0,0,NULL),(230,471,0,0,0,0,0,0,0,NULL),(230,472,0,0,0,0,0,0,0,NULL),(230,473,0,0,0,0,0,0,0,NULL),(230,474,0,0,0,0,0,0,0,NULL),(230,724,0,1,0,0,0,0,0,NULL),(230,725,0,0,0,0,0,0,0,NULL),(230,761,0,0,0,0,0,0,0,NULL),(230,860,1,0,0,0,0,0,0,NULL),(231,558,0,0,0,0,0,0,0,NULL),(231,560,0,0,0,0,0,0,0,NULL),(231,561,0,0,0,0,0,0,0,NULL),(231,562,0,0,0,0,0,0,0,NULL),(231,563,0,0,0,0,0,0,0,NULL),(231,564,0,0,0,0,0,0,0,NULL),(231,565,0,0,0,0,0,0,0,NULL),(231,577,0,0,0,0,0,0,0,NULL),(231,578,0,0,0,0,0,0,0,NULL),(231,580,0,0,0,0,0,0,0,NULL),(231,581,0,0,0,0,0,0,0,NULL),(231,583,0,0,0,0,0,0,0,NULL),(231,584,0,0,0,0,0,0,0,NULL),(231,586,0,0,0,0,0,0,0,NULL),(231,587,0,0,1,0,0,0,0,NULL),(231,716,0,0,0,0,0,0,1,NULL),(231,718,0,0,0,0,0,0,0,NULL),(231,791,1,0,0,0,0,0,0,NULL),(231,800,0,0,0,0,0,0,0,NULL),(231,832,0,0,0,0,0,0,0,NULL),(231,835,0,0,0,0,0,0,0,NULL),(231,876,1,0,0,0,0,0,0,NULL),(232,445,0,0,0,0,0,0,0,NULL),(232,446,0,0,0,0,0,0,0,NULL),(232,447,0,0,0,0,0,0,0,NULL),(232,448,0,0,1,0,0,0,0,NULL),(232,449,0,0,0,0,0,0,0,NULL),(232,451,1,0,0,0,0,0,0,NULL),(232,611,0,0,0,0,0,0,0,NULL),(232,613,0,0,0,0,0,0,0,NULL),(232,615,1,1,0,0,0,0,0,NULL),(232,616,0,0,1,0,0,0,0,NULL),(232,619,0,0,0,0,0,0,0,NULL),(232,621,0,1,0,0,0,0,0,NULL),(232,622,2,0,0,0,0,0,0,NULL),(232,737,0,0,0,0,0,0,0,NULL),(232,738,0,1,0,0,0,0,0,NULL),(232,739,0,0,0,0,0,0,0,NULL),(232,748,0,0,0,0,0,0,0,NULL),(232,787,0,0,0,0,0,0,0,NULL),(232,802,0,0,0,0,0,0,0,NULL),(232,837,0,0,0,0,0,0,0,NULL),(232,838,2,0,0,0,0,0,0,NULL),(233,543,0,0,0,0,0,0,0,NULL),(233,544,0,0,1,0,0,0,0,NULL),(233,545,0,0,0,0,0,0,0,NULL),(233,546,0,0,0,0,0,0,0,NULL),(233,547,0,0,1,0,0,0,0,NULL),(233,548,0,0,1,0,0,0,0,NULL),(233,550,0,0,0,0,0,0,0,NULL),(233,551,0,0,0,0,0,0,0,NULL),(233,554,0,0,0,0,0,0,0,NULL),(233,555,1,0,0,0,0,0,0,NULL),(233,556,0,0,0,0,0,0,0,NULL),(233,624,0,0,0,0,0,0,0,NULL),(233,625,0,0,0,0,0,0,0,NULL),(233,626,0,0,0,0,0,0,0,NULL),(233,628,0,0,0,0,0,0,0,NULL),(233,629,0,0,0,0,0,0,0,NULL),(233,630,0,0,0,0,0,0,0,NULL),(233,631,0,0,0,0,0,0,0,NULL),(233,633,1,0,0,0,0,0,0,NULL),(233,703,1,0,0,0,0,0,0,NULL),(233,704,0,0,0,0,0,0,0,NULL),(233,765,0,0,1,0,0,0,0,NULL),(233,814,0,0,0,0,0,0,0,NULL),(233,816,1,0,0,0,0,0,0,NULL),(233,850,0,0,0,0,0,0,0,NULL),(233,887,0,0,0,0,0,0,0,NULL),(234,568,0,0,0,0,0,0,0,NULL),(234,569,0,0,0,0,0,0,0,NULL),(234,570,0,0,0,0,0,0,0,NULL),(234,572,0,0,0,0,0,0,0,NULL),(234,573,0,0,0,0,0,0,0,NULL),(234,574,0,1,0,0,0,0,0,NULL),(234,575,1,1,0,0,0,0,0,NULL),(234,694,0,0,0,0,0,0,0,NULL),(234,699,0,0,0,0,0,0,0,NULL),(234,700,0,0,0,0,0,0,0,NULL),(234,712,0,0,0,0,0,0,0,NULL),(234,713,1,0,0,0,0,0,0,NULL),(234,758,0,0,0,0,0,0,0,NULL),(234,770,1,0,0,0,0,0,0,NULL),(234,772,0,0,0,0,0,0,0,NULL),(234,807,0,0,1,0,0,0,0,NULL),(234,810,0,0,0,0,0,0,0,NULL),(234,811,0,0,0,0,0,0,0,NULL),(234,843,1,0,0,0,0,0,0,NULL),(234,844,0,0,0,0,0,0,0,NULL),(234,862,1,0,0,0,0,0,0,NULL),(235,520,0,0,0,0,0,0,0,NULL),(235,521,0,0,0,0,0,0,0,NULL),(235,525,0,0,1,0,0,0,0,NULL),(235,526,0,0,0,0,0,0,0,NULL),(235,528,0,0,0,0,0,0,0,NULL),(235,530,0,0,0,0,0,0,0,NULL),(235,532,0,0,0,0,0,0,0,NULL),(235,676,0,0,0,0,0,0,0,NULL),(235,678,0,0,0,0,0,0,0,NULL),(235,679,0,0,0,0,0,0,0,NULL),(235,680,0,0,0,0,0,1,0,NULL),(235,681,1,0,0,0,0,0,0,NULL),(235,682,3,0,0,0,0,0,0,NULL),(235,685,0,0,0,0,0,0,0,NULL),(235,773,0,0,0,0,0,0,0,NULL),(235,888,0,0,0,0,0,0,0,NULL),(235,889,0,0,0,0,0,0,0,NULL),(236,500,0,0,0,0,0,0,0,NULL),(236,501,0,0,0,0,0,0,0,NULL),(236,502,0,0,0,0,0,0,0,NULL),(236,505,0,0,0,0,0,0,0,NULL),(236,507,0,0,1,0,0,0,0,NULL),(236,508,5,2,0,0,0,0,0,NULL),(236,509,0,1,0,0,0,0,0,NULL),(236,533,0,0,0,0,0,0,0,NULL),(236,534,1,0,0,0,0,0,0,NULL),(236,535,0,0,0,0,0,0,0,NULL),(236,536,0,0,0,0,0,0,0,NULL),(236,537,0,0,0,0,0,0,0,NULL),(236,538,0,0,0,0,0,0,0,NULL),(236,539,0,0,0,0,0,0,0,NULL),(236,540,0,0,0,0,0,0,0,NULL),(236,541,0,0,0,0,0,0,0,NULL),(236,542,1,0,1,0,0,0,0,NULL),(236,741,1,1,0,0,0,0,0,NULL),(236,767,0,0,0,0,0,0,0,NULL),(236,797,2,2,0,0,0,0,0,NULL),(236,828,0,1,0,0,0,0,0,NULL),(236,829,1,1,0,0,0,0,0,NULL),(236,886,0,0,0,0,0,0,0,NULL),(237,477,0,0,0,0,0,0,0,NULL),(237,478,0,0,0,0,0,0,0,NULL),(237,479,2,0,0,0,0,0,0,NULL),(237,481,0,0,0,0,0,0,0,NULL),(237,482,0,0,0,0,0,0,0,NULL),(237,485,0,0,0,0,0,0,0,NULL),(237,486,0,0,0,0,0,0,0,NULL),(237,487,0,0,0,0,0,0,0,NULL),(237,488,0,0,0,0,0,0,0,NULL),(237,511,0,0,0,0,0,0,0,NULL),(237,513,0,0,0,0,0,0,0,NULL),(237,514,0,0,0,0,0,0,0,NULL),(237,515,1,0,0,0,0,0,0,NULL),(237,516,0,0,0,0,0,0,0,NULL),(237,517,0,0,0,0,0,0,0,NULL),(237,519,0,0,0,0,0,0,0,NULL),(237,720,0,0,0,0,0,0,0,NULL),(237,722,0,0,0,0,0,0,0,NULL),(237,723,1,0,0,0,0,0,0,NULL),(237,726,0,0,0,0,0,0,0,NULL),(237,730,0,0,0,0,0,0,0,NULL),(237,734,2,0,0,0,0,0,0,NULL),(237,778,0,0,0,0,0,0,0,NULL),(237,798,0,0,0,0,0,0,0,NULL),(237,873,0,0,0,0,0,0,0,NULL),(238,453,0,0,0,0,0,0,0,NULL),(238,455,0,0,1,0,0,0,0,NULL),(238,456,0,0,0,0,0,0,0,NULL),(238,457,0,0,0,0,0,0,0,NULL),(238,459,0,0,0,0,0,0,0,NULL),(238,460,0,0,0,0,0,0,0,NULL),(238,461,1,0,0,0,0,0,0,NULL),(238,462,1,0,0,0,1,0,0,NULL),(238,490,1,0,0,0,0,0,0,NULL),(238,491,0,0,0,0,0,0,0,NULL),(238,494,1,0,0,0,0,0,0,NULL),(238,495,4,1,0,0,0,0,0,NULL),(238,497,1,2,0,0,0,0,0,NULL),(238,660,0,2,0,0,0,0,0,NULL),(238,669,0,0,0,0,0,0,0,NULL),(238,670,0,0,0,0,0,0,0,NULL),(238,757,0,0,0,0,0,0,0,NULL),(238,788,0,0,0,0,0,0,0,NULL),(238,789,1,1,0,0,0,0,0,NULL),(239,463,0,0,0,0,0,0,0,NULL),(239,464,0,0,0,0,0,0,0,NULL),(239,465,0,0,0,0,0,0,0,NULL),(239,467,0,0,0,0,0,0,0,NULL),(239,468,0,0,0,0,0,0,0,NULL),(239,469,2,0,0,0,0,0,0,NULL),(239,470,0,0,0,0,0,0,0,NULL),(239,471,0,0,0,0,0,0,0,NULL),(239,472,0,0,0,0,0,0,0,NULL),(239,473,0,0,0,0,0,0,0,NULL),(239,474,0,0,0,0,0,0,0,NULL),(239,635,0,0,0,0,0,0,0,NULL),(239,637,1,0,0,0,0,0,0,NULL),(239,638,0,0,0,0,0,0,0,NULL),(239,640,0,0,0,0,0,0,0,NULL),(239,642,0,0,0,0,0,0,0,NULL),(239,643,0,0,1,0,0,0,0,NULL),(239,644,2,0,0,0,0,0,0,NULL),(239,645,0,0,0,0,0,0,0,NULL),(239,646,0,0,0,0,0,0,0,NULL),(239,762,0,0,0,0,0,0,0,NULL),(239,823,0,0,0,0,0,0,0,NULL),(239,860,0,0,0,0,0,0,0,NULL),(239,867,0,0,0,0,0,0,0,NULL),(240,435,0,1,0,0,0,0,0,NULL),(240,436,0,0,0,0,0,1,0,NULL),(240,437,0,0,1,0,0,0,0,NULL),(240,438,0,1,0,0,0,0,0,NULL),(240,439,0,1,0,0,0,0,0,NULL),(240,440,0,0,0,0,0,0,0,NULL),(240,441,2,2,0,0,0,0,0,NULL),(240,442,2,0,0,0,0,0,0,NULL),(240,443,3,2,0,0,0,0,0,NULL),(240,648,0,0,0,0,0,0,0,NULL),(240,649,0,0,0,0,0,0,0,NULL),(240,651,0,0,0,0,0,0,0,NULL),(240,653,0,0,0,0,0,0,0,NULL),(240,707,0,0,0,0,0,0,0,NULL),(240,708,0,0,0,0,0,0,0,NULL),(240,710,0,0,0,0,0,0,0,NULL),(240,724,0,0,0,0,0,0,0,NULL),(240,818,1,0,0,0,0,0,0,NULL),(240,847,0,0,0,0,0,0,0,NULL),(240,875,0,0,0,0,0,0,0,NULL),(240,882,0,0,0,0,0,0,0,NULL),(241,557,0,0,0,0,0,0,0,NULL),(241,559,0,0,0,0,0,0,0,NULL),(241,561,0,0,0,0,0,0,0,NULL),(241,562,0,0,0,0,0,0,0,NULL),(241,563,0,0,0,0,0,0,0,NULL),(241,564,0,0,0,0,0,0,0,NULL),(241,565,1,0,0,0,0,0,0,NULL),(241,566,2,0,1,0,0,0,0,NULL),(241,588,0,0,0,0,0,0,0,NULL),(241,589,0,0,0,0,0,0,0,NULL),(241,590,0,0,0,0,0,0,0,NULL),(241,591,1,0,0,0,0,0,0,NULL),(241,593,0,0,0,0,0,0,0,NULL),(241,594,2,0,0,0,0,0,0,NULL),(241,597,0,0,0,0,0,0,0,NULL),(241,598,0,0,0,0,0,0,0,NULL),(241,599,0,0,0,0,0,0,0,NULL),(241,688,0,0,0,0,0,0,0,NULL),(241,693,0,0,0,0,0,0,0,NULL),(241,777,0,0,0,0,0,0,0,NULL),(241,834,0,0,0,0,0,0,0,NULL),(241,835,0,0,0,0,0,0,0,NULL),(241,890,1,0,0,0,0,0,0,NULL),(242,577,0,0,0,0,0,0,0,NULL),(242,580,0,0,0,0,0,0,0,NULL),(242,581,0,0,0,0,0,0,0,NULL),(242,583,0,0,0,0,0,0,0,NULL),(242,584,0,0,0,0,0,0,0,NULL),(242,585,2,0,0,0,0,0,0,NULL),(242,587,1,0,0,0,0,0,1,NULL),(242,601,0,0,0,0,0,0,0,NULL),(242,602,0,0,0,0,0,0,0,NULL),(242,603,0,0,0,0,0,0,0,NULL),(242,604,0,0,0,0,0,0,0,NULL),(242,605,0,0,0,0,0,0,0,NULL),(242,606,0,0,0,0,0,0,0,NULL),(242,607,0,0,0,0,0,0,0,NULL),(242,608,0,0,0,0,0,0,0,NULL),(242,609,1,0,0,0,1,0,0,NULL),(242,743,0,0,0,0,0,0,0,NULL),(242,769,0,0,0,0,0,0,0,NULL),(242,779,0,0,0,0,0,0,0,NULL),(242,781,1,0,0,0,0,0,0,NULL),(242,800,0,0,0,0,0,0,0,NULL),(242,876,0,0,0,1,0,0,0,NULL);
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
if new.yellow = 2 then 
	set l_yellow = 1;
    set l_red = 1;
else
	set l_yellow = new.yellow;
	set l_red = new.red;
end if;
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  tr_aft_del_players_in_match after delete on players_in_match
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

set l_id = old.id_player;
set l_count_goals = old.count_goals;
set l_count_assist = old.count_assist;
set l_yellow = old.yellow;
set l_red = old.red;
set l_penalty = old.penalty;
set l_penalty_out = old.penalty_out;
set l_own_goal = old.own_goal;

update players_statistics ps
set games = games - 1, 
	goal = goal - l_count_goals, 
	assist = assist - l_count_assist,
	yellow_card = yellow_card - l_yellow, 
    red_card = red_card - l_red, 
    ps.penalty = ps.penalty - l_penalty,
	ps.penalty_out = ps.penalty_out - l_penalty_out, 
    ps.own_goal = ps.own_goal - l_own_goal
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
  `games` int(11) DEFAULT '0',
  `goal` int(11) DEFAULT '0',
  `assist` int(11) DEFAULT '0',
  `yellow_card` int(11) DEFAULT '0',
  `red_card` int(11) DEFAULT '0',
  `penalty` int(11) DEFAULT '0',
  `own_goal` int(11) DEFAULT '0',
  `penalty_out` int(11) DEFAULT '0',
  PRIMARY KEY (`id_season`,`id_player`,`id_team`),
  KEY `fk_players_has_sesons_sesons1_idx` (`id_season`),
  KEY `fk_players_has_sesons_players1_idx` (`id_player`),
  KEY `fk_players_statistics_teams1_idx` (`id_team`),
  CONSTRAINT `fk_players_has_sesons_players1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_players_has_sesons_sesons1` FOREIGN KEY (`id_season`) REFERENCES `sesons` (`id_season`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_players_statistics_teams1` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_statistics`
--

LOCK TABLES `players_statistics` WRITE;
/*!40000 ALTER TABLE `players_statistics` DISABLE KEYS */;
INSERT INTO `players_statistics` VALUES (4,1,19,10,0,0,1,0,0,1,0),(4,2,19,10,0,0,1,0,0,0,0),(4,3,19,7,0,0,1,0,0,0,0),(4,4,19,8,1,0,3,0,0,0,0),(4,5,19,8,4,0,3,0,0,0,0),(4,6,19,4,0,0,0,0,0,0,0),(4,7,19,10,14,0,2,0,0,0,0),(4,8,19,8,4,0,0,0,0,0,0),(4,9,19,10,9,0,1,0,1,0,0),(4,10,19,10,4,0,0,0,0,0,0),(4,11,19,6,1,0,0,0,0,0,0),(4,12,26,10,0,0,0,0,0,0,0),(4,13,26,10,1,0,2,0,0,0,0),(4,14,26,1,0,0,0,0,0,0,0),(4,15,26,10,2,0,3,0,0,0,0),(4,16,26,6,0,0,0,0,0,0,0),(4,17,26,8,0,0,1,0,0,0,0),(4,18,26,6,0,0,1,0,0,0,0),(4,19,26,8,5,0,1,0,0,0,0),(4,20,26,3,1,0,0,0,0,0,0),(4,21,26,6,0,0,1,0,0,1,0),(4,22,25,3,0,0,0,0,0,0,0),(4,23,25,8,1,0,0,0,0,0,0),(4,24,25,9,0,2,1,0,0,1,0),(4,25,25,3,0,0,0,0,0,0,0),(4,26,25,1,0,0,0,0,0,0,0),(4,27,25,6,1,1,1,0,0,0,0),(4,28,25,6,0,0,1,0,0,0,0),(4,29,25,8,1,0,0,0,0,0,0),(4,30,25,10,4,7,1,0,0,0,0),(4,31,25,6,2,2,1,0,0,0,0),(4,32,25,7,7,2,0,0,0,0,0),(4,33,25,7,4,2,0,0,0,0,0),(4,34,25,8,4,2,1,0,0,0,0),(4,35,25,2,0,0,0,0,0,0,0),(4,36,25,9,11,8,2,0,0,0,0),(4,37,21,2,0,0,0,0,0,0,0),(4,38,21,11,2,0,1,0,0,0,0),(4,39,21,5,1,0,1,1,1,0,0),(4,40,21,9,0,0,0,0,0,0,0),(4,41,21,6,0,0,1,0,0,0,0),(4,42,21,9,3,0,1,0,0,0,1),(4,43,21,9,5,0,0,0,0,0,0),(4,44,21,2,0,0,1,0,0,0,0),(4,45,21,11,7,0,1,0,0,0,0),(4,46,16,10,0,0,0,0,0,0,0),(4,47,16,9,2,0,0,0,0,0,0),(4,48,16,10,4,0,2,0,0,0,0),(4,49,16,9,0,0,1,0,0,0,0),(4,50,16,7,0,0,0,0,0,1,0),(4,51,16,8,5,0,0,0,0,0,0),(4,52,16,9,3,0,0,0,0,0,0),(4,53,16,10,6,0,1,0,0,0,0),(4,54,16,10,18,0,0,0,0,0,0),(4,55,30,1,0,0,0,0,0,0,0),(4,56,30,2,0,0,0,0,0,0,0),(4,57,30,6,0,0,1,0,0,0,0),(4,58,30,6,1,0,1,0,0,0,0),(4,59,30,10,3,0,1,0,0,0,0),(4,60,30,5,0,0,0,0,0,0,0),(4,61,30,3,1,0,0,0,0,0,0),(4,62,30,8,2,0,0,0,0,0,0),(4,63,30,8,4,0,1,0,0,0,0),(4,64,30,9,0,0,1,0,0,0,0),(4,65,30,5,0,0,0,0,0,0,0),(4,66,30,9,1,0,0,0,0,0,0),(4,67,30,7,3,0,0,0,0,0,0),(4,68,32,5,0,0,0,0,0,0,0),(4,69,32,5,1,0,0,0,0,0,0),(4,70,32,2,0,0,0,0,0,0,0),(4,71,32,8,0,0,4,0,0,0,0),(4,72,32,3,0,0,0,0,0,0,0),(4,73,32,2,0,0,1,0,0,0,0),(4,74,32,6,0,0,0,0,0,0,0),(4,75,32,10,5,0,2,0,0,0,0),(4,76,32,10,6,0,0,0,0,0,0),(4,77,32,10,5,2,0,0,0,1,0),(4,78,32,1,0,0,0,0,0,0,0),(4,79,32,1,0,0,0,0,0,0,0),(4,80,32,2,1,0,0,0,0,0,0),(4,81,15,2,0,0,0,0,0,0,0),(4,82,15,11,3,0,0,0,0,0,0),(4,83,15,9,2,0,0,0,0,0,0),(4,84,15,7,4,0,0,0,0,0,0),(4,85,15,6,4,0,0,0,0,1,0),(4,86,15,7,8,0,0,0,0,0,0),(4,87,15,2,0,0,0,0,0,0,0),(4,88,15,11,12,0,2,0,0,0,0),(4,89,15,2,0,0,1,0,0,0,0),(4,90,15,8,13,0,0,0,1,0,0),(4,91,24,3,0,0,0,0,0,0,0),(4,92,24,11,5,1,0,0,0,0,0),(4,93,24,6,1,0,0,0,0,0,0),(4,94,24,8,1,1,0,0,0,0,0),(4,95,24,6,0,0,0,0,0,0,0),(4,96,24,8,5,0,0,0,0,0,0),(4,97,24,8,2,0,0,0,1,0,0),(4,98,24,5,1,0,0,0,0,0,0),(4,99,24,9,0,1,0,0,0,0,0),(4,100,24,10,0,2,0,0,0,0,0),(4,101,24,3,1,1,0,0,0,0,0),(4,102,24,5,0,0,0,0,0,0,0),(4,103,24,7,1,0,0,0,0,0,0),(4,104,24,11,4,0,1,0,0,0,0),(4,105,20,1,0,0,0,0,0,0,0),(4,106,20,8,0,0,0,0,0,0,0),(4,107,20,7,1,0,0,1,0,0,0),(4,108,20,1,0,0,0,0,0,0,0),(4,109,20,4,0,0,1,0,0,0,0),(4,110,20,8,2,0,0,0,0,0,0),(4,111,20,9,6,0,0,0,0,0,0),(4,112,20,9,6,0,3,0,2,0,0),(4,113,20,1,0,0,0,0,0,0,0),(4,114,18,3,1,0,0,0,0,0,0),(4,115,18,7,0,0,0,1,0,0,0),(4,116,18,10,0,0,1,0,0,0,0),(4,117,18,7,3,0,0,0,0,0,0),(4,118,18,1,0,0,0,0,0,0,0),(4,119,18,1,0,0,0,0,0,0,0),(4,120,18,9,1,0,1,0,0,0,0),(4,121,18,9,1,0,1,0,0,0,0),(4,122,18,5,1,0,1,0,0,0,0),(4,123,18,7,6,0,0,0,1,0,0),(4,124,18,3,1,0,1,0,0,0,0),(4,125,18,8,2,0,0,0,0,0,0),(4,126,18,5,3,0,0,0,0,0,0),(4,127,18,6,1,0,0,0,0,1,0),(4,128,29,2,0,0,0,0,0,0,0),(4,129,29,9,1,0,0,0,0,1,0),(4,130,29,7,0,0,3,0,0,0,0),(4,131,29,11,0,0,0,0,0,0,0),(4,132,29,6,0,0,0,0,0,0,0),(4,133,29,7,1,0,0,0,0,0,0),(4,134,29,1,0,0,0,0,0,0,0),(4,135,29,7,3,0,0,0,0,0,0),(4,136,29,10,5,0,1,0,2,0,1),(4,137,29,5,0,0,0,0,0,0,0),(4,138,29,3,0,0,0,0,0,0,0),(4,139,29,9,1,0,0,0,0,0,0),(4,140,29,10,10,0,1,0,0,0,0),(4,141,29,4,0,0,0,0,0,0,0),(4,142,34,2,0,0,0,0,0,0,0),(4,143,34,10,0,0,0,0,0,0,0),(4,144,34,4,0,1,1,0,0,0,0),(4,145,34,9,0,0,0,0,0,0,0),(4,146,34,1,0,0,0,0,0,0,0),(4,147,34,8,5,2,1,0,0,0,0),(4,148,34,7,0,1,0,0,0,0,1),(4,149,34,4,0,0,0,0,0,0,0),(4,150,34,7,2,1,0,0,0,0,0),(4,151,34,8,2,0,0,0,0,0,0),(4,152,34,9,2,0,0,0,0,0,0),(4,153,23,1,0,0,0,0,0,0,0),(4,154,23,5,0,0,1,0,0,0,0),(4,155,23,7,1,0,0,0,0,0,0),(4,156,23,10,3,7,1,0,1,0,0),(4,157,23,7,3,0,0,0,0,0,0),(4,158,23,5,1,2,0,0,0,0,0),(4,159,23,9,3,3,0,0,0,0,0),(4,160,23,7,0,1,0,0,0,0,0),(4,161,23,10,9,0,0,0,0,0,0),(4,162,23,6,1,0,0,0,0,0,0),(4,163,33,8,0,0,0,0,0,0,0),(4,164,33,9,2,0,1,0,0,0,0),(4,165,33,7,2,0,1,0,0,0,0),(4,166,33,9,0,0,1,0,0,0,0),(4,167,33,9,9,0,0,0,1,0,0),(4,168,33,5,2,0,0,0,0,0,0),(4,169,33,9,2,0,0,0,0,0,0),(4,170,33,5,2,0,0,0,0,0,0),(4,171,33,3,1,0,0,0,0,0,0),(4,172,28,2,0,0,0,0,0,0,0),(4,173,28,5,4,0,0,0,0,0,0),(4,174,28,8,3,0,0,0,0,0,0),(4,175,28,5,0,0,0,0,0,0,0),(4,176,28,7,1,0,1,0,0,0,0),(4,177,28,1,0,0,0,0,0,0,0),(4,178,28,8,2,0,2,1,0,0,0),(4,179,28,6,2,0,0,0,0,0,0),(4,180,28,9,0,0,0,0,0,0,0),(4,181,28,9,1,0,1,0,3,0,0),(4,182,17,9,1,0,0,0,0,0,0),(4,183,17,9,2,0,0,1,1,0,0),(4,184,17,4,2,0,1,0,0,0,0),(4,185,17,7,2,0,0,0,0,0,0),(4,186,17,4,1,0,0,0,0,0,0),(4,187,17,6,0,0,1,0,0,0,0),(4,188,17,2,2,0,1,0,0,0,0),(4,189,17,6,2,0,0,0,0,0,0),(4,190,17,7,5,0,1,0,0,0,0),(4,191,17,3,1,0,1,0,0,0,0),(4,192,17,1,1,0,0,0,0,0,0),(4,193,17,7,1,0,0,0,0,0,0),(4,194,17,10,6,0,0,0,0,0,0),(4,195,17,3,3,0,0,0,0,0,0),(4,196,17,10,19,0,0,0,0,0,0),(4,197,22,10,0,0,0,0,0,0,0),(4,198,22,4,0,0,0,0,0,0,0),(4,199,22,9,0,0,2,0,0,0,0),(4,200,22,1,0,0,0,0,0,0,0),(4,201,22,10,8,0,1,0,4,0,0),(4,202,22,4,1,0,0,0,0,0,0),(4,203,22,5,1,0,0,0,0,0,0),(4,204,22,4,0,0,2,0,0,0,0),(4,205,22,6,0,0,0,0,0,0,0),(4,206,22,5,2,0,0,0,0,0,0),(4,207,22,2,0,0,0,0,0,0,0),(4,208,22,8,2,0,1,0,0,1,0),(4,209,22,10,8,0,0,0,0,0,0),(4,210,22,8,10,0,1,0,0,0,0),(4,211,22,8,6,0,1,0,0,0,0),(4,212,22,8,4,0,0,0,0,0,0),(4,213,22,8,5,0,1,0,0,0,0),(4,214,26,4,0,0,0,0,0,0,0),(4,215,26,4,0,0,1,0,0,0,0),(4,216,26,9,4,0,2,0,0,0,0),(4,217,26,8,3,0,0,0,0,0,0),(4,218,31,4,0,0,0,0,0,0,0),(4,219,31,7,0,0,0,0,0,0,0),(4,220,31,5,1,0,1,0,0,0,0),(4,221,31,2,0,0,0,0,0,0,0),(4,222,31,5,0,0,0,0,0,0,0),(4,223,31,9,3,0,1,0,0,0,0),(4,224,31,10,3,0,2,0,0,1,0),(4,225,31,3,0,0,1,0,0,0,0),(4,226,31,9,6,6,0,0,0,0,0),(4,227,31,7,1,0,0,0,0,0,0),(4,228,31,1,0,0,0,0,0,0,0),(4,229,31,3,2,0,0,0,0,0,0),(4,230,31,2,0,0,0,0,0,0,0),(4,231,28,2,0,0,0,0,0,0,0),(4,232,28,7,1,0,1,0,0,0,0),(4,233,28,5,0,0,1,0,0,0,0),(4,234,28,2,0,0,2,0,0,0,0),(4,235,28,4,1,0,1,0,0,0,0),(4,236,28,4,0,0,0,0,0,0,0),(4,237,28,7,4,0,1,0,0,0,0),(4,238,27,5,0,0,0,0,0,0,0),(4,239,27,8,0,0,3,0,0,0,0),(4,240,27,4,0,0,0,0,0,0,0),(4,241,27,7,0,0,0,0,0,0,0),(4,242,27,7,2,0,0,0,0,0,0),(4,243,27,7,0,0,1,0,0,0,0),(4,244,27,8,3,0,0,0,0,0,0),(4,245,27,1,1,0,1,0,0,0,0),(4,246,27,6,2,0,0,0,0,0,0),(4,247,27,8,4,0,0,0,1,0,0),(4,248,27,4,0,0,0,0,0,0,0),(4,249,27,5,0,0,0,0,0,0,0),(4,250,27,5,5,0,3,0,0,0,0),(4,251,23,5,0,0,1,1,0,0,0),(4,252,23,1,0,0,0,0,0,0,0),(4,253,23,3,1,3,0,0,0,0,0),(4,254,23,7,3,1,0,0,0,0,0),(4,255,33,8,1,0,2,1,0,0,0),(4,256,33,3,0,0,0,0,0,0,0),(4,257,33,5,1,0,0,0,0,0,0),(4,258,33,2,1,0,0,0,0,0,0),(4,259,33,9,3,0,0,0,0,0,0),(4,260,29,4,2,0,0,0,0,0,0),(4,261,34,3,0,0,0,0,0,0,0),(4,262,34,4,0,0,0,0,0,0,0),(4,263,34,9,1,0,0,0,0,0,0),(4,264,34,6,0,2,0,0,0,0,0),(4,265,34,2,0,0,0,0,0,0,0),(4,266,34,2,0,0,2,0,0,0,0),(4,267,20,5,0,0,0,0,0,0,0),(4,268,20,7,0,0,1,0,0,0,0),(4,269,20,8,3,0,1,0,0,0,0),(4,270,20,6,1,0,2,0,0,0,0),(4,271,18,7,1,0,0,0,0,0,0),(4,272,18,4,3,0,0,0,0,0,0),(4,273,18,2,0,0,0,0,0,0,0),(4,274,18,5,2,0,1,0,0,0,0),(4,275,15,1,0,0,0,0,0,0,0),(4,276,15,4,1,0,0,0,0,0,0),(4,277,15,8,2,0,0,0,0,0,0),(4,278,15,6,0,0,0,0,0,0,0),(4,279,24,5,0,0,0,0,0,0,0),(4,280,24,5,0,0,0,0,0,0,0),(4,281,24,3,0,0,1,0,0,0,0),(4,282,24,7,2,0,0,0,0,0,0),(4,283,24,9,10,0,0,0,0,0,0),(4,284,24,7,1,0,0,0,0,0,0),(4,285,30,6,0,0,0,0,0,0,0),(4,286,30,6,0,0,0,0,0,0,0),(4,287,30,4,2,0,1,0,0,0,0),(4,288,30,3,0,0,0,0,0,0,0),(4,289,30,7,3,0,0,0,0,0,0),(4,290,32,9,0,0,0,0,0,0,0),(4,291,32,8,1,0,0,0,0,0,0),(4,292,32,4,0,0,0,0,0,0,0),(4,293,32,5,2,0,0,0,0,0,0),(4,294,21,8,0,0,0,0,0,0,0),(4,295,21,2,0,0,0,0,0,0,0),(4,296,21,8,4,0,2,1,0,0,0),(4,297,21,7,3,0,0,0,2,0,0),(4,298,21,5,0,0,0,0,0,0,0),(4,299,21,10,2,0,0,0,0,0,0),(4,300,21,2,0,0,0,0,0,0,0),(4,301,16,1,0,0,0,0,0,0,0),(4,302,16,9,2,0,0,0,0,1,0),(4,303,16,6,1,0,0,0,0,0,0),(4,304,19,9,1,0,0,0,0,0,0),(4,305,19,3,0,0,0,0,0,0,0),(4,306,19,7,0,0,3,0,0,0,0),(4,307,25,7,0,0,0,0,0,0,0),(4,308,25,1,0,0,0,0,0,0,0),(4,309,25,2,0,0,0,0,0,0,0),(4,310,25,3,0,1,0,0,0,0,0),(4,311,25,6,1,1,2,0,0,0,0),(4,312,16,7,0,0,1,0,0,0,0),(4,313,16,1,0,0,0,0,0,0,0),(4,314,16,5,1,0,0,0,0,0,0),(4,315,32,7,0,0,0,0,0,0,0),(4,316,21,6,0,0,1,0,0,0,0),(4,317,21,8,1,0,0,0,0,0,0),(4,318,30,5,0,0,0,0,0,0,0),(4,319,30,5,0,0,0,0,0,0,0),(4,320,18,7,4,0,0,0,0,0,0),(4,321,18,8,2,0,1,0,0,0,0),(4,322,15,4,0,0,0,0,0,0,0),(4,323,15,4,3,0,0,0,0,0,0),(4,324,15,6,2,0,3,0,0,0,0),(4,325,33,1,0,0,0,0,0,0,0),(4,326,29,9,0,0,0,0,0,0,0),(4,327,17,2,0,0,0,0,0,0,0),(4,328,28,6,0,0,1,1,0,0,0),(4,329,28,7,0,0,1,0,0,0,0),(4,330,22,5,1,0,0,0,0,0,0),(4,331,31,4,0,0,0,0,0,0,0),(4,332,31,9,1,0,4,0,0,0,0),(4,333,31,9,2,0,3,0,1,0,0),(4,334,31,9,3,2,0,0,0,0,0),(4,335,31,1,0,0,0,0,0,0,0),(4,336,31,7,4,0,0,0,0,0,0),(4,337,31,4,0,0,0,0,0,0,0),(4,338,26,1,0,0,0,0,0,0,0),(4,339,26,6,6,0,0,0,0,0,0),(4,340,23,2,0,0,0,0,0,0,0),(4,341,23,3,0,0,0,0,0,0,0),(4,342,23,5,0,0,0,0,0,0,0),(4,343,23,2,0,0,0,0,0,0,0),(4,344,17,1,1,0,0,0,0,0,0),(4,345,29,5,0,0,0,0,0,0,0),(4,346,29,4,0,0,0,0,0,0,0),(4,347,27,3,0,0,0,0,0,0,0),(4,348,20,8,8,0,0,0,0,0,1),(4,349,20,2,0,0,0,0,0,0,0),(4,350,20,8,1,0,1,0,0,0,0),(4,351,20,2,0,0,0,0,0,0,0),(4,352,33,1,0,0,0,0,0,0,0),(4,353,33,1,0,0,0,0,0,0,0),(4,354,33,1,0,0,0,0,0,0,0),(4,355,33,1,0,0,0,0,0,0,0),(4,356,33,1,0,0,0,0,0,0,0),(4,357,15,6,8,0,0,0,0,0,0),(4,358,34,7,0,0,0,0,0,0,0),(4,359,30,4,2,0,1,0,0,0,0),(4,360,18,3,0,0,0,0,0,0,0),(4,361,18,7,1,0,2,0,0,0,0),(4,362,18,7,1,0,0,0,0,0,0),(4,363,18,6,0,0,1,0,0,0,0),(4,364,21,1,1,0,0,0,0,0,0),(4,365,24,7,0,0,0,0,0,1,0),(4,366,32,6,0,0,0,0,0,0,0),(4,367,25,1,0,0,0,0,0,0,0),(4,368,32,1,1,0,0,0,0,0,0),(4,369,32,5,5,0,1,0,0,0,0),(4,370,25,5,0,0,1,0,0,0,0),(4,371,24,5,0,0,1,0,0,0,0),(4,372,18,2,0,0,0,0,0,0,0),(4,373,34,2,0,0,1,0,0,0,0),(4,374,34,6,0,0,1,0,0,0,0),(4,375,30,1,0,0,0,0,0,0,0),(4,376,27,4,1,0,0,0,0,0,0),(4,377,27,1,1,0,1,0,0,0,0),(4,378,20,4,2,0,0,0,0,0,0),(4,379,17,4,0,0,1,0,0,0,0),(4,380,23,3,0,0,0,0,0,0,0),(4,381,23,6,0,0,0,0,0,0,0),(4,382,23,1,0,0,0,0,0,0,0),(4,383,23,3,2,2,0,0,0,0,0),(4,384,22,2,0,0,0,0,0,0,0),(4,385,22,4,3,0,1,0,0,0,0),(4,386,33,3,0,0,0,0,0,0,0),(4,387,33,4,0,0,0,0,0,0,0),(4,388,16,1,0,0,0,0,0,0,0),(4,389,18,1,0,0,0,0,0,0,0),(4,390,25,2,1,1,0,0,0,0,0),(4,391,34,1,2,0,0,0,0,0,0),(4,392,33,3,0,0,0,0,0,0,0),(4,393,17,3,0,0,0,0,0,0,0),(4,394,17,4,9,0,0,0,0,0,0),(4,395,31,2,0,0,0,0,0,0,0),(4,396,29,2,1,0,1,0,0,0,0),(4,397,29,3,2,0,0,0,0,0,0),(4,398,29,4,2,0,0,0,0,1,0),(4,399,31,2,0,0,0,0,0,0,0),(4,400,22,1,0,0,1,0,0,0,0),(4,401,22,1,0,0,0,0,0,0,0),(4,402,27,2,0,0,0,0,0,0,0),(4,403,19,3,0,0,0,0,0,0,0),(4,404,33,2,2,0,0,0,0,0,0),(4,405,32,4,0,0,0,0,0,0,0),(4,406,34,1,0,0,0,0,0,0,0),(4,407,34,2,1,0,0,0,0,0,0),(4,408,34,1,0,0,0,0,0,0,0),(4,409,25,1,0,0,0,0,0,0,0),(4,410,25,2,0,0,0,0,0,0,0),(4,411,17,1,1,0,0,0,0,0,0),(4,412,31,2,0,0,0,0,0,0,0),(4,413,31,1,0,0,0,0,0,0,0),(4,414,31,1,0,0,0,0,0,0,0),(4,415,31,2,0,2,0,0,0,0,0),(4,416,15,1,0,0,0,0,0,0,0),(4,417,26,2,1,0,1,0,0,0,0),(4,418,20,1,0,0,0,0,0,0,0),(4,419,20,1,0,0,0,0,0,0,0),(4,420,23,1,0,0,0,0,0,0,0),(4,421,31,2,1,1,0,0,0,0,0),(4,422,22,2,0,0,0,0,0,0,0),(4,423,25,2,1,0,0,0,0,0,0),(4,424,25,2,4,3,0,0,0,0,0),(4,425,27,1,0,0,0,0,0,0,0),(4,426,16,1,0,0,0,0,0,0,0),(4,427,32,1,0,0,0,0,0,0,0),(4,428,18,1,0,0,0,0,0,0,0),(4,429,24,1,0,0,0,0,0,0,0),(4,430,19,1,0,0,0,0,0,0,0),(4,431,31,1,0,0,0,0,0,0,0),(4,432,23,1,0,0,0,0,0,0,0),(4,433,23,1,0,0,0,0,0,0,0),(4,434,38,10,0,0,1,0,0,0,0),(4,435,38,10,0,1,2,0,0,0,0),(4,436,38,9,0,0,0,0,0,0,1),(4,437,38,10,0,0,2,0,0,0,0),(4,438,38,9,4,2,1,1,0,0,0),(4,439,38,9,1,1,0,0,0,0,0),(4,440,38,3,0,0,1,0,0,0,0),(4,441,38,10,9,10,0,0,0,0,0),(4,442,38,11,7,0,2,0,0,0,0),(4,443,38,10,11,5,5,0,0,0,0),(4,444,48,8,0,0,0,0,0,0,0),(4,445,48,5,0,0,0,0,0,0,0),(4,446,48,9,0,0,3,0,0,0,0),(4,447,48,11,5,0,0,0,0,0,0),(4,448,48,10,1,0,2,0,0,0,0),(4,449,48,6,1,0,0,0,0,0,0),(4,450,48,5,5,0,0,0,0,0,0),(4,451,48,11,8,0,1,0,0,0,0),(4,452,45,3,0,0,0,0,0,0,0),(4,453,45,6,1,1,1,0,0,1,0),(4,454,45,8,6,1,0,0,1,0,0),(4,455,45,11,4,4,3,0,0,0,0),(4,456,45,10,1,2,0,0,0,0,0),(4,457,45,10,2,2,1,0,0,0,0),(4,458,45,10,0,1,1,0,0,0,0),(4,459,45,9,1,4,0,0,0,0,0),(4,460,45,9,2,1,1,0,0,0,0),(4,461,45,9,2,1,1,0,0,0,0),(4,462,45,11,6,8,1,0,1,0,1),(4,463,36,7,0,0,0,0,0,0,0),(4,464,36,10,1,0,0,0,0,0,0),(4,465,36,10,5,0,0,0,0,0,0),(4,466,36,6,2,0,0,0,0,0,0),(4,467,36,9,0,0,1,0,0,0,0),(4,468,36,10,0,0,0,0,0,0,0),(4,469,36,11,6,0,1,0,0,0,0),(4,470,36,9,4,0,0,0,0,0,0),(4,471,36,11,1,0,0,0,1,0,0),(4,472,36,3,0,0,0,0,0,0,0),(4,473,36,10,3,0,0,0,1,0,0),(4,474,36,11,5,0,0,0,0,0,0),(4,475,43,5,0,0,0,0,0,0,0),(4,476,43,4,2,0,1,0,0,0,0),(4,477,43,3,0,0,0,0,0,0,0),(4,478,43,8,0,0,1,0,0,0,0),(4,479,43,8,9,0,2,0,0,0,0),(4,480,43,8,2,0,0,0,0,0,0),(4,481,43,10,10,0,0,0,0,0,0),(4,482,43,7,0,0,1,0,0,0,0),(4,483,43,1,2,0,0,0,0,0,0),(4,484,43,2,0,0,0,0,0,0,0),(4,485,43,4,0,0,0,0,0,0,0),(4,486,43,6,1,0,2,0,0,0,0),(4,487,43,6,2,0,0,0,0,0,0),(4,488,43,7,3,0,0,0,0,0,0),(4,489,35,4,0,0,0,0,0,0,0),(4,490,35,10,3,2,1,1,0,0,0),(4,491,35,6,1,0,1,0,0,0,0),(4,492,35,8,1,0,1,0,0,0,0),(4,493,35,1,0,0,1,1,0,0,0),(4,494,35,9,10,4,0,0,0,0,0),(4,495,35,11,30,15,0,0,1,0,0),(4,496,35,1,1,0,0,0,0,0,0),(4,497,35,11,16,31,0,0,0,0,0),(4,498,35,5,4,0,0,0,0,0,0),(4,499,35,4,1,0,0,0,0,0,0),(4,500,41,8,0,1,0,0,0,0,0),(4,501,41,9,1,0,0,0,0,0,0),(4,502,41,9,0,0,1,0,0,0,0),(4,503,41,4,0,0,0,0,0,0,0),(4,504,41,5,1,0,0,0,0,0,0),(4,505,41,3,0,0,0,0,0,0,0),(4,506,41,1,0,0,0,0,0,0,0),(4,507,41,9,3,1,1,0,0,0,0),(4,508,41,10,22,7,0,0,1,0,0),(4,509,41,9,3,2,0,0,0,0,0),(4,510,41,6,1,3,0,0,0,0,0),(4,511,46,9,0,0,0,0,0,0,0),(4,512,46,7,0,0,0,0,0,0,0),(4,513,46,11,1,0,1,0,0,0,0),(4,514,46,10,1,0,0,0,0,0,0),(4,515,46,7,5,0,0,0,0,0,1),(4,516,46,2,1,0,0,0,0,0,0),(4,517,46,4,0,0,0,0,0,0,0),(4,518,46,7,0,0,0,0,0,0,0),(4,519,46,10,1,0,0,0,0,0,0),(4,520,52,3,0,0,0,0,0,0,0),(4,521,52,4,1,0,1,0,0,0,0),(4,522,52,3,0,0,1,0,0,0,0),(4,523,52,2,0,0,0,0,0,0,0),(4,524,52,2,0,0,0,0,0,0,0),(4,525,52,4,0,0,1,0,0,0,0),(4,526,52,2,0,0,0,0,0,0,0),(4,527,52,3,0,0,0,0,0,0,0),(4,528,52,4,0,0,1,0,0,0,0),(4,529,52,2,1,0,0,0,0,0,0),(4,530,52,3,1,0,0,0,0,0,0),(4,531,52,2,0,0,1,0,0,0,0),(4,532,52,4,2,0,1,0,0,0,0),(4,533,55,9,0,0,0,0,0,0,0),(4,534,55,9,3,0,0,0,0,0,0),(4,535,55,11,1,0,0,0,0,0,0),(4,536,55,11,0,0,1,0,0,0,0),(4,537,55,11,4,0,0,0,0,0,0),(4,538,55,8,2,0,0,0,0,0,0),(4,539,55,7,1,0,0,0,0,0,0),(4,540,55,10,0,0,2,0,0,0,0),(4,541,55,9,12,0,0,0,0,0,1),(4,542,55,5,2,0,1,0,0,0,0),(4,543,49,6,0,0,0,0,0,0,0),(4,544,49,11,3,0,2,0,1,0,0),(4,545,49,10,0,0,0,0,0,0,0),(4,546,49,8,0,0,1,0,0,0,0),(4,547,49,8,0,0,2,0,0,0,0),(4,548,49,10,1,2,1,0,0,0,0),(4,549,49,5,0,0,0,0,0,0,0),(4,550,49,7,1,0,0,0,0,0,0),(4,551,49,8,1,0,0,0,0,0,0),(4,552,49,4,0,0,0,0,0,0,0),(4,553,49,9,3,0,1,0,0,0,0),(4,554,49,10,5,1,0,0,0,0,0),(4,555,49,9,4,1,1,0,0,0,0),(4,556,49,8,1,0,0,0,0,0,0),(4,557,47,7,0,0,0,0,0,0,0),(4,558,47,6,1,0,0,0,0,0,0),(4,559,47,8,2,0,0,0,0,0,0),(4,560,47,5,0,0,0,0,0,0,0),(4,561,47,6,0,0,0,0,0,0,0),(4,562,47,9,0,0,1,0,0,0,0),(4,563,47,10,0,0,1,0,0,0,0),(4,564,47,10,4,0,1,0,0,0,1),(4,565,47,10,1,0,1,0,0,0,0),(4,566,47,6,8,0,1,0,0,0,0),(4,567,37,4,0,0,0,0,0,0,0),(4,568,37,10,2,1,1,0,0,0,0),(4,569,37,11,1,3,0,0,0,0,0),(4,570,37,8,0,4,1,0,0,0,0),(4,571,37,8,1,0,0,0,0,0,0),(4,572,37,8,0,1,0,0,0,0,0),(4,573,37,11,5,6,0,0,0,0,0),(4,574,37,6,0,1,0,0,0,0,0),(4,575,37,10,13,5,2,0,1,0,0),(4,576,44,8,0,0,0,0,0,0,0),(4,577,44,9,0,0,0,0,0,0,0),(4,578,44,6,1,0,0,0,0,0,0),(4,579,44,5,0,0,1,0,0,0,0),(4,580,44,10,1,0,0,0,0,0,0),(4,581,44,8,1,0,0,0,0,0,0),(4,582,44,6,2,0,0,0,0,0,0),(4,583,44,10,1,0,0,0,0,0,0),(4,584,44,5,0,0,1,0,0,0,0),(4,585,44,2,2,0,0,0,0,0,0),(4,586,44,7,5,0,0,0,0,0,0),(4,587,44,9,3,0,2,0,0,1,0),(4,588,39,2,0,0,0,0,0,0,0),(4,589,39,8,2,5,1,0,0,0,0),(4,590,39,9,3,0,0,0,0,0,0),(4,591,39,5,10,2,0,0,0,0,0),(4,592,39,10,0,0,2,1,0,0,0),(4,593,39,2,0,1,0,0,0,0,0),(4,594,39,9,2,0,1,0,0,0,0),(4,595,39,4,1,0,0,0,0,0,0),(4,596,39,1,1,0,0,0,0,0,0),(4,597,39,7,0,0,0,0,0,0,0),(4,598,39,11,6,0,1,0,0,0,0),(4,599,39,6,1,1,0,0,0,0,0),(4,600,50,3,0,0,0,0,0,0,0),(4,601,50,11,0,0,2,0,0,0,0),(4,602,50,11,0,0,3,0,0,0,0),(4,603,50,8,1,1,1,0,0,0,0),(4,604,50,11,2,5,2,0,0,0,0),(4,605,50,11,0,1,1,0,0,0,0),(4,606,50,10,4,2,0,0,0,0,0),(4,607,50,3,0,0,0,0,0,0,0),(4,608,50,10,1,0,1,0,0,0,0),(4,609,50,11,13,7,2,0,1,0,0),(4,610,54,8,0,0,0,0,0,0,0),(4,611,54,7,1,1,1,0,0,0,0),(4,612,54,6,0,0,1,0,0,0,0),(4,613,54,7,4,1,0,0,0,0,0),(4,614,54,7,1,0,1,0,0,0,0),(4,615,54,8,1,1,0,0,0,0,0),(4,616,54,5,0,0,2,0,0,0,0),(4,617,54,5,0,2,0,0,0,0,0),(4,618,54,2,1,0,0,0,1,0,0),(4,619,54,4,1,0,0,0,0,0,0),(4,620,54,1,0,0,0,0,0,0,0),(4,621,54,9,5,3,1,0,0,0,0),(4,622,54,4,4,2,0,0,0,0,0),(4,623,54,4,2,3,0,0,0,0,0),(4,624,53,10,0,0,0,0,0,0,0),(4,625,53,10,0,0,0,0,0,0,0),(4,626,53,6,0,0,0,0,0,0,0),(4,627,53,7,6,1,0,0,1,0,0),(4,628,53,7,3,2,1,0,0,0,0),(4,629,53,3,1,0,0,0,0,0,0),(4,630,53,9,0,0,1,0,0,0,0),(4,631,53,10,1,3,0,0,1,0,0),(4,632,53,3,0,0,0,0,0,0,0),(4,633,53,7,1,1,0,0,0,0,0),(4,634,40,7,0,0,0,0,0,0,0),(4,635,40,8,0,0,0,0,0,0,0),(4,636,40,3,0,0,0,0,0,0,0),(4,637,40,6,9,0,0,0,0,0,0),(4,638,40,8,3,0,2,0,1,0,0),(4,639,40,2,1,0,0,0,0,0,0),(4,640,40,9,1,0,0,0,0,0,0),(4,641,40,3,1,0,1,0,0,0,0),(4,642,40,2,0,0,0,0,0,0,0),(4,643,40,8,4,0,1,0,0,0,0),(4,644,40,7,12,0,0,0,0,0,0),(4,645,40,8,0,0,0,0,0,0,0),(4,646,40,9,4,0,1,0,0,0,0),(4,647,56,4,0,0,0,0,0,0,0),(4,648,56,7,2,0,0,0,0,0,0),(4,649,56,10,1,0,2,0,0,0,0),(4,650,56,8,0,0,0,0,0,0,0),(4,651,56,6,1,0,0,0,0,0,0),(4,652,56,4,0,0,0,0,0,0,0),(4,653,56,6,0,0,0,0,0,0,0),(4,654,56,1,0,0,0,0,0,0,0),(4,655,56,8,1,0,1,0,0,0,0),(4,656,56,10,1,0,0,0,1,0,0),(4,657,53,2,0,0,0,0,0,0,0),(4,658,35,2,1,0,0,0,0,0,0),(4,659,35,6,2,1,0,0,0,0,0),(4,660,35,6,2,7,0,0,0,0,0),(4,661,35,7,6,5,1,0,0,0,0),(4,662,40,4,0,0,0,0,0,0,0),(4,663,40,4,0,0,0,0,0,0,0),(4,664,40,1,0,0,0,0,0,0,0),(4,665,40,3,0,0,0,0,0,0,0),(4,666,40,5,0,0,1,0,0,0,0),(4,667,40,6,0,0,2,0,0,0,0),(4,668,40,2,0,0,0,0,0,0,0),(4,669,45,9,6,0,0,0,0,0,0),(4,670,45,6,0,0,0,0,0,0,0),(4,671,45,3,0,0,0,0,0,0,0),(4,672,45,7,4,0,0,0,0,0,0),(4,673,44,7,0,0,0,0,0,0,0),(4,674,44,1,0,0,0,0,0,0,0),(4,675,44,2,0,0,0,0,0,0,0),(4,676,51,7,0,0,0,0,0,0,0),(4,677,51,4,0,0,1,1,0,1,0),(4,678,51,5,0,0,0,0,0,0,0),(4,679,51,8,0,0,1,0,0,0,0),(4,680,51,9,1,0,1,0,0,0,1),(4,681,51,7,6,0,1,0,0,0,0),(4,682,51,10,23,0,2,0,0,0,1),(4,683,51,4,1,0,1,0,0,0,0),(4,684,51,4,1,0,0,0,0,0,0),(4,685,51,7,3,0,0,0,0,0,0),(4,686,51,5,2,0,0,0,0,0,0),(4,687,39,9,0,0,0,0,0,0,0),(4,688,39,7,1,0,0,0,0,0,0),(4,689,39,6,3,1,0,0,0,0,0),(4,690,39,1,0,0,0,0,0,0,0),(4,691,39,3,2,0,0,0,0,0,0),(4,692,39,6,4,0,2,0,1,0,0),(4,693,39,5,1,0,0,0,0,0,0),(4,694,42,6,0,0,0,0,0,0,0),(4,695,42,4,1,0,0,0,0,0,0),(4,696,42,5,0,0,0,0,0,0,0),(4,697,42,7,3,0,0,0,0,0,0),(4,698,42,5,1,0,1,0,0,0,0),(4,699,42,7,0,0,1,0,0,0,0),(4,700,42,7,1,0,0,0,0,0,0),(4,701,42,8,1,0,0,0,0,0,0),(4,702,42,3,2,0,0,0,0,0,0),(4,703,49,10,4,0,1,0,0,0,0),(4,704,49,5,1,2,0,0,0,0,0),(4,705,49,3,1,1,0,0,0,0,0),(4,706,56,5,0,0,0,0,0,0,0),(4,707,56,9,0,0,0,0,0,0,0),(4,708,56,8,1,0,0,0,0,0,0),(4,709,56,6,1,0,2,0,0,0,0),(4,710,56,10,4,0,1,0,0,0,0),(4,711,37,4,0,0,0,0,0,0,0),(4,712,37,10,0,2,0,0,0,0,0),(4,713,37,10,13,2,1,0,0,0,0),(4,714,37,4,0,0,0,0,0,0,0),(4,715,47,4,0,0,1,0,0,0,0),(4,716,47,5,0,0,0,0,0,1,0),(4,717,47,2,0,0,0,0,0,0,0),(4,718,47,8,1,0,1,0,0,0,0),(4,719,46,5,6,0,1,0,1,0,0),(4,720,46,9,0,0,0,0,0,0,0),(4,721,46,3,0,0,0,0,0,0,0),(4,722,46,5,2,0,1,0,0,0,0),(4,723,46,4,3,0,1,0,1,0,0),(4,724,38,8,0,1,2,0,0,0,0),(4,725,38,5,0,4,1,1,0,0,0),(4,726,43,8,0,0,0,0,0,0,0),(4,727,43,1,0,0,0,0,0,0,0),(4,728,43,3,0,0,1,0,0,0,0),(4,729,43,1,0,0,0,0,0,0,0),(4,730,43,5,0,0,0,0,0,0,0),(4,731,43,8,0,0,0,0,0,0,0),(4,732,43,3,0,0,0,0,0,0,0),(4,733,43,2,0,0,0,0,0,0,0),(4,734,43,7,2,0,0,0,0,0,0),(4,735,43,1,0,0,0,0,0,0,0),(4,736,43,3,0,0,0,0,0,0,0),(4,737,54,6,0,0,0,0,0,0,0),(4,738,54,5,0,1,1,0,1,0,0),(4,739,54,7,0,0,0,0,0,1,0),(4,740,54,5,2,1,0,1,0,0,0),(4,741,41,9,6,2,0,0,0,0,0),(4,742,50,7,2,3,0,0,0,0,0),(4,743,50,7,0,1,1,0,0,0,0),(4,744,55,5,0,0,0,0,0,0,0),(4,745,55,3,0,0,0,0,0,0,0),(4,746,55,5,0,0,0,0,0,0,0),(4,747,48,2,0,0,0,0,0,0,0),(4,748,48,5,4,0,0,0,0,0,0),(4,749,48,6,0,0,0,0,0,0,0),(4,750,48,3,1,0,1,0,0,0,0),(4,751,48,3,0,0,0,0,0,0,0),(4,752,48,1,1,0,0,0,0,0,0),(4,753,36,1,0,0,0,0,0,0,0),(4,754,36,3,0,0,0,0,0,0,0),(4,755,36,8,4,0,0,0,0,0,0),(4,756,36,4,1,0,0,0,0,0,0),(4,757,45,8,0,0,0,0,0,0,0),(4,758,37,5,0,0,0,0,0,0,0),(4,759,37,5,0,0,0,0,0,0,0),(4,760,43,1,0,0,1,0,0,0,0),(4,761,36,3,0,0,0,0,0,0,0),(4,762,36,3,0,0,0,0,0,0,0),(4,763,53,4,3,1,0,0,0,0,0),(4,764,53,1,0,0,0,0,0,0,0),(4,765,53,5,1,0,1,0,0,0,0),(4,766,53,1,0,0,0,0,0,0,0),(4,767,55,7,2,0,1,0,0,0,0),(4,768,44,1,2,0,0,0,0,0,1),(4,769,44,6,1,0,0,0,0,0,0),(4,770,42,9,1,0,0,0,0,0,0),(4,771,42,2,0,0,0,0,0,0,0),(4,772,42,9,3,0,0,0,0,0,0),(4,773,51,2,0,0,0,0,0,0,0),(4,774,51,5,0,0,1,0,0,0,0),(4,775,51,3,0,0,0,0,0,0,0),(4,776,51,4,2,0,0,0,0,0,0),(4,777,39,6,3,0,0,0,0,0,0),(4,778,46,8,1,0,2,0,0,0,0),(4,779,50,9,0,1,0,0,0,0,0),(4,780,50,2,0,0,0,0,0,0,0),(4,781,50,5,6,1,1,0,0,0,0),(4,782,50,2,1,0,0,0,0,0,0),(4,783,41,1,0,0,0,0,0,0,0),(4,784,38,1,0,0,0,0,0,0,0),(4,785,38,2,0,0,0,0,0,0,0),(4,786,56,3,0,0,0,0,0,0,0),(4,787,48,7,1,0,1,0,0,0,0),(4,788,35,5,0,0,0,0,0,0,0),(4,789,35,2,1,2,0,0,0,0,0),(4,790,35,3,2,2,0,0,0,0,0),(4,791,47,5,3,0,0,0,0,0,0),(4,792,55,3,2,0,0,0,0,0,0),(4,793,49,1,0,0,0,0,0,0,0),(4,794,51,6,0,0,0,0,0,0,0),(4,795,51,4,0,0,0,0,0,0,0),(4,796,40,3,3,0,0,0,0,0,0),(4,797,41,7,3,2,0,0,0,0,0),(4,798,43,5,0,0,0,0,0,0,0),(4,799,43,1,0,0,0,0,0,0,0),(4,800,44,8,5,0,0,0,0,0,0),(4,801,46,1,0,0,0,0,0,0,0),(4,802,48,2,0,0,0,0,0,0,0),(4,803,38,5,4,2,0,0,0,0,0),(4,804,54,1,0,0,0,0,0,0,0),(4,805,54,5,0,0,0,0,0,0,0),(4,806,54,3,1,2,0,0,0,0,0),(4,807,42,7,1,0,2,0,0,0,0),(4,808,42,1,2,0,0,0,0,0,0),(4,809,42,2,1,0,0,0,0,0,0),(4,810,42,8,2,0,0,0,0,0,0),(4,811,42,6,1,0,1,0,1,0,0),(4,812,35,2,0,0,0,0,0,0,0),(4,813,35,1,0,0,0,0,0,0,0),(4,814,53,4,0,0,0,0,0,0,0),(4,815,53,2,0,0,0,0,0,0,0),(4,816,53,4,1,0,0,0,0,0,0),(4,817,56,5,0,0,1,0,0,0,0),(4,818,56,7,5,0,1,0,0,0,0),(4,819,56,1,0,0,0,0,0,0,0),(4,820,47,2,0,0,0,0,0,0,0),(4,821,36,2,0,0,0,0,0,0,0),(4,822,36,4,0,0,0,0,0,0,0),(4,823,36,6,2,0,0,0,0,0,0),(4,824,55,2,0,0,0,0,0,0,0),(4,825,49,1,0,0,0,0,0,0,0),(4,826,39,4,0,0,0,0,0,0,0),(4,827,43,2,0,0,0,0,0,0,0),(4,828,41,5,1,1,0,0,0,0,0),(4,829,41,5,2,1,0,0,0,0,0),(4,830,45,2,0,0,0,0,0,0,0),(4,831,35,4,2,2,0,0,0,0,0),(4,832,44,3,1,0,0,0,0,0,0),(4,833,56,3,2,0,1,1,0,0,0),(4,834,47,5,1,0,0,0,1,0,0),(4,835,47,4,3,0,0,0,0,0,0),(4,836,48,3,0,0,0,0,0,0,0),(4,837,48,7,0,0,0,0,0,0,0),(4,838,48,3,5,0,0,0,0,0,0),(4,839,53,1,0,0,1,0,0,0,0),(4,840,53,3,0,1,0,0,0,0,0),(4,841,36,1,0,0,0,0,0,0,0),(4,842,54,3,4,0,0,0,0,0,0),(4,843,42,5,1,0,0,0,0,0,0),(4,844,42,7,0,0,0,0,0,0,0),(4,845,42,1,0,0,0,0,0,0,0),(4,846,38,1,0,0,1,0,0,0,0),(4,847,38,6,1,1,0,0,0,0,0),(4,848,49,1,0,0,0,0,0,0,0),(4,849,46,5,2,0,0,0,0,0,0),(4,850,53,4,1,0,0,0,0,0,0),(4,851,53,3,2,0,1,0,0,0,0),(4,852,53,1,0,0,0,0,0,0,0),(4,853,40,1,0,0,0,0,0,0,0),(4,854,42,4,0,0,0,0,0,0,0),(4,855,48,5,0,0,0,0,0,0,0),(4,856,48,1,0,0,0,0,0,0,0),(4,857,38,2,0,0,0,0,0,0,0),(4,858,51,1,0,0,0,0,0,0,0),(4,859,36,2,0,0,0,0,0,0,0),(4,860,36,4,2,0,0,0,0,0,0),(4,861,37,1,0,1,0,0,0,0,0),(4,862,42,5,3,0,0,0,0,0,0),(4,863,51,2,0,0,0,0,0,0,0),(4,864,40,2,0,0,0,0,0,0,0),(4,865,46,1,0,0,0,0,0,0,0),(4,866,46,2,0,0,2,0,0,0,0),(4,867,40,3,0,0,0,0,0,0,0),(4,868,40,1,0,0,0,0,0,0,0),(4,869,43,2,0,0,0,0,0,0,0),(4,870,42,1,0,0,0,0,0,0,0),(4,871,46,1,0,0,0,0,0,0,0),(4,872,46,2,0,0,0,0,0,0,0),(4,873,46,4,0,0,0,0,0,0,0),(4,874,39,1,2,0,0,0,0,0,0),(4,875,56,4,1,0,0,0,0,0,0),(4,876,44,4,2,0,0,1,0,0,0),(4,877,52,1,0,0,0,0,0,0,0),(4,878,52,2,0,0,2,0,0,0,0),(4,879,51,2,0,0,0,0,0,0,0),(4,880,39,1,0,0,0,0,0,0,0),(4,881,39,1,0,0,0,0,0,0,0),(4,882,56,3,0,0,0,0,0,0,0),(4,883,47,1,0,0,0,0,0,0,0),(4,884,54,1,0,0,1,0,0,0,0),(4,885,35,1,0,0,1,0,0,0,0),(4,886,55,2,0,0,0,0,0,0,0),(4,887,53,1,0,0,0,0,0,0,0),(4,888,52,1,0,0,0,0,0,0,0),(4,889,52,1,0,0,0,0,0,0,0),(4,890,47,1,1,0,0,0,0,0,0);
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
  PRIMARY KEY (`id_pos`),
  UNIQUE KEY `name_pos_indx` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesons`
--

LOCK TABLES `sesons` WRITE;
/*!40000 ALTER TABLE `sesons` DISABLE KEYS */;
INSERT INTO `sesons` VALUES (4,'2020-07-01','2019-08-16');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (5,'Спартак-1','Мал. Олений пер., д. 23'),(6,'Спартак-2','Мал. Олений пер., д. 23'),(7,'Спартак-3','Мал. Олений пер., д. 23'),(8,'Спартак-4','Мал. Олений пер., д. 23');
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
  KEY `fk_pos_on_staff_idx` (`id_pos`),
  CONSTRAINT `fk_pos_on_staff` FOREIGN KEY (`id_pos`) REFERENCES `position` (`id_pos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (32,'Тест т.',NULL,NULL),(35,'Тест2 т.',NULL,NULL),(36,'Тест3 т.',NULL,NULL),(37,'Тест4 т.',6,NULL),(38,'Боярский Д.',6,NULL),(39,'Бородин И.',6,NULL),(40,'Сергеев А.',6,NULL),(41,'Крынтя А.',6,NULL),(42,'-',6,NULL),(43,'Бодров Д.',6,NULL),(44,'Агапов А.',6,NULL),(45,'Никитин С.',6,NULL),(46,'Барсуков В.',6,NULL),(47,'Артыков М.',6,NULL),(48,NULL,6,NULL),(49,NULL,6,NULL),(50,NULL,NULL,NULL),(51,NULL,NULL,NULL),(52,NULL,NULL,NULL),(53,'Жегулов М.',NULL,NULL),(54,'Зайцев А.',NULL,NULL),(55,NULL,NULL,NULL),(56,NULL,NULL,NULL),(57,NULL,NULL,NULL),(58,'Аветисов С.',NULL,NULL),(59,NULL,NULL,NULL),(60,NULL,NULL,NULL),(61,NULL,NULL,NULL),(62,NULL,NULL,NULL),(63,NULL,NULL,NULL),(64,NULL,NULL,NULL),(65,NULL,NULL,NULL),(66,NULL,NULL,NULL),(67,NULL,NULL,NULL),(68,NULL,NULL,NULL),(69,NULL,NULL,NULL),(70,NULL,NULL,NULL),(71,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `id_division` int(11) DEFAULT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL COMMENT 'Дубль основной команды',
  PRIMARY KEY (`id_team`),
  KEY `fk_teams_teams1_idx` (`id_parent`),
  KEY `divisions_teams_fk` (`id_division`),
  CONSTRAINT `divisions_teams_fk` FOREIGN KEY (`id_division`) REFERENCES `divisions` (`id_division`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,'Селтик',NULL,'Селтик.png',NULL),(2,1,'Усадьба Бан.',NULL,'Усадьба Бан..png',NULL),(3,1,'Юрген',NULL,'Юрген.png',NULL),(4,1,'Дорстройсити',NULL,'Дорстройсити.png',NULL),(5,1,'Квазар',NULL,'Квазар.png',NULL),(6,1,'Селтик-2',NULL,'Селтик-2.png',NULL),(7,1,'Трансгарант',NULL,'Трансгарант.png',NULL),(8,1,'Дизайн-Связист',NULL,'Дизайн-Связист.png',NULL),(9,1,'Торпедо',NULL,'Торпедо.png',NULL),(10,1,'Титан',NULL,'Титан.png',NULL),(11,1,'СКА',NULL,'СКА.png',NULL),(12,1,'Эрствак',NULL,'Эрствак.png',NULL),(13,1,'Регион-13',NULL,'Регион-13.png',NULL),(14,1,'Бастион',NULL,'Бастион.png',NULL),(15,2,'Здор. Нация',NULL,'Здор. Нация.png',NULL),(16,2,'Максимум',NULL,'Максимум.png',NULL),(17,2,'Унион Деп.',NULL,'Унион Деп..png',NULL),(18,2,'ЦНДШ',NULL,'ЦНДШ.png',NULL),(19,2,'Интер',NULL,'Интер.png',NULL),(20,2,'Витязь',NULL,'Витязь.png',NULL),(21,2,'Косино',NULL,'Косино.png',NULL),(22,2,'Гарант',NULL,'Гарант.png',NULL),(23,2,'ВиНК',NULL,'ВиНК.png',NULL),(24,2,'Профком Юн.',NULL,'Профком Юн..png',NULL),(25,2,'ЛФК Империя',NULL,'ЛФК Империя.png',NULL),(26,2,'Спортинг',NULL,'Спортинг.png',NULL),(27,2,'ФК Ю. Гаврилова',NULL,'ФК Ю. Гаврилова.png',NULL),(28,2,'Бобби Дэззлер',NULL,'Бобби Дэззлер.png',NULL),(29,2,'Бриг',NULL,'Бриг.png',NULL),(30,2,'Колхоз',NULL,'Колхоз.png',NULL),(31,2,'Симбирск',NULL,'Симбирск.png',NULL),(32,2,'Павлино',NULL,'Павлино.png',NULL),(33,2,'Морс',NULL,'Морс.png',NULL),(34,2,'Фора',NULL,'Фора.png',NULL),(35,3,'Экспресс',NULL,'Экспресс.png',NULL),(36,3,'Брикфорд',NULL,'Брикфорд.png',NULL),(37,3,'Фрезер',NULL,'Фрезер.png',NULL),(38,3,'Комман',NULL,'Комман.png',NULL),(39,3,'ЭВОЛВ',NULL,'ЭВОЛВ.png',NULL),(40,3,'Хаста',NULL,'Хаста.png',NULL),(41,3,'ДИСА',NULL,'ДИСА.png',NULL),(42,3,'НПЦ Лидер',NULL,'НПЦ Лидер.png',NULL),(43,3,'Гарпастум',NULL,'Гарпастум.png',NULL),(44,3,'Русь',NULL,'Русь.png',NULL),(45,3,'Энергетик',NULL,'Энергетик.png',NULL),(46,3,'Чума востока',NULL,'Чума востока.png',NULL),(47,3,'Восход',NULL,'Восход.png',NULL),(48,3,'Прайм',NULL,'Прайм.png',NULL),(49,3,'Вираж',NULL,'Вираж.png',NULL),(50,3,'Рольф',NULL,'Рольф.png',NULL),(51,3,'Русичи',NULL,'Русичи.png',NULL),(52,3,'НК-Дивизия',NULL,'НК-Дивизия.png',NULL),(53,3,'КБК',NULL,'КБК.png',NULL),(54,3,'Голден',NULL,'Голден.png',NULL),(55,3,'Скуадра',NULL,'Скуадра.png',NULL),(56,3,'Ярославка',NULL,'Ярославка.png',NULL),(57,4,'Москва',NULL,'Москва.png',NULL),(58,4,'ЛФКБ',NULL,'ЛФКБ.png',NULL),(59,4,'Конкорд',NULL,'Конкорд.png',NULL),(60,4,'Сок. Гора',NULL,'Сок. Гора.png',NULL),(61,4,'Стандарт',NULL,'Стандарт.png',NULL),(62,4,'РЖДП',NULL,'РЖДП.png',NULL),(63,4,'Р-16',NULL,'Р-16.png',NULL),(64,4,'ЛЕБО',NULL,'ЛЕБО.png',NULL),(65,4,'Перв. Фронт',NULL,'Перв. Фронт.png',NULL),(66,4,'Жел. Феликс',NULL,'Жел. Феликс.png',NULL),(67,4,'Вост. Легион',NULL,'Вост. Легион.png',NULL),(68,4,'Кортен',NULL,'Кортен.png',NULL),(69,4,'Берсеркер',NULL,'Берсеркер.png',NULL),(70,4,'Зубр',NULL,'Зубр.png',NULL),(71,4,'ВВ-Хуниорс',NULL,'ВВ-Хуниорс.png',NULL),(72,4,'Грифоны',NULL,'Грифоны.png',NULL),(73,4,'МНИИПА',NULL,'МНИИПА.png',NULL),(74,4,'Легион Москва',NULL,'Легион Москва.png',NULL),(75,4,'Аэротрейд',NULL,'Аэротрейд.png',NULL),(76,4,'ЛФК',NULL,'ЛФК.png',NULL),(77,4,'Стандарт 2007',NULL,'Стандарт 2007.png',NULL),(78,4,'ФЛБ-Мск',NULL,'ФЛБ-Мск.png',NULL),(79,5,'Селтик-2-Д',NULL,'Селтик-2-Д.png',NULL),(80,5,'ВИМ-АВИА',NULL,'ВИМ-АВИА.png',NULL),(81,5,'Морс-Д',NULL,'Морс-Д.png',NULL),(82,5,'Эрствак-Д',NULL,'Эрствак-Д.png',NULL),(83,5,'Гвардия',NULL,'Гвардия.png',NULL),(84,5,'ЛФК Империя-Д',NULL,'ЛФК Империя-Д.png',NULL),(85,5,'Мордовия',NULL,'Мордовия.png',NULL),(86,5,'Легион 2012',NULL,'Легион 2012.png',NULL),(87,5,'Молот',NULL,'Молот.png',NULL),(88,5,'Раш',NULL,'Раш.png',NULL),(89,5,'Америка',NULL,'Америка.png',NULL),(90,5,'Эдем',NULL,'Эдем.png',NULL),(91,5,'Форсаж',NULL,'Форсаж.png',NULL),(92,5,'Блэкбёрн',NULL,'Блэкбёрн.png',NULL),(93,5,'Братислава',NULL,'Братислава.png',NULL),(94,5,'Совы',NULL,'Совы.png',NULL),(95,5,'РЖДП-Д',NULL,'РЖДП-Д.png',NULL),(96,5,'Среда Финанс',NULL,'Среда Финанс.png',NULL),(97,6,'Регион-13-Д',NULL,'Регион-13-Д.png',NULL),(98,6,'Гарант-Д',NULL,'Гарант-Д.png',NULL),(99,6,'Атлант',NULL,'Атлант.png',NULL),(100,6,'Академик',NULL,'Академик.png',NULL),(101,6,'Норэнс',NULL,'Норэнс.png',NULL),(102,6,'Коммунар-Д',NULL,'Коммунар-Д.png',NULL),(103,6,'Мол. гвардия',NULL,'Мол. гвардия.png',NULL),(104,6,'Торпедо-Д',NULL,'Торпедо-Д.png',NULL),(105,6,'Медовый',NULL,'Медовый.png',NULL),(106,6,'Таганка Юн.',NULL,'Таганка Юн..png',NULL),(107,6,'Симбирск-Д',NULL,'Симбирск-Д.png',NULL),(108,6,'Чёр. жем.',NULL,'Чёр. жем..png',NULL),(109,6,'Формула Фут.',NULL,'Формула Фут..png',NULL),(110,6,'Лемончелло',NULL,'Лемончелло.png',NULL),(111,6,'Ювенко',NULL,'Ювенко.png',NULL),(112,6,'Вост. Измайлово',NULL,'Вост. Измайлово.png',NULL),(113,6,'Эйт мэн',NULL,'Эйт мэн.png',NULL),(114,6,'Роуд Групп',NULL,'Роуд Групп.png',NULL);
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
INSERT INTO `tournament_table` VALUES (4,1,1,0,0,0,0,0,0,0),(4,1,2,0,0,0,0,0,0,0),(4,1,3,0,0,0,0,0,0,0),(4,1,4,0,0,0,0,0,0,0),(4,1,5,0,0,0,0,0,0,0),(4,1,6,0,0,0,0,0,0,0),(4,1,7,0,0,0,0,0,0,0),(4,1,8,0,0,0,0,0,0,0),(4,1,9,0,0,0,0,0,0,0),(4,1,10,0,0,0,0,0,0,0),(4,1,11,0,0,0,0,0,0,0),(4,1,12,0,0,0,0,0,0,0),(4,1,13,0,0,0,0,0,0,0),(4,1,14,0,0,0,0,0,0,0),(4,2,15,11,10,0,1,63,25,30),(4,2,16,10,7,2,1,43,14,23),(4,2,17,10,7,1,2,61,24,22),(4,2,18,10,7,2,1,35,17,23),(4,2,19,10,6,2,2,42,31,20),(4,2,20,10,5,2,3,33,26,17),(4,2,21,11,5,4,2,32,32,19),(4,2,22,10,5,3,2,55,38,18),(4,2,23,10,4,1,5,28,42,13),(4,2,24,11,3,3,5,35,42,12),(4,2,25,11,4,2,5,42,41,14),(4,2,26,10,3,3,4,24,32,12),(4,2,27,9,4,1,4,25,23,13),(4,2,28,10,3,1,6,22,30,10),(4,2,29,11,3,1,7,32,54,10),(4,2,30,10,2,3,5,22,37,9),(4,2,31,11,2,1,8,29,43,7),(4,2,32,10,3,1,6,29,50,10),(4,2,33,11,1,2,8,29,54,5),(4,2,34,10,1,1,8,16,42,4),(4,3,35,11,10,0,1,84,28,30),(4,3,36,11,9,0,2,38,18,27),(4,3,37,11,8,1,2,36,20,25),(4,3,38,11,7,0,4,37,23,21),(4,3,39,11,7,0,4,43,33,21),(4,3,40,11,6,1,4,46,34,19),(4,3,41,10,6,1,3,44,23,19),(4,3,42,11,5,3,3,30,27,18),(4,3,43,11,6,2,3,38,28,20),(4,3,44,11,5,2,4,28,35,17),(4,3,45,11,4,3,4,37,38,15),(4,3,46,11,3,4,4,25,25,13),(4,3,47,10,5,1,4,26,32,16),(4,3,48,11,4,2,5,32,31,14),(4,3,49,11,3,2,6,26,27,11),(4,3,50,11,3,2,6,32,42,11),(4,3,51,11,3,1,7,39,52,10),(4,3,52,10,2,2,6,19,42,8),(4,3,53,10,1,5,4,22,36,8),(4,3,54,11,1,5,5,32,60,8),(4,3,55,11,1,3,7,30,51,6),(4,3,56,11,0,0,11,21,60,0),(4,4,57,0,0,0,0,0,0,0),(4,4,58,0,0,0,0,0,0,0),(4,4,59,0,0,0,0,0,0,0),(4,4,60,0,0,0,0,0,0,0),(4,4,61,0,0,0,0,0,0,0),(4,4,62,0,0,0,0,0,0,0),(4,4,63,0,0,0,0,0,0,0),(4,4,64,0,0,0,0,0,0,0),(4,4,65,0,0,0,0,0,0,0),(4,4,66,0,0,0,0,0,0,0),(4,4,67,0,0,0,0,0,0,0),(4,4,68,0,0,0,0,0,0,0),(4,4,69,0,0,0,0,0,0,0),(4,4,70,0,0,0,0,0,0,0),(4,4,71,0,0,0,0,0,0,0),(4,4,72,0,0,0,0,0,0,0),(4,4,73,0,0,0,0,0,0,0),(4,4,74,0,0,0,0,0,0,0),(4,4,75,0,0,0,0,0,0,0),(4,4,76,0,0,0,0,0,0,0),(4,4,77,0,0,0,0,0,0,0),(4,4,78,0,0,0,0,0,0,0),(4,5,79,0,0,0,0,0,0,0),(4,5,80,0,0,0,0,0,0,0),(4,5,81,0,0,0,0,0,0,0),(4,5,82,0,0,0,0,0,0,0),(4,5,83,0,0,0,0,0,0,0),(4,5,84,0,0,0,0,0,0,0),(4,5,85,0,0,0,0,0,0,0),(4,5,86,0,0,0,0,0,0,0),(4,5,87,0,0,0,0,0,0,0),(4,5,88,0,0,0,0,0,0,0),(4,5,89,0,0,0,0,0,0,0),(4,5,90,0,0,0,0,0,0,0),(4,5,91,0,0,0,0,0,0,0),(4,5,92,0,0,0,0,0,0,0),(4,5,93,0,0,0,0,0,0,0),(4,5,94,0,0,0,0,0,0,0),(4,5,95,0,0,0,0,0,0,0),(4,5,96,0,0,0,0,0,0,0),(4,6,97,0,0,0,0,0,0,0),(4,6,98,0,0,0,0,0,0,0),(4,6,99,0,0,0,0,0,0,0),(4,6,100,0,0,0,0,0,0,0),(4,6,101,0,0,0,0,0,0,0),(4,6,102,0,0,0,0,0,0,0),(4,6,103,0,0,0,0,0,0,0),(4,6,104,0,0,0,0,0,0,0),(4,6,105,0,0,0,0,0,0,0),(4,6,106,0,0,0,0,0,0,0),(4,6,107,0,0,0,0,0,0,0),(4,6,108,0,0,0,0,0,0,0),(4,6,109,0,0,0,0,0,0,0),(4,6,110,0,0,0,0,0,0,0),(4,6,111,0,0,0,0,0,0,0),(4,6,112,0,0,0,0,0,0,0),(4,6,113,0,0,0,0,0,0,0),(4,6,114,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tournament_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_user`
--

DROP TABLE IF EXISTS `type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_user` (
  `id_type` int(10) unsigned NOT NULL,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_user`
--

LOCK TABLES `type_user` WRITE;
/*!40000 ALTER TABLE `type_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_dayofmatch`
--

DROP TABLE IF EXISTS `v_dayofmatch`;
/*!50001 DROP VIEW IF EXISTS `v_dayofmatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dayofmatch` AS SELECT 
 1 AS `match_date`,
 1 AS `match_time`,
 1 AS `id_stadium`,
 1 AS `id_tour`,
 1 AS `name_stadium`,
 1 AS `location`,
 1 AS `id_match`,
 1 AS `team_home`,
 1 AS `team_guest`,
 1 AS `id_division`,
 1 AS `name_division`,
 1 AS `id_season`,
 1 AS `busy_time`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `id_season`,
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
 1 AS `logo_guest`,
 1 AS `played`*/;
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
-- Dumping events for database 'football_main_realese'
--

--
-- Dumping routines for database 'football_main_realese'
--
/*!50003 DROP FUNCTION IF EXISTS `change_team_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `change_team_name`(a_nameTeam varchar(100)) RETURNS varchar(100) CHARSET utf8
begin
	declare l_nameTeam varchar(100);
    select
	case a_nameTeam
		when 'Максимум-Королёв' then 'Максимум'
        when 'Здоровая Нация' then 'Здор. Нация'
        when 'Профком Юнайтед-Москва' then 'Профком Юн.'
        when 'ВиНК ВВ-Москва' then 'ВиНК'
        when 'Фут. клуб Юрия Гаврилова' then 'ФК Ю. Гаврилова'
        when 'Унион Депортиво' then 'Унион Деп.'
        WHEN 'Русичи Москва' then 'Русичи'
        when 'Экспресс Москва' then 'Экспресс'
        when 'Соколиная Гора' then 'Сок. Гора'
        when 'Восточный Легион' then 'Вост. Легион'
        when 'Первомайский Фронт' then 'Перв. Фронт'
        when 'Росжелдорпроект' then 'РЖДП'
        when 'Железный Феликс' then 'Жел. Феликс'
        when 'Росжелдорпроект-Д' then 'РЖДП-Д'
        when 'Блэкбёрн Роверс' then 'Блэкбёрн'
        else a_nameTeam
    end
    into l_nameTeam;
    
    return l_nameTeam;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `insertSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSchedule`(in dateMatch varchar(50),
								in timeMatch varchar(50) ,
                                in stadium varchar(50),
                                in teamHome varchar(50) ,
                                in teamVisit varchar(50)
                                )
begin

	declare l_idMatch int;
    declare l_idStadium int;
    declare msg varchar(100);
    
    set msg = Concat_WS(' ','Warning: not found' ,dateMatch, timeMatch, stadium,teamHome, teamVisit);
    
    select id_stadium 
    into l_idStadium
    from stadiums where name_stadium = stadium;
    
    if l_idStadium is null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
    end if;
    
    
    select id_match
    into l_idMatch
    from v_matches where team_home = teamHome  and team_guest = teamvisit;
    
    
	if l_idMatch is null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
    end if;	
   
    set msg = concat_ws(' ', 'Warning: match or stadium not found!',l_idMatch, l_idStadium);

    if l_idMatch is not null and l_idStadium is not null then 
		insert into dayofmatch
        set match_date = dateMatch,
			match_time = timeMatch,
            id_stadium = l_idStadium,
            id_match = l_idMatch,
            busy_time = 1;
	else 
		 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
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
        set /*id_staff = LAST_INSERT_ID() + 1,*/
			staff_name = name_ref,
            id_pos = (select id_pos from position where pos_name = 'Судья');
	 else
		#select 'This name have already exiat' as waring;
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: This name have already exist';
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
    in l_own_goal int,
    in l_url_player varchar(50),
    in player_team varchar(50))
begin
	declare id_player_auto_before int;
    declare id_player_auto_after int;
	declare l_id_match int;
    declare l_id_player int;
	declare f int;
    declare f_2 int default 0;
    #вытаскиваем id матча
    select id_match
     into l_id_match
    from v_matches
    where team_home like change_team_name(t_home) and team_guest like change_team_name(t_guest) and id_tour = tour;
    if l_id_match is null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Error: Not found match id!!!!!';
    end if;
    #вытаскиваем игрока
    select id_player
     into l_id_player
	from players p
     where p.url_site like l_url_player; 
     
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
		#SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Player is not found';
        
        SELECT `AUTO_INCREMENT`
        into id_player_auto_before
		FROM  INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'football_main_realese'
		AND   TABLE_NAME   = 'players';
			
        insert into players
        set name = name_player, 
			id_team = (select id_team from teams t where t.team_name = change_team_name(player_team)),
            url_site = l_url_player;
            
		
        SELECT `AUTO_INCREMENT`
        into id_player_auto_after
		FROM  INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'football_main_realese'
		AND   TABLE_NAME   = 'players';
        
        if id_player_auto_before < id_player_auto_after then 
			insert into players_in_match
				set id_match = l_id_match,
					id_player = id_player_auto_before,
					count_goals = goals,
					count_assist = assists,
					yellow = c_yellow,
					red = c_red,
					penalty = l_penalty,
					penalty_out = l_penalty_out,
					own_goal = l_own_goal;
        else 
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Player not add!!!!!';
        end if;
    end if;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_match`()
begin
	
    declare k int default 0;
	Declare done, done2 int default 0;
    declare id_1, id_2 int;
    declare cur1 cursor for 
		select t.id_team
        from teams t
        where id_division = 1;
	declare cur2 cursor for
		select id_team
        from teams
        where id_division = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	
    open cur1;
   
		
	fetch cur1 into id_1;
	while not  done do
         
	block2:
    begin
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done2 = 1;
	 
			open cur2;
			fetch cur2 into id_2;
			#Select 'Переменные равны',id_1, id_2;
			while not done2 do
				if id_1 <> id_2 then 
					insert into debug_ins 
					set iter = 1,
						id_1 = id_1,
                        id_2 = id_2;
                        
					insert into matches 
						set id_season = 3,
							id_division = 1,
							team_home = id_1,
							team_guest = id_2;
				end if;
				fetch cur2 into id_2;
			end while;
			close cur2;
			
			

    end block2;
	fetch cur1 into id_1;
    Select 'Второй курсор выполнился', id_1;
    end while;
    close cur1;

    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_match_inst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_match_inst`( in id_team int)
begin

	Declare done int default 0;
    declare id_1 int;
    declare cur1 cursor for 
		select t.id_team
        from teams t
        where id_division = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	
    open cur1;
	fetch cur1 into id_1;
	while not  done do
		if id_team <> id_1 then 
        
			insert into matches
				set id_season = 3,
					id_division = 1,
                    team_home = id_team, 
                    team_guest = id_1;
			
        end if;
		fetch cur1 into id_1;
    end while;	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_match_main` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_match_main`()
begin
	
	Declare done int default 0;
    declare id_1 int;
    declare cur1 cursor for 
		select t.id_team
        from teams t
        where id_division = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	
    open cur1;
	fetch cur1 into id_1;
	while not  done do
		call ins_match_inst(id_1);
		fetch cur1 into id_1;
    end while;
	
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_dayofmatch`
--

/*!50001 DROP VIEW IF EXISTS `v_dayofmatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dayofmatch` AS select `d`.`match_date` AS `match_date`,time_format(`d`.`match_time`,'%H:%i') AS `match_time`,`d`.`id_stadium` AS `id_stadium`,`d`.`id_tour` AS `id_tour`,`s`.`name_stadium` AS `name_stadium`,`s`.`location` AS `location`,`d`.`id_match` AS `id_match`,`m`.`team_home` AS `team_home`,`m`.`team_guest` AS `team_guest`,`d`.`id_division` AS `id_division`,`m`.`name_division` AS `name_division`,`d`.`id_season` AS `id_season`,`d`.`busy_time` AS `busy_time` from ((`dayofmatch` `d` left join `v_matches` `m` on((`d`.`id_match` = `m`.`id_match`))) join `stadiums` `s` on((`d`.`id_stadium` = `s`.`id_stadium`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `v_matches` AS select `m`.`id_match` AS `id_match`,`se`.`id_season` AS `id_season`,`d`.`name_division` AS `name_division`,`d`.`id_division` AS `id_division`,`m`.`id_tour` AS `id_tour`,`th`.`team_name` AS `team_home`,`m`.`goal_home` AS `goal_home`,`m`.`goal_guest` AS `goal_guest`,`tg`.`team_name` AS `team_guest`,`m`.`m_date` AS `m_date`,`s`.`name_stadium` AS `name_stadium`,`st`.`staff_name` AS `staff_name`,`m`.`transfer` AS `transfer`,`th`.`logo` AS `logo_home`,`tg`.`logo` AS `logo_guest`,`m`.`played` AS `played` from ((((((`matches` `m` join `teams` `th` on((`th`.`id_team` = `m`.`team_home`))) join `teams` `tg` on((`tg`.`id_team` = `m`.`team_guest`))) join `sesons` `se` on((`se`.`id_season` = `m`.`id_season`))) left join `stadiums` `s` on((`s`.`id_stadium` = `m`.`id_stadium`))) left join `divisions` `d` on((`d`.`id_division` = `m`.`id_division`))) left join `staff` `st` on((`st`.`id_staff` = `m`.`id_referee`))) */;
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

-- Dump completed on 2019-10-30 11:11:46
