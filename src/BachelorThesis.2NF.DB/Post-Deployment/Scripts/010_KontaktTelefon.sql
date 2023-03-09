INSERT INTO KontaktTelefon (Telefon)
SELECT DISTINCT t.Telefon1 AS Telefon
FROM(
	SELECT DISTINCT Telefon1
	FROM [$(NF1DB)].[dbo].Prodejce
	WHERE Telefon1 IS NOT NULL
	UNION ALL
	SELECT DISTINCT Telefon2
	FROM [$(NF1DB)].[dbo].Prodejce
	WHERE Telefon2 IS NOT NULL

	UNION ALL

	SELECT DISTINCT Telefon1
	FROM [$(NF1DB)].[dbo].Vlastnik
	WHERE Telefon1 IS NOT NULL
	UNION ALL
	SELECT DISTINCT Telefon2
	FROM [$(NF1DB)].[dbo].Vlastnik
	WHERE Telefon2 IS NOT NULL
	
	UNION ALL

	SELECT DISTINCT Telefon1
	FROM [$(NF1DB)].[dbo].Uzivatel
	WHERE Telefon1 IS NOT NULL
	UNION ALL
	SELECT DISTINCT Telefon2
	FROM [$(NF1DB)].[dbo].Uzivatel
	WHERE Telefon2 IS NOT NULL
) AS t