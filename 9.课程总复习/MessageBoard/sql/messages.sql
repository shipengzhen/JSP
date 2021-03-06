USE [master]
GO
IF exists( select * from SYSDATABASES where name='messages')
drop database messages
go
/****** Object:  Database [messages]    Script Date: 2017/6/30 9:14:53 ******/
CREATE DATABASE [messages]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'messages', FILENAME = N'C:\学习文件\Java\JSP\9.课程总复习\MessageBoard\sql\messages.mdf' , SIZE = 5MB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'messages_log', FILENAME = N'C:\学习文件\Java\JSP\9.课程总复习\MessageBoard\sql\messages_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [messages] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [messages].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [messages] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [messages] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [messages] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [messages] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [messages] SET ARITHABORT OFF 
GO
ALTER DATABASE [messages] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [messages] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [messages] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [messages] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [messages] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [messages] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [messages] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [messages] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [messages] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [messages] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [messages] SET  DISABLE_BROKER 
GO
ALTER DATABASE [messages] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [messages] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [messages] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [messages] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [messages] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [messages] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [messages] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [messages] SET RECOVERY FULL 
GO
ALTER DATABASE [messages] SET  MULTI_USER 
GO
ALTER DATABASE [messages] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [messages] SET DB_CHAINING OFF 
GO
ALTER DATABASE [messages] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [messages] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'messages', N'ON'
GO
USE [messages]
GO
/****** Object:  Table [dbo].[TBL_Message]    Script Date: 2017/6/30 9:14:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](50) NOT NULL,
	[author] [varchar](50) NOT NULL,
	[postTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [messages] SET  READ_WRITE 
GO

select * from TBL_Message

select top 3 message,postTime from TBL_Message where id not in(select 0 id from TBL_Message)
insert into TBL_Message values('2','3','')

select top 3 * from TBL_Message where id not in(select top 0 id from TBL_Message)
select top 3 * from TBL_Message where id not in(select top 0 id from TBL_Message)
