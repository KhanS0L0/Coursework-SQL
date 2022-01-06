/*
	добавление тестовых данных для БД
*/

insert into Employee (Employee_Name, Employee_SecondName, Work_Type_Description) values 
('Eiichiro', 'Oda', 'One man army. Сan work as a screenwriter and an artist. Author of ONE PIECE'),
('Sato', 'Suzuki', 'Oda''s first assistant in drawing characters'),
('Kaneko', 'Aoki', 'Oda''s second assistant in drawing characters'),
('Takahashi', 'Tanaka', 'Oda''s first assistant in plot writing'),
('Fujita', 'Endo', 'Oda''s second assistant in plot writing'),
('Nakamura', 'Yoshida', 'Good background artist. Can draw a detailed layout of the city very quickly'),
('Inoue', 'Sasaki', 'Nakamura''s background drawing assistant'),
('Hasegawa', 'Goto', 'Text writer. Checks grammar and logic of statements'),
('Fukuda', 'Chiba', 'Text''s shape artist'),
('Aoki', 'Ueno', 'Clean final pages'),
('Hirano', 'Ono', 'Add effects on pages'),
('Ishikawa', 'Sakurai', 'Add effects on pages'),
('Kimura', 'Hara', 'Add effects on text and text shapes'),
('Saito', 'Murata', 'Add more effects on abilities');

insert into ScreenWriter (Employee_ID) values 
(1), (4), (5), (8);

insert into Artist (Employee_ID) values 
(1), (2), (3), (6), (7), (9), (10), (11), (12), (13), (14);

insert into Proccess (Proccess_Type, Description, Begin_Date, Deadline_Date, Status_Type) values
('Plot Creating', 'Creating Water 7 arc. After being attacked by Aokiji, the crew was fully recovered and had returned to sailing. They came to the City of Water: Water 7',  '2021-11-01 10:00:00', '2021-11-10 10:00:00', 'In Progress'),
('Character Creating', 'Creating arc''s main and minor antagonist. They should be from top secret world goverment''s organization. One of their main mission is kidnap Nico Robin', '2021-11-01 10:00:00', '2021-11-10 10:00:00', 'In Progress'),
('Character Drawing', 'Before plot and character''s will be complete it is in plan. But artist are making sketches of characters', '2021-11-10 10:00:00', '2021-11-12 10:00:00', 'In Plans'),
('Ability Creating', 'Main characters should get level up. Luffy can creat new technic like super power and speed. Test name is SECOND GEAR', '2021-11-03 10:00:00', '2021-11-10 10:00:00', 'In Progress'),
('Ability Creating', 'Main character Zoro creating his main technic Asura. He use 9 swords style instead of 3 swords and triple his powers', '2021-11-03 10:00:00', '2021-11-10 10:00:00', 'In Progress'),
('Page Creating', 'Before main plot will be complete page creating is useless. But we still can make blanks', '2021-11-10 10:00:00', '2021-11-13 10:00:00', 'In Plans'),
('Page Drawing', 'Before main plot will be complete page creating is useless. But we still can make blanks', '2021-11-13 10:00:00', '2021-11-16 10:00:00', 'In Plans'),
('Page Refactoring', 'Final step', '2021-11-16 10:00:00', '2021-11-17 10:00:00', 'In Plans'),
('Text Writing', 'Creating main character''s dialogues and thoughts. Creating blanks and sketches', '2021-11-07 10:00:00', '2021-11-10 10:00:00', 'In Progress'),
('Text Drawing', 'Before main plot will be complete text drawing is useless. But we still can make blanks', '2021-11-13 10:00:00', '2021-11-16 10:00:00', 'In Plans'); 

insert into ScreenWriter_Proccess (ScreenWriter_ID, Proccess_ID) values 
(1,1), (1,2), (1,4), (1,5), (1,6), (2,1), (2,4), (3,5), (3,6), (4,9);

insert into Artist_Proccess (Artist_ID, Proccess_ID) values 
(1,3), (1,7), (2,3), (3,3), (4,7), (5,7), (6,10), (7,8), (8,7), (9,7), (10,10), (11,7);

insert into Characters (Name, Age, Description, Character_Type) values
('Monkey D. Luffy', 19, 'Monkey D. Luffy, also known as Straw Hat, is the main protagonist of the manga One Piece. He is the founder and captain of the Straw Hat Pirates, as well as one of its top fighters. His lifelong dream is to become the Pirate King by finding the legendary treasure One Piece. He believes that being the Pirate King means having the most freedom in the world.', 'Main Protagonist'),
('Roronoa Zoro', 21, 'Roronoa Zoro, also known as Pirate Hunter, is the combatant of the Straw Hat Pirates, and one of their two swordsmen. Formerly a bounty hunter, he is the second member of the crew and the first to join. His dream is to become the greatest swordsman in the world, in order to honor a promise he made to his deceased childhood friend Kuina.', 'Minor Protagonist'),
('Nami', 20, 'Cat Burglar Nami is the navigator of the Straw Hat Pirates. She is the third member of the crew and the second to join, doing so during the Orange Town Arc. Her dream is to make a map of the entire world.', 'Minor Protagonist'),
('Usopp', 19, 'God Usopp is the sniper of the Straw Hat Pirates. He is the fourth member of the crew and the third to join, doing so at the end of the Syrup Village Arc. Usopp dreams of becoming a brave warrior of the sea just like his father and lives every day in pursuit of living up to this dream.', 'Minor Protagonist'),
('Vinsmoke Sanji', 21, 'Black Leg Sanji, born as Vinsmoke Sanji, is the cook of the Straw Hat Pirates. He is the fifth member of the crew and the fourth to join, doing so at the end of the Baratie Arc. His dream is to find the rumored chef''s paradise, All Blue, which is where East Blue, West Blue, North Blue, and South Blue meet, along with their wildlife.', 'Minor Protagonist'),
('Tony Tony Chopper', 17, 'Tony Tony Chopper, also known as Cotton Candy Lover Chopper, is the doctor of the Straw Hat Pirates. He is the sixth member of the crew and the fifth to join, doing so at the end of the Drum Island Arc. His dream is to one day become a doctor capable of curing any disease and wants to travel all across the world specifically in the hopes of accomplishing this dream.', 'Minor Protagonist'),
('Nico Robin', 30, 'Nico Robin, also known by her epithet Devil Child and the Light of the Revolution is the archaeologist of the Straw Hat Pirates. She is the seventh member of the crew and the sixth to join, doing so at the end of the Arabasta Arc. Her dream is to find the Rio Poneglyph which tells the true history of the world, specifically the Void Century.', 'Minor Protagonist'),
('Franky', 36, 'Iron Man Franky is the shipwright of the Straw Hat Pirates. He is the crew''s eighth member and the seventh to join, doing so at the end of the Post-Enies Lobby Arc. Franky''s dream is to create a ship and circumnavigate the world with it.', 'Minor Protagonist'),
('Rob Lucci', 30, 'Main antagonist of the Water 7 Arc and one of the two main antagonists of the Enies Lobby Arc, along with Spandam. He also is one of the central characters from CP9''s Independent Report Cover Page Serial, along with the rest of CP9 members.', 'Main Antagonist'),
('Kaku', 25, 'Kaku is a member of CP9, operating undercover in order to obtain the Pluton blueprints from Iceburg.', 'Minor Antagonist'),
('Jabra', 37, 'Jabra is a former member of CP9 and one of the last to be introduced. He is the third strongest in the organization.', 'Minor Antagonist'),
('Blueno', 32, 'Blueno is a former assassin of CP9 who worked undercover as the bartender of a bar in Water 7.', 'Minor Antagonist'),
('Kumadori', 36, 'Kumadori is a former member of CP9 and one of the last agents to be introduced. He is the son of Kumadori Yamanbako and one of the few characters without a known first name.', 'Minor Antagonist'),
('Fukurou', 31, 'Fukurou is a former member of CP9 and one of the last to be introduced.', 'Minor Antagonist'),
('Kalifa', 27, 'Kalifa is a former secretary of Iceburg as well as the only female member of CP9.', 'Minor Antagonist'),
('Nero', 22, 'Nero the Sea Weasel was the newest member of CP9. He was first introduced on the Puffing Tom, where he helped to escort Nico Robin to Enies Lobby.', 'Minor Antagonist');

insert into Proccess_Characters (Character_ID, Proccess_ID) values
(1,4), (2,5), (9,2), (10,2), (11,2), (12,2), (13,2), (14,2), (15,2), (16,2), (9,3), (10,3), (11,3), (12,3), (13,3), (14,3), (15,3), (16,3);

insert into Ability (Description, Ability_Type) values
('Strength. Huge physical strength.', 'Physical'),
('Speed and Agility. The ability to cover long distances in a short time and dodge bullets.', 'Physical'),
('Durability. The ability to take massive amounts of physical punishment but still remain conscious and able to fight.',  'Physical'),
('Endurance. The ability to endure an unpleasant or difficult process or situation without giving way.', 'Physical'),
('An innate, typically fixed pattern of behaviour in animals in response to certain stimuli.', 'Instinct'),
('The ability to recruit allies to your side wherever you go', 'Charisma'),
('Kenbunshoku Haki, which grants users a sixth sense of the world around them and limited precognitive abilities. Users of this Haki can sense people''s presence, strength, emotions, and intentions.', 'Haki'),
('Busoshoku Haki, which allows the user to use their own spiritual energy as armor to defend against attacks, as well as make their own attacks more potent.', 'Haki'),
('Haoshoku Haki, which grants the user the ability to overpower the will of others. This results in victims being mentally overwhelmed by the user, with particularly weak-willed foes instantly losing consciousness. Haoshoku is a rare form of Haki that only one in several million people are born with the ability to use.', 'Haki'),
('Advanced skill of fencing with swords or foils', 'Swordplay'),
('Advanced skill of shooting with different types of guns.', 'Shooting'),
('Gomu Gomu no Mi, a Paramecia-type Devil Fruit, gives to a body the properties of rubber, allowing to stretch, bounce, bend, twist, and inflate any part of body.', 'Unique'),
('Santoryu is a style of sword fighting where the practitioner wields three Katana; one in each hand and one in the mouth.', 'Unique'),
('Clima-Tact, manipulate the weather', 'Unique'),
('Black Leg Style is a unique combination of Brazilian Capoeira, French Savate and Korean Taekwondo, able to use powerful kicks with supreme versatility', 'Unique'),
('Hito Hito no Mi, a Zoan-type Devil Fruit that allows to transform into a human and reindeer-human hybrid at will.', 'Unique'),
('Rumble Ball is a drug has the power to distort the wavelengths of the Devil Fruit''s transformation, allowing access to additional transformations.', 'Unique'),
('Hana Hana no Mi, a Paramecia-type Devil Fruit that allows to sprout duplicates of any of body parts from any surface within range.', 'Unique'),
('Neko Neko no Mi, a Zoan-type Devil Fruit which allows to transform into a full leopard, a bulky leopard-human hybrid and a slender leopard-human hybrid', 'Unique'),
('Ushi Ushi no Mi, a Zoan-class Devil Fruit, which allows to transform into a giraffe-human hybrid and a full giraffe.', 'Unique'),
('Inu Inu no Mi, a Zoan-class Devil Fruit which gives the power to change into a full wolf and a human-wolf hybrid that resembles a werewolf.', 'Unique'),
('Doa Doa no Mi, a Paramecia-type Devil Fruit which allows to create and open doors on any surface, no matter how strong or thick said surface may be.', 'Unique'),
('Awa Awa no Mi, a Paramecia-type Devil Fruit which allows to create and manipulate soap bubbles that can clean anything. They can even "clean" the strength off of opponents.', 'Unique');

insert into Character_Abilities (Character_ID, Ability_ID) values 
(1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9), (1,12),
(2,1), (2,2), (2,3), (2,4), (2,5), (2,7), (2,8), (2,9), (2,10), (2,13),
(3,2), (3,3), (3,4), (3,14),
(4,1), (4,2), (4,3), (4,4), (4,5), (4,7), (4,11),
(5,1), (5,2), (5,3), (5,4), (5,5), (5,7), (5,8), (5,15),
(6,1), (6,2), (6,3), (6,4), (6,5), (6,16), (6,17),
(7,1), (7,2), (7,3), (7,4), (7,5), (7,18),
(8,1), (8,2), (8,3), (8,4), (8,5),
(9,1), (9,2), (9,3), (9,4), (9,5), (9,7), (9,8), (9,10), (9,11), (9,19),
(10,1), (10,2), (10,3), (10,4), (10,5), (10,7), (10,8), (10,10), (10,11), (10,20),
(11,1), (11,2), (11,3), (11,4), (11,5), (11,7), (11,8), (11,10), (11,11), (11,21),
(12,1), (12,2), (12,3), (12,4), (12,5), (12,7), (12,8), (12,10), (12,11), (12,22),
(13,1), (13,2), (13,3), (13,4), (13,5), (13,7), (13,8), (13,10), (13,11),
(14,1), (14,2), (14,3), (14,4), (14,5), (14,7), (14,8), (14,10), (14,11),
(15,1), (15,2), (15,3), (15,4), (15,5), (15,7), (15,8), (15,10), (15,11), (15, 23),
(16,1), (16,2), (16,3), (16,4), (16,5), (16,7), (16,8), (16,10), (16,11);

insert into Plot (Proccess_ID, Description, Number_Of_Arch) values 
(1, 'Water 7 is the seventh island that the Straw Hats encounter on the Grand Line. It is a water metropolis that was built on top of a previous sunken city. 
	Things seem to be going fine for the Straw Hats until a mysterious organization called CP9 gets involved. 
	This arc is well known for extensive use of plot twists and sudden shifts in the story-line, as well as the serious conflict within the Straw Hat crew.' , 15);

insert into Genres (Genre, Description) values 
('Seinen', 'Manga primarily targeted towards an adult male audience'),
('Shounen', 'Manga primarily targeted towards a young male audience'),
('Shoujo', 'Manga primarily targeted towards  a young female audience'),
('Josei', 'Manga primarily targeted towards an adult female audience'),
('Action', 'Genre in which the protagonist or protagonists are thrust into a series of events that typically include violence, extended fighting, physical feats, rescues and frantic chases'),
('Comedy', 'Genre of fiction that consists of discourses or works intended to be humorous or amusing by inducing laughter'),
('Drama', 'Category of narrative fiction intended to be more serious than humorous in tone');

insert into Plot_Genres (Plot_ID, Genre_ID) values (1,1), (1,5), (1,6), (1,7);

insert into Character_Plot (Character_ID, Plot_ID) values (1,1), (2,1), (3,1), (4,1), (5,1), (6,1), (7,1), (8,1), (9,1), (10,1), (11,1), (12,1), (13,1), (14,1), (15,1), (16,1);

insert into Pages (Plot_ID, Proccess_ID, Frame_Count, Description) values 
(1, 6, 1, 'Creating sketches of first greeting page'),
(1, 7, 2, 'Making blanks of the second page'),
(1, 7, 3, 'Making blanks of the third page');

insert into Effect (Effect_Type, Description) values 
('Glow', 'A steady radiance of light or heat'),
('Shadow', 'A dark area or shape produced by a body coming between rays of light and a surface'),
('Shiny', 'A reflecting light, typically because very clean or polished'),
('Mirage', 'Light rays are bent to produce a displaced image of distant objects or the sky'),
('Dirty', 'Covered or marked with an uclean substance'),
('Light', 'The lighting effects are the way the sun, shade, etc causes the photo to appear.'),
('Action', 'Implies that something is going on.'),
('Minimal', 'Extreme, austere simplicity.'),
('Stroke', 'Borders around whole images or within them.'),
('Fill', 'Fill your object with more of the subject.'),
('Adjustment', 'Correct image tones');

insert into Pages_Effects (Page_ID, Effect_ID) values (1,1), (1,4), (1,3), (2,7), (2,10), (3,3), (3, 9);

insert into Texts(Proccess_ID, Page_ID, Font, Size, Shell_Type) values 
(9, 1, 'Hajakiro', 34, 'Author'),
(9, 2, 'Tonro', 14, 'Squar'),
(9, 3, 'Tonro', 18, 'Sharp'),
(10, 1, 'Hajakiro', 18, 'Circle'),
(10, 2, 'Tonro', 33, 'Circle'),
(10, 3, 'Tonro', 24, 'Author');

insert into Text_Effects (Text_ID, Effect_ID) values (1,3), (1,9), (1,11), (2,11), (2,8), (3,1), (3,2), (4,5), (4,4), (5, 5), (5,2), (6,2), (6,8);