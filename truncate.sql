/*
    опустошение всех таблиц с обнулением всех id sequences
*/

truncate ability RESTART IDENTITY cascade;
truncate artist RESTART IDENTITY cascade;
truncate artist_proccess RESTART IDENTITY cascade;
truncate character_abilities RESTART IDENTITY cascade;
truncate character_plot RESTART IDENTITY cascade;
truncate characters RESTART IDENTITY cascade;
truncate effect RESTART IDENTITY cascade;
truncate employee RESTART IDENTITY cascade;
truncate genres RESTART IDENTITY cascade;
truncate pages RESTART IDENTITY cascade;
truncate pages_effects RESTART IDENTITY cascade;
truncate plot RESTART IDENTITY cascade;
truncate plot_genres RESTART IDENTITY cascade;
truncate proccess RESTART IDENTITY cascade;
truncate proccess_characters RESTART IDENTITY cascade;
truncate screenwriter RESTART IDENTITY cascade;
truncate screenwriter_proccess RESTART IDENTITY cascade;
truncate text_effects RESTART IDENTITY cascade;
truncate texts RESTART IDENTITY cascade
