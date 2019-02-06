create or replace view v_squad as 
select 
	p.id_player,
    t.team_name,
    t.id_team,
    p.name,
    a.name_amplua,
    p.birthdate,
    p.number,
    ps.games,
    ps.goal + ps.penalty as goal,
    ps.penalty,
    ps.assist,
    ps.yellow_card,
    ps.red_card,
    p.photo
from players p, teams t, players_statistics ps, amplua a
where p.id_team = t.id_team
and p.id_player = ps.id_player
and p.id_amplua = a.id_amplua;

