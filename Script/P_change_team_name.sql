drop function if exists change_team_name;
DELIMITER //
create function change_team_name(a_nameTeam varchar(100))
returns varchar(100)
begin
	declare l_nameTeam varchar(100);
    select
	case a_nameTeam
		when 'Максимум-Королёв' then 'Максимум'
        when 'Здоровая Нация' then 'Здор. Нация'
        when 'Профком Юнайтед-Москва' then 'Профком Юн.'
        when 'ВиНК ВВ-Москва' then 'ВиНК'
        when 'Фут. клуб Юрия Гаврилова' then 'ФК Ю. Гаврилова'
        when 'Унион Депортиво' then 'Унион Деп.'
        WHEN 'Русичи Москва' then 'Русичи'
        when 'Экспресс Москва' then 'Экспресс'
        when 'Легион Москва' then 'Легион'
        when 'Соколиная Гора' then 'Сок. Гора'
        when 'Восточный Легион' then 'Вост. Легион'
        when 'Первомайский Фронт' then 'Перв. Фронт'
        when 'Росжелдорпроект' then 'РЖДП'
        when 'Железный Феликс' then 'Жел. Феликс'
        when 'Росжелдорпроект-Д' then 'РЖДП-Д'
        when 'Блэкбёрн Роверс' then 'Блэкбёрн'
        else a_nameTeam
    end
    into l_nameTeam;
    
    return l_nameTeam;
end// 
DELIMITER ;


