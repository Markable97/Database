use football_main;
drop trigger if exists tr_before_ins_players;
DELIMITER //
create trigger  tr_before_ins_players before insert on players
for each row
begin
	
    declare f int;
    declare pl_name char(100);
    set pl_name = new.name;
    
    select id_player
	 into f
    from players p
    where p.name = pl_name;
    
    if  f is not null then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: player have already exist';
    end if;

end//