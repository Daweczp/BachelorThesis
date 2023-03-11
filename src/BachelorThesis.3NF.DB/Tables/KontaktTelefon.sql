CREATE TABLE [dbo].[KontaktTelefon]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY,
	[Telefon] NVARCHAR(20) NOT NULL,

	CONSTRAINT [UQ_KontaktTelefon_Telefon] UNIQUE ([Telefon])
)
