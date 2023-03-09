;WITH tbl AS
(
	SELECT nf1p.Id AS IdProdejce,
		   nf1p.Telefon1,
		   nf1p.Telefon2
	FROM [$(NF1DB)].[dbo].Prodejce nf1p
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
