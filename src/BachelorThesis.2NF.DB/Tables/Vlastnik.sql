CREATE TABLE [dbo].[Vlastnik]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,

    [Jmeno] NVARCHAR(100) NOT NULL,
    [Prijmeni] NVARCHAR(100) NOT NULL,
        
    [Email1] NVARCHAR(100) NOT NULL,
    [Email2] NVARCHAR(100) NULL,
    [Telefon1] NVARCHAR(20) NOT NULL,
    [Telefon2] NVARCHAR(20) NULL,

    CONSTRAINT [FK_Vlastnik_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
)
