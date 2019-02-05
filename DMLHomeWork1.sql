

 --1․Ստեղծել բազա
 CREATE DATABASE  UltimateFightingChampionship 
 USE UltimateFightingChampionship


 --2․Ստեղծել "Freestyle" table, որը պետք է ունենա մինիմում 10 column,
   -- որից միայն 5-6ն է հենց table ստեղծելու ժամանակ տրվում (ցանկալի է տարբեր տիպեր օգտագործել) 

IF OBJECT_ID('MixedMartialArtist') IS NOT NULL
 DROP TABLE MixedMartialArtist

 CREATE TABLE MixedMartialArtist
 (
	Id INT NOT NULL IDENTITY,
	Age TINYINT CHECK(Age >0 AND Age < 130),
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(15) NOT NULL,
	Nickname VARCHAR(20),
	Nationality VARCHAR(15) 
 )


 --3.Փոփոխել table-ը և ավելացնել մնացած column-երը միանգամից (multiple) 
 ALTER TABLE MixedMartialArtist
 ADD [Height] TINYINT DEFAULT 0,
     [Weight] TINYINT DEFAULT 0,
	 [Division] CHAR(10)	
--------------------------------------
 --4.Փոփոխել column-երից մի քանիսը
ALTER TABLE MixedMartialArtist
ALTER COLUMN [HEIGHT] INT 

ALTER TABLE MixedMartialArtist
ALTER COLUMN [Weight] INT

ALTER TABLE MixedMartialArtist
ALTER COLUMN [Division] VARCHAR(15)
 
ALTER TABLE MixedMartialArtist
ADD PRIMARY KEY(Id)

ALTER TABLE MixedMartialArtist
ADD CONSTRAINT DF_MixedMartialArtist_Nick DEFAULT 'UNKNOWN' FOR Nickname

ALTER TABLE MixedMartialArtist
DROP DF_MixedMartialArtist_Nick
---------------------------------
 INSERT MixedMartialArtist
 VALUES
 (30,'Khabib','Nurmagomedov',DEFAULT,'American',178,70,'Welterweight'),
 (34,'Tony','Ferguson','El Cucuy','American',180,70,'Welterweight'),
 (36,'Tyron','Woodley','TheChosenOneTWood','American',175,77,'Welterweight'),
 (30,'Conor','McGregor','TheNotoriousMystMac','Ireland',175,70,'Welterweight')


 --CREATE TABLE  MixedMartialArtsRecord 
 IF OBJECT_ID('MixedMartialArtsRecord') IS NOT NULL
 DROP TABLE MixedMartialArtsRecord
          
 CREATE TABLE MixedMartialArtsRecord
 (
	RecordId INT NOT NULL IDENTITY,
	TotalFight INT ,
	Wins TINYINT,
	Losses TINYINT,
 )

 ALTER TABLE MixedMartialArtsRecord
 ADD ArtistId INT UNIQUE 


 CREATE TABLE UFCChampions
 (
	ChampionID INT  IDENTITY(1,1),
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(15) NOT NULL,
	ArtistId INT UNIQUE FOREIGN KEY REFERENCES  MixedMartialArtist(Id)
 )


