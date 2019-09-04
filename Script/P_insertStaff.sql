drop procedure if exists insertStaff;
DELIMITER //
create procedure insertStaff (in name_ref varchar(70) )
begin 
	
    declare f int default 0; #переменная для проверки условия
    
    select count(1)
     into f
    from staff
     where staff_name like name_ref;
     
     if f = 0 then
		insert into staff
        set staff_name = name_ref;
	 else
		select 'This name have already exiat' as waring;
        #SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: This name have already exist';
     end if;

end//


