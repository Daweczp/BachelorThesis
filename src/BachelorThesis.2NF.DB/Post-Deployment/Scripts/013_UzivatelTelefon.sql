;WITH tbl AS
(
	SELECT nf1u.Id AS IdUzivatel,
		   nf1u.Telefon1,
		   nf1u.Telefon2
	FROM [$(NF1DB)].[dbo].Uzivatel nf1u

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