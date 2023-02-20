CREATE TABLE [dbo].[Prodejce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,

    [IdOsoba] BIGINT NULL,

    [ObchodniJmeno] NVARCHAR(255) NULL,
    [PravniForma] NVARCHAR(20) NOT NULL, 
    [IC] NVARCHAR(20) NULL, 

    CONSTRAINT [FK_Prodejce_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
    CONSTRAINT [FK_Prodejce_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),
)
