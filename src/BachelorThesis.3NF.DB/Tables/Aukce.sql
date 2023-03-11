CREATE TABLE [dbo].[Aukce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,

	[IdNemovitost] BIGINT NOT NULL,

	[IdProdejce] BIGINT NOT NULL,
    [IdVlastnik] BIGINT NOT NULL,

	[Nazev] NVARCHAR(255)  NOT NULL,
	[MinimalniPrihoz] DECIMAL(18, 2) NOT NULL,
	[PocatecniCena] DECIMAL(18, 2) NOT NULL,

	[DatumZacatek] DATE NOT NULL,
	[CasZacatek] TIME NOT NULL,
	[DatumKonec] DATE NOT NULL,
	[CasKonec] TIME NOT NULL,

	CONSTRAINT [FK_Aukce_Nemovitost] FOREIGN KEY ([IdNemovitost]) REFERENCES [dbo].[Nemovitost]([Id]),
	CONSTRAINT [FK_Aukce_Prodejce] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
    CONSTRAINT [FK_Aukce_Vlastnik] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),
)
