CREATE TABLE [dbo].[Prodejce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,

    [Jmeno] NVARCHAR(100) NULL,
    [Prijmeni] NVARCHAR(100) NULL,
    [ObchodniJmeno] NVARCHAR(255) NULL,
    [PravniForma] NVARCHAR(20) NOT NULL, 
    [IC] NVARCHAR(20) NULL, 
    
    [Email1] NVARCHAR(100) NOT NULL,
    [Email2] NVARCHAR(100) NULL,
    [Telefon1] NVARCHAR(20) NOT NULL,
    [Telefon2] NVARCHAR(20) NULL,

    CONSTRAINT [FK_Prodejce_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
)
