drop trigger if exists tr_aft_upd_teams;
DELIMITER //
create trigger tr_aft_upd_teams after update on teams
for each row
begin 
	declare idSeason int;
	set idSeason = (select id_season from sesons
						where curdate() between year_start and year_end);
                        
	if new.id_child is not null then
		insert into players_statistics(id_season, id_player, id_team)
        select idSeason, p.id_player, new.id_child 
        from players p
        where p.id_team = new.id_team;
	end if;

end//