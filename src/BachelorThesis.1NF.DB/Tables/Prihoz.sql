CREATE TABLE [dbo].[Prihoz]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdAukce] BIGINT NOT NULL,
	[IdUzivatel] BIGINT NOT NULL,

	[DatumPrihozu] DATE NOT NULL,
	[CasPrihozu] TIME NOT NULL,
	[CastkaPrihozu] DECIMAL(18, 2) NOT NULL,

	CONSTRAINT [FK_Prihoz_Aukce] FOREIGN KEY ([IdAukce]) REFERENCES [dbo].Aukce([Id]),
	CONSTRAINT [FK_Prihoz_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].Uzivatel([Id]),
)
