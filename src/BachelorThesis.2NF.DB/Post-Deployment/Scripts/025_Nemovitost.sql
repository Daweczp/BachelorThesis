SET IDENTITY_INSERT Nemovitost ON

INSERT INTO Nemovitost (Id, IdTypNemovitosti, IdAdresa, IdStavNemovitosti, Parkovani, EnergetickaNarocnost)
SELECT n.Id AS IdNemovitost,
	   tn.Id AS IdTypNemovitosti,
	   a.IdAdresa,
	   sn.Id AS IdStavNemovitosti,
	   n.Parkovani,
	   n.EnergetickaNarocnost
FROM [1NF_BachelorThesis].[dbo].Nemovitost n
	 JOIN TypNemovitosti tn ON n.TypObjektu = tn.TypObjektu AND n.TypTypuObjektu = tn.TypTypuObjektu
	 LEFT JOIN StavNemovitosti sn ON n.Stav = sn.Stav
	 JOIN #AdresaNemovitost a ON n.Id = a.IdNemovitost

SET IDENTITY_INSERT Nemovitost ON