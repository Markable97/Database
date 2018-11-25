use main_football;
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

set team_home = old.teams_id_teamHome;
set team_guest = old.teams_id_teamVisitor;
set goal_h = new.goal_home;
set goal_v = new.goal_visitor;
if goal_h is not null then

	/*select goal_home into goal_h 
    from matches
    where teams_id_teamHome = team_home and id_tour = 3;
    
    select goal_visitor into goal_v 
    from matches
    where teams_id_teamVisitor = team_guest and id_tour = 3;
    */
    
    if goal_h > goal_v then
    #победа первой
		update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, point = point + 3
        where teams_id_team = team_home;
	#поражение второй
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h
        where teams_id_team = team_guest;
        
    elseif goal_h < goal_v then
    #поражение первой
		update tournament_table
        set games= games + 1, losses = losses + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v
        where teams_id_team = team_home;
	#победа второй
        update tournament_table 
		set games= games + 1, wins = wins + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, point = point + 3
        where teams_id_team = team_guest;
        
	else
    #ничья
		update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_h,
        goals_conceded = goals_conceded + goal_v, point = point + 1
        where teams_id_team = team_home;
        
        update tournament_table
		set games= games + 1, draws = draws + 1, goals_scored = goals_scored + goal_v,
        goals_conceded = goals_conceded + goal_h, point = point + 1
        where teams_id_team = team_guest;
    
        
    end if;
    
end if;
end//
