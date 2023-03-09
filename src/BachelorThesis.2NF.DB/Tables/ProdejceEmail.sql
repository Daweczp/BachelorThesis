CREATE TABLE [dbo].[ProdejceEmail]
(
	[IdProdejce] BIGINT NOT NULL,
	[IdKontaktEmail] BIGINT NOT NULL,

	CONSTRAINT [FK_ProdejceEmail_Vlastnik] FOREIGN KEY ([IdProdejce]) REFERENCES [dbo].[Prodejce](Id),
	CONSTRAINT [FK_ProdejceEmail_KontaktTelefon] FOREIGN KEY ([IdKontaktEmail]) REFERENCES [dbo].[KontaktEmail](Id),
)
