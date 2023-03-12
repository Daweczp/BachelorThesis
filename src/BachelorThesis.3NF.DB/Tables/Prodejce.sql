CREATE TABLE [dbo].[Prodejce]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdAdresa] BIGINT NOT NULL,
    [TypProdejce] CHAR(1) CONSTRAINT [CHK_Prodejce_TypProdejce] CHECK ([TypProdejce] IN ('O', 'S')),
   
    CONSTRAINT [FK_Prodejce_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
)
