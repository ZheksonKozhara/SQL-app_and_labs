USE Library;

CREATE TABLE PublishingHouse
    (PublishingHouse_id INT IDENTITY 
	CONSTRAINT PublishingHousePrimary PRIMARY KEY,
	PublishingHouse_name VARCHAR(40) NOT NULL
	);

CREATE TABLE Magazine
    (Magazine_id INT IDENTITY 
	CONSTRAINT MagazinePrimary PRIMARY KEY,
	Magazine_ISSN INT NOT NULL,
	Magazine_name VARCHAR(40) NOT NULL,
	PublishingHouse_id INT,
	CONSTRAINT MagazinePublishingHouseForeign FOREIGN KEY (PublishingHouse_id) REFERENCES PublishingHouse ON DELETE CASCADE
	);

CREATE TABLE Release
    (Release_id INT IDENTITY 
	CONSTRAINT ReleasePrimary PRIMARY KEY,
	Release_name VARCHAR(40) NOT NULL,
	Release_number INT NOT NULL
	CONSTRAINT ReleaseNumberCheck CHECK(Release_number>0),
	Release_quantity_pages INT NOT NULL
	CONSTRAINT ReleaseQuantityCheck CHECK(Release_quantity_pages>0),
	Release_year INT NOT NULL
	CONSTRAINT ReleaseYearCheck CHECK(Release_year BETWEEN 1990 AND YEAR(GETDATE())),
	Magazine_id INT,
	CONSTRAINT ReleaseMagazineForeign FOREIGN KEY (Magazine_id) REFERENCES Magazine ON DELETE CASCADE
	);

CREATE TABLE Section
    (Section_id INT IDENTITY 
	CONSTRAINT SectionPrimary PRIMARY KEY,
	Section_name VARCHAR(40) NOT NULL,
	Release_id INT,
	CONSTRAINT SectionReleaseForeign FOREIGN KEY (Release_id) REFERENCES Release ON DELETE CASCADE
	);

CREATE TABLE Author
    (Author_id INT IDENTITY 
	CONSTRAINT AuthorPrimary PRIMARY KEY,
	Author_name VARCHAR(40) NOT NULL
	);

CREATE TABLE Publication
    (Publication_id INT IDENTITY 
	CONSTRAINT PublicationPrimary PRIMARY KEY,
	Publication_name VARCHAR(40) NOT NULL,
	Publication_date DATETIME NOT NULL
	CONSTRAINT PublicationDateCheck CHECK(Publication_date<=GETDATE()),
	Publication_page_start INT NOT NULL
	CONSTRAINT PublicationPageStartCheck CHECK(Publication_page_start>0),
	Publication_page_end INT NOT NULL
	CONSTRAINT PublicationPageEndCheck CHECK(Publication_page_end>0),
	Section_id INT,
	CONSTRAINT PublicationSectionForeign FOREIGN KEY (Section_id) REFERENCES Section ON DELETE CASCADE,
	Author_id INT,
	CONSTRAINT PublicationAuthorForeign FOREIGN KEY (Author_id) REFERENCES Author ON DELETE CASCADE
	);



CREATE TABLE Article
    (Article_id INT IDENTITY 
	CONSTRAINT ArticlePrimary PRIMARY KEY,
	Article_name VARCHAR(40) NOT NULL,
	Publication_id INT,
	CONSTRAINT ArticlePublicationForeign FOREIGN KEY (Publication_id) REFERENCES Publication ON DELETE CASCADE
	);


USE Library;

INSERT INTO PublishingHouse(PublishingHouse_name) VALUES('Media');
INSERT INTO PublishingHouse(PublishingHouse_name) VALUES('Logos');


INSERT INTO Magazine(Magazine_ISSN,Magazine_name,PublishingHouse_id) VALUES(35689040,'SportsUA',1);
INSERT INTO Magazine(Magazine_ISSN,Magazine_name,PublishingHouse_id) VALUES(67843560,'Okino',1);
INSERT INTO Magazine(Magazine_ISSN,Magazine_name,PublishingHouse_id) VALUES(35575003,'ITUkraine',2);
INSERT INTO Magazine(Magazine_ISSN,Magazine_name,PublishingHouse_id) VALUES(25253607,'Music1',2);


INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballJanuary',1,89,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballFebruary',2,79,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballMarch',3,80,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballApril',4,84,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballMay',5,56,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballSeptember',6,67,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballOctober',7,68,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('FootballNovember',8,55,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('BiathlonDecember',9,56,2015,1);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('1995',1,54,1995,2);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('2000',2,80,2000,2);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('2005',3,55,2005,2);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('2010',4,67,2010,2);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('2015',5,49,2015,2);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('Review2014',1,53,2014,3);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('Review2015',2,50,2015,3);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('Dance',1,50,2015,4);
INSERT INTO Release(Release_name,Release_number,Release_quantity_pages,Release_year,Magazine_id) VALUES('Pop',2,63,2015,4);


INSERT INTO Section(Section_name,Release_id) VALUES('England',1);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',1);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',1);
INSERT INTO Section(Section_name,Release_id) VALUES('England',2);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',2);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',2);
INSERT INTO Section(Section_name,Release_id) VALUES('England',3);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',3);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',3);
INSERT INTO Section(Section_name,Release_id) VALUES('England',4);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',4);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',4);
INSERT INTO Section(Section_name,Release_id) VALUES('England',5);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',5);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',5);
INSERT INTO Section(Section_name,Release_id) VALUES('England',6);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',6);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',6);
INSERT INTO Section(Section_name,Release_id) VALUES('England',7);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',7);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',7);
INSERT INTO Section(Section_name,Release_id) VALUES('England',8);
INSERT INTO Section(Section_name,Release_id) VALUES('Spain',8);
INSERT INTO Section(Section_name,Release_id) VALUES('Ukraine',8);
INSERT INTO Section(Section_name,Release_id) VALUES('Спринт',9);
INSERT INTO Section(Section_name,Release_id) VALUES('Гонка преследования',9);
INSERT INTO Section(Section_name,Release_id) VALUES('Масс-старт',9);
INSERT INTO Section(Section_name,Release_id) VALUES('Comedy',10);
INSERT INTO Section(Section_name,Release_id) VALUES('Fantasy',10);
INSERT INTO Section(Section_name,Release_id) VALUES('Comedy',11);
INSERT INTO Section(Section_name,Release_id) VALUES('Fantasy',11);
INSERT INTO Section(Section_name,Release_id) VALUES('Comedy',12);
INSERT INTO Section(Section_name,Release_id) VALUES('Fantasy',12);
INSERT INTO Section(Section_name,Release_id) VALUES('Comedy',13);
INSERT INTO Section(Section_name,Release_id) VALUES('Fantasy',13);
INSERT INTO Section(Section_name,Release_id) VALUES('Comedy',14);
INSERT INTO Section(Section_name,Release_id) VALUES('Fantasy',14);
INSERT INTO Section(Section_name,Release_id) VALUES('Бази даних',15);
INSERT INTO Section(Section_name,Release_id) VALUES('СУБД',15);
INSERT INTO Section(Section_name,Release_id) VALUES('Frontend',15);
INSERT INTO Section(Section_name,Release_id) VALUES('Бази даних',16);
INSERT INTO Section(Section_name,Release_id) VALUES('СУБД',16);
INSERT INTO Section(Section_name,Release_id) VALUES('Frontend',16);
INSERT INTO Section(Section_name,Release_id) VALUES('All',17);
INSERT INTO Section(Section_name,Release_id) VALUES('UaTop',17);
INSERT INTO Section(Section_name,Release_id) VALUES('All',18);
INSERT INTO Section(Section_name,Release_id) VALUES('UaTop',18);



INSERT INTO Author(Author_name) VALUES('Kozhara Ugen');
INSERT INTO Author(Author_name) VALUES('Narolskiy Illya');
INSERT INTO Author(Author_name) VALUES('Alves Dani');
INSERT INTO Author(Author_name) VALUES('Alba Jordi');



INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Lester&MU','20150125 10:00:00',4,34,1,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Liverpool&MC','20150127 10:00:00',35,41,1,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCDeportivo','20150125 10:00:00',42,55,2,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCOsasuna','20150129 10:00:00',56,63,2,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('15TUR','20150128 10:00:00',64,86,3,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('ВанГальщина','20150225 10:00:00',4,24,4,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Челси на дне','20150227 10:00:00',25,41,4,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCB','20150225 10:00:00',42,55,5,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCRS','20150225 10:00:00',56,63,5,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('16-18TUR','20150228 10:00:00',64,76,6,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('МС на вершине','20150325 10:00:00',4,24,7,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('МЮ снова не забивает','20150327 10:00:00',25,41,7,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Реал снова проигрывает','20150325 10:00:00',42,55,8,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCOsasuna','20150329 10:00:00',56,63,8,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('19-21TUR','20150328 10:00:00',64,77,9,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Lester-TOP','20150425 10:00:00',4,41,10,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCТ','20150425 10:00:00',42,63,11,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('22-23TUR','20150428 10:00:00',64,80,12,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('MC-TOP','20150525 10:00:00',4,21,13,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCEV','20150525 10:00:00',22,43,14,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('24-26TUR','20150528 10:00:00',44,53,15,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Lester-TOP','20150925 10:00:00',4,31,16,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('FCL','20150925 10:00:00',32,43,17,4);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('27-28TUR','20150928 10:00:00',44,63,18,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Reviews','20151025 10:00:00',4,41,19,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Champ!','20151125 10:00:00',4,41,22,3);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Пидгрушна побеждает!','20151220 10:00:00',4,21,25,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Абрамова побеждает!','20151215 10:00:00',43,53,27,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','19951225 10:00:00',4,21,28,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','19951225 10:00:00',4,21,29,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20001225 10:00:00',4,21,30,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20001225 10:00:00',4,21,31,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20051225 10:00:00',4,21,32,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20051225 10:00:00',4,21,33,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20101225 10:00:00',4,21,34,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20101225 10:00:00',4,21,35,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20151215 10:00:00',4,21,36,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Films','20151215 10:00:00',4,21,37,2);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('RR','20141225 10:00:00',4,21,38,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('New','20141226 10:00:00',4,21,39,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('GULP','20141227 10:00:00',4,21,40,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('RR','20151215 10:00:00',4,21,41,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('New','20151216 10:00:00',4,21,42,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('LiveReload','20151217 10:00:00',4,21,43,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Top','20151216 10:00:00',4,21,44,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Top','20151217 10:00:00',4,21,45,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Top','20151216 10:00:00',4,21,46,1);
INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) VALUES('Top','20151217 10:00:00',4,21,47,1);


INSERT INTO Article(Article_name,Publication_id) VALUES('New',1);
INSERT INTO Article(Article_name,Publication_id) VALUES('Top',1);
INSERT INTO Article(Article_name,Publication_id) VALUES('Rtl',2);
INSERT INTO Article(Article_name,Publication_id) VALUES('Both',2);
INSERT INTO Article(Article_name,Publication_id) VALUES('Mau',3);
INSERT INTO Article(Article_name,Publication_id) VALUES('1',3);
INSERT INTO Article(Article_name,Publication_id) VALUES('5',4);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',5);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',6);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',7);
INSERT INTO Article(Article_name,Publication_id) VALUES('Row',8);
INSERT INTO Article(Article_name,Publication_id) VALUES('Again',9);
INSERT INTO Article(Article_name,Publication_id) VALUES('Cool',10);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',11);
INSERT INTO Article(Article_name,Publication_id) VALUES('Win',12);
INSERT INTO Article(Article_name,Publication_id) VALUES('Rol',13);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',14);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',14);
INSERT INTO Article(Article_name,Publication_id) VALUES('Both',15);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',16);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',17);
INSERT INTO Article(Article_name,Publication_id) VALUES('Kings',18);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',19);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',20);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',21);
INSERT INTO Article(Article_name,Publication_id) VALUES('Yeah',22);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',23);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',24);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',25);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',26);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',27);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',28);
INSERT INTO Article(Article_name,Publication_id) VALUES('TOp',29);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',30);
INSERT INTO Article(Article_name,Publication_id) VALUES('Good',31);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',32);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',33);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',37);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',40);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',41);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',42);
INSERT INTO Article(Article_name,Publication_id) VALUES('New',43);


USE Library; 

GO 
CREATE VIEW PublicationsBySection      
AS
SELECT Publication_name Публикация,Section_name Рубрика FROM Publication P,Section S
WHERE P.Section_id=S.Section_id;
GO
SELECT * FROM PublicationsBySection;
    


GO
CREATE VIEW NewPublications     
AS
SELECT Publication_name Публикация,YEAR(Publication_date) Год,Magazine_name Журнал,Author_name Автор FROM Publication P,Magazine M,Author A,Section S,Release R
WHERE A.Author_id=P.Author_id AND P.Section_id=S.Section_id AND S.Release_id=R.Release_id AND R.Magazine_id=M.Magazine_id AND YEAR(Publication_date)>2012;
GO
SELECT * FROM NewPublications;


GO 
CREATE VIEW PublicationsBySUBD     
AS
SELECT Publication_name Публикация,Section_name Раздел FROM Publication P,Section S
WHERE P.Section_id=S.Section_id AND (Section_name='Бази даних'OR Section_name='СУБД');
GO
SELECT * FROM PublicationsBySUBD;



GO 
CREATE VIEW SectionByQuantityPubl        
AS
SELECT Section_name Рубрика,count(Publication_id) КоличествоПубликаций
FROM Section S,Publication P
WHERE P.Section_id=S.Section_id
GROUP BY Section_name;
GO  

SELECT * FROM SectionByQuantityPubl;



USE Library  
GO
CREATE PROC PerevirkaPoStatti          
@Article_name VARCHAR(40) OUTPUT
AS
SELECT Magazine_ISSN, Article_name FROM Article A,Publication P,Section S,Release R,Magazine M
WHERE A.Publication_id=P.Publication_id AND P.Section_id=S.Section_id AND S.Release_id=R.Release_id AND R.Magazine_id=M.Magazine_id AND A.Article_name=@Article_name;

EXEC PerevirkaPoStatti 'Cool'; 

 
 
USE Library 
GO
CREATE TRIGGER UpdateSectionForPublication       
 ON Publication
 FOR UPDATE
 AS
IF EXISTS (SELECT  I.Section_id,D.Section_id FROM INSERTED I , DELETED D WHERE I.Section_id = D.Section_id OR I.Section_id<1)
BEGIN
 RAISERROR('Data must be changed correctly!',16,1)
 ROLLBACK TRAN
 END
 
 
UPDATE Publication SET Section_id = 5 WHERE Publication_id = 9


GO
CREATE TRIGGER UpdatePageNumbersForPublication      
 ON Publication
 FOR UPDATE
 AS
IF EXISTS (SELECT  I.Publication_page_start,I.Publication_page_end,D.Publication_page_start,D.Publication_page_end FROM INSERTED I,DELETED D WHERE (I.Publication_page_start = D.Publication_page_start AND I.Publication_page_end=D.Publication_page_end) OR I.Publication_page_start>=I.Publication_page_end)
BEGIN
 RAISERROR('Data must be changed correctly!',16,1)
 ROLLBACK TRAN
 END
 
 UPDATE Publication SET Publication_page_start = 70,Publication_page_end = 65 WHERE Publication_id=10
 

 
USE Library 
GO
CREATE TRIGGER ADDPublication    
ON Publication FOR INSERT,UPDATE
AS
IF EXISTS (SELECT 'TRUE'
 	     FROM Publication P,Section S,Release R
     WHERE P.Section_id=S.Section_id AND S.Release_id=R.Release_id AND (P.Publication_page_start>=R.Release_quantity_pages OR P.Publication_page_end>=R.Release_quantity_pages))
BEGIN
RAISERROR('Pages of publication can not be bigger than quantity of pages in release!',16,1)
ROLLBACK TRAN
END


INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) 
 VALUES('Success!','20150128 10:00:00',64,95,3,1) 
 

 
USE Library
GO
CREATE PROC Publications    
AS
SELECT Publication_name Публикация,Publication_page_start Начальная_стр_публ,Publication_page_end Конечная_стр_публ,Magazine_name Журнал,Release_number Номер_журнала FROM Publication P,Section S,Release R,Magazine M WHERE P.Section_id=S.Section_id AND S.Release_id=R.Release_id AND R.Magazine_id=M.Magazine_id;

EXEC Publications



USE Library
GO
CREATE PROC SectionsOfMagazines          
AS
SELECT Magazine_name Журнал,Section_name Раздел,sum (case when YEAR(Publication_date)<=2000 then 1 else 0 end) Публик_до_2000, sum (case when YEAR(Publication_date)>2000 then 1 else 0 end) Публик_после_2000
FROM Release R,Magazine M, Publication P,Section S
WHERE P.Section_id=S.Section_id AND S.Release_id=R.Release_id AND R.Magazine_id=M.Magazine_id
GROUP BY Magazine_name,Section_name; 

EXEC SectionsOfMagazines



USE Library 
GO
CREATE PROC QuantityOfReleases      
AS
SELECT Magazine_name Журнал,Release_year,count(Release_number) Количество_выпусков_за_год
FROM Release R,Magazine M
WHERE R.Magazine_id=M.Magazine_id
GROUP BY Magazine_name,Release_year; 

EXEC QuantityOfReleases



INSERT INTO Publication(Publication_name,Publication_date,Publication_page_start,Publication_page_end,Section_id,Author_id) 
 VALUES('Tolerto!','20151123 10:00:00',64,68,3,1) 
 