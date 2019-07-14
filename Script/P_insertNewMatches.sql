drop procedure if exists randMatches;
Delimiter //
create procedure randMatches(in division int)
begin

	declare team_id int;
	declare team_id_2 int;
    declare count_team int default 0;
    declare finished numeric(1);
    declare finished2 numeric(1);
    
    declare cr cursor for
		select id_team
        from teams
        where id_division = 1;
       
    
    declare cr_2 cursor for
		select id_team
        from teams
        where id_division = 1;
     
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; 
    
    select count(1)
     into count_team
	from teams 
    where id_division = division;
    BLOCK2: BEGIN
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished2 = 1; 
	set finished = 0;	
	open cr;
	fetch cr into team_id;
    while (finished!=1)do
		 
          
		set finished2 = 0;
        open cr_2;
        fetch cr_2 into team_id_2;
        while (finished2 != 1) do
			if(team_id != team_id_2) then
				insert into matches
                set team_home = team_id,
					team_guest = team_id_2,
                    id_season = 3;
            end if;
        end while;
        close cr_2;
        
    end while;
    END BLOCK2;
	close cr;

end //

CALL randMatches(1);
