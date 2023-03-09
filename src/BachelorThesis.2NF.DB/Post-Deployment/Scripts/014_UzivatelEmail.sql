;WITH tbl AS
(
	SELECT nf1u.Id AS IdUzivatel,
		   nf1u.Email1,
		   nf1u.Email2
	FROM [$(NF1DB)].[dbo].Uzivatel nf1u
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