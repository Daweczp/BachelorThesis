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

:r .\Scripts\001_Zeme.sql
GO

:r .\Scripts\002_Kraj.sql
GO

:r .\Scripts\003_Okres.sql
GO

:r .\Scripts\004_Ulice.sql
GO

:r .\Scripts\005_Mesto.sql
GO

:r .\Scripts\006_OkresKraj.sql
GO

:r .\Scripts\007_MestoOkres.sql
GO

:r .\Scripts\008_Adresa.sql
GO

:r .\Scripts\009_Osoba.sql
GO

:r .\Scripts\010_KontaktTelefon.sql
GO

:r .\Scripts\011_KontaktEmail.sql
GO

:r .\Scripts\012_Uzivatel.sql
GO

:r .\Scripts\013_UzivatelTelefon.sql
GO

:r .\Scripts\014_UzivatelEmail.sql
GO

:r .\Scripts\015_Vlastnik.sql
GO

:r .\Scripts\016_VlastnikTelefon.sql
GO

:r .\Scripts\017_VlastnikEmail.sql
GO

:r .\Scripts\018_PravniForma.sql
GO

:r .\Scripts\019_Spolecnost.sql
GO

:r .\Scripts\020_Prodejce.sql
GO

:r .\Scripts\021_ProdejceTelefon.sql
GO

:r .\Scripts\022_ProdejceEmail.sql
GO

:r .\Scripts\023_TypNemovitosti.sql
GO

:r .\Scripts\024_StavNemovitosti.sql
GO

:r .\Scripts\025_Nemovitost.sql
GO

:r .\Scripts\026_Aukce.sql
GO

DROP TABLE #AdresaNemovitost
DROP TABLE #AdresaProdejce
DROP TABLE #AdresaUzivatel
DROP TABLE #AdresaVlastnik
      
DROP TABLE #OsobaProdejce
DROP TABLE #OsobaUzivatel
DROP TABLE #OsobaVlastnik

SET NOCOUNT OFF