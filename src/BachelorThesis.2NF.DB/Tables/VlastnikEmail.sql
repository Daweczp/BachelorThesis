CREATE TABLE [dbo].[VlastnikEmail]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdVlastnik] BIGINT NOT NULL,
	[IdKontaktEmail] BIGINT NOT NULL,

	CONSTRAINT [FK_VlastnikEmail_Vlastnik] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),
	CONSTRAINT [FK_VlastnikEmail_KontaktTelefon] FOREIGN KEY ([IdKontaktEmail]) REFERENCES [dbo].[KontaktEmail](Id),
)
