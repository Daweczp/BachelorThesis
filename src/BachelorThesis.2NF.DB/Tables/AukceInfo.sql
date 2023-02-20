CREATE TABLE [dbo].[AukceInfo]
(
	[IdAukce] BIGINT NOT NULL PRIMARY KEY,
	[IdNemovitost] BIGINT NOT NULL,

	[IdProdejce] BIGINT NOT NULL,
    [IdVlastnik] BIGINT NOT NULL,

	[DatumZacatek] DATE NOT NULL,
	[CasZacatek] TIME NOT NULL,
	[DatumKonec] DATE NOT NULL,
	[CasKonec] TIME NOT NULL,

	CONSTRAINT [FK_AukceInfo_Aukce] FOREIGN KEY ([IdAukce]) REFERENCES [dbo].[Aukce]([Id]),
	CONSTRAINT [FK_AukceInfo_Nemovitost] FOREIGN KEY ([IdNemovitost]) REFERENCES [dbo].[Nemovitost]([Id]),
	CONSTRAINT [FK_AukceInfo_Prodejce] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
    CONSTRAINT [FK_AukceInfo_Vlastnik] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),
)
