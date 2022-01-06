-----------------------------------------------------------------------------------------------------------------------

/*
    триггер для проверки даты в процессах
    дата начала процесса не может быть позднее даты конца процесса
*/

create or replace function date_constraint_trigger () 
    returns trigger 
    as $$
    declare 
        n_begin timestamp = new.begin_date;
        n_deadline timestamp = new.deadline_date;
    begin
        if n_begin < n_deadline then  
            return new;
        end if;
        return null;
    end;
    $$ language plpgsql;

create trigger trigger_for_date_proccess 
before insert or update 
on proccess 
for each row 
execute function date_constraint_trigger();

-----------------------------------------------------------------------------------------------------------------------

/*
    триггер для проверки принадлежности процессов
    процессы с типом сценаристов не могут принадлежать художникам и наоборот
    типы процессов для художников = ['Character Drawing', 'Page Drawing', 'Page Refactoring', 'Text Drawing']
    типы процеесов для сценаристов = ['Plot Creating', 'Character Creating', 'Ability Creating', 'Page Creating', 'Text Writing']
*/

create or replace function proccess_employee_trigger ()
    returns trigger 
    as $$
    declare
        tmp_proccess_id integer = new.proccess_ID;
        tmp_proccess_type proccess_types;

        screenwriter_proccess_types proccess_types[] = array['Plot Creating', 'Character Creating', 'Ability Creating', 'Page Creating', 'Text Writing'];
        artist_proccess_types proccess_types[] = array['Character Drawing', 'Page Drawing', 'Page Refactoring', 'Text Drawing'];
    begin
        select proccess_type into tmp_proccess_type from proccess where id = tmp_proccess_id;
        if TG_TABLE_NAME = 'screenwriter_proccess' then
            if array_position(screenwriter_proccess_types, tmp_proccess_type) is not null then
                return new;
            end if;
            return null;
        elsif TG_TABLE_NAME = 'artist_proccess' then
            if array_position(artist_proccess_types, tmp_proccess_type) is not null then
                return new;
            end if;
            return null;
        end if;
    end;
    $$ language plpgsql

create trigger trigger_for_proccess_screenwriter_type
before insert or update 
on screenwriter_proccess
for each row
execute function proccess_employee_trigger();

create trigger trigger_for_proccess_artist_type
before insert or update
on artist_proccess
for each row
execute function proccess_employee_trigger();

-----------------------------------------------------------------------------------------------------------------------

/*
    триггер для проверки принадлежности способностей персонажей
    если персонажу нужно добавить способность с типом 'Unique' то эта способность должна принадлежать только ему
    способности с другими типами могут быть у кого угодно
*/

create or replace function ability_unique() 
    returns trigger 
    as $$
    declare
        ch_ability ability_types;
        n_ability integer = new.ability_id;
    begin
        select ability_type into strict ch_ability from ability where id = n_ability;
        if ch_ability = 'Unique' and not exists (select * from character_abilities where ability_id = n_ability) then
            return new;
        elsif ch_ability != 'Unique' then
            return new;
		end if;
		return null;
    end;
    $$ language plpgsql;

create trigger trigger_for_abilities
before insert or update 
on character_abilities
for each row
execute function ability_unique();

-----------------------------------------------------------------------------------------------------------------------