drop trigger if exists up_tournament_table;
DELIMITER //
create trigger up_tournament_table after update on matches 
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
if new.played = 1 and old.goal_home is not null then 

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
end//
