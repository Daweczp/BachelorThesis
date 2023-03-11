CREATE TABLE [dbo].[Adresa]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdUlice] BIGINT NOT NULL,
    [IdMesto] BIGINT NOT NULL,
    [CisloPopisne] NVARCHAR(16) NULL,
    [CisloOrientacni] NVARCHAR(16) NULL,
    [IdZeme] BIGINT NULL,

    CONSTRAINT [FK_Adresa_Ulice] FOREIGN KEY ([IdUlice]) REFERENCES [dbo].[Ulice](Id),
    CONSTRAINT [FK_Adresa_Mesto] FOREIGN KEY ([IdMesto]) REFERENCES [dbo].[Mesto](Id),
    CONSTRAINT [FK_Adresa_Zeme] FOREIGN KEY ([IdZeme]) REFERENCES [dbo].[Zeme](Id),
)
