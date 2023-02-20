﻿CREATE TABLE [dbo].[Nemovitost]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
        
    [TypObjektu] NVARCHAR(50) NOT NULL, 
    [TypTypuObjektu] NVARCHAR(50) NOT NULL,

    [Stav] NVARCHAR(50) NULL,
    [Parkovani] BIT NOT NULL, 
    [EnergetickaNarocnost] NCHAR(1) NULL, 
    
    [Ulice] NVARCHAR(100) NULL,
    [CisloPopisne] NVARCHAR(16) NULL,
    [CisloOrientacni] NVARCHAR(16) NULL,
    [PSC] NVARCHAR(16) NULL,
    [Mesto] NVARCHAR(100) NULL,
    [Okres] NVARCHAR(100) NULL,
    [Kraj] NVARCHAR(100) NULL,
    [Zeme] NVARCHAR(100) NULL,
)
