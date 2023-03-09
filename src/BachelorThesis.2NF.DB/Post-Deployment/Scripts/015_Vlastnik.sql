INSERT INTO Vlastnik (IdAdresa, IdOsoba)
SELECT a.Id AS IdAdresa,
	   o.Id AS IdOsoba
FROM [$(NF1DB)].[dbo].Vlastnik v
JOIN Osoba o ON o.Jmeno = v.Jmeno AND o.Prijmeni = v.Prijmeni
JOIN Adresa a ON a.CisloPopisne = v.CisloPopisne AND a.CisloOrientacni = v.CisloOrientacni
JOIN Zeme z ON a.IdZeme = z.Id AND z.Jmeno = v.Zeme
JOIN Ulice ul ON a.IdUlice = ul.Id AND ul.Jmeno = v.Ulice
JOIN Mesto m ON a.IdMesto = m.Id AND m.Jmeno = v.Mesto AND m.PSC = v.PSC