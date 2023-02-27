CREATE TABLE [dbo].[Nemovitost]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
    [IdTypNemovitosti] BIGINT NOT NULL,
    [IdAdresa] BIGINT NOT NULL,
    [IdStavNemovitosti] BIGINT NULL,
    [Parkovani] BIT NOT NULL, 
    [EnergetickaNarocnost] NCHAR(1) NULL, 
    CONSTRAINT [FK_Nemovitost_TypNemovitost] FOREIGN KEY ([IdTypNemovitosti]) REFERENCES [dbo].[TypNemovitosti](Id),
    CONSTRAINT [FK_Nemovitost_Adresa] FOREIGN KEY ([IdAdresa]) REFERENCES [dbo].[Adresa](Id),
    CONSTRAINT [FK_Nemovitost_StavNemovitosti] FOREIGN KEY ([IdStavNemovitosti]) REFERENCES [dbo].[StavNemovitosti](Id),
)
