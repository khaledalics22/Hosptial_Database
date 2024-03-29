USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 2019-12-22 5:04:47 AM ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
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
USE [Hospital]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AID] [int] NOT NULL,
	[Dssn] [int] NOT NULL,
	[Pssn] [int] NOT NULL,
	[Date_Time] [date] NULL,
	[Diagnose] [varchar](50) NULL,
	[Canceled] [varchar](50) NOT NULL,
	[start] [time](7) NULL,
	[ending] [time](7) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dnum] [int] NOT NULL,
	[Dname] [varchar](50) NOT NULL,
	[isMedicine] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependencies]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[DependentDiagnose]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Doc_Room]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Doctor]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Doctor_Clinic]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_Clinic](
	[Dssn] [int] NOT NULL,
	[CID] [int] NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
	[Date_time] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Doctor_Clinic] PRIMARY KEY CLUSTERED 
(
	[CID] ASC,
	[StartTime] ASC,
	[Date_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorsPass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorsPass](
	[DSSN] [int] NOT NULL,
	[Pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DSSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[EmpUsersPass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpUsersPass](
	[ESSN] [int] NOT NULL,
	[Pass] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ESSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Nssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse_Clinic]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Nurse_Room]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Patient_Medicine]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[PatientDiagnose]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[PatientsPass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientsPass](
	[PSSN] [int] NOT NULL,
	[Pass] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Patients__BC01DEA4CC0892BD] PRIMARY KEY CLUSTERED 
(
	[PSSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  Table [dbo].[SoldDrugs]    Script Date: 2019-12-22 5:04:47 AM ******/
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
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1003, 10, 503, CAST(N'2019-12-22' AS Date), N'Allergic rhinitis.', N'FALSE', CAST(N'19:00:00' AS Time), CAST(N'19:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1004, 12, 504, CAST(N'2019-10-10' AS Date), N'Flu', N'FALSE', CAST(N'18:00:00' AS Time), CAST(N'18:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1005, 19, 505, CAST(N'2019-07-07' AS Date), N'Diabetes', N'FALSE', CAST(N'22:30:00' AS Time), CAST(N'23:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1006, 14, 506, CAST(N'2018-12-25' AS Date), N'Diabetes', N'FALSE', CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1007, 7, 507, CAST(N'2019-12-21' AS Date), N'Leg breaking', N'FALSE', CAST(N'07:00:00' AS Time), CAST(N'07:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1009, 18, 509, CAST(N'2019-12-21' AS Date), NULL, N'FALSE', CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1010, 14, 510, CAST(N'2019-12-26' AS Date), NULL, N'FALSE', CAST(N'23:00:00' AS Time), CAST(N'23:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1011, 5, 511, CAST(N'2019-12-25' AS Date), NULL, N'FALSE', CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1012, 13, 512, CAST(N'2019-12-10' AS Date), N'Sprains', N'FALSE', CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1013, 5, 513, CAST(N'2019-12-21' AS Date), NULL, N'FALSE', CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1014, 8, 514, CAST(N'2019-12-20' AS Date), NULL, N'FALSE', CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1015, 12, 515, CAST(N'2019-12-29' AS Date), NULL, N'FALSE', CAST(N'19:30:00' AS Time), CAST(N'20:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1016, 3, 516, CAST(N'2019-12-30' AS Date), NULL, N'FALSE', CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1018, 9, 518, CAST(N'2019-12-23' AS Date), NULL, N'FALSE', CAST(N'06:00:00' AS Time), CAST(N'06:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1020, 10, 520, CAST(N'2019-12-30' AS Date), NULL, N'FALSE', CAST(N'20:30:00' AS Time), CAST(N'21:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1021, 6, 507, CAST(N'2019-07-05' AS Date), N'Cramp', N'FALSE', CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1022, 6, 507, CAST(N'2019-12-27' AS Date), NULL, N'FALSE', CAST(N'07:00:00' AS Time), CAST(N'07:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1023, 2, 519, CAST(N'2019-12-10' AS Date), N'Flu', N'FALSE', CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1024, 10, 514, CAST(N'2019-12-22' AS Date), NULL, N'FALSE', CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1025, 10, 516, CAST(N'2019-12-21' AS Date), NULL, N'FALSE', CAST(N'18:00:00' AS Time), CAST(N'18:30:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1026, 13, 234, CAST(N'2019-11-11' AS Date), N'Cramp', N'FALSE', CAST(N'13:00:00' AS Time), CAST(N'13:00:00' AS Time), 100)
INSERT [dbo].[Appointment] ([AID], [Dssn], [Pssn], [Date_Time], [Diagnose], [Canceled], [start], [ending], [price]) VALUES (1027, 13, 21345, CAST(N'2019-12-21' AS Date), NULL, N'FALSE', CAST(N'13:30:00' AS Time), CAST(N'13:30:00' AS Time), 100)
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
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (1, N'Orthopaedics', 1)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (2, N'Pharmacy', 0)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (3, N'Physiotherapy', 1)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (4, N'Emergency', 0)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (5, N'Surgery', 1)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (6, N'Ophthalmology', 1)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (7, N'Neurology', 1)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (8, N'Accounting', 0)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (9, N'Reception', 0)
INSERT [dbo].[Department] ([Dnum], [Dname], [isMedicine]) VALUES (10, N'Cleaning', 0)
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
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (2, 322)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (5, 325)
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
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (1324, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (13512, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (13513, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (45433, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (324564, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (566798, 301)
INSERT [dbo].[Doc_Room] ([Dssn], [RID]) VALUES (2435652, 301)
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
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (19, N'Seif', N'Abdullah', N'01165662211', 55, 9300, N'Suez', N'Darwish', 6, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 3, CAST(N'2019-12-21' AS Date))
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (1324, N'dftr', N'trgt', N'dfg', 243, 9000, N'sdf', N'23', 2, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (13512, N'gfhg', N'sfd', N'2342', 24, 8000, N'1fd', N'adsf', 32, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (13513, N'gfhg', N'sfd', N'2342', 24, 9000, N'1fd', N'adsf', 32, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (23456, N'hgfc', N'yjkh', N'nml', 56, 3456, N'kjh', N'gfh', 34, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (45433, N'hoohoo', N'dfghgd', N'123424', 456, 32343, N'dsfg', N'sdf', 234, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (324564, N'dsfd', N'gfvd', N'67544', 343, 10000, N'234', N'ds', 324, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (345354, N'fdg', N'gf', N'24354', 3, 8500, N'fd', N'sdf', 4, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (456765, N'kjhgf', N'fhg', N'435465', 56, 9000, N'fhjhhg', N'jhvv', 45, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (566798, N'kjhgf', N'fhg', N'435465', 56, 8000, N'fhjhhg', N'jhvv', 45, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (1351375, N'gfhg', N'sfd', N'2342', 24, 7000, N'1fd', N'adsf', 32, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (2332543, N'fdgf', N'regf', N'435554', 454, 5000, N'rfd', N'adsf', 324, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (2435652, N'fdgf', N'regf', N'435554', 454, 6000, N'rfd', N'adsf', 324, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor] ([Dssn], [Fname], [Lname], [Phone], [Age], [Salary], [City], [Street], [House_Num], [Shift_From], [Shift_To], [Dno], [EndDate]) VALUES (23325327, N'fdgf', N'regf', N'435554', 454, 7000, N'rfd', N'adsf', 324, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, NULL)
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (1324, 201, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-1-1')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (324564, 201, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (3, 201, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-22')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (2, 201, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'2019-12-22')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (2435652, 201, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (5, 205, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (6, 206, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (7, 207, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (8, 208, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (9, 209, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (10, 210, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (11, 211, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (12, 212, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (13, 213, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (14, 214, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (15, 215, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (16, 216, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (17, 217, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (18, 218, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (19, 219, CAST(N'21:00:00' AS Time), CAST(N'00:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (2332543, 221, CAST(N'18:00:00' AS Time), CAST(N'21:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (13513, 223, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[Doctor_Clinic] ([Dssn], [CID], [StartTime], [EndTime], [Date_time]) VALUES (13512, 235, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), N'2019-12-21')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (2, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (3, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (5, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (6, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (7, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (8, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (9, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (10, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (11, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (12, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (13, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (14, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (15, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (16, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (17, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (18, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (19, N'1234')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (1324, N'2324')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (13512, N'24')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (13513, N'24')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (23456, N'45675')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (45433, N'3245')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (324564, N'453')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (345354, N'4334')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (456765, N'5465')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (566798, N'5465')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (1351375, N'24')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (2332543, N'4534')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (2435652, N'4534')
INSERT [dbo].[DoctorsPass] ([DSSN], [Pass]) VALUES (23325327, N'4534')
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
INSERT [dbo].[Employee] ([ESSN], [Fname], [Lname], [Age], [Gender], [Salary], [Certificate], [Job], [Phone], [Shift_From], [Shift_To], [Dno]) VALUES (100, N'Islam', N'Ahmed', 21, N'M', 4843, NULL, N'Manager', N'01113586932', CAST(N'06:00:00' AS Time), CAST(N'15:00:00' AS Time), NULL)
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
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (100, N'1234')
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (102, N'1234')
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (103, N'1234')
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (105, N'1234')
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (108, N'1234')
INSERT [dbo].[EmpUsersPass] ([ESSN], [Pass]) VALUES (113, N'1234')
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (401, N'Alaa', N'Sameh', N'0101458932', 27, 6500, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (402, N'Fatma', N'Ahmed', N'01154783214', 28, 6200, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (403, N'Rana', N'Foaad', N'01552186321', 25, 7000, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (404, N'Sama', N'Mohamed', N'01254896321', 30, 5800, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (405, N'Nada', N'Farid', N'01521489647', 31, 4900, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (406, N'Radwa', N'Sherif', N'01054879632', 35, 6100, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (407, N'Farida', N'Moheb', N'01120145637', 34, 5200, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (408, N'Nesreen', N'Khaled', N'01514785321', 40, 4800, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (409, N'Reham', N'Zakaria', N'01254796761', 45, 5500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (410, N'Aliaa', N'Alaa', N'01154782149', 34, 6000, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (411, N'Amira', N'Mohamed', N'01247953175', 48, 4500, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (412, N'Zahraa', N'Sayed', N'01084527961', 43, 4900, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (413, N'Sahar', N'Hossam', N'01087462198', 33, 5900, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (414, N'Samar', N'Salem', N'01579561442', 27, 7200, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (415, N'Gamila', N'Adham', N'01114874224', 26, 4600, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (416, N'Salma', N'Mahmoud', N'01089894521', 44, 6100, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (417, N'Amina', N'Talaat', N'01121863274', 38, 4600, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (418, N'Amal', N'Mekky', N'01147921366', 31, 5200, CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (419, N'Kariman', N'Ashraf', N'01055489614', 34, 6800, CAST(N'18:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (421, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (422, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (423, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (424, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (425, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (426, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (427, N'Test', N'Test', N'01118523654', 18, 4500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (428, N'test', N'test', N'0115656568', 21, 10000, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (429, N'test', N'test', N'022555258', 21, 4500, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (430, N'fdkak', N'dafjk', N'18973911', 21, 3213, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Nurse] ([Nssn], [Fname], [Lname], [Phone], [Age], [Salary], [Shift_From], [Shift_To]) VALUES (431, N'dsf', N'fdsf', N'1215454', 12, 1321, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time))
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
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (32, N'wesrdgf', N'fdgn', NULL, NULL, N'76543', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (132, N'wesrdgf', N'fdgn', NULL, NULL, N'76543', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (234, N'sdfg', N'dfdgf', NULL, NULL, N'2234ad', NULL, NULL)
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
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (522, N'ali', N'ahmed', NULL, NULL, N'01120103093', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (777, N'man', N'two', NULL, NULL, N'093843', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (2435, N'wesrdgf', N'fdgn', NULL, NULL, N'76543', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (4565, N'wesrdgf', N'fdgn', NULL, NULL, N'76543', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (12234, N'khaled', N'sfdg', NULL, NULL, N'1234567', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (12345, N'khaled', N'ali', NULL, NULL, N'01123827968', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (21345, N'adsfd', N'sdf', NULL, NULL, N'5431', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (65876, N'gfdfgf', N'gfg', NULL, NULL, N'gg3456', NULL, NULL)
INSERT [dbo].[Patient] ([Pssn], [Fname], [Lname], [Insurance], [Age], [Phone], [City], [Street]) VALUES (123456, N'haha', N'hoho', NULL, NULL, N'01234456', NULL, NULL)
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1003, N'fexofenadine -loratadine ')
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1007, N'Vicodin')
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1007, N'Vitamin')
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1012, N'depovit')
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1012, N'Vicodin')
INSERT [dbo].[Patient_Medicine] ([AID], [medicine]) VALUES (1021, N'Asprine')
INSERT [dbo].[PatientDiagnose] ([Pssn], [Diagnose]) VALUES (503, N'Allergic rhinitis.')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (32, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (132, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (234, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (501, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (502, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (503, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (504, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (505, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (506, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (507, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (508, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (509, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (510, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (511, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (512, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (513, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (514, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (515, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (516, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (517, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (518, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (519, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (520, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (522, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (777, N'12345')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (2435, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (4565, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (12234, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (12345, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (21345, N'134')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (65876, N'1234')
INSERT [dbo].[PatientsPass] ([PSSN], [Pass]) VALUES (123456, N'1234')
INSERT [dbo].[Reservation] ([Pssn], [RID], [Sdate], [Edate]) VALUES (515, 305, CAST(N'2019-12-12' AS Date), CAST(N'2019-12-20' AS Date))
INSERT [dbo].[Reservation] ([Pssn], [RID], [Sdate], [Edate]) VALUES (522, 301, CAST(N'2019-12-20' AS Date), CAST(N'2019-12-30' AS Date))
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
/****** Object:  Index [UQ__Departme__83BFD849D9827DC7]    Script Date: 2019-12-22 5:04:47 AM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Dname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Doctor_C__019951BA0CC0A4F6]    Script Date: 2019-12-22 5:04:47 AM ******/
ALTER TABLE [dbo].[Doctor_Clinic] ADD  CONSTRAINT [UQ__Doctor_C__019951BA0CC0A4F6] UNIQUE NONCLUSTERED 
(
	[Dssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Drugs__737584F63C8B12FF]    Script Date: 2019-12-22 5:04:47 AM ******/
ALTER TABLE [dbo].[Drugs] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Nurse_Cl__7CBFE321F90AA72B]    Script Date: 2019-12-22 5:04:47 AM ******/
ALTER TABLE [dbo].[Nurse_Clinic] ADD UNIQUE NONCLUSTERED 
(
	[Nssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT ('FALSE') FOR [Canceled]
GO
ALTER TABLE [dbo].[Appointment] ADD  DEFAULT ((100)) FOR [price]
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
ALTER TABLE [dbo].[Doctor_Clinic]  WITH CHECK ADD  CONSTRAINT [FK__Doctor_Cli__Dssn__3F466844] FOREIGN KEY([Dssn])
REFERENCES [dbo].[Doctor] ([Dssn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor_Clinic] CHECK CONSTRAINT [FK__Doctor_Cli__Dssn__3F466844]
GO
ALTER TABLE [dbo].[Doctor_Clinic]  WITH CHECK ADD  CONSTRAINT [FK__Doctor_Clin__CID__403A8C7D] FOREIGN KEY([CID])
REFERENCES [dbo].[Clinic] ([CID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctor_Clinic] CHECK CONSTRAINT [FK__Doctor_Clin__CID__403A8C7D]
GO
ALTER TABLE [dbo].[DoctorsPass]  WITH CHECK ADD FOREIGN KEY([DSSN])
REFERENCES [dbo].[Doctor] ([Dssn])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Dno__5441852A] FOREIGN KEY([Dno])
REFERENCES [dbo].[Department] ([Dnum])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Dno__5441852A]
GO
ALTER TABLE [dbo].[EmpUsersPass]  WITH CHECK ADD FOREIGN KEY([ESSN])
REFERENCES [dbo].[Employee] ([ESSN])
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
/****** Object:  StoredProcedure [dbo].[AddDiagnose]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[AddDiagnose]	
-- Add the parameters for the stored procedure here
	@Pssn int,
	@diagnose varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into PatientDiagnose
	values(@Pssn,@diagnose)
	update [dbo].[Appointment]
	set Diagnose=@diagnose
	where Pssn=@Pssn
END







GO
/****** Object:  StoredProcedure [dbo].[AddDoctor]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[AddDoctor]
	@Dssn int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Phone varchar(50),
	@Age int,
	@Salary int,
	@City varchar(50),
	@street varchar(50),
	@houseNum varchar(10),
	@Shift_From time(0),
	@Dno int  ,
	@PASS varchar(50)
AS
BEGIN

		insert into Doctor values(@Dssn, @Fname, @Lname, @Phone, @Age, @Salary,@City,@street,@houseNum, @Shift_From, DATEADD(hour, 6, @Shift_From),@Dno, NULL)
	    insert into DoctorsPass values (@Dssn,@PASS)

END






GO
/****** Object:  StoredProcedure [dbo].[AddDoctorClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddDoctorClinic] 
@Dssn int , 
@StartTime time(0),
@CID int,
@Date_time varchar(20)           
AS
BEGIN
    insert into Doctor_Clinic values (@Dssn,@CID,@StartTime,DATEADD(hour,3,@StartTime),@Date_time)
END



GO
/****** Object:  StoredProcedure [dbo].[AddDoctorRoom]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[AddDoctorRoom]	
	@DSSN int,
	@RID int
AS
BEGIN
	insert into Doc_Room values(@DSSN, @RID)
END





GO
/****** Object:  StoredProcedure [dbo].[AddNewAppointment]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddNewAppointment]
@DSSN int , 
@PSSN int ,
@date varchar(20),
@startTime varchar(20)

AS
BEGIN
declare @AID int
set @AID = (select MAX(AID) from Appointment)
set @AID = @AID+1

	insert into Appointment (AID,Dssn,Pssn,Date_Time,start,ending)values (@AID,@DSSN,@PSSN,@date,@startTime,DATEADD(hour, 0.5, @startTime))

END





GO
/****** Object:  StoredProcedure [dbo].[AddNurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
	insert into Nurse values(@Nssn, @Fname, @Lname, @Phone, @Age, @Salary, @Shift_From, DATEADD(hour, 6, @Shift_From))
END







GO
/****** Object:  StoredProcedure [dbo].[AddNurseClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNurseRoom]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPateint]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPateint]
	-- Add the parameters for the stored procedure here
	@pssn int,
	@fname varchar(50),
	@lname varchar(50),
	@ins varchar(50),
	@Age int,
	@phone varchar(50),
	@city varchar(50),
	@street varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into [dbo].[Patient]
	values (@pssn,@fname,@lname,@ins,@Age,@phone,@city,@street)
END




GO
/****** Object:  StoredProcedure [dbo].[AddPateintDrag]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[AddPateintDrag]
	-- Add the parameters for the stored procedure here
	@pssn int,
	@date varchar(20),
	@from varchar(10),
	@to varchar(10),
	@medicine varchar(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Aid int
    -- Insert statements for procedure here
	SELECT @Aid=(select AID
	from [dbo].[Appointment]
	where Pssn=@pssn and Date_Time=@date and start=@from and ending=@to)

	insert into [dbo].[Patient_Medicine]
	values (@Aid,@medicine)
END







GO
/****** Object:  StoredProcedure [dbo].[AddQuantity]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddToSold]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[availableappointments]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[availableappointments]
	-- Add the parameters for the stored procedure here
	@from varchar(10),
	@to varchar(10),
	@date varchar(20), 
	@ssn int
	AS
BEGIN

	DECLARE @SQLString NVARCHAR(MAX)
    Set @SQLString = 'CREATE TABLE allappointments
    (
    st time(0)
	)'
	EXEC (@SQLString)
	insert into allappointments(st) values ('06:00:00'), ('06:30:00'), ('07:00:00'), ('07:30:00'), ('08:00:00'), ('08:30:00'),('09:00:00'),('09:30:00')
	,('10:00:00'),('10:30:00'),('11:00:00'),('11:30:00'),('12:00:00'),('12:30:00'),('13:00:00'),('13:30:00'),('14:00:00'),('14:30:00'),('15:00:00')
	,('15:30:00'),('16:00:00'),('16:30:00'),('17:00:00'),('17:30:00'),('18:00:00'),('18:30:00'),('19:00:00'),('19:30:00'),('20:00:00'),('20:30:00')
	,('21:00:00'),('21:30:00'),('22:00:00'),('22:30:00'),('23:00:00'),('23:30:00')
    -- Insert statements for procedure here
	SELECT st
	from allappointments
	where (st>=@from and st<@to) and st not in(select Appointment.start
	from [dbo].[Appointment] where Date_Time=@date and Dssn=@ssn)

		Set @SQLString = 'DROP TABLE allappointments'
	EXEC (@SQLString)
END







GO
/****** Object:  StoredProcedure [dbo].[AvailableNurseRooms]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[cancelAppoint]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cancelAppoint]
@AID int 
AS
BEGIN
 delete from Appointment where Appointment.AID = @AID
END





GO
/****** Object:  StoredProcedure [dbo].[changePass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changePass]
@SSN int ,
@oldPass varchar(50), 
@newPass varchar (50),
@TYPE  varchar(1)
AS
BEGIN
   
   if(@TYPE ='P')
   begin
	if(exists (select * from PatientsPass where PatientsPass.PSSN=@SSN and PatientsPass.Pass=@oldPass))
	 begin 
        update PatientsPass set PatientsPass.Pass=@newPass where PatientsPass.PSSN=@SSN
     end 
   end 
   else if(@TYPE = 'D')
   begin
     if(exists (select * from DoctorsPass where DoctorsPass.DSSN=@SSN and DoctorsPass.Pass=@oldPass))
	 begin 
	   update DoctorsPass set DoctorsPass.Pass=@newPass where DoctorsPass.DSSN=@SSN
     end
   end 
   else 
   begin 
     if(exists (select * from EmpUsersPass where EmpUsersPass.ESSN=@SSN and EmpUsersPass.Pass=@oldPass))
	 begin 
       update EmpUsersPass set EmpUsersPass.Pass=@newPass where EmpUsersPass.ESSN=@SSN

     end
   end
END






GO
/****** Object:  StoredProcedure [dbo].[checkPass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,khaled>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[checkPass] 
	-- Add the parameters for the stored procedure here
	@SSN INT , @Type varchar(10)
AS
BEGIN
	if(@Type = 'M' or @Type = 'R' or @Type = 'PH' )
	begin 
		select pass from EmpUsersPass where ESSN= @SSN 
	end
	else if (@Type = 'P')
	begin
	    select pass from PatientPass where PSSN= @SSN 
	end
	else    
	begin
	    select pass from DoctorsPass where DSSN= @SSN 
	end 
END






GO
/****** Object:  StoredProcedure [dbo].[DeleteDoctor]    Script Date: 2019-12-22 5:04:47 AM ******/
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
@Dssn int,
@EndDate date

AS
BEGIN
Delete from Doc_Room where Dssn = @Dssn
Delete from Doctor_Clinic where Dssn = @Dssn
update Doctor set EndDate = @EndDate where Dssn = @Dssn

END





GO
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DoctorAvailableRooms]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DoctorAvailableRooms]
@DSSN int 
AS
BEGIN
    select Room.RID from Room  where Room.RID not in (select RID from  Doc_Room where Doc_Room.Dssn = @DSSN)
END





GO
/****** Object:  StoredProcedure [dbo].[EditEmployee]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditNurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditNurseClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FindDrug]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FindEmptyDrug]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllClinicsId]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllDep]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetAllDep] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Dname
	from [dbo].[Department]
END







GO
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 2019-12-22 5:04:47 AM ******/
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
	select Dname,Dnum from Department
END






GO
/****** Object:  StoredProcedure [dbo].[GetAllDocs]    Script Date: 2019-12-22 5:04:47 AM ******/
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
	where EndDate is NULL
END







GO
/****** Object:  StoredProcedure [dbo].[GetAllEmp]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllNurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPatientDiag]    Script Date: 2019-12-22 5:04:47 AM ******/
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
	SELECT P.Pssn, P.Fname as Patient_Name,P.Lname,
	P.Phone as Patient_Phone,D.Fname as Doctor_Name,D.Lname,
	A.Diagnose
    From Patient as P,Doctor as D,Appointment as A
	where P.Pssn=A.Pssn and D.Dssn=A.Dssn and D.EndDate is null
END





GO
/****** Object:  StoredProcedure [dbo].[getAllRoomsID]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllRoomsID]
AS
BEGIN
	select Room.RID from Room 
END



GO
/****** Object:  StoredProcedure [dbo].[GetAppDiag]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAppDiag]

@AID int
AS
BEGIN

select Diagnose
from Appointment
where AID=@AID

END







GO
/****** Object:  StoredProcedure [dbo].[GetAppointMed]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAppointMed]

@AID int
AS
BEGIN

select medicine
from Patient_Medicine
where AID=@AID

END







GO
/****** Object:  StoredProcedure [dbo].[getappointmentbydate]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getappointmentbydate]
	-- Add the parameters for the stored procedure here
	@date varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @date=@date+'%'
	/*set @date='%'+@date*/
    -- Insert statements for procedure here
	SELECT a.Pssn,Fname,Lname,Age,Date_Time,start,ending
	from Appointment as a join Patient as p on p.Pssn=a.Pssn
	where Date_Time like @date
END







GO
/****** Object:  StoredProcedure [dbo].[getavailableAppointment]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getavailableAppointment]
@Dssn int 
AS
BEGIN
		DECLARE @SQLString NVARCHAR(MAX)
    Set @SQLString = 'CREATE TABLE appoints
    (
    st time(0)
	)'
	EXEC (@SQLString)
	insert into appoints(st) values ('06:00:00'), ('06:30:00'), ('07:00:00'), ('07:30:00'), ('08:00:00'), ('08:30:00'),('09:00:00'),('09:30:00')
	,('10:00:00'),('10:30:00'),('11:00:00'),('11:30:00'),('12:00:00'),('12:30:00'),('13:00:00'),('13:30:00'),('14:00:00'),('14:30:00'),('15:00:00')
	,('15:30:00'),('16:00:00'),('16:30:00'),('17:00:00'),('17:30:00'),('18:00:00'),('18:30:00'),('19:00:00'),('19:30:00'),('20:00:00'),('20:30:00')
	,('21:00:00'),('21:30:00'),('22:00:00'),('22:30:00'),('23:00:00'),('23:30:00')
    -- Insert statements for procedure here
	declare @DocSt time(0), @DocEnd time(0)
    set @DocSt  = (select Doctor.Shift_From from Doctor where Dssn=@Dssn)
	set @DocEnd  = (select Doctor.Shift_To from Doctor where Dssn=@Dssn)

	select appoints.st from appoints where ((appoints.st>=@DocSt and appoints.st <@DocEnd) and 
	appoints.st not in (select Appointment.Date_Time from Appointment where Appointment.Dssn  = @Dssn))

	Set @SQLString = 'DROP TABLE appoints'
	EXEC (@SQLString)
END





GO
/****** Object:  StoredProcedure [dbo].[getavailablerooms]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getavailablerooms] 
	-- Add the parameters for the stored procedure here
	@sdate date,
	@edate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RID
	from Room
	where RID not in(select rm.RID 
	from [dbo].[Room] rm join [dbo].[Reservation] rs on rm.RID=rs.RID
	where (@sdate>=Sdate and @sdate<Edate)or(@edate>Sdate and @sdate<=Edate)or(@sdate<=Sdate and @edate>=Edate))
END







GO
/****** Object:  StoredProcedure [dbo].[getDepartmentName]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getDepartmentNumber]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getDocClinicsAtDate]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDocClinicsAtDate]
@DSSN int ,
@Date_time varchar(20) 
AS
BEGIN
   select Doctor_Clinic.CID,Doctor_Clinic.StartTime from Doctor_Clinic where Doctor_Clinic.Dssn=@DSSN and Doctor_Clinic.Date_time=@Date_time

END



GO
/****** Object:  StoredProcedure [dbo].[getdocclinicshift]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdocclinicshift]
	-- Add the parameters for the stored procedure here
	@ssn int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [StartTime],[EndTime]
	from [dbo].[Doctor_Clinic]
	where [Dssn]=@ssn
END







GO
/****** Object:  StoredProcedure [dbo].[getDocDepartment]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDocDepartment]
@Dssn int 
AS
BEGIN
	select Department.Dname from Department,Doctor where Dno = Dnum and Dssn= @Dssn
END





GO
/****** Object:  StoredProcedure [dbo].[getDocsAtDep]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDocsAtDep]
@Dno int 
AS
BEGIN
	select Doctor.Dssn,Doctor.Fname,Doctor.Lname,Doctor.Shift_From,Doctor.Shift_To from Doctor where Dno=@Dno
END





GO
/****** Object:  StoredProcedure [dbo].[getDoctorClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDoctorClinic]
@DSSN int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select Doctor_Clinic.CID,Doctor_Clinic.StartTime from Doctor_Clinic where Doctor_Clinic.Dssn = @DSSN
END






GO
/****** Object:  StoredProcedure [dbo].[getdoctorinfo]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getdoctorinfo] 
	-- Add the parameters for the stored procedure here
	@dssn int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Phone,Dname,[Shift_From],[Shift_To],Dssn
	from [dbo].[Doctor] join [dbo].[Department] on Dno=Dnum
	where @dssn=[Dssn]
END






GO
/****** Object:  StoredProcedure [dbo].[getDoctorRooms]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDoctorRooms]
@DSSN int 
AS
BEGIN
	select * from Doc_Room where Doc_Room.Dssn =@DSSN
END





GO
/****** Object:  StoredProcedure [dbo].[getMedicineDeps]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMedicineDeps]
AS
BEGIN
     select * from Department where Department.isMedicine = 1
END





GO
/****** Object:  StoredProcedure [dbo].[getNonMedicineDeps]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getNonMedicineDeps]
AS
BEGIN
     select * from Department where Department.isMedicine = 0
END





GO
/****** Object:  StoredProcedure [dbo].[getNurseClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getNurseRooms]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPateintDependents]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetPateintDependents] 
	-- Add the parameters for the stored procedure here
	@pssn int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Name],[Age],[Phone],[Relation]
	from Dependencies
	where pssn=@pssn
END







GO
/****** Object:  StoredProcedure [dbo].[getPatientInfo]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPatientInfo]
	@Pssn int

AS
BEGIN
	Select * from Patient where Pssn = @Pssn
END

GO
/****** Object:  StoredProcedure [dbo].[getweekdates]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getweekdates] 
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CONVERT(varchar, getdate(), 23) as date
	union
	SELECT CONVERT(varchar, getdate()+1, 23) as date
	union
	SELECT CONVERT(varchar, getdate()+2, 23) as date
	union
	SELECT CONVERT(varchar, getdate()+3, 23) as date
	union
	SELECT CONVERT(varchar, getdate()+4, 23) as date
	union
	SELECT CONVERT(varchar, getdate()+5, 23) as date
	union
	SELECT CONVERT(varchar, getdate()+6, 23)as date
	union
	SELECT CONVERT(varchar, getdate()+7, 23)as date
END







GO
/****** Object:  StoredProcedure [dbo].[insertappointment]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertappointment]
	-- Add the parameters for the stored procedure here
	@dssn int,
	@pssn int,
	@date varchar(20),
	@from varchar(10),
	@to varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id int
	select @id=max([AID]) from [dbo].[Appointment]
    -- Insert statements for procedure here
	insert into [dbo].[Appointment](AID,[Dssn],[Pssn],[Date_Time],[start],[ending])
	values (@id+1,@dssn,@pssn,@date,@from,@to)
END







GO
/****** Object:  StoredProcedure [dbo].[InsertDrug]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 2019-12-22 5:04:47 AM ******/
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
	@Dno int,
	@PASS varchar(50)
AS
BEGIN
	insert into Employee values(@ESSN, @Fname, @Lname, @Age, @Gender, @Salary, @Certificate, @Job, @Phone, @Shift_From, DATEADD(hour, 9, @Shift_From), @Dno)
	if(@Job='Manager' or @Job = 'Pharmacist' or @Job = 'Receptionist')
	begin
	  insert into EmpUsersPass values (@ESSN,@PASS)	
	END
end 






GO
/****** Object:  StoredProcedure [dbo].[insertPatient]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertPatient]
@PSSN int , 
@Fname varchar(50),
@Lname varchar (50),
@phone varchar(50), 
@PASS  varchar(50)
AS
BEGIN
    insert into Patient(Pssn,Fname,Lname,Phone) values (@PSSN,@Fname,@Lname,@phone)
	insert into PatientsPass values(@PSSN,@PASS)
END






GO
/****** Object:  StoredProcedure [dbo].[InsertReservation]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertReservation]
	-- Add the parameters for the stored procedure here
	@pssn int,
	@rid int,
	@sdate varchar(20),
	@edate varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into [dbo].[Reservation]
	values (@pssn,@rid,@sdate,@edate)
END







GO
/****** Object:  StoredProcedure [dbo].[NurseAvailableClinicShifts]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[patientAppoints]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[patientAppoints]
@PSSN int 
AS
BEGIN
	select Appointment.AID, Patient.Lname as patient_last_name , Doctor.Lname as Doctor_last_name ,Appointment.Date_Time,Appointment.start
	,Appointment.Diagnose,Appointment.Canceled
	  from Appointment,Doctor,Patient where Appointment.Dssn=Doctor.Dssn and  Appointment.Pssn= Patient.Pssn and Appointment.Pssn=@PSSN
END





GO
/****** Object:  StoredProcedure [dbo].[patientHistory]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[patientHistory] 
	@Pssn int
AS
BEGIN
	Select pd.Diagnose from Patient as p, PatientDiagnose as pd where pd.Pssn = p.Pssn AND p.Pssn = @Pssn
END

GO
/****** Object:  StoredProcedure [dbo].[removeDocClinic1]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[removeDocClinic1]
@DSSN int 
AS
BEGIN
  delete from Doctor_Clinic where Doctor_Clinic.Dssn=@DSSN
END


GO
/****** Object:  StoredProcedure [dbo].[removeDoctorClinic]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[removeDoctorClinic]
@DSSN int, 
@CID int ,
@Shift_start time(0),
@date_time varchar(20)
AS
BEGIN
   delete from Doctor_Clinic where Doctor_Clinic.Dssn=@DSSN and Doctor_Clinic.CID=@CID and Doctor_Clinic.StartTime=@Shift_start
   and Doctor_Clinic.Date_time=@date_time
END



GO
/****** Object:  StoredProcedure [dbo].[removeDoctorRoom]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[removeDoctorRoom]
@DSSN int,
@RID int  
AS
BEGIN
     delete from Doc_Room where Doc_Room.Dssn =@DSSN and Doc_Room.RID=@RID
END






GO
/****** Object:  StoredProcedure [dbo].[RemoveNurseRoom]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAllDrugs]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[selectDocByName]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectDocByName]
@Lname varchar(50)
AS
BEGIN
	select Doctor.Dssn, Doctor.Fname,Doctor.Lname,Doctor.Shift_From,Doctor.Shift_To from Doctor where Doctor.Lname = @Lname
END






GO
/****** Object:  StoredProcedure [dbo].[selectDoctor]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectDoctor]
@Dssn int 
AS
BEGIN
	select * from Doctor where Dssn=@Dssn
END





GO
/****** Object:  StoredProcedure [dbo].[SelectDoctorbyDep]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectDoctorbyDep]
	-- Add the parameters for the stored procedure here
	@DepName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Dssn,Fname,Lname,Shift_From,Shift_To
	from [dbo].[Doctor] join [dbo].[Department] on Dno=Dnum
	where Dname=@DepName
END






GO
/****** Object:  StoredProcedure [dbo].[selectEmployee]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectEmptyDrugs]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[selectNurse]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[selectPatient]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectPatient]
@Pssn int 
AS
BEGIN
 Select Patient.Lname as Last_name from Patient where Patient.Pssn = @Pssn
END



GO
/****** Object:  StoredProcedure [dbo].[SellDrug]    Script Date: 2019-12-22 5:04:47 AM ******/
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
/****** Object:  StoredProcedure [dbo].[StatDepIncome]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StatDepIncome] 

@from date
,@to date

AS
BEGIN

select Dname as Department_Name,Sum(Appointment.price) as Total_income,
Count(*) as Number_Of_Appointments

from Department,Doctor,Appointment

where Doctor.Dssn=Appointment.Dssn and Doctor.Dno=Department.Dnum
and Canceled='FALSE' and Date_Time>=@from and
Date_Time<=@to and Diagnose is not null
and isMedicine=1

group by Dname

END
GO
/****** Object:  StoredProcedure [dbo].[StatDiseases]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StatDiseases] 
AS
BEGIN

select Diagnose as Disease,count(Patient.Pssn) as Number_Of_Patients,
avg(Age) as Average_Age

from Appointment,Patient

where Patient.Pssn=Appointment.Pssn and Diagnose is not null
group by Diagnose

END
GO
/****** Object:  StoredProcedure [dbo].[StatMedDep]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StatMedDep] 
AS
BEGIN

select Dname as Department_Name , count(Dssn) as Number_Of_Doctors,
avg(Salary) as Average_Salary, MAX(Salary) as Maximum_Salary
, MIN(Salary) as Minimum_Salary

from Department,Doctor
where Doctor.Dno=Department.Dnum and Doctor.EndDate is null 
and isMedicine=1

group by Dname

END
GO
/****** Object:  StoredProcedure [dbo].[StatNonMed]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StatNonMed] 
AS
BEGIN

select Dname as Department_Name , count(Essn) as Number_Of_Employees,
avg(Salary) as Average_Salary, MAX(Salary) as Maximum_Salary
, MIN(Salary) as Minimum_Salary

from Department,Employee
where Employee.Dno=Department.Dnum and (isMedicine=0 or isMedicine is null) 

group by Dname

END
GO
/****** Object:  StoredProcedure [dbo].[StatPharIncome]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StatPharIncome] 

@from date
,@to date

AS
BEGIN

select Drugs.Name, sum(Price) as Total_Sold

from Drugs,SoldDrugs

where Drugs.Code=SoldDrugs.Code and SoldDrugs.Date_Time>=@from
and Date_Time<=@to

group by Drugs.Name

END
GO
/****** Object:  StoredProcedure [dbo].[storePass]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[storePass] 
	-- Add the parameters for the stored procedure here
	@SSN int ,@pass varchar(20), @Type varchar(1)
AS
BEGIN
	--type is manager or receptionist or Receptionist
	if(@Type = 'M' or @Type = 'PH' or @Type = 'R')
	begin
		-- if already exists  
		if(@SSN IN (Select ESSN from EmpUsersPass)) 
		begin 
		   update EmpUsersPass set pass  =@pass where Essn = @SSN 
		end
		--if doesn't exist 
		else 
		 begin 
		   insert into EmpUsersPass values(@SSN, @pass)
		end 
	end 
	--type is patient
	else if (@Type = 'P')
	 begin
	 -- if already exists
	     if(@SSN IN (Select PSSN from patientsPass)) 
		begin 
		      update patientsPass set pass  =@pass where Pssn = @SSN 
		end 
		--if doesn't exist
		else 
		 begin 
		   insert into patientsPass values(@SSN, @pass)
		end
	end 
	-- type is docotr
	else 
		 begin
		 -- if already exists
	     if(@SSN IN (Select PSSN from patientsPass)) 
		begin 
		   update patientsPass set pass  =@pass where Pssn = @SSN 
		end 
		--if doesn't exist
		else 
		 begin 
		   insert into patientsPass values(@SSN, @pass)
		end
	end  	
	END






GO
/****** Object:  StoredProcedure [dbo].[updateDoc]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateDoc]
	@Dssn int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Phone varchar(50),
	@Age int,
	@Salary int,
	@City varchar(50),
	@street varchar(50),
	@houseNum varchar(10),
	@Shift_From time(0),
	@Dno int  
AS
BEGIN


	  update Doctor set Doctor.Fname=@Fname ,Doctor.Lname=@Lname ,Doctor.Age=@Age,
	  Doctor.Phone=@Phone,Doctor.Salary=@Salary,
	  Doctor.City=@City,Doctor.Street=@street,Doctor.House_Num=@houseNum,
	  Doctor.Shift_From=@Shift_From,Doctor.Shift_To= DATEADD( hour, 6, @Shift_From) ,Doctor.Dno=@Dno
	  where Dssn=@Dssn

END






GO
/****** Object:  StoredProcedure [dbo].[ViewPrevAppoint]    Script Date: 2019-12-22 5:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ViewPrevAppoint]
@PSSN int
AS
BEGIN

select a.AID as Appointment_Number,D.Fname as Doctor_Fname,
D.Lname as Doctor_Lname,a.Date_Time,Dep.Dname as Specialization

from Doctor as D,Appointment as a,Department as Dep

where a.Pssn=@PSSN and a.Dssn=D.Dssn 
and D.Dno=Dep.Dnum and a.Date_Time<SYSDATETIME()
and a.Canceled='FALSE'

END







GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
