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
        when 'Соколиная Гора' then 'Сок. Гора'
        when 'Восточный Легион' then 'Вост. Легион'
        when 'Первомайский Фронт' then 'Перв. Фронт'
        when 'Первомайский Фронт-Д' then 'Перв. Фронт-Д'
        when 'Росжелдорпроект' then 'РЖДП'
        when 'Железный Феликс' then 'Жел. Феликс'
        when 'Росжелдорпроект-Д' then 'РЖДП-Д'
        when 'Блэкбёрн Роверс' then 'Блэкбёрн'
        when 'Усадьба Банная' then 'Усадьба Бан.'
        when 'Дизайн-окно-Связист' then 'Дизайн-Связист'
        when 'Молодая гвардия' then 'Мол. гвардия'
        when 'Формула Футбола' then 'Формула Фут.'
        when 'Восточное Измайлово' then 'Вост. Измайлово'
        when 'Таганка Юнайтед' then 'Таганка Юн.'
        when 'Чёрная жемчужина' then 'Чёр. жем.'
        when 'Селтик-М' then 'Селтик-2-Д'
        else a_nameTeam
    end
    into l_nameTeam;
    
    return l_nameTeam;
end// 
DELIMITER ;


