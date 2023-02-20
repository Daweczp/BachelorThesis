CREATE TABLE [dbo].[Vlastnik]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,
    [IdOsoba] BIGINT NOT NULL,
        
    CONSTRAINT [FK_Vlastnik_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
    CONSTRAINT [FK_Vlastnik_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),    
)