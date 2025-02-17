USE [master]
GO

CREATE DATABASE [OnlineExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineExam', FILENAME = N'D:\CC Project\Online Examination System\OnlineExam.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineExam_log', FILENAME = N'D:\CC Project\Online Examination System\OnlineExam_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineExam] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineExam] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExam] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineExam] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineExam]
GO
/****** Object:  Table [dbo].[mcqCourseDetail]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcqCourseDetail](
	[courseID] [varchar](50) NULL,
	[courseName] [varchar](300) NULL,
	[examNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcqQS]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcqQS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course] [varchar](50) NULL,
	[qsId] [varchar](50) NULL,
	[qsNo] [varchar](50) NULL,
	[qs] [varchar](700) NULL,
	[op1] [varchar](300) NULL,
	[op2] [varchar](300) NULL,
	[op3] [varchar](300) NULL,
	[op4] [varchar](300) NULL,
	[ans] [varchar](300) NULL,
	[tag] [varchar](100) NULL,
	[eTime] [varchar](50) NULL,
 CONSTRAINT [PK_mcqQS2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcqTaken]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcqTaken](
	[studentID] [varchar](50) NULL,
	[courseID] [varchar](50) NULL,
	[courseName] [varchar](300) NULL,
	[examNo] [varchar](50) NULL,
	[mark] [numeric](10, 2) NULL,
	[eMark] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[text]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[text](
	[id] [varchar](50) NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryAns]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryAns](
	[studentID] [varchar](50) NULL,
	[courseID] [varchar](50) NULL,
	[qsID] [varchar](50) NULL,
	[qsNo] [varchar](50) NULL,
	[qsA] [varchar](500) NULL,
	[ansA] [varchar](1000) NULL,
	[markA] [numeric](10, 2) NULL,
	[isAprove] [varchar](50) NULL,
	[abc] [varchar](50) NULL,
	[def] [varchar](50) NULL,
	[qsB] [varchar](500) NULL,
	[markB] [numeric](10, 2) NULL,
	[ansB] [varchar](1000) NULL,
	[mark] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryCourseDetail]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryCourseDetail](
	[courseID] [varchar](50) NULL,
	[courseName] [varchar](300) NULL,
	[examNo] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryCourseQueue]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryCourseQueue](
	[student_ID] [varchar](50) NULL,
	[courseID] [varchar](50) NULL,
	[qsID] [varchar](50) NULL,
	[abc] [varchar](50) NULL,
	[def] [varchar](50) NULL,
	[aaa] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryQS]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryQS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course] [varchar](50) NULL,
	[qsId] [varchar](50) NULL,
	[qsNo] [varchar](50) NULL,
	[qsA] [varchar](700) NULL,
	[markA] [numeric](10, 2) NULL,
	[qsB] [varchar](700) NULL,
	[markB] [numeric](10, 2) NULL,
	[eTime] [varchar](50) NULL,
	[abc] [nchar](10) NULL,
 CONSTRAINT [PK_theoryQS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryQueue]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryQueue](
	[courseID] [varchar](50) NULL,
	[courseName] [varchar](100) NULL,
	[count] [varchar](50) NULL,
	[tmp1] [varchar](50) NULL,
	[tmp2] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[theoryTaken]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[theoryTaken](
	[studentID] [varchar](50) NULL,
	[courseID] [varchar](50) NULL,
	[courseName] [varchar](300) NULL,
	[examNo] [varchar](50) NULL,
	[mark] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userInfo]    Script Date: 5/30/2021 4:25:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userInfo](
	[id] [varchar](20) NOT NULL,
	[name] [varchar](50) NULL,
	[department] [varchar](50) NULL,
	[email] [varchar](30) NULL,
	[semester] [varchar](50) NULL,
	[gender] [varchar](10) NULL,
	[password] [varchar](50) NULL,
	[fatherName] [varchar](50) NULL,
	[hall] [varchar](50) NULL,
	[image] [varchar](50) NULL,
	[no_of_exam] [int] NULL,
	[total_mark] [float] NULL,
	[rank] [int] NULL,
	[abc] [varchar](50) NULL,
	[def] [varchar](50) NULL,
 CONSTRAINT [PK_userInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [OnlineExam] SET  READ_WRITE 
GO
