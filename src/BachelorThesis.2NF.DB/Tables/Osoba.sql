﻿CREATE TABLE [dbo].[Osoba]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,

	[Jmeno] NVARCHAR(100) NOT NULL,
    [Prijmeni] NVARCHAR(100) NOT NULL,
)
