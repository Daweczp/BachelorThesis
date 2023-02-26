CREATE TABLE [dbo].[Prodejce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,

    [IdOsoba] BIGINT NULL,
    [IdSpolecnost] BIGINT NULL,
   
    CONSTRAINT [FK_Prodejce_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
    CONSTRAINT [FK_Prodejce_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),
    CONSTRAINT [FK_Prodejce_Spolecnost] FOREIGN KEY ([IdSpolecnost]) REFERENCES [dbo].[Spolecnost](Id),
)
