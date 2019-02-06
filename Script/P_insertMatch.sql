drop procedure if exists insertMatches;
Delimiter //
create procedure insertMatches( in division int,
								in tour int,
                                in t_home varchar(50),
                                in g_home int,
                                in g_guest int,
                                in t_guest varchar(50),
                                in date_m datetime,
                                in staff varchar(50),
                                in stadium varchar(50),
                                in trans varchar(50)
								)
begin 

/*	declare d_m datetime;

	if date_m is not null then
		set d_m = date_format(date_m,'%Y-%m-%d %H:%i');  
	end if;*/

	if g_home is null or g_guest is null then 
		
        if stadium is null then
			insert into matches 
			set id_season = (select id_season from sesons where curdate() between year_start and year_end),
				id_division = division, 
				id_tour = tour,
				team_home = (select id_team from teams where team_name = t_home),
				team_guest = (select id_team from teams where team_name = t_guest);
        else
			insert into matches 
			set id_season = (select id_season from sesons where curdate() between year_start and year_end),
				id_division = division, 
				id_tour = tour,
				team_home = (select id_team from teams where team_name = t_home),
				team_guest = (select id_team from teams where team_name = t_guest),
				m_date = date_m,
				id_stadium = (select id_stadium from stadiums where name_stadium = stadium);
        end if;
        

    end if;

end//