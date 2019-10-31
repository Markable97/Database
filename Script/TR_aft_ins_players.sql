drop trigger if exists tr_aft_ins_players;
DELIMITER //
create trigger  tr_aft_ins_players after insert on players
for each row
begin

declare idPlayer int;
declare idSeason int;
declare idTeam int;
declare idTeamChild int;

set idPlayer = new.id_player;
set idSeason = (select id_season from sesons
					where curdate() between year_start and year_end);
set idTeam = new.id_team;         
#Проверка есть ли дубль
	select id_child
	into idTeamChild
	from teams
	where id_team = idTeam;
# Если есть то добавляем статистику и для дубля
	insert into players_statistics
	set id_player = idPlayer, id_season = idSeason, id_team = idTeam,
	games = 0, goal = 0, assist = 0, yellow_card = 0, red_card = 0, penalty = 0, own_goal = 0, penalty_out = 0; 
if idTeamChild is not null then 
	insert into players_statistics
	set id_player = idPlayer, id_season = idSeason, id_team = idTeamChild,
	games = 0, goal = 0, assist = 0, yellow_card = 0, red_card = 0, penalty = 0, own_goal = 0, penalty_out = 0; 	
end if;    
end//
