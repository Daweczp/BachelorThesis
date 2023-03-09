INSERT INTO PravniForma (Nazev)
SELECT DISTINCT nf1p.PravniForma
FROM [$(NF1DB)].[dbo].Prodejce nf1p