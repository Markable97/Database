drop procedure if exists ins_match_inst;
Delimiter //
create procedure ins_match_inst( in id_team int)
begin

	Declare done int default 0;
    declare id_1 int;
    declare cur1 cursor for 
		select t.id_team
        from teams t
        where id_division = 1;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	
    open cur1;
	fetch cur1 into id_1;
	while not  done do
		if id_team <> id_1 then 
        
			insert into matches
				set id_season = 3,
					id_division = 1,
                    team_home = id_team, 
                    team_guest = id_1;
			
        end if;
		fetch cur1 into id_1;
    end while;	
	
end//