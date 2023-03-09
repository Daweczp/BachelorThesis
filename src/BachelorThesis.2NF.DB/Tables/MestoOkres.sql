CREATE TABLE [dbo].[MestoOkres]
(
	[IdMesto] BIGINT NOT NULL,
	[IdOkres] BIGINT NOT NULL,

	CONSTRAINT [FK_MestoOkres_Mesto] FOREIGN KEY ([IdMesto]) REFERENCES [dbo].[Mesto](Id),
	CONSTRAINT [FK_MestoOkres_Okres] FOREIGN KEY ([IdOkres]) REFERENCES [dbo].[Okres](Id),

	CONSTRAINT  [PK_MestoOkres] PRIMARY KEY ([IdMesto], [IdOkres])
)
