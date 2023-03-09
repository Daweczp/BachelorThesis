SET IDENTITY_INSERT Uzivatel ON

INSERT INTO Uzivatel (Id, IdAdresa, IdOsoba, Login, Heslo)
SELECT u.Id, 
	   a.IdAdresa,
	   o.IdOsoba,
	   u.Login,
	   u.Heslo
FROM [$(NF1DB)].[dbo].Uzivatel u 
	 JOIN #AdresaUzivatel a ON u.Id = a.IdUzivatel
	 JOIN #OsobaUzivatel o ON u.Id = o.IdUzivatel

SET IDENTITY_INSERT Uzivatel OFF
