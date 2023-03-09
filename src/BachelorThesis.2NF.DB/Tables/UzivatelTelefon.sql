CREATE TABLE [dbo].[UzivatelTelefon]
(
	[IdUzivatel] BIGINT NOT NULL,
	[IdKontaktTelefon] BIGINT NOT NULL,

	CONSTRAINT [FK_UzivatelTelefon_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].[Uzivatel](Id),
	CONSTRAINT [FK_UzivatelTelefon_KontaktTelefon] FOREIGN KEY ([IdKontaktTelefon]) REFERENCES [dbo].[KontaktTelefon](Id),

	CONSTRAINT [PK_UzivatelTelefon] PRIMARY KEY ([IdUzivatel], [IdKontaktTelefon])
)
