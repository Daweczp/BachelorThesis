﻿CREATE TABLE [dbo].[ProdejceTelefon]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdProdejce] BIGINT NOT NULL,
	[IdKontaktTelefon] BIGINT NOT NULL,

	CONSTRAINT [FK_ProdejceTelefon_Uzivatel] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
	CONSTRAINT [FK_ProdejceTelefon_KontaktTelefon] FOREIGN KEY ([IdKontaktTelefon]) REFERENCES [dbo].[KontaktTelefon](Id),
)
