﻿CREATE TABLE [dbo].[Uzivatel]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    
    [Login] NVARCHAR(50) NOT NULL UNIQUE,
    [Heslo] NVARCHAR(MAX) NOT NULL,   
)