drop trigger if exists tr_aft_upd_dayofmatch;
DELIMITER //
create trigger tr_aft_upd_dayofmatch after update on dayofmatch
for each row 
begin 
	if new.id_match is not null then
		update matches 
			set m_date = concat_ws(' ',old.match_date, old.match_time),
				id_stadium = old.id_stadium
		where id_match = new.id_match;
    end if;
end//
drop trigger if exists tr_bef_upd_dayofmatch//
create trigger tr_bef_upd_dayofmatch before update on dayofmatch
for each row
begin
	if new.id_match is not null then 
		set new.busy_time = 1;
    end if;
end// 
