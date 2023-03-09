INSERT INTO StavNemovitosti (Stav)
SELECT DISTINCT n.Stav
FROM [$(NF1DB)].[dbo].Nemovitost n
WHERE Stav IS NOT NULL