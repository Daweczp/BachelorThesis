SET IDENTITY_INSERT Vlastnik ON

INSERT INTO Vlastnik (Id, IdAdresa, IdOsoba)
SELECT v.Id,
	   a.IdAdresa,
	   o.IdOsoba
FROM [$(NF1DB)].[dbo].Vlastnik v
	 JOIN #AdresaVlastnik a ON v.Id = a.IdVlastnik
	 JOIN #OsobaVlastnik o ON v.Id = o.IdVlastnik

SET IDENTITY_INSERT Vlastnik OFF