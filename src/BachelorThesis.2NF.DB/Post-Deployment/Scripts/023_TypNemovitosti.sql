INSERT INTO TypNemovitosti (TypObjektu, TypTypuObjektu)
SELECT DISTINCT n.TypObjektu, 
	   n.TypTypuObjektu
FROM [$(NF1DB)].[dbo].Nemovitost n