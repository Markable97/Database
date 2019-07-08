use football_main;
drop trigger if exists up_users;
DELIMITER //
create trigger up_users before update on users
for each row
begin 
	
   set new.updated_user = now();
end//
