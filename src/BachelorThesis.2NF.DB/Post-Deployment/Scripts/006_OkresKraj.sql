INSERT INTO OkresKraj (IdOkres, IdKraj)
SELECT DISTINCT o.Id AS IdOkres,
	  k.Id AS IdKraj
FROM(
	SELECT DISTINCT Okres, Kraj
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Okres, Kraj
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Okres, Kraj
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Okres, Kraj
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t
JOIN Okres o ON t.Okres = o.Jmeno
JOIN Kraj k ON t.Kraj = k.Jmeno