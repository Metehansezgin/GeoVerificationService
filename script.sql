USE [master]
GO
/****** Object:  Database [GeoVerificationServiceDB]    Script Date: 1.04.2021 15:44:41 ******/
CREATE DATABASE [GeoVerificationServiceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeoVerificationServiceDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeoVerificationServiceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeoVerificationServiceDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeoVerificationServiceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GeoVerificationServiceDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeoVerificationServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeoVerificationServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GeoVerificationServiceDB] SET QUERY_STORE = OFF
GO
USE [GeoVerificationServiceDB]
GO
/****** Object:  Table [dbo].[REQUEST_GEO_01]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUEST_GEO_01](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [nchar](50) NULL,
	[Longitude] [nchar](50) NULL,
 CONSTRAINT [PK_REQUEST_GEO_01] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REQUEST_GEO_02]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUEST_GEO_02](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [nchar](50) NULL,
	[Longitude] [nchar](50) NULL,
 CONSTRAINT [PK_REQUEST_GEO_02] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REQUEST_GEO_DONE]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUEST_GEO_DONE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [nchar](50) NULL,
	[Longitude] [nchar](50) NULL,
	[Address] [nchar](1000) NULL,
 CONSTRAINT [PK_REQUEST_GEO_DONE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_REQUEST_GEO_01_DELETE]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_REQUEST_GEO_01_DELETE]

@id int
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     DELETE  dbo.REQUEST_GEO_01 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_REQUEST_GEO_01_GET]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_REQUEST_GEO_01_GET] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from dbo.REQUEST_GEO_01
END
GO
/****** Object:  StoredProcedure [dbo].[sp_REQUEST_GEO_02_DELETE]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_REQUEST_GEO_02_DELETE]

@id int
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     DELETE  dbo.REQUEST_GEO_02 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_REQUEST_GEO_02_GET]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_REQUEST_GEO_02_GET] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from dbo.REQUEST_GEO_02
END
GO
/****** Object:  StoredProcedure [dbo].[sp_REQUEST_GEO_DONE_ADD]    Script Date: 1.04.2021 15:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_REQUEST_GEO_DONE_ADD]

@Latitude varchar(50), 
@Longitude varchar(50), 
@Address nvarchar(1000)
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.REQUEST_GEO_DONE (Latitude,Longitude,Address)
	Values(@Latitude,@Longitude,@Address)
END
GO
USE [master]
GO
ALTER DATABASE [GeoVerificationServiceDB] SET  READ_WRITE 
GO
