CREATE TABLE [dbo].[OkresKraj]
(
	[IdOkres] BIGINT NOT NULL,
	[IdKraj] BIGINT NOT NULL,

	CONSTRAINT [UQ_OkresKraj_IdOkres] UNIQUE ([IdOkres]),
	CONSTRAINT [UQ_OkresKraj_IdKraj] UNIQUE ([IdKraj]),
	
	CONSTRAINT  [PK_OkresKraj] PRIMARY KEY ([IdOkres], [IdKraj])
)
