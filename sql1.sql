use football_main;
drop procedure if exists ins_match_main;
Delimiter //
create procedure ins_match_main()
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
		call ins_match_inst(id_1);
		fetch cur1 into id_1;
    end while;
	
    
end//



call ins_match_main();

select count(*) from matches
where id_season = 3;//

delete from matches
where id_season = 3

select * from v_matches
where id_season = 3;



insert into sesons 
set year_start = '2019-08-17',
	year_end = '2020-08-01';

select * from debug_ins
where iter = 1
delete from debug_ins
where mess is null;

SET SQL_SAFE_UPDATES = 0;

create table debug_ins
(
	mess varchar(100),
	iter int,
	id_1 int,
    id_2 int
);

drop trigger tr_bef_ins_matches;
drop trigger up_tournament_table;