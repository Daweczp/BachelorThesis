;WITH tbl AS
(
	SELECT t1.IdProdejce,
		   nf1p.Telefon1,
		   nf1p.Telefon2
	FROM (
		SELECT p.Id AS IdProdejce,
				o.Jmeno,
				o.Prijmeni,
				s.ObchodniJmeno,
				s.IC,
				pf.Nazev AS PravniForma,
				ul.Jmeno AS Ulice,
				a.CisloPopisne,
				a.CisloOrientacni,
				m.Jmeno AS Mesto,
				m.PSC,
				z.Jmeno AS Zeme
		FROM Prodejce p
		LEFT JOIN Osoba o ON p.IdOsoba = o.Id
		LEFT JOIN Spolecnost s ON p.IdSpolecnost = s.Id
		LEFT JOIN PravniForma pf ON s.IdPravniForma = pf.Id
		JOIN Adresa a ON p.IdAdresa = a.Id
		JOIN Zeme z ON a.IdZeme = z.Id
		JOIN Mesto m ON a.IdMesto = m.Id
		JOIN Ulice ul ON a.IdUlice = ul.Id
	) AS t1
	JOIN [$(NF1DB)].[dbo].Prodejce nf1p ON
		 nf1p.Ulice = t1.Ulice
		 AND nf1p.CisloPopisne = t1.CisloPopisne
		 AND nf1p.CisloOrientacni = t1.CisloOrientacni
		 AND nf1p.Mesto = t1.Mesto
		 AND nf1p.PSC = t1.PSC
		 AND ((nf1p.Jmeno = t1.Jmeno AND nf1p.Prijmeni = t1.Prijmeni) 
			  OR nf1p.ObchodniJmeno = t1.ObchodniJmeno AND nf1p.PravniForma = t1.PravniForma AND nf1p.IC = t1.IC)
		 AND nf1p.Zeme = t1.Zeme
)
INSERT INTO ProdejceTelefon(IdProdejce, IdKontaktTelefon)
SELECT t1.IdProdejce,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon1
WHERE t1.Telefon1 IS NOT NULL
UNION ALL
SELECT t1.IdProdejce,
	   kt.Id AS IdKontaktTelefon
FROM tbl t1
JOIN KontaktTelefon kt ON kt.Telefon = t1.Telefon2
WHERE t1.Telefon2 IS NOT NULL
