CREATE TABLE [dbo].[TypNemovitosti]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[IdTypObjektu] BIGINT NOT NULL, 
    [IdTypTypuObjektu] BIGINT NOT NULL, 

    CONSTRAINT [FK_TypNemovitosti_TypObjektu] FOREIGN KEY ([IdTypObjektu]) REFERENCES [TypObjektu]([Id]),
	CONSTRAINT [FK_TypNemovitosti_TypTypuObjektu] FOREIGN KEY ([IdTypTypuObjektu]) REFERENCES [TypTypuObjektu]([Id]),
)