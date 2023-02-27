CREATE TABLE [dbo].[OkresKraj]
(
	[IdOkres] BIGINT NOT NULL,
	[IdKraj] BIGINT NOT NULL,

	CONSTRAINT [UQ_OkresKraj_Okres] UNIQUE ([IdOkres]),
	CONSTRAINT [UQ_OkresKraj_Kraj] UNIQUE ([IdKraj]),

	CONSTRAINT [FK_OkresKraj_Okres] FOREIGN KEY ([IdOkres]) REFERENCES [dbo].[Okres](Id),
	CONSTRAINT [FK_OkresKraj_Jrah] FOREIGN KEY ([IdKraj]) REFERENCES [dbo].[Kraj](Id),
	
	CONSTRAINT  [PK_OkresKraj] PRIMARY KEY ([IdOkres], [IdKraj]),


)
