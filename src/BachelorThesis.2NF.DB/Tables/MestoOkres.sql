CREATE TABLE [dbo].[MestoOkres]
(
	[IdMesto] BIGINT NOT NULL,
	[IdOkres] BIGINT NOT NULL,

	CONSTRAINT [UQ_MestoOkres_IdMesto] UNIQUE ([IdMesto]),
	CONSTRAINT [UQ_MestoOkres_IdOkres] UNIQUE ([IdOkres]),
	
	CONSTRAINT  [PK_MestoOkres] PRIMARY KEY ([IdMesto], [IdOkres])
)
