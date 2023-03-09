INSERT INTO Uzivatel (IdAdresa, IdOsoba, Login, Heslo)
SELECT a.Id AS IdAdresa,
	   o.Id AS IdOsoba,
	   u.Login,
	   u.Heslo
FROM [$(NF1DB)].[dbo].Uzivatel u 
JOIN Osoba o ON o.Jmeno = u.Jmeno AND o.Prijmeni = u.Prijmeni
JOIN Adresa a ON a.CisloPopisne = u.CisloPopisne AND a.CisloOrientacni = u.CisloOrientacni
JOIN Zeme z ON a.IdZeme = z.Id AND z.Jmeno = u.Zeme
JOIN Ulice ul ON a.IdUlice = ul.Id AND ul.Jmeno = u.Ulice
JOIN Mesto m ON a.IdMesto = m.Id AND m.Jmeno = u.Mesto AND m.PSC = u.PSC