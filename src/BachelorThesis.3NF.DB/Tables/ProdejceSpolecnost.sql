CREATE TABLE [dbo].[ProdejceSpolecnost]
(
	[IdProdejce] BIGINT NOT NULL,
	[IdSpolecnost] BIGINT NOT NULL,

	CONSTRAINT [FK_ProdejceSpolecnost_Prodejce] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
	CONSTRAINT [FK_ProdejceSpolecnost_Spolecnost] FOREIGN KEY ([IdSpolecnost]) REFERENCES [dbo].[Spolecnost](Id),

	CONSTRAINT [PK_ProdejceSpolecnost] PRIMARY KEY ([IdProdejce], [IdSpolecnost])
)
