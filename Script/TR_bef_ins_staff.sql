use football_main;
drop trigger if exists tr_bef_ins_staff;
DELIMITER //
create trigger tr_bef_ins_staff before insert on staff
for each row 
begin
	declare l_new_name char(100);
    declare l_f int;
    set l_new_name = new.staff_name;
    
    select count(1)
		into l_f
	from staff
		where staff_name like l_new_name;
        
	if l_f = 0 then 
		set new.staff_name = l_new_name,
			new.id_pos = 3;
	else
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: This name have already exist';
    end if;
    
end//

 