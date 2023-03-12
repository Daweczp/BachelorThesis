CREATE TABLE [dbo].[UzivatelOsoba]
(
	[IdUzivatel] BIGINT NOT NULL,
	[IdOsoba] BIGINT NOT NULL,
	[IdAdresa] BIGINT NOT NULL,

    CONSTRAINT [FK_UzivatelOsoba_Uzivatel] FOREIGN KEY ([IdUzivatel]) REFERENCES [dbo].[Uzivatel](Id),
	CONSTRAINT [FK_UzivatelOsoba_Osoba] FOREIGN KEY ([IdOsoba]) REFERENCES [dbo].[Osoba](Id),
	CONSTRAINT [FK_UzivatelOsoba_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),

	CONSTRAINT [PK_UzivatelOsoba] PRIMARY KEY ([IdUzivatel])
)
