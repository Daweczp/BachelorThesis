SET IDENTITY_INSERT Prodejce ON

INSERT INTO Prodejce(Id, IdAdresa, IdOsoba, IdSpolecnost)
SELECT p.Id,
	   a.IdAdresa,
	   o.IdOsoba,
	   (SELECT s.id
		FROM Spolecnost s 
			 JOIN PravniForma pf ON s.IdPravniForma = pf.Id
		WHERE s.IC = p.IC 
			  AND s.ObchodniJmeno = s.ObchodniJmeno
			  AND pf.Nazev = p.PravniForma) AS IdSpolecnost
FROM [$(NF1DB)].[dbo].Prodejce p
	 LEFT JOIN #AdresaProdejce a ON p.Id = a.IdProdejce
	 LEFT JOIN #OsobaProdejce o ON p.Id = o.IdProdejce

SET IDENTITY_INSERT Prodejce OFF