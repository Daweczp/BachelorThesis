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
FROM [$(NF1DB)].[dbo].Prihoz WITH (NOLOCK)


SET IDENTITY_INSERT Prihoz OFF