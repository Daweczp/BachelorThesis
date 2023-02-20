CREATE TABLE [dbo].[UzivatelEmail]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdUzivatel] BIGINT NOT NULL,
	[IdKontaktEmail] BIGINT NOT NULL,

	CONSTRAINT [FK_UzivatelEmail_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].[Uzivatel](Id),
	CONSTRAINT [FK_UzivatelEmail_KontaktTelefon] FOREIGN KEY ([IdKontaktEmail]) REFERENCES [dbo].[KontaktEmail](Id),
)
