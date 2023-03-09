DECLARE @dummy INT

-- Nemovitost adresy
MERGE INTO Adresa AS t
USING (SELECT  n.Id AS IdNemovitost,
			   n.CisloPopisne, 
			   n.CisloOrientacni, 
			   u.Id AS IdUlice,
			   m.Id AS IdMesto,
			   z.Id AS IdZeme
		FROM [$(NF1DB)].[dbo].Nemovitost n
			 JOIN Ulice u ON n.Ulice = u.Jmeno
			 JOIN Mesto m ON n.Mesto = m.Jmeno AND n.PSC = m.PSC
			 JOIN Zeme z ON n.Zeme = z.Jmeno) AS s
ON t.IdUlice = s.IdUlice 
	AND t.IdMesto = s.IdMesto 
	AND t.IdZeme = s.IdZeme
	AND t.CisloPopisne = s.CisloPopisne
	AND t.CisloOrientacni = s.CisloOrientacni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(IdUlice, IdMesto, CisloPopisne, CisloOrientacni, IdZeme)
	VALUES(s.IdUlice, s.IdMesto, CisloPopisne, s.CisloOrientacni, s.IdZeme)
OUTPUT s.IdNemovitost, inserted.Id
INTO #AdresaNemovitost (IdNemovitost, IdAdresa);

-- Prodejce adresy
MERGE INTO Adresa AS t
USING (SELECT  p.Id AS IdProdejce,
			   p.CisloPopisne, 
			   p.CisloOrientacni, 
			   u.Id AS IdUlice,
			   m.Id AS IdMesto,
			   z.Id AS IdZeme
		FROM [$(NF1DB)].[dbo].Prodejce p
			 JOIN Ulice u ON p.Ulice = u.Jmeno
			 JOIN Mesto m ON p.Mesto = m.Jmeno AND p.PSC = m.PSC
			 JOIN Zeme z ON p.Zeme = z.Jmeno) AS s
ON t.IdUlice = s.IdUlice 
	AND t.IdMesto = s.IdMesto 
	AND t.IdZeme = s.IdZeme
	AND t.CisloPopisne = s.CisloPopisne
	AND t.CisloOrientacni = s.CisloOrientacni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(IdUlice, IdMesto, CisloPopisne, CisloOrientacni, IdZeme)
	VALUES(s.IdUlice, s.IdMesto, CisloPopisne, s.CisloOrientacni, s.IdZeme)
OUTPUT s.IdProdejce, inserted.Id
INTO #AdresaProdejce (IdProdejce, IdAdresa);

-- Uzivatel adresy
MERGE INTO Adresa AS t
USING (SELECT  usr.Id AS IdUzivatel,
			   usr.CisloPopisne, 
			   usr.CisloOrientacni, 
			   u.Id AS IdUlice,
			   m.Id AS IdMesto,
			   z.Id AS IdZeme
		FROM [$(NF1DB)].[dbo].Uzivatel usr
			 JOIN Ulice u ON usr.Ulice = u.Jmeno
			 JOIN Mesto m ON usr.Mesto = m.Jmeno AND usr.PSC = m.PSC
			 JOIN Zeme z ON usr.Zeme = z.Jmeno) AS s
ON t.IdUlice = s.IdUlice 
	AND t.IdMesto = s.IdMesto 
	AND t.IdZeme = s.IdZeme
	AND t.CisloPopisne = s.CisloPopisne
	AND t.CisloOrientacni = s.CisloOrientacni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(IdUlice, IdMesto, CisloPopisne, CisloOrientacni, IdZeme)
	VALUES(s.IdUlice, s.IdMesto, CisloPopisne, s.CisloOrientacni, s.IdZeme)
OUTPUT s.IdUzivatel, inserted.Id
INTO #AdresaUzivatel (IdUzivatel, IdAdresa);

-- Vlastnik adresy
MERGE INTO Adresa AS t
USING (SELECT  v.Id AS IdVlastnik,
			   v.CisloPopisne, 
			   v.CisloOrientacni, 
			   u.Id AS IdUlice,
			   m.Id AS IdMesto,
			   z.Id AS IdZeme
		FROM [$(NF1DB)].[dbo].Vlastnik v
			 JOIN Ulice u ON v.Ulice = u.Jmeno
			 JOIN Mesto m ON v.Mesto = m.Jmeno AND v.PSC = m.PSC
			 JOIN Zeme z ON v.Zeme = z.Jmeno) AS s
ON t.IdUlice = s.IdUlice 
	AND t.IdMesto = s.IdMesto 
	AND t.IdZeme = s.IdZeme
	AND t.CisloPopisne = s.CisloPopisne
	AND t.CisloOrientacni = s.CisloOrientacni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(IdUlice, IdMesto, CisloPopisne, CisloOrientacni, IdZeme)
	VALUES(s.IdUlice, s.IdMesto, CisloPopisne, s.CisloOrientacni, s.IdZeme)
OUTPUT s.IdVlastnik, inserted.Id
INTO #AdresaVlastnik (IdVlastnik, IdAdresa);