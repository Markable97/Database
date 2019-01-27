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
  CONSTRAINT `fk_matches_staff1` FOREIGN KEY (`id_referee`) REFERENCES `staff` (`id_staff`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_teams1` FOREIGN KEY (`team_home`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matches_teams2` FOREIGN KEY (`team_guest`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
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

if goal_h is not null then 

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
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
  `id_staff` int(11) NOT NULL,
  `staff_name` varchar(70) DEFAULT NULL,
  `id_pos` int(11) DEFAULT NULL,
  `num_phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `fk_staff_position1_idx` (`id_pos`),
  CONSTRAINT `fk_staff_position1` FOREIGN KEY (`id_pos`) REFERENCES `position` (`id_pos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
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

insert into tournament_table
set id_season = (select id_season from sesons
					where curdate() between year_start and year_end),
	id_division = new.id_division,
    id_team = new.id_team,
    games = 0, wins = 0, draws = 0, losses = 0, goals_scored = 0, goals_conceded = 0, points = 0;

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

-- Dump completed on 2019-01-11 23:25:55
