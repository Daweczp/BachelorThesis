SET IDENTITY_INSERT Prihoz ON

--INSERT INTO Prihoz (Id, 
--					IdAukce, 
--					IdUzivatel, 
--					DatumPrihozu, 
--					CasPrihozu, 
--					CastkaPrihozu)
--SELECT Id, 
--	   IdAukce, 
--	   IdUzivatel, 
--	   DatumPrihozu, 
--	   CasPrihozu, 
--	   CastkaPrihozu 
--FROM [$(NF1DB)].[dbo].Prihoz WITH (NOLOCK)

DECLARE @prihozFrom BIGINT = 0,
	    @prihozStep BIGINT = 10000000

SELECT @aktualni_pocet_prihozu = COUNT_BIG(1) FROM Prihoz

WHILE @prihozFrom < @aktualni_pocet_prihozu
BEGIN
	INSERT INTO Prihoz (Id, 
						IdAukce, 
						IdUzivatel, 
						DatumPrihozu, 
						CasPrihozu, 
						CastkaPrihozu)
	SELECT t.Id, 
		   t.IdAukce, 
		   t.IdUzivatel, 
		   t.DatumPrihozu, 
		   t.CasPrihozu, 
		   t.CastkaPrihozu
	FROM
	(
		SELECT Id, 
			   IdAukce, 
			   IdUzivatel, 
			   DatumPrihozu, 
			   CasPrihozu, 
			   CastkaPrihozu,
			   ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
		FROM [$(NF1DB)].[dbo].Prihoz WITH (NOLOCK)
	) t
	WHERE t.RowNumber BETWEEN @prihozFrom AND @prihozFrom + @prihozStep

	SET @prihozFrom += @prihozStep + 1
END


SET IDENTITY_INSERT Prihoz OFF