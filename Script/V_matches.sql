create or replace view v_matches as 
select m.id_match, 
	   d.name_division,
       m.id_tour,
       th.team_name as team_home,
       m.goal_home,
       m.goal_guest,
       tg.team_name as team_guest,
       m.m_date,
       s.name_stadium,
       st.staff_name,
       m.transfer
from matches m
join teams th on th.id_team = m.team_home
join teams tg on tg.id_team = m.team_guest
join stadiums s on s.id_stadium = m.id_stadium
join divisions d on d.id_division = m.id_division
join staff st on st.id_staff = m.id_referee
