create or replace view v_players_in_matche as
select pm.id_match,
	   m.id_division,
	   m.id_tour,
       p.id_player,
       p.name, 
       p.number,
	   t.team_name, 
       pm.count_goals,
       pm.count_assist,
       pm.yellow,
       pm.red,
       pm.penalty,
       pm.penalty_out,
       pm.own_goal
from players_in_match pm
join players p on p.id_player = pm.id_player
join matches m on m.id_match = pm.id_match 
join teams t on t.id_team = pm.id_team

