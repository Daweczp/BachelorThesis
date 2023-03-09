INSERT INTO Ulice (Jmeno)
SELECT DISTINCT t.Ulice
FROM(
	SELECT DISTINCT Ulice
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Ulice
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Ulice
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Ulice
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t