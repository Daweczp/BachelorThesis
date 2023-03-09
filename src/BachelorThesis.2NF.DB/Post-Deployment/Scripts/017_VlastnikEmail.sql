;WITH tbl AS
(
	SELECT nf1v.Id AS IdVlastnik,
		   nf1v.Email1,
		   nf1v.Email2
	FROM [$(NF1DB)].[dbo].Vlastnik nf1v
)
INSERT INTO VlastnikEmail (IdVlastnik, IdKontaktEmail)
SELECT t1.IdVlastnik,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email1
WHERE t1.Email1 IS NOT NULL
UNION ALL
SELECT t1.IdVlastnik,
	   kt.Id AS IdKontaktEmail
FROM tbl t1
JOIN KontaktEmail kt ON kt.Email = t1.Email2
WHERE t1.Email2 IS NOT NULL