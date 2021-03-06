USE [master]
GO
/****** Object:  Database [POS]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE DATABASE [POS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\POS.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\POS_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [POS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS] SET RECOVERY FULL 
GO
ALTER DATABASE [POS] SET  MULTI_USER 
GO
ALTER DATABASE [POS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [POS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'POS', N'ON'
GO
USE [POS]
GO
/****** Object:  Schema [customer]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [customer]
GO
/****** Object:  Schema [expences]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [expences]
GO
/****** Object:  Schema [Finance]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [Finance]
GO
/****** Object:  Schema [GRN]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [GRN]
GO
/****** Object:  Schema [Purchase]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [Purchase]
GO
/****** Object:  Schema [RetriveData]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [RetriveData]
GO
/****** Object:  Schema [Sales]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Schema [Settings]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [Settings]
GO
/****** Object:  Schema [stock]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [stock]
GO
/****** Object:  Schema [Suppliers]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [Suppliers]
GO
/****** Object:  Schema [transactions]    Script Date: 2017-11-15 9:28:56 PM ******/
CREATE SCHEMA [transactions]
GO
/****** Object:  Table [customer].[Customer_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customer].[Customer_Details](
	[Doc_No] [nvarchar](50) NULL,
	[Name] [nvarchar](500) NULL,
	[Company_Name] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Nic] [nvarchar](50) NULL,
	[Mobile_2] [nvarchar](50) NULL,
	[Mobile_1] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Other_Contact_Details] [nvarchar](max) NULL,
	[Customer_Since] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[User_Code] [nvarchar](200) NULL,
	[System_Date_Time] [date] NULL CONSTRAINT [DF_Customer_Details_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Customer_Details_Status]  DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Auto_Codes_Prefix]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto_Codes_Prefix](
	[ID] [uniqueidentifier] NULL CONSTRAINT [DF_Auto_Codes_Prefix_ID]  DEFAULT (newid()),
	[Prefix] [nvarchar](50) NULL,
	[Prefix_Name] [nvarchar](50) NULL,
	[Code_Length] [int] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Auto_Codes_Prefix_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoServiceDetails]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoServiceDetails](
	[TemplateName] [nvarchar](50) NULL,
	[EngineOil] [decimal](18, 3) NULL,
	[GOil] [decimal](18, 3) NULL,
	[DOil] [decimal](18, 3) NULL,
	[ATF] [decimal](18, 3) NULL,
	[OilFilter] [decimal](18, 3) NULL,
	[Greasing] [decimal](18, 3) NULL,
	[Cemical] [decimal](18, 3) NULL,
	[PenetrolOil] [decimal](18, 3) NULL,
	[AutoCreame] [decimal](18, 3) NULL,
	[HighPresure] [decimal](18, 0) NULL,
	[Other] [decimal](18, 3) NULL,
	[BodyWash] [decimal](18, 3) NULL,
	[CompleteWash] [decimal](18, 3) NULL,
	[UnderWash] [decimal](18, 3) NULL,
	[InteriorWash] [decimal](18, 3) NULL,
	[InteriorCleaning] [decimal](18, 3) NULL,
	[OtherServiceCharge] [decimal](18, 3) NULL,
	[EngineOilPrice] [decimal](18, 3) NULL,
	[GOilPrice] [decimal](18, 3) NULL,
	[DoilPrice] [decimal](18, 3) NULL,
	[ATFPrice] [decimal](18, 3) NULL,
	[OilFIlterPrice] [decimal](18, 3) NULL,
	[GreasingPrice] [decimal](18, 3) NULL,
	[CemicalPrice] [decimal](18, 3) NULL,
	[PenetrolOilPrice] [decimal](18, 3) NULL,
	[AutoCreamePrice] [decimal](18, 3) NULL,
	[HighPresurePrice] [decimal](18, 3) NULL,
	[OtherPrice] [decimal](18, 3) NULL,
	[BodyWashPrice] [decimal](18, 3) NULL,
	[CompleteWashPrice] [decimal](18, 3) NULL,
	[UnderWashPrice] [decimal](18, 3) NULL,
	[InteriorWashPrice] [decimal](18, 3) NULL,
	[InteriorCleaningPrice] [decimal](18, 3) NULL,
	[OtherServiceChargePrice] [decimal](18, 3) NULL,
	[Status] [int] NULL,
	[CompanyCode] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoServiceDetailsCheckList]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoServiceDetailsCheckList](
	[VehicalNo] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[OilBrian] [nvarchar](50) NULL,
	[Serial] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[KM] [decimal](18, 3) NULL,
	[EngineOil] [nvarchar](50) NULL,
	[GOil] [nvarchar](50) NULL,
	[DOil] [nvarchar](50) NULL,
	[ATF] [nvarchar](50) NULL,
	[OilFilter] [nvarchar](50) NULL,
	[Greasing] [nvarchar](50) NULL,
	[Cemical] [nvarchar](50) NULL,
	[PenetrolOil] [nvarchar](50) NULL,
	[AutoCreame] [nvarchar](50) NULL,
	[HighPresure] [nvarchar](50) NULL,
	[Other] [nvarchar](50) NULL,
	[BodyWash] [nvarchar](50) NULL,
	[CompleteWash] [nvarchar](50) NULL,
	[UnderWash] [nvarchar](50) NULL,
	[InteriorWash] [nvarchar](50) NULL,
	[InteriorCleaning] [nvarchar](50) NULL,
	[OtherService] [nvarchar](50) NULL,
	[Status] [int] NULL CONSTRAINT [DF_AutoServiceDetailsCheckList_Status]  DEFAULT ((0)),
	[CompanyCode] [nvarchar](50) NULL CONSTRAINT [DF_AutoServiceDetailsCheckList_CompanyCode]  DEFAULT (N'COM01')
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[ID] [uniqueidentifier] NULL,
	[TransactionCode] [nvarchar](200) NULL,
	[TransferName] [decimal](18, 3) NULL,
	[BankBalance] [decimal](18, 3) NULL,
	[AccountName] [nvarchar](100) NULL,
	[TransactionAmount] [decimal](18, 3) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Is_Credit] [int] NULL,
	[Is_Debit] [int] NULL,
	[Status] [int] NULL,
	[SystemDate] [date] NULL,
	[ComapanyCode] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashAccount]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashAccount](
	[ID] [uniqueidentifier] NULL,
	[TransactionCode] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Amount] [decimal](18, 3) NULL,
	[CashBalance] [decimal](18, 3) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[Is_Credit] [int] NULL,
	[Is_Debit] [int] NULL,
	[Status] [int] NULL,
	[SystemDate] [date] NULL,
	[CompanyCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_CashAccount] PRIMARY KEY CLUSTERED 
(
	[TransactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashHeader]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashHeader](
	[TransactionCode] [nvarchar](100) NULL,
	[Total] [decimal](18, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDetails](
	[ID] [uniqueidentifier] NULL,
	[Name] [nvarchar](200) NULL,
	[Logo] [image] NULL,
	[Address] [nvarchar](200) NULL,
	[PrimaryContactNo] [nvarchar](50) NULL,
	[OtherContactNo] [nvarchar](200) NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[SystemDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission_Settings]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Settings](
	[ID] [uniqueidentifier] NULL CONSTRAINT [DF_Permission_Settings_ID]  DEFAULT (newid()),
	[Permission_Order] [int] IDENTITY(1,1) NOT NULL,
	[Setting_Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](10) NULL,
	[Last_Update_Time] [datetime] NULL CONSTRAINT [DF_Permission_Settings_Last_Update_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Permission_Settings_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_Permission_Settings] PRIMARY KEY CLUSTERED 
(
	[Setting_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Return_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Return_Details](
	[Doc_No] [nvarchar](50) NULL,
	[Item_Code] [nvarchar](50) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quentity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL,
	[System_Date_TIme] [datetime] NULL CONSTRAINT [DF_Sales_Return_Details_System_Date_TIme]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Sales_Return_Details_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Return_Details_Temp]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Return_Details_Temp](
	[ID] [nvarchar](1000) NULL,
	[Item_Code] [nvarchar](50) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quentity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Return_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Return_Header](
	[Doc_No] [nvarchar](50) NOT NULL,
	[Related_Invoice] [nvarchar](50) NULL,
	[Total_Amount] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
	[Customer_Code] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Sales_Return_Header_Status]  DEFAULT ((0)),
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Sales_Return_Header_System_Date_Time]  DEFAULT (getdate()),
 CONSTRAINT [PK_Sales_Return_Header] PRIMARY KEY CLUSTERED 
(
	[Doc_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service_LIst]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_LIst](
	[Doc_No] [nvarchar](100) NULL,
	[Date] [date] NULL,
	[Vehicle_No] [nvarchar](100) NULL,
	[Year] [nvarchar](50) NULL,
	[Made] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Engine_Oil] [nvarchar](100) NULL,
	[Transmition] [nvarchar](100) NULL,
	[D_Oil] [nvarchar](100) NULL,
	[Break_Oil] [nvarchar](100) NULL,
	[PSOil] [nvarchar](100) NULL,
	[Air_Filter] [nvarchar](100) NULL,
	[Carbon_Filters] [nvarchar](100) NULL,
	[W_Liquid] [nvarchar](100) NULL,
	[Other_01] [nvarchar](100) NULL,
	[Other_02] [nvarchar](100) NULL,
	[Other_03] [nvarchar](100) NULL,
	[Other_04] [nvarchar](100) NULL,
	[Body_Wash] [nvarchar](100) NULL,
	[Under_Wash] [nvarchar](100) NULL,
	[Complete_Washing] [nvarchar](100) NULL,
	[Interior_Cleaning] [nvarchar](100) NULL,
	[Other_Services_01] [nvarchar](100) NULL,
	[Other_Services_02] [nvarchar](100) NULL,
	[Other_Services_03] [nvarchar](100) NULL,
	[Other_Services_04] [nvarchar](100) NULL,
	[Wipers_Blade] [nvarchar](100) NULL,
	[Break_Pad_F] [nvarchar](100) NULL,
	[Break_Pad_R] [nvarchar](100) NULL,
	[Remark] [nvarchar](max) NULL,
	[Fuel_Injector] [nvarchar](100) NULL,
	[Oil_Filtors] [nvarchar](100) NULL,
	[Petrol_Filtors] [nvarchar](100) NULL,
	[Coolent] [nvarchar](100) NULL,
	[D_Filtors] [nvarchar](100) NULL,
	[User_Name] [nvarchar](100) NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Service_LIst_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Service_LIst_Status]  DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Item_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Item_Details](
	[ID] [uniqueidentifier] NULL CONSTRAINT [DF_Stock_Item_Details_ID]  DEFAULT (newid()),
	[Item_Code] [nvarchar](200) NULL,
	[Current_Qty] [decimal](18, 3) NULL,
	[Last_Update] [nvarchar](50) NULL,
	[Cost] [decimal](18, 3) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Note] [nvarchar](50) NULL,
	[Location_Code] [nvarchar](200) NULL,
	[Updated_Date_Time] [datetime] NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Stock_Item_Details_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Stock_Item_Details_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Details](
	[Doc_No] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[Nic] [nvarchar](50) NULL,
	[User_name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NULL,
	[User_Type] [nvarchar](50) NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_User_Details_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_User_Details_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_User_Details] PRIMARY KEY CLUSTERED 
(
	[User_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [expences].[workers_details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [expences].[workers_details](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NIC] [nvarchar](50) NULL,
	[Mobile_No] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Status] [bit] NULL,
	[SystemDate] [datetime] NULL,
 CONSTRAINT [PK_workers_details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Finance].[Bank_Account]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[Bank_Account](
	[Doc_No] [nvarchar](100) NULL,
	[Bank_Or_Act] [nvarchar](200) NOT NULL,
	[Account_No] [nvarchar](100) NOT NULL,
	[Account_Type] [nvarchar](50) NULL,
	[System_Date_Time] [datetime] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Bank_Account_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [Finance].[Bank_Transactions]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[Bank_Transactions](
	[Doc_No] [nvarchar](100) NULL,
	[Account_Doc_No] [nvarchar](100) NULL,
	[Account] [nvarchar](100) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Date] [date] NULL,
	[Type] [nvarchar](10) NULL,
	[Note] [nvarchar](500) NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Bank_Transactions_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Bank_Transactions_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [Finance].[Cash]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[Cash](
	[Doc_No] [nvarchar](100) NULL,
	[Account_Name] [nvarchar](200) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Transaction_Date] [date] NULL,
	[Note] [nvarchar](500) NULL,
	[Type] [nvarchar](10) NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Cash_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Cash_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [GRN].[GRN_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GRN].[GRN_Details](
	[Doc_No] [nvarchar](200) NULL,
	[Item_Code] [nvarchar](100) NULL,
	[Cost] [decimal](18, 3) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quantity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Status] [int] NULL CONSTRAINT [DF_GRN_Details_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [GRN].[GRN_Details_Temp]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GRN].[GRN_Details_Temp](
	[ID] [nvarchar](200) NULL,
	[Item_Code] [nvarchar](100) NULL,
	[Cost] [decimal](18, 3) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quantity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [GRN].[GRN_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GRN].[GRN_Header](
	[Doc_No] [nvarchar](100) NULL,
	[Supplier_Code] [nvarchar](100) NULL,
	[Doc_Date] [datetime] NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Cash_Payment] [decimal](18, 3) NULL,
	[Cheque_Payment] [decimal](18, 3) NULL,
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_GRN_Header_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_GRN_Header_Status]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Cheque]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Cheque](
	[Doc_No] [nvarchar](200) NULL,
	[Cheque_No] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Bank] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[System_Date_Time] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Cheque_Tempory]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Cheque_Tempory](
	[ID] [nvarchar](200) NULL,
	[Cheque_No] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Bank] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Invoice_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Invoice_Details](
	[Doc_No] [nvarchar](200) NULL,
	[Item_Code] [nvarchar](100) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quantity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Discount] [decimal](18, 3) NULL,
	[Status] [int] NULL CONSTRAINT [DF_Invoice_Details_Status]  DEFAULT ((0)),
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Invoice_Details_System_Date_Time]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Invoice_Details_temp]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Invoice_Details_temp](
	[ID] [nvarchar](200) NULL,
	[Item_Code] [nvarchar](100) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Quantity] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Discount] [decimal](18, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Invoice_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Invoice_Header](
	[Doc_No] [nvarchar](100) NULL,
	[Customer_Code] [nvarchar](100) NULL,
	[Doc_Date] [datetime] NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Cash_Payment] [decimal](18, 3) NULL,
	[Cheque_Payment] [decimal](18, 3) NULL,
	[Total_Discount] [decimal](18, 3) NULL,
	[Remark] [nvarchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_Invoice_Header_Status]  DEFAULT ((0)),
	[System_Date_Time] [datetime] NULL CONSTRAINT [DF_Invoice_Header_System_Date_Time]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Mobile_Transaction]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Mobile_Transaction](
	[Doc_No] [nvarchar](200) NULL,
	[Mobile_No] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Service] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[System_Date_Time] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[Tempory_Save_Mobile_Transaction]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[Tempory_Save_Mobile_Transaction](
	[ID] [nvarchar](200) NULL,
	[Mobile_No] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[Bank] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [stock].[Item_Current_Quentity]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stock].[Item_Current_Quentity](
	[ID] [uniqueidentifier] NULL,
	[Item_Code] [nvarchar](100) NULL,
	[Quentity] [decimal](18, 3) NULL,
	[Cost] [decimal](18, 3) NULL,
	[System_Date_Time] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [stock].[ItemDetails]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stock].[ItemDetails](
	[Doc_No] [nvarchar](100) NOT NULL,
	[ItemName] [nvarchar](200) NULL,
	[Quentity] [decimal](18, 3) NULL,
	[Cost] [decimal](18, 3) NULL,
	[Serial] [nvarchar](max) NULL,
	[Selling_Price] [decimal](18, 3) NULL,
	[Note] [nvarchar](max) NULL,
	[Expire_Date] [date] NULL,
	[Current_Stock] [decimal](18, 3) NULL,
	[Status] [int] NULL CONSTRAINT [DF_ItemDetails_Status]  DEFAULT ((0)),
	[SystemDate] [datetime] NULL CONSTRAINT [DF_ItemDetails_SystemDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ItemDetails] PRIMARY KEY CLUSTERED 
(
	[Doc_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Suppliers].[Supplier_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Suppliers].[Supplier_Details](
	[Doc_No] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Company_Name] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Nic] [nvarchar](50) NULL,
	[Mobile_2] [nvarchar](50) NULL,
	[Mobile_1] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Other_Contact_Details] [nvarchar](max) NULL,
	[Supplier_Since] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[User_Code] [nvarchar](200) NULL,
	[System_Date_Time] [date] NULL CONSTRAINT [DF_Supplier_Details_System_Date_Time]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_Supplier_Details_Status]  DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [transactions].[Cash_and_Cheque]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transactions].[Cash_and_Cheque](
	[id] [uniqueidentifier] NOT NULL,
	[Cash_Balance] [decimal](18, 3) NULL,
	[T_History] [decimal](18, 3) NULL,
	[Bank_Balance] [decimal](18, 3) NULL,
	[Bank_Account] [decimal](18, 3) NULL,
	[Acc_NO] [decimal](18, 0) NULL,
	[T_History_Bank] [decimal](18, 3) NULL,
	[Status] [bit] NULL,
	[SystemDate] [datetime] NULL,
 CONSTRAINT [PK_Cash_and_Cheque] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [transactions].[Transactions]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transactions].[Transactions](
	[ID] [uniqueidentifier] NOT NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[NameCustomer] [nvarchar](max) NULL,
	[CheqNumber] [nvarchar](50) NULL,
	[Amount] [decimal](18, 3) NULL,
	[SystemDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [customer].[Customer_Details] ([Doc_No], [Name], [Company_Name], [Address], [Nic], [Mobile_2], [Mobile_1], [Email], [Website], [Other_Contact_Details], [Customer_Since], [Note], [User_Code], [System_Date_Time], [Status]) VALUES (N'CUS-1', N'Default', NULL, N'', N'', N'', N'', N'', N'', N'', CAST(N'2017-11-14 00:00:00.000' AS DateTime), N'', N'', CAST(N'2017-11-14' AS Date), 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'c68e8d9f-e56d-438b-aa8c-50337adf2b11', N'INV', N'Invoice', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'492af679-9dbd-42e8-b449-fbbdc5e80e12', N'ITM', N'Items', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'a22bcc03-315b-4f99-a6c5-ae23da4608c6', N'CUS', N'Customers', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'ad5f87ff-b21c-418f-8aee-fb3227424401', N'SUP', N'Suppliers', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'f25291dc-8eff-4b97-8aa9-54ca8b1f9b1d', N'BNK', N'Banking', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'8c81c9dc-72d3-4e45-9bea-eed4aff5de85', N'STK', N'Stock', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'a9d2ed35-88be-4721-9c36-6e4510be804e', N'CHQ', N'Cheque', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'00dd8abe-4462-4654-801a-c081ddb55ac6', N'BTR', N'BankTransaction', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'd8b738b7-08a4-4e4a-a4b1-199e316a7092', N'CSH', N'Cash', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'661306e2-63f5-45d8-beb2-6b0b0a2ddc6b', N'SRD', N'Service_Details', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'd583d24c-7e77-4544-bf75-daea65cad3bd', N'GRN', N'GoodReceive', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'c68e8d9f-e56d-438b-aa8c-50337adf2b11', N'INV', N'Invoice', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'492af679-9dbd-42e8-b449-fbbdc5e80e12', N'ITM', N'Items', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'a22bcc03-315b-4f99-a6c5-ae23da4608c6', N'CUS', N'Customers', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'ad5f87ff-b21c-418f-8aee-fb3227424401', N'SUP', N'Suppliers', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'f25291dc-8eff-4b97-8aa9-54ca8b1f9b1d', N'BNK', N'Banking', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'8c81c9dc-72d3-4e45-9bea-eed4aff5de85', N'STK', N'Stock', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'a9d2ed35-88be-4721-9c36-6e4510be804e', N'CHQ', N'Cheque', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'00dd8abe-4462-4654-801a-c081ddb55ac6', N'BTR', N'BankTransaction', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'd8b738b7-08a4-4e4a-a4b1-199e316a7092', N'CSH', N'Cash', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'661306e2-63f5-45d8-beb2-6b0b0a2ddc6b', N'SRD', N'Service_Details', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'd583d24c-7e77-4544-bf75-daea65cad3bd', N'GRN', N'GoodReceive', 5, 0)
INSERT [dbo].[Auto_Codes_Prefix] ([ID], [Prefix], [Prefix_Name], [Code_Length], [Status]) VALUES (N'03ba76a8-42b1-4e65-83c0-2a7475c6175d', N'SRN', N'SalesReturn', 5, 0)
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', NULL, NULL)
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123456.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'ABC', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC2131', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123.000 AS Decimal(18, 3)), N'N/A', N'N/A', N'N/A', N'N/A', N'', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', NULL, N'N/A', N'N/A', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC123456', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(45645.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC2131', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123.000 AS Decimal(18, 3)), N'OK', N'N/A', N'OK', N'OK', N'', N'OK', N'N/A', N'OK', N'N/A', N'OK', N'N/A', N'N/A', N'OK', N'OK', NULL, N'OK', N'N/A', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', NULL, NULL)
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'Amila Nuwan', N'0712208784', N'Test', N'NA', N'NA', N'Saturday, November 19, 2016', CAST(12345687.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'NA', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'UB5052', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123456.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'ABC', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC2131', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123.000 AS Decimal(18, 3)), N'N/A', N'N/A', N'N/A', N'N/A', N'', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', NULL, N'N/A', N'N/A', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC123456', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(45645.000 AS Decimal(18, 3)), N'OK', N'OK', N'OK', N'OK', N'', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', N'OK', NULL, N'OK', N'OK', 0, N'COM01')
INSERT [dbo].[AutoServiceDetailsCheckList] ([VehicalNo], [CustomerName], [Telephone], [Address], [OilBrian], [Serial], [Date], [KM], [EngineOil], [GOil], [DOil], [ATF], [OilFilter], [Greasing], [Cemical], [PenetrolOil], [AutoCreame], [HighPresure], [Other], [BodyWash], [CompleteWash], [UnderWash], [InteriorWash], [InteriorCleaning], [OtherService], [Status], [CompanyCode]) VALUES (N'ABC2131', N'', N'', N'', N'', N'', N'Saturday, November 19, 2016', CAST(123.000 AS Decimal(18, 3)), N'OK', N'N/A', N'OK', N'OK', N'', N'OK', N'N/A', N'OK', N'N/A', N'OK', N'N/A', N'N/A', N'OK', N'OK', NULL, N'OK', N'N/A', 0, N'COM01')
SET IDENTITY_INSERT [dbo].[Permission_Settings] ON 

INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'e48df244-da28-48c8-820c-f6a2794d414e', 21, N'Barcode Print Access', N'ACTIVE', CAST(N'2017-11-12 21:15:04.053' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'df5d85db-ecfd-4aa1-a506-704dd45c20e0', 15, N'Customer Delete', N'ACTIVE', CAST(N'2017-11-12 12:13:10.520' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'c801ef29-44a6-4b52-87f3-7fb2b52579ee', 13, N'Customer Save', N'ACTIVE', CAST(N'2017-11-12 12:13:15.130' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'33136122-fe43-4a48-a384-d9d6fc6502c8', 14, N'Customer Update', N'ACTIVE', CAST(N'2017-11-12 12:13:20.303' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'7c3ff8f8-f421-4f78-8641-007fe7e5d1e9', 6, N'GRN Cost Change', N'ACTIVE', CAST(N'2017-11-12 12:02:23.210' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'606c97bc-a93b-4f28-b89f-4ea4a8150408', 7, N'GRN Discount Change', N'ACTIVE', CAST(N'2017-11-12 12:13:24.117' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'19b9e0bb-efa7-4e56-aa39-03c692a2818b', 8, N'GRN Old View', N'ACTIVE', CAST(N'2017-11-12 12:02:29.967' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'eff3b715-2761-4d00-a95a-16dceff9023b', 9, N'GRN Save', N'ACTIVE', CAST(N'2017-11-12 12:02:33.630' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'fbd0f28c-2199-47a2-adec-11f39352bad4', 3, N'Invoice Customer Select', N'DEACTIVE', CAST(N'2017-11-13 00:38:09.880' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'07d12649-ef6a-464e-9722-5fd87ad93402', 4, N'Invoice Date Select', N'ACTIVE', CAST(N'2017-11-12 17:15:00.940' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'f4c576f4-7880-47f9-bf12-3d28c085209c', 2, N'Invoice Discount', N'ACTIVE', CAST(N'2017-11-12 09:12:06.663' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'29c670d3-380d-4a2a-ab6f-d3cb1ad6a974', 1, N'Invoice Save', N'ACTIVE', CAST(N'2017-11-12 01:17:49.023' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'89afc45d-366e-47ae-9151-63ec847df368', 5, N'Invoice Selling Price Change', N'ACTIVE', CAST(N'2017-11-12 11:52:24.810' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'981536c1-4a26-4176-9cb8-5a4c23cb17e5', 12, N'Item Delete', N'ACTIVE', CAST(N'2017-11-12 12:12:51.443' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'b7da5b92-6902-4f50-9e7f-b9af88836a0e', 10, N'Item Save', N'ACTIVE', CAST(N'2017-11-12 12:12:55.517' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'f5711277-ca27-4197-bfcb-468384f6ef15', 11, N'Item Update', N'ACTIVE', CAST(N'2017-11-12 12:13:01.830' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'920e5f15-fc54-47b6-849b-5017a5722879', 19, N'Stock View', N'DEACTIVE', CAST(N'2017-11-12 08:40:21.957' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'5fca1400-1ecc-4150-b438-51d5708f4bfa', 18, N'Supplier Delete', N'ACTIVE', CAST(N'2017-11-12 12:22:18.823' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'70f36caa-f09c-43d8-ae08-c725420ecc0f', 16, N'Supplier Save', N'ACTIVE', CAST(N'2017-11-12 12:22:22.180' AS DateTime), 0)
INSERT [dbo].[Permission_Settings] ([ID], [Permission_Order], [Setting_Name], [Value], [Last_Update_Time], [Status]) VALUES (N'5a4a8cc1-649a-47ae-b8b2-b24cd5687f79', 17, N'Supplier Upadate', N'ACTIVE', CAST(N'2017-11-12 12:22:26.247' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Permission_Settings] OFF
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-1', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(10000.000 AS Decimal(18, 3)), CAST(N'2017-11-14 23:49:54.123' AS DateTime), 1)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-1', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(24000.000 AS Decimal(18, 3)), CAST(N'2017-11-14 23:49:54.123' AS DateTime), 1)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-2', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:35.603' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-2', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:35.603' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-2', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(20000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:35.603' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-3', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:51.510' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-3', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:51.510' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-3', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(20000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:19:51.510' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-4', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:21:23.843' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-4', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:21:23.843' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quentity], [Amount], [System_Date_TIme], [Status]) VALUES (N'SRN-4', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(20000.000 AS Decimal(18, 3)), CAST(N'2017-11-15 06:21:23.843' AS DateTime), 0)
INSERT [dbo].[Sales_Return_Header] ([Doc_No], [Related_Invoice], [Total_Amount], [Remark], [Customer_Code], [Date], [Status], [System_Date_Time]) VALUES (N'SRN-1', N'INV-1', N'34000.000', N'', N'CUS-1', CAST(N'2017-11-14' AS Date), 1, CAST(N'2017-11-14 23:49:54.120' AS DateTime))
INSERT [dbo].[Sales_Return_Header] ([Doc_No], [Related_Invoice], [Total_Amount], [Remark], [Customer_Code], [Date], [Status], [System_Date_Time]) VALUES (N'SRN-2', N'inv-2', N'38000.000', N'', N'CUS-1', CAST(N'2017-11-15' AS Date), 0, CAST(N'2017-11-15 06:19:35.603' AS DateTime))
INSERT [dbo].[Sales_Return_Header] ([Doc_No], [Related_Invoice], [Total_Amount], [Remark], [Customer_Code], [Date], [Status], [System_Date_Time]) VALUES (N'SRN-3', N'inv-2', N'38000.000', N'', N'CUS-1', CAST(N'2017-11-15' AS Date), 0, CAST(N'2017-11-15 06:19:51.510' AS DateTime))
INSERT [dbo].[Sales_Return_Header] ([Doc_No], [Related_Invoice], [Total_Amount], [Remark], [Customer_Code], [Date], [Status], [System_Date_Time]) VALUES (N'SRN-4', N'inv-2', N'38000.000', N'', N'CUS-1', CAST(N'2017-11-15' AS Date), 0, CAST(N'2017-11-15 06:21:23.843' AS DateTime))
INSERT [dbo].[Service_LIst] ([Doc_No], [Date], [Vehicle_No], [Year], [Made], [Model], [Engine_Oil], [Transmition], [D_Oil], [Break_Oil], [PSOil], [Air_Filter], [Carbon_Filters], [W_Liquid], [Other_01], [Other_02], [Other_03], [Other_04], [Body_Wash], [Under_Wash], [Complete_Washing], [Interior_Cleaning], [Other_Services_01], [Other_Services_02], [Other_Services_03], [Other_Services_04], [Wipers_Blade], [Break_Pad_F], [Break_Pad_R], [Remark], [Fuel_Injector], [Oil_Filtors], [Petrol_Filtors], [Coolent], [D_Filtors], [User_Name], [System_Date_Time], [Status]) VALUES (N'SRD-1', CAST(N'2017-04-29' AS Date), N'XYZ', N'', N'', N'', N'Replace', N'Replace', N'Top Up', N'', N'Replace', N'Change', N'Good', N'Replace', N'km', N'next km', N'O1', N'Checked', N'Yes', N'Yes', N'No', N'No', N'77', N'88', N'111', N'99', N'Ok', N'', N'Medium', N'', N'Yes', N'Replace', N'Replace', N'Top Up', N'Replace', N'User', CAST(N'2017-04-29 20:34:47.953' AS DateTime), 0)
INSERT [dbo].[Service_LIst] ([Doc_No], [Date], [Vehicle_No], [Year], [Made], [Model], [Engine_Oil], [Transmition], [D_Oil], [Break_Oil], [PSOil], [Air_Filter], [Carbon_Filters], [W_Liquid], [Other_01], [Other_02], [Other_03], [Other_04], [Body_Wash], [Under_Wash], [Complete_Washing], [Interior_Cleaning], [Other_Services_01], [Other_Services_02], [Other_Services_03], [Other_Services_04], [Wipers_Blade], [Break_Pad_F], [Break_Pad_R], [Remark], [Fuel_Injector], [Oil_Filtors], [Petrol_Filtors], [Coolent], [D_Filtors], [User_Name], [System_Date_Time], [Status]) VALUES (N'SRD-1', CAST(N'2017-04-29' AS Date), N'XYZ', N'', N'', N'', N'Replace', N'Replace', N'Top Up', N'', N'Replace', N'Change', N'Good', N'Replace', N'km', N'next km', N'O1', N'Checked', N'Yes', N'Yes', N'No', N'No', N'77', N'88', N'111', N'99', N'Ok', N'', N'Medium', N'', N'Yes', N'Replace', N'Replace', N'Top Up', N'Replace', N'User', CAST(N'2017-04-29 20:34:47.953' AS DateTime), 0)
INSERT [dbo].[Stock_Item_Details] ([ID], [Item_Code], [Current_Qty], [Last_Update], [Cost], [Selling_Price], [Note], [Location_Code], [Updated_Date_Time], [System_Date_Time], [Status]) VALUES (N'670f5482-0083-48af-a020-488aba3abc41', N'ITM-1', CAST(10.000 AS Decimal(18, 3)), N'INVOICE', CAST(1000.000 AS Decimal(18, 3)), CAST(2000.000 AS Decimal(18, 3)), N'', N'', CAST(N'2017-11-15 21:17:42.990' AS DateTime), CAST(N'2017-11-14 23:32:56.627' AS DateTime), 0)
INSERT [dbo].[Stock_Item_Details] ([ID], [Item_Code], [Current_Qty], [Last_Update], [Cost], [Selling_Price], [Note], [Location_Code], [Updated_Date_Time], [System_Date_Time], [Status]) VALUES (N'a9a4f4b9-2af5-449a-a0c3-2998bf7a4205', N'ITM-2', CAST(-34.000 AS Decimal(18, 3)), N'INVOICE', CAST(10000.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), N'', N'', CAST(N'2017-11-15 21:17:42.993' AS DateTime), CAST(N'2017-11-14 23:33:47.140' AS DateTime), 0)
INSERT [dbo].[Stock_Item_Details] ([ID], [Item_Code], [Current_Qty], [Last_Update], [Cost], [Selling_Price], [Note], [Location_Code], [Updated_Date_Time], [System_Date_Time], [Status]) VALUES (N'e551f716-324a-4fbb-a785-0d97bf07463c', N'ITM-3', CAST(-31.000 AS Decimal(18, 3)), N'INVOICE', CAST(2000.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), N'', N'', CAST(N'2017-11-15 21:17:42.993' AS DateTime), CAST(N'2017-11-15 06:18:00.337' AS DateTime), 0)
INSERT [dbo].[User_Details] ([Doc_No], [Name], [Nic], [User_name], [Password], [User_Type], [System_Date_Time], [Status]) VALUES (N'0D312956-4BA7-4644-BF9E-3CB5650C0276', N'Admin', N'', N'Admin', N'zxcvbnm', N'Administrator', CAST(N'2017-11-13 01:06:01.150' AS DateTime), 0)
INSERT [dbo].[User_Details] ([Doc_No], [Name], [Nic], [User_name], [Password], [User_Type], [System_Date_Time], [Status]) VALUES (N'B8C193D4-BEB6-40C8-B216-40B5350EC56E', N'Amila Nuwan', N'920313817V', N'Amila', N'0000', N'Standard User', CAST(N'2017-11-13 01:01:55.860' AS DateTime), 0)
INSERT [dbo].[User_Details] ([Doc_No], [Name], [Nic], [User_name], [Password], [User_Type], [System_Date_Time], [Status]) VALUES (N'4AF28C99-205C-4664-8D6E-E5C440D83329', N'Amila Test', N'4545', N'Amila123', N'1234', N'Standard User', CAST(N'2017-11-14 23:24:56.677' AS DateTime), 1)
INSERT [dbo].[User_Details] ([Doc_No], [Name], [Nic], [User_name], [Password], [User_Type], [System_Date_Time], [Status]) VALUES (N'8FEF9003-E7E8-4C6D-8F50-6E8952E7B2D2', N'Amila Test', N'4545', N'Amila1234', N'1234', N'Standard User', CAST(N'2017-11-14 23:25:19.483' AS DateTime), 0)
INSERT [dbo].[User_Details] ([Doc_No], [Name], [Nic], [User_name], [Password], [User_Type], [System_Date_Time], [Status]) VALUES (N'57DFBCE5-21E0-449C-B46D-0716CE23C9A4', N'Test', N'12345689', N'User', N'123', N'Standard User', CAST(N'2017-11-13 01:01:55.860' AS DateTime), 0)
INSERT [Finance].[Bank_Account] ([Doc_No], [Bank_Or_Act], [Account_No], [Account_Type], [System_Date_Time], [Status]) VALUES (N'BNK-1', N'Sampath wishwa', N'12314', N'Saving', NULL, 0)
INSERT [Finance].[Bank_Account] ([Doc_No], [Bank_Or_Act], [Account_No], [Account_Type], [System_Date_Time], [Status]) VALUES (N'BNK-1', N'Sampath wishwa', N'12314', N'Saving', NULL, 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-1', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'Test', CAST(N'2017-04-23 10:49:15.503' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-2', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'Test', CAST(N'2017-04-23 10:49:17.170' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-3', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'Test', CAST(N'2017-04-23 10:49:28.880' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-7', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'', CAST(N'2017-04-23 10:58:46.143' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-4', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'', CAST(N'2017-04-23 10:58:40.480' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-5', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'', CAST(N'2017-04-23 10:58:41.867' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-6', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'', CAST(N'2017-04-23 10:58:45.147' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-1', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'Test', CAST(N'2017-04-23 10:49:15.503' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-2', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'Test', CAST(N'2017-04-23 10:49:17.170' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-3', N'BNK-1', N'CS', CAST(150000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'Test', CAST(N'2017-04-23 10:49:28.880' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-7', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'', CAST(N'2017-04-23 10:58:46.143' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-4', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'', CAST(N'2017-04-23 10:58:40.480' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-5', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Debit', N'', CAST(N'2017-04-23 10:58:41.867' AS DateTime), 0)
INSERT [Finance].[Bank_Transactions] ([Doc_No], [Account_Doc_No], [Account], [Amount], [Date], [Type], [Note], [System_Date_Time], [Status]) VALUES (N'BTR-6', N'BNK-1', N'NN', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Credit', N'', CAST(N'2017-04-23 10:58:45.147' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-2', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.237' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-3', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.390' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-4', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.550' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-8', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:09.203' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-9', N'Bank', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Credit', CAST(N'2017-04-23 10:21:15.897' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-10', N'Bank Trasnfer', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Credit', CAST(N'2017-04-23 10:21:18.873' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-11', N'Bank Trasnfer', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Debit', CAST(N'2017-04-23 10:21:21.830' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-12', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:57:58.003' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-13', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:01.677' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-15', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.323' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-16', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.483' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-19', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.317' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-21', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:07.583' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-22', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.250' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-23', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.420' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-24', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.590' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-28', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.350' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-30', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.660' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-32', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.960' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-35', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.400' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-1', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:06.127' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-6', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.887' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-7', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:09.033' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-26', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.023' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-33', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.110' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-5', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.733' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-14', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:02.740' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-17', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.977' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-20', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.500' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-25', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.850' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-27', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.190' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-29', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.500' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-31', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.810' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-34', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.240' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-18', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.147' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-2', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.237' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-3', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.390' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-4', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.550' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-8', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:09.203' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-9', N'Bank', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Credit', CAST(N'2017-04-23 10:21:15.897' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-10', N'Bank Trasnfer', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Credit', CAST(N'2017-04-23 10:21:18.873' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-11', N'Bank Trasnfer', CAST(1000.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'test', N'Debit', CAST(N'2017-04-23 10:21:21.830' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-12', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:57:58.003' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-13', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:01.677' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-15', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.323' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-16', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.483' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-19', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.317' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-21', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:07.583' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-22', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.250' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-23', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.420' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-24', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.590' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-28', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.350' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-30', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.660' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-32', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.960' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-35', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.400' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-1', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:06.127' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-6', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.887' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-7', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:09.033' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-26', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.023' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-33', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.110' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-5', N'Test', CAST(1500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'Test', N'Debit', CAST(N'2017-04-23 09:59:08.733' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-14', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:02.740' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-17', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:03.977' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-20', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.500' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-25', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:08.850' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-27', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.190' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-29', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.500' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-31', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:09.810' AS DateTime), 1)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-34', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Credit', CAST(N'2017-04-23 10:58:10.240' AS DateTime), 0)
INSERT [Finance].[Cash] ([Doc_No], [Account_Name], [Amount], [Transaction_Date], [Note], [Type], [System_Date_Time], [Status]) VALUES (N'CSH-18', N'ABC', CAST(500.000 AS Decimal(18, 3)), CAST(N'2017-04-23' AS Date), N'', N'Debit', CAST(N'2017-04-23 10:58:04.147' AS DateTime), 0)
INSERT [GRN].[GRN_Details] ([Doc_No], [Item_Code], [Cost], [Selling_Price], [Quantity], [Amount], [Status]) VALUES (N'GRN-1', N'ITM-2', CAST(10000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(100000.000 AS Decimal(18, 3)), 1)
INSERT [GRN].[GRN_Details] ([Doc_No], [Item_Code], [Cost], [Selling_Price], [Quantity], [Amount], [Status]) VALUES (N'GRN-1', N'ITM-1', CAST(1000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(10000.000 AS Decimal(18, 3)), 1)
INSERT [GRN].[GRN_Header] ([Doc_No], [Supplier_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [System_Date_Time], [Status]) VALUES (N'GRN-1', N'SUP-2', CAST(N'2017-11-14 00:00:00.000' AS DateTime), CAST(110000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(N'2017-11-14 23:44:30.130' AS DateTime), 1)
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-6', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:25:58.070' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-6', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(4000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:25:58.070' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-7', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:58:10.810' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-7', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(15000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:58:10.810' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-7', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(4.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:58:10.810' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-1', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(10000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 1, CAST(N'2017-11-14 23:48:24.173' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-1', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(24000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 1, CAST(N'2017-11-14 23:48:24.173' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-4', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(20000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:20:11.043' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-4', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(120000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:20:11.043' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-4', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(15000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:20:11.043' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-5', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:21:36.500' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-5', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:21:36.500' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-5', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(30000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:21:36.500' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-11', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(120000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:17:42.990' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-11', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:17:42.990' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-11', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(4000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:17:42.990' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-2', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(12000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 06:19:06.710' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-2', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 06:19:06.710' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-2', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(20000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 06:19:06.710' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-3', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 06:35:41.503' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-3', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(24000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 06:35:41.503' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-8', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(6000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:59:29.700' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-8', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:59:29.700' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-8', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(24000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 20:59:29.700' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-9', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(3000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:00:55.430' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-9', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(2.000 AS Decimal(18, 3)), CAST(4000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:00:55.430' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-9', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(5.000 AS Decimal(18, 3)), CAST(60000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:00:55.430' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-10', N'ITM-3', CAST(3000.000 AS Decimal(18, 3)), CAST(3.000 AS Decimal(18, 3)), CAST(9000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:07:29.523' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-10', N'ITM-2', CAST(12000.000 AS Decimal(18, 3)), CAST(10.000 AS Decimal(18, 3)), CAST(120000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:07:29.523' AS DateTime))
INSERT [Sales].[Invoice_Details] ([Doc_No], [Item_Code], [Selling_Price], [Quantity], [Amount], [Discount], [Status], [System_Date_Time]) VALUES (N'INV-10', N'ITM-1', CAST(2000.000 AS Decimal(18, 3)), CAST(1.000 AS Decimal(18, 3)), CAST(2000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), 0, CAST(N'2017-11-15 21:07:29.523' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-3', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(27000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 06:35:41.503' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-6', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(7000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 20:25:58.070' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-7', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(30000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 20:58:10.810' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-1', N'CUS-1', CAST(N'2017-11-14 00:00:00.000' AS DateTime), CAST(34000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 1, CAST(N'2017-11-14 23:48:24.170' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-2', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(38000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 06:19:06.707' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-4', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(155000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 20:20:11.043' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-5', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(48000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 20:21:36.500' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-8', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(33000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 20:59:29.700' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-9', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(67000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 21:00:55.427' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-10', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(131000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 21:07:29.523' AS DateTime))
INSERT [Sales].[Invoice_Header] ([Doc_No], [Customer_Code], [Doc_Date], [Total_Amount], [Cash_Payment], [Cheque_Payment], [Total_Discount], [Remark], [Status], [System_Date_Time]) VALUES (N'INV-11', N'CUS-1', CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(127000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), NULL, 0, CAST(N'2017-11-15 21:17:42.990' AS DateTime))
INSERT [stock].[ItemDetails] ([Doc_No], [ItemName], [Quentity], [Cost], [Serial], [Selling_Price], [Note], [Expire_Date], [Current_Stock], [Status], [SystemDate]) VALUES (N'ITM-1', N'RAM', NULL, CAST(1000.000 AS Decimal(18, 3)), N'123456789', CAST(2000.000 AS Decimal(18, 3)), N'Test Note', CAST(N'2017-11-14' AS Date), NULL, 0, CAST(N'2017-11-14 23:32:56.627' AS DateTime))
INSERT [stock].[ItemDetails] ([Doc_No], [ItemName], [Quentity], [Cost], [Serial], [Selling_Price], [Note], [Expire_Date], [Current_Stock], [Status], [SystemDate]) VALUES (N'ITM-2', N'Mother Bords FOXCONN', NULL, CAST(10000.000 AS Decimal(18, 3)), N'N/A', CAST(12000.000 AS Decimal(18, 3)), N'TEST NOTE', CAST(N'2017-11-14' AS Date), NULL, 0, CAST(N'2017-11-14 23:33:47.137' AS DateTime))
INSERT [stock].[ItemDetails] ([Doc_No], [ItemName], [Quentity], [Cost], [Serial], [Selling_Price], [Note], [Expire_Date], [Current_Stock], [Status], [SystemDate]) VALUES (N'ITM-3', N'Power Supply', NULL, CAST(2000.000 AS Decimal(18, 3)), N'123456789', CAST(3000.000 AS Decimal(18, 3)), N'Test Note', CAST(N'2017-11-14' AS Date), NULL, 0, CAST(N'2017-11-15 06:18:00.317' AS DateTime))
INSERT [Suppliers].[Supplier_Details] ([Doc_No], [Name], [Company_Name], [Address], [Nic], [Mobile_2], [Mobile_1], [Email], [Website], [Other_Contact_Details], [Supplier_Since], [Note], [User_Code], [System_Date_Time], [Status]) VALUES (N'SUP-1', N'Default Supplier', N'TEST COM', N'', N'123645789V', N'', N'071123456', N'', N'', N'', CAST(N'2017-11-14 00:00:00.000' AS DateTime), N'', NULL, CAST(N'2017-11-14' AS Date), 0)
INSERT [Suppliers].[Supplier_Details] ([Doc_No], [Name], [Company_Name], [Address], [Nic], [Mobile_2], [Mobile_1], [Email], [Website], [Other_Contact_Details], [Supplier_Since], [Note], [User_Code], [System_Date_Time], [Status]) VALUES (N'SUP-2', N'Default Supplier', N'TEST COM', N'', N'123645789V', N'', N'071123456', N'', N'', N'', CAST(N'2017-11-14 00:00:00.000' AS DateTime), N'', NULL, CAST(N'2017-11-14' AS Date), 0)
ALTER TABLE [dbo].[AutoServiceDetails] ADD  CONSTRAINT [DF_AutoServiceDetails_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[AutoServiceDetails] ADD  CONSTRAINT [DF_AutoServiceDetails_CompanyCode]  DEFAULT (N'COM01') FOR [CompanyCode]
GO
ALTER TABLE [dbo].[CashAccount] ADD  CONSTRAINT [DF_CashAccount_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[CashAccount] ADD  CONSTRAINT [DF_CashAccount_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CashAccount] ADD  CONSTRAINT [DF_CashAccount_SystemDate]  DEFAULT (getdate()) FOR [SystemDate]
GO
ALTER TABLE [dbo].[CompanyDetails] ADD  CONSTRAINT [DF_CompanyDetails_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[CompanyDetails] ADD  CONSTRAINT [DF_CompanyDetails_SystemDateTime]  DEFAULT (getdate()) FOR [SystemDateTime]
GO
ALTER TABLE [expences].[workers_details] ADD  CONSTRAINT [DF_workers_details_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [Sales].[Cheque] ADD  CONSTRAINT [DF_Cheque_System_Date_Time]  DEFAULT (getdate()) FOR [System_Date_Time]
GO
ALTER TABLE [Sales].[Mobile_Transaction] ADD  CONSTRAINT [DF_Mobile_Transaction_System_Date_Time]  DEFAULT (getdate()) FOR [System_Date_Time]
GO
ALTER TABLE [stock].[Item_Current_Quentity] ADD  CONSTRAINT [DF_Item_Current_Quentity_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [stock].[Item_Current_Quentity] ADD  CONSTRAINT [DF_Item_Current_Quentity_System_Date_Time]  DEFAULT (getdate()) FOR [System_Date_Time]
GO
ALTER TABLE [stock].[Item_Current_Quentity] ADD  CONSTRAINT [DF_Item_Current_Quentity_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [transactions].[Cash_and_Cheque] ADD  CONSTRAINT [DF_Cash_and_Cheque_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [transactions].[Transactions] ADD  CONSTRAINT [DF_Transactions_SystemDate]  DEFAULT (getdate()) FOR [SystemDate]
GO
ALTER TABLE [transactions].[Transactions] ADD  CONSTRAINT [DF_Transactions_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  StoredProcedure [customer].[Customer_Code]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [customer].[Customer_Code] 

AS
BEGIN
	DECLARE			@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM customer.Customer_Details
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Customers'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'
END


GO
/****** Object:  StoredProcedure [customer].[Load_Customer_Code_And_Name_Using_Vehicle_No]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [customer].[Load_Customer_Code_And_Name_Using_Vehicle_No]
@Vehicle_No NVARCHAR(200)
AS
BEGIN
SELECT TOP 1 ISNULL(Doc_No,'') AS 'Doc_No',ISNULL(Name,'') AS 'Name' FROM  [Customer].[Customer_Details] WHERE Company_Name LIKE '%'+@Vehicle_No+'%'
END


GO
/****** Object:  StoredProcedure [customer].[Load_Customers_Grid]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [customer].[Load_Customers_Grid] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT Doc_No,Name, Company_Name AS 'Vehicle No', Address, Nic, Mobile_2, Mobile_1, Email, Website, Other_Contact_Details, Customer_Since AS 'Birthday', Note FROM
[Customer].[Customer_Details]
WHERE Status=0 AND
(Doc_No LIKE '%'+@Search_Condition+'%' OR
Company_Name LIKE '%'+@Search_Condition+'%' OR
Name LIKE '%'+@Search_Condition+'%' OR
Address LIKE '%'+@Search_Condition+'%' OR
Nic LIKE '%'+@Search_Condition+'%' OR
Mobile_2 LIKE '%'+@Search_Condition+'%' OR
Mobile_1 LIKE '%'+@Search_Condition+'%' OR
Email LIKE '%'+@Search_Condition+'%' OR
Website LIKE '%'+@Search_Condition+'%' OR
Customer_Since LIKE '%'+@Search_Condition+'%') ORDER BY System_Date_Time DESC
END


GO
/****** Object:  StoredProcedure [customer].[Save_Customer_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AMILA NUWAN
-- Create date: <Create Date,,>
-- Description: Save Customer details
-- =============================================
CREATE PROCEDURE [customer].[Save_Customer_Details] 
@Name NVARCHAR(200),
@Address NVARCHAR(200),
@Nic NVARCHAR(200),
@Mobile_2 NVARCHAR(200),
@Mobile_1 NVARCHAR(200),
@Email NVARCHAR(200),
@Website NVARCHAR(200),
@Other_Contact_Details NVARCHAR(200),
@Customer_Since date,
@Note NVARCHAR(200),
@User_Code NVARCHAR(200)



AS
BEGIN
	SET NOCOUNT ON;

	DECLARE			@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM customer.Customer_Details
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Customers'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					--SELECT @Doc_No

	INSERT INTO [Customer].[Customer_Details]
	( Doc_No,Name,  Address, Nic, Mobile_2, Mobile_1, Email, Website, Other_Contact_Details, Customer_Since, Note,User_Code)
	VALUES
	(@Doc_No,@Name,@Address,@Nic,@Mobile_2,@Mobile_1,@Email, @Website,@Other_Contact_Details,@Customer_Since,@Note,@User_Code)

END



GO
/****** Object:  StoredProcedure [customer].[Update_Customer]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [customer].[Update_Customer]
@Save_Type				INT,
@Doc_No					NVARCHAR(200),
@Name					NVARCHAR(200),
@Address				NVARCHAR(200),
@Nic					NVARCHAR(200),
@Mobile_2				NVARCHAR(200),
@Mobile_1				NVARCHAR(200),
@Email					NVARCHAR(200),
@Website				NVARCHAR(200),
@Other_Contact_Details  NVARCHAR(200),
@Customer_Since			date,
@Note					NVARCHAR(200)

AS
BEGIN
IF(@Save_Type=1)
	BEGIN
	UPDATE [Customer].[Customer_Details] SET Doc_No = @Doc_No,Name=@Name, Address=@Address,
	Nic=@Nic, Mobile_2=@Mobile_2, Mobile_1=@Mobile_1, Email=@Email, Website=@Website, Other_Contact_Details=@Other_Contact_Details, Customer_Since=@Customer_Since, Note=@Note
	WHERE Doc_No=@Doc_No
	END
ELSE IF (@Save_Type=2)
	BEGIN
	UPDATE [Customer].[Customer_Details] SET Status=1 WHERE Doc_No=@Doc_No
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Add_Service_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Add_Service_Details] 
@TemplateName NVARCHAR(50),
@EngineOil DECIMAL(18,3),
@GOil DECIMAL(18,3),
@DOil DECIMAL(18,3),
@ATF DECIMAL(18,3),
@OilFilter DECIMAL(18,3),
@Greasing DECIMAL(18,3),
@Cemical DECIMAL(18,3),
@PenetrolOil DECIMAL(18,3),
@AutoCreame DECIMAL(18,3),
@HighPresure DECIMAL(18,3),
@Other DECIMAL(18,3),
@BodyWash DECIMAL(18,3),
@UnderWash DECIMAL(18,3),
@CompleteWash DECIMAL(18,3),
@InteriorWash DECIMAL(18,3),
--@InteriorCleaning DECIMAL(18,3),
@OtherServiceCharge DECIMAL(18,3),
--Price
@EngineOilPrice DECIMAL(18,3),
@GOilPrice DECIMAL(18,3),
@DOilPrice DECIMAL(18,3),
@ATFPrice DECIMAL(18,3),
@OilFilterPrice DECIMAL(18,3),
@GreasingPrice DECIMAL(18,3),
@CemicalPrice DECIMAL(18,3),
@PenetrolOilPrice DECIMAL(18,3),
@AutoCreamePrice DECIMAL(18,3),
@HighPresurePrice DECIMAL(18,3),
@OtherPrice DECIMAL(18,3),
@BodyWashPrice DECIMAL(18,3),
@UnderWashPrice DECIMAL(18,3),
--@InteriorWashPrice DECIMAL(18,3),
@CompleteWashPrice DECIMAL(18,3),
@InteriorCleaningPrice DECIMAL(18,3),
@OtherServiceChargePrice DECIMAL(18,3)
AS
BEGIN
INSERT INTO [dbo].[AutoServiceDetails] (TemplateName, EngineOil, GOil, DOil, ATF, OilFilter, Greasing, Cemical, PenetrolOil, AutoCreame, HighPresure, Other, BodyWash, UnderWash, InteriorWash, InteriorCleaning, OtherServiceCharge,EngineOilPrice, GOilPrice, DOilPrice, ATFPrice, OilFilterPrice, GreasingPrice, CemicalPrice, PenetrolOilPrice, AutoCreamePrice, HighPresurePrice, OtherPrice, BodyWashPrice, UnderWashPrice, InteriorWashPrice, InteriorCleaningPrice, OtherServiceChargePrice,CompleteWash,CompleteWashPrice)
VALUES(@TemplateName,@EngineOil,@GOil, @DOil, @ATF, @OilFilter, @Greasing, @Cemical, @PenetrolOil, @AutoCreame, @HighPresure, @Other, @BodyWash, @UnderWash, @InteriorWash, @InteriorCleaningPrice, @OtherServiceCharge,@EngineOilPrice,@GOilPrice, @DOilPrice, @ATFPrice, @OilFilterPrice, @GreasingPrice, @CemicalPrice, @PenetrolOilPrice, @AutoCreamePrice, @HighPresurePrice, @OtherPrice, @BodyWashPrice, @UnderWashPrice, @InteriorWash, @InteriorCleaningPrice, @OtherServiceChargePrice,@CompleteWash,@CompleteWashPrice)
END


GO
/****** Object:  StoredProcedure [dbo].[Auto_Service_Check_List]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Auto_Service_Check_List]
	-- Add the parameters for the stored procedure here
	
	@VehicalNo NVARCHAR(50) ,
	@CustomerName NVARCHAR(50) ,
	@Telephone NVARCHAR(50) ,
	@Address NVARCHAR(50) ,
	@OilBrian NVARCHAR(50) ,
	@Serial NVARCHAR(50) ,
	@Date NVARCHAR(50) ,
	@KM DECIMAL(18, 3) ,
	@EngineOil NVARCHAR(50) ,
	@GOil NVARCHAR(50) ,
	@DOil NVARCHAR(50) ,
	@ATF NVARCHAR(50) ,
	@OilFilter NVARCHAR(50) ,
	@Greasing NVARCHAR(50) ,
	@Cemical NVARCHAR(50) ,
	@PenetrolOil NVARCHAR(50) ,
	@AutoCreame NVARCHAR(50) ,
	@HighPresure NVARCHAR(50) ,
	@Other NVARCHAR(50) ,
	@BodyWash NVARCHAR(50) ,
	@CompleteWash NVARCHAR(50) ,
	@UnderWash NVARCHAR(50) ,
	@InteriorCleaning NVARCHAR(50) ,
	@OtherService NVARCHAR(50) 
AS
BEGIN
INSERT INTO [dbo].[AutoServiceDetailsCheckList]
           ([VehicalNo]
           ,[CustomerName]
           ,[Telephone]
           ,[Address]
           ,[OilBrian]
           ,[Serial]
           ,[Date]
           ,[KM]
           ,[EngineOil]
           ,[GOil]
           ,[DOil]
           ,[ATF]
           ,[OilFilter]
           ,[Greasing]
           ,[Cemical]
           ,[PenetrolOil]
           ,[AutoCreame]
           ,[HighPresure]
           ,[Other]
           ,[BodyWash]
           ,[CompleteWash]
           ,[UnderWash]
           ,[InteriorCleaning]
           ,[OtherService])

     VALUES (@VehicalNo,
	@CustomerName,
	@Telephone ,
	@Address,
	@OilBrian,
	@Serial,
	@Date  ,
	@KM,
	@EngineOil,
	@GOil,
	@DOil,
	@ATF,
	@OilFilter,
	@Greasing,
	@Cemical,
	@PenetrolOil,
	@AutoCreame,
	@HighPresure,
	@Other,
	@BodyWash,
	@CompleteWash,
	@UnderWash,
	@InteriorCleaning,
	@OtherService)
END


GO
/****** Object:  StoredProcedure [dbo].[Available_cash_balance]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Available_cash_balance] 
	
AS
BEGIN
DECLARE 
@Amount_From_Cash DECIMAL(18,3),
@Total_Amount DECIMAL(18,3),
@Total_Amount_Credit DECIMAL(18,3)
SELECT @Amount_From_Cash = ISNULL(SUM(ISNULL([Amount],0)),0)FROM [dbo].[CashAccount]  WHERE [Is_Debit] =1 
SELECT @Total_Amount_Credit =  ISNULL(SUM(ISNULL([Amount],0)),0)FROM [dbo].[CashAccount]  WHERE Is_Credit =1 

DECLARE @tempTable TABLE (Balance DECIMAL(18,3))
DECLARE 
@Amount_From_Sales DECIMAL(18,3)
INSERT INTO @tempTable
SELECT (ISNULL([Item_Cost],0) * ISNULL([Quantity],0)) - (ISNULL(Discount,0)/100) FROM [Sales].[Sales]
SELECT @Amount_From_Sales= ISNULL(SUM(ISNULL(Balance,0)),0) FROM @tempTable
SET @Total_Amount = @Amount_From_Sales+(@Amount_From_Cash-@Total_Amount_Credit)
SELECT @Total_Amount As 'Amount'



END


GO
/****** Object:  StoredProcedure [dbo].[Cash_Book_Save_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Cash_Book_Save_Data] 
	-- Add the parameters for the stored procedure here
@TransactionCode NVARCHAR(200),
@Amount DECIMAL(18,3),
@TransactionType NVARCHAR(100),
@Note NVARCHAR(MAX),
@Type NVARCHAR(10),
@Name NVARCHAR(200)
AS
BEGIN


DECLARE
@CashBalance DECIMAL(18,3)
SELECT @CashBalance= ISNULL(SUM(ISNULL(Amount,0)),0) FROM [dbo].[CashAccount] WHERE Status = 0 AND Is_Debit =1

IF(@Type='Debit')
BEGIN
INSERT INTO [dbo].[CashAccount] (TransactionCode,Name, Amount, CashBalance, TransactionType,Note,Is_Credit,Is_Debit)
VALUES (@TransactionCode,@Name,@Amount,@CashBalance,@TransactionType,@Note,0,1)
END
ELSE IF((@Type='Credit'))
BEGIN
INSERT INTO [dbo].[CashAccount] (TransactionCode,Name, Amount, CashBalance, TransactionType,Note,Is_Credit,Is_Debit)
VALUES (@TransactionCode,@Name,@Amount,@CashBalance,@TransactionType,@Note,1,0)
END
END



GO
/****** Object:  StoredProcedure [dbo].[Clear_All_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clear_All_Data] 

AS
BEGIN
delete from [customer].[Customer_Details]
delete from [dbo].[AutoServiceDetails]
delete from [dbo].[BankAccount]
delete from [dbo].[CashAccount]
delete from [dbo].[CashHeader]
delete from [dbo].[CompanyDetails]
delete from [dbo].[Customer]
delete from [dbo].[InventoryDetails]
delete from [expences].[workers_details]
delete from [Finance].[Bank_Account]
delete from [Finance].[Bank_Transactions]
delete from [Finance].[Cash]
delete from [GRN].[GRN_Details]
delete from [GRN].[GRN_Details_Temp]
delete from [GRN].[GRN_Header]
delete from [Sales].[Cheque]
delete from [Sales].[Cheque_Tempory]
delete from [Sales].[Invoice_Details]
delete from [Sales].[Invoice_Details_temp]
delete from [Sales].[Invoice_Document_ID]
delete from [Sales].[Invoice_Header]
delete from [Sales].[Mobile_Transaction]
delete from [Sales].[Sales]
delete from [Sales].[Sales_ALL]
delete from [Sales].[Sales_Details]
delete from [Sales].[Sales_Header]
delete from [Sales].[Sales_POS]
delete from [Sales].[Tempory_Save_Mobile_Transaction]
delete from [stock].[Item_Stock_Details]
delete from [stock].[ItemDetails]
delete from [stock].[ItemHeader]
delete from [Suppliers].[Supplier_Details]
delete from [transactions].[Cash_and_Cheque]
delete from [transactions].[Transactions]
END


GO
/****** Object:  StoredProcedure [dbo].[Create_User]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Create_User]

@Save_type INT,@Name nvarchar(200), @Nic nvarchar(200), @User_name nvarchar(200), @Password nvarchar(200),@Type nvarchar(100)
AS
BEGIN
IF(@Save_type=1)
BEGIN
INSERT INTO [dbo].[User_Details] (Doc_No, Name, Nic, User_name, Password,User_Type)
VALUES(NEWID(), @Name, @Nic, @User_name, @Password,@Type)
END
ELSE IF(@Save_type=2)
BEGIN
UPDATE [dbo].[User_Details] SET Status=1 WHERE User_name=@User_name AND Password=@Password
END
END
--select * from [dbo].[User_Details] 

GO
/****** Object:  StoredProcedure [dbo].[Delete_Service_List]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Service_List] 
@Doc_No		NVARCHAR(200)
AS
BEGIN
UPDATE [dbo].[Service_LIst] SET Status=1 WHERE Doc_No = @Doc_No
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteTemplate]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTemplate] 
	-- Add the parameters for the stored procedure here
@Delete NVARCHAR(50)
AS
BEGIN
  UPDATE [dbo].[AutoServiceDetails] SET Status = 1 WHERE @Delete = [TemplateName] 
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Cash_Balance]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Get_Cash_Balance] 
	-- Add the parameters for the stored procedure here
@EXE NVARCHAR(200)
AS
BEGIN
DECLARE
@CashBalance DECIMAL(18,3)
SELECT @CashBalance= ISNULL(SUM(ISNULL(Amount,0)),0) FROM [dbo].[CashAccount] WHERE Status = 0 AND Is_Debit =1

SELECT * FROM [dbo].[CashHeader]
END


GO
/****** Object:  StoredProcedure [dbo].[Inventory_Item_Save]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Inventory_Item_Save] 

@ItemCode NVARCHAR(200), 
@InvoiceNo NVARCHAR(200), 
@ItemName NVARCHAR(200), 
@Category NVARCHAR(200), 
@Quentity DECIMAL(18,3), 
@Cost DECIMAL(18,3), 
@ExpireDate NVARCHAR(200), 
@SupplierName NVARCHAR(200), 
@Note NVARCHAR(200), 
@PaymentMethod NVARCHAR(200), 
@PayeedBy NVARCHAR(200), 
@PayeedAmount DECIMAL(18,3),
@Status int
AS
BEGIN

INSERT INTO [dbo].[InventoryDetails]  (ItemCode, InvoiceNo, ItemName, Category, Quentity, Cost, ExpireDate, SupplierName, Note, PaymentMethod, PayeedBy, PayeedAmount, Status)
VALUES (@ItemCode,@InvoiceNo,@ItemName,@Category,@Quentity,@Cost,@ExpireDate,@SupplierName,@Note,'CASH',@PayeedBy,@PayeedAmount,@Status)

END


GO
/****** Object:  StoredProcedure [dbo].[Load_Permission]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Load_Permission]
@Search_Condition nvarchar(100)
AS
BEGIN

SELECT [Setting_Name],[Value] FROM [dbo].[Permission_Settings] WHERE Status = 0
AND ([Setting_Name] LIKE '%'+@Search_Condition+'%' OR  [Value] LIKE @Search_Condition+'%')
ORDER BY [Setting_Name] ASC, [Value] ASC
 
END

GO
/****** Object:  StoredProcedure [dbo].[Load_Permission_For_User]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Load_Permission_For_User]

AS
BEGIN
--dont change order by column

SELECT Setting_Name, Value FROM [dbo].[Permission_Settings] ORDER BY [Permission_Order] ASC
END

GO
/****** Object:  StoredProcedure [dbo].[Load_Service_List]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Load_Service_List]
@Vehicle_No nvarchar(200)
AS
BEGIN
SELECT Doc_No,Vehicle_No AS 'Vehicle No',Year,Made,Model,Date, Engine_Oil AS 'Engine Oil', Transmition, D_Oil AS 'D Oil', Break_Oil AS 'Break Oil', PSOil, Air_Filter AS 'Air Filters', Carbon_Filters AS 'Carbon Filters', W_Liquid AS 'W Liquid', Other_01 AS 'KM', Other_02 AS 'NEXT KM',Wipers_Blade,Break_Pad_F,Break_Pad_R, Other_03 AS 'Other 01', Other_04 AS 'Battery',
Body_Wash AS 'Body Wash', Under_Wash AS 'Under Wash', Complete_Washing as 'Complete Washing', Interior_Cleaning AS 'Interior Cleaning', Other_Services_01, Other_Services_02, Other_Services_03, Other_Services_04
,[Fuel_Injector],[Oil_Filtors],[Petrol_Filtors],[Coolent],[D_Filtors],Remark,User_Name AS 'Saved By'
FROM [dbo].[Service_LIst]
WHERE Vehicle_No LIKE '%'+@Vehicle_No+'%' AND Status=0
ORDER BY System_Date_Time DESC
END


GO
/****** Object:  StoredProcedure [dbo].[Reports_Daily_Summary]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reports_Daily_Summary]

@From_Date DATE,
@To_Date DATE

AS
BEGIN
DECLARE	@Invoice_Total DECIMAL(18,3),
		@GRN_Total		DECIMAL(18,3)

DECLARE @Temp_Table TABLE (Transaction_Name NVARCHAR(200),Transaction_Code NVARCHAR(200),Transaction_Time NVARCHAR(100),Amount DECIMAL(18,3))

INSERT INTO @Temp_Table (Transaction_Name)
VALUES('CUSTOMER INVOICES')

INSERT INTO @Temp_Table (Transaction_Name,Transaction_Code,Transaction_Time,Amount)
SELECT 'INVOICE',DOC_NO, RIGHT(CONVERT(VARCHAR, System_Date_Time, 100), 7)
,Total_Amount FROM [Sales].[Invoice_Header] WHERE Status = 0 AND
CONVERT(VARCHAR(10),System_Date_Time,(120))>=@From_Date AND CONVERT(VARCHAR(10),System_Date_Time,(120))<=@To_Date

SELECT  @Invoice_Total = ISNULL(SUM(ISNULL(Amount,0)),0) FROM @Temp_Table WHERE Transaction_Name = 'INVOICE'

INSERT INTO @Temp_Table (Transaction_Name,Amount) 
VALUES('TOTAL INVOICE AMOUNT',@Invoice_Total)

INSERT INTO @Temp_Table (Transaction_Name)
VALUES('SUPPLIER GRNS')

INSERT INTO @Temp_Table (Transaction_Name,Transaction_Code,Transaction_Time,Amount)
SELECT 'GOOD RECEIVED',DOC_NO, RIGHT(CONVERT(VARCHAR, System_Date_Time, 100), 7)
,Total_Amount FROM  [GRN].[GRN_Header] WHERE Status = 0 AND
CONVERT(VARCHAR(10),System_Date_Time,(120))>=@From_Date AND CONVERT(VARCHAR(10),System_Date_Time,(120))<=@To_Date

SELECT  @GRN_Total = ISNULL(SUM(ISNULL(Amount,0)),0) FROM @Temp_Table WHERE Transaction_Name = 'GOOD RECEIVED'

INSERT INTO @Temp_Table (Transaction_Name,Amount) 
VALUES('TOTAL GRN AMOUNT',@GRN_Total)

--SELECT * FROM [GRN].[GRN_Header]

SELECT * FROM @Temp_Table


END

GO
/****** Object:  StoredProcedure [dbo].[Reports_Stock_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reports_Stock_Details]

AS
BEGIN
SELECT ID.ItemName AS 'Item_Name',SD.[Item_Code],SD.[Current_Qty] AS 'Quentity',SD.[Cost],SD.[Selling_Price]
FROM [dbo].[Stock_Item_Details] AS SD
LEFT JOIN [stock].[ItemDetails] AS ID ON ID.Doc_No = SD.Item_Code
WHERE SD.Status = 0
END

GO
/****** Object:  StoredProcedure [dbo].[Save_Update_Delete_Service_List]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Save_Update_Delete_Service_List] 

@Engine_Oil NVARCHAR(100),
@Transmition NVARCHAR(100),
@D_Oil NVARCHAR(100),
@Break_Oil NVARCHAR(100),
@PSOil NVARCHAR(100),
@Air_Filter NVARCHAR(100),
@Carbon_Filters NVARCHAR(100),
@W_Liquid NVARCHAR(100),
@Other_01 NVARCHAR(100),
@Other_02 NVARCHAR(100),
@Other_03 NVARCHAR(100),
@Other_04 NVARCHAR(100),
@Body_Wash NVARCHAR(100),
@Under_Wash NVARCHAR(100),
@Complete_Washing NVARCHAR(100),
@Interior_Cleaning NVARCHAR(100),
@Other_Services_01 NVARCHAR(100),
@Other_Services_02 NVARCHAR(100),
@Other_Services_03 NVARCHAR(100),
@Other_Services_04 NVARCHAR(100),
@Vehicle_No  NVARCHAR(100),
@Year NVARCHAR(100),
@Made NVARCHAR(100),
@Model NVARCHAR(100),
@Wipers_Blade NVARCHAR(100),
@Break_Pad_F NVARCHAR(100),
@Break_Pad_R NVARCHAR(100),
@User_Name	 NVARCHAR(100),
@Remark NVARCHAR(MAX),
@Date	date,
@Fuel_Injector 	 NVARCHAR(100),
@Oil_Filtors 	 NVARCHAR(100),
@Petrol_Filtors 	 NVARCHAR(100),
@Coolent 	 NVARCHAR(100),
@D_Filtors	 NVARCHAR(100)
AS
BEGIN

	DECLARE			@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Prefix				nvarchar(100),
					@Doc_No NVARCHAR(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM dbo.Service_LIst
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Service_Details'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No



	INSERT INTO [dbo].[Service_LIst] (Doc_No,Vehicle_No,Year,Made,Model,Date, Engine_Oil, Transmition, D_Oil, Break_Oil, PSOil, Air_Filter, Carbon_Filters, W_Liquid, Other_01, Other_02, Other_03, Other_04, Body_Wash, Under_Wash, Complete_Washing, Interior_Cleaning, Other_Services_01, Other_Services_02, Other_Services_03, Other_Services_04,Wipers_Blade,Break_Pad_F,Break_Pad_R,User_Name,Remark,
	[Fuel_Injector],[Oil_Filtors],[Petrol_Filtors],[Coolent],[D_Filtors])
	VALUES(@Doc_No,@Vehicle_No,@Year,@Made,@Model,@Date,@Engine_Oil,@Transmition,@D_Oil,@Break_Oil,@PSOil,@Air_Filter,@Carbon_Filters,@W_Liquid,@Other_01,@Other_02,@Other_03,@Other_04,@Body_Wash,@Under_Wash,@Complete_Washing,@Interior_Cleaning,@Other_Services_01,@Other_Services_02,@Other_Services_03,@Other_Services_04,@Wipers_Blade,@Break_Pad_F,@Break_Pad_R,@User_Name,@Remark,
	@Fuel_Injector,@Oil_Filtors,@Petrol_Filtors,@Coolent,@D_Filtors)
END

--delete from [dbo].[Service_LIst]

GO
/****** Object:  StoredProcedure [dbo].[Search_In_Cash_Book]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Search_In_Cash_Book] 
	-- Add the parameters for the stored procedure here
@Search_condition NVARCHAR(200)
AS
BEGIN
SELECT TransactionCode,Name,Amount, CashBalance, TransactionType, Note FROM [dbo].[CashAccount] 
WHERE TransactionType LIKE '%'+@Search_condition+'%'
END


GO
/****** Object:  StoredProcedure [dbo].[SRN_Delete_SRN]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Delete_SRN]
@Doc_No		NVARCHAR(200)

AS
BEGIN

DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@SRN_Temp_Qty			DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @SRN_Temp_Qty= ISNULL(SUM(ISNULL([Quentity],0)),0) FROM [dbo].[Sales_Return_Details]
	WHERE Item_Code = @Item_Code AND Doc_No = @Doc_No

	SET @Updated_Qty =@Current_Balance - @SRN_Temp_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='GRN',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details

	update [dbo].[Sales_Return_Header] set Status =1 where Doc_No =@Doc_No
	update [dbo].[Sales_Return_Details] set Status =1 where Doc_No =@Doc_No

END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Load_Invoice_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Load_Invoice_Details]

@Invoice		NVARCHAR(100)

AS
BEGIN
SELECT SD.ItemName,ID.[Item_Code] AS 'ItemCode',ID.[Selling_Price] AS 'ItemCost',ID.[Quantity] AS 'ItemQuentity',ID.[Amount]
FROM [Sales].[Invoice_Details] AS ID
LEFT JOIN [stock].[ItemDetails] AS SD ON ID.Item_Code= SD.Doc_No  
WHERE ID.[Doc_No] = @Invoice AND ID.[Status] = 0

END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Load_Invoice_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Load_Invoice_Header]

@Invoice		NVARCHAR(100)

AS
BEGIN

SELECT TOP 1 IH.Doc_No,IH.Customer_Code,CD.Name,IH.Total_Amount FROM [Sales].[Invoice_Header] AS IH
LEFT JOIN [customer].[Customer_Details] AS CD  ON IH.Customer_Code = CD.Doc_No
WHERE IH.Doc_No = @Invoice	AND IH.Status =0
END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Load_SRN_DETAILS]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Load_SRN_DETAILS] 

@Search_Condition nvarchar(100)
AS
BEGIN

SELECT SRD.Doc_No,ID.[ItemName], SRD.Item_Code, SRD.Selling_Price, SRD.Quentity, SRD.Amount FROM [dbo].[Sales_Return_Details] AS SRD
LEFT JOIN [stock].[ItemDetails] AS ID ON SRD.Item_Code = ID.Doc_No
WHERE  SRD.Doc_No = @Search_Condition

END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Load_SRN_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Load_SRN_Header] 

@Search_Condition nvarchar(100)
AS
BEGIN

SELECT SRN.Doc_No, SRN.Related_Invoice,CD.[Name], SRN.Customer_Code, SRN.Date, SRN.Total_Amount, SRN.Remark FROM [dbo].[Sales_Return_Header] AS SRN
LEFT JOIN [customer].[Customer_Details] AS CD ON CD.[Doc_No] = SRN.Customer_Code
WHERE SRN.Doc_No LIKE '%'+@Search_Condition+'%' AND SRN.Status =0
ORDER BY SRN.System_Date_Time DESC

END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Save_Srn_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Save_Srn_Details]
@ID nvarchar(200), 
@Item_Code nvarchar(100),
@Selling_Price decimal(18,3),
@Quentity decimal(18,3),
@Amount decimal(18,3)


AS
BEGIN

INSERT INTO [dbo].[Sales_Return_Details_Temp]
(ID, Item_Code, Selling_Price, Quentity, Amount)
VALUES (@ID, @Item_Code, @Selling_Price, @Quentity, @Amount)

END

GO
/****** Object:  StoredProcedure [dbo].[SRN_Save_Srn_header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SRN_Save_Srn_header]
@ID   nvarchar(200),
@Invoice		NVARCHAR(100),
@Total_Amount DECIMAL(18,3), 
@Remark nvarchar(500),
@Customer_Code nvarchar(100),
@Date   DATE
AS
BEGIN
DECLARE				@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@Discount			decimal(18,3)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM [dbo].[Sales_Return_Header]
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'SalesReturn'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No

INSERT INTO [dbo].[Sales_Return_Header] (Doc_No,Related_Invoice,Total_Amount, Remark, Customer_Code, Date)
VALUES(@Doc_No,@Invoice,@Total_Amount,@Remark,@Customer_Code,@Date)

INSERT INTO [dbo].[Sales_Return_Details] (Doc_No, Item_Code, Selling_Price, Quentity, Amount, System_Date_TIme, Status)
SELECT @Doc_No,Item_Code, Selling_Price, Quentity, Amount,GETDATE(),0 FROM [dbo].[Sales_Return_Details_Temp]
WHERE ID = @ID
--Update stock


DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@SRN_Temp_Qty			DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @SRN_Temp_Qty= ISNULL(SUM(ISNULL([Quentity],0)),0) FROM [dbo].[Sales_Return_Details_Temp]
	WHERE Item_Code = @Item_Code AND ID = @ID

	SET @Updated_Qty =@Current_Balance + @SRN_Temp_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='SRN',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details




DELETE FROM [dbo].[Sales_Return_Details_Temp] WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[Stock_to_Pie]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Stock_to_Pie] 

AS
BEGIN
SELECT [Category],[Quentity] FROM [dbo].[InventoryDetails]
END


GO
/****** Object:  StoredProcedure [dbo].[Transaction_Clear]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_Clear]


AS
BEGIN
DELETE FROM [dbo].[Sales_Return_Header]
DELETE FROM [dbo].[Sales_Return_Details_Temp]
DELETE FROM [dbo].[Sales_Return_Details]
DELETE FROM [dbo].[Stock_Item_Details]
DELETE FROM [GRN].[GRN_Details]
DELETE FROM [GRN].[GRN_Details_Temp]
DELETE FROM [GRN].[GRN_Header]
DELETE FROM [Sales].[Cheque]
DELETE FROM [Sales].[Cheque_Tempory]
DELETE FROM [Sales].[Invoice_Details]
DELETE FROM [Sales].[Invoice_Details_temp]
DELETE FROM [Sales].[Invoice_Header]
DELETE FROM [Sales].[Mobile_Transaction]
DELETE FROM [Sales].[Tempory_Save_Mobile_Transaction]
DELETE FROM [stock].[Item_Current_Quentity]
DELETE FROM [stock].[ItemDetails]
DELETE FROM [Suppliers].[Supplier_Details]
DELETE FROM [transactions].[Cash_and_Cheque]
DELETE FROM [transactions].[Transactions]

END

GO
/****** Object:  StoredProcedure [dbo].[Update_Permission]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Permission] 
@Setting_Name NVARCHAR(100),
@Value NVARCHAR(100)


AS
BEGIN

UPDATE [dbo].[Permission_Settings] SET [Value] = @Value, [Last_Update_Time] = GETDATE() 
WHERE [Setting_Name] = @Setting_Name

END

GO
/****** Object:  StoredProcedure [dbo].[UsersDetails]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UsersDetails]

@UserName NVARCHAR(200),
@Password NVARCHAR(200)
AS
BEGIN
SELECT @UserName =  [UserName] , @Password =[Password] from [dbo].[Users]
END

GO
/****** Object:  StoredProcedure [Finance].[Bank_Account_Doc_No]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Bank_Account_Doc_No] 

AS
BEGIN						DECLARE			
							@Doc_No				nvarchar(100),
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Bank_Account]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'Banking'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'
END


GO
/****** Object:  StoredProcedure [Finance].[Cash_Transaction_Doc_No]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Cash_Transaction_Doc_No] 

AS

BEGIN						DECLARE			
							@Doc_No				nvarchar(100),
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Cash]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'CASH'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'
END


GO
/****** Object:  StoredProcedure [Finance].[Load_bank_acount_details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Load_bank_acount_details] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT  Doc_No,[Bank_Or_Act],[Account_No] FROM [Finance].[Bank_Account] WHERE Status =0
AND (Doc_No LIKE '%'+@Search_Condition+'%' OR [Bank_Or_Act] LIKE '%'+@Search_Condition+'%' OR  [Account_No] LIKE '%'+@Search_Condition+'%')
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Bank_Balance]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Finance].[Load_Bank_Balance]

AS
BEGIN
declare

@Bank_Balance			decimal(18,3),
@Bank_Credit			DECIMAL(18,3),
@Bank_Debit				DECIMAL(18,3),
@Invoice_CHQ			decimal(18,3),
@Grn_CHQ				decimal(18,3)

SELECT @Bank_Debit = ISNULL(SUM(ISNULL(Amount,0)),0) FROM [Finance].[Bank_Transactions]
WHERE Status =0 AND Type='Debit'
SELECT @Bank_Credit = ISNULL(SUM(ISNULL(Amount,0)),0) FROM [Finance].[Bank_Transactions]
WHERE Status =0 AND Type='Credit'

SELECT @Invoice_CHQ= ISNULL(SUM(ISNULL(Cheque_Payment,0)),0) FROM Sales.Invoice_Header WHERE Status=0
SELECT @Grn_CHQ= ISNULL(SUM(ISNULL(Cheque_Payment,0)),0) FROM GRN.GRN_Header WHERE Status=0

SET @Bank_Balance =(@Bank_Debit+@Invoice_CHQ)-(@Bank_Credit+@Grn_CHQ)
SELECT @Bank_Balance as 'Amount'
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Bank_Transaction_Doc_No]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Load_Bank_Transaction_Doc_No] 

AS
BEGIN
DECLARE			
							@Doc_No				nvarchar(100),
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Bank_Transactions]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'BankTransaction'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Banking_Transactions_To_Grid_View]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Load_Banking_Transactions_To_Grid_View] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT FBT.[Doc_No],FBA.Bank_Or_Act+' '+FBA.Account_No AS 'ACT & ACT.NO.',FBT.[Account],FBT.[Amount],FBT.[Type],FBT.[Date],FBT.[Note] 
FROM [Finance].[Bank_Transactions] AS FBT
LEFT JOIN [Finance].[Bank_Account] AS FBA ON FBA.Doc_No = FBT.[Account_Doc_No]
WHERE (FBT.Doc_No LIKE '%'+@Search_Condition+'%' OR FBA.Bank_Or_Act LIKE '%'+@Search_Condition+'%' OR FBT.[Account] LIKE '%'+@Search_Condition+'%' )
AND FBT.Status =0
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Cash_Balance]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Finance].[Load_Cash_Balance]

AS
BEGIN
declare

@Cash_Balance			decimal(18,3),
@Cash_Credit			DECIMAL(18,3),
@Cash_Debit				DECIMAL(18,3),
@Invoice_Cash			decimal(18,3),
@Grn_Cash				decimal(18,3)

SELECT @Cash_Debit = ISNULL(SUM(ISNULL(Amount,0)),0) FROM [Finance].[Cash]
WHERE Status =0 AND Type='Debit'
SELECT @Cash_Credit = ISNULL(SUM(ISNULL(Amount,0)),0) FROM [Finance].[Cash]
WHERE Status =0 AND Type='Credit'

SELECT @Invoice_Cash= ISNULL(SUM(ISNULL(Cash_Payment,0)),0) FROM Sales.Invoice_Header WHERE Status=0
SELECT @Grn_Cash= ISNULL(SUM(ISNULL(Cash_Payment,0)),0) FROM GRN.GRN_Header WHERE Status=0

SET @Cash_Balance =(@Cash_Debit+@Invoice_Cash)-(@Cash_Credit+@Grn_Cash)
SELECT @Cash_Balance as 'Amount'
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Cash_Transactions]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Finance].[Load_Cash_Transactions]

@Search_Condition NVARCHAR(200)

AS
BEGIN
SELECT Doc_No, Account_Name, Amount, Transaction_Date, Note, Type FROM Finance.Cash
WHERE Status =0 AND(Account_Name LIKE '%'+@Search_Condition+'%' OR Doc_No LIKE '%'+@Search_Condition+'%')
ORDER BY System_Date_Time desc 
END


GO
/****** Object:  StoredProcedure [Finance].[Load_Cheques_To_banking]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Finance].[Load_Cheques_To_banking]
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT FCQ.Doc_No AS 'Cheque From', FCQ.Cheque_No, FCQ.Amount, FCQ.Bank,FBT.Bank_Or_Act, FCQ.Note 
FROM [Sales].[Cheque] AS FCQ
LEFT JOIN [Finance].[Bank_Account] AS FBT ON FCQ.Bank=FBT.Doc_No WHERE FCQ.Status=0 AND (
FCQ.Doc_No LIKE '%'+@Search_Condition+'%' OR 
FCQ.Cheque_No LIKE '%'+@Search_Condition+'%' OR 
FCQ.Bank LIKE '%'+@Search_Condition+'%' OR 
FBT.Bank_Or_Act LIKE '%'+@Search_Condition+'%' OR
FCQ.Note LIKE '%'+@Search_Condition+'%')
END


GO
/****** Object:  StoredProcedure [Finance].[Save_Cash_transaction]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Finance].[Save_Cash_transaction]
@Save_Type int,
@Doc_No				nvarchar(100),
@Account_Name NVARCHAR(200),
@Amount DECIMAL(18,3),
@Transaction_Date DATE,
@Note NVARCHAR(200),
@Type NVARCHAR(200)
AS
BEGIN
	IF(@Save_Type=1)
		BEGIN
DECLARE
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Cash]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'CASH'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					--SELECT @Doc_No AS 'Doc_No'

					INSERT INTO [Finance].[Cash] (Doc_No, Account_Name, Amount, Transaction_Date, Note, Type)
					VALUES(@Doc_No, @Account_Name, @Amount, @Transaction_Date, @Note, @Type)
					END
					IF(@Save_Type=2)
						BEGIN
							UPDATE [Finance].[Cash] SET Status=1 WHERE Doc_No=@Doc_No
						END
END


GO
/****** Object:  StoredProcedure [Finance].[Save_Delete_Bank_Transaction]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Save_Delete_Bank_Transaction]
@Save_Type INT,
@Doc_No NVARCHAR(200),
@Account_Doc_No NVARCHAR(200),
@Account NVARCHAR(200),
@Amount DECIMAL(18,3),
@Date DATE,
@Type NVARCHAR(10),
@Note NVARCHAR(500)
AS
BEGIN
	IF(@Save_Type=1)
		BEGIN
							DECLARE
							--@Doc_No				nvarchar(100),
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Bank_Transactions]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'BankTransaction'
							SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
							
			INSERT INTO [Finance].[Bank_Transactions] (Doc_No, Account_Doc_No, Account, Amount, Date, Type, Note)
			VALUES(@Doc_No,@Account_Doc_No,@Account,@Amount,@Date,@Type,@Note)
		END
	ELSE IF(@Save_Type=2)
		BEGIN
			UPDATE [Finance].[Bank_Transactions] SET Status =1 WHERE [Doc_No] =@Doc_No 
		END
END


GO
/****** Object:  StoredProcedure [Finance].[Save_Update_Delete_Bank_Account_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Save_Update_Delete_Bank_Account_Details]
@Save_Type	INT,
@Doc_No NVARCHAR(100),
@Bank_Or_Act NVARCHAR(100),
@Account_No NVARCHAR(100),
@Account_Type NVARCHAR(100)

AS
BEGIN
			IF(@Save_Type=1)
				BEGIN
							DECLARE
							@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Finance].[Bank_Account]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'Banking'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No

					INSERT INTO [Finance].[Bank_Account] (Doc_No, Bank_Or_Act, Account_No, Account_Type) VALUES (@Doc_No,@Bank_Or_Act,@Account_No,@Account_Type)
				END

			ELSE IF(@Save_Type=2)
				BEGIN
					UPDATE [Finance].[Bank_Account] SET Status=1 WHERE Doc_No =@Doc_No
				END
END


GO
/****** Object:  StoredProcedure [Finance].[Select_Bank_Account_Grid]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Finance].[Select_Bank_Account_Grid] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
		SELECT Doc_No, Bank_Or_Act, Account_No, Account_Type FROM [Finance].[Bank_Account] WHERE Status=0 AND (Doc_No LIKE '%'+@Search_Condition+'%' OR Bank_Or_Act  LIKE '%'+@Search_Condition+'%' OR  Account_No  LIKE '%'+@Search_Condition+'%' OR  Account_Type  LIKE '%'+@Search_Condition+'%') ORDER BY System_Date_time DESC
END


GO
/****** Object:  StoredProcedure [GRN].[Delete_Grn]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Delete_Grn]
	@Doc_No NVARCHAR(200)
AS
BEGIN


DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@GRN_Temp_Qty			DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @GRN_Temp_Qty= ISNULL(SUM(ISNULL([Quantity],0)),0) FROM [GRN].[GRN_Details]
	WHERE Item_Code = @Item_Code AND doc_no = @Doc_No

	SET @Updated_Qty =@Current_Balance - @GRN_Temp_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='GRN',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details








	UPDATE [GRN].[GRN_Details] SET Status=1 WHERE Doc_No =@Doc_No
	UPDATE [GRN].[GRN_Header] SET Status=1 WHERE Doc_No =@Doc_No
	UPDATE [Sales].[Cheque] SET Status=1 WHERE Doc_No =@Doc_No
END


GO
/****** Object:  StoredProcedure [GRN].[Item_Stock_Balance]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Item_Stock_Balance] 
@Item_Code NVARCHAR(200)
AS
BEGIN
 DECLARE @Invoice_Qty DECIMAL(18,3),
		 @Initial_Qty DECIMAL(18,3),
		 @GRN_Qty	  DECIMAL(18,3),
		 @Balance	  DECIMAL(18,3)

		 SELECT  @Initial_Qty = ISNULL(SUM(ISNULL([Quentity],0)),0) 
		 FROM  [stock].[Item_Stock_Details] WHERE [Transaction_Doc_No] ='Initial_Stock' AND [Item_Code] =@Item_Code AND Status=0
		 
		 SELECT  @Invoice_Qty = ISNULL(SUM(ISNULL([Quentity],0)),0) 
		 FROM  [stock].[Item_Stock_Details] WHERE [Transaction_Doc_No] ='Invoice' AND [Item_Code] =@Item_Code AND Status=0
		 
		 SELECT  @GRN_Qty = ISNULL(SUM(ISNULL([Quentity],0)),0) 
		 FROM  [stock].[Item_Stock_Details] WHERE [Transaction_Doc_No] ='GRN' AND [Item_Code] =@Item_Code AND Status=0

		 SET @Balance =(@Initial_Qty+@GRN_Qty)-@Invoice_Qty
		 SELECT @Balance AS 'Balance'
END


GO
/****** Object:  StoredProcedure [GRN].[Load_Grn_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Load_Grn_Details] 
@Search_Condition nvarchar(200)

AS
BEGIN
SELECT Doc_No, Item_Code, Cost, Selling_Price, Quantity, Amount FROM  [GRN].[GRN_Details] WHERE Status=0 
AND Doc_No LIKE '%'+@Search_Condition+'%'
END


GO
/****** Object:  StoredProcedure [GRN].[Load_Grn_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Load_Grn_Header]
@Search_Condition nvarchar(200)
AS
BEGIN

SELECT Doc_No, Supplier_Code, Doc_Date, Total_Amount, Cash_Payment, Cheque_Payment FROM [GRN].[GRN_Header] WHERE Status=0
AND Doc_No LIKE '%'+@Search_Condition+'%'
END


GO
/****** Object:  StoredProcedure [GRN].[Save_GRN_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [GRN].[Save_GRN_Details] 
@ID NVARCHAR(MAX),
@Doc_Date DATE,
@Sup_Code NVARCHAR(200),
@Total_Amount DECIMAL(18,3),
@Cash_Payment DECIMAL(18,3),
@Cheque_Payment DECIMAL(18,3)
AS
BEGIN
DECLARE				@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM [GRN].[GRN_Header]
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'GoodReceive'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No

	INSERT INTO [GRN].[GRN_Header]
	(Doc_No, Supplier_Code, Doc_Date, Total_Amount, Cash_Payment,  Cheque_Payment)
	VALUES
	(@Doc_No,@Sup_Code,@Doc_Date,@Total_Amount,@Cash_Payment,@Cheque_Payment)

	INSERT INTO [GRN].[GRN_Details]
	SELECT @Doc_No,Item_Code, Cost,0, Quantity, Amount,0
	FROM [GRN].[GRN_Details_Temp] WHERE ID=@ID

	INSERT INTO [Sales].[Cheque] 
	SELECT @Doc_No, Cheque_No, Amount, Bank, Note,GETDATE(),0 
	FROM [Sales].[Cheque_Tempory]  WHERE ID=@ID

	----------------Stock Update

	
DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@GRN_Temp_Qty			DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @GRN_Temp_Qty= ISNULL(SUM(ISNULL([Quantity],0)),0) FROM [GRN].[GRN_Details_Temp]
	WHERE Item_Code = @Item_Code AND ID = @ID

	SET @Updated_Qty =@Current_Balance + @GRN_Temp_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='GRN',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details


	DELETE FROM [Sales].[Cheque_Tempory] WHERE ID=@ID
	DELETE FROM [GRN].[GRN_Details_Temp] WHERE ID=@ID
END


GO
/****** Object:  StoredProcedure [GRN].[Save_GRN_Details_Temp]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Save_GRN_Details_Temp]
@ID NVARCHAR(200),
@Item_Code NVARCHAR(200), 
@Selling_Price DECIMAL(18,3),
@Quantity DECIMAL(18,3),
@Amount DECIMAL(18,3)
AS
BEGIN
INSERT INTO  [GRN].[GRN_Details_Temp] (ID, Item_Code, Cost, Quantity,  Amount)
VALUES(@ID,@Item_Code,@Selling_Price,@Quantity,@Amount)
END


GO
/****** Object:  StoredProcedure [GRN].[Total_Stock]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [GRN].[Total_Stock] 

AS
BEGIN

DECLARE @Invoiced_Amount DECIMAL(18,3),
		@GRN_Amount		 DECIMAL(18,3),
		@Initial_Cost	 DECIMAL(18,3),
		@Total			 DECIMAL(18,3)

SELECT @Initial_Cost= ISNULL(SUM(ISNULL((ISNULL(ID.Cost,0) * ISNULL(ISD.Quentity,0)),0)),0) 
FROM [stock].[ItemDetails] AS ID
LEFT JOIN [stock].[Item_Stock_Details] AS ISD ON ID.Doc_No=ISD.Item_Code
WHERE ISD.[Transaction_Doc_No] ='Initial_Stock' AND ISD.Status=0

SELECT @Invoiced_Amount=ISNULL(SUM(ISNULL((ISNULL(ID.Cost,0) * ISNULL(ISD.Quentity,0)),0)),0) 
FROM [stock].[ItemDetails] AS ID
LEFT JOIN [stock].[Item_Stock_Details] AS ISD ON ID.Doc_No=ISD.Item_Code
WHERE ISD.[Transaction_Doc_No] ='Invoice' AND ISD.Status=0

SELECT @GRN_Amount= ISNULL(SUM(ISNULL((ISNULL(ID.Cost,0) * ISNULL(ISD.Quentity,0)),0)),0) 
FROM [stock].[ItemDetails] AS ID
LEFT JOIN [stock].[Item_Stock_Details] AS ISD ON ID.Doc_No=ISD.Item_Code
WHERE ISD.[Transaction_Doc_No] ='GRN' AND ISD.Status=0

SET @Total=((@Initial_Cost+@GRN_Amount)-@Invoiced_Amount)
SELECT @Total AS 'Amount'
END


GO
/****** Object:  StoredProcedure [RetriveData].[ComboBoxTemplate_Name]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [RetriveData].[ComboBoxTemplate_Name] 
AS
BEGIN
select TemplateName from [dbo].[AutoServiceDetails] where Status = 0
END


GO
/****** Object:  StoredProcedure [RetriveData].[CS_Name_ID]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [RetriveData].[CS_Name_ID] 
@SearchCondition NVARCHAR(200)
AS
BEGIN
SELECT [Name],[CSID] FROM [dbo].[Customer] WHERE [Status] = 0 AND ([Name] LIKE '%'+@SearchCondition+'%' or [CSID] LIKE '%'+@SearchCondition+'%')
END

GO
/****** Object:  StoredProcedure [RetriveData].[Customer_name_for_Cash_in]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [RetriveData].[Customer_name_for_Cash_in]

AS
BEGIN
SELECT [Name] FROM [customer].[Customer_Details]
END


GO
/****** Object:  StoredProcedure [RetriveData].[Data_to_check_List_Grid_Controller]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [RetriveData].[Data_to_check_List_Grid_Controller] 
	-- Add the parameters for the stored procedure here
@SearchConditon NVARCHAR(100)
AS
BEGIN
SELECT TOP 1000 [VehicalNo]
      ,[CustomerName]
      ,[Telephone]
      ,[Address]
      ,[OilBrian]
      ,[Serial]
      ,[Date]
      ,[KM]
      ,[EngineOil]
      ,[GOil]
      ,[DOil]
      ,[ATF]
      ,[OilFilter]
      ,[Greasing]
      ,[Cemical]
      ,[PenetrolOil]
      ,[AutoCreame]
      ,[HighPresure]
      ,[Other]
      ,[BodyWash]
      ,[CompleteWash]
      ,[UnderWash]
      ,[InteriorCleaning]
      ,[OtherService]
  FROM [POS].[dbo].[AutoServiceDetailsCheckList] WHERE Status=0 AND (VehicalNo like '%'+@SearchConditon+'%' OR Telephone LIKE  '%'+@SearchConditon+'%' OR [CustomerName] LIKE  '%'+@SearchConditon+'%') 
END


GO
/****** Object:  StoredProcedure [RetriveData].[Load_Item_Category_comboBox]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [RetriveData].[Load_Item_Category_comboBox] 

AS
BEGIN
SELECT [Category] FROM [stock].[ItemHeader]
END


GO
/****** Object:  StoredProcedure [RetriveData].[Service_Template_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [RetriveData].[Service_Template_Data] 
	-- Add the parameters for the stored procedure here
@Template_Name NVARCHAR(50)
AS
BEGIN
--select * from [dbo].[AutoServiceDetails] 

SELECT EngineOil, GOil, DOil, ATF, OilFilter, Greasing, Cemical, PenetrolOil, AutoCreame, HighPresure, Other, BodyWash,CompleteWash,CompleteWashPrice, UnderWash, InteriorWash, InteriorCleaning, OtherServiceCharge,EngineOilPrice, GOilPrice, DOilPrice, ATFPrice, OilFilterPrice, GreasingPrice, CemicalPrice, PenetrolOilPrice, AutoCreamePrice, HighPresurePrice, OtherPrice, BodyWashPrice, UnderWashPrice, InteriorWashPrice, InteriorCleaningPrice, OtherServiceChargePrice 
FROM [dbo].[AutoServiceDetails] WHERE @Template_Name = [TemplateName] AND Status = 0


END


GO
/****** Object:  StoredProcedure [RetriveData].[Supplier_Name_for_Cash_Tran]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [RetriveData].[Supplier_Name_for_Cash_Tran]

AS
BEGIN
SELECT CompanyName FROM [Suppliers].[SaupliersDetails]
UNION ALL
SELECT Name FROM [Suppliers].[SaupliersDetails]
END


GO
/****** Object:  StoredProcedure [RetriveData].[Template_Test]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [RetriveData].[Template_Test]
@Template_Name NVARCHAR(50)
AS
BEGIN
SELECT TOP 1 EngineOil FROM  [dbo].[AutoServiceDetails] WHERE @Template_Name = [TemplateName]
END


GO
/****** Object:  StoredProcedure [Sales].[Add_Cash_Sales]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Add_Cash_Sales] 
	-- Add the parameters for the stored procedure here
	@Sales_ID NVARCHAR(200),
	@Item_Name NVARCHAR(200),
	@Item_Cost DECIMAL(18,3),
	@Quentity  DECIMAL(18,3),
	@Discount  DECIMAL(18,3),
	@Customer_Paid DECIMAL(18,3),
	@Warrenty_Period NVARCHAR(200),
	@Date NVARCHAR(200),
	@Customer_Name	NVARCHAR(200),
	@Nic_Number		NVARCHAR(200),
	@Mobile_Number	NVARCHAR(200),
	@Customer_Address	NVARCHAR(200)

AS
BEGIN
INSERT INTO [Sales].[Sales] ([Sales_ID],Item_Name, Item_Cost, Quantity, Discount, Customer_paid,  Warrenty, Date, CSName,Nic_Number, Mobile, Address)
VALUES (@Sales_ID,@Item_Name,@Item_Cost,@Quentity,@Discount,@Customer_Paid,@Warrenty_Period,@Date,@Customer_Name,@Nic_Number,@Mobile_Number,@Customer_Address)

END


GO
/****** Object:  StoredProcedure [Sales].[AddCashSales]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwna Bannaka
-- Create date: 2016/03/01
-- Description:	AddCashSales
-- =============================================
CREATE PROCEDURE [Sales].[AddCashSales] 
	-- Add the parameters for the stored procedure here
			@itemname nvarchar(200),
			@Cost decimal(18,3),
			@Quantity decimal(18,3),
			@Discount decimal(18,3),
			@cspaid decimal(18,3),
			@nic nvarchar(200),
			@warrenty nvarchar(200),
			@date nvarchar(200),
			@csname nvarchar(200),
			@mobile nvarchar(200),
			@address nvarchar(200) 
AS
begin 
insert into [Sales].[Sales] ([Item_Name],[Item_Cost],[Quantity],[Discount],[Customer_paid],[Nic_Number],[Warrenty],[Date],[CSName],[Mobile],[Address]) 
VALUES (@itemname,@Cost,@Quantity,@Discount,@cspaid,@nic,@warrenty,@date,@csname,@mobile,@address)
end



GO
/****** Object:  StoredProcedure [Sales].[AddCashSales_n]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwna Bannaka
-- Create date: 2016/03/01
-- Description:	AddCashSales
-- =============================================
create PROCEDURE [Sales].[AddCashSales_n] 
	-- Add the parameters for the stored procedure here
			@itemname nvarchar(200),
			@Cost decimal(18,3),
			@Quantity decimal(18,3),
			@Discount decimal(18,3),
			@cspaid decimal(18,3),
			@nic nvarchar(200),
			@warrenty nvarchar(200),
			@date nvarchar(200),
			@csname nvarchar(200),
			@mobile nvarchar(200),
			@address nvarchar(200) 
AS
begin 
insert into [Sales].[Sales] ([Item_Name],[Item_Cost],[Quantity],[Discount],[Customer_paid],[Nic_Number],[Warrenty],[Date],[CSName],[Mobile],[Address]) 
VALUES (@itemname,@Cost,@Quantity,@Discount,@cspaid,@nic,@warrenty,@date,@csname,@mobile,@address)
end



GO
/****** Object:  StoredProcedure [Sales].[Customer_Details_Load_Into_Data_Grid_View]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 2017-04-17
-- Description:	This Sp to invoice's cs load
-- =============================================
CREATE PROCEDURE [Sales].[Customer_Details_Load_Into_Data_Grid_View]
@SearchCondition NVARCHAR(200)
AS
BEGIN
SELECT [Doc_No] AS 'Customer Code',[Name],[Address],[Nic],[Email],[Mobile_1] AS 'Mobile',Customer_Since AS 'Since' FROM [customer].[Customer_Details]
WHERE Status=0  AND
(Doc_No LIKE '%'+@SearchCondition+'%' OR
Company_Name LIKE '%'+@SearchCondition+'%' OR
Name LIKE '%'+@SearchCondition+'%' OR
Address LIKE '%'+@SearchCondition+'%' OR
Nic LIKE '%'+@SearchCondition+'%' OR
Mobile_2 LIKE '%'+@SearchCondition+'%' OR
Mobile_1 LIKE '%'+@SearchCondition+'%' OR
Email LIKE '%'+@SearchCondition+'%' OR
Website LIKE '%'+@SearchCondition+'%' OR
Customer_Since LIKE '%'+@SearchCondition+'%') ORDER BY System_Date_Time DESC
END


GO
/****** Object:  StoredProcedure [Sales].[Delete_Invoice]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Delete_Invoice]
@Doc_No	NVARCHAR(200)
AS
BEGIN

--Roling Back Invoice
DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@Delete_Qty				DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @Delete_Qty= ISNULL(SUM(ISNULL([Quantity],0)),0) FROM [Sales].[Invoice_Details]
	WHERE Item_Code = @Item_Code AND Doc_No = @Doc_No

	SET @Updated_Qty =@Current_Balance + @Delete_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='INVDELETE',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details

	UPDATE [Sales].[Invoice_Header] SET Status=1 WHERE Doc_No=@Doc_No
	UPDATE [Sales].[Invoice_Details] SET Status=1 WHERE Doc_No=@Doc_No
	UPDATE [Sales].[Cheque] SET Status=1 WHERE Doc_No=@Doc_No

END


GO
/****** Object:  StoredProcedure [Sales].[Delete_Transactions_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Delete_Transactions_Details] 
@ID NVARCHAR(200)
AS
BEGIN
UPDATE [Sales].[Sales] SET [Status]=1 WHERE [Sales_ID]=@ID
END


GO
/****** Object:  StoredProcedure [Sales].[Invoice_Document_ID_Check]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila
-- Create date: 2017/02/01
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Invoice_Document_ID_Check] 
AS
BEGIN
	SET NOCOUNT ON;
						--DECLARE
						--@Location_Code NVARCHAR(50)
						--SET @Location_Code ='EZCMP17/EZLOC-2'
			

		DECLARE		@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No				nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)

					SET  @LocationPrefix ='ID'

					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(ID,CHARINDEX('-',ID)+1,LEN(ID)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM [Sales].[Invoice_Document_ID]
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Invoice_ID'

					SET @Doc_No = @LocationPrefix + '/' + @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No	
					
					END



GO
/****** Object:  StoredProcedure [Sales].[Invoice_Header_print]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Invoice_Header_print]
@Doc_No nvarchar(200)

AS
BEGIN
select Customer_Code,Doc_No from Sales.Invoice_Header
END


GO
/****** Object:  StoredProcedure [Sales].[Invoice_Print]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Invoice_Print] 
@Doc_No nvarchar(200)
AS
BEGIN
	select  Doc_No , Item_Code from [Sales].[Invoice_Details] where Doc_No=@Doc_No
	select Customer_Code from Sales.Invoice_Header where Doc_No=@Doc_No

END


GO
/****** Object:  StoredProcedure [Sales].[Invoice_Print_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Invoice_Print_Details] 
@Doc_No nvarchar(200)
AS
BEGIN
			DECLARE @Cash_Amount				DECIMAL(18,1),
					@Cheque_Amount				DECIMAL(18,1),
					@Credit_Amount				DECIMAL(18,1),
					@Total_Amount				DECIMAL(18,1)
			 
DECLARE  @Temp_Table TABLE (Item_Name NVARCHAR(200),Price DECIMAL(18,1),Quantity DECIMAL(18,1),Amount DECIMAL(18,1))

			INSERT INTO @Temp_Table
			SELECT ITM.ItemName,ID.Selling_Price,ID.Quantity,ID.Amount FROM [Sales].[Invoice_Details] AS ID
			LEFT JOIN [stock].[ItemDetails] AS ITM ON ITM.Doc_No=ID.Item_Code  WHERE ID.Doc_No=@Doc_No

			INSERT INTO @Temp_Table
			SELECT 'Total Amount ',null,null,ISNULL(SUM(ISNULL(Total_Amount,0)),0)
			FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No

			INSERT INTO @Temp_Table
			SELECT 'Customer Paid ',null,null,ISNULL(SUM(ISNULL(Cash_Payment,0)),0)+ISNULL(SUM(ISNULL(Cheque_Payment,0)),0)
			FROM [Sales].[Invoice_Header]  WHERE Doc_No=@Doc_No




			
SELECT @Cash_Amount = ISNULL(SUM(ISNULL(Cash_Payment,0)),0) FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No
SELECT @Cheque_Amount =ISNULL(SUM(ISNULL(Cheque_Payment,0)),0) FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No
SELECT @Total_Amount =ISNULL(SUM(ISNULL(Total_Amount,0)),0) FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No

			 IF((@Cash_Amount+@Cheque_Amount) >=@Total_Amount)
					BEGIN
					INSERT INTO @Temp_Table
						SELECT 'Balance ',null,null,(ISNULL(SUM(ISNULL(Cash_Payment,0)),0)+ISNULL(SUM(ISNULL(Cheque_Payment,0)),0)-ISNULL(SUM(ISNULL(Total_Amount,0)),0))
						FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No
					END
			ELSE IF((@Cash_Amount+@Cheque_Amount) < @Total_Amount)
			BEGIN
				INSERT INTO @Temp_Table
				SELECT 'Credit Balance ',null,null,ISNULL(SUM(ISNULL(Total_Amount,0)),0)-(ISNULL(SUM(ISNULL(Cash_Payment,0)),0)+ISNULL(SUM(ISNULL(Cheque_Payment,0)),0))
				FROM [Sales].[Invoice_Header] WHERE Doc_No=@Doc_No
			END



			SELECT Item_Name AS 'Item Name',Price AS 'Price',Quantity AS 'Quantity',Amount AS 'Amount' FROM @Temp_Table

	

END

--exec [Sales].[Invoice_Print_Details] 'INV-3'

GO
/****** Object:  StoredProcedure [Sales].[Load_Invoice]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Load_Invoice] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT IND.[Doc_No],IND.[Item_Code],SID.ItemName,IND.[Selling_Price],IND.[Quantity],IND.[Amount]
FROM [Sales].[Invoice_Details] AS IND
LEFT JOIN [stock].[ItemDetails] AS SID ON IND.Item_Code = SID.Doc_No
LEFT JOIN [Sales].[Invoice_Header] AS IH ON IH.Doc_No=IND.Doc_No
WHERE IND.Status =0
AND (IND.[Doc_No] = @Search_Condition )
ORDER BY IH.System_Date_Time DESC
END


--select * from [Sales].[Invoice_Details]
--select * from [Sales].[Invoice_Header]

--delete from [Sales].[Invoice_Details]
--delete from [Sales].[Invoice_Header]

GO
/****** Object:  StoredProcedure [Sales].[Load_Invoice_Header]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Sales].[Load_Invoice_Header] 
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT IH.[Doc_No], IH.[Customer_Code],CD.Name,IH.[Doc_Date],IH.[Total_Amount],IH.[Cash_Payment],IH.[Cheque_Payment], 
ISNULL(IH.Total_Amount,0)-(ISNULL(IH.Cash_Payment,0)+ISNULL(IH.Cheque_Payment,0)) AS 'Balance'
FROM [Sales].[Invoice_Header] AS IH
LEFT JOIN customer.Customer_Details AS CD ON IH.Customer_Code = CD.Doc_No
WHERE IH.Status=0 AND (IH.[Doc_No] LIKE '%'+@Search_Condition+'%' )
ORDER BY IH.System_Date_Time DESC
END


GO
/****** Object:  StoredProcedure [Sales].[RetriveSalesDataTogridview]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[RetriveSalesDataTogridview] 
@Search_condition NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
SELECT SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, CSNote, TotalCost, CSPaid, CreditAmount, Installment, Period, NextDate, MPaymentNumber, MobileAmount, MServiceProvider, CashFromHand, BalancetoCS, BankAccount, ChequeNo 
FROM [Sales].[Sales_ALL]
WHERE status = 0 AND (Type LIKE '%'+@Search_condition+'%' OR MPaymentNumber LIKE '%'+@Search_condition+'%'  )


END


GO
/****** Object:  StoredProcedure [Sales].[Sales_Save_f]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Sales_Save_f] 
@SalesID NVARCHAR(200),
@Type NVARCHAR(200),
@ItemCost DECIMAL(18,3),
@ItemQuentity DECIMAL(18,3),
@Discount DECIMAL(18,3),
@Amount DECIMAL(18,3),
@WarrentyEnd NVARCHAR(200),
@Date NVARCHAR(200),
@ItemCode NVARCHAR(200),
@CSID NVARCHAR(200),

--Header Data

@TotaQty DECIMAL(18,3),
@TotalAmount DECIMAL(18,3),
@DiscountTotal DECIMAL(18,3),
@MobileNo NVARCHAR(200),
@MobileAmount DECIMAL(18,3),
@MSeriveProvider NVARCHAR(200),
@CashFromHand DECIMAL(18,3),
@CSPaid DECIMAL(18,3),
@CreditAmount DECIMAL(18,3),
@Installment DECIMAL(18,3),
@Period DECIMAL(18,3),
@NetPaymentDate NVARCHAR(200),
@ChequeNO NVARCHAR(200),
@CheqAmount DECIMAL(18,3),
@BankName DECIMAL(18,3),
@CheqCashFromHand DECIMAL(18,3),
@SaveStatus int




AS
BEGIN
IF(@SaveStatus = 1)
BEGIN
INSERT INTO [Sales].[Sales_Details] (SalesID, Type, ItemCost, ItemQuentity, Discount, Amount, WarrentyEnd, Date, ItemCode, CSID)
VALUES(@SalesID,@Type,@ItemCost,@ItemQuentity,@Discount,@Amount,@WarrentyEnd,@Date,@ItemCode,@CSID)
END
IF(@SaveStatus = 2)
BEGIN
INSERT INTO [Sales].[Sales_Header] (SalesID, CSID, TotaQty, TotalAmount, Discount, Type, MobileNo, MobileAmount, MSeriveProvider, CashFromHand, CSPaid, CreditAmount, Installment, Period, NetPaymentDate, ChequeNO, CheqAmount, BankName, CheqCashFromHand)
VALUES(@SalesID,@CSID,@TotaQty,@TotalAmount,@DiscountTotal,@Type,@MobileNo,@MobileAmount,@MSeriveProvider,@CashFromHand,@CSPaid,@CreditAmount,@Installment,@Period,@NetPaymentDate,@ChequeNO,@CheqAmount,@BankName,@CheqCashFromHand)
END
END


GO
/****** Object:  StoredProcedure [Sales].[Save_All_Sales]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Save_All_Sales]
       @Type NVARCHAR(200)
      ,@ItemCode NVARCHAR(200)
      ,@ItemCost DECIMAL(18,3)
      ,@ItemQuentity DECIMAL(18,3)
      ,@Discount DECIMAL(18,3)
      ,@WarrentyEnd NVARCHAR(200)
      ,@CSID NVARCHAR(200)
      ,@TotalCost DECIMAL(18,3)
      ,@CSPaid DECIMAL(18,3)
      ,@CreditAmount DECIMAL(18,3)
      ,@Installment DECIMAL(18,3)
      ,@Period DECIMAL(18,3)
      ,@NextDate NVARCHAR(200)
      ,@MPaymentNumber NVARCHAR(200)
      ,@MobileAmount NVARCHAR(200)
      ,@MServiceProvider NVARCHAR(200)
      ,@CashFromHand DECIMAL(18,3)
      ,@BalancetoCS DECIMAL(18,3)
	  ,@BankAccount NVARCHAR(200)
	  ,@ChequeNo NVARCHAR(200)
	 
AS
BEGIN
DECLARE @SalesID NVARCHAR(200)
IF(@Type='Cash')
BEGIN
SET @SalesID='SALES001'
INSERT INTO [Sales].[Sales_ALL] (SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, TotalCost, CSPaid,CreditAmount, Installment, Period, NextDate, MPaymentNumber, MobileAmount, MServiceProvider, CashFromHand, BalancetoCS)
VALUES(@SalesID,@Type,@ItemCode,@ItemCost,@ItemQuentity,@Discount,@WarrentyEnd,@CSID,@TotalCost,@CSPaid,@CreditAmount,@Installment,@Period,@NextDate,@MPaymentNumber,@MobileAmount,@MServiceProvider,@CashFromHand,@BalancetoCS)
END
IF(@Type='Credit')
BEGIN
SET @SalesID='CREDIT001'
INSERT INTO [Sales].[Sales_ALL] (SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, TotalCost, CSPaid,CreditAmount, Installment, Period, NextDate, MPaymentNumber, MobileAmount, MServiceProvider, CashFromHand, BalancetoCS)
VALUES(@SalesID,@Type,@ItemCode,@ItemCost,@ItemQuentity,@Discount,@WarrentyEnd,@CSID,@TotalCost,@CSPaid,@CreditAmount,@Installment,@Period,@NextDate,@MPaymentNumber,@MobileAmount,@MServiceProvider,@CashFromHand,@BalancetoCS)
END
IF (@Type='Cheq')
BEGIN
SET @SalesID='CHEQT001'
INSERT INTO [Sales].[Sales_ALL] (SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, TotalCost, CSPaid,CreditAmount, Installment, Period, NextDate, MPaymentNumber, MobileAmount, MServiceProvider, CashFromHand, BalancetoCS,BankAccount,ChequeNo)
VALUES(@SalesID,@Type,@ItemCode,@ItemCost,@ItemQuentity,@Discount,@WarrentyEnd,@CSID,@TotalCost,@CSPaid,@CreditAmount,@Installment,@Period,@NextDate,@MPaymentNumber,@MobileAmount,@MServiceProvider,@CashFromHand,@BalancetoCS,@BankAccount,@ChequeNo)
END
IF (@Type='Mobile')
BEGIN
SET @SalesID='MobileT001'
INSERT INTO [Sales].[Sales_ALL] (SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, TotalCost, CSPaid,CreditAmount, Installment, Period, NextDate, MPaymentNumber, MobileAmount, MServiceProvider, CashFromHand, BalancetoCS)
VALUES(@SalesID,@Type,@ItemCode,@ItemCost,@ItemQuentity,@Discount,@WarrentyEnd,@CSID,@TotalCost,@CSPaid,@CreditAmount,@Installment,@Period,@NextDate,@MPaymentNumber,@MobileAmount,@MServiceProvider,@CashFromHand,@BalancetoCS)
END
END

GO
/****** Object:  StoredProcedure [Sales].[Save_Invoice_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date:2017-04-03
-- Description: Save Invoice Sales
-- ==========================================
CREATE PROCEDURE [Sales].[Save_Invoice_Details]
@ID NVARCHAR(MAX),
@Doc_Date DATE,
@CS_Code NVARCHAR(200),
@Total_Amount DECIMAL(18,3),
@Cash_Payment DECIMAL(18,3),
@Cheque_Payment DECIMAL(18,3),
@Remark NVARCHAR(MAX)
AS
BEGIN
DECLARE				@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@Discount			decimal(18,3)


					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM [Sales].[Invoice_Header]
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'invoice'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No

	SELECT @Discount= ISNULL(SUM(ISNULL(Discount,0)),0) FROM [Sales].[Invoice_Details_Temp] WHERE ID=@ID
	INSERT INTO [Sales].[Invoice_Header]
	(Doc_No, Customer_Code, Doc_Date, Total_Amount, Cash_Payment,  Cheque_Payment,Total_Discount)
	VALUES
	(@Doc_No,@CS_Code,@Doc_Date,@Total_Amount,@Cash_Payment,@Cheque_Payment,@Discount)

	INSERT INTO [Sales].[Invoice_Details]
	SELECT @Doc_No, Item_Code, Selling_Price, Quantity, Amount,Discount,0,GETDATE()
	FROM [Sales].[Invoice_Details_Temp] WHERE ID=@ID

	INSERT INTO [Sales].[Cheque] 
	SELECT @Doc_No, Cheque_No, Amount, Bank, Note,GETDATE(),0 
	FROM [Sales].[Cheque_Tempory]  WHERE ID=@ID

	--------------------Stock Update--------------
	
DECLARE @Item_Code				NVARCHAR(200),
		@Current_Balance		DECIMAL(18,3),
		@INV_Temp_Qty			DECIMAL(18,3),
		@Updated_Qty			DECIMAL(18,3)
			
	DECLARE Stock_Details
	CURSOR FOR
	SELECT Item_Code,Current_Qty FROM [dbo].[Stock_Item_Details]

	OPEN Stock_Details
	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	WHILE @@FETCH_STATUS =0
	BEGIN
	
	SELECT @INV_Temp_Qty= ISNULL(SUM(ISNULL([Quantity],0)),0) FROM [Sales].[Invoice_Details_temp]
	WHERE Item_Code = @Item_Code AND ID = @ID

	SET @Updated_Qty =@Current_Balance- @INV_Temp_Qty

	UPDATE [dbo].[Stock_Item_Details] SET Current_Qty = @Updated_Qty,Last_Update ='INVOICE',Updated_Date_Time = getdate()
	WHERE Item_Code = @Item_Code 

	FETCH NEXT FROM Stock_Details
	INTO @Item_Code,@Current_Balance
	END
	CLOSE Stock_Details
	DEALLOCATE Stock_Details


	DELETE FROM [Sales].[Invoice_Details_Temp] WHERE ID=@ID
	DELETE FROM [Sales].[Cheque_Tempory] WHERE ID=@ID

END



GO
/****** Object:  StoredProcedure [Sales].[Save_Invoice_Details_Temp]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 2017-03-19
-- Description:	Save Temp invoice details
-- =============================================
CREATE PROCEDURE [Sales].[Save_Invoice_Details_Temp]
@ID NVARCHAR(200),
@Item_Code NVARCHAR(200), 
@Selling_Price DECIMAL(18,3),
@Quantity DECIMAL(18,3),
@Amount DECIMAL(18,3),
@Discount DECIMAL(18,3)
AS
BEGIN
INSERT INTO [Sales].[Invoice_Details_Temp] (ID, Item_Code, Selling_Price, Quantity,  Amount,Discount)
VALUES(@ID,@Item_Code,@Selling_Price,@Quantity,@Amount,@Discount)
END


GO
/****** Object:  StoredProcedure [Sales].[Save_POS_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Save_POS_Data] 
@SalesID NVARCHAR(200),
@Type NVARCHAR(200),
@ItemCode NVARCHAR(200),
@ItemCost decimal(18, 3),
@ItemQuentity decimal(18, 3),
@Discount decimal(18,3),
@WarrentyEnd NVARCHAR(200),
@CSID NVARCHAR(200),
@TransactionDate NVARCHAR(200)
AS
BEGIN
INSERT INTO [Sales].[Sales_POS] (SalesID, Type, ItemCode, ItemCost, ItemQuentity, Discount, WarrentyEnd, CSID, TransactionDate)
VALUES (@SalesID, @Type, @ItemCode, @ItemCost, @ItemQuentity, @Discount, @WarrentyEnd, @CSID, @TransactionDate)
END


GO
/****** Object:  StoredProcedure [Sales].[Temp_testing_Sp_Save_Sales]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Sales].[Temp_testing_Sp_Save_Sales]
@SalesID NVARCHAR(200),
@Type NVARCHAR(200),
@ItemCost DECIMAL(18,3),
@ItemQuentity DECIMAL(18,3),
@Discount DECIMAL(18,3),
@Amount DECIMAL(18,3),
@WarrentyEnd NVARCHAR(200),
@Date NVARCHAR(200),
@ItemCode NVARCHAR(200),
@CSID NVARCHAR(200)

AS
BEGIN

INSERT INTO [Sales].[Sales_Details] (SalesID, Type, ItemCost, ItemQuentity, Discount, Amount, WarrentyEnd, Date, ItemCode, CSID)
VALUES(@SalesID,@Type,@ItemCost,@ItemQuentity,@Discount,@Amount,@WarrentyEnd,@Date,@ItemCode,@CSID)
END


GO
/****** Object:  StoredProcedure [Sales].[Tempory_Save_Cheque_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 2017/26/01
-- Description: Tempory save Cheque data
-- =============================================
CREATE PROCEDURE [Sales].[Tempory_Save_Cheque_Data] 
@ID NVARCHAR(MAX),
@Cheque_No NVARCHAR(200),
@Amount DECIMAL(18,3),
@Bank NVARCHAR(200),
@Note NVARCHAR(200)
AS
BEGIN
INSERT INTO [Sales].[Cheque_Tempory] (ID, Cheque_No, Amount, Bank,Note)
VALUES (@ID,@Cheque_No,@Amount,@Bank,@Note)
END



GO
/****** Object:  StoredProcedure [Sales].[Tempory_Save_Mobile_Data]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 2017/26/01
-- Description: Tempory save Cheque data
-- =============================================
CREATE PROCEDURE [Sales].[Tempory_Save_Mobile_Data] 
@ID NVARCHAR(200),
@Mobile_No NVARCHAR(200),
@Amount DECIMAL(18,3),
@Bank NVARCHAR(200),
@Note NVARCHAR(200)
AS
BEGIN
INSERT INTO [Sales].[Tempory_Save_Mobile_Transaction] (ID, Mobile_No, Amount, Bank,Note)
VALUES (@ID,@Mobile_No,@Amount,@Bank,@Note)
END


GO
/****** Object:  StoredProcedure [stock].[Add_Category]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [stock].[Add_Category] 
	-- Add the parameters for the stored procedure here
@AddCategory NVARCHAR(200),
@CompanyCode NVARCHAR(200)
AS
BEGIN
	INSERT INTO [stock].[ItemHeader] (Category,CompanyCode)
	VALUES(@AddCategory,@CompanyCode)
END


GO
/****** Object:  StoredProcedure [stock].[Add_Item]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [stock].[Add_Item]
@ItemName NVARCHAR(200), 
@Serial NVARCHAR(200),
@Date NVARCHAR(200),
@Cost DECIMAL(18,3),
@Selling_Price DECIMAL(18,3),
@Note NVARCHAR(MAX)
AS
BEGIN
DECLARE		@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM stock.ItemDetails
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Items'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No


					INSERT INTO [stock].[ItemDetails] (Doc_No, ItemName, Serial,Cost,Selling_Price , Expire_Date,Note)
					VALUES (@Doc_No,@ItemName,@Serial,@Cost,@Selling_Price,@Date,@Note)

					INSERT INTO [dbo].[Stock_Item_Details] ([Item_Code],[Current_Qty],[Last_Update],[Cost],[Selling_Price],[Note],[Location_Code],[Updated_Date_Time])
					VALUES(@Doc_No,0,'ITEMSAVE',@Cost,@Selling_Price,'','',GETDATE())

END


GO
/****** Object:  StoredProcedure [stock].[Delete_Items]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [stock].[Delete_Items]
@Doc_No NVARCHAR(200)
AS
BEGIN
UPDATE [stock].[ItemDetails] SET Status = 1 WHERE [Doc_No] = @Doc_No

END


GO
/****** Object:  StoredProcedure [stock].[Get_List_of_Stock_details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [stock].[Get_List_of_Stock_details]
@Search_Condition	NVARCHAR(200)
AS
BEGIN
SELECT ID.ItemName AS 'Item_Name',SD.[Item_Code],SD.[Current_Qty] AS 'Quentity',SD.[Cost],SD.[Selling_Price],SD.Updated_Date_Time AS 'Last Update'
FROM [dbo].[Stock_Item_Details] AS SD
LEFT JOIN [stock].[ItemDetails] AS ID ON ID.Doc_No = SD.Item_Code
WHERE SD.Status = 0 AND (ID.ItemName LIKE '%'+@Search_Condition+'%' OR SD.[Item_Code] LIKE '%'+@Search_Condition+'%' ) 


 --DECLARE @Item_Details TABLE (Item_Code NVARCHAR(200),Quentity DECIMAL(18,3))
 -- DECLARE
	--@Item_Code nvarchar(100),
	--@Transaction_Doc_No nvarchar(100),
	--@Quentity decimal(18, 3),
	--@Cost decimal(18, 3),
	--@Current_Qty decimal(18, 3)

 -- DECLARE Item_List CURSOR FOR
 -- SELECT DISTINCT Item_Code FROM [stock].[Item_Stock_Details]
 -- WHERE Status =0
 -- OPEN Item_List

 -- FETCH NEXT FROM Item_List
 -- INTO @Item_Code

 -- WHILE @@FETCH_STATUS = 0
 -- BEGIN
	--SET @Current_Qty = 0

	--DECLARE Transaction_List CURSOR FOR
	--SELECT [Transaction_Doc_No],[Quentity],[Cost] FROM [stock].[Item_Stock_Details] 
	--WHERE Item_Code = @Item_Code AND [Status] = 0
	--ORDER BY [System_Date_Time]
	
	--OPEN Transaction_List

	--FETCH NEXT FROM Transaction_List
	--INTO @Transaction_Doc_No, @Quentity, @Cost

	--WHILE @@FETCH_STATUS = 0
	--BEGIN
	--	IF @Transaction_Doc_No LIKE 'Initial_Stock'
	--		SET @Quentity = @Quentity * 1
	--	ELSE IF @Transaction_Doc_No LIKE 'GRN'
	--		SET @Quentity = @Quentity * 1
	--	ELSE IF @Transaction_Doc_No LIKE 'Invoice'
	--		SET @Quentity = @Quentity * -1

	--	SET @Current_Qty = @Current_Qty + @Quentity

	--	IF @Transaction_Doc_No LIKE 'Initial_Stock'
	--		SET @Current_Qty = @Quentity

	--	FETCH NEXT FROM Transaction_List
	--	INTO @Transaction_Doc_No, @Quentity, @Cost
	--END
	--CLOSE Transaction_List
	--DEALLOCATE Transaction_List
	--INSERT INTO @Item_Details (Item_Code,Quentity) VALUES( @Item_Code, @Current_Qty)
	----SELECT @Item_Code, @Current_Qty

	--FETCH NEXT FROM Item_List
	--INTO @Item_Code
 -- END
 -- CLOSE Item_List
 -- DEALLOCATE Item_List
 -- SELECT SID.ItemName,ID.Item_Code,ID.Quentity,SID.Cost AS 'Unit Cost',(ID.Quentity * SID.Cost) AS 'Total Item Stock' FROM @Item_Details AS ID
 -- LEFT JOIN [stock].[ItemDetails] AS SID ON SID.Doc_No = ID.Item_Code
 -- WHERE (SID.ItemName LIKE '%'+@Search_Condition+'%' OR ID.Item_Code LIKE '%'+@Search_Condition+'%')
END


GO
/****** Object:  StoredProcedure [stock].[Load_Item_Code]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	Load Item Doc No
-- =============================================
CREATE PROCEDURE [stock].[Load_Item_Code] 

AS
BEGIN
DECLARE		@Auto_Code_Prefix   nvarchar(50),
					@Auto_Code_Length	int,
					@Doc_No	    nvarchar(100),
					@Prefix				nvarchar(100),
					@LocationPrefix		nvarchar(100)
					SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
					FROM stock.ItemDetails
					SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
					FROM [dbo].[Auto_Codes_Prefix]
					WHERE [Prefix_Name] = 'Items'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'

END


GO
/****** Object:  StoredProcedure [stock].[Retrive_CS_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
Create PROCEDURE [stock].[Retrive_CS_Details] 
--@Item_Code NVARCHAR(200)
@CSID NVARCHAR(200)
AS
BEGIN
--SELECT TOP 1 [ItemName],[Cost],[Discount] FROM [stock].[ItemDetails] WHERE Status =0 AND [ItemID] = @Item_Code
SELECT TOP 1 Name, MobileNo, Address, Email ,Note FROM  [dbo].[Customer] WHERE Status = 0  AND  CSID = @CSID 
END


GO
/****** Object:  StoredProcedure [stock].[Search_Items]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [stock].[Search_Items] 
	-- Add the parameters for the stored procedure here
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT ID.[Doc_No] AS 'Item Code',ID.[ItemName] AS 'Item Name',ID.[Cost],ID.[Serial],ID.[Selling_Price],
ID.[Note],ID.[Expire_Date],sd.[Current_Qty] AS 'Available Stock'
FROM [stock].[ItemDetails] AS ID
LEFT JOIN [dbo].[Stock_Item_Details] AS SD ON SD.Item_Code = ID.Doc_No
WHERE ID.Status=0 AND(
ID.[Doc_No] LIKE @Search_Condition+'%' OR 
ID.[ItemName] LIKE @Search_Condition+'%' 
) ORDER BY ID.SystemDate DESC
END

GO
/****** Object:  StoredProcedure [stock].[Update_Items]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	update item details
-- =============================================
CREATE PROCEDURE [stock].[Update_Items]
@Doc_No   NVARCHAR(200), 
@ItemName NVARCHAR(200), 
@Serial NVARCHAR(200),
@Date NVARCHAR(200),
@Cost DECIMAL(18,3),
@Selling_Price DECIMAL(18,3),
@Note NVARCHAR(MAX)
AS
BEGIN
UPDATE [stock].[ItemDetails] SET ItemName = @ItemName,  Serial = @Serial, Cost = @Cost, Selling_Price = @Selling_Price, Expire_Date = @Date,
Note =@Note WHERE [Doc_No] = @Doc_No AND Status=0
END

GO
/****** Object:  StoredProcedure [Suppliers].[Load_Supplier_Codes]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Suppliers].[Load_Supplier_Codes] 

AS
BEGIN
			DECLARE			@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100),
							@Doc_No			nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Suppliers].[Supplier_Details]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'Suppliers'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No AS 'Doc_No'
END


GO
/****** Object:  StoredProcedure [Suppliers].[Load_Suppliers_For_GRN]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Suppliers].[Load_Suppliers_For_GRN] 
@SearchCondition NVARCHAR(200)
AS
BEGIN
SELECT [Doc_No],[Name],[Company_Name],[Address],[Email],[Note]
FROM [Suppliers].[Supplier_Details] WHERE Status=0 AND 
([Doc_No] LIKE '%'+@SearchCondition+'%' OR
[Name] LIKE '%'+@SearchCondition+'%' OR
[Company_Name] LIKE '%'+@SearchCondition+'%' OR
[Address] LIKE '%'+@SearchCondition+'%' OR
[Email] LIKE '%'+@SearchCondition+'%' OR
[Note] LIKE '%'+@SearchCondition+'%'
)
END


GO
/****** Object:  StoredProcedure [Suppliers].[Load_Suppliers_Grid]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Suppliers].[Load_Suppliers_Grid]	-- Add the parameters for the stored procedure here
@Search_Condition NVARCHAR(200)
AS
BEGIN
SELECT Doc_No,Name, Company_Name, Address, Nic, Mobile_2, Mobile_1, Email, Website, Other_Contact_Details, Supplier_Since, Note FROM
[Suppliers].[Supplier_Details]
WHERE Status=0 AND
(Doc_No LIKE '%'+@Search_Condition+'%' OR
Company_Name LIKE '%'+@Search_Condition+'%' OR
Name LIKE '%'+@Search_Condition+'%' OR
Address LIKE '%'+@Search_Condition+'%' OR
Nic LIKE '%'+@Search_Condition+'%' OR
Mobile_2 LIKE '%'+@Search_Condition+'%' OR
Mobile_1 LIKE '%'+@Search_Condition+'%' OR
Email LIKE '%'+@Search_Condition+'%' OR
Website LIKE '%'+@Search_Condition+'%' OR
Supplier_Since LIKE '%'+@Search_Condition+'%') ORDER BY System_Date_Time DESC
END


GO
/****** Object:  StoredProcedure [Suppliers].[Save_Suppliers]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Suppliers].[Save_Suppliers]

@SuppliersID NVARCHAR(200),
@CompanyName NVARCHAR(200),
@Name NVARCHAR(200),
@Date NVARCHAR(200),
@MobileNumber NVARCHAR(200),
@TelephoneNumber NVARCHAR(200),
@Address NVARCHAR(200),
@EmailID NVARCHAR(200),
@OtherContactDetails NVARCHAR(200),
@Note NVARCHAR(200),
@CompanyCode NVARCHAR(200)	
AS
BEGIN
INSERT INTO [Suppliers].[SaupliersDetails] (SuppliersID, CompanyName, Name, Date, MobileNumber, TelephoneNumber, Address, EmailID, OtherContactDetails, Note, CompanyCode) 
VALUES (@SuppliersID,@CompanyName,@Name,@Date,@MobileNumber,@TelephoneNumber,@Address,@EmailID,@OtherContactDetails,@Note,@CompanyCode)
END


GO
/****** Object:  StoredProcedure [Suppliers].[Save_Update_Delete_Supplier_Details]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amila Nuwan Bannaka
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Suppliers].[Save_Update_Delete_Supplier_Details] 
@Save_Type				INT,
@Doc_No					NVARCHAR(200),
@Name					NVARCHAR(200),
@Company_Name			NVARCHAR(200),
@Address				NVARCHAR(200),
@Nic					NVARCHAR(200),
@Mobile_2				NVARCHAR(200),
@Mobile_1				NVARCHAR(200),
@Email					NVARCHAR(200),
@Website				NVARCHAR(200),
@Other_Contact_Details  NVARCHAR(200),
@Supplier_Since			date,
@Note					NVARCHAR(200)
AS
BEGIN
IF(@Save_Type=3)
	BEGIN
			DECLARE			@Auto_Code_Prefix   nvarchar(50),
							@Auto_Code_Length	int,
							@Prefix				nvarchar(100),
							@LocationPrefix		nvarchar(100)
							SELECT @Doc_No = COALESCE(CAST(MAX((CAST (SUBSTRING(Doc_No,CHARINDEX('-',Doc_No)+1,LEN(Doc_No)) AS INT)) + 1 ) AS varchar(100)),'1') 
							FROM [Suppliers].[Supplier_Details]
							SELECT @Auto_Code_Prefix = Prefix, @Auto_Code_Length = Code_Length
							FROM [dbo].[Auto_Codes_Prefix]
							WHERE [Prefix_Name] = 'Suppliers'

					SET @Doc_No = @Auto_Code_Prefix +'-'+ @Doc_No
					SELECT @Doc_No
	INSERT INTO [Suppliers].[Supplier_Details]
	( Doc_No,Name, Company_Name, Address, Nic, Mobile_2, Mobile_1, Email, Website, Other_Contact_Details, Supplier_Since, Note)
	VALUES
	(@Doc_No,@Name,@Company_Name,@Address,@Nic,@Mobile_2,@Mobile_1,@Email, @Website,@Other_Contact_Details,@Supplier_Since,@Note)
	END
ELSE IF(@Save_Type=1)
	BEGIN
	UPDATE [Suppliers].[Supplier_Details] SET Doc_No = @Doc_No,Name=@Name, Company_Name=@Company_Name, Address=@Address,
	Nic=@Nic, Mobile_2=@Mobile_2, Mobile_1=@Mobile_1, Email=@Email, Website=@Website, Other_Contact_Details=@Other_Contact_Details, Supplier_Since=@Supplier_Since, Note=@Note
	WHERE Doc_No=@Doc_No
	END
ELSE IF (@Save_Type=2)
	BEGIN
	UPDATE [Suppliers].[Supplier_Details] SET Status=1 WHERE Doc_No=@Doc_No
	END
END



GO
/****** Object:  StoredProcedure [Suppliers].[SearchSupplierDetails]    Script Date: 2017-11-15 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nuwan
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Suppliers].[SearchSupplierDetails] 
@SearchCondition NVARCHAR(200)
AS
BEGIN
SELECT SuppliersID, CompanyName, Name, Date, MobileNumber, TelephoneNumber, Address, EmailID, OtherContactDetails,Note 
FROM [Suppliers].[SaupliersDetails]
WHERE Status = 0 AND ([CompanyName] LIKE '%'+@SearchCondition+'%' OR [Name]  LIKE '%'+@SearchCondition+'%' OR [MobileNumber] LIKE '%'+@SearchCondition+'%')
END


GO
USE [master]
GO
ALTER DATABASE [POS] SET  READ_WRITE 
GO
