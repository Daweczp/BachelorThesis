;WITH tbl AS
(
	SELECT t1.IdUzivatel,
		   nf1u.Email1,
		   nf1u.Email2
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
INSERT INTO UzivatelEmail (IdUzivatel, IdKontaktEmail)
SELECT t1.IdUzivatel,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email1
WHERE t1.Email1 IS NOT NULL
UNION ALL
SELECT t1.IdUzivatel,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email2
WHERE t1.Email2 IS NOT NULL