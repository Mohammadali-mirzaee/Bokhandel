Create database Bokhandel;

CREATE TABLE Böcker(
    ISBN13 bigint Primary Key,
    Titel nvarchar(100),
    Språk nvarchar(20),
    Pris int,
    Utgivningsdatum date
)

CREATE TABLE Författare(
    ID int PRIMARY KEY,
    Förnamn nvarchar(30),
    Efternamn nvarchar(30),
    Födelsedatum date,
)

create table FörfattareBöcker(
    FörfattareID int,
    ISBN bigint 
	Primary Key(FörfattareID, ISBN),
)


Create table Butiker(
    ID int Primary Key,
    ButikNamn nvarchar(30),
    ButikAdress nvarchar(30),
)

Create table LagerSaldo(
    ButikID int,
    ISBN bigint,
    Antal int,
    Primary Key(ButikID, ISBN),
    FOREIGN KEY (ISBN) REFERENCES Böcker(ISBN13)
)

Create table Kunder(
    ID int Primary Key,
    Namn nvarchar(30),
    Email nvarchar(30)
)

Create table Recensioner(
    ID int Primary Key,
    KundID int,
    ISBN bigint,
    Beskrivning nvarchar(120)
)

Create table OrderHuvud(
    ID int Primary Key,
    KundID int,    
    OrderDatum date,
    FraktAdress nvarchar(30),
    FraktLand nvarchar(30),
    FraktStad nvarchar(30)
    FOREIGN KEY (KundID) REFERENCES Kunder(ID)
)

Create table OrderRader(
    ID int Primary Key,
    OrderID int,
    ISBN bigint,
    Pris int,
    Antal int,
    FOREIGN KEY (OrderID) REFERENCES OrderHuvud(ID)
)

-- Demo Data
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9789178870776,'Koll på diabetes typ 2','Svenska',229,'2021-03-09'); --Kerstin brismar--
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9789175039701,'Blodsockerkoll på 8 veckor med Michael Mosley : snabba resultat på både diabetes och övervikt','Svenska',69,'2019-08-13'); --Kerstin brismar--
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9789113102351,'Lev länge & väl : professorns bästa tips om kosten, motionen och sömnen','Svenska',219,'2020-11-05'); --Kerstin brismar--
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9780777771952,'SIGNERAD Jennys sommar','Svenska',209,'2021-04-27');--Jenny Warsén  --
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9789178871001,'Snabbt, gott och billigt!','Svenska',139,'2020-07-29'); --Jenny Warsén  --
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9789174247947,'Middagstipset : Recept från Jennys matblogg','Svenska',209,'2018-08-21'); --Jenny Warsén  --
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9781510746275,'Quick & Easy Dinner Solutions','Engelska',194,'2021-08-01'); --Jenny Warsén  --
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9781472154668,'Where the Crawdads Sing','Engelska',61,' 2019-12-12'); --Delia Owens--
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9780544341647,'Cry of the Kalahari','Engelska',223,'2014-04-22'); --Delia Owens--
INSERT INTO Böcker(ISBN13,Titel,Språk,Pris,Utgivningsdatum) values(9788205545250,'Jubeldrøm & Balubasøm; Jubel & Baluba','Norska',366,'2021-03-09'); --Ane Sund-- 

INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(1,9789178870776,5);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(2,9789175039701,8);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(3,9789113102351,3);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(1,9780777771952,15);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(2,9789178871001,18);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(3,9789174247947,21);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(1,9781510746275,19);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(2,9781472154668,2);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(3,9780544341647,49);
INSERT INTO LagerSaldo(ButikID,ISBN,Antal) values(1,9788205545250,3);

INSERT INTO Författare(ID,Förnamn,Efternamn,Födelsedatum) values(1,'Kerstin','Brismar','1989-06-24');
INSERT INTO Författare(ID,Förnamn,Efternamn,Födelsedatum) values(2,'Jenny','Warsén','1979-03-14');
INSERT INTO Författare(ID,Förnamn,Efternamn,Födelsedatum) values(3,'Delia','Owens','1968-02-12');
INSERT INTO Författare(ID,Förnamn,Efternamn,Födelsedatum) values(4,'Ane','Sund','1978-03-29');

insert into FörfattareBöcker (FörfattareID,ISBN) values(1,9789178870776)
insert into FörfattareBöcker (FörfattareID,ISBN) values(1,9789113102351)
insert into FörfattareBöcker (FörfattareID,ISBN) values(2,9781510746275)
insert into FörfattareBöcker (FörfattareID,ISBN) values(2,9789178871001)
insert into FörfattareBöcker (FörfattareID,ISBN) values(3,9788205545250)
insert into FörfattareBöcker (FörfattareID,ISBN) values(3,9780544341647)
insert into FörfattareBöcker (FörfattareID,ISBN) values(4,9789174247947)

INSERT INTO Butiker(ID,ButikNamn,ButikAdress) values(1,'Adlibris','contact@adlibris.com');
INSERT INTO Butiker(ID,ButikNamn,ButikAdress) values(2,'Bokhandel','support@akademibokhandeln.se');
INSERT INTO Butiker(ID,ButikNamn,ButikAdress) values(3,'Bokus','info@bokus.com');

INSERT INTO Recensioner(ID,KundID,ISBN,Beskrivning) values(1,1,9789175039701,'En vindlande roman som är helt och hållet värd alla lovord som regnat över den ifrån nästan samtliga recensenter!');
INSERT INTO Recensioner(ID,KundID,ISBN,Beskrivning) values(2,1,9780777771952,'Underbar roman som utspelar sig i universitets- och förlagsvärlden i Göteborg.');

INSERT INTO Kunder(ID, Namn, Email) values(1, 'Fia', 'fia93@gmail.com');
INSERT INTO Kunder(ID, Namn, Email) values(2, 'Las', 'lasls@gmail.com');

INSERT INTO OrderHuvud(ID,KundID,OrderDatum,FraktAdress,FraktLand,FraktStad) values(1,1,'2020-03-23','Leavägen','Sverige', 'Stockholm');
INSERT INTO OrderHuvud(ID,KundID,OrderDatum,FraktAdress,FraktLand,FraktStad) values(2,2,'2020-03-23','Vägen','Sverige', 'Malmö');

INSERT INTO OrderRader(ID,OrderID,ISBN,Pris,Antal) values(1,1,9789178870776,229,1);
INSERT INTO OrderRader(ID,OrderID,ISBN,Pris,Antal) values(2,1,9789113102351,219,2);

INSERT INTO OrderRader(ID,OrderID,ISBN,Pris,Antal) values(3,2,9788205545250,336,3);
INSERT INTO OrderRader(ID,OrderID,ISBN,Pris,Antal) values(4,2,9781472154668,61,2);

-- Realationen mellan Författare och Böcker many to many 
select * from 
    Författare f
    join FörfattareBöcker fb on F.ID = fb.FörfattareID
    join Böcker B on B.ISBN13 = fb.ISBN
order by F.Förnamn

Create VIEW TitlarPerFörfattare as 
select 
    Fe.Förnamn + ' ' +  Fe.Efternamn as Namn, 
    datediff(year, Fe.Födelsedatum, getdate()) as Ålder,
    count(B.Titel) as Titlar,
    concat(sum(B.Pris * L.Antal), ' kr') as LagerSaldo
from FörfattareBöcker F
join Böcker B on B.ISBN13 = F.ISBN 
join Författare Fe on Fe.ID = F.FörfattareID 
join LagerSaldo L on L.ISBN = B.ISBN13 WHERE F.FörfattareID = Fe.ID 
group By Förnamn, Efternamn, Födelsedatum

-- Detta hjälper bokhandeln att se hur många böcker varje kund har beställt och hur mycket pengar dem har slösat sammanlagt på alla böcker.
Create VIEW OrderPerKund as 
select 
    Namn as [Kund Namn],
    Email as [Kund Email],
    concat(sum(O.Antal), ' st') as [Beställda Böcker],
    concat(sum(O.Pris * O.Antal), ' kr') as [Spenderat Totalt]
from Kunder K
join OrderHuvud Oh on Oh.KundID = K.ID
join OrderRader O on O.OrderID = Oh.ID
group by Namn, Email

