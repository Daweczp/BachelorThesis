﻿CREATE TABLE [dbo].[KontaktEmail]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[Email] NVARCHAR(100) NOT NULL,

	CONSTRAINT [UQ_KontaktEmail_Email] UNIQUE ([Email])
)