-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: football_main_work
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
) ENGINE=InnoDB AUTO_INCREMENT=4582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2867 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  `in_game` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_match`,`id_player`),
  KEY `fk_players_in_match_players1_idx` (`id_player`),
  KEY `fk_players_in_match_matches1_idx` (`id_match`),
  CONSTRAINT `id_match` FOREIGN KEY (`id_match`) REFERENCES `matches` (`id_match`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_player` FOREIGN KEY (`id_player`) REFERENCES `players` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
-- Dumping events for database 'football_main_work'
--

--
-- Dumping routines for database 'football_main_work'
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
        when 'Легион Москва' then 'Легион'
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
    in l_url_player varchar(50))
begin
	declare l_id_match int;
    declare l_id_player int;
	declare f int;
    declare f_2 int default 0;
    #вытаскиваем id матча
    select id_match
     into l_id_match
    from v_matches
    where team_home like change_team_name(t_home) and team_guest like change_team_name(t_guest) and id_tour = tour;
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
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Player is not found';
        
        /*insert into players
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
				own_goal = l_own_goal;*/
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

-- Dump completed on 2019-10-27 11:55:07
