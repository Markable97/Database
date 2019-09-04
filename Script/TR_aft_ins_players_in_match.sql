use football_main;
drop trigger if exists tr_aft_ins_players_in_match;
DELIMITER //
create trigger  tr_aft_ins_players_in_match after insert on players_in_match
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
if new.yellow = 2 then 
	set l_yellow = 1;
    set l_red = 1;
else
	set l_yellow = new.yellow;
	set l_red = new.red;
end if;
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
	
end//