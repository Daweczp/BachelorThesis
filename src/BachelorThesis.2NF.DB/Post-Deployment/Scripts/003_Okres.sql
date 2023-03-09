INSERT INTO Okres (Jmeno)
SELECT DISTINCT t.Okres
FROM(
	SELECT DISTINCT Okres
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Okres
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Okres
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Okres
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t