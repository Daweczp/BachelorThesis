INSERT INTO MestoOkres (IdOkres, IdMesto)
SELECT DISTINCT o.Id AS IdOkres,
	  m.Id AS IdMesto
FROM(
	SELECT DISTINCT Okres, Mesto, PSC
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Okres, Mesto, PSC
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Okres, Mesto, PSC
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Okres, Mesto, PSC
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t
JOIN Okres o ON t.Okres = o.Jmeno
JOIN Mesto m ON t.Mesto = m.Jmeno AND t.PSC = m.PSC