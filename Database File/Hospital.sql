USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 12/21/2019 1:52:03 PM ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [Hospital]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointment](
	[AID] [int] NOT NULL,
	[Dssn] [int] NOT NULL,
	[Pssn] [int] NOT NULL,
	[Date_Time] [date] NULL,
	[Diagnose] [varchar](50) NULL,
	[Canceled] [varchar](50) NOT NULL DEFAULT ('FALSE'),
	[start] [time](7) NULL,
	[ending] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Dnum] [int] NOT NULL,
	[Dname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Dname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dependencies]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DependentDiagnose]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doc_Room]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doctor_Clinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Dssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drugs](
	[Code] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nurse_Clinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nurse_Room]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient_Medicine]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientDiagnose]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RID] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[numInFloor] [int] NOT NULL,
	[Capacity] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SoldDrugs]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddDiagnose]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddDoctor]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddDoctorRoom]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNurse]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNurseClinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNurseRoom]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPateint]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[AddPateint]
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
	insert into [dbo].[Patient] ([Pssn],[Fname],[Lname],[Phone])
	values (@pssn,@fname,@lname,@phone)
	
	if @ins!=''
	begin
	insert into [dbo].[Patient] ([Insurance])
	values (@ins)
	end

	if @Age!=-1
	begin
	insert into [dbo].[Patient] ([Age])
	values (@Age)
	end

	if @city!=''
	begin
	insert into [dbo].[Patient] ([City])
	values (@city)
	end

	if @street!=''
	begin
	insert into [dbo].[Patient] ([Street])
	values (@street)
	end
END


GO
/****** Object:  StoredProcedure [dbo].[AddPateintDrag]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddQuantity]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddToSold]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[availableappointments]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[availableappointments]
	-- Add the parameters for the stored procedure here
	@from varchar(10),
	@to varchar(10),
	@date varchar(20), 
	@ssn int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
	where (st>=@from and st<@to) and st not in(select st
	from [dbo].[Appointment] join allappointments on st=start
	where Date_Time=@date and Dssn=@ssn)
	Set @SQLString = 'DROP TABLE allappointments'
	EXEC (@SQLString)
END


GO
/****** Object:  StoredProcedure [dbo].[AvailableNurseRooms]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[changePass]    Script Date: 12/21/2019 1:52:03 PM ******/
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
@oldPass int , 
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
/****** Object:  StoredProcedure [dbo].[checkPass]    Script Date: 12/21/2019 1:52:03 PM ******/
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
	@SSN INT , @pass varchar(20), @Type varchar(10)
AS
BEGIN
	if(@Type = 'M' or @Type = 'R' or @Type = 'PH' )
	begin 
		select pass from EmpUsersPass where ESSN= @SSN and pass = @pass 
	end
	else if (@Type = 'P')
	begin
	    select pass from PatientPass where PSSN= @SSN and pass = @pass 
	end
	else    
	begin
	    select pass from DoctorPass where DSSN= @SSN and pass = @pass 
	end 
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDoctor]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNurse]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditEmployee]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditNurse]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditNurseClinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FindDrug]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FindEmptyDrug]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllClinicsId]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllDep]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllDocs]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllEmp]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllNurse]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllPatientDiag]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAppDiag]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAppointMed]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getappointmentbydate]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getavailablerooms]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getDepartmentName]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getDepartmentNumber]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getdocclinicshift]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getDoctorClinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getdoctorinfo]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getdoctorinfo] 
	-- Add the parameters for the stored procedure here
	@fname varchar(50),
	@lname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Phone,Dname,[Shift_From],[Shift_To],Dssn
	from [dbo].[Doctor] join [dbo].[Department] on Dno=Dnum
	where Fname=@fname and Lname=@lname
END


GO
/****** Object:  StoredProcedure [dbo].[getNurseClinic]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getNurseRooms]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPateintDependents]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getweekdates]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insertappointment]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDrug]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insertPatient]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertReservation]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NurseAvailableClinicShifts]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[removeDoctorRoom]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RemoveNurseRoom]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAllDrugs]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[selectDocByName]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectDoctorbyDep]    Script Date: 12/21/2019 1:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SelectDoctorbyDep]
	-- Add the parameters for the stored procedure here
	@DepName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Fname,Lname,Shift_From,Shift_To
	from [dbo].[Doctor] join [dbo].[Department] on Dno=Dnum
	where Dname=@DepName
END


GO
/****** Object:  StoredProcedure [dbo].[selectEmployee]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectEmptyDrugs]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[selectNurse]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SellDrug]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[storePass]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[updateDoc]    Script Date: 12/21/2019 1:52:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ViewPrevAppoint]    Script Date: 12/21/2019 1:52:03 PM ******/
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
