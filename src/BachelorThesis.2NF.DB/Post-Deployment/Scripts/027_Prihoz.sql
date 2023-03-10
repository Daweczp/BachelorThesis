SET IDENTITY_INSERT Prihoz ON

SET IDENTITY_INSERT Prihoz ON

INSERT INTO Prihoz (Id, 
					IdAukce, 
					IdUzivatel, 
					DatumPrihozu, 
					CasPrihozu, 
					CastkaPrihozu)
SELECT Id, 
	   IdAukce, 
	   IdUzivatel, 
	   DatumPrihozu, 
	   CasPrihozu, 
	   CastkaPrihozu 
FROM [1NF_BachelorThesis].[dbo].Prihoz WITH (NOLOCK)


SET IDENTITY_INSERT Prihoz OFF

SET IDENTITY_INSERT Prihoz OFF