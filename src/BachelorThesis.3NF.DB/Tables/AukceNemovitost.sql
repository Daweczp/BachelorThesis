CREATE TABLE [dbo].[AukceNemovitost]
(
	[IdAukce] BIGINT NOT NULL,

	[IdNemovitost] BIGINT NOT NULL,
	[IdProdejce] BIGINT NOT NULL,
    [IdVlastnik] BIGINT NOT NULL,

	CONSTRAINT [FK_AukceNemovitost_Aukce] FOREIGN KEY (IdAukce) REFERENCES [dbo].[Aukce]([Id]), 
	CONSTRAINT [FK_AukceNemovitost_Nemovitost] FOREIGN KEY ([IdNemovitost]) REFERENCES [dbo].[Nemovitost]([Id]),
	CONSTRAINT [FK_AukceNemovitost_Prodejce] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
    CONSTRAINT [FK_AukceNemovitost_Vlastnik] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),

	CONSTRAINT [PK_AukceNemovitost] PRIMARY KEY ([IdAukce])

)
