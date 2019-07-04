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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 22:13:23
