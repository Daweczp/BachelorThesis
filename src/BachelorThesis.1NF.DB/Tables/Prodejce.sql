CREATE TABLE [dbo].[Prodejce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    
    [Jmeno] NVARCHAR(100) NULL,
    [Prijmeni] NVARCHAR(100) NULL,
    [ObchodniJmeno] NVARCHAR(255) NULL,
    [PravniForma] NVARCHAR(20) NOT NULL, 
    [IC] NVARCHAR(20) NULL, 

    [Ulice] NVARCHAR(100) NOT NULL,
    [CisloPopisne] NVARCHAR(16) NULL,
    [CisloOrientacni] NVARCHAR(16) NULL,
    [PSC] NVARCHAR(16) NOT NULL,
    [Mesto] NVARCHAR(100) NOT NULL,
    [Okres] NVARCHAR(100) NOT NULL,
    [Kraj] NVARCHAR(100) NOT NULL,
    [Zeme] NVARCHAR(100) NOT NULL,
    
    [Email1] NVARCHAR(100) NOT NULL,
    [Email2] NVARCHAR(100) NULL,
    [Telefon1] NVARCHAR(20) NOT NULL,
    [Telefon2] NVARCHAR(20) NULL,
)
