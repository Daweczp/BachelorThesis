CREATE TABLE [dbo].[Ulice]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[Jmeno] NVARCHAR(100) NOT NULL,

	CONSTRAINT [UQ_Ulice_Jmeno] UNIQUE ([Jmeno])
)
