use football_main;
drop trigger if exists tr_aft_ins_teams;
DELIMITER //
create trigger tr_aft_ins_teams after insert on teams
for each row
begin 

insert into tournament_table
set id_season = (select id_season from sesons
					where curdate() between year_start and year_end),
	id_division = new.id_division,
    id_team = new.id_team,
    games = 0, wins = 0, draws = 0, losses = 0, goals_scored = 0, goals_conceded = 0, points = 0;

end//