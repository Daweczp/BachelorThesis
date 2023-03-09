INSERT INTO Spolecnost (IdPravniForma, ObchodniJmeno, IC)
SELECT DISTINCT pf.Id AS IdPravniForma,
	   nf1p.ObchodniJmeno,
	   nf1p.IC 
FROM [$(NF1DB)].[dbo].Prodejce nf1p
	 JOIN PravniForma pf ON nf1p.PravniForma = pf.Nazev
WHERE nf1p.ObchodniJmeno IS NOT NULL