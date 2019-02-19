use football_main;
drop trigger if exists tr_aft_ins_matches;
DELIMITER //
create trigger tr_aft_ins_matches after insert on matches 
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

end//

drop trigger if exists tr_bef_ins_matches;
DELIMITER //
create trigger tr_bef_ins_matches before insert on matches 
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
    
end//