use football_main_work;
drop trigger if exists tr_aft_del_players_in_match;
DELIMITER //
create trigger  tr_aft_del_players_in_match after delete on players_in_match
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

end//