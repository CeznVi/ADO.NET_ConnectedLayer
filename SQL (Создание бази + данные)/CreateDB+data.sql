USE [master]
GO
/****** Object:  Database [tested]    Script Date: 14.03.2023 21:44:30 ******/
CREATE DATABASE [tested]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tested', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tested.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tested_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tested_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tested] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tested].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tested] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tested] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tested] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tested] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tested] SET ARITHABORT OFF 
GO
ALTER DATABASE [tested] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tested] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tested] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tested] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tested] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tested] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tested] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tested] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tested] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tested] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tested] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tested] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tested] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tested] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tested] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tested] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tested] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tested] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tested] SET  MULTI_USER 
GO
ALTER DATABASE [tested] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tested] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tested] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tested] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tested] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tested] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tested] SET QUERY_STORE = OFF
GO
USE [tested]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14.03.2023 21:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](16) NOT NULL,
	[email] [nvarchar](128) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersInfo]    Script Date: 14.03.2023 21:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[fio] [nvarchar](128) NOT NULL,
	[inn] [nvarchar](13) NOT NULL,
	[birthDate] [datetime] NOT NULL,
	[gender] [nvarchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [login], [email], [password]) VALUES (1, N'admin', N'admin@admin.com', N'sdalajsfij294rkflsflsmdflsdfsfs')
INSERT [dbo].[users] ([Id], [login], [email], [password]) VALUES (2, N'editor', N'editor@admin.com', N'sdasdsadalajsfij294rkflsflsmdflsdfsfs')
INSERT [dbo].[users] ([Id], [login], [email], [password]) VALUES (7, N'SuperLOGIN', N'SuperEMAIL@g.com', N'9c62e3cee7a2c05ba085207e8849e81923b8738934b72158345623b7c5ddd0ea')
INSERT [dbo].[users] ([Id], [login], [email], [password]) VALUES (12, N'tested', N'1234@gmail.com', N'TESTEDPASS')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[usersInfo] ON 

INSERT [dbo].[usersInfo] ([Id], [userId], [fio], [inn], [birthDate], [gender]) VALUES (1, 1, N'Administrator sadasd Aasas', N'12321312', CAST(N'2005-08-15T00:00:00.000' AS DateTime), N'male')
INSERT [dbo].[usersInfo] ([Id], [userId], [fio], [inn], [birthDate], [gender]) VALUES (2, 2, N'Users sa2dasd Aasas', N'12321312', CAST(N'2003-08-15T00:00:00.000' AS DateTime), N'famale')
INSERT [dbo].[usersInfo] ([Id], [userId], [fio], [inn], [birthDate], [gender]) VALUES (3, 7, N'Name Familia Otchstvo', N'12314556', CAST(N'1990-01-03T00:00:00.000' AS DateTime), N'male')
INSERT [dbo].[usersInfo] ([Id], [userId], [fio], [inn], [birthDate], [gender]) VALUES (4, 12, N'Test Testovich Testerov', N'32131244', CAST(N'1950-05-05T00:00:00.000' AS DateTime), N'male')
SET IDENTITY_INSERT [dbo].[usersInfo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__7838F272F1EF480B]    Script Date: 14.03.2023 21:44:31 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164D83435B7]    Script Date: 14.03.2023 21:44:31 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__usersInf__CB9A1CFE2586D0FC]    Script Date: 14.03.2023 21:44:31 ******/
ALTER TABLE [dbo].[usersInfo] ADD UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usersInfo]  WITH CHECK ADD CHECK  (([gender]='famale' OR [gender]='male'))
GO
/****** Object:  StoredProcedure [dbo].[getFullUserInfo]    Script Date: 14.03.2023 21:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getFullUserInfo] @Id INT
as
SELECT
	users.Id,
	users.login
From users
WHERE users.Id = @Id
GO
USE [master]
GO
ALTER DATABASE [tested] SET  READ_WRITE 
GO
