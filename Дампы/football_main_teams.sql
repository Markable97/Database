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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 22:13:22
