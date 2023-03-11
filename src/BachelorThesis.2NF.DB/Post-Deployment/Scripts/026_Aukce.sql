SET IDENTITY_INSERT Aukce ON

INSERT INTO Aukce (Id, 
				   IdNemovitost, 
				   IdProdejce, 
				   IdVlastnik, 
				   Nazev, 
				   MinimalniPrihoz, 
				   PocatecniCena, 
				   DatumZacatek, 
				   CasZacatek, 
				   DatumKonec, 
				   CasKonec)
SELECT Id, 
	   IdNemovitost, 
	   IdProdejce, 
	   IdVlastnik, 
	   Nazev, 
	   MinimalniPrihoz, 
	   PocatecniCena, 
	   DatumZacatek, 
	   CasZacatek, 
	   DatumKonec, 
	   CasKonec
FROM [$(NF1DB)].[dbo].Aukce WITH (NOLOCK)

SET IDENTITY_INSERT Aukce OFF