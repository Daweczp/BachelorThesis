CREATE TABLE [dbo].[StavNemovitosti]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[Stav] NVARCHAR(50) NOT NULL,

	CONSTRAINT [UQ_StavNemovitosti_Stav] UNIQUE ([Stav])
)
