/*
	функция get_ability возвращает все способности определенного типа
	входные параметры: тип способности ( по умолчанию 'Unique' )
	выходные параметры: имя персонажа кому принадлежит способность, тип способности, описание способности
	типы способностей: 'Unique', 'Physical', 'Haki', 'Swordplay', 'Shooting', 'Instinct', 'Charisma'
*/

create or replace function get_ability(ab_type ability_types default 'Unique')
    returns table(name varchar(32), 
				  ability_type ability_types, 
				  description text) 
	as $$
    begin
        return query
			select CH.name, AB.ability_type, AB.description
				from characters as CH
					join character_abilities as CHA on CHA.character_id = CH.id
					join ability as AB on CHA.ability_id = AB.id
				where AB.ability_type = ab_type;
    end;
    $$ stable language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

/*
	функция get_ability_as_array делает то же самое что и get_ability, 
	но возвращаемое значение - описание способности, передается как массив, 
	для отсутсвия дублирования строк по имени персонажа и типу способностей
*/

create or replace function get_ability_as_array(ab_type ability_types default 'Unique')
    returns table(character_id integer, 
				  name varchar(32), 
				  ability_type ability_types, 
				  descriptions text[]) 
	as $$
    begin
        return query
			select CH.id, CH.name, AB.ability_type, array_agg(AB.description order by AB.description) AB
				from characters as CH
					join character_abilities as CHA on CHA.character_id = CH.id
					join ability as AB on CHA.ability_id = AB.id
				where AB.ability_type = ab_type
				group by CH.id, AB.ability_type
				order by CH.id;
    end;
    $$ stable language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

/*
	функция get_time_until_deadline возвращает сколько времени осталось до конца процесса с его начала
	входные параметры: id процесса, который нам нужен 
*/

create or replace function get_time_until_deadline(in _id integer)
	returns interval 
	as $$
		declare 
			n interval;
		begin
			select PRC.deadline_date - PRC.begin_date into strict n
				from proccess as PRC
				where PRC.id = _id;
			raise notice 'Until the end of the process_id: %, left: %', _id, n;
			return n;
		end;
	$$ stable language plpgsql;

-----------------------------------------------------------------------------------------------------------------------	

/*
	функция add_employee позволяет добавить работника и сразу обозначить его как художника либо сценарист
	входные параметры: имя/фамилия разделяемые одним пробелом, описание работы, является ли сценаристом или художником или обоими логической переменной
	выходные параметры: void 	
*/

create or replace function add_employee(name_secondname varchar(64), 
										work_description text, 
										is_screenwriter boolean default false, 
										is_artist boolean default false)
	returns void 
	as $$
		declare
			name varchar(32);
			second_name varchar(32);
			employee_id integer;
		begin
			select split_part(name_secondname, ' ', 1) into strict name;
			select split_part(name_secondname, ' ', 2) into strict second_name;
			
			insert into employee (employee_name, employee_secondname, work_type_description) values(name, second_name, work_description);
			select id into strict employee_id from employee order by id desc limit 1;
			
			if is_screenwriter = true then 
				insert into screenwriter (employee_id) values(employee_id);
			end if;
			if is_artist = true then
				insert into artist (employee_id) values(employee_id);
			end if;
		end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

/*
	функция add_proccess позволяет добавить процесс и художника / сценариста который его добавил
	входные параметры: тип процесса, статус процесса, описание, дата начала, дата конца, id сценариста / художника, один процесс не может принадлежать одновременно обоим
	выходные параметры: void 	
	типы процессов: 'Plot Creating', 'Character Creating', 'Character Drawing', 'Ability Creating', 'Page Creating', 'Page Drawing', 'Page Refactoring', 'Text Writing', 'Text Drawing'
	типы статусов: 'In Progress', 'Waiting', 'Completed', 'In Plans'
*/

create or replace function add_proccess(pr_type proccess_types, 
										st_type status_types, 
										descrip text, 
										start_date timestamp, 
										end_date timestamp, 
										screenwriter_id integer default -1, 
										artist_id integer default -1)
	returns void 
	as $$
		declare 
			proccess_id integer;
		begin
			insert into proccess (proccess_type, description, begin_date, deadline_date, status_type) values (pr_type, descrip, start_date, end_date, st_type);
			select id into strict proccess_id from proccess order by id desc limit 1;
			if exists ( select SC.id from screenwriter as SC where SC.id = screenwriter_id ) then 
				insert into ScreenWriter_Proccess (ScreenWriter_ID, Proccess_ID) values (screenwriter_id, proccess_id);
			elsif exists ( select AR.id from artist as AR where AR.id = artist_id ) then
				insert into Artist_Proccess (Artist_ID, Proccess_ID) values (artist_id, proccess_id);
			end if;
		end;
	$$ volatile language plpgsql;
						
-----------------------------------------------------------------------------------------------------------------------

/*
	все остальные функции выполняют одно и то же но с разными таблицами 
	в ассоциативную таблицу добавляются экземпляры по принципу 1:М в цикле
	первым входным параметром должен быть id сущности к которой мы добавляем зависимости
*/

create or replace function add_text_effect(variadic a integer[]) 
	returns void 
	as $$
	declare
		text_id integer = a[1];
		n integer;
	begin
		if exists ( select texts.id from texts where texts.id = text_id ) then	
			foreach n in array a[2 : array_length(a,1)] loop
				insert into text_effects (text_id, effect_id) values (text_id, n);
			end loop;
		end if;
	end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

create or replace function add_page_effect(variadic a integer[])
	returns void 
	as $$
	declare
		page_id integer = a[1];
		n integer; 
	begin
		if exists ( select pages.id from pages where pages.id = page_id ) then
			foreach n in array a[2 : array_length(a,1)] loop
				insert into pages_effects (page_id, effect_id) values (page_id, n);
			end loop;
		end if;
	end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

create or replace function add_character_abilities(variadic a integer[])
	returns void 
	as $$
	declare
		character_id integer = a[1];
		n integer;
	begin
		if exists ( select characters.id from characters where characters.id = character_id ) then
			foreach n in array a[2 : array_length(a,1)] loop
				insert into character_abilities (character_id, ability_id) values (character_id, n);
			end loop;
		end if;
	end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

create or replace function add_plot_genres(variadic a integer[])
	returns void 
	as $$
	declare 
		plot_id integer = a[1];
		n integer;
	begin
		if exists ( select plot.id from plot where plot.id = plot_id ) then
			foreach n in array a[2 : array_length(a,1)] loop
				insert into plot_genres (plot_id, genre_id) values (plot_id, n);
			end loop;
		end if;
	end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

create or replace function add_plot_characters(variadic a integer[])
	returns void 
	as $$
	declare 
		plot_id integer = a[1];
		n integer;
	begin
		if exists ( select plot.id from plot where plot.id = plot_id ) then
			foreach n in array a[2 : array_length(a,1)] loop
				insert into character_plot (character_id, plot_id) values (n, plot_id);
			end loop;
		end if;
	end;
	$$ volatile language plpgsql;

-----------------------------------------------------------------------------------------------------------------------

create or replace function add_proccess_characters(variadic a integer[])
	returns void 
	as $$
	declare
		proccess_id integer = a[1];
		n integer;
	begin
		if exists ( select proccess.id from proccess where proccess.id = proccess_id ) then 
			foreach n in array a[2 : array_length(a,1)] loop
				insert into proccess_characters (character_id, proccess_id) values (n, proccess_id);
			end loop;
		end if;
	$$ volatile language plpgsql;