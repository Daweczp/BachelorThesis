﻿INSERT INTO Mesto (Jmeno, PSC)
SELECT DISTINCT t.Mesto, t.PSC
FROM(
	SELECT DISTINCT Mesto, PSC
	FROM [$(NF1DB)].[dbo].Nemovitost
	UNION ALL
	SELECT DISTINCT Mesto, PSC
	FROM [$(NF1DB)].[dbo].Prodejce
	UNION ALL
	SELECT DISTINCT Mesto, PSC
	FROM [$(NF1DB)].[dbo].Uzivatel
	UNION ALL
	SELECT DISTINCT Mesto, PSC
	FROM [$(NF1DB)].[dbo].Vlastnik
) AS t