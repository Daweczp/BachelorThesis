DECLARE @dummy INT

MERGE INTO Osoba AS t
USING (SELECT Id AS IdProdejce, 
			  Jmeno, 
			  Prijmeni 
	   FROM [$(NF1DB)].[dbo].Prodejce 
	   WHERE Jmeno IS NOT NULL AND Prijmeni IS NOT NULL) AS s
ON t.Jmeno = s.Jmeno AND t.Prijmeni = s.Prijmeni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(Jmeno, Prijmeni)
	VALUES(s.Jmeno, s.Prijmeni)
OUTPUT s.IdProdejce, inserted.Id
INTO #OsobaProdejce (IdProdejce, IdOsoba);

MERGE INTO Osoba AS t
USING (SELECT Id AS IdUzivatel, Jmeno, Prijmeni FROM [$(NF1DB)].[dbo].Uzivatel) AS s
ON t.Jmeno = s.Jmeno AND t.Prijmeni = s.Prijmeni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(Jmeno, Prijmeni)
	VALUES(s.Jmeno, s.Prijmeni)
OUTPUT s.IdUzivatel, inserted.Id
INTO #OsobaUzivatel (IdUzivatel, IdOsoba);

MERGE INTO Osoba AS t
USING (SELECT Id AS IdVlastnik, Jmeno, Prijmeni FROM [$(NF1DB)].[dbo].Vlastnik) AS s
ON t.Jmeno = s.Jmeno AND t.Prijmeni = s.Prijmeni
WHEN MATCHED THEN
		UPDATE SET @dummy = 0
WHEN NOT MATCHED THEN 
	INSERT(Jmeno, Prijmeni)
	VALUES(s.Jmeno, s.Prijmeni)
OUTPUT s.IdVlastnik, inserted.Id
INTO #OsobaVlastnik (IdVlastnik, IdOsoba);