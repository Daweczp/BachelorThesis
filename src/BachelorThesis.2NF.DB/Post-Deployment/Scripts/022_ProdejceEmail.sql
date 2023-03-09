;WITH tbl AS
(
	SELECT nf1p.Id AS IdProdejce,
		   nf1p.Email1,
		   nf1p.Email2
	FROM [$(NF1DB)].[dbo].Prodejce nf1p
)
INSERT INTO ProdejceEmail(IdProdejce, IdKontaktEmail)
SELECT t1.IdProdejce,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email1
WHERE t1.Email1 IS NOT NULL
UNION ALL
SELECT t1.IdProdejce,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email2
WHERE t1.Email2 IS NOT NULL
