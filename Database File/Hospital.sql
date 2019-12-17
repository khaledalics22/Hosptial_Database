USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 12/18/2019 1:14:19 AM ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Users\IslamAhmed\Desktop\Projects\DB_Project\Hosptial-ya-rab\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Users\IslamAhmed\Desktop\Projects\DB_Project\Hosptial-ya-rab\Hospital_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AID] [int] NOT NULL,
	[Dssn] [int] NOT NULL,
	[Pssn] [int] NOT NULL,
	[Date_Time] [smalldatetime] NOT NULL,
	[Diagnose] [varchar](50) NULL,
	[Canceled] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[CID] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[numInFloor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dnum] [int] NOT NULL,
	[Dname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependencies]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependencies](
	[Name] [varchar](50) NOT NULL,
	[Pssn] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [varchar](50) NULL,
	[Relation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Pssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DependentDiagnose]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DependentDiagnose](
	[Name] [varchar](50) NOT NULL,
	[Pssn] [int] NOT NULL,
	[Diagnose] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Pssn] ASC,
	[Diagnose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc_Room]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc_Room](
	[Dssn] [int] NOT NULL,
	[RID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dssn] ASC,
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Dssn] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[House_Num] [int] NOT NULL,
	[Shift_From] [time](0) NOT NULL,
	[Shift_To] [time](0) NOT NULL,
	[Dno] [int] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor_Clinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_Clinic](
	[Dssn] [int] NOT NULL,
	[CID] [int] NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC,
	[StartTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[Code] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ESSN] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](2) NOT NULL,
	[Salary] [int] NOT NULL,
	[Certificate] [varchar](50) NULL,
	[Job] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Shift_From] [time](0) NOT NULL,
	[Shift_To] [time](0) NOT NULL,
	[Dno] [int] NULL,
 CONSTRAINT [PK__Employee__230E9FEC073761D5] PRIMARY KEY CLUSTERED 
(
	[ESSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse](
	[Nssn] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[Shift_From] [time](0) NOT NULL,
	[Shift_To] [time](0) NOT NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse_Clinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse_Clinic](
	[Nssn] [int] NOT NULL,
	[CID] [int] NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC,
	[StartTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse_Room]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse_Room](
	[Nssn] [int] NOT NULL,
	[RID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nssn] ASC,
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Pssn] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Insurance] [varchar](50) NULL,
	[Age] [int] NULL,
	[Phone] [varchar](50) NOT NULL,
	[City] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Medicine]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Medicine](
	[AID] [int] NOT NULL,
	[medicine] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC,
	[medicine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDiagnose]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnose](
	[Pssn] [int] NOT NULL,
	[Diagnose] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pssn] ASC,
	[Diagnose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Pssn] [int] NOT NULL,
	[RID] [int] NOT NULL,
	[Sdate] [date] NOT NULL,
	[Edate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pssn] ASC,
	[RID] ASC,
	[Sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RID] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[numInFloor] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldDrugs]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldDrugs](
	[Code] [int] NOT NULL,
	[Date_Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__SoldDrug__D52FDD76EFF0F421] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[Date_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1002, 1, 502, CAST(N'2020-01-02T06:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1003, 10, 503, CAST(N'2020-01-02T18:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1004, 12, 504, CAST(N'2020-01-03T18:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1005, 19, 505, CAST(N'2020-01-04T21:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1006, 14, 506, CAST(N'2020-01-05T21:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1007, 7, 507, CAST(N'2020-01-04T06:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1009, 18, 509, CAST(N'2020-01-07T12:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1010, 14, 510, CAST(N'2020-01-08T21:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1011, 5, 511, CAST(N'2020-01-05T09:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1012, 13, 512, CAST(N'2020-01-01T12:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1013, 5, 513, CAST(N'2020-01-03T09:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1014, 8, 514, CAST(N'2020-01-04T12:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1015, 12, 515, CAST(N'2020-01-06T18:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1016, 3, 516, CAST(N'2020-01-07T15:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1017, 16, 517, CAST(N'2020-01-06T15:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1018, 9, 518, CAST(N'2020-01-01T06:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1019, 2, 519, CAST(N'2020-01-02T12:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled]) VALUES (1020, 10, 520, CAST(N'2020-01-03T18:00:00' AS SmallDateTime), NULL, N'FALSE')
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (201, 1, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (202, 1, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (203, 1, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (204, 1, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (205, 1, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (206, 2, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (207, 2, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (208, 2, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (209, 2, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (210, 2, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (211, 3, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (212, 3, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (213, 3, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (214, 3, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (215, 3, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (216, 3, 6)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (217, 4, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (218, 4, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (219, 4, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (220, 4, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (221, 4, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (222, 4, 6)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (223, 5, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (224, 5, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (225, 5, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (226, 5, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (227, 5, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (228, 6, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (229, 6, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (230, 6, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (231, 6, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (232, 6, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (233, 6, 6)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (234, 7, 1)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (235, 7, 2)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (236, 7, 3)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (237, 7, 4)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (238, 7, 5)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (239, 7, 6)
INSERT [dbo].[Clinic] ([CID], [Floor], [numInFloor]) VALUES (240, 7, 7)
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (8, N'Accounting')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (10, N'Cleaning')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (4, N'Emergency')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (7, N'Neurology')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (6, N'Ophthalmology')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (1, N'Orthopaedics')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (2, N'Pharmacy')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (3, N'Physiotherapy')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (9, N'Reception')
INSERT [dbo].[Department] ([Dnum], [Dname]) VALUES (5, N'Surgery')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Abdelrahman', 509, 62, N'01104782149', N'Father')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Abdullah', 510, 18, N'01247903175', N'Son')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Ahmed', 503, 42, N'01254836321', N'Father')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Fady', 501, 24, N'01154781214', N'Brother')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Gamal', 507, 38, N'01514705321', N'Brother')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Heba', 502, 23, N'01552183321', N'Sister')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Hoda', 505, 51, N'01054876632', N'Mother')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Ibtsam', 515, 31, N'01089894021', N'Sister')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Mohsen', 506, 23, N'01120045637', N'Son')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Nameer', 511, 35, N'01084527061', N'Sister')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Nermeen', 513, 55, N'01579560442', N'Mother')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Salama', 504, 50, N'01521589647', N'Father')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Seif', 514, 26, N'01114874220', N'Brother')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Soliman', 512, 65, N'01087460198', N'Father')
INSERT [dbo].[Dependencies] ([Name], [Pssn], [Age], [Phone], [Relation]) VALUES (N'Yara', 508, 10, N'01254790761', N'Daughter')
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (1, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (1, 321)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (2, 302)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (2, 322)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (3, 303)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (3, 323)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (5, 305)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (5, 325)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (6, 306)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (6, 326)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (7, 307)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (7, 327)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (8, 308)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (8, 328)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (9, 309)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (9, 329)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (10, 310)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (10, 330)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (11, 311)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (11, 331)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (12, 312)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (12, 332)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (13, 313)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (13, 333)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (14, 314)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (14, 334)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (15, 315)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (15, 335)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (16, 316)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (16, 336)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (17, 317)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (17, 337)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (18, 318)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (18, 338)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (19, 319)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (19, 339)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (1, N'Shawky', N'Ahmed', N'01048724338', 25, 7500, N'Giza', N'Mohy', 5, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 5, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (2, N'Farida', N'Kasem', N'01557486314', 28, 8600, N'Cairo', N'Alteraa', 10, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 6, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (3, N'Medhat', N'Emad', N'01248362545', 25, 10500, N'Giza', N'Morad', 8, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 5, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (5, N'Magdy', N'Samir', N'01221546855', 31, 9200, N'Cairo', N'Alshaheed', 18, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 3, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (6, N'Amr', N'Hany', N'01023135487', 35, 13000, N'Giza', N'Algamaa', 35, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 7, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (7, N'Karim', N'Moataz', N'01521657685', 34, 12500, N'Cairo', N'Serag', 18, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (8, N'Mahmoud', N'Ashraf', N'01067865665', 40, 9800, N'Giza', N'Mekki', 10, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 4, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (9, N'Hamada', N'Sherif', N'01254544589', 45, 8000, N'Cairo', N'Ahmed Zaki', 30, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 2, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (10, N'Saly', N'Adel', N'01031232113', 52, 7800, N'Alexandrea', N'Alkournish', 20, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 6, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (11, N'Fady', N'Mohamed', N'01232654878', 48, 11000, N'Cairo', N'105', 80, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 7, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (12, N'Ezzat', N'ghareb', N'01048451522', 43, 14000, N'Cairo', N'9', 12, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 4, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (13, N'Sereen', N'Saad', N'01112135458', 33, 12000, N'Alexandrea', N'Almahkama', 15, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (14, N'Attia', N'Samy', N'01565465123', 27, 11500, N'Menoufia', N'Alzahraa', 13, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (15, N'Mohamed', N'Ashour', N'01533548786', 26, 10900, N'Sinai', N'Ahmed Nagiub', 41, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 6, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (16, N'Shahenda', N'Walid', N'01032131548', 44, 9800, N'Matrouh', N'Alexandria', 14, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 2, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (17, N'Menna', N'Azaro', N'01132132158', 38, 7600, N'Menoufia', N'Shehab', 1, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 3, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (18, N'Ahmed', N'Soliman', N'01065465456', 31, 8000, N'Aswan', N'Alnoba', 4, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 5, CAST(N'2017-02-24' AS Date))
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (19, N'Seif', N'Abdullah', N'01165662211', 55, 9300, N'Suez', N'Darwish', 6, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 3, NULL)
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (1, 201, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (2, 202, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (3, 203, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (5, 205, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (6, 206, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (7, 207, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (8, 208, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (9, 209, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (10, 210, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (11, 211, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (12, 212, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (13, 213, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (14, 214, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (15, 215, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (16, 216, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (17, 217, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (18, 218, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime]) VALUES (19, 219, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5001, N'Amoxicilin', 51, 11.25)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5002, N'Vicodin', 2, 9.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5003, N'Asprine', 40, 0.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5004, N'Vitamin', 80, 5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5005, N'Ezafluor', 60, 13.75)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5006, N'Revo', 20, 20.25)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5007, N'Panadol', 25, 15.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5008, N'Panadol extra', 95, 7.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5009, N'Cephalexin', 0, 11.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5010, N'Roxithromycin', 65, 8)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5011, N'Tabramycin', 64, 4)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5012, N'Tinidazole', 70, 2)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5013, N'Nitrofurantoin', 44, 3.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5014, N'Minocycline', 30, 2.75)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5015, N'Dapsone', 20, 14.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5016, N'Fusidic acid', 50, 16.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5017, N'Ofloxacin', 44, 14)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5018, N'Cefalotin', 0, 18.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5019, N'Antocid', 29, 20.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5020, N'depovit', 25, 32.5)
INSERT [dbo].[Drugs] ([Code], [Name], [Quantity], [Price]) VALUES (5021, N'DrugTest', 10, 7.5)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (100, N'Islam', N'Ahmed', 21, N'M', 4843, NULL, N'fdf', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (101, N'Ahmed', N'Sameh', 26, N'M', 2400, N'Diploma', N'Accountant', N'01014589632', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (102, N'Farah', N'Ahmed', 34, N'F', 3200, N'High School', N'Receptionist', N'01154783214', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 9)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (103, N'Islam', N'Foaad', 40, N'M', 5000, N'Diploma', N'Receptionist', N'01552186321', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 9)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (104, N'Ahmed', N'Mohamed', 53, N'M', 1800, N'High School', N'Clean worker', N'01254896321', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 10)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (105, N'Ramy', N'Farid', 36, N'M', 2800, N'Bachelor', N'Receptionist', N'01521489647', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 9)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (106, N'Samy', N'Sherif', 24, N'M', 3000, N'Bachelor', N'Accountant', N'01054879632', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (107, N'Andrew', N'Moheb', 23, N'M', 2900, N'Diploma', N'Clean worker', N'01120145637', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 10)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (108, N'Ahmed', N'Khaled', 42, N'M', 3600, N'Bachelor', N'Receptionist', N'01514785321', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 9)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (109, N'Hisham', N'Zakaria', 50, N'M', 4200, N'High School', N'Clean worker', N'01254796761', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 10)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (110, N'Mohamed', N'Alaa', 51, N'M', 6500, N'Bachelor', N'Accountant', N'01154782149', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (111, N'Asmaa', N'Mohamed', 23, N'F', 1800, N'High School', N'Clean worker', N'01247953175', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 10)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (112, N'Rana', N'Sayed', 38, N'F', 8000, N'Bachelor', N'Accountant', N'01084527961', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (113, N'Fahd', N'Hossam', 55, N'M', 6000, N'Diploma', N'Receptionist', N'01087462198', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 9)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (114, N'Mina', N'Melad', 45, N'M', 1800, N'Bachelor', N'Accountant', N'01579561442', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (115, N'Mohamed', N'Adham', 48, N'M', 6400, N'Diploma', N'Accountant', N'01114874224', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (116, N'Nafady', N'Mahmoud', 35, N'M', 1850, N'High School', N'Clean worker', N'01089894521', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 10)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (117, N'Test', N'Test', 1, N'M', 1, NULL, N'Test', N'01113586932', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (150, N'Islam', N'Ahmed', 21, N'"', 2500, NULL, N'hh', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (155, N'test', N'test', 18, N'M', 4800, NULL, N'hdhh', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (177, N'kjf', N'ksjdfh', 48, N'M', 5441, NULL, N'djkfd', N'01551522', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (180, N'klsd', N'sdf', 21, N'M', 4500, N'fdf', N'fsdf', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (182, N'test', N'test', 18, N'M', 4800, NULL, N'hdhh', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (186, N'nfdkd', N'fklsd', 21, N'M', 4800, NULL, N'fdsf', N'15415521', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (188, N'fdfdf', N'dfd', 21, N'M', 5000, N'dfs', N'sdf', N'415415451', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (189, N'fdfdf', N'dfd', 21, N'M', 5000, N'dfs', N'sdf', N'415415451', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (190, N'fdfdf', N'dfd', 21, N'M', 5000, N'dfs', N'sdf', N'415415451', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (192, N'fdfdf', N'dfd', 21, N'M', 5000, N'dfs', N'sdf', N'415415451', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (198, N'fkdsjfh', N'fshdkfj', 21, N'M', 4840, NULL, N'kjdshf', N'011154561', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (199, N'Islam', N'Ahmed', 21, N'M', 10000, N'fdsjhfi', N'Engineer', N'0111545617', CAST(N'15:00:00' AS Time), CAST(N'00:00:00' AS Time), 8)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (401, N'Alaa', N'Sameh', N'0101458932', 27, 6500, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (402, N'Fatma', N'Ahmed', N'01154783214', 28, 6200, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (403, N'Rana', N'Foaad', N'01552186321', 25, 7000, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (404, N'Sama', N'Mohamed', N'01254896321', 30, 5800, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (405, N'Nada', N'Farid', N'01521489647', 31, 4900, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (406, N'Radwa', N'Sherif', N'01054879632', 35, 6100, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (407, N'Farida', N'Moheb', N'01120145637', 34, 5200, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (408, N'Nesreen', N'Khaled', N'01514785321', 40, 4800, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (409, N'Reham', N'Zakaria', N'01254796761', 45, 5500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (410, N'Aliaa', N'Alaa', N'01154782149', 34, 6000, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (411, N'Amira', N'Mohamed', N'01247953175', 48, 4500, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (412, N'Zahraa', N'Sayed', N'01084527961', 43, 4900, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (413, N'Sahar', N'Hossam', N'01087462198', 33, 5900, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (414, N'Samar', N'Salem', N'01579561442', 27, 7200, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (415, N'Gamila', N'Adham', N'01114874224', 26, 4600, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (416, N'Salma', N'Mahmoud', N'01089894521', 44, 6100, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (417, N'Amina', N'Talaat', N'01121863274', 38, 4600, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (418, N'Amal', N'Mekky', N'01147921366', 31, 5200, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'2017-02-24' AS Date))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (419, N'Kariman', N'Ashraf', N'01055489614', 34, 6800, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (421, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (422, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (423, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (424, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (425, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (426, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (427, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (428, N'test', N'test', N'0115656568', 21, 10000, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (429, N'test', N'test', N'022555258', 21, 4500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (430, N'fdkak', N'dafjk', N'18973911', 21, 3213, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To], [EndDate]) VALUES (431, N'dsf', N'fdsf', N'1215454', 12, 1321, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (428, 201, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (429, 201, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (430, 202, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (402, 202, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (401, 202, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (431, 203, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (403, 203, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (404, 204, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (405, 205, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (406, 206, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (407, 207, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (408, 208, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (409, 209, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (410, 210, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (411, 211, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (412, 212, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (413, 213, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (414, 214, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (415, 215, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (416, 216, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (417, 217, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (418, 218, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time))
INSERT [dbo].[Nurse_Clinic] ([Nssn], [CID], [StartTime], [EndTime]) VALUES (419, 219, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (401, 303)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (401, 304)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (401, 321)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (402, 302)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (402, 322)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (403, 303)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (403, 323)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (404, 304)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (404, 324)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (405, 305)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (405, 325)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (406, 306)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (406, 326)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (407, 307)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (407, 327)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (408, 308)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (408, 328)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (409, 309)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (409, 329)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (410, 310)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (410, 330)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (411, 311)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (411, 331)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (412, 312)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (412, 332)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (413, 313)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (413, 333)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (414, 314)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (414, 334)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (415, 315)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (415, 335)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (416, 316)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (416, 336)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (417, 317)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (417, 337)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (418, 318)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (418, 338)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (419, 319)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (419, 339)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (429, 303)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (429, 304)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (430, 303)
INSERT [dbo].[Nurse_Room] ([Nssn], [RID]) VALUES (431, 305)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (501, N'John', N'Cena', N'MedNet', 24, N'01154875664', N'Giza', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (502, N'Ashraf', N'Allam', NULL, 12, N'01054621568', N'Cairo', N'Shehab')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (503, N'Hamada', N'Helal', NULL, 5, N'01554878452', N'Giza', N'Mohy')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (504, N'Hoda', N'Elmasry', NULL, 1, N'01132115487', N'Cairo', N'Morad')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (505, N'Gamal', N'Abdelnaser', N'Misr', 35, N'01116516548', N'Cairo', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (506, N'Ahmed', N'Gamal', N'Health care', 68, N'01056515486', N'Giza', N'Ahmed Nagiub')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (507, N'Medhat', N'Elmeseery', N'Misr', 46, N'01565165224', N'Cairo', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (508, N'Ebtsam', N'Mansour', NULL, 18, N'01265489844', N'Giza', N'Ahmed Zaki')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (509, N'Farah', N'Mohamed', N'MedNet', 58, N'01165651222', N'Cairo', N'Serag')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (510, N'Ahmed', N'Fathy', N'Health care', 29, N'01556488861', N'Alexandrea', N'Mekki')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (511, N'Ashrakat', N'Elsaeed', N'Misr', 14, N'01022448667', N'Cairo', N'Alkournish')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (512, N'Saad', N'Samir', NULL, 2, N'01565421325', N'Cairo', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (513, N'Israa', N'Abdelmaksoud', N'Health care', 22, N'01154654887', N'Alexandrea', N'Alzahraa')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (514, N'Karim', N'Hisham', N'Misr', 20, N'01065468852', N'Menoufia', N'Algamaa')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (515, N'Mohamed', N'Mamdouh', N'MedNet', 45, N'01523566200', N'Sinai', N'Alteraa')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (516, N'Nasser', N'Ali', N'Misr', 70, N'01202404887', N'Matrouh', N'Darwish')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (517, N'Mohamed', N'Ahmed', N'MedNet', 53, N'01002354874', N'Menoufia', N'Gad')
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (518, N'Adham', N'Mohamed', N'Misr', 62, N'01121400579', N'Aswan', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (519, N'Intsar', N'Zein', NULL, 49, N'01200254876', N'Suez', NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (520, N'Mohamed', N'Ragab', N'Health care', 55, N'01056154880', N'Suez', N'Alexandria')
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (301, 1, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (302, 1, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (303, 1, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (304, 1, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (305, 1, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (306, 2, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (307, 2, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (308, 2, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (309, 2, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (310, 2, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (311, 3, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (312, 3, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (313, 3, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (314, 3, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (315, 3, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (316, 3, 6, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (317, 4, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (318, 4, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (319, 4, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (320, 4, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (321, 4, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (322, 4, 6, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (323, 5, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (324, 5, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (325, 5, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (326, 5, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (327, 5, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (328, 6, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (329, 6, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (330, 6, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (331, 6, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (332, 6, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (333, 6, 6, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (334, 7, 1, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (335, 7, 2, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (336, 7, 3, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (337, 7, 4, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (338, 7, 5, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (339, 7, 6, 1)
INSERT [dbo].[Room] ([RID], [Floor], [numInFloor], [Capacity]) VALUES (340, 7, 7, 1)
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5001, CAST(N'2019-12-15T12:55:32.9710235' AS DateTime2))
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5007, CAST(N'2019-12-15T12:56:30.6346326' AS DateTime2))
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5010, CAST(N'2019-12-15T12:56:56.4823753' AS DateTime2))
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5011, CAST(N'2019-12-15T12:11:35.8887044' AS DateTime2))
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5018, CAST(N'2019-12-15T12:57:10.6350970' AS DateTime2))
INSERT [dbo].[SoldDrugs] ([Code], [Date_Time]) VALUES (5018, CAST(N'2019-12-15T13:06:23.8749964' AS DateTime2))
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__83BFD849417DE4F7]    Script Date: 12/18/2019 1:14:19 AM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Dname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Doctor_C__019951BA9D375F1F]    Script Date: 12/18/2019 1:14:19 AM ******/
ALTER TABLE [dbo].[Doctor_Clinic] ADD UNIQUE NONCLUSTERED 
(
	[Dssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Drugs__737584F6F09CD39E]    Script Date: 12/18/2019 1:14:19 AM ******/
ALTER TABLE [dbo].[Drugs] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Nurse_Cl__7CBFE32161A2ADBE]    Script Date: 12/18/2019 1:14:19 AM ******/
ALTER TABLE [dbo].[Nurse_Clinic] ADD UNIQUE NONCLUSTERED 
(
	[Nssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT ('FALSE') FOR [Canceled]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [Capacity]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Dssn])
REFERENCES [dbo].[Doctor] ([Dssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Pssn])
REFERENCES [dbo].[Patient] ([Pssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dependencies]  WITH CHECK ADD FOREIGN KEY([Pssn])
REFERENCES [dbo].[Patient] ([Pssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DependentDiagnose]  WITH CHECK ADD FOREIGN KEY([Name], [Pssn])
REFERENCES [dbo].[Dependencies] ([Name], [Pssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doc_Room]  WITH CHECK ADD FOREIGN KEY([Dssn])
REFERENCES [dbo].[Doctor] ([Dssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doc_Room]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Room] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([Dnum])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Doctor_Clinic]  WITH CHECK ADD FOREIGN KEY([Dssn])
REFERENCES [dbo].[Doctor] ([Dssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor_Clinic]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Clinic] ([CID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Dno__5441852A] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([Dnum])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Dno__5441852A]
GO
ALTER TABLE [dbo].[Nurse_Clinic]  WITH CHECK ADD FOREIGN KEY([Nssn])
REFERENCES [dbo].[Nurse] ([Nssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nurse_Clinic]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Clinic] ([CID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nurse_Room]  WITH CHECK ADD FOREIGN KEY([Nssn])
REFERENCES [dbo].[Nurse] ([Nssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nurse_Room]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Room] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient_Medicine]  WITH CHECK ADD FOREIGN KEY([AID])
REFERENCES [dbo].[Appointment] ([AID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientDiagnose]  WITH CHECK ADD FOREIGN KEY([Pssn])
REFERENCES [dbo].[Patient] ([Pssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([Pssn])
REFERENCES [dbo].[Patient] ([Pssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Room] ([RID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SoldDrugs]  WITH CHECK ADD  CONSTRAINT [FK__SoldDrugs__Code__4BAC3F29] FOREIGN KEY([Code])
REFERENCES [dbo].[Drugs] ([Code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SoldDrugs] CHECK CONSTRAINT [FK__SoldDrugs__Code__4BAC3F29]
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Drugs]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[AddNurse]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[AddNurse]
	@Nssn int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Phone varchar(50),
	@Age int,
	@Salary int,
	@Shift_From time(0)
AS
BEGIN
	insert into Nurse values(@Nssn, @Fname, @Lname, @Phone, @Age, @Salary, @Shift_From, DATEADD(hour, 6, @Shift_From), NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[AddNurseClinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddNurseClinic]	
	@Nssn int,
	@StartTime time(0),
	@CID int
AS
BEGIN
	delete from Nurse_Clinic where Nssn = @Nssn
	insert into Nurse_Clinic values(@Nssn, @CID, @StartTime, DATEADD(hour, 3, @StartTime))
END
GO
/****** Object:  StoredProcedure [dbo].[AddNurseRoom]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddNurseRoom] 
	@Nssn int,
	@RID int
AS
BEGIN
	insert into Nurse_Room values(@Nssn, @RID)
END
GO
/****** Object:  StoredProcedure [dbo].[AddQuantity]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddQuantity]
@code int
AS
BEGIN

update Drugs set Quantity=Quantity+1
where Code=@code

END
GO
/****** Object:  StoredProcedure [dbo].[AddToSold]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddToSold]
@code int
AS
BEGIN

insert into SoldDrugs values(@code,SYSDATETIME())

END
GO
/****** Object:  StoredProcedure [dbo].[AvailableNurseRooms]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AvailableNurseRooms]
	@Nssn int
AS
BEGIN
	select r.RID from Room r
	Where r.RID not in(select n.RID from Nurse_Room n
						where n.Nssn = @Nssn)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDoctor]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDoctor] 
@Dssn int

AS
BEGIN

delete from Doctor
where Dssn=@Dssn

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmp] 
@Essn int
AS
BEGIN

delete from Employee
where ESSN=@Essn
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNurse]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNurse] 
@Nssn int
AS
BEGIN

delete from Nurse
where Nssn=@Nssn

END
GO
/****** Object:  StoredProcedure [dbo].[EditEmployee]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditEmployee]
	-- Add the parameters for the stored procedure here
	@ESSN int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Age int,
	@Gender nchar(1),
	@Salary int,
	@Certificate varchar(50),
	@Job varchar(50),
	@Phone varchar(50),
	@Shift_From time(0),
	@Dno int
AS
BEGIN
    -- Insert statements for procedure here
	Update Employee SET Fname = @Fname, Lname = @Lname, Age = @Age, Gender = @Gender, 
				Salary = @Salary, [Certificate] = @Certificate, Job = @Job,
				Phone = @Phone, Shift_From = @Shift_From, Shift_To = DATEADD(hour, 9, @Shift_From),
				Dno = @Dno
	WHERE ESSN = @ESSN
END
GO
/****** Object:  StoredProcedure [dbo].[EditNurse]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditNurse]
	@Nssn int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Phone varchar(50),
	@Age int,
	@Salary int,
	@Shift_From time(0)
AS
BEGIN
	Update Nurse SET Fname = @Fname, Lname = @Lname, Age = @Age, 
				Salary = @Salary, Phone = @Phone, Shift_From = @Shift_From,
				Shift_To = DATEADD(hour, 6, @Shift_From)
	WHERE Nssn = @Nssn
END
GO
/****** Object:  StoredProcedure [dbo].[EditNurseClinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditNurseClinic]
	@Nssn int,
	@StartTime time(0),
	@CID int
AS
BEGIN
	Update Nurse_Clinic SET CID = @CID,
	StartTime = @StartTime,	
	EndTime = DATEADD(hour, 3, @StartTime)
	WHERE Nssn = @Nssn
END
GO
/****** Object:  StoredProcedure [dbo].[FindDrug]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindDrug]
@name varchar(50)

AS
BEGIN
	SELECT *
	from Drugs
	where [Drugs].Name like '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[FindEmptyDrug]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindEmptyDrug]
@name varchar(50)
AS
BEGIN

select *
from Drugs
where Quantity=0 and Drugs.Name like '%' + @name + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[getAllClinicsId]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllClinicsId] 
	
AS
BEGIN
	select CID from Clinic
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllDepartments] 
	
AS
BEGIN
	select Dname from Department
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDocs]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllDocs] 
AS
BEGIN

	SELECT Dssn as SSN,Fname,Lname,Dname as Department,Salary,Phone
	From Doctor join Department on Dno=Dnum
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmp]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmp]
AS
BEGIN

select ESSN as SSN,Fname,Lname,Job,Salary,Phone
from Employee
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllNurse]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllNurse] 
AS
BEGIN
	SELECT Nssn as SSN,Fname,Lname,Salary,Phone
    From Nurse
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatientDiag]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPatientDiag]
AS
BEGIN
	SELECT P.Fname as Patient_Name,P.Lname,
	P.Phone as Patient_Phone,D.Fname as Doctor_Name,D.Lname,
	A.Diagnose
    From Patient as P,Doctor as D,Appointment as A
	where P.Pssn=A.Pssn and D.Dssn=A.Dssn and D.EndDate is null
END
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentName]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDepartmentName] 
	@Dnum int
AS
BEGIN
	select Dname from Department where Dnum = @Dnum
END
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentNumber]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDepartmentNumber]
	@Dname varchar(50)
AS
BEGIN
	select Dnum from Department where Dname = @Dname
END
GO
/****** Object:  StoredProcedure [dbo].[getNurseClinic]    Script Date: 12/18/2019 1:14:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getNurseClinic]
	@Nssn int
AS
BEGIN
	Select CID from Nurse_Clinic where Nssn = @Nssn
END
GO
/****** Object:  StoredProcedure [dbo].[getNurseRooms]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getNurseRooms]
	@Nssn int
AS
BEGIN
	select RID from Nurse_Room
	where Nssn = @Nssn
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDrug]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertDrug]

@code int,
@name varchar(50),
@q int,
@p float

AS
BEGIN

insert into Drugs values(@code,@name,@q,@p)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[InsertEmployee] 
	-- Add the parameters for the stored procedure here
	@ESSN int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Age int,
	@Gender varchar(2),
	@Salary int,
	@Certificate varchar(50),
	@Job varchar(50),
	@Phone varchar(50),
	@Shift_From time(0),
	@Dno int
AS
BEGIN
	insert into Employee values(@ESSN, @Fname, @Lname, @Age, @Gender, @Salary, @Certificate, @Job, @Phone, @Shift_From, DATEADD(hour, 9, @Shift_From), @Dno)
END
GO
/****** Object:  StoredProcedure [dbo].[NurseAvailableClinicShifts]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NurseAvailableClinicShifts]
	@CID int,
	@Nssn int,
	@Shift time(0)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
    Set @SQLString = 'CREATE TABLE Shifts
    (
    StartTime time(0)
	)'
	EXEC (@SQLString)

	insert into Shifts values ('06:00:00'), ('09:00:00'), ('12:00:00'), ('15:00:00'), ('18:00:00'), ('21:00:00')
	

	IF(@Nssn is NULL)
	BEGIN
		Select s.StartTime
		From Shifts s
		Where s.StartTime not in( Select c.StartTime from Nurse_Clinic c where c.CID = @CID)
		      AND s.StartTime >= @Shift AND s.StartTime < DATEADD(hour, 5, @Shift)
	END
	ELSE
	BEGIN
		Select s.StartTime
		From Shifts s
		Where s.StartTime not in( Select c.StartTime from Nurse_Clinic c where c.CID = @CID AND c.Nssn != @Nssn)
				AND s.StartTime >= @Shift AND s.StartTime < DATEADD(hour, 5, @Shift)
	END
	Set @SQLString = 'DROP TABLE Shifts'
	EXEC (@SQLString)
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveNurseRoom]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveNurseRoom] 
	@Nssn int,
	@RID int
AS
BEGIN
	delete from Nurse_Room
	where Nssn = @Nssn AND RID = @RID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllDrugs]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllDrugs]

AS
BEGIN

select * from Drugs

END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployee]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectEmployee] 
	-- Add the parameters for the stored procedure here
	@ESSN int
AS
BEGIN
	select * from Employee where ESSN = @ESSN
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmptyDrugs]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectEmptyDrugs]
AS
BEGIN

select * from Drugs
where Quantity=0

END
GO
/****** Object:  StoredProcedure [dbo].[selectNurse]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectNurse] 
	@Nssn int
AS
BEGIN
	select * from Nurse where Nssn = @Nssn
END
GO
/****** Object:  StoredProcedure [dbo].[SellDrug]    Script Date: 12/18/2019 1:14:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SellDrug]
@code int
AS
BEGIN

update Drugs set Quantity=Quantity-1
where Code=@code

END
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
