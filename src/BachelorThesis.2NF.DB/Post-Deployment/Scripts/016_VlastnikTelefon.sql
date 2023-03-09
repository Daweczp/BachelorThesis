;WITH tbl AS
(
	SELECT t1.IdVlastnik,
		   nf1v.Telefon1,
		   nf1v.Telefon2
	FROM (
		SELECT v.Id AS IdVlastnik,
				o.Jmeno,
				o.Prijmeni,
				ul.Jmeno AS Ulice,
				a.CisloPopisne,
				a.CisloOrientacni,
				m.Jmeno AS Mesto,
				m.PSC,
				z.Jmeno AS Zeme
		FROM Vlastnik v 
		JOIN Osoba o ON v.IdOsoba = o.Id
		JOIN Adresa a ON v.IdAdresa = a.Id
		JOIN Zeme z ON a.IdZeme = z.Id
		JOIN Mesto m ON a.IdMesto = m.Id
		JOIN Ulice ul ON a.IdUlice = ul.Id
	) AS t1
	JOIN [$(NF1DB)].[dbo].Vlastnik nf1v ON
		 nf1v.Jmeno = t1.Jmeno
		 AND nf1v.Prijmeni = t1.Prijmeni
		 AND nf1v.Ulice = t1.Ulice
		 AND nf1v.CisloPopisne = t1.CisloPopisne
		 AND nf1v.CisloOrientacni = t1.CisloOrientacni
		 AND nf1v.Mesto = t1.Mesto
		 AND nf1v.PSC = t1.PSC		 
		 AND nf1v.Zeme = t1.Zeme
)
INSERT INTO VlastnikTelefon (IdVlastnik, IdKontaktTelefon)
SELECT t1.IdVlastnik,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon1
WHERE t1.Telefon1 IS NOT NULL
UNION ALL
SELECT t1.IdVlastnik,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon2
WHERE t1.Telefon2 IS NOT NULL