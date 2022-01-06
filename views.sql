/*
	представление для удобного доступа к данным всех сценаристов
	атрибуты: имя, фамилия, описание работы
*/

create or replace view screenwriter_employee as select employee_name, employee_secondname, work_type_description
	from screenwriter as SCR
		join employee as EMP on EMP.id = SCR.employee_id;

-----------------------------------------------------------------------------------------------------------------------

/*
	представление для удобного доступа к данным всех художников
	атрибуты: имя, фамилия, описание работы
*/

create or replace view artist_employee as select employee_name, employee_secondname, work_type_description
	from artist as ART
		join employee as EMP on EMP.id = ART.employee_id;

-----------------------------------------------------------------------------------------------------------------------

/*
	представление для удобного доступа к данным процессов относящихся к художникам 
	атрибуты: имя, фамилия, описание работы, тип процесса, описание процесса, статус процесса
*/

create or replace view artist_proccess_details as select employee_name, employee_secondname, work_type_description, proccess_type, description, status_type 
	from employee as EMP
		join artist as ART on EMP.id = ART.employee_id
		join artist_proccess as ART_PRC on ART_PRC.artist_id = ART.id
		join proccess as PRC on PRC.id = ART_PRC.proccess_id;

-----------------------------------------------------------------------------------------------------------------------	

/*
	представление для удобного доступа к данным процессов относящихся к сценаристам
	атрибуты: имя, фамилия, описание работы, тип процесса, описание процесса, статус процесса
*/

create or replace view screenwriter_proccess_details as select employee_name, employee_secondname, work_type_description, proccess_type, description, status_type 
	from employee as EMP
		join screenwriter as SCR on EMP.id = SCR.employee_id
		join screenwriter_proccess as SCR_PRC on SCR_PRC.screenwriter_id = SCR.id
		join proccess as PRC on PRC.id = SCR_PRC.proccess_id;
		
-----------------------------------------------------------------------------------------------------------------------

/*
	представление для просмотра какие жанры относятся к сюжетам 
	атрибуты: название жанра, описание жанра, описание сюжета
*/

create or replace view genres_in_plot as select GN.genre as genre_name, GN.description as genre_description, PLT.description as plot_description  
	from plot as PLT
		join plot_genres as PLT_GN on PLT_GN.plot_id = PLT.id 
		join genres as GN on PLT_GN.genre_id = GN.id;
		
-----------------------------------------------------------------------------------------------------------------------

/*
	представление для просмотра какие персонажи относятся к каким сюжетам
	атрибуты: имя персонажа, описание сюжета
*/

create or replace view characters_by_plot as select CHR.name, PLT.description 
	from characters as CHR
		join character_plot as CHR_PLT on CHR.id = CHR_PLT.character_id
		join plot as PLT on CHR_PLT.plot_id = PLT.id;