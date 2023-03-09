INSERT INTO Osoba (Jmeno, Prijmeni)
SELECT DISTINCT t.Jmeno,
	   t.Prijmeni
FROM(
	SELECT DISTINCT Jmeno, Prijmeni
	FROM [$(NF1DB)].[dbo].Prodejce
	WHERE Jmeno IS NOT NULL AND Prijmeni IS NOT NULL
	UNION ALL
	SELECT DISTINCT Jmeno, Prijmeni
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Jmeno, Prijmeni
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t