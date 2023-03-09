INSERT INTO Prodejce(IdAdresa, IdOsoba, IdSpolecnost)
SELECT t.IdAdresa,
	   t.IdOsoba,
	   (SELECT s.id
		FROM Spolecnost s 
			 JOIN PravniForma pf ON s.IdPravniForma = pf.Id
		WHERE s.IC = t.IC 
			  AND s.ObchodniJmeno = s.ObchodniJmeno
			  AND pf.Nazev = t.PravniForma) AS IdSpolecnost
FROM
(
	SELECT a.Id AS IdAdresa,
		   o.Id AS IdOsoba,
		   p.ObchodniJmeno,
		   p.PravniForma,
		   p.IC
	FROM [$(NF1DB)].[dbo].Prodejce p
	LEFT JOIN Osoba o ON o.Jmeno = p.Jmeno AND o.Prijmeni = p.Prijmeni
	JOIN Adresa a ON a.CisloPopisne = p.CisloPopisne AND a.CisloOrientacni = p.CisloOrientacni
	JOIN Zeme z ON a.IdZeme = z.Id AND z.Jmeno = p.Zeme
	JOIN Ulice ul ON a.IdUlice = ul.Id AND ul.Jmeno = p.Ulice
	JOIN Mesto m ON a.IdMesto = m.Id AND m.Jmeno = p.Mesto AND m.PSC = p.PSC
) AS t