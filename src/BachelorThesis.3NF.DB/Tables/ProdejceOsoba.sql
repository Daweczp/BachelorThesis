CREATE TABLE [dbo].[ProdejceOsoba]
(
	[IdProdejce] BIGINT NOT NULL,
	[IdOsoba] BIGINT NOT NULL,

	CONSTRAINT [FK_ProdejceOsoba_Prodejce] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
	CONSTRAINT [FK_ProdejceOsoba_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),

	CONSTRAINT [PK_ProdejceOsoba] PRIMARY KEY ([IdProdejce], [IdOsoba])
)
