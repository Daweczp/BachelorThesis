/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--ALTER DATABASE [$(DatabaseName)] SET RECOVERY SIMPLE;

DECLARE @i BIGINT,
        @pocet_vlastniku BIGINT = 10000,
		@pocet_prodejcu BIGINT = 5000,
		@pocet_nemovitosti BIGINT = 10000000,		
		@multiplikator_nemovitost_aukce INT = 10,
		@multiplikator_prihozu_aukce = 50,
		
		@aktualni_pocet_nemovitosti BIGINT,
		@aktualni_pocet_aukci BIGINT

DECLARE @KrestniJmena TABLE (Id INT, Jmeno NVARCHAR(100))
:r .\Scripts\001_FirstNames.sql

DECLARE @PrijmeniJmena TABLE (Id INT, Prijmeni NVARCHAR(100))
:r .\Scripts\002_LastNames.sql

DECLARE @Adresy TABLE (Id BIGINT, Ulice NVARCHAR(100), PSC NVARCHAR(16),Mesto NVARCHAR(100),Kraj NVARCHAR(100),Zeme NVARCHAR(100), Okres NVARCHAR(100))
:r .\Scripts\003_Adresses.sql

DECLARE @Spolecnosti TABLE (Id BIGINT, ObchodniJmeno NVARCHAR(255), PravniForma NVARCHAR(20),IC NVARCHAR(20))
:r .\Scripts\004_Companies.sql

DECLARE @TypObjektu TABLE (Id INT PRIMARY KEY IDENTITY, Typ NVARCHAR(50), TypTypu NVARCHAR(50))
:r .\Scripts\005_ObjectTypes.sql

DECLARE @StavBudovy TABLE (Id INT PRIMARY KEY IDENTITY, Stav NVARCHAR(50))
:r .\Scripts\006_BuildingStates.sql

DECLARE @EnergetickaTrida TABLE (Id INT PRIMARY KEY IDENTITY, Trida NVARCHAR(50))
:r .\Scripts\007_EnergyClasses.sql


/* VYMAZ SOUCASNE DATABAZE */

DELETE FROM Prihoz
DELETE FROM Aukce
DELETE FROM Nemovitost
DELETE FROM Prodejce
DELETE FROM Uzivatel
DELETE FROM Vlastnik

DBCC CHECKIDENT ('Prihoz', RESEED, 0);
DBCC CHECKIDENT ('Aukce', RESEED, 0);
DBCC CHECKIDENT ('Nemovitost', RESEED, 0);
DBCC CHECKIDENT ('Prodejce', RESEED, 0);
DBCC CHECKIDENT ('Uzivatel', RESEED, 0);
DBCC CHECKIDENT ('Vlastnik', RESEED, 0);

/* PLNĚNÍ TABULKY VLASTNÍK */

PRINT N'Creating Vlastnik data';
INSERT INTO Vlastnik (Jmeno, 
					Prijmeni, 
					Ulice, 
					CisloPopisne, 
					CisloOrientacni,
					PSC,
					Mesto,
					Okres,
					Kraj,
					Zeme,
					Email1,
					Email2,
					Telefon1,
					Telefon2)
SELECT t.Jmeno,
	   t.Prijmeni,
	   t.Ulice,
	   t.CisloPopisne,
	   t.CisloOrientacni,
	   (SELECT TOP 1 PSC FROM @Adresy WHERE Mesto = t.Mesto ORDER BY NEWID()) AS PSC,
	   t.Mesto,
	   (SELECT TOP 1 Okres FROM @Adresy WHERE Mesto = t.Mesto) AS Okres,
	   (SELECT TOP 1 Kraj FROM @Adresy WHERE Mesto = t.Mesto) AS Kraj,
	   (SELECT TOP 1 Zeme FROM @Adresy WHERE Mesto = t.Mesto) AS Zeme,
	   t.Email1,
	   t.Email2,
	   t.Telefon1,
	   t.Telefon2
FROM (SELECT TOP(@pocet_vlastniku) j.Jmeno,
 			 p.Prijmeni,
			 (SELECT TOP 1 Ulice FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), j.Id))) AS Ulice,
			 ABS(CHECKSUM(NEWID(), j.Id)) % 998 + 1 AS CisloPopisne,
			 RIGHT('0000' + CAST(ABS(CHECKSUM(NEWID(), p.Id)) % 10000 AS VARCHAR(4)), 4) AS CisloOrientacni,			 
			 (SELECT TOP 1 Mesto FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), p.Id))) AS Mesto,			 
			 j.Jmeno + p.Prijmeni + '@email.com' AS Email1,
			 CASE WHEN p.Id % 3 = 0 THEN j.Jmeno + '@' + p.Prijmeni + '.eu' ELSE NULL END AS Email2,
			 '+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID())) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) Telefon1,
			 CASE WHEN j.Id % 4 = 0 THEN '+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID())) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) ELSE NULL END AS Telefon2
	FROM @KrestniJmena j CROSS JOIN @PrijmeniJmena p) AS T
ORDER BY NEWID() 

/* PLNĚNÍ TABULKY PRODEJCE */
PRINT N'Creating Prodejce data';

INSERT INTO Prodejce (Jmeno
					,Prijmeni
					,ObchodniJmeno
					,PravniForma
					,IC
					,Ulice
					,CisloPopisne
					,CisloOrientacni
					,PSC
					,Mesto
					,Okres
					,Kraj
					,Zeme
					,Email1
					,Email2
					,Telefon1
					,Telefon2)
SELECT t.Jmeno,
	   t.Prijmeni,
	   t.ObchodniJmeno,
	   t.PravniForma,
	   t.IC,
	   t.Ulice,
	   t.CisloPopisne,
	   t.CisloOrientacni,
	   (SELECT TOP 1 PSC FROM @Adresy WHERE Mesto = t.Mesto ORDER BY NEWID()) AS PSC,
	   t.Mesto,
	   (SELECT TOP 1 Okres FROM @Adresy WHERE Mesto = t.Mesto) AS Okres,
	   (SELECT TOP 1 Kraj FROM @Adresy WHERE Mesto = t.Mesto) AS Kraj,
	   (SELECT TOP 1 Zeme FROM @Adresy WHERE Mesto = t.Mesto) AS Zeme,
	   t.Email1,
	   t.Email2,
	   t.Telefon1,
	   t.Telefon2
FROM(SELECT TOP(@pocet_prodejcu) 
			CASE WHEN j.id % 8 = 0 THEN j.Jmeno ELSE NULL END AS Jmeno,
			CASE WHEN j.id % 8 = 0 THEN p.Prijmeni ELSE NULL END AS Prijmeni,

			CASE WHEN j.id % 8 = 0 THEN NULL ELSE (SELECT TOP 1 ObchodniJmeno FROM @Spolecnosti ORDER BY ABS(CHECKSUM(NEWID(), j.Id))) END AS ObchodniJmeno,
			CASE WHEN j.id % 8 = 0 THEN 'Fyzická osoba' ELSE (SELECT TOP 1 PravniForma FROM @Spolecnosti ORDER BY ABS(CHECKSUM(NEWID(), p.Id))) END AS PravniForma,
			CASE WHEN j.id % 8 = 0 THEN NULL ELSE (SELECT TOP 1 IC FROM @Spolecnosti ORDER BY ABS(CHECKSUM(NEWID(), j.Id))) END AS IC,

			(SELECT TOP 1 Ulice FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), p.Id))) AS Ulice,
			ABS(CHECKSUM(NEWID(), j.Id)) % 998 + 1 AS CisloPopisne,
			RIGHT('0000' + CAST(ABS(CHECKSUM(NEWID(), p.Id)) % 10000 AS VARCHAR(4)), 4) AS CisloOrientacni,
			(SELECT TOP 1 Mesto FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), j.Id))) AS Mesto,
			CASE WHEN j.id % 8 = 0 THEN j.Jmeno + p.Prijmeni + '@email.com' ELSE 'company@co' + CAST(p.Id AS NVARCHAR) + 'co' END AS Email1,
			NULL AS Email2,
			'+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID(), j.Id)) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) Telefon1,
			CASE WHEN j.Id % 4 = 0 THEN '+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID(), p.Id)) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) ELSE NULL END AS Telefon2
	FROM @KrestniJmena j CROSS JOIN @PrijmeniJmena p
	WHERE NOT EXISTS(SELECT 1 
						FROM Vlastnik v
						WHERE v.Jmeno = j.Jmeno
							AND v.Prijmeni = p.Prijmeni)) AS T
ORDER BY NEWID()

/* PLNĚNÍ TABULKY UZIVATEL */
PRINT N'Creating Uzivatel data';
INSERT INTO dbo.Uzivatel (Login
						,Heslo
						,Jmeno
						,Prijmeni
						,Ulice
						,CisloPopisne
						,CisloOrientacni
						,PSC
						,Mesto
						,Okres
						,Kraj
						,Zeme
						,Email1
						,Email2
						,Telefon1
						,Telefon2)
SELECT t.login,
	   t.heslo,
	   t.Jmeno,
	   t.Prijmeni,
	   t.Ulice,
	   t.CisloPopisne,
	   t.CisloOrientacni,
	   (SELECT TOP 1 PSC FROM @Adresy WHERE Mesto = t.Mesto ORDER BY NEWID()) AS PSC,
	   t.Mesto,
	   (SELECT TOP 1 Okres FROM @Adresy WHERE Mesto = t.Mesto) AS Okres,
	   (SELECT TOP 1 Kraj FROM @Adresy WHERE Mesto = t.Mesto) AS Kraj,
	   (SELECT TOP 1 Zeme FROM @Adresy WHERE Mesto = t.Mesto) AS Zeme,
	   t.Email1,
	   t.Email2,
	   t.Telefon1,
	   t.Telefon2
FROM (SELECT t1.login AS login,
			   CONVERT(NVARCHAR(32), HASHBYTES('MD5', t1.login), 2) AS heslo,
			   t1.Jmeno,
			   t1.Prijmeni,
			   (SELECT TOP 1 Ulice FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), t1.IdJ))) AS Ulice,
			   ABS(CHECKSUM(NEWID(), t1.IdP)) % 998 + 1 AS CisloPopisne,
			   RIGHT('0000' + CAST(ABS(CHECKSUM(NEWID(), t1.IdJ)) % 10000 AS VARCHAR(4)), 4) AS CisloOrientacni,
			   (SELECT TOP 1 Mesto FROM @Adresy ORDER BY ABS(CHECKSUM(NEWID(), t1.IdP))) AS Mesto,
			   t1.Jmeno + t1.Prijmeni + '@email.com' AS Email1,
			   CASE WHEN t1.IdJ % 3 = 0 THEN t1.Jmeno + '@' + t1.Prijmeni + '.eu' ELSE NULL END AS Email2,
			   '+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID(), t1.IdJ)) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) Telefon1,
			   CASE WHEN t1.IdP % 4 = 0 THEN '+420 ' + STUFF(CAST(ABS(CHECKSUM(NEWID(), t1.IdP)) % 900000 + 100000 AS VARCHAR(6)), 4, 0, CHAR(32)) ELSE NULL END AS Telefon2
		FROM (SELECT SUBSTRING(REPLACE(CAST(NEWID() AS nvarchar(36)), '-', ''), 1, ABS(CHECKSUM(NEWID(), j.Id)) % 39 + 10) AS login,
					 j.Jmeno,
					 p.Prijmeni,
					 j.Id as IdJ,
					 p.Id as IdP
			   FROM @KrestniJmena j CROSS JOIN @PrijmeniJmena p
			   WHERE NOT EXISTS(SELECT 1
		  						FROM (SELECT Jmeno, Prijmeni
									  FROM Prodejce prod
									  WHERE prod.Jmeno IS NOT NULL
							  				AND prod.Prijmeni IS NOT NULL
									   UNION ALL
									   SELECT Jmeno, Prijmeni
									   FROM Vlastnik vlas
									   WHERE vlas.Jmeno IS NOT NULL
											 AND vlas.Prijmeni IS NOT NULL) t
								WHERE t.Jmeno = j.Jmeno
									  AND t.Prijmeni = p.Prijmeni)
				) t1) AS t
ORDER BY NEWID()

/* PLNĚNÍ TABULKY NEMOVITOST */
PRINT N'Creating Nemovitost data';

SELECT @aktualni_pocet_nemovitosti = COUNT_BIG(1) FROM Nemovitost
WHILE @aktualni_pocet_nemovitosti < @pocet_nemovitosti
BEGIN
	INSERT INTO Nemovitost (TypObjektu
							,TypTypuObjektu
							,Parkovani
							,Ulice
							,PSC
							,Mesto
							,Okres
							,Kraj
							,Zeme)
	SELECT tObjc.Typ AS TypObjektu,
			tObjc.TypTypu AS TypTypuObjektu,
			CAST(CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 0 ELSE 1 END AS BIT) AS Parkovani,
			adr.Ulice,
			adr.PSC,
			adr.Mesto,
			adr.Okres,
			adr.Kraj,
			adr.Zeme
	FROM @TypObjektu tObjc
			CROSS JOIN @Adresy adr

	SET @aktualni_pocet_nemovitosti += @@ROWCOUNT
END

PRINT N'Updating Nemovitost stav';
-- doplním pro nepozemky číslo popisná, orientační, stav nemovitosti a energetickou třídu
UPDATE t
SET t.CisloPopisne = t1.CisloPopisne,
	t.CisloOrientacni = t1.CisloOrientacni,
	Stav = (SELECT TOP 1 Stav FROM @StavBudovy ORDER BY ABS(CHECKSUM(NEWID(), Id))),
	EnergetickaNarocnost = (SELECT TOP 1 Trida FROM @EnergetickaTrida ORDER BY ABS(CHECKSUM(NEWID(), Id)))
FROM Nemovitost t
	 JOIN(SELECT n.Id,
			     ng.*,
			     ROW_NUMBER() OVER (ORDER BY n.Id DESC) AS CisloPopisne,
			     ROW_NUMBER() OVER (ORDER BY n.Id ASC) AS CisloOrientacni
		  FROM Nemovitost n
			   JOIN (SELECT n1.Ulice, 
				  		    n1.PSC,
						    n1.TypObjektu
				     FROM Nemovitost n1
					 WHERE n1.TypObjektu != 'Pozemek'
				     GROUP BY n1.Ulice, n1.PSC, n1.TypObjektu, n1.TypTypuObjektu) ng ON n.Ulice = ng.Ulice 
																					    AND n.PSC = ng.PSC
																					    AND n.TypObjektu = ng.TypObjektu
		  WHERE n.TypObjektu != 'Pozemek') AS t1 on t.Id = t1.Id
WHERE t.TypObjektu != 'Pozemek'

/* PLNĚNÍ TABULKY AUKCE */

DECLARE @nemovitostFrom INT = 0,
	    @nemovitostStep INT = 1000000

SET @i = 0
SELECT @aktualni_pocet_nemovitosti = COUNT_BIG(1) FROM Nemovitost

ALTER TABLE Aukce NOCHECK CONSTRAINT FK_Aukce_Nemovitost;
ALTER TABLE Aukce NOCHECK CONSTRAINT FK_Aukce_Prodejce;
ALTER TABLE Aukce NOCHECK CONSTRAINT FK_Aukce_Vlastnik;

WHILE @i < @multiplikator_nemovitost_aukce
BEGIN
	PRINT CAST((@i+1) AS VARCHAR) + '. iterace nemovitosti z ' + CAST(@multiplikator_nemovitost_aukce AS VARCHAR)
	WHILE @nemovitostFrom < @aktualni_pocet_nemovitosti
	BEGIN
		INSERT INTO Aukce WITH (TABLOCKX) (IdNemovitost
									       ,IdProdejce
									       ,IdVlastnik
									       ,Nazev
									       ,DatumZacatek
									       ,CasZacatek
									       ,DatumKonec
									       ,CasKonec
									       ,MinimalniPrihoz
									       ,PocatecniCena)
		SELECT t2.IdNemovitost,	

			   t2.IdProdejce,
			   t2.IdVlastník,
			   t2.Nazev,
			   t2.DatumZacatek,
			   t2.CasZacatek,

			   DATEADD(day,  t2.RandomValue * 30, t2.DatumZacatek) AS DatumKonec,
			   t2.CasKonec,

			   t2.MinimalniPrihoz,
			   t2.PocatecniCena	
		FROM (
			SELECT t1.IdNemovitost,
				   
				   (SELECT TOP 1 Id FROM Prodejce /*ORDER BY ABS(CHECKSUM(NEWID(), t1.RandomValue))*/) AS IdProdejce,
				   (SELECT TOP 1 Id FROM Vlastnik /*ORDER BY ABS(CHECKSUM(NEWID(), t1.RandomValue))*/) AS IdVlastník,

				   'Aukce_' + CAST(t1.RowNumber AS NVARCHAR(255)) AS Nazev,
				   CAST(DATEADD(DAY, ABS(CHECKSUM(t1.RandomValue)) % DATEDIFF(DAY, '19000101', GETDATE()), '19000101') AS DATE) as DatumZacatek,
				   CAST(DATEADD(MINUTE, ABS(CHECKSUM(t1.RandomValue)) % 86400000, '00:00:00') AS TIME) AS CasZacatek,

				   CAST(DATEADD(MINUTE, ABS(CHECKSUM(t1.RandomValue)) % 86400000, '00:00:00') AS TIME) AS CasKonec,
		   
				   CAST(ROUND(((100000 - 50000) * t1.RandomValue + 50000), 0) AS DECIMAL(18,2)) AS MinimalniPrihoz,
				   CAST(ROUND(((100000000 - 700000) * t1.RandomValue + 700000), 0) AS DECIMAL(18,2)) AS PocatecniCena,

				   t1.RandomValue
			FROM (SELECT n.Id AS IdNemovitost,
						 RAND(CHECKSUM(NEWID(), n.Id)) AS RandomValue,
						 ROW_NUMBER() OVER (ORDER BY n.Id) AS RowNumber
				  FROM Nemovitost n) AS t1
			WHERE t1.RowNumber BETWEEN @nemovitostFrom AND @nemovitostFrom + @nemovitostStep
		) t2

		SET @nemovitostFrom += @nemovitostStep + 1
	END
	PRINT @i
	SET @i += 1
	SET @nemovitostFrom = 0
END

PRINT N'Updting aukce data';

UPDATE Aukce
	SET IdProdejce = (SELECT TOP 1 Id FROM Prodejce ORDER BY ABS(CHECKSUM(NEWID(), Id))),
		IdVlastnik = (SELECT TOP 1 Id FROM Vlastnik ORDER BY ABS(CHECKSUM(NEWID(), Id)))
FROM Aukce

ALTER TABLE Aukce WITH CHECK CHECK CONSTRAINT FK_Aukce_Nemovitost;
ALTER TABLE Aukce WITH CHECK CHECK CONSTRAINT FK_Aukce_Prodejce;
ALTER TABLE Aukce WITH CHECK CHECK CONSTRAINT FK_Aukce_Vlastnik;


/* PLNĚNÍ TABULKY PRIHOZ */

--ALTER DATABASE [$(DatabaseName)] SET RECOVERY FULL;