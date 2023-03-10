/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*
delete from Prihoz
delete from Aukce
delete from Nemovitost
delete from StavNemovitosti
delete from TypNemovitosti
delete from ProdejceEmail
delete from ProdejceTelefon
delete from Prodejce
delete from Spolecnost
delete from PravniForma
delete from VlastnikEmail
delete from VlastnikTelefon
delete from Vlastnik
delete from UzivatelEmail
delete from UzivatelTelefon
delete from Uzivatel
delete from KontaktEmail
delete from KontaktTelefon
delete from Osoba
delete from Adresa
delete from MestoOkres
delete from OkresKraj
delete from Mesto
delete from Ulice
delete from Okres
delete from Kraj
delete from Zeme

select * from Zeme
select * from Kraj
select * from Okres
select * from Ulice
select * from Mesto
select * from OkresKraj
select * from MestoOkres
select * from Adresa
select * from Osoba
select * from KontaktTelefon
select * from KontaktEmail
select * from Uzivatel
select * from UzivatelTelefon
select * from UzivatelEmail
select * from Vlastnik
select * from VlastnikTelefon
select * from VlastnikEmail
select * from PravniForma
select * from Spolecnost
select * from Prodejce
select * from ProdejceTelefon
select * from ProdejceEmail
select * from TypNemovitosti
select * from StavNemovitosti
select * from Nemovitost
select * from Aukce
select * from Prihoz

select COUNT_BIG(1) from Nemovitost
select COUNT_BIG(1) from Aukce
select COUNT_BIG(1) from Prihoz WITH (NOLOCK)
*/

:setvar NF1DB 1NF_BachelorThesis

SET NOCOUNT ON

DROP TABLE IF EXISTS  #AdresaNemovitost
GO
DROP TABLE IF EXISTS  #AdresaProdejce
GO
DROP TABLE IF EXISTS  #AdresaUzivatel
GO
DROP TABLE IF EXISTS  #AdresaVlastnik
GO

DROP TABLE IF EXISTS  #OsobaProdejce
GO
DROP TABLE IF EXISTS  #OsobaUzivatel
GO
DROP TABLE IF EXISTS  #OsobaVlastnik
GO

CREATE TABLE #AdresaNemovitost (IdNemovitost BIGINT NOT NULL UNIQUE, IdAdresa BIGINT NOT NULL)
CREATE TABLE #AdresaProdejce  (IdProdejce BIGINT NOT NULL UNIQUE, IdAdresa BIGINT NOT NULL)
CREATE TABLE #AdresaUzivatel  (IdUzivatel BIGINT NOT NULL UNIQUE, IdAdresa BIGINT NOT NULL)
CREATE TABLE #AdresaVlastnik  (IdVlastnik BIGINT NOT NULL UNIQUE, IdAdresa BIGINT NOT NULL)
             
CREATE TABLE #OsobaProdejce  (IdProdejce BIGINT NOT NULL UNIQUE, IdOsoba BIGINT NOT NULL)
CREATE TABLE #OsobaUzivatel  (IdUzivatel BIGINT NOT NULL UNIQUE, IdOsoba BIGINT NOT NULL)
CREATE TABLE #OsobaVlastnik  (IdVlastnik BIGINT NOT NULL UNIQUE, IdOsoba BIGINT NOT NULL)

GO
PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Zeme data';
GO

:r .\Scripts\001_Zeme.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Kraj data';
GO

:r .\Scripts\002_Kraj.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Okres data';
GO

:r .\Scripts\003_Okres.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Ulice data';
GO

:r .\Scripts\004_Ulice.sql
GO
PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Mesto data';
GO

:r .\Scripts\005_Mesto.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating OkresKraj data';
GO

:r .\Scripts\006_OkresKraj.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating MestoOkres data';
GO

:r .\Scripts\007_MestoOkres.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Adresa data';
GO

:r .\Scripts\008_Adresa.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Osoba data';
GO

:r .\Scripts\009_Osoba.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating KontaktTelefon data';
GO

:r .\Scripts\010_KontaktTelefon.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating KontaktEmail data';
GO

:r .\Scripts\011_KontaktEmail.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Uzivtel data';
GO

:r .\Scripts\012_Uzivatel.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating UzivatelTelefon data';
GO

:r .\Scripts\013_UzivatelTelefon.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating UzivatelEmail data';
GO

:r .\Scripts\014_UzivatelEmail.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Vlastnik data';
GO

:r .\Scripts\015_Vlastnik.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating VlastnikTelefon data';
GO

:r .\Scripts\016_VlastnikTelefon.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating VlastnikEmail data';
GO

:r .\Scripts\017_VlastnikEmail.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating PravniForma data';
GO

:r .\Scripts\018_PravniForma.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Spolecnost data';
GO

:r .\Scripts\019_Spolecnost.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Prodejce data';
GO

:r .\Scripts\020_Prodejce.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating ProdejceTelefon data';
GO

:r .\Scripts\021_ProdejceTelefon.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating ProdejceEmail data';
GO

:r .\Scripts\022_ProdejceEmail.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating TypNemovitosti data';
GO

:r .\Scripts\023_TypNemovitosti.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating StavNemovitosti data';
GO

:r .\Scripts\024_StavNemovitosti.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Nemovitost data';
GO

:r .\Scripts\025_Nemovitost.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Aukce data';
GO

:r .\Scripts\026_Aukce.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Creating Priho data';
GO

:r .\Scripts\027_Prihoz.sql
GO

PRINT CAST(FORMAT(GETDATE(), 'hh:mm', 'cs-CS') AS VARCHAR) + ' - '  + N'Finish';
GO

DROP TABLE #AdresaNemovitost
DROP TABLE #AdresaProdejce
DROP TABLE #AdresaUzivatel
DROP TABLE #AdresaVlastnik
      
DROP TABLE #OsobaProdejce
DROP TABLE #OsobaUzivatel
DROP TABLE #OsobaVlastnik

SET NOCOUNT OFF