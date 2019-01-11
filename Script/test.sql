INSERT INTO `matches` VALUES (1,1,1,1,2,4,0,14,'2018-08-26 00:00:00',1,null,null),
(3,1,1,1,13,2,3,6,'2018-08-25 00:00:00',1,null,null);

insert into matches
set id_match = 2,id_season = 1, id_division = 1, id_tour = 2,
team_home = 3 , goal_home = 5  , goal_guest = 12, team_guest = 4;

insert into players_in_match 
set id_match = 2, id_player = 4, count_goals = 2, yellow = 1, penalty_out = 1;

update matches 
set goal_home =4 , goal_guest = 1
where id_match = 2;

ALTER TABLE `football_main`.players  AUTO_INCREMENT=0;

delete from players
where id_player > 0;

select * 
from players_statistics;

delete from teams
where id_team > 0;

select * from players;

update players
set id_team = 3
where id_player = 1;

select * from matches;
delete from matches 
where id_match > 0