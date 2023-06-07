USE [master]
GO
/****** Object:  Database [BizzExpense]    Script Date: 6/6/2023 9:27:17 PM ******/
CREATE DATABASE [BizzExpense]
GO
ALTER DATABASE [BizzExpense] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BizzExpense].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BizzExpense] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BizzExpense] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BizzExpense] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BizzExpense] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BizzExpense] SET ARITHABORT OFF 
GO
ALTER DATABASE [BizzExpense] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BizzExpense] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BizzExpense] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BizzExpense] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BizzExpense] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BizzExpense] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BizzExpense] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BizzExpense] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BizzExpense] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BizzExpense] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BizzExpense] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BizzExpense] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BizzExpense] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BizzExpense] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BizzExpense] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BizzExpense] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BizzExpense] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BizzExpense] SET RECOVERY FULL 
GO
ALTER DATABASE [BizzExpense] SET  MULTI_USER 
GO
ALTER DATABASE [BizzExpense] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BizzExpense] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BizzExpense] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BizzExpense] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BizzExpense] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BizzExpense] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BizzExpense', N'ON'
GO
ALTER DATABASE [BizzExpense] SET QUERY_STORE = ON
GO
ALTER DATABASE [BizzExpense] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BizzExpense]
GO
/****** Object:  Table [dbo].[ApprovalStatus]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalStatus](
	[ApprovalStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseId] [int] NULL,
	[StatusId] [int] NULL,
	[Comments] [nvarchar](255) NULL,
	[ApproverId] [int] NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApprovalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[ExpenseSubTypeId] [int] NULL,
	[ExpenseAmount] [decimal](10, 2) NULL,
	[SubmittedByUserId] [int] NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseSubTypesRef]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseSubTypesRef](
	[ExpenseSubTypeRefId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[ExpenseSubTypeDescription] [nvarchar](255) NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseSubTypeRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseTypesRef]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseTypesRef](
	[ExpenseTypeRefId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeDescription] [nvarchar](255) NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseTypeRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogIn]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIn](
	[LogInId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[FirebaseId] [nvarchar](255) NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesRef]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesRef](
	[RoleRefId] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescription] [nvarchar](255) NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRef]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRef](
	[StatusRefId] [int] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [nvarchar](255) NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusRefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[EmailId] [nvarchar](255) NULL,
	[ManagerId] [int] NULL,
	[IsManager] [bit] NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 6/6/2023 9:27:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[CreateTS] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdateTS] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApprovalStatus] ON 
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 19, 2, N'vitae dolor. Donec fringilla. Donec feugiat metus', 44, CAST(N'2022-09-18T04:53:59.0000000' AS DateTime2), 8, CAST(N'2024-05-07T11:45:17.0000000' AS DateTime2), 8)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 73, 3, N'et arcu imperdiet ullamcorper.', 48, CAST(N'2024-05-22T16:18:56.0000000' AS DateTime2), 55, CAST(N'2022-09-27T19:07:06.0000000' AS DateTime2), 55)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 4, 4, N'diam eu dolor egestas rhoncus. Proin', 49, CAST(N'2023-08-10T19:22:38.0000000' AS DateTime2), 19, CAST(N'2023-04-04T07:37:01.0000000' AS DateTime2), 19)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 98, 1, N'Donec egestas. Aliquam nec enim. Nunc ut erat.', 41, CAST(N'2022-09-02T16:38:43.0000000' AS DateTime2), 38, CAST(N'2024-03-09T16:04:47.0000000' AS DateTime2), 38)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 87, 2, N'ultrices iaculis odio. Nam interdum enim', 45, CAST(N'2022-12-02T09:31:20.0000000' AS DateTime2), 71, CAST(N'2022-06-23T21:51:14.0000000' AS DateTime2), 71)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 54, 3, N'Vivamus nisi. Mauris nulla. Integer urna. Vivamus', 42, CAST(N'2024-05-08T09:36:45.0000000' AS DateTime2), 58, CAST(N'2022-09-19T03:51:18.0000000' AS DateTime2), 58)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 11, 3, N'Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,', 50, CAST(N'2023-04-27T14:39:28.0000000' AS DateTime2), 27, CAST(N'2022-11-29T04:45:17.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 40, 4, N'orci lobortis augue scelerisque mollis.', 41, CAST(N'2023-12-23T16:32:09.0000000' AS DateTime2), 71, CAST(N'2022-08-21T18:38:45.0000000' AS DateTime2), 71)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 99, 2, N'Maecenas mi felis, adipiscing fringilla, porttitor', 43, CAST(N'2022-08-26T21:31:25.0000000' AS DateTime2), 86, CAST(N'2022-09-16T12:18:22.0000000' AS DateTime2), 86)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 62, 4, N'magnis dis parturient montes, nascetur ridiculus', 41, CAST(N'2022-09-04T23:41:23.0000000' AS DateTime2), 25, CAST(N'2023-12-06T01:50:17.0000000' AS DateTime2), 25)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 25, 4, N'eros. Proin ultrices. Duis volutpat nunc', 46, CAST(N'2022-08-21T11:54:33.0000000' AS DateTime2), 52, CAST(N'2023-02-09T13:05:39.0000000' AS DateTime2), 52)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 74, 4, N'mauris, aliquam eu, accumsan sed, facilisis vitae, orci.', 47, CAST(N'2022-06-05T11:48:44.0000000' AS DateTime2), 37, CAST(N'2022-09-16T19:51:24.0000000' AS DateTime2), 37)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 3, 2, N'Morbi sit amet massa. Quisque porttitor eros nec', 41, CAST(N'2023-06-12T20:44:52.0000000' AS DateTime2), 65, CAST(N'2024-02-03T21:40:21.0000000' AS DateTime2), 65)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 34, 3, N'purus sapien, gravida non, sollicitudin a, malesuada id, erat.', 44, CAST(N'2023-02-07T09:27:35.0000000' AS DateTime2), 92, CAST(N'2024-01-02T12:07:36.0000000' AS DateTime2), 92)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 41, 3, N'enim nec tempus scelerisque, lorem ipsum', 40, CAST(N'2024-04-17T18:06:10.0000000' AS DateTime2), 22, CAST(N'2023-10-31T00:51:32.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 27, 2, N'in consequat enim diam', 47, CAST(N'2023-12-15T03:50:22.0000000' AS DateTime2), 44, CAST(N'2023-03-14T08:55:29.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 35, 2, N'nec tellus. Nunc lectus pede,', 48, CAST(N'2023-05-30T13:20:01.0000000' AS DateTime2), 69, CAST(N'2023-05-25T20:47:33.0000000' AS DateTime2), 69)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 67, 4, N'blandit mattis. Cras eget nisi', 42, CAST(N'2023-06-16T06:05:11.0000000' AS DateTime2), 11, CAST(N'2023-03-01T06:04:36.0000000' AS DateTime2), 11)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 29, 1, N'et', 48, CAST(N'2023-03-03T10:33:27.0000000' AS DateTime2), 93, CAST(N'2022-12-22T16:26:43.0000000' AS DateTime2), 93)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 84, 1, N'ullamcorper. Duis cursus, diam at pretium aliquet, metus urna', 47, CAST(N'2023-02-25T04:30:02.0000000' AS DateTime2), 35, CAST(N'2023-07-25T02:35:14.0000000' AS DateTime2), 35)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 59, 2, N'turpis vitae purus gravida sagittis. Duis gravida. Praesent eu', 46, CAST(N'2023-12-08T05:46:50.0000000' AS DateTime2), 46, CAST(N'2024-05-16T13:45:49.0000000' AS DateTime2), 46)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 62, 2, N'aliquet lobortis, nisi', 45, CAST(N'2022-12-31T22:31:54.0000000' AS DateTime2), 57, CAST(N'2022-12-15T02:49:44.0000000' AS DateTime2), 57)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 57, 4, N'tellus non magna.', 46, CAST(N'2023-02-09T23:15:04.0000000' AS DateTime2), 68, CAST(N'2023-06-17T11:19:30.0000000' AS DateTime2), 68)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 81, 3, N'mollis non, cursus non, egestas a, dui.', 40, CAST(N'2022-06-04T16:58:11.0000000' AS DateTime2), 55, CAST(N'2023-12-27T05:28:19.0000000' AS DateTime2), 55)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 42, 2, N'amet nulla. Donec', 41, CAST(N'2022-12-18T13:47:59.0000000' AS DateTime2), 78, CAST(N'2024-05-28T21:52:09.0000000' AS DateTime2), 78)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 41, 2, N'malesuada augue ut', 47, CAST(N'2022-09-27T02:04:18.0000000' AS DateTime2), 96, CAST(N'2023-02-19T20:56:41.0000000' AS DateTime2), 96)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, 12, 1, N'Nunc pulvinar arcu', 42, CAST(N'2023-04-05T13:31:49.0000000' AS DateTime2), 99, CAST(N'2023-05-23T03:38:19.0000000' AS DateTime2), 99)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 64, 2, N'Aenean eget magna. Suspendisse tristique neque venenatis', 43, CAST(N'2023-02-27T05:59:38.0000000' AS DateTime2), 17, CAST(N'2023-09-17T11:02:16.0000000' AS DateTime2), 17)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 71, 3, N'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,', 40, CAST(N'2022-10-14T09:35:12.0000000' AS DateTime2), 22, CAST(N'2022-09-21T19:45:27.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 40, 4, N'lectus quis massa. Mauris vestibulum, neque sed dictum', 43, CAST(N'2024-01-04T01:46:58.0000000' AS DateTime2), 96, CAST(N'2022-09-22T09:44:35.0000000' AS DateTime2), 96)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 51, 1, N'elementum purus, accumsan', 44, CAST(N'2022-10-24T19:38:16.0000000' AS DateTime2), 59, CAST(N'2024-05-01T20:05:41.0000000' AS DateTime2), 59)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 39, 2, N'amet, dapibus', 40, CAST(N'2023-12-14T09:22:01.0000000' AS DateTime2), 16, CAST(N'2023-05-01T18:05:29.0000000' AS DateTime2), 16)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 42, 3, N'elit erat vitae risus. Duis a mi fringilla mi', 42, CAST(N'2023-09-17T10:46:39.0000000' AS DateTime2), 29, CAST(N'2023-05-19T23:45:35.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 29, 3, N'et magnis dis parturient montes, nascetur ridiculus', 42, CAST(N'2022-12-03T07:22:45.0000000' AS DateTime2), 16, CAST(N'2023-02-23T09:33:23.0000000' AS DateTime2), 16)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 48, 2, N'fringilla euismod enim. Etiam', 43, CAST(N'2023-06-09T03:40:51.0000000' AS DateTime2), 18, CAST(N'2024-02-25T18:25:59.0000000' AS DateTime2), 18)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 86, 4, N'at, velit. Cras', 46, CAST(N'2023-08-05T10:16:40.0000000' AS DateTime2), 71, CAST(N'2022-06-14T04:03:38.0000000' AS DateTime2), 71)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 93, 2, N'a ultricies adipiscing,', 47, CAST(N'2022-09-30T07:42:11.0000000' AS DateTime2), 56, CAST(N'2023-04-25T01:26:16.0000000' AS DateTime2), 56)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 82, 3, N'sit amet ante. Vivamus non', 48, CAST(N'2024-01-14T00:02:46.0000000' AS DateTime2), 96, CAST(N'2022-09-02T21:42:39.0000000' AS DateTime2), 96)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 33, 4, N'neque non quam. Pellentesque habitant morbi tristique senectus et', 41, CAST(N'2023-01-27T15:57:00.0000000' AS DateTime2), 12, CAST(N'2022-12-19T18:32:45.0000000' AS DateTime2), 12)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 99, 1, N'ac mattis velit', 48, CAST(N'2022-07-04T03:05:25.0000000' AS DateTime2), 88, CAST(N'2024-01-21T03:51:06.0000000' AS DateTime2), 88)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 75, 2, N'nibh lacinia orci, consectetuer euismod est arcu ac', 44, CAST(N'2024-02-06T16:51:50.0000000' AS DateTime2), 94, CAST(N'2023-06-12T11:26:06.0000000' AS DateTime2), 94)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 46, 2, N'est. Mauris eu', 45, CAST(N'2024-04-24T10:50:26.0000000' AS DateTime2), 95, CAST(N'2022-10-03T19:17:54.0000000' AS DateTime2), 95)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 16, 2, N'sem magna nec', 47, CAST(N'2023-09-23T23:02:53.0000000' AS DateTime2), 55, CAST(N'2022-07-11T02:04:56.0000000' AS DateTime2), 55)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 23, 2, N'ornare, facilisis', 40, CAST(N'2023-09-16T15:19:22.0000000' AS DateTime2), 35, CAST(N'2022-07-02T14:42:20.0000000' AS DateTime2), 35)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 64, 2, N'ultrices, mauris ipsum porta elit,', 46, CAST(N'2022-10-08T16:51:37.0000000' AS DateTime2), 5, CAST(N'2024-04-12T20:58:29.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 98, 2, N'Fusce mi lorem, vehicula et,', 43, CAST(N'2024-03-23T13:13:08.0000000' AS DateTime2), 17, CAST(N'2023-04-08T20:50:08.0000000' AS DateTime2), 17)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 54, 4, N'nunc id enim. Curabitur massa. Vestibulum accumsan neque et', 44, CAST(N'2023-10-11T17:32:08.0000000' AS DateTime2), 69, CAST(N'2023-01-19T10:34:56.0000000' AS DateTime2), 69)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 85, 4, N'erat, in consectetuer ipsum nunc id', 48, CAST(N'2024-03-11T16:02:49.0000000' AS DateTime2), 86, CAST(N'2022-12-17T08:06:34.0000000' AS DateTime2), 86)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 71, 3, N'tincidunt adipiscing. Mauris', 47, CAST(N'2023-09-02T10:46:53.0000000' AS DateTime2), 80, CAST(N'2023-03-29T22:40:00.0000000' AS DateTime2), 80)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 7, 2, N'per conubia nostra, per inceptos hymenaeos. Mauris ut quam', 48, CAST(N'2022-11-03T11:09:38.0000000' AS DateTime2), 27, CAST(N'2023-06-02T21:17:21.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 63, 3, N'sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed', 43, CAST(N'2023-10-18T20:55:40.0000000' AS DateTime2), 48, CAST(N'2023-03-27T04:56:17.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 11, 2, N'lacus pede', 41, CAST(N'2023-04-13T03:18:30.0000000' AS DateTime2), 73, CAST(N'2022-12-17T14:21:11.0000000' AS DateTime2), 73)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 18, 3, N'sagittis semper. Nam', 46, CAST(N'2023-12-09T17:36:06.0000000' AS DateTime2), 48, CAST(N'2022-12-25T18:18:16.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 8, 3, N'Nam interdum enim non nisi. Aenean', 47, CAST(N'2022-11-14T19:15:31.0000000' AS DateTime2), 38, CAST(N'2022-07-15T02:31:46.0000000' AS DateTime2), 38)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 40, 4, N'Mauris blandit enim consequat purus. Maecenas libero est, congue', 49, CAST(N'2022-11-30T20:00:18.0000000' AS DateTime2), 2, CAST(N'2024-03-19T00:29:19.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 26, 4, N'libero. Donec consectetuer mauris id', 43, CAST(N'2024-05-20T16:12:32.0000000' AS DateTime2), 48, CAST(N'2022-07-02T11:29:24.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 94, 1, N'augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan', 43, CAST(N'2023-07-23T14:00:27.0000000' AS DateTime2), 50, CAST(N'2024-04-18T16:52:29.0000000' AS DateTime2), 50)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 100, 2, N'lorem, auctor quis,', 46, CAST(N'2022-12-10T03:40:53.0000000' AS DateTime2), 49, CAST(N'2023-06-06T22:22:06.0000000' AS DateTime2), 49)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 5, 2, N'dui. Cum', 48, CAST(N'2023-09-30T05:05:00.0000000' AS DateTime2), 76, CAST(N'2023-03-15T20:33:30.0000000' AS DateTime2), 76)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 54, 3, N'ante ipsum primis in faucibus orci', 47, CAST(N'2023-05-29T14:59:35.0000000' AS DateTime2), 65, CAST(N'2022-11-07T21:14:46.0000000' AS DateTime2), 65)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 38, 2, N'sem molestie sodales. Mauris blandit enim', 50, CAST(N'2022-07-17T15:05:14.0000000' AS DateTime2), 93, CAST(N'2023-10-17T02:36:22.0000000' AS DateTime2), 93)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 16, 2, N'augue scelerisque mollis. Phasellus libero mauris,', 42, CAST(N'2022-09-27T09:49:33.0000000' AS DateTime2), 57, CAST(N'2023-03-18T08:53:25.0000000' AS DateTime2), 57)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 31, 3, N'consequat enim diam vel arcu. Curabitur ut', 41, CAST(N'2023-07-29T00:16:34.0000000' AS DateTime2), 26, CAST(N'2023-11-21T19:54:54.0000000' AS DateTime2), 26)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 9, 2, N'In at pede. Cras vulputate', 41, CAST(N'2024-05-11T00:30:22.0000000' AS DateTime2), 88, CAST(N'2022-10-10T14:32:19.0000000' AS DateTime2), 88)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 51, 3, N'neque. Morbi quis urna. Nunc quis arcu vel quam', 48, CAST(N'2023-02-11T00:18:23.0000000' AS DateTime2), 41, CAST(N'2022-10-29T02:46:21.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 47, 3, N'lectus pede et risus. Quisque', 42, CAST(N'2022-09-02T01:38:12.0000000' AS DateTime2), 57, CAST(N'2023-06-13T11:07:51.0000000' AS DateTime2), 57)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, 76, 3, N'egestas hendrerit neque. In ornare sagittis', 50, CAST(N'2023-01-30T19:22:30.0000000' AS DateTime2), 10, CAST(N'2023-04-23T13:34:30.0000000' AS DateTime2), 10)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 29, 4, N'aptent taciti sociosqu ad litora torquent per conubia', 49, CAST(N'2023-12-17T01:44:09.0000000' AS DateTime2), 49, CAST(N'2024-03-02T04:58:01.0000000' AS DateTime2), 49)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 64, 3, N'et magnis dis parturient montes, nascetur', 42, CAST(N'2023-10-08T02:19:15.0000000' AS DateTime2), 50, CAST(N'2024-05-23T10:34:07.0000000' AS DateTime2), 50)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 36, 4, N'Fusce fermentum fermentum arcu. Vestibulum ante', 50, CAST(N'2023-03-11T12:02:29.0000000' AS DateTime2), 76, CAST(N'2023-05-31T00:48:13.0000000' AS DateTime2), 76)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 34, 2, N'tempus eu, ligula. Aenean euismod mauris eu', 47, CAST(N'2024-03-20T14:43:02.0000000' AS DateTime2), 11, CAST(N'2023-10-20T19:49:59.0000000' AS DateTime2), 11)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 77, 2, N'Approved', 50, CAST(N'2022-11-02T20:45:15.0000000' AS DateTime2), 97, CAST(N'2023-06-06T04:01:18.3066667' AS DateTime2), 50)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 45, 4, N'feugiat non, lobortis quis, pede. Suspendisse dui. Fusce', 42, CAST(N'2022-10-05T18:32:14.0000000' AS DateTime2), 96, CAST(N'2023-09-12T03:11:38.0000000' AS DateTime2), 96)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 90, 3, N'libero nec ligula consectetuer', 49, CAST(N'2022-09-12T00:30:18.0000000' AS DateTime2), 42, CAST(N'2023-07-21T03:25:30.0000000' AS DateTime2), 42)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 68, 4, N'eu, ultrices sit amet, risus. Donec nibh', 43, CAST(N'2022-12-02T12:13:18.0000000' AS DateTime2), 39, CAST(N'2022-08-20T17:06:56.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 73, 2, N'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed', 47, CAST(N'2022-10-19T01:33:33.0000000' AS DateTime2), 41, CAST(N'2022-07-27T21:39:45.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 77, 2, N'Approved', 50, CAST(N'2024-03-15T16:40:02.0000000' AS DateTime2), 69, CAST(N'2023-06-06T04:01:18.3066667' AS DateTime2), 50)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 87, 1, N'nec, diam. Duis mi enim, condimentum eget, volutpat ornare,', 47, CAST(N'2023-08-26T10:10:38.0000000' AS DateTime2), 88, CAST(N'2023-10-01T19:54:42.0000000' AS DateTime2), 88)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 83, 2, N'a odio semper cursus. Integer mollis. Integer tincidunt aliquam', 47, CAST(N'2022-08-12T07:20:29.0000000' AS DateTime2), 33, CAST(N'2024-01-10T22:26:29.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 7, 2, N'Quisque libero lacus, varius et, euismod et, commodo at,', 46, CAST(N'2022-10-11T01:53:23.0000000' AS DateTime2), 87, CAST(N'2024-03-02T19:25:59.0000000' AS DateTime2), 87)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 14, 2, N'neque sed dictum eleifend, nunc', 49, CAST(N'2023-07-10T04:32:08.0000000' AS DateTime2), 77, CAST(N'2023-11-21T11:03:26.0000000' AS DateTime2), 77)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 19, 2, N'justo nec ante.', 47, CAST(N'2022-07-12T21:18:15.0000000' AS DateTime2), 72, CAST(N'2023-08-03T13:54:05.0000000' AS DateTime2), 72)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 19, 3, N'nascetur ridiculus', 43, CAST(N'2023-07-31T17:56:15.0000000' AS DateTime2), 33, CAST(N'2023-03-20T22:36:51.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 80, 1, N'at, velit. Pellentesque ultricies', 42, CAST(N'2023-11-06T05:03:47.0000000' AS DateTime2), 3, CAST(N'2024-03-12T08:03:50.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 48, 1, N'natoque penatibus et magnis dis parturient montes, nascetur ridiculus', 49, CAST(N'2022-06-13T02:07:58.0000000' AS DateTime2), 28, CAST(N'2023-01-05T04:24:11.0000000' AS DateTime2), 28)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 100, 1, N'amet', 46, CAST(N'2022-12-22T03:20:00.0000000' AS DateTime2), 99, CAST(N'2024-03-07T23:48:52.0000000' AS DateTime2), 99)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 12, 2, N'mollis nec, cursus', 48, CAST(N'2023-11-13T13:09:41.0000000' AS DateTime2), 3, CAST(N'2023-09-17T12:30:40.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 94, 3, N'feugiat. Lorem ipsum dolor sit amet,', 41, CAST(N'2022-11-06T04:03:27.0000000' AS DateTime2), 13, CAST(N'2023-02-25T18:51:35.0000000' AS DateTime2), 13)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 9, 2, N'Mauris ut quam', 46, CAST(N'2022-07-27T17:27:09.0000000' AS DateTime2), 5, CAST(N'2023-04-09T20:06:37.0000000' AS DateTime2), 5)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 40, 1, N'aliquet vel,', 40, CAST(N'2023-11-19T09:31:24.0000000' AS DateTime2), 60, CAST(N'2022-11-26T23:12:57.0000000' AS DateTime2), 60)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, 46, 4, N'ut erat. Sed nunc est, mollis non,', 43, CAST(N'2022-10-06T16:07:21.0000000' AS DateTime2), 18, CAST(N'2023-10-04T02:06:22.0000000' AS DateTime2), 18)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 7, 3, N'nisl. Nulla eu neque pellentesque massa lobortis ultrices.', 45, CAST(N'2024-03-06T00:33:27.0000000' AS DateTime2), 26, CAST(N'2022-12-28T02:59:56.0000000' AS DateTime2), 26)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, 42, 4, N'Cras interdum. Nunc sollicitudin', 40, CAST(N'2024-03-16T18:37:14.0000000' AS DateTime2), 74, CAST(N'2023-02-28T16:14:49.0000000' AS DateTime2), 74)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 43, 4, N'Aliquam erat', 49, CAST(N'2023-11-19T23:49:22.0000000' AS DateTime2), 48, CAST(N'2022-09-17T04:57:33.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 45, 2, N'Nam interdum enim non nisi. Aenean eget metus. In', 43, CAST(N'2023-11-08T15:07:02.0000000' AS DateTime2), 74, CAST(N'2022-09-05T17:29:19.0000000' AS DateTime2), 74)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 32, 2, N'tempor, est ac mattis', 42, CAST(N'2022-07-14T00:18:18.0000000' AS DateTime2), 4, CAST(N'2024-05-22T21:54:28.0000000' AS DateTime2), 4)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 90, 3, N'augue malesuada', 45, CAST(N'2023-05-30T17:54:40.0000000' AS DateTime2), 37, CAST(N'2023-11-25T23:44:01.0000000' AS DateTime2), 37)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 8, 4, N'nisi magna sed dui. Fusce aliquam,', 44, CAST(N'2024-01-28T08:02:53.0000000' AS DateTime2), 72, CAST(N'2023-06-22T15:47:30.0000000' AS DateTime2), 72)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1002, 1002, 1, N'string', 50, CAST(N'2023-06-06T23:43:23.6466667' AS DateTime2), 20, CAST(N'2023-06-06T23:43:23.6466667' AS DateTime2), 20)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1003, 1003, 1, N'Travel expense', 50, CAST(N'2023-06-06T23:48:17.5266667' AS DateTime2), 20, CAST(N'2023-06-06T23:48:17.5266667' AS DateTime2), 20)
GO
SET IDENTITY_INSERT [dbo].[ApprovalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Expenses] ON 
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 7, 1, CAST(3770.00 AS Decimal(10, 2)), 48, CAST(N'2023-03-04T03:45:50.0000000' AS DateTime2), 48, CAST(N'2024-04-08T12:43:42.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 0, 2, CAST(9372.00 AS Decimal(10, 2)), 45, CAST(N'2022-12-05T04:48:26.0000000' AS DateTime2), 45, CAST(N'2022-08-25T17:23:18.0000000' AS DateTime2), 45)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 3, 3, CAST(7018.00 AS Decimal(10, 2)), 30, CAST(N'2023-12-16T06:34:11.0000000' AS DateTime2), 30, CAST(N'2022-10-02T01:33:03.0000000' AS DateTime2), 30)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 1, 6, CAST(415.00 AS Decimal(10, 2)), 28, CAST(N'2024-05-31T08:14:20.0000000' AS DateTime2), 28, CAST(N'2023-01-07T14:03:40.0000000' AS DateTime2), 28)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 1, 6, CAST(736.00 AS Decimal(10, 2)), 20, CAST(N'2022-10-21T18:14:13.0000000' AS DateTime2), 20, CAST(N'2023-07-23T00:43:51.0000000' AS DateTime2), 20)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 7, 2, CAST(6608.00 AS Decimal(10, 2)), 29, CAST(N'2024-01-24T22:23:31.0000000' AS DateTime2), 29, CAST(N'2023-10-15T03:58:44.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 7, 4, CAST(1627.00 AS Decimal(10, 2)), 41, CAST(N'2024-01-26T19:26:52.0000000' AS DateTime2), 41, CAST(N'2023-06-03T14:01:58.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 2, 1, CAST(3459.00 AS Decimal(10, 2)), 39, CAST(N'2023-10-22T07:51:10.0000000' AS DateTime2), 39, CAST(N'2023-08-27T11:32:22.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 7, 2, CAST(6524.00 AS Decimal(10, 2)), 46, CAST(N'2023-02-19T10:09:31.0000000' AS DateTime2), 46, CAST(N'2023-12-07T18:59:21.0000000' AS DateTime2), 46)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 2, 5, CAST(6856.00 AS Decimal(10, 2)), 29, CAST(N'2023-02-28T06:58:21.0000000' AS DateTime2), 29, CAST(N'2023-12-17T23:38:42.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 8, 7, CAST(7215.00 AS Decimal(10, 2)), 44, CAST(N'2024-01-21T04:54:31.0000000' AS DateTime2), 44, CAST(N'2024-01-25T09:07:57.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 2, 0, CAST(1840.00 AS Decimal(10, 2)), 44, CAST(N'2023-04-16T07:13:18.0000000' AS DateTime2), 44, CAST(N'2023-12-16T06:35:35.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 4, 8, CAST(2293.00 AS Decimal(10, 2)), 33, CAST(N'2023-06-22T00:17:17.0000000' AS DateTime2), 33, CAST(N'2023-11-07T17:47:09.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 2, 6, CAST(9806.00 AS Decimal(10, 2)), 39, CAST(N'2023-09-14T17:18:54.0000000' AS DateTime2), 39, CAST(N'2022-09-21T15:28:02.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 2, 3, CAST(9803.00 AS Decimal(10, 2)), 44, CAST(N'2023-11-12T18:48:27.0000000' AS DateTime2), 44, CAST(N'2024-03-10T13:25:22.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 7, 6, CAST(8828.00 AS Decimal(10, 2)), 27, CAST(N'2022-06-07T00:44:03.0000000' AS DateTime2), 27, CAST(N'2022-08-03T17:26:10.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 5, 7, CAST(7678.00 AS Decimal(10, 2)), 23, CAST(N'2022-06-25T10:07:15.0000000' AS DateTime2), 23, CAST(N'2022-07-14T23:38:11.0000000' AS DateTime2), 23)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 1, 0, CAST(9504.00 AS Decimal(10, 2)), 39, CAST(N'2023-02-18T12:27:21.0000000' AS DateTime2), 39, CAST(N'2024-02-10T10:06:59.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 6, 1, CAST(6353.00 AS Decimal(10, 2)), 21, CAST(N'2023-01-22T04:55:56.0000000' AS DateTime2), 21, CAST(N'2022-06-24T02:33:54.0000000' AS DateTime2), 21)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 4, 3, CAST(3674.00 AS Decimal(10, 2)), 35, CAST(N'2024-03-27T07:57:29.0000000' AS DateTime2), 35, CAST(N'2022-12-21T21:35:54.0000000' AS DateTime2), 35)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 8, 6, CAST(4857.00 AS Decimal(10, 2)), 49, CAST(N'2023-03-18T03:18:51.0000000' AS DateTime2), 49, CAST(N'2023-11-30T03:04:57.0000000' AS DateTime2), 49)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 5, 5, CAST(7627.00 AS Decimal(10, 2)), 34, CAST(N'2022-09-11T17:18:33.0000000' AS DateTime2), 34, CAST(N'2024-02-12T19:04:46.0000000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 2, 6, CAST(2853.00 AS Decimal(10, 2)), 44, CAST(N'2024-03-09T07:57:26.0000000' AS DateTime2), 44, CAST(N'2022-08-22T06:15:36.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 2, 2, CAST(3678.00 AS Decimal(10, 2)), 47, CAST(N'2022-08-02T09:12:17.0000000' AS DateTime2), 47, CAST(N'2023-10-23T08:39:31.0000000' AS DateTime2), 47)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 2, 1, CAST(8141.00 AS Decimal(10, 2)), 22, CAST(N'2023-02-17T22:14:38.0000000' AS DateTime2), 22, CAST(N'2023-03-20T10:38:40.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 7, 4, CAST(9218.00 AS Decimal(10, 2)), 37, CAST(N'2023-06-22T21:50:51.0000000' AS DateTime2), 37, CAST(N'2024-02-16T19:12:09.0000000' AS DateTime2), 37)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, 8, 6, CAST(4658.00 AS Decimal(10, 2)), 22, CAST(N'2022-10-17T09:20:09.0000000' AS DateTime2), 22, CAST(N'2024-05-22T17:55:27.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 5, 7, CAST(7401.00 AS Decimal(10, 2)), 25, CAST(N'2022-12-02T19:42:20.0000000' AS DateTime2), 25, CAST(N'2023-07-16T18:50:11.0000000' AS DateTime2), 25)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 1, 2, CAST(8151.00 AS Decimal(10, 2)), 27, CAST(N'2023-09-14T03:43:19.0000000' AS DateTime2), 27, CAST(N'2023-05-24T05:38:13.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 5, 2, CAST(3360.00 AS Decimal(10, 2)), 29, CAST(N'2022-12-03T06:05:12.0000000' AS DateTime2), 29, CAST(N'2022-11-26T13:58:57.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 7, 8, CAST(4015.00 AS Decimal(10, 2)), 41, CAST(N'2024-03-01T20:50:16.0000000' AS DateTime2), 41, CAST(N'2023-05-07T06:55:32.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 1, 1, CAST(6723.00 AS Decimal(10, 2)), 36, CAST(N'2022-12-27T12:41:27.0000000' AS DateTime2), 36, CAST(N'2022-12-31T12:37:16.0000000' AS DateTime2), 36)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 7, 1, CAST(4713.00 AS Decimal(10, 2)), 30, CAST(N'2023-11-03T05:02:31.0000000' AS DateTime2), 30, CAST(N'2024-05-08T13:08:07.0000000' AS DateTime2), 30)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 4, 2, CAST(8824.00 AS Decimal(10, 2)), 46, CAST(N'2023-08-06T19:48:19.0000000' AS DateTime2), 46, CAST(N'2024-02-10T03:43:24.0000000' AS DateTime2), 46)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 8, 5, CAST(7911.00 AS Decimal(10, 2)), 32, CAST(N'2023-11-15T04:46:13.0000000' AS DateTime2), 32, CAST(N'2022-07-14T13:17:34.0000000' AS DateTime2), 32)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 1, 6, CAST(3244.00 AS Decimal(10, 2)), 48, CAST(N'2023-01-13T04:57:48.0000000' AS DateTime2), 48, CAST(N'2023-07-07T07:45:23.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 1, 5, CAST(6471.00 AS Decimal(10, 2)), 36, CAST(N'2022-06-27T09:59:03.0000000' AS DateTime2), 36, CAST(N'2023-03-31T04:20:47.0000000' AS DateTime2), 36)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 1, 2, CAST(3500.25 AS Decimal(10, 2)), 10, CAST(N'2023-03-31T01:49:18.0000000' AS DateTime2), 24, CAST(N'2023-06-06T03:42:45.5566667' AS DateTime2), 15)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 1, 3, CAST(1782.00 AS Decimal(10, 2)), 43, CAST(N'2022-07-07T15:49:44.0000000' AS DateTime2), 43, CAST(N'2022-09-03T21:22:02.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 4, 1, CAST(5640.00 AS Decimal(10, 2)), 33, CAST(N'2023-10-25T20:13:24.0000000' AS DateTime2), 33, CAST(N'2022-07-06T12:22:32.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 8, 4, CAST(6216.00 AS Decimal(10, 2)), 41, CAST(N'2023-08-30T02:21:59.0000000' AS DateTime2), 41, CAST(N'2023-08-07T18:34:53.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 6, 4, CAST(4291.00 AS Decimal(10, 2)), 33, CAST(N'2023-11-06T04:40:15.0000000' AS DateTime2), 33, CAST(N'2022-11-27T22:30:52.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 1, 4, CAST(8361.00 AS Decimal(10, 2)), 31, CAST(N'2022-10-17T01:02:23.0000000' AS DateTime2), 31, CAST(N'2024-01-01T01:57:30.0000000' AS DateTime2), 31)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 4, 4, CAST(9242.00 AS Decimal(10, 2)), 48, CAST(N'2022-06-15T03:00:22.0000000' AS DateTime2), 48, CAST(N'2024-03-12T07:59:56.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 4, 5, CAST(6652.00 AS Decimal(10, 2)), 32, CAST(N'2022-11-14T07:59:33.0000000' AS DateTime2), 32, CAST(N'2024-05-07T02:45:33.0000000' AS DateTime2), 32)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 4, 2, CAST(2803.00 AS Decimal(10, 2)), 40, CAST(N'2024-02-21T19:23:49.0000000' AS DateTime2), 40, CAST(N'2023-12-10T03:47:22.0000000' AS DateTime2), 40)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 0, 8, CAST(6252.00 AS Decimal(10, 2)), 43, CAST(N'2024-05-24T08:47:09.0000000' AS DateTime2), 43, CAST(N'2022-12-01T03:02:42.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 8, 8, CAST(6584.00 AS Decimal(10, 2)), 43, CAST(N'2022-11-02T20:11:11.0000000' AS DateTime2), 43, CAST(N'2023-08-02T22:31:35.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 6, 1, CAST(9863.00 AS Decimal(10, 2)), 34, CAST(N'2023-06-26T21:24:25.0000000' AS DateTime2), 34, CAST(N'2022-12-13T11:00:19.0000000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 7, 8, CAST(5517.00 AS Decimal(10, 2)), 39, CAST(N'2024-02-24T21:45:33.0000000' AS DateTime2), 39, CAST(N'2023-03-07T20:43:08.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 7, 6, CAST(2011.00 AS Decimal(10, 2)), 29, CAST(N'2024-03-25T17:37:26.0000000' AS DateTime2), 29, CAST(N'2023-03-23T22:46:42.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 1, 7, CAST(5530.00 AS Decimal(10, 2)), 26, CAST(N'2022-11-13T09:40:36.0000000' AS DateTime2), 26, CAST(N'2023-05-15T13:17:56.0000000' AS DateTime2), 26)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 4, 6, CAST(8703.00 AS Decimal(10, 2)), 47, CAST(N'2024-01-25T20:01:56.0000000' AS DateTime2), 47, CAST(N'2022-12-21T23:10:56.0000000' AS DateTime2), 47)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 7, 4, CAST(8224.00 AS Decimal(10, 2)), 33, CAST(N'2023-06-02T04:57:23.0000000' AS DateTime2), 33, CAST(N'2022-08-25T18:09:47.0000000' AS DateTime2), 33)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 1, 2, CAST(3152.00 AS Decimal(10, 2)), 47, CAST(N'2022-06-17T06:18:49.0000000' AS DateTime2), 47, CAST(N'2023-03-24T12:04:21.0000000' AS DateTime2), 47)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 9, 8, CAST(3497.00 AS Decimal(10, 2)), 39, CAST(N'2024-01-17T23:52:51.0000000' AS DateTime2), 39, CAST(N'2024-03-18T14:58:03.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 8, 4, CAST(9379.00 AS Decimal(10, 2)), 46, CAST(N'2023-07-01T00:51:00.0000000' AS DateTime2), 46, CAST(N'2022-12-24T16:34:36.0000000' AS DateTime2), 46)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 0, 7, CAST(2869.00 AS Decimal(10, 2)), 34, CAST(N'2023-09-06T10:03:44.0000000' AS DateTime2), 34, CAST(N'2023-04-14T21:21:08.0000000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 7, 8, CAST(2586.00 AS Decimal(10, 2)), 27, CAST(N'2022-09-04T05:34:47.0000000' AS DateTime2), 27, CAST(N'2022-08-04T22:19:47.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 2, 0, CAST(5526.00 AS Decimal(10, 2)), 25, CAST(N'2023-02-11T09:01:54.0000000' AS DateTime2), 25, CAST(N'2023-03-31T19:50:01.0000000' AS DateTime2), 25)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 7, 0, CAST(7865.00 AS Decimal(10, 2)), 49, CAST(N'2023-07-11T09:49:11.0000000' AS DateTime2), 49, CAST(N'2022-11-26T15:37:11.0000000' AS DateTime2), 49)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, 8, 5, CAST(6230.00 AS Decimal(10, 2)), 44, CAST(N'2023-04-20T23:10:47.0000000' AS DateTime2), 44, CAST(N'2023-05-25T01:21:16.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 6, 5, CAST(2152.00 AS Decimal(10, 2)), 36, CAST(N'2023-09-01T12:35:24.0000000' AS DateTime2), 36, CAST(N'2024-03-10T17:18:12.0000000' AS DateTime2), 36)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 8, 1, CAST(683.00 AS Decimal(10, 2)), 43, CAST(N'2024-03-16T14:57:48.0000000' AS DateTime2), 43, CAST(N'2022-08-30T19:47:05.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 5, 1, CAST(7822.00 AS Decimal(10, 2)), 31, CAST(N'2024-04-03T12:03:55.0000000' AS DateTime2), 31, CAST(N'2023-05-15T08:31:10.0000000' AS DateTime2), 31)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 2, 7, CAST(700.00 AS Decimal(10, 2)), 39, CAST(N'2024-04-26T01:13:55.0000000' AS DateTime2), 39, CAST(N'2024-02-10T09:47:00.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 6, 1, CAST(7349.00 AS Decimal(10, 2)), 45, CAST(N'2022-06-21T01:16:59.0000000' AS DateTime2), 45, CAST(N'2023-11-07T03:30:17.0000000' AS DateTime2), 45)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, 4, 1, CAST(3730.00 AS Decimal(10, 2)), 41, CAST(N'2023-05-10T12:33:38.0000000' AS DateTime2), 41, CAST(N'2022-07-06T12:17:24.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 8, 5, CAST(8718.00 AS Decimal(10, 2)), 36, CAST(N'2023-04-28T20:04:50.0000000' AS DateTime2), 36, CAST(N'2024-05-05T00:19:40.0000000' AS DateTime2), 36)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 8, 0, CAST(3447.00 AS Decimal(10, 2)), 28, CAST(N'2022-12-15T19:51:07.0000000' AS DateTime2), 28, CAST(N'2022-07-28T02:08:06.0000000' AS DateTime2), 28)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 6, 1, CAST(4705.00 AS Decimal(10, 2)), 23, CAST(N'2022-10-28T16:20:48.0000000' AS DateTime2), 23, CAST(N'2024-01-11T02:53:34.0000000' AS DateTime2), 23)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 1, 3, CAST(4804.00 AS Decimal(10, 2)), 42, CAST(N'2023-12-06T13:03:33.0000000' AS DateTime2), 42, CAST(N'2023-09-25T08:11:29.0000000' AS DateTime2), 42)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 1, 1, CAST(7780.00 AS Decimal(10, 2)), 43, CAST(N'2024-04-15T02:58:56.0000000' AS DateTime2), 43, CAST(N'2023-04-16T13:34:09.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 7, 7, CAST(5161.00 AS Decimal(10, 2)), 42, CAST(N'2023-05-24T16:51:52.0000000' AS DateTime2), 42, CAST(N'2023-02-16T08:36:29.0000000' AS DateTime2), 42)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 8, 1, CAST(4030.00 AS Decimal(10, 2)), 44, CAST(N'2024-04-28T03:45:03.0000000' AS DateTime2), 44, CAST(N'2024-03-07T16:00:52.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 3, 2, CAST(6756.00 AS Decimal(10, 2)), 44, CAST(N'2022-06-26T03:46:51.0000000' AS DateTime2), 44, CAST(N'2022-10-05T22:28:56.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 5, 2, CAST(6401.00 AS Decimal(10, 2)), 24, CAST(N'2023-03-13T17:31:47.0000000' AS DateTime2), 24, CAST(N'2023-11-30T10:33:51.0000000' AS DateTime2), 24)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 4, 3, CAST(7190.00 AS Decimal(10, 2)), 40, CAST(N'2023-06-27T18:09:22.0000000' AS DateTime2), 40, CAST(N'2024-04-15T16:00:54.0000000' AS DateTime2), 40)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 1, 0, CAST(2757.00 AS Decimal(10, 2)), 40, CAST(N'2023-09-03T00:47:20.0000000' AS DateTime2), 40, CAST(N'2024-05-20T05:51:50.0000000' AS DateTime2), 40)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 8, 1, CAST(1307.00 AS Decimal(10, 2)), 41, CAST(N'2023-06-09T14:16:50.0000000' AS DateTime2), 41, CAST(N'2024-04-27T22:57:48.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 5, 6, CAST(9564.00 AS Decimal(10, 2)), 22, CAST(N'2023-10-12T00:47:54.0000000' AS DateTime2), 22, CAST(N'2022-06-26T17:37:22.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 3, 7, CAST(9756.00 AS Decimal(10, 2)), 31, CAST(N'2023-07-15T11:51:20.0000000' AS DateTime2), 31, CAST(N'2022-11-02T04:21:54.0000000' AS DateTime2), 31)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 4, 5, CAST(4578.00 AS Decimal(10, 2)), 31, CAST(N'2023-10-22T03:33:47.0000000' AS DateTime2), 31, CAST(N'2024-04-21T11:45:51.0000000' AS DateTime2), 31)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, 1, 8, CAST(8060.00 AS Decimal(10, 2)), 32, CAST(N'2024-04-07T03:29:51.0000000' AS DateTime2), 32, CAST(N'2023-12-07T14:41:58.0000000' AS DateTime2), 32)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 4, 2, CAST(9459.00 AS Decimal(10, 2)), 43, CAST(N'2022-06-14T12:38:34.0000000' AS DateTime2), 43, CAST(N'2023-01-22T19:43:29.0000000' AS DateTime2), 43)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 5, 6, CAST(756.00 AS Decimal(10, 2)), 48, CAST(N'2023-08-19T05:57:45.0000000' AS DateTime2), 48, CAST(N'2022-06-28T16:29:01.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 1, 7, CAST(8679.00 AS Decimal(10, 2)), 49, CAST(N'2022-09-15T02:35:06.0000000' AS DateTime2), 49, CAST(N'2022-11-15T02:53:36.0000000' AS DateTime2), 49)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 1, 5, CAST(6379.00 AS Decimal(10, 2)), 29, CAST(N'2022-08-22T11:58:45.0000000' AS DateTime2), 29, CAST(N'2022-09-10T20:14:35.0000000' AS DateTime2), 29)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 4, 6, CAST(5997.00 AS Decimal(10, 2)), 25, CAST(N'2023-06-28T21:21:20.0000000' AS DateTime2), 25, CAST(N'2022-09-04T12:23:44.0000000' AS DateTime2), 25)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 3, 3, CAST(4471.00 AS Decimal(10, 2)), 24, CAST(N'2023-04-29T10:10:49.0000000' AS DateTime2), 24, CAST(N'2024-02-09T16:50:15.0000000' AS DateTime2), 24)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 1, 1, CAST(1285.00 AS Decimal(10, 2)), 24, CAST(N'2022-10-03T09:40:40.0000000' AS DateTime2), 24, CAST(N'2022-12-27T04:40:36.0000000' AS DateTime2), 24)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 0, 5, CAST(9294.00 AS Decimal(10, 2)), 41, CAST(N'2023-12-11T01:35:52.0000000' AS DateTime2), 41, CAST(N'2023-05-25T05:37:37.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, 3, 1, CAST(2960.00 AS Decimal(10, 2)), 45, CAST(N'2022-07-07T18:34:38.0000000' AS DateTime2), 45, CAST(N'2023-12-29T23:03:49.0000000' AS DateTime2), 45)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 0, 3, CAST(4880.00 AS Decimal(10, 2)), 22, CAST(N'2024-01-23T02:43:37.0000000' AS DateTime2), 22, CAST(N'2022-11-26T09:01:41.0000000' AS DateTime2), 22)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 4, 6, CAST(7534.00 AS Decimal(10, 2)), 47, CAST(N'2023-04-30T10:06:43.0000000' AS DateTime2), 47, CAST(N'2022-12-13T01:32:20.0000000' AS DateTime2), 47)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 5, 3, CAST(8969.00 AS Decimal(10, 2)), 41, CAST(N'2022-09-11T17:20:33.0000000' AS DateTime2), 41, CAST(N'2023-06-07T03:11:31.0000000' AS DateTime2), 41)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 9, 2, CAST(3001.00 AS Decimal(10, 2)), 44, CAST(N'2024-01-26T18:14:11.0000000' AS DateTime2), 44, CAST(N'2022-06-14T07:22:01.0000000' AS DateTime2), 44)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 7, 1, CAST(441.00 AS Decimal(10, 2)), 27, CAST(N'2023-02-04T21:46:49.0000000' AS DateTime2), 27, CAST(N'2022-10-25T03:36:20.0000000' AS DateTime2), 27)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 2, 5, CAST(8361.00 AS Decimal(10, 2)), 39, CAST(N'2023-12-17T23:37:19.0000000' AS DateTime2), 39, CAST(N'2023-12-25T15:59:23.0000000' AS DateTime2), 39)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (101, 1, 1, CAST(1000.50 AS Decimal(10, 2)), 10, CAST(N'2023-06-06T04:25:42.9800000' AS DateTime2), 10, CAST(N'2023-06-06T04:25:42.9800000' AS DateTime2), 10)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (102, 1, 2, CAST(500.25 AS Decimal(10, 2)), 10, CAST(N'2023-06-06T04:31:51.1233333' AS DateTime2), 10, CAST(N'2023-06-06T04:31:51.1233333' AS DateTime2), 10)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1002, 1, 2, CAST(900.50 AS Decimal(10, 2)), 20, CAST(N'2023-06-06T23:43:23.6466667' AS DateTime2), 20, CAST(N'2023-06-06T23:43:23.6466667' AS DateTime2), 20)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1003, 1, 2, CAST(500.45 AS Decimal(10, 2)), 20, CAST(N'2023-06-06T23:48:17.5266667' AS DateTime2), 20, CAST(N'2023-06-06T23:48:17.5266667' AS DateTime2), 20)
GO
SET IDENTITY_INSERT [dbo].[Expenses] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseSubTypesRef] ON 
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 1, N'Flight Ticket', CAST(N'2023-06-05T20:09:04.3393661' AS DateTime2), 99999, CAST(N'2023-06-05T20:09:04.3393661' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 1, N'Rental Car', CAST(N'2023-06-05T20:09:19.8493445' AS DateTime2), 99999, CAST(N'2023-06-05T20:09:19.8493445' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 3, N'Relocation', CAST(N'2023-06-05T20:09:38.5858470' AS DateTime2), 99999, CAST(N'2023-06-05T20:09:38.5858470' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 4, N'Tution Reimbursement', CAST(N'2023-06-05T20:10:00.9118331' AS DateTime2), 99999, CAST(N'2023-06-05T20:10:00.9118331' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 4, N'Courses', CAST(N'2023-06-05T20:10:13.5294231' AS DateTime2), 99999, CAST(N'2023-06-05T20:10:13.5294231' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 6, N'Mileage', CAST(N'2023-06-05T20:10:30.1466656' AS DateTime2), 99999, CAST(N'2023-06-05T20:10:30.1466656' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 9, N'Personal Loan', CAST(N'2023-06-05T20:11:05.7338110' AS DateTime2), 99999, CAST(N'2023-06-05T20:11:05.7338110' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[ExpenseSubTypesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseTypesRef] ON 
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Travel', CAST(N'2023-06-05T14:31:52.1099936' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.6930228' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Business meals', CAST(N'2023-06-05T14:33:03.6875957' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7049930' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Moving expenses', CAST(N'2023-06-05T14:33:09.9373828' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7069885' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Continuing education', CAST(N'2023-06-05T14:33:21.9404873' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7079997' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, N'Dues and subscriptions', CAST(N'2023-06-05T14:33:38.3424563' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7090179' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, N'Business use of your car', CAST(N'2023-06-05T14:33:55.2100817' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7099806' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, N'Child and/or dependent care', CAST(N'2023-06-05T14:34:08.9017354' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7110112' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, N'Client gifts', CAST(N'2023-06-05T14:34:23.0557935' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7120091' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, N'Employee loans', CAST(N'2023-06-05T14:34:28.5888733' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7129729' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[ExpenseTypesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[LogIn] ON 
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 8, NULL, CAST(N'2023-06-06T21:01:26.8554021' AS DateTime2), 99999, CAST(N'2023-06-06T21:01:26.8554021' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[LogIn] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesRef] ON 
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Employee', CAST(N'2023-06-05T14:06:23.8907674' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7159635' AS DateTime2), 99999)
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Manager', CAST(N'2023-06-05T14:06:27.0230090' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7197967' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[RolesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusRef] ON 
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Submitted', CAST(N'2023-06-05T14:03:33.6394209' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7227873' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Approved', CAST(N'2023-06-05T14:05:16.7917708' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7281655' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Rejected', CAST(N'2023-06-05T14:05:23.7199066' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7291642' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Sent Back for Revision', CAST(N'2023-06-05T14:05:41.1420704' AS DateTime2), 99999, CAST(N'2023-06-05T20:05:18.7316782' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[StatusRef] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Arsenio', N'Hunter', N'3314 Et Avenue', N'488-2584 Metus. Street', N'Chandler', N'NV', N'17321', N'lobortis.nisi@google.ca', 1, 1, CAST(N'2022-06-26T08:13:56.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Moana', N'Dominguez', N'923-3279 Proin Road', N'484-5143 Est St.', N'Sterling Heights', N'MT', N'81757', N'et.nunc@hotmail.net', 1, 0, CAST(N'2024-03-19T17:01:36.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Azalia', N'Harrison', N'Ap #594-7326 Nullam St.', N'1463 Vel Ave', N'Georgia', N'CO', N'20427', N'sit.amet@google.com', 2, 0, CAST(N'2022-09-27T01:51:10.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, N'Garrison', N'Jacobson', N'6683 Feugiat Rd.', N'Ap #261-5903 Tortor. Av.', N'Lewiston', N'OH', N'58289', N'orci@hotmail.couk', 1, 1, CAST(N'2023-07-30T00:18:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, N'Haviva', N'Vasquez', N'141-7818 Dui Road', N'7904 At, Ave', N'Great Falls', N'NV', N'99720', N'eu.euismod@yahoo.couk', 1, 0, CAST(N'2022-11-15T21:57:55.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, N'Beatrice', N'Manning', N'Ap #955-6703 Vestibulum Ave', N'715-3162 Vel, Rd.', N'Spokane', N'VA', N'75658', N'dapibus.id@yahoo.edu', 2, 1, CAST(N'2023-12-25T00:42:29.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, N'Mira', N'Bruce', N'Ap #266-1353 Tristique Rd.', N'P.O. Box 537, 5060 Sem, Avenue', N'Fort Smith', N'VT', N'82908', N'non.leo@google.com', 2, 0, CAST(N'2022-09-19T00:50:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, N'Hiram', N'Marshall', N'8366 Quam. Ave', N'Ap #843-5052 Nibh St.', N'Tucson', N'WA', N'77297', N'donec.elementum.lorem@hotmail.ca', 1, 0, CAST(N'2024-01-14T20:35:59.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, N'Brenden', N'Vega', N'587-6071 Cursus Rd.', N'891-3308 Dolor. Av.', N'Tampa', N'CT', N'35555', N'montes.nascetur@aol.org', 1, 1, CAST(N'2023-10-17T15:56:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, N'Randall', N'Payne', N'P.O. Box 583, 4096 Per Rd.', N'Ap #273-9306 Purus St.', N'Naperville', N'MD', N'24227', N'nunc.quisque@yahoo.edu', 2, 1, CAST(N'2023-02-28T19:55:18.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, N'Pandora', N'Stanton', N'820-8016 Arcu. St.', N'Ap #418-9511 Enim Rd.', N'Kansas City', N'AK', N'46560', N'nulla.eu@icloud.net', 2, 0, CAST(N'2022-10-02T08:32:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, N'Lewis', N'Stark', N'Ap #250-5423 Turpis. St.', N'Ap #210-7860 Egestas Rd.', N'Denver', N'AL', N'18272', N'nisl.sem@aol.com', 1, 0, CAST(N'2022-08-11T21:34:53.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, N'Nissim', N'Jackson', N'5238 A, Rd.', N'3877 Mauris St.', N'Jackson', N'WA', N'31580', N'leo@protonmail.ca', 1, 1, CAST(N'2023-06-10T13:03:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, N'Dorian', N'Floyd', N'P.O. Box 582, 124 Pede. Street', N'Ap #349-5089 Tincidunt. Road', N'Kenosha', N'LA', N'96857', N'ante.bibendum.ullamcorper@google.couk', 2, 0, CAST(N'2022-07-10T03:53:47.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, N'Adam', N'Marks', N'474-2110 Velit. St.', N'P.O. Box 790, 8711 Tempor Street', N'Birmingham', N'IA', N'72688', N'ullamcorper.magna@icloud.com', 2, 1, CAST(N'2023-05-01T21:16:40.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, N'Hyacinth', N'Peck', N'927-8233 Quis Road', N'Ap #594-5820 Venenatis Rd.', N'Detroit', N'MO', N'57844', N'lacinia.sed@google.ca', 1, 0, CAST(N'2023-12-12T00:06:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, N'Britanney', N'Meyer', N'676-8869 Dignissim. Av.', N'Ap #151-8766 Sit St.', N'Fairbanks', N'KS', N'72066', N'metus.in@protonmail.com', 1, 1, CAST(N'2022-07-01T05:38:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, N'Nichole', N'Garner', N'P.O. Box 380, 1889 Molestie Rd.', N'P.O. Box 624, 1255 Neque. St.', N'Sandy', N'AR', N'61515', N'sed.malesuada@icloud.com', 2, 0, CAST(N'2023-11-18T20:17:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, N'Idona', N'Bartlett', N'Ap #963-7680 Risus. Rd.', N'P.O. Box 714, 4108 Nisl Street', N'Cambridge', N'UT', N'21712', N'lorem.ipsum.sodales@google.couk', 2, 1, CAST(N'2023-08-01T11:36:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7126311' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, N'Carson', N'Ortega', N'976-8673 Imperdiet St.', N'Ap #319-1252 Eget, Ave', N'Kenosha', N'VA', N'42174', N'non@yahoo.com', 1, 0, CAST(N'2023-04-17T19:45:31.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, N'Yoshio', N'Stevenson', N'608-1753 Id, Avenue', N'962-5635 Eleifend Avenue', N'Boise', N'IN', N'35614', N'aliquam.erat@google.ca', 1, 1, CAST(N'2022-06-24T09:18:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, N'Cailin', N'Coleman', N'Ap #786-1118 Porttitor Av.', N'P.O. Box 592, 7136 Lorem St.', N'Bridgeport', N'CO', N'62305', N'enim@aol.net', 2, 1, CAST(N'2022-06-24T12:59:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, N'Charde', N'Huff', N'228-5811 Sit Rd.', N'P.O. Box 733, 1659 Magna. Street', N'Fresno', N'HI', N'52355', N'a.facilisis@yahoo.ca', 2, 1, CAST(N'2023-06-12T03:36:53.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, N'Benjamin', N'Williams', N'9966 Cursus Av.', N'P.O. Box 926, 5933 Turpis Rd.', N'Newark', N'KS', N'84621', N'adipiscing.elit@protonmail.net', 1, 0, CAST(N'2022-10-28T21:11:36.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, N'Vivian', N'Mack', N'Ap #284-5027 Euismod Av.', N'165-967 Molestie Rd.', N'Dover', N'WY', N'66231', N'nec.mollis@icloud.net', 1, 0, CAST(N'2022-07-16T07:14:26.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, N'Clark', N'Huff', N'Ap #876-5528 Massa. St.', N'385-5431 Neque Av.', N'Waterbury', N'WI', N'55565', N'tempus@aol.org', 2, 1, CAST(N'2022-11-22T20:53:25.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, N'Dean', N'Wilkinson', N'773-5056 Quis, Rd.', N'250-7026 Eget Rd.', N'Aurora', N'ME', N'36343', N'fusce.aliquam@yahoo.org', 2, 1, CAST(N'2023-07-01T08:04:27.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, N'Lillian', N'Craft', N'P.O. Box 655, 8110 Cras St.', N'194 Lectus St.', N'Rochester', N'ID', N'71133', N'mi.tempor.lorem@google.com', 1, 0, CAST(N'2022-07-25T02:37:16.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, N'Connor', N'O''Neill', N'Ap #173-8182 Sem St.', N'Ap #838-6068 Aliquam Av.', N'Bowling Green', N'OK', N'42320', N'enim@google.net', 1, 1, CAST(N'2023-08-07T21:43:37.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, N'Jena', N'Orr', N'8048 Risus Road', N'Ap #987-1734 Aenean Rd.', N'Kansas City', N'MI', N'32269', N'dolor.tempus.non@outlook.net', 2, 0, CAST(N'2022-07-21T22:13:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, N'Wyatt', N'Kennedy', N'1083 Aliquam Av.', N'581-5160 Auctor, Avenue', N'New Haven', N'OH', N'48174', N'facilisis@hotmail.couk', 2, 0, CAST(N'2023-02-05T08:53:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, N'Baker', N'Burt', N'107-2546 Quis Rd.', N'P.O. Box 259, 3788 Odio, Avenue', N'Frankfort', N'VA', N'38563', N'nunc@google.couk', 1, 0, CAST(N'2024-05-31T15:31:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, N'Carla', N'Bishop', N'753-8352 Vitae Road', N'Ap #497-1470 Porttitor St.', N'Fort Worth', N'TX', N'77215', N'tincidunt.donec@hotmail.com', 1, 1, CAST(N'2023-04-06T09:49:15.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, N'Priscilla', N'Kim', N'Ap #477-2159 Ullamcorper St.', N'3807 Elit. Ave', N'Tuscaloosa', N'DE', N'16512', N'fusce.feugiat@icloud.edu', 2, 1, CAST(N'2023-10-18T18:59:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, N'Rae', N'Sellers', N'Ap #128-7763 Velit. Av.', N'Ap #828-4937 Imperdiet Rd.', N'Kansas City', N'CT', N'85123', N'iaculis.nec@yahoo.ca', 2, 1, CAST(N'2023-03-24T21:32:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, N'Naomi', N'Brady', N'Ap #388-3118 Eleifend St.', N'P.O. Box 979, 1238 Placerat. St.', N'Cincinnati', N'VT', N'88536', N'luctus.vulputate@outlook.com', 1, 0, CAST(N'2023-01-20T06:57:08.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, N'Gage', N'Harvey', N'731-9623 Risus. St.', N'P.O. Box 402, 7503 Lectus Avenue', N'Seattle', N'IL', N'72473', N'ante.iaculis@google.net', 1, 0, CAST(N'2024-05-08T10:35:21.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, N'Denton', N'Summers', N'846-8819 Nonummy Street', N'Ap #114-4842 Tortor. Street', N'Independence', N'WI', N'33137', N'lorem.ipsum@google.org', 2, 0, CAST(N'2023-01-05T18:08:08.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, N'Reuben', N'Kemp', N'258-5511 Volutpat Avenue', N'985-7861 Nibh. Rd.', N'Vancouver', N'IN', N'84886', N'nisi.cum@yahoo.org', 2, 0, CAST(N'2023-02-27T13:32:28.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7136293' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, N'Hakeem', N'Matthews', N'Ap #483-4303 Scelerisque Road', N'Ap #925-1206 Elit. St.', N'Lewiston', N'WI', N'92274', N'volutpat.nulla.dignissim@icloud.org', 1, 0, CAST(N'2022-08-01T04:48:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, N'Bernard', N'Spencer', N'920-4345 Mauris. St.', N'612-7932 Massa Av.', N'Sioux City', N'MI', N'33471', N'mi@aol.ca', 1, 0, CAST(N'2022-06-05T17:59:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, N'Inez', N'Gomez', N'457-7808 Duis Avenue', N'297-4316 Eu Ave', N'Fairbanks', N'MS', N'68331', N'libero.proin@aol.couk', 2, 1, CAST(N'2023-07-17T19:17:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, N'Jorden', N'Shields', N'P.O. Box 586, 7662 Quis Avenue', N'Ap #708-8864 Ante St.', N'Jefferson City', N'AL', N'35781', N'sed@aol.couk', 2, 0, CAST(N'2023-05-09T12:26:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, N'Alexander', N'Ingram', N'182-6506 Lorem Av.', N'P.O. Box 609, 7791 Iaculis Rd.', N'Hattiesburg', N'AZ', N'56806', N'penatibus.et@hotmail.com', 1, 1, CAST(N'2022-10-21T18:40:07.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, N'Rose', N'Monroe', N'Ap #126-4624 Enim. Ave', N'P.O. Box 168, 3312 Interdum Ave', N'Bellevue', N'NE', N'27898', N'eu.nulla@protonmail.ca', 1, 1, CAST(N'2024-03-05T06:02:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, N'Katelyn', N'Boyd', N'238-7941 Dictum Rd.', N'638-8394 Mattis Av.', N'Nampa', N'MS', N'20658', N'montes.nascetur@aol.edu', 2, 1, CAST(N'2023-06-30T02:15:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, N'Basia', N'Dean', N'Ap #225-8886 Pede. Avenue', N'Ap #144-2886 Aenean Ave', N'Provo', N'NV', N'40488', N'imperdiet.ornare.in@aol.edu', 2, 1, CAST(N'2024-03-28T22:43:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, N'Duncan', N'Herring', N'P.O. Box 202, 9225 Pharetra, Ave', N'Ap #390-6506 Aliquet. Rd.', N'Eugene', N'ME', N'85870', N'congue@aol.edu', 1, 1, CAST(N'2023-05-04T23:09:10.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, N'Jonah', N'Foster', N'137-6541 Tristique Avenue', N'4611 Sem Av.', N'Lakewood', N'MS', N'72914', N'congue@yahoo.com', 1, 1, CAST(N'2022-08-25T01:15:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, N'Rooney', N'Molina', N'P.O. Box 950, 3105 Cras Street', N'Ap #107-8284 Aliquet Street', N'Lawton', N'AR', N'72500', N'adipiscing.elit@google.net', 2, 0, CAST(N'2024-01-04T21:18:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, N'Elton', N'Carpenter', N'397-4961 Elit, Rd.', N'4700 Eu St.', N'Fort Wayne', N'ME', N'62792', N'vel.est.tempor@protonmail.couk', 2, 0, CAST(N'2023-03-31T00:09:24.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, N'Burke', N'Schmidt', N'138-9649 Dictum Avenue', N'582-7492 Quam Av.', N'Columbia', N'WI', N'14738', N'vel.pede.blandit@protonmail.ca', 1, 1, CAST(N'2022-11-29T15:31:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, N'Sean', N'Padilla', N'Ap #489-8753 Dolor. Street', N'8664 Donec St.', N'Kansas City', N'MS', N'61757', N'aliquet.vel.vulputate@google.net', 1, 0, CAST(N'2023-12-16T22:23:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, N'Serena', N'Santana', N'Ap #501-8547 Orci, Street', N'1321 Vehicula. Rd.', N'Dover', N'IA', N'24577', N'in.consequat@outlook.couk', 2, 1, CAST(N'2023-05-03T12:34:28.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, N'Sean', N'Bullock', N'P.O. Box 671, 6330 Nec Street', N'3735 Vulputate, Ave', N'Davenport', N'AK', N'81667', N'vel.sapien@hotmail.ca', 2, 1, CAST(N'2024-04-13T13:46:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, N'Bernard', N'Pate', N'Ap #281-1461 Risus. Rd.', N'6181 Dignissim Ave', N'Orlando', N'WI', N'42543', N'arcu.sed.et@outlook.net', 1, 0, CAST(N'2023-02-16T16:29:44.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, N'Stephen', N'Delgado', N'P.O. Box 843, 3783 Vel Street', N'P.O. Box 103, 2076 Scelerisque St.', N'Fort Collins', N'CT', N'48158', N'pharetra@hotmail.net', 1, 0, CAST(N'2023-11-29T04:57:37.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, N'Haley', N'House', N'P.O. Box 228, 9476 Mauris Av.', N'2593 Mus. Av.', N'Bozeman', N'OH', N'58826', N'adipiscing.ligula.aenean@hotmail.org', 2, 1, CAST(N'2023-12-08T00:32:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, N'Justina', N'Barr', N'714-8974 Et, Rd.', N'150-4484 Ridiculus Road', N'Frankfort', N'KS', N'25670', N'non.dapibus@hotmail.org', 2, 0, CAST(N'2023-12-09T05:32:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, N'Gemma', N'Kelley', N'442-4787 Elit, St.', N'P.O. Box 304, 5284 Risus. Av.', N'Kapolei', N'AZ', N'29326', N'egestas.hendrerit.neque@protonmail.org', 1, 0, CAST(N'2022-10-10T09:09:18.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, N'Henry', N'Payne', N'P.O. Box 117, 4821 Lectus. Ave', N'669-712 Morbi Rd.', N'Anchorage', N'MA', N'19483', N'morbi@icloud.couk', 1, 0, CAST(N'2024-04-03T13:14:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, N'Dorothy', N'Hays', N'P.O. Box 196, 8696 Id, St.', N'6535 Mollis Road', N'Portland', N'KY', N'57225', N'vitae.diam@hotmail.ca', 2, 0, CAST(N'2024-03-27T13:17:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, N'Nolan', N'Newman', N'Ap #746-7605 Quisque Ave', N'Ap #900-9563 Mauris. Road', N'Fort Worth', N'ID', N'34555', N'non.lorem@aol.com', 2, 0, CAST(N'2024-01-16T10:48:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, N'Alan', N'Hopkins', N'8379 Non, Rd.', N'P.O. Box 749, 3849 Augue. Av.', N'Owensboro', N'MN', N'75419', N'eleifend@aol.com', 1, 0, CAST(N'2024-03-30T11:27:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, N'Lana', N'George', N'866-6711 Tortor Ave', N'600-2699 Ultricies St.', N'Lakewood', N'KY', N'26385', N'ac.mi@yahoo.edu', 1, 1, CAST(N'2023-05-17T05:43:16.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, N'Mira', N'Evans', N'Ap #159-2049 Augue Ave', N'813 Non Road', N'Houston', N'CA', N'36749', N'morbi.metus@hotmail.ca', 2, 0, CAST(N'2023-03-10T17:50:30.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, N'Quynn', N'Bush', N'P.O. Box 338, 3795 Nec Rd.', N'7797 Mollis. Road', N'Covington', N'PA', N'24386', N'odio.semper.cursus@yahoo.couk', 2, 0, CAST(N'2024-01-18T16:54:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, N'Indira', N'Goodwin', N'5855 Eu Av.', N'Ap #681-3399 Pharetra Street', N'Virginia Beach', N'MA', N'55391', N'fusce.mi@google.com', 1, 0, CAST(N'2022-09-15T19:52:21.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, N'Pandora', N'Becker', N'Ap #824-8980 Felis. St.', N'8391 Vitae Ave', N'Kapolei', N'PA', N'77645', N'mus@yahoo.edu', 1, 1, CAST(N'2023-05-02T07:30:13.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7146250' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, N'Hedy', N'Baker', N'P.O. Box 791, 4760 Sed Ave', N'842-6671 Enim Rd.', N'Des Moines', N'GA', N'83667', N'massa.mauris.vestibulum@google.org', 2, 0, CAST(N'2023-06-02T08:44:26.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, N'Katelyn', N'Foley', N'523-1092 Ut Road', N'Ap #988-783 Blandit Av.', N'Dallas', N'FL', N'84375', N'et.magnis@google.com', 2, 1, CAST(N'2023-04-24T10:11:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, N'Beau', N'Crane', N'9523 Sit Avenue', N'P.O. Box 323, 3816 Magna. St.', N'Oklahoma City', N'TN', N'16768', N'arcu.ac@aol.com', 1, 0, CAST(N'2023-06-28T04:25:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, N'Vance', N'Gilmore', N'Ap #977-2456 Semper Street', N'Ap #454-6636 At Rd.', N'Duluth', N'MA', N'81518', N'consectetuer@protonmail.edu', 1, 1, CAST(N'2023-09-13T11:53:12.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, N'Cole', N'Sanders', N'Ap #361-7089 Vulputate, St.', N'1717 A Avenue', N'Pocatello', N'HI', N'25812', N'at.velit@icloud.org', 2, 1, CAST(N'2023-01-08T11:46:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, N'Jennifer', N'Kent', N'670-9305 Pellentesque Rd.', N'P.O. Box 937, 7289 Diam St.', N'Savannah', N'WI', N'21167', N'magna.a@hotmail.net', 2, 0, CAST(N'2023-11-06T06:36:48.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, N'Dahlia', N'Vaughan', N'P.O. Box 958, 8997 Ridiculus Road', N'2976 Pharetra. Road', N'Stamford', N'FL', N'75433', N'magna.cras.convallis@protonmail.couk', 1, 1, CAST(N'2022-10-10T01:39:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, N'Joelle', N'Cooke', N'141-4819 Hendrerit Street', N'2253 Etiam Road', N'Anchorage', N'UT', N'73684', N'cras.dolor.dolor@icloud.edu', 1, 0, CAST(N'2022-08-01T19:10:00.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, N'Wing', N'Henson', N'P.O. Box 720, 5634 Gravida St.', N'776-5177 Gravida Avenue', N'Bridgeport', N'TX', N'23112', N'cras.interdum.nunc@google.net', 2, 0, CAST(N'2023-12-12T06:44:55.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, N'Lane', N'William', N'587-7938 Lobortis Ave', N'Ap #804-2580 Suspendisse Av.', N'Juneau', N'ID', N'63204', N'porta@aol.edu', 2, 1, CAST(N'2023-10-28T12:27:23.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, N'Paloma', N'Delaney', N'487-5249 Lorem Road', N'Ap #973-9126 Tellus Rd.', N'Covington', N'HI', N'72672', N'vulputate.lacus.cras@google.net', 1, 0, CAST(N'2024-04-23T19:17:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, N'Jael', N'Case', N'Ap #165-5601 Mattis St.', N'6738 Vestibulum Rd.', N'Grand Island', N'OH', N'21836', N'nulla.facilisi.sed@protonmail.net', 1, 0, CAST(N'2022-09-05T08:18:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, N'Giselle', N'English', N'614-4693 Pharetra. Av.', N'117-4613 Velit Street', N'Fort Worth', N'ID', N'56708', N'lacus.mauris@protonmail.edu', 2, 0, CAST(N'2023-12-15T19:53:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, N'Todd', N'Quinn', N'317-9943 Ipsum Street', N'Ap #784-9413 Velit Street', N'Davenport', N'WI', N'79528', N'purus.in@protonmail.edu', 2, 1, CAST(N'2023-02-06T00:57:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, N'Ignacia', N'Clay', N'958-4199 Iaculis St.', N'P.O. Box 799, 1408 Augue St.', N'Pittsburgh', N'CT', N'28818', N'duis@google.org', 1, 0, CAST(N'2022-11-11T22:19:48.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, N'Troy', N'Bowman', N'P.O. Box 571, 4913 Dictum Road', N'Ap #986-8153 Parturient Avenue', N'Springdale', N'DE', N'98224', N'tellus.phasellus@yahoo.com', 1, 0, CAST(N'2023-11-09T19:14:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, N'Bevis', N'Mendoza', N'5226 Duis Av.', N'Ap #109-9178 Tincidunt Rd.', N'West Valley City', N'KS', N'72108', N'sapien@google.com', 2, 1, CAST(N'2022-10-13T16:57:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, N'Odysseus', N'Conrad', N'Ap #781-3498 Amet Ave', N'571-4838 Ut Rd.', N'Las Vegas', N'IL', N'92796', N'blandit@aol.ca', 2, 0, CAST(N'2023-06-17T18:22:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, N'Harrison', N'Melton', N'P.O. Box 723, 598 Blandit St.', N'406-3924 Vehicula. Avenue', N'Rochester', N'MA', N'37122', N'quisque@aol.com', 1, 1, CAST(N'2023-03-18T16:02:49.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, N'August', N'Mendoza', N'837-9535 Volutpat. Avenue', N'6852 Non, Avenue', N'Olathe', N'IL', N'87918', N'nunc@protonmail.edu', 1, 0, CAST(N'2023-05-24T00:24:24.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7156230' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, N'Chastity', N'Byers', N'774-2439 Nec, Avenue', N'Ap #974-6055 Cursus St.', N'Iowa City', N'MS', N'22542', N'at.velit@protonmail.org', 2, 0, CAST(N'2024-04-21T05:56:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, N'Carson', N'Morton', N'796-7773 Aliquet St.', N'767-4301 Sed Avenue', N'Norman', N'VT', N'47476', N'accumsan@protonmail.com', 2, 0, CAST(N'2024-04-19T21:47:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, N'Nadine', N'Payne', N'Ap #391-6378 Sed, Avenue', N'942-9836 Mauris Av.', N'Tallahassee', N'NE', N'67432', N'nascetur.ridiculus@aol.ca', 1, 0, CAST(N'2022-12-05T04:52:00.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, N'Garrison', N'Harrington', N'Ap #721-7242 Ultrices Rd.', N'Ap #858-7014 Integer Avenue', N'Houston', N'CT', N'36577', N'tortor.dictum.eu@icloud.edu', 1, 0, CAST(N'2023-05-14T21:53:41.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, N'Fuller', N'Acevedo', N'1719 Felis Road', N'815-8791 Est Avenue', N'Gary', N'AR', N'40476', N'sociis@protonmail.ca', 2, 1, CAST(N'2023-06-16T19:00:58.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, N'Ulla', N'Rosales', N'767-9422 Feugiat Road', N'Ap #379-5953 Mauris Av.', N'Fayetteville', N'KY', N'75275', N'eleifend@icloud.net', 2, 0, CAST(N'2023-09-26T02:31:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, N'Ivor', N'Bauer', N'Ap #740-4950 Penatibus Avenue', N'138-373 Magna Ave', N'Butte', N'MI', N'45430', N'aliquam.eu@hotmail.edu', 1, 1, CAST(N'2023-03-02T23:42:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, N'Tasha', N'Wynn', N'P.O. Box 975, 8348 Ante. Rd.', N'636-9618 Nonummy Rd.', N'Joliet', N'MI', N'71667', N'sed.id@google.ca', 1, 1, CAST(N'2022-11-27T06:14:40.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, N'Kellie', N'Oliver', N'786-1812 Fringilla Rd.', N'107-637 Posuere St.', N'Cleveland', N'TN', N'36342', N'fusce@hotmail.ca', 2, 1, CAST(N'2023-12-05T03:41:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, N'Uma', N'Mckay', N'P.O. Box 513, 4795 Sapien. Ave', N'Ap #404-7798 Ac Road', N'Racine', N'FL', N'62217', N'semper.egestas@protonmail.com', 2, 1, CAST(N'2024-05-05T20:18:43.0000000' AS DateTime2), 99999, CAST(N'2023-06-05T20:03:23.7166205' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (101, N'Clementine', N'Randolph', N'Ap #434-7736 Phasellus St.', N'Ap #461-5270 Mauris. Road', N'Tucson', N'IL', N'46166', N'adipiscing.lobortis.risus@yahoo.com', 2, 0, CAST(N'2023-06-05T20:41:39.8156086' AS DateTime2), 2, CAST(N'2023-06-05T20:41:39.8156086' AS DateTime2), 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersRoles] ON 
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 8, 1, CAST(N'2023-06-06T21:02:25.6851806' AS DateTime2), 99999, CAST(N'2023-06-06T21:02:25.6851806' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 50, 2, CAST(N'2023-06-06T21:02:34.1354153' AS DateTime2), 99999, CAST(N'2023-06-06T21:02:34.1354153' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[UsersRoles] OFF
GO
/****** Object:  Index [IDX_ManagerId]    Script Date: 6/6/2023 9:27:17 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ManagerId] ON [dbo].[Users]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApprovalStatus] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[ApprovalStatus] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ApprovalStatus] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[ApprovalStatus] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ExpenseTypesRef] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[ExpenseTypesRef] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ExpenseTypesRef] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[ExpenseTypesRef] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[LogIn] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[LogIn] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[LogIn] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[LogIn] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[RolesRef] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[RolesRef] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[RolesRef] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[RolesRef] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[StatusRef] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[StatusRef] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[StatusRef] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[StatusRef] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  DEFAULT (sysdatetime()) FOR [CreateTS]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  DEFAULT ((99999)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  DEFAULT (sysdatetime()) FOR [UpdateTS]
GO
ALTER TABLE [dbo].[UsersRoles] ADD  DEFAULT ((99999)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ApprovalStatus]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseApprovalStatus] FOREIGN KEY([ExpenseId])
REFERENCES [dbo].[Expenses] ([ExpenseId])
GO
ALTER TABLE [dbo].[ApprovalStatus] CHECK CONSTRAINT [FK_ExpenseApprovalStatus]
GO
ALTER TABLE [dbo].[ApprovalStatus]  WITH CHECK ADD  CONSTRAINT [FK_StatusRefApprovalStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[StatusRef] ([StatusRefId])
GO
ALTER TABLE [dbo].[ApprovalStatus] CHECK CONSTRAINT [FK_StatusRefApprovalStatus]
GO
ALTER TABLE [dbo].[ApprovalStatus]  WITH CHECK ADD  CONSTRAINT [FK_UserApprovalStatusManagerId] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ApprovalStatus] CHECK CONSTRAINT [FK_UserApprovalStatusManagerId]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_UserExpense] FOREIGN KEY([SubmittedByUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_UserExpense]
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseTypesRefExpenseSubTypesRef] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId])
GO
ALTER TABLE [dbo].[ExpenseSubTypesRef] CHECK CONSTRAINT [FK_ExpenseTypesRefExpenseSubTypesRef]
GO
ALTER TABLE [dbo].[LogIn]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[LogIn] CHECK CONSTRAINT [FK_UserLogin]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UserUserManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UserUserManagerId]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_RoleRefUserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RolesRef] ([RoleRefId])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_RoleRefUserRole]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserUserRole] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UserUserRole]
GO
USE [master]
GO
ALTER DATABASE [BizzExpense] SET  READ_WRITE 
GO
