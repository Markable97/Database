call insertSchedule('2019-08-26','10:30', 'Торпедо ','СКА', 'Спартак-1');

call insertSchedule('2019-08-24','12:20', 'Спартак-4', 'Эрствак-Д', 'Молот');

drop procedure if exists insertSchedule;
Delimiter //
create procedure insertSchedule(in dateMatch varchar(50),
								in timeMatch varchar(50) ,
                                in stadium varchar(50),
                                in teamHome varchar(50) ,
                                in teamVisit varchar(50)
                                )
begin

	declare l_idMatch int;
    declare l_idStadium int;
    declare msg varchar(100);
    
    set msg = Concat_WS(' ','Warning: not found' ,dateMatch, timeMatch, stadium,teamHome, teamVisit);
    
    select id_stadium 
    into l_idStadium
    from stadiums where name_stadium = stadium;
    
    if l_idStadium is null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
    end if;
    
    
    select id_match
    into l_idMatch
    from v_matches where team_home = teamHome  and team_guest = teamvisit;
    
    
	if l_idMatch is null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
    end if;	
   
    set msg = concat_ws(' ', 'Warning: match or stadium not found!',l_idMatch, l_idStadium);

    if l_idMatch is not null and l_idStadium is not null then 
		insert into dayofmatch
        set match_date = dateMatch,
			match_time = timeMatch,
            id_stadium = l_idStadium,
            id_match = l_idMatch,
            busy_time = 1;
	else 
		 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = msg;
    end if;
    
	

end//