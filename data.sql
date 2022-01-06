/*
    создание всех типов и таблиц
*/

CREATE TYPE Character_Types AS ENUM ('Main Protagonist', 'Main Antagonist', 'Minor Protagonist', 'Minor Antagonist', 'Extras');
CREATE TYPE Ability_Types AS ENUM ('Unique', 'Physical', 'Haki', 'Swordplay', 'Shooting', 'Instinct', 'Charisma');
CREATE TYPE Proccess_Types AS ENUM ('Plot Creating', 'Character Creating', 'Character Drawing', 'Ability Creating', 'Page Creating', 'Page Drawing', 'Page Refactoring', 'Text Writing', 'Text Drawing');
CREATE TYPE Status_Types AS ENUM ('In Progress', 'Waiting', 'Completed', 'In Plans');
CREATE TYPE Effect_Types AS ENUM ('Glow', 'Shadow', 'Shiny', 'Mirage', 'Dirty', 'Light', 'Action', 'Minimal', 'Stroke', 'Fill', 'Adjustment');
CREATE TYPE Shell_Types AS ENUM ('Author', 'Squar', 'Circle', 'Sharp');

CREATE TABLE Employee(
	ID SERIAL PRIMARY KEY,
	Employee_Name VARCHAR (32) NOT NULL, 
	Employee_SecondName VARCHAR (32) NOT NULL,
    Work_Type_Description TEXT NOT NULL
);

CREATE TABLE ScreenWriter(
    ID SERIAL PRIMARY KEY,
    Employee_ID INTEGER REFERENCES Employee(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Artist(
    ID SERIAL PRIMARY KEY,
    Employee_ID INTEGER REFERENCES Employee(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Proccess(
    ID SERIAL PRIMARY KEY,
    Proccess_Type Proccess_Types NOT NULL,
    Description TEXT NOT NULL,
    Begin_Date TIMESTAMP NOT NULL,
    Deadline_Date TIMESTAMP NOT NULL CHECK,
    Status_Type Status_Types NOT NULL
);

CREATE TABLE ScreenWriter_Proccess(
    ScreenWriter_ID INTEGER REFERENCES ScreenWriter(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ScreenWriter_Proccess_ID PRIMARY KEY (ScreenWriter_ID, Proccess_ID)
);

CREATE TABLE Artist_Proccess(
    Artist_ID INTEGER REFERENCES Artist(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Artist_Proccess_ID PRIMARY KEY (Artist_ID, Proccess_ID)
);

CREATE TABLE Characters(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR (32) NOT NULL, 
    Age INTEGER NOT NULL,
    Description TEXT NOT NULL,
    Character_Type Character_Types NOT NULL
);

CREATE TABLE Ability(
    ID SERIAL PRIMARY KEY,
    Description TEXT NOT NULL UNIQUE,
    Ability_Type Ability_Types NOT NULL
);

CREATE TABLE Character_Abilities(
    Character_ID INTEGER REFERENCES Characters(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Ability_ID INTEGER REFERENCES Ability(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Character_Abilities_ID PRIMARY KEY (Character_ID, Ability_ID)
);

CREATE TABLE Proccess_Characters(
    Character_ID INTEGER REFERENCES Characters(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Proccess_Characters_ID PRIMARY KEY (Character_ID, Proccess_ID)
);

CREATE TABLE Plot(
    ID SERIAL PRIMARY KEY,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Description TEXT NOT NULL,
    Number_Of_Arch INTEGER NOT NULL CHECK (Number_Of_Arch >= 0)
);

CREATE TABLE Genres(
    ID SERIAL PRIMARY KEY,
    Genre VARCHAR (32) NOT NULL,
    Description TEXT NOT NULL
);

CREATE TABLE Plot_Genres(
    Plot_ID INTEGER REFERENCES Plot(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Genre_ID INTEGER REFERENCES Genres(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Plot_Genre_ID PRIMARY KEY (Plot_ID, Genre_ID) 
);

CREATE TABLE Character_Plot(
    Character_ID INTEGER REFERENCES Characters(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Plot_ID INTEGER REFERENCES Plot(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Character_Plot_ID PRIMARY KEY (Character_ID, Plot_ID)
);

CREATE TABLE Pages(
    ID SERIAL PRIMARY KEY,
    Plot_ID INTEGER REFERENCES Plot(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Frame_Count INTEGER NOT NULL CHECK (Frame_Count >= 0),
    Description TEXT NOT NULL
);

CREATE TABLE Effect(
    ID SERIAL PRIMARY KEY,
    Effect_Type Effect_Types NOT NULL,
    Description TEXT NOT NULL
);

CREATE TABLE Pages_Effects(
    Page_ID INTEGER REFERENCES Pages(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Effect_ID INTEGER REFERENCES Effect(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Pages_Effect_ID PRIMARY KEY (Page_ID, Effect_ID)
);

CREATE TABLE Texts(
    ID SERIAL PRIMARY KEY,
    Proccess_ID INTEGER REFERENCES Proccess(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Page_ID INTEGER REFERENCES Pages(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Font VARCHAR (32) NOT NULL,
    Size INTEGER NOT NULL CHECK (Size BETWEEN 5 AND 40),
    Shell_Type Shell_Types NOT NULL
);

CREATE TABLE Text_Effects(
    Text_ID INTEGER REFERENCES Texts(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Effect_ID INTEGER REFERENCES Effect(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Text_Effects_ID PRIMARY KEY (Text_ID, Effect_ID)
);