CREATE TABLE [dbo].[Uzivatel]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,
    [IdOsoba] BIGINT NOT NULL,

    [Login] NVARCHAR(50) NOT NULL UNIQUE,
    [Heslo] NVARCHAR(MAX) NOT NULL,

    CONSTRAINT [FK_Uzivatel_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
    CONSTRAINT [FK_Uzivatel_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),
)
