CREATE TABLE [dbo].[AukceTerminy]
(
	[IdAukce] BIGINT NOT NULL,

	[DatumZacatek] DATE NOT NULL,
	[CasZacatek] TIME NOT NULL,
	[DatumKonec] DATE NOT NULL,
	[CasKonec] TIME NOT NULL,

	CONSTRAINT [FK_AukceTerminy_Aukce] FOREIGN KEY (IdAukce) REFERENCES [dbo].[Aukce]([Id]),

	CONSTRAINT [PK_AukceTerminy] PRIMARY KEY ([IdAukce])
)
