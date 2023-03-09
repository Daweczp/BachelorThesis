;WITH tbl AS
(
	SELECT nf1v.Id AS IdVlastnik,
		   nf1v.Telefon1,
		   nf1v.Telefon2
	FROM [$(NF1DB)].[dbo].Vlastnik nf1v
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