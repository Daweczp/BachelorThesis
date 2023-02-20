CREATE TABLE [dbo].[Nemovitost]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdTypNemovitosti] BIGINT NOT NULL,
    [IdAdresa] BIGINT NOT NULL,
    
    CONSTRAINT [FK_Nemovitost_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
)
