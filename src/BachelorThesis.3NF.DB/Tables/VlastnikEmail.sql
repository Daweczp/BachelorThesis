CREATE TABLE [dbo].[VlastnikEmail]
(
	[IdVlastnik] BIGINT NOT NULL,
	[IdKontaktEmail] BIGINT NOT NULL,

	CONSTRAINT [FK_VlastnikEmail_Vlastnik] FOREIGN KEY ([IdVlastnik]) REFERENCES [dbo].[Vlastnik](Id),
	CONSTRAINT [FK_VlastnikEmail_KontaktTelefon] FOREIGN KEY ([IdKontaktEmail]) REFERENCES [dbo].[KontaktEmail](Id),

	CONSTRAINT [PK_VlastnikEmail] PRIMARY KEY ([IdVlastnik], [IdKontaktEmail])
)
