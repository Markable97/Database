drop procedure if exists insPlayerInMatche;
DELIMITER //
create procedure insPlayerInMatche(
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
    if f_2 = 0 then 
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
end//