CREATE TABLE [dbo].[UzivatelEmail]
(
	[IdUzivatel] BIGINT NOT NULL,
	[IdKontaktEmail] BIGINT NOT NULL,

	CONSTRAINT [FK_UzivatelEmail_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].[Uzivatel](Id),
	CONSTRAINT [FK_UzivatelEmail_KontaktTelefon] FOREIGN KEY ([IdKontaktEmail]) REFERENCES [dbo].[KontaktEmail](Id),

	CONSTRAINT [PK_UzivatelEmail] PRIMARY KEY ([IdUzivatel], [IdKontaktEmail])
)
