create or replace view v_high_div_tournament_table as 
select d.name_division,
	   tt.id_division,
	   t.team_name, 
       tt.id_team,
       tt.games,
       tt.wins,
       tt.draws,
       tt.losses,
       tt.goals_scored,
       tt.goals_conceded,
       tt.points
from tournament_table tt, teams t, divisions d
where tt.id_team = t.id_team
and tt.id_division = d.id_division
and d.id_division = 1;

