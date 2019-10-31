drop procedure if exists insPlayerInMatche2;
DELIMITER //
create procedure insPlayerInMatche2(
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
				id_team = (select id_team from teams where team_name = change_team_name(player_team)),
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
			id_team = (select id_team from teams t where t.team_name = change_team_name(replace(player_team, '-Д', ''))),
            url_site = l_url_player;
            
		
        SELECT `AUTO_INCREMENT`
        into id_player_auto_after
		FROM  INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'football_main_realese'
		AND   TABLE_NAME   = 'players';
        
        if id_player_auto_before < id_player_auto_after then 
			insert into players_in_match
				set id_match = l_id_match,
					id_team = (select id_team from teams where team_name = change_team_name(player_team)),
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
   
end//