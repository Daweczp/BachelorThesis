INSERT INTO Adresa (IdUlice, CisloPopisne, CisloOrientacni, IdMesto, IdZeme)
SELECT DISTINCT u.Id AS IdUlice,
	   t.CisloPopisne,
	   t.CisloOrientacni,
	   m.Id AS IdMesto,
	   z.Id AS IdZeme
FROM(
	SELECT DISTINCT Ulice, CisloPopisne, CisloOrientacni, Mesto, PSC, Zeme
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Ulice, CisloPopisne, CisloOrientacni, Mesto, PSC, Zeme
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Ulice, CisloPopisne, CisloOrientacni, Mesto, PSC, Zeme
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Ulice, CisloPopisne, CisloOrientacni, Mesto, PSC, Zeme
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t
JOIN Ulice u ON t.Ulice = u.Jmeno
JOIN Mesto m ON t.Mesto = m.Jmeno AND t.PSC = m.PSC
JOIN Zeme z ON t.Zeme = z.Jmeno