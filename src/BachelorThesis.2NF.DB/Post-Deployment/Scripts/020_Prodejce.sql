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
FROM [1NF_BachelorThesis].[dbo].Prodejce p
	 JOIN #AdresaProdejce a ON p.Id = a.IdProdejce
	 JOIN #OsobaProjdece o ON p.Id = o.IdProdejce

SET IDENTITY_INSERT Prodejce OFF