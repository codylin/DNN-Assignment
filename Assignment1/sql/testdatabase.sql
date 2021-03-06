USE [master]
GO
/****** Object:  Database [Dnn Assignment]    Script Date: 2016-12-12 10:05:50 AM ******/
CREATE DATABASE [Dnn Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dnn Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Dnn Assignment.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dnn Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Dnn Assignment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dnn Assignment] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dnn Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dnn Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dnn Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dnn Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dnn Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dnn Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dnn Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dnn Assignment] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Dnn Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dnn Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dnn Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dnn Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dnn Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dnn Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dnn Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dnn Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dnn Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dnn Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dnn Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dnn Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dnn Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dnn Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dnn Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dnn Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dnn Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Dnn Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Dnn Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dnn Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dnn Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dnn Assignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dnn Assignment', N'ON'
GO
USE [Dnn Assignment]
GO
/****** Object:  User [tester]    Script Date: 2016-12-12 10:05:50 AM ******/
CREATE USER [tester] FOR LOGIN [tester] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tester]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tester]
GO
/****** Object:  StoredProcedure [dbo].[spCreatePerson]    Script Date: 2016-12-12 10:05:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePerson]
	-- Add the parameters for the stored procedure here
		@EMAIL_PARAM      AS varchar(50) = NULL, 
		@FIRSTNAME_PARAM    AS varchar(50) = NULL, 
		@LASTNAME_PARAM     AS varchar(50) = NULL, 
		@USERNAME_PARAM AS varchar(50) = NULL 
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].[CustomerList] (Username, firstName, lastName, Email, Joined)
	SELECT @USERNAME_PARAM, @FIRSTNAME_PARAM, @LASTNAME_PARAM,
	@EMAIL_PARAM, GETDATE();
END

GO
/****** Object:  StoredProcedure [dbo].[spListResults]    Script Date: 2016-12-12 10:05:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spListResults]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Concat(firstName, ' ', lastName) AS Name,
	Username,
	Email,
	Joined
	FROM dbo.CustomerList;
END

GO
/****** Object:  Table [dbo].[CustomerList]    Script Date: 2016-12-12 10:05:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerList](
	[Username] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Joined] [date] NOT NULL,
 CONSTRAINT [PK_CustomerList] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Dnn Assignment] SET  READ_WRITE 
GO
