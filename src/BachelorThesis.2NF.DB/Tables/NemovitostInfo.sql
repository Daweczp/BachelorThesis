CREATE TABLE [dbo].[NemovitostInfo]
(
	[IdNemovitost] BIGINT NOT NULL PRIMARY KEY,
	[Stav] NVARCHAR(50) NULL,
    [Parkovani] BIT NOT NULL, 
    [EnergetickaNarocnost] NCHAR(1) NULL, 
    
    CONSTRAINT [FK_[NemovitostInfo_Nemovitost] FOREIGN KEY ([IdNemovitost]) REFERENCES [dbo].[Nemovitost](Id),
)
