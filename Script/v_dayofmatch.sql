create or replace view v_dayofmatch as
select d.match_date, 
	   time_format(d.match_time,'%H:%i') match_time,
       d.id_stadium,
       d.id_tour,
       s.name_stadium,
       s.location,
       d.id_match,
       m.team_home,
       m.team_guest,
       d.id_division,
       m.name_division,
       d.id_season,
       d.busy_time
from dayofmatch d
left join v_matches m on d.id_match = m.id_match 
join stadiums s on d.id_stadium = s.id_stadium;