create or replace view v_tournament_table as 
select s.id_season,
	   d.name_division,
	   tt.id_division,
	   t.team_name, 
       tt.id_team,
       tt.games,
       tt.wins,
       tt.draws,
       tt.losses,
       tt.goals_scored,
       tt.goals_conceded,
       tt.goals_scored - tt.goals_conceded as sc_con, 
       tt.points,
       t.logo
from tournament_table tt, teams t, divisions d, sesons s
where tt.id_team = t.id_team
and s.id_season = tt.id_season
and tt.id_division = d.id_division
order by points desc, sc_con desc;