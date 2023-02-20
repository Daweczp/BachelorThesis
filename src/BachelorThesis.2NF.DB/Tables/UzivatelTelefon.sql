CREATE TABLE [dbo].[UzivatelTelefon]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdUzivatel] BIGINT NOT NULL,
	[IdKontaktTelefon] BIGINT NOT NULL,

	CONSTRAINT [FK_UzivatelTelefon_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].[Uzivatel](Id),
	CONSTRAINT [FK_UzivatelTelefon_KontaktTelefon] FOREIGN KEY ([IdKontaktTelefon]) REFERENCES [dbo].[KontaktTelefon](Id),
)
