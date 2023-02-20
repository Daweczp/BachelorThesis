CREATE TABLE [dbo].[VlastnikTelefon]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdVlastnik] BIGINT NOT NULL,
	[IdKontaktTelefon] BIGINT NOT NULL,

	CONSTRAINT [FK_VlastnikTelefon_Uzivatel] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),
	CONSTRAINT [FK_VlastnikTelefon_KontaktTelefon] FOREIGN KEY ([IdKontaktTelefon]) REFERENCES [dbo].[KontaktTelefon](Id),
)
