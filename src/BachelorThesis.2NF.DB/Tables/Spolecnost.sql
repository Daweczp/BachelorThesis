CREATE TABLE [dbo].[Spolecnost]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdPravniForma] BIGINT NOT NULL,
	[ObchodniJmeno] NVARCHAR(255) NULL,
    [IC] NVARCHAR(20) NULL,

	CONSTRAINT [FK_Spolecnost_PravniForma] FOREIGN KEY ([IdPravniForma]) REFERENCES [dbo].[PravniForma](Id),
)
