USE [master]
GO
/****** Object:  Database [MovieDatabase]    Script Date: 14-08-2022 18:16:49 ******/
CREATE DATABASE [MovieManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MovieManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MovieManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MovieManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieDatabase', N'ON'
GO
ALTER DATABASE [MovieManagement] SET QUERY_STORE = OFF
GO
USE [MovieManagement]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(100,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieLanguage]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieLanguage](
	[MovieLanguagePK] [int] IDENTITY(11,1) NOT NULL,
	[MovieID] [int] NULL,
	[LanguageID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieLanguagePK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1000,1) NOT NULL,
	[MovieName] [varchar](50) NOT NULL,
	[MovieCategoryID] [int] NOT NULL,
	[MovieRating] [float] NOT NULL,
	[LeadActor] [varchar](500) NOT NULL,
	[ReleaseYear] [int] NOT NULL,
	[MovieDescription] [varchar](500) NOT NULL,
	[MovieBudget] [varchar](50) NOT NULL,
	[MovieDuration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [varchar](50) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14-08-2022 18:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(10,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (100, N'Action')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (101, N'Thriller')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (102, N'Horror')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (103, N'Sci-Fi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (104, N'Rom-Com')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (105, N'Drama')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (108, N'Comedy')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (1, N'Hindi')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (2, N'English')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (3, N'Tamil')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (4, N'Telugu')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (5, N'Kannada')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (6, N'Malyalam')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (7, N'Marathi')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (8, N'Bengoli')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (9, N'Punjabi')
INSERT [dbo].[Languages] ([LanguageID], [LanguageName]) VALUES (11, N'Odia')
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieLanguage] ON 

INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (13, 1004, 1)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (14, 1004, 3)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (15, 1004, 4)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (16, 1002, 1)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (17, 1002, 2)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (18, 1011, 1)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (19, 1011, 9)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (20, 1012, 3)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (21, 1012, 4)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (22, 1012, 5)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (23, 1012, 6)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (24, 1013, 1)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (25, 1013, 2)
INSERT [dbo].[MovieLanguage] ([MovieLanguagePK], [MovieID], [LanguageID]) VALUES (26, 1013, 5)
SET IDENTITY_INSERT [dbo].[MovieLanguage] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieName], [MovieCategoryID], [MovieRating], [LeadActor], [ReleaseYear], [MovieDescription], [MovieBudget], [MovieDuration]) VALUES (1002, N'Conjuring', 102, 9.2, N'Jhonny Dpp', 2000, N'Horror Movie', N'50Cr', 100)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [MovieCategoryID], [MovieRating], [LeadActor], [ReleaseYear], [MovieDescription], [MovieBudget], [MovieDuration]) VALUES (1004, N'Bahubali', 100, 9.7, N'Prabhas, Anushka Shetty', 2019, N'Action Movie', N'90Cr', 197)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [MovieCategoryID], [MovieRating], [LeadActor], [ReleaseYear], [MovieDescription], [MovieBudget], [MovieDuration]) VALUES (1011, N'Laal Singh Chaddha', 105, 7.8, N'Amir Khan, Kareena Kapoor Khan', 2022, N'Drama Movie ', N'50Cr', 100)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [MovieCategoryID], [MovieRating], [LeadActor], [ReleaseYear], [MovieDescription], [MovieBudget], [MovieDuration]) VALUES (1012, N'Viruman', 104, 7, N'Aditi Shankar, Karthi', 1978, N'Rom-Com Movie', N'20Cr', 121)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [MovieCategoryID], [MovieRating], [LeadActor], [ReleaseYear], [MovieDescription], [MovieBudget], [MovieDuration]) VALUES (1013, N'SpriderMan No Way Home', 100, 9, N'Tom Holland', 2021, N'Action Movie', N'400Cr', 150)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'R001', N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'R002', N'Customer')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (10, N'Ankit', N'AnkitRastogi', N'R002')
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (11, N'Ankit', N'AnkitMohanty', N'R002')
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (12, N'Ankan', N'AnkanBarik', N'R002')
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (13, N'Anmol', N'AnmolSoni', N'R001')
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (14, N'Arpit', N'ArpitTiwari', N'R001')
INSERT [dbo].[Users] ([UserID], [UserName], [UserPassword], [RoleID]) VALUES (15, N'Shashank ', N'Shashank123', N'R002')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[MovieLanguage]  WITH CHECK ADD  CONSTRAINT [fk_LangID] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[MovieLanguage] CHECK CONSTRAINT [fk_LangID]
GO
ALTER TABLE [dbo].[MovieLanguage]  WITH CHECK ADD  CONSTRAINT [fk_MovID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieLanguage] CHECK CONSTRAINT [fk_MovID]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [fk_MovCatID] FOREIGN KEY([MovieCategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [fk_MovCatID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_RoleID]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD CHECK  (([MovieRating]<=(10)))
GO
/****** Object:  StoredProcedure [dbo].[addLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[addLanguage]
 (
 @languageName varchar(50)
 )          
 as
 insert into Languages values (@languageName)
GO
/****** Object:  StoredProcedure [dbo].[Addmovie]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Addmovie]
	(
		@moviename varchar(50),
		@moviecatid int,
		@movierating float,
		@leadactor varchar(500),
		@releaseyear int,
		@moviedescription varchar(500),
		@moviebudget varchar(50),
		@movieduration int
	)
AS
BEGIN
	insert into Movies values (@moviename , @moviecatid , @movierating , @leadactor , @releaseyear ,@moviedescription, @moviebudget, @movieduration )
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryList]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CategoryList]
As
select * from Category
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteCategory]
(
@CategoryId int
)
As
begin
delete from Category where CategoryID = @CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeleteLanguage]
 (
 @LanguageID int
 )
 as
 delete from  Languages where LanguageID= @LanguageID
GO
/****** Object:  StoredProcedure [dbo].[InsertCategory]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertCategory]
(
@CategoryName varchar(50)
)
As
insert into Category values(@CategoryName)
GO
/****** Object:  StoredProcedure [dbo].[searchlanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[searchlanguage]
		@language varchar(50)
AS
BEGIN
	SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM MovieLanguage
JOIN Movies
ON MovieLanguage.MovieID = Movies.MovieID
Join Category On Category.CategoryID = Movies.MovieCategoryID
Join Languages ON MovieLanguage.LanguageID = Languages.LanguageID

where Languages.LanguageName = @language;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMovieByCategory]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchMovieByCategory]
(
@CategoryName varchar(50)
)
As
begin
SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID
where Category.CategoryName = @CategoryName;
End
GO
/****** Object:  StoredProcedure [dbo].[searchyear]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[searchyear]
	@year int
AS
BEGIN
	SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID where ReleaseYear = @year;
END
GO
/****** Object:  StoredProcedure [dbo].[ShowLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ShowLanguage]
 as
 select * from Languages
GO
/****** Object:  StoredProcedure [dbo].[SPaddMovieLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPaddMovieLanguage](
@MovieId int,
@LanguageId int)
As
insert into MovieLanguage values(@MovieId,@LanguageId);
GO
/****** Object:  StoredProcedure [dbo].[SPdeletemovie]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPdeletemovie]
	@movieid int
 AS
BEGIN
	delete from MovieLanguage where MovieID = @movieid;
	delete from Movies where MovieID = @movieid;
END
GO
/****** Object:  StoredProcedure [dbo].[SPdeletemovielang]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPdeletemovielang]
	@movielanguagepk int
AS
BEGIN
	delete from MovieLanguage where MovieLanguagePK = @movielanguagepk;
END
GO
/****** Object:  StoredProcedure [dbo].[SPListAllMovieLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SPListAllMovieLanguage]
AS
BEGIN
	select * from MovieLanguage;
END
GO
/****** Object:  StoredProcedure [dbo].[SPlistallmovies]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPlistallmovies]
AS
BEGIN
	SELECT MovieID,MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[SPLogin]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPLogin]
    (
        
        @Passwd varchar(20),
        @userName varchar(15)
    )
    as
        DECLARE @RetVal INT
        DECLARE @UserId INT
    SELECT @UserId = userId FROM Users WHERE UserName = @userName and UserPassword = @Passwd
    
        IF @UserId IS NOT NULL
        BEGIN
            IF EXISTS (SELECT 1 FROM Users WHERE RoleId = 'R001' and UserId=@userId)
                    BEGIN
                    SET @RetVal = 1
                    END
            
             IF EXISTS (SELECT 2 FROM Users WHERE RoleId = 'R002' and UserId=@userId)
                    BEGIN
                    SET @RetVal = 2
                    END
            
        END
    ELSE
        BEGIN
            SET @RetVal = 3
        END
    SELECT @RetVal AS RetVal, @UserId AS UserID
GO
/****** Object:  StoredProcedure [dbo].[SPRegistration]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure  [dbo].[SPRegistration]
(@UserName varchar(50)
,@UserPassword varchar(50),
@RoleID varchar(50)
)
as
Begin
insert into Users values (@UserName,@UserPassword,@RoleID)
End
GO
/****** Object:  StoredProcedure [dbo].[SPSearchByName]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPSearchByName]
	@name varchar(50)
AS
BEGIN
	SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID where MovieName like '%'+@name+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SPsearchbyrating]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPsearchbyrating]
	@rating varchar(5)
AS
BEGIN
	SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID where MovieRating = @rating;
END
GO
/****** Object:  StoredProcedure [dbo].[SPsearchleadactor]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPsearchleadactor]
	@leadactor varchar(50)
AS
BEGIN
	SELECT MovieName, CategoryName,MovieRating,LeadActor,ReleaseYear,MovieDescription,MovieBudget,MovieDuration
FROM Category
JOIN Movies
ON Category.CategoryID= Movies.MovieCategoryID where LeadActor like '%'+@LeadActor+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SPupdateMovieLanguage]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SPupdateMovieLanguage](
@MoviLangId int,
@MovieId int,
@LanguageId int
)
As
update MovieLanguage set MovieID = @MovieId,LanguageID =@LanguageId where MovieLanguagePK=@MoviLangId
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateCategory]
(
@CategoryID int,
@CategoryName varchar(50)
)
As
update Category set CategoryName = @CategoryName where CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[updatemovie]    Script Date: 14-08-2022 18:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updatemovie]
(
		@movieid int,
		@moviename varchar(50),
		@moviecatid int,
		@movierating float,
		@leadactor varchar(500),
		@releaseyear int,
		@moviedescription varchar(500),
		@moviebudget varchar(50),
		@movieduration int
	)
AS
BEGIN
	update Movies set MovieName = @moviename, MovieCategoryID = @moviecatid, MovieRating = @movierating, LeadActor = @leadactor, ReleaseYear = @releaseyear, MovieDescription = @moviedescription, MovieBudget = @moviebudget, MovieDuration = @movieduration where MovieID = @movieid
END
GO
USE [master]
GO
ALTER DATABASE [MovieDatabase] SET  READ_WRITE 
GO
