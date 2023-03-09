;WITH tbl AS
(
	SELECT t1.IdUzivatel,
		   nf1u.Telefon1,
		   nf1u.Telefon2
	FROM (
		SELECT u.Id AS IdUzivatel,
				o.Jmeno,
				o.Prijmeni,
				ul.Jmeno AS Ulice,
				a.CisloPopisne,
				a.CisloOrientacni,
				m.Jmeno AS Mesto,
				m.PSC,				
				z.Jmeno AS Zeme
		FROM Uzivatel u
		JOIN Osoba o ON u.IdOsoba = o.Id
		JOIN Adresa a ON u.IdAdresa = a.Id
		JOIN Zeme z ON a.IdZeme = z.Id
		JOIN Mesto m ON a.IdMesto = m.Id
		JOIN Ulice ul ON a.IdUlice = ul.Id
	) AS t1
	JOIN [$(NF1DB)].[dbo].Uzivatel nf1u ON
		 nf1u.Jmeno = t1.Jmeno
		 AND nf1u.Prijmeni = t1.Prijmeni
		 AND nf1u.Ulice = t1.Ulice
		 AND nf1u.CisloPopisne = t1.CisloPopisne
		 AND nf1u.CisloOrientacni = t1.CisloOrientacni
		 AND nf1u.Mesto = t1.Mesto
		 AND nf1u.PSC = t1.PSC
		 AND nf1u.Zeme = t1.Zeme
)
INSERT INTO UzivatelTelefon (IdUzivatel, IdKontaktTelefon)
SELECT t1.IdUzivatel,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon1
WHERE t1.Telefon1 IS NOT NULL
UNION ALL
SELECT t1.IdUzivatel,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon2
WHERE t1.Telefon2 IS NOT NULL