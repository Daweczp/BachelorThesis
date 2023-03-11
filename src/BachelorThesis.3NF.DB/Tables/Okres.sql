﻿CREATE TABLE [dbo].[Okres]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[Jmeno] NVARCHAR(100) NOT NULL,

	CONSTRAINT [UQ_Okres_Jmeno] UNIQUE ([Jmeno])
)
