USE [master]
GO
/****** Object:  Database [BizzExpense]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[ApprovalStatus]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[Expenses]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[ExpenseSubTypesRef]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[ExpenseTypesRef]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[LogIn]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[RolesRef]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[StatusRef]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2023 1:36:06 AM ******/
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
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 6/17/2023 1:36:06 AM ******/
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
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 68, 4, N'Proin nisl sem, consequat nec, mollis vitae,', 60, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 55, 2, N'elementum purus, accumsan interdum libero dui', 60, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 100, 1, N'Integer urna. Vivamus molestie dapibus ligula. Aliquam', 50, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 53, 2, N'sed turpis', 50, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 42, 3, N'Sed eu eros. Nam consequat', 47, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 59, 2, N'vel lectus. Cum sociis natoque penatibus et magnis dis', 47, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 63, 3, N'fermentum convallis ligula. Donec', 49, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 80, 3, N'mauris eu elit. Nulla facilisi. Sed neque.', 49, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 3, 2, N'Pellentesque habitant', 2, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 33, 3, N'Quisque nonummy ipsum non arcu. Vivamus sit amet risus.', 2, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9299850' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 35, 2, N'in felis. Nulla tempor augue ac ipsum.', 86, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 36, 4, N'hymenaeos. Mauris ut quam vel sapien', 86, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 64, 3, N'neque sed sem egestas blandit.', 53, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 47, 2, N'et libero. Proin mi. Aliquam gravida mauris ut mi.', 53, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 51, 4, N'erat eget ipsum. Suspendisse sagittis. Nullam vitae', 8, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 98, 3, N'nisi dictum augue malesuada malesuada. Integer', 8, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 66, 3, N'amet, consectetuer adipiscing elit. Etiam laoreet, libero', 51, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 55, 3, N'Nulla aliquet. Proin', 51, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 20, 2, N'nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.', 55, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 69, 1, N'hymenaeos. Mauris', 55, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9309823' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 74, 1, N'aliquam, enim nec', 15, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 29, 4, N'erat.', 15, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 85, 2, N'Aliquam fringilla cursus purus. Nullam', 28, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 53, 3, N'porttitor tellus non magna. Nam ligula', 28, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 72, 1, N'Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus', 19, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 34, 3, N'congue. In scelerisque', 19, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, 50, 2, N'Integer aliquam adipiscing lacus. Ut', 24, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 9, 2, N'turpis. Nulla aliquet. Proin velit. Sed', 24, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 100, 3, N'eget, dictum placerat, augue. Sed molestie.', 15, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 65, 1, N'tellus non magna. Nam ligula elit, pretium et, rutrum non,', 15, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 39, 2, N'tortor. Nunc commodo auctor', 64, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 45, 2, N'mauris. Morbi non', 64, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 68, 3, N'diam. Proin dolor. Nulla semper tellus id nunc interdum', 31, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 94, 2, N'purus. Nullam scelerisque neque', 31, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 30, 2, N'Vestibulum accumsan neque et nunc. Quisque ornare', 43, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 62, 2, N'vel turpis. Aliquam', 43, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 64, 2, N'per conubia nostra, per inceptos hymenaeos.', 94, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 38, 3, N'cursus in, hendrerit consectetuer, cursus et, magna.', 94, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 83, 2, N'mus. Proin vel nisl. Quisque fringilla', 32, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 62, 4, N'Proin dolor. Nulla semper tellus id', 32, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 57, 4, N'et libero. Proin mi. Aliquam gravida mauris', 56, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 53, 4, N'Phasellus ornare. Fusce mollis. Duis sit amet diam', 56, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 92, 2, N'vitae nibh.', 59, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 30, 2, N'lectus justo eu arcu.', 59, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 33, 1, N'parturient montes, nascetur ridiculus mus.', 34, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 84, 2, N'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam', 34, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 92, 4, N'pede, ultrices a, auctor non, feugiat', 98, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 59, 3, N'nec, mollis vitae, posuere at, velit. Cras lorem', 98, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 10, 2, N'nunc, ullamcorper eu, euismod ac, fermentum', 30, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 16, 2, N'nascetur ridiculus', 30, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9319535' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 69, 1, N'vitae purus gravida sagittis. Duis gravida. Praesent eu', 60, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 8, 2, N'nunc risus', 60, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 21, 3, N'rutrum', 50, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 30, 3, N'luctus et ultrices posuere', 50, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 44, 2, N'eu nulla at sem molestie sodales. Mauris blandit enim', 47, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 44, 2, N'enim nisl', 47, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 86, 3, N'ut', 49, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 70, 2, N'nunc interdum feugiat. Sed nec metus facilisis lorem', 49, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 70, 1, N'Morbi accumsan', 2, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 4, 2, N'tempus mauris erat eget ipsum. Suspendisse sagittis.', 2, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 5, 4, N'euismod enim. Etiam', 86, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, 99, 3, N'dui augue eu tellus. Phasellus', 86, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 23, 4, N'neque. Morbi quis urna. Nunc quis', 53, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 18, 2, N'auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.', 53, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 83, 3, N'eleifend egestas. Sed pharetra, felis eget varius ultrices,', 8, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 45, 1, N'mi lacinia mattis. Integer', 8, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 25, 2, N'ut lacus.', 51, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, 84, 1, N'commodo at,', 51, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 56, 1, N'cursus et, magna. Praesent interdum', 55, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 61, 4, N'dictum sapien. Aenean massa. Integer vitae', 55, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9329507' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 93, 3, N'neque tellus, imperdiet non, vestibulum', 15, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 62, 2, N'Proin ultrices. Duis volutpat nunc sit amet', 15, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 24, 3, N'sollicitudin commodo', 28, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 6, 3, N'scelerisque dui. Suspendisse ac', 28, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 65, 1, N'rutrum, justo. Praesent luctus. Curabitur egestas nunc sed', 19, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 70, 3, N'arcu vel quam dignissim pharetra. Nam', 19, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 77, 4, N'vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor', 24, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 36, 2, N'sociis natoque penatibus et magnis dis parturient montes,', 24, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 45, 4, N'aliquam eros turpis non enim. Mauris quis', 15, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 34, 3, N'Duis ac arcu. Nunc mauris. Morbi non sapien molestie', 15, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 23, 2, N'vitae nibh. Donec est mauris,', 64, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 82, 3, N'Nulla eu neque pellentesque massa', 64, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 40, 2, N'Donec', 31, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, 73, 2, N'Phasellus elit pede, malesuada vel, venenatis', 31, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 31, 4, N'libero. Proin sed turpis nec mauris blandit', 43, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 60, 1, N'posuere cubilia Curae Donec tincidunt. Donec vitae erat', 43, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 94, 2, N'mollis lectus pede et risus.', 94, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 67, 2, N'orci quis', 94, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 39, 3, N'lorem ac risus.', 32, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 66, 2, N'Duis sit amet diam eu dolor', 32, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 45, 3, N'ante. Maecenas', 56, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 88, 3, N'feugiat. Sed nec metus facilisis lorem tristique aliquet.', 56, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 58, 3, N'neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin', 59, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, 84, 4, N'magnis dis parturient', 34, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 19, 2, N'fermentum risus, at fringilla purus mauris a', 34, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 98, 2, N'lectus pede et risus. Quisque libero lacus, varius et,', 98, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 24, 4, N'Morbi vehicula. Pellentesque tincidunt', 98, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 18, 3, N'tempor augue', 30, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 28, 3, N'et risus. Quisque', 30, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999, CAST(N'2023-06-09T21:34:41.9339469' AS DateTime2), 99999)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (105, 105, 1, N'Business travel on 04/10.', 1, CAST(N'2023-06-16T20:55:21.4166667' AS DateTime2), 34, CAST(N'2023-06-16T20:55:21.4166667' AS DateTime2), 34)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (106, 106, 1, N'Tution reimbursement', 1, CAST(N'2023-06-16T21:00:35.0533333' AS DateTime2), 34, CAST(N'2023-06-16T21:00:35.0533333' AS DateTime2), 34)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (107, 107, 1, N'Client meeting', 1, CAST(N'2023-06-16T21:49:00.3600000' AS DateTime2), 34, CAST(N'2023-06-16T21:49:00.3600000' AS DateTime2), 34)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (109, 109, 1, N'magazines for work', 1, CAST(N'2023-06-17T00:06:42.1866667' AS DateTime2), 34, CAST(N'2023-06-17T00:06:42.1866667' AS DateTime2), 34)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (110, 110, 1, N'Tution', 1, CAST(N'2023-06-17T00:08:30.0400000' AS DateTime2), 34, CAST(N'2023-06-17T00:08:30.0400000' AS DateTime2), 34)
GO
INSERT [dbo].[ApprovalStatus] ([ApprovalStatusId], [ExpenseId], [StatusId], [Comments], [ApproverId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (111, 111, 1, N'client meeting', 1, CAST(N'2023-06-17T00:08:51.8733333' AS DateTime2), 34, CAST(N'2023-06-17T00:08:51.8733333' AS DateTime2), 34)
GO
SET IDENTITY_INSERT [dbo].[ApprovalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Expenses] ON 
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 2, 3, CAST(7435.24 AS Decimal(10, 2)), 18, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 1, 5, CAST(9329.87 AS Decimal(10, 2)), 66, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 8, 8, CAST(4537.19 AS Decimal(10, 2)), 61, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 6, 1, CAST(5311.93 AS Decimal(10, 2)), 41, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 1, 8, CAST(5370.23 AS Decimal(10, 2)), 84, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 2, 9, CAST(5179.52 AS Decimal(10, 2)), 96, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 1, 3, CAST(3197.51 AS Decimal(10, 2)), 8, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 8, 5, CAST(6685.00 AS Decimal(10, 2)), 60, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 6, 5, CAST(9185.56 AS Decimal(10, 2)), 81, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6849899' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 5, 9, CAST(5568.14 AS Decimal(10, 2)), 51, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 7, 5, CAST(7566.99 AS Decimal(10, 2)), 83, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 4, 7, CAST(6406.32 AS Decimal(10, 2)), 57, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 1, 7, CAST(3410.19 AS Decimal(10, 2)), 97, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 5, 6, CAST(8162.99 AS Decimal(10, 2)), 26, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 5, 9, CAST(8370.03 AS Decimal(10, 2)), 2, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 4, 4, CAST(5288.10 AS Decimal(10, 2)), 85, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 6, 2, CAST(6803.42 AS Decimal(10, 2)), 67, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 8, 8, CAST(6776.95 AS Decimal(10, 2)), 53, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 3, 9, CAST(5655.97 AS Decimal(10, 2)), 24, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 2, 5, CAST(1180.83 AS Decimal(10, 2)), 43, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 3, 8, CAST(7324.45 AS Decimal(10, 2)), 89, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 2, 2, CAST(2636.11 AS Decimal(10, 2)), 12, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 2, 1, CAST(1757.94 AS Decimal(10, 2)), 85, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 7, 10, CAST(6856.03 AS Decimal(10, 2)), 37, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 8, 6, CAST(4838.11 AS Decimal(10, 2)), 54, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, 6, 6, CAST(8925.22 AS Decimal(10, 2)), 64, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 6, 2, CAST(3625.75 AS Decimal(10, 2)), 56, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 3, 9, CAST(8507.58 AS Decimal(10, 2)), 3, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 4, 6, CAST(3444.19 AS Decimal(10, 2)), 78, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 3, 10, CAST(1206.43 AS Decimal(10, 2)), 5, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 4, 1, CAST(6727.29 AS Decimal(10, 2)), 37, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 9, 9, CAST(8886.64 AS Decimal(10, 2)), 67, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 5, 10, CAST(3086.82 AS Decimal(10, 2)), 46, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 2, 4, CAST(6823.26 AS Decimal(10, 2)), 20, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 6, 8, CAST(8126.48 AS Decimal(10, 2)), 10, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 5, 2, CAST(2586.69 AS Decimal(10, 2)), 69, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 2, 3, CAST(1481.64 AS Decimal(10, 2)), 48, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 6, 5, CAST(4283.43 AS Decimal(10, 2)), 47, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 5, 1, CAST(6898.90 AS Decimal(10, 2)), 51, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 2, 9, CAST(8062.80 AS Decimal(10, 2)), 98, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 2, 6, CAST(9356.90 AS Decimal(10, 2)), 61, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 8, 8, CAST(8158.52 AS Decimal(10, 2)), 20, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 5, 5, CAST(2833.03 AS Decimal(10, 2)), 26, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 5, 2, CAST(7388.75 AS Decimal(10, 2)), 50, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 6, 8, CAST(6228.25 AS Decimal(10, 2)), 79, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 1, 11, CAST(6404.14 AS Decimal(10, 2)), 45, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 6, 2, CAST(7320.27 AS Decimal(10, 2)), 94, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 9, 7, CAST(1617.30 AS Decimal(10, 2)), 3, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 5, 4, CAST(2003.61 AS Decimal(10, 2)), 44, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6859859' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 4, 9, CAST(9858.86 AS Decimal(10, 2)), 36, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 8, 8, CAST(4216.48 AS Decimal(10, 2)), 59, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 9, 11, CAST(8187.97 AS Decimal(10, 2)), 69, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 5, 11, CAST(3073.53 AS Decimal(10, 2)), 87, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 3, 1, CAST(2151.61 AS Decimal(10, 2)), 91, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 5, 7, CAST(4149.29 AS Decimal(10, 2)), 32, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 7, 4, CAST(4949.95 AS Decimal(10, 2)), 37, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 1, 3, CAST(1334.73 AS Decimal(10, 2)), 69, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 5, 7, CAST(9620.01 AS Decimal(10, 2)), 11, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 8, 7, CAST(4092.23 AS Decimal(10, 2)), 95, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 1, 1, CAST(5636.90 AS Decimal(10, 2)), 87, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, 3, 10, CAST(7972.63 AS Decimal(10, 2)), 59, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 6, 10, CAST(1271.22 AS Decimal(10, 2)), 26, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 2, 4, CAST(4293.24 AS Decimal(10, 2)), 73, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 6, 5, CAST(9234.49 AS Decimal(10, 2)), 56, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 9, 6, CAST(2666.50 AS Decimal(10, 2)), 61, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 4, 7, CAST(4203.29 AS Decimal(10, 2)), 44, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, 1, 4, CAST(4457.26 AS Decimal(10, 2)), 60, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 4, 3, CAST(4401.01 AS Decimal(10, 2)), 20, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 7, 3, CAST(3844.75 AS Decimal(10, 2)), 51, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 5, 3, CAST(8121.42 AS Decimal(10, 2)), 71, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 7, 5, CAST(3624.25 AS Decimal(10, 2)), 22, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 4, 5, CAST(2418.42 AS Decimal(10, 2)), 22, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 7, 6, CAST(3098.85 AS Decimal(10, 2)), 10, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 7, 7, CAST(1113.34 AS Decimal(10, 2)), 27, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 6, 7, CAST(1359.69 AS Decimal(10, 2)), 83, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 8, 7, CAST(3519.37 AS Decimal(10, 2)), 64, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 7, 3, CAST(2820.82 AS Decimal(10, 2)), 21, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 1, 2, CAST(3360.83 AS Decimal(10, 2)), 46, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 6, 7, CAST(6418.16 AS Decimal(10, 2)), 62, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6874504' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 2, 10, CAST(1960.32 AS Decimal(10, 2)), 33, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 1, 3, CAST(3095.73 AS Decimal(10, 2)), 33, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 3, 8, CAST(9403.83 AS Decimal(10, 2)), 56, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, 5, 10, CAST(3173.40 AS Decimal(10, 2)), 3, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 9, 10, CAST(3014.49 AS Decimal(10, 2)), 69, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 8, 10, CAST(1550.23 AS Decimal(10, 2)), 25, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 4, 11, CAST(4014.69 AS Decimal(10, 2)), 38, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 1, 8, CAST(3040.89 AS Decimal(10, 2)), 61, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 6, 5, CAST(9056.65 AS Decimal(10, 2)), 73, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 5, 10, CAST(7855.44 AS Decimal(10, 2)), 38, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 3, 5, CAST(2416.79 AS Decimal(10, 2)), 63, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 5, 7, CAST(4447.04 AS Decimal(10, 2)), 51, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, 5, 1, CAST(7501.82 AS Decimal(10, 2)), 76, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 2, 2, CAST(2506.82 AS Decimal(10, 2)), 29, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, 6, 5, CAST(8493.34 AS Decimal(10, 2)), 88, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 3, 7, CAST(5559.93 AS Decimal(10, 2)), 84, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 5, 10, CAST(2327.19 AS Decimal(10, 2)), 41, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 6, 3, CAST(4473.39 AS Decimal(10, 2)), 32, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 7, 11, CAST(2395.39 AS Decimal(10, 2)), 40, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 3, 11, CAST(5894.46 AS Decimal(10, 2)), 35, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999, CAST(N'2023-06-09T21:33:59.6886339' AS DateTime2), 99999)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (101, 1, 1, CAST(0.00 AS Decimal(10, 2)), 10, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (102, 1, 1, CAST(0.00 AS Decimal(10, 2)), 10, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (103, 1, 1, CAST(0.00 AS Decimal(10, 2)), 10, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0, CAST(N'2023-06-17T00:48:12.9100000' AS DateTime2), 0)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (105, 2, 3, CAST(2005.10 AS Decimal(10, 2)), 34, CAST(N'2023-06-16T20:55:21.4166667' AS DateTime2), 34, CAST(N'2023-06-17T00:06:25.3400000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (106, 4, 5, CAST(5000.34 AS Decimal(10, 2)), 34, CAST(N'2023-06-16T21:00:35.0533333' AS DateTime2), 34, CAST(N'2023-06-16T21:00:35.0533333' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (107, 8, 10, CAST(200.00 AS Decimal(10, 2)), 34, CAST(N'2023-06-16T21:49:00.3600000' AS DateTime2), 34, CAST(N'2023-06-16T21:49:00.3600000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (109, 5, 7, CAST(500.00 AS Decimal(10, 2)), 34, CAST(N'2023-06-17T00:06:42.1866667' AS DateTime2), 34, CAST(N'2023-06-17T00:06:42.1866667' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (110, 4, 5, CAST(500.00 AS Decimal(10, 2)), 34, CAST(N'2023-06-17T00:08:30.0400000' AS DateTime2), 34, CAST(N'2023-06-17T00:08:30.0400000' AS DateTime2), 34)
GO
INSERT [dbo].[Expenses] ([ExpenseId], [ExpenseTypeId], [ExpenseSubTypeId], [ExpenseAmount], [SubmittedByUserId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (111, 2, 3, CAST(450.00 AS Decimal(10, 2)), 34, CAST(N'2023-06-17T00:08:51.8733333' AS DateTime2), 34, CAST(N'2023-06-17T00:08:51.8733333' AS DateTime2), 34)
GO
SET IDENTITY_INSERT [dbo].[Expenses] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseSubTypesRef] ON 
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 1, N'Flight Ticket', CAST(N'2023-06-09T21:13:57.5762105' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:57.5762105' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 1, N'Rental Car', CAST(N'2023-06-09T21:14:04.2917093' AS DateTime2), 99999, CAST(N'2023-06-09T21:14:04.2917093' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 2, N'Meals', CAST(N'2023-06-09T21:14:36.1413190' AS DateTime2), 99999, CAST(N'2023-06-09T21:14:36.1413190' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 3, N'Relocation', CAST(N'2023-06-09T21:15:00.4440036' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:00.4440036' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 4, N'Tution Reimbursement', CAST(N'2023-06-09T21:15:09.0900237' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:09.0900237' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 4, N'Courses', CAST(N'2023-06-09T21:15:15.1574242' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:15.1574242' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 5, N'Professional subscriptions', CAST(N'2023-06-09T21:15:33.6301513' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:33.6301513' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 6, N'Mileage', CAST(N'2023-06-09T21:15:41.0054549' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:41.0054549' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 7, N'dependent care', CAST(N'2023-06-09T21:15:54.1232337' AS DateTime2), 99999, CAST(N'2023-06-09T21:15:54.1232337' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 8, N'Gifts', CAST(N'2023-06-09T21:16:03.8508961' AS DateTime2), 99999, CAST(N'2023-06-09T21:16:03.8508961' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId], [ExpenseTypeId], [ExpenseSubTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 9, N'Personal Loan', CAST(N'2023-06-09T21:17:01.9865978' AS DateTime2), 99999, CAST(N'2023-06-09T21:17:01.9865978' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[ExpenseSubTypesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseTypesRef] ON 
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Travel', CAST(N'2023-06-09T21:12:35.1741293' AS DateTime2), 99999, CAST(N'2023-06-09T21:12:35.1741293' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Business meals', CAST(N'2023-06-09T21:12:41.1143222' AS DateTime2), 99999, CAST(N'2023-06-09T21:12:41.1143222' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Moving expenses', CAST(N'2023-06-09T21:12:49.8698598' AS DateTime2), 99999, CAST(N'2023-06-09T21:12:49.8698598' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Continuing education', CAST(N'2023-06-09T21:12:55.5487419' AS DateTime2), 99999, CAST(N'2023-06-09T21:12:55.5487419' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, N'Dues and subscriptions', CAST(N'2023-06-09T21:13:01.3992974' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:01.3992974' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, N'Business use of your car', CAST(N'2023-06-09T21:13:06.3718855' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:06.3718855' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, N'Child and/or dependent care', CAST(N'2023-06-09T21:13:12.6023329' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:12.6023329' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, N'Client gifts', CAST(N'2023-06-09T21:13:18.1724902' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:18.1724902' AS DateTime2), 99999)
GO
INSERT [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId], [ExpenseTypeDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, N'Employee loans', CAST(N'2023-06-09T21:13:23.8335168' AS DateTime2), 99999, CAST(N'2023-06-09T21:13:23.8335168' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[ExpenseTypesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[LogIn] ON 
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 5, N'119842E7-173D-3B29-ECCA-DA2B18C8C19B', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 94, N'7E5EC224-7EBD-3B45-91E5-BA5D63A69018', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 39, N'AA18306E-805C-CC40-BD91-D58D7BCF94AB', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 20, N'9BFE6C26-930D-859A-BAE1-D76C4AB21812', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 74, N'894D7E52-3211-1130-B0B2-CDBDA66A4477', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 42, N'D1440D33-DB9D-2631-606D-DE28BAA01DA7', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 44, N'C613A5AC-9178-EC06-0EA7-5933A4548252', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 77, N'E486BECB-B463-F4D5-6FC9-B7E5AD9DCB03', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 33, N'AD529711-0E1D-C2CE-93A0-50C2929D575A', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 51, N'953EA732-8BC4-8159-BC46-896597552482', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 11, N'D151487D-0A7C-4A83-D755-95781855AE38', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 99, N'A9E4F406-368D-BE63-336D-38456606CAF5', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 97, N'AE819A9D-94B0-81DA-0172-A4E39AA6B3F5', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 4, N'35D6B615-45C8-DDA6-E4EF-E1EC896BA8EA', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 89, N'53B0A3E5-E4A5-D5B4-972C-5BE940864985', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 96, N'5C62813E-7419-547C-EA43-6D12CC89695D', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 17, N'D668D23E-4B38-B728-1AB0-58453D2A721C', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 77, N'2FA02223-6C10-81A0-36C6-65E82CE97E9E', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 99, N'94917258-B53C-1257-9C15-0B91E4C55023', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 84, N'D27EC1E2-F739-E467-3EA8-C0347328F1EB', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 46, N'5B8895AD-939B-3DC6-9621-53EEE464B0B4', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 16, N'EB5B2D28-D50B-96B3-6776-EA62B73D9C13', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 98, N'68484D64-27FB-4A0E-20D5-694362CEF656', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 54, N'44499C3F-BB48-293D-E47C-29A8BCCC1D1C', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 56, N'2B7D9FA7-5EFC-4E3B-34C6-2EA3E0ACB08A', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 40, N'5E98E3BD-E071-6D3F-D598-565CD4BC3753', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 48, N'5945E49D-5253-8751-75CE-CE2066E8DCAA', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 12, N'ABCEC183-0E35-11A6-545D-695C413B9FBB', CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3914986' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 69, N'8978C089-C9A6-D579-2362-1C4BEAEA9C5A', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 33, N'41E7EC4E-D3D4-DCED-6987-74B6DE4DABE8', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 68, N'3E79DCF6-64CF-32A4-14CB-19F386849385', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 82, N'77E45374-73C8-4381-ACCE-D3A67289548E', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 47, N'60D15D5E-68DB-611F-61C8-F0C46D7885EE', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 5, N'9B8B47DF-AE0B-9E58-96CA-524394F5FC65', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 62, N'AABB32D1-762E-F8BD-AB88-C96146B401F4', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 36, N'56DECBDC-5694-EF5D-07C1-79A7673682DC', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 90, N'2AA22C39-B252-1B69-4851-41A2FEBE314B', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 97, N'4E0A6AA7-BAFC-C98C-8D2A-5BE46E89D5EE', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 17, N'269977A8-C263-7D8F-2AEF-848710270281', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 8, N'99BAC1D6-4CAD-59E3-D68E-A62A6A1CF107', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 77, N'37FA3A86-191F-51BA-28B5-8439A2217BA6', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 44, N'BA8972BC-6E3E-AC7E-A804-18BDB18B802C', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 17, N'DA1598DE-9737-B954-8C0D-098B1E069633', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 84, N'54793D2E-0811-B716-19DA-8613D5F19FAF', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 52, N'D9D72152-74A4-1FDD-0532-65BD7EE370B1', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 78, N'17952474-A755-7E53-5D81-BDB19E04CFBC', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 66, N'BF3650B1-8E61-51AD-A74F-1AAC4F52CEA5', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 73, N'46ECD3B9-526F-39EE-BD50-3363B9AA2371', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 98, N'BC465314-492C-B422-4B4B-6389CED47622', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 57, N'4A0A846E-989C-256C-B820-76C59E8E9E3C', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 81, N'CCD9D927-8229-1B55-1667-E454C8939DE2', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 95, N'156427EE-1F7B-3D3C-229B-0996A429C1C2', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 17, N'E23163DA-256A-B469-418C-C2825F8972DC', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 45, N'EE68E054-C050-B4DB-4527-44E634AE2B88', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 45, N'9D1A343E-2CD1-9822-589E-FCA2797C6101', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 59, N'DE9F7149-14AC-520C-B63B-CF0828796DDB', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 92, N'14C28853-66AF-7749-A281-52EECD4EBD54', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 80, N'DC1182D1-0722-2A89-2A10-3398CC051D29', CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3924966' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 46, N'EEE4CDA9-79C6-3B71-A23D-3C46FBC24C8F', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, 26, N'134DA407-E00E-2546-75ED-B28D2E3D3DCB', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 84, N'8DB48A69-0D4A-9F5C-9545-25D251E29283', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 20, N'D66A241B-0085-7397-363F-B9D296EFECA8', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 21, N'8BCA081A-BAA7-1D28-AE86-DF497422FBA1', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 83, N'BF6344D3-C813-1E98-4545-59D644589F3C', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 79, N'41738778-E7B7-B862-CA82-8D8FA3E2F139', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 79, N'1576DC52-967B-6C9A-C1B7-CBBEA492F861', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 53, N'B85DA8A1-7448-8821-17A8-B333876886C9', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 7, N'ACD75D58-C5E5-17EE-1AAA-5E07F4A2465B', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 46, N'79469A9D-CCCA-1544-69C7-D42839AF884B', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 2, N'59FD47C2-E1EB-EC5E-A999-A084C82DD0B2', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 43, N'EB5C4E39-DC25-FC9F-D3AC-B94F5484EAC5', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 36, N'D89C4CEA-72AC-CAEA-79B5-D51656CE2E5F', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 25, N'2BBCA99B-88AD-5514-EBF3-09A684D8C694', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 74, N'4BDB40D2-23A6-CE29-E040-FAA63FEE2F12', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 6, N'A5F05EBC-15F5-CBDB-897B-A8CD7DF4707D', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 56, N'2862347C-B994-9769-832E-5CB0D6A8CA5A', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 93, N'275BED8D-D58C-5B21-3C11-31D3504FDBD3', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 36, N'FE5713FE-1609-DE95-EF5B-51B58E9E615E', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 72, N'420ACCD3-2513-3826-091D-7147EB0148DA', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 51, N'05D2928A-386C-2D57-7015-EE42F84EA89A', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, 38, N'293BD9C8-6403-A5EC-A315-15997C394D7A', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 86, N'0275C92A-B24D-8496-1C65-9143B39A5CE6', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 10, N'64669922-A881-0748-59CD-5CCDD4D76740', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 18, N'E38A826C-E316-EE65-18D2-83D3153A42D6', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 9, N'AAA4ED18-4616-738E-FC15-6E4D39E2D4B6', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 90, N'C19BCFA2-BEA1-2494-BBD0-F7285F974E20', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 99, N'927B018A-91B2-41F9-47EB-C2C3CBC903D4', CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3934936' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 25, N'81F053A8-92FE-C867-489D-1DB17A542476', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 26, N'5D8640A3-576D-3DFB-B74A-3D2CEBD41B26', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, 2, N'A30565E6-7A9B-848A-8084-097CE8264AD4', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 36, N'56618340-42D9-885C-AB4A-8F888FB0539E', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, 29, N'52F16344-83FD-48B7-CBC8-7EAF733265A7', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 47, N'84433E75-BB13-583B-8189-EAAFE54118B0', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 28, N'CBC64181-34A1-768B-5DD1-849F00B9B942', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 32, N'5F2D7198-53EC-191E-53B2-9EB189A4B30B', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 78, N'C3E71293-ECE6-E690-2957-E0DA5EC6C265', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 50, N'A106347E-9EB6-17A9-54C9-2D232A7B749D', CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:50.3944898' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (102, 34, NULL, CAST(N'2023-06-16T15:29:51.4148772' AS DateTime2), 99999, CAST(N'2023-06-16T15:29:51.4148772' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (103, 15, N'string', CAST(N'2023-06-16T15:55:17.5847710' AS DateTime2), 99999, CAST(N'2023-06-16T15:55:17.5847710' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (108, 106, N'', CAST(N'2023-06-16T17:01:15.5192390' AS DateTime2), 99999, CAST(N'2023-06-16T17:01:15.5192390' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (109, 107, N'', CAST(N'2023-06-16T17:03:06.3528444' AS DateTime2), 99999, CAST(N'2023-06-16T17:03:06.3528444' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (111, 109, N'', CAST(N'2023-06-16T17:17:26.8797170' AS DateTime2), 99999, CAST(N'2023-06-16T17:17:26.8797170' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (112, 110, N'', CAST(N'2023-06-16T18:50:27.4407067' AS DateTime2), 99999, CAST(N'2023-06-16T18:50:27.4407067' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (113, 19, NULL, CAST(N'2023-06-16T19:00:11.3299217' AS DateTime2), 99999, CAST(N'2023-06-16T19:00:11.3299217' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (114, 111, N'', CAST(N'2023-06-16T19:03:52.4033036' AS DateTime2), 99999, CAST(N'2023-06-16T19:03:52.4033036' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (115, 112, N'', CAST(N'2023-06-16T19:07:01.5987188' AS DateTime2), 99999, CAST(N'2023-06-16T19:07:01.5987188' AS DateTime2), 99999)
GO
INSERT [dbo].[LogIn] ([LogInId], [UserId], [FirebaseId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (116, 113, N'', CAST(N'2023-06-16T19:12:56.5653166' AS DateTime2), 99999, CAST(N'2023-06-16T19:12:56.5653166' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[LogIn] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesRef] ON 
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Employee', CAST(N'2023-06-09T21:11:27.5009731' AS DateTime2), 99999, CAST(N'2023-06-09T21:11:27.5009731' AS DateTime2), 99999)
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Team Manager', CAST(N'2023-06-09T21:11:33.8177645' AS DateTime2), 99999, CAST(N'2023-06-09T21:11:33.8177645' AS DateTime2), 99999)
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Director', CAST(N'2023-06-09T21:11:37.9050901' AS DateTime2), 99999, CAST(N'2023-06-09T21:11:37.9050901' AS DateTime2), 99999)
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Auditor', CAST(N'2023-06-09T21:11:42.0543944' AS DateTime2), 99999, CAST(N'2023-06-09T21:11:42.0543944' AS DateTime2), 99999)
GO
INSERT [dbo].[RolesRef] ([RoleRefId], [RoleDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, N'CEO', CAST(N'2023-06-09T21:11:47.3650989' AS DateTime2), 99999, CAST(N'2023-06-09T21:11:47.3650989' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[RolesRef] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusRef] ON 
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Submitted', CAST(N'2023-06-09T21:10:40.8143519' AS DateTime2), 99999, CAST(N'2023-06-09T21:10:40.8143519' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Approved', CAST(N'2023-06-09T21:10:45.3116917' AS DateTime2), 99999, CAST(N'2023-06-09T21:10:45.3116917' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Rejected', CAST(N'2023-06-09T21:10:49.2883191' AS DateTime2), 99999, CAST(N'2023-06-09T21:10:49.2883191' AS DateTime2), 99999)
GO
INSERT [dbo].[StatusRef] ([StatusRefId], [StatusDescription], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Sent for Revision', CAST(N'2023-06-09T21:10:57.2714201' AS DateTime2), 99999, CAST(N'2023-06-09T21:10:57.2714201' AS DateTime2), 99999)
GO
SET IDENTITY_INSERT [dbo].[StatusRef] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, N'Arsenio', N'Hunter', N'3314 Et Avenue', N'488-2584 Metus. Street', N'Chandler', N'NV', N'17321', N'lobortis.nisi@google.ca', 1, 1, CAST(N'2022-06-26T08:13:56.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, N'Moana', N'Dominguez', N'923-3279 Proin Road', N'484-5143 Est St.', N'Sterling Heights', N'MT', N'81757', N'et.nunc@hotmail.net', 1, 1, CAST(N'2024-03-19T17:01:36.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, N'Azalia', N'Harrison', N'Ap #594-7326 Nullam St.', N'1463 Vel Ave', N'Georgia', N'CO', N'20427', N'sit.amet@google.com', 2, 0, CAST(N'2022-09-27T01:51:10.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, N'Clementine', N'Randolph', N'Ap #434-7736 Phasellus St.', N'Ap #461-5270 Mauris. Road', N'Tucson', N'IL', N'46166', N'adipiscing.lobortis.risus@yahoo.com', 2, 0, CAST(N'2023-12-18T00:16:47.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, N'Garrison', N'Jacobson', N'6683 Feugiat Rd.', N'Ap #261-5903 Tortor. Av.', N'Lewiston', N'OH', N'58289', N'orci@hotmail.couk', 1, 1, CAST(N'2023-07-30T00:18:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, N'Haviva', N'Vasquez', N'141-7818 Dui Road', N'7904 At, Ave', N'Great Falls', N'NV', N'99720', N'eu.euismod@yahoo.couk', 1, 0, CAST(N'2022-11-15T21:57:55.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, N'Beatrice', N'Manning', N'Ap #955-6703 Vestibulum Ave', N'715-3162 Vel, Rd.', N'Spokane', N'VA', N'75658', N'dapibus.id@yahoo.edu', 2, 1, CAST(N'2023-12-25T00:42:29.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, N'Mira', N'Bruce', N'Ap #266-1353 Tristique Rd.', N'Ap #266-1353 Tristique Rd.', N'Fort Smith', N'VT', N'82908', N'non.leo@google.com', 2, 0, CAST(N'2022-09-19T00:50:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-16T13:23:41.7133333' AS DateTime2), 8)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, N'Hiram', N'Marshall', N'8366 Quam. Ave', N'Ap #843-5052 Nibh St.', N'Tucson', N'WA', N'77297', N'donec.elementum.lorem@hotmail.ca', 1, 0, CAST(N'2024-01-14T20:35:59.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, N'Brenden', N'Vega', N'587-6071 Cursus Rd.', N'587-6071 Cursus Rd.', N'Tampa', N'CT', N'35555', N'montes.nascetur@aol.org', 1, 1, CAST(N'2023-10-17T15:56:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, N'Randall', N'Payne', N'P.O. Box 583, 4096 Per Rd.', N'Ap #273-9306 Purus St.', N'Naperville', N'MD', N'24227', N'nunc.quisque@yahoo.edu', 2, 0, CAST(N'2023-02-28T19:55:18.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, N'Pandora', N'Stanton', N'820-8016 Arcu. St.', N'Ap #418-9511 Enim Rd.', N'Kansas City', N'AK', N'46560', N'nulla.eu@icloud.net', 2, 0, CAST(N'2022-10-02T08:32:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, N'Lewis', N'Stark', N'Ap #250-5423 Turpis. St.', N'Ap #210-7860 Egestas Rd.', N'Denver', N'AL', N'18272', N'nisl.sem@aol.com', 1, 0, CAST(N'2022-08-11T21:34:53.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, N'Nissim', N'Jackson', N'5238 A, Rd.', N'3877 Mauris St.', N'Jackson', N'WA', N'31580', N'leo@protonmail.ca', 1, 0, CAST(N'2023-06-10T13:03:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, N'Dorian', N'Floyd', N'P.O. Box 582, 124 Pede. Street', N'Ap #349-5089 Tincidunt. Road', N'Kenosha', N'LA', N'96857', N'ante.bibendum.ullamcorper@google.couk', 2, 0, CAST(N'2022-07-10T03:53:47.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, N'Adam', N'Marks', N'474-2110 Velit. St.', N'P.O. Box 790, 8711 Tempor Street', N'Birmingham', N'IA', N'72688', N'ullamcorper.magna@icloud.com', 2, 0, CAST(N'2023-05-01T21:16:40.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, N'Hyacinth', N'Peck', N'927-8233 Quis Road', N'Ap #594-5820 Venenatis Rd.', N'Detroit', N'MO', N'57844', N'lacinia.sed@google.ca', 1, 0, CAST(N'2023-12-12T00:06:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, N'Britanney', N'Meyer', N'676-8869 Dignissim. Av.', N'Ap #151-8766 Sit St.', N'Fairbanks', N'KS', N'72066', N'metus.in@protonmail.com', 1, 0, CAST(N'2022-07-01T05:38:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, N'Nichole', N'Garner', N'P.O. Box 380, 1889 Molestie Rd.', N'P.O. Box 624, 1255 Neque. St.', N'Sandy', N'AR', N'61515', N'sed.malesuada@icloud.com', 2, 1, CAST(N'2023-11-18T20:17:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, N'Idona', N'Bartlett', N'Ap #963-7680 Risus. Rd.', N'P.O. Box 714, 4108 Nisl Street', N'Cambridge', N'UT', N'21712', N'lorem.ipsum.sodales@google.couk', 2, 1, CAST(N'2023-08-01T11:36:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8939590' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, N'Carson', N'Ortega', N'976-8673 Imperdiet St.', N'Ap #319-1252 Eget, Ave', N'Kenosha', N'VA', N'42174', N'non@yahoo.com', 1, 0, CAST(N'2023-04-17T19:45:31.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, N'Yoshio', N'Stevenson', N'608-1753 Id, Avenue', N'962-5635 Eleifend Avenue', N'Boise', N'IN', N'35614', N'aliquam.erat@google.ca', 1, 0, CAST(N'2022-06-24T09:18:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, N'Cailin', N'Coleman', N'Ap #786-1118 Porttitor Av.', N'P.O. Box 592, 7136 Lorem St.', N'Bridgeport', N'CO', N'62305', N'enim@aol.net', 2, 1, CAST(N'2022-06-24T12:59:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, N'Charde', N'Huff', N'228-5811 Sit Rd.', N'P.O. Box 733, 1659 Magna. Street', N'Fresno', N'HI', N'52355', N'a.facilisis@yahoo.ca', 2, 0, CAST(N'2023-06-12T03:36:53.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, N'Benjamin', N'Williams', N'9966 Cursus Av.', N'P.O. Box 926, 5933 Turpis Rd.', N'Newark', N'KS', N'84621', N'adipiscing.elit@protonmail.net', 1, 0, CAST(N'2022-10-28T21:11:36.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, N'Vivian', N'Mack', N'Ap #284-5027 Euismod Av.', N'165-967 Molestie Rd.', N'Dover', N'WY', N'66231', N'nec.mollis@icloud.net', 1, 0, CAST(N'2022-07-16T07:14:26.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, N'Clark', N'Huff', N'Ap #876-5528 Massa. St.', N'385-5431 Neque Av.', N'Waterbury', N'WI', N'55565', N'tempus@aol.org', 2, 0, CAST(N'2022-11-22T20:53:25.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, N'Dean', N'Wilkinson', N'773-5056 Quis, Rd.', N'250-7026 Eget Rd.', N'Aurora', N'ME', N'36343', N'fusce.aliquam@yahoo.org', 2, 0, CAST(N'2023-07-01T08:04:27.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, N'Lillian', N'Craft', N'P.O. Box 655, 8110 Cras St.', N'194 Lectus St.', N'Rochester', N'ID', N'71133', N'mi.tempor.lorem@google.com', 1, 0, CAST(N'2022-07-25T02:37:16.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, N'Connor', N'O''Neill', N'Ap #173-8182 Sem St.', N'Ap #838-6068 Aliquam Av.', N'Bowling Green', N'OK', N'42320', N'enim@google.net', 1, 0, CAST(N'2023-08-07T21:43:37.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, N'Jena', N'Orr', N'8048 Risus Road', N'Ap #987-1734 Aenean Rd.', N'Kansas City', N'MI', N'32269', N'dolor.tempus.non@outlook.net', 2, 0, CAST(N'2022-07-21T22:13:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, N'Wyatt', N'Kennedy', N'1083 Aliquam Av.', N'581-5160 Auctor, Avenue', N'New Haven', N'OH', N'48174', N'facilisis@hotmail.couk', 2, 0, CAST(N'2023-02-05T08:53:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, N'Baker', N'Burt', N'107-2546 Quis Rd.', N'P.O. Box 259, 3788 Odio, Avenue', N'Frankfort', N'VA', N'38563', N'nunc@google.couk', 1, 0, CAST(N'2024-05-31T15:31:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, N'Jamie', N'Bishop', N'753-8352 Vitae Road', N'753-8352 Vitae Road', N'Fort Worth', N'TX', N'77215', N'tincidunt.donec@hotmail.com', 1, 1, CAST(N'2023-04-06T09:49:15.0000000' AS DateTime2), 99999, CAST(N'2023-06-15T22:12:42.2933333' AS DateTime2), 34)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, N'Priscilla', N'Kim', N'Ap #477-2159 Ullamcorper St.', N'3807 Elit. Ave', N'Tuscaloosa', N'DE', N'16512', N'fusce.feugiat@icloud.edu', 2, 0, CAST(N'2023-10-18T18:59:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, N'Rae', N'Sellers', N'Ap #128-7763 Velit. Av.', N'Ap #828-4937 Imperdiet Rd.', N'Kansas City', N'CT', N'85123', N'iaculis.nec@yahoo.ca', 2, 1, CAST(N'2023-03-24T21:32:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, N'Naomi', N'Brady', N'Ap #388-3118 Eleifend St.', N'P.O. Box 979, 1238 Placerat. St.', N'Cincinnati', N'VT', N'88536', N'luctus.vulputate@outlook.com', 1, 0, CAST(N'2023-01-20T06:57:08.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, N'Gage', N'Harvey', N'731-9623 Risus. St.', N'P.O. Box 402, 7503 Lectus Avenue', N'Seattle', N'IL', N'72473', N'ante.iaculis@google.net', 1, 1, CAST(N'2024-05-08T10:35:21.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, N'Denton', N'Summers', N'846-8819 Nonummy Street', N'Ap #114-4842 Tortor. Street', N'Independence', N'WI', N'33137', N'lorem.ipsum@google.org', 2, 0, CAST(N'2023-01-05T18:08:08.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, N'Reuben', N'Kemp', N'258-5511 Volutpat Avenue', N'985-7861 Nibh. Rd.', N'Vancouver', N'IN', N'84886', N'nisi.cum@yahoo.org', 2, 0, CAST(N'2023-02-27T13:32:28.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8954648' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, N'Hakeem', N'Matthews', N'Ap #483-4303 Scelerisque Road', N'Ap #925-1206 Elit. St.', N'Lewiston', N'WI', N'92274', N'volutpat.nulla.dignissim@icloud.org', 1, 0, CAST(N'2022-08-01T04:48:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, N'Bernard', N'Spencer', N'920-4345 Mauris. St.', N'612-7932 Massa Av.', N'Sioux City', N'MI', N'33471', N'mi@aol.ca', 1, 1, CAST(N'2022-06-05T17:59:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, N'Inez', N'Gomez', N'457-7808 Duis Avenue', N'297-4316 Eu Ave', N'Fairbanks', N'MS', N'68331', N'libero.proin@aol.couk', 2, 0, CAST(N'2023-07-17T19:17:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, N'Jorden', N'Shields', N'P.O. Box 586, 7662 Quis Avenue', N'Ap #708-8864 Ante St.', N'Jefferson City', N'AL', N'35781', N'sed@aol.couk', 2, 0, CAST(N'2023-05-09T12:26:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, N'Alexander', N'Ingram', N'182-6506 Lorem Av.', N'P.O. Box 609, 7791 Iaculis Rd.', N'Hattiesburg', N'AZ', N'56806', N'penatibus.et@hotmail.com', 1, 0, CAST(N'2022-10-21T18:40:07.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, N'Rose', N'Monroe', N'Ap #126-4624 Enim. Ave', N'P.O. Box 168, 3312 Interdum Ave', N'Bellevue', N'NE', N'27898', N'eu.nulla@protonmail.ca', 1, 1, CAST(N'2024-03-05T06:02:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, N'Katelyn', N'Boyd', N'238-7941 Dictum Rd.', N'638-8394 Mattis Av.', N'Nampa', N'MS', N'20658', N'montes.nascetur@aol.edu', 2, 1, CAST(N'2023-06-30T02:15:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, N'Basia', N'Dean', N'Ap #225-8886 Pede. Avenue', N'Ap #144-2886 Aenean Ave', N'Provo', N'NV', N'40488', N'imperdiet.ornare.in@aol.edu', 2, 0, CAST(N'2024-03-28T22:43:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, N'Duncan', N'Herring', N'P.O. Box 202, 9225 Pharetra, Ave', N'Ap #390-6506 Aliquet. Rd.', N'Eugene', N'ME', N'85870', N'congue@aol.edu', 1, 1, CAST(N'2023-05-04T23:09:10.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, N'Jonah', N'Foster', N'137-6541 Tristique Avenue', N'4611 Sem Av.', N'Lakewood', N'MS', N'72914', N'congue@yahoo.com', 1, 1, CAST(N'2022-08-25T01:15:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, N'Rooney', N'Molina', N'P.O. Box 950, 3105 Cras Street', N'Ap #107-8284 Aliquet Street', N'Lawton', N'AR', N'72500', N'adipiscing.elit@google.net', 2, 0, CAST(N'2024-01-04T21:18:22.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, N'Elton', N'Carpenter', N'397-4961 Elit, Rd.', N'4700 Eu St.', N'Fort Wayne', N'ME', N'62792', N'vel.est.tempor@protonmail.couk', 2, 0, CAST(N'2023-03-31T00:09:24.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, N'Burke', N'Schmidt', N'138-9649 Dictum Avenue', N'582-7492 Quam Av.', N'Columbia', N'WI', N'14738', N'vel.pede.blandit@protonmail.ca', 1, 1, CAST(N'2022-11-29T15:31:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, N'Sean', N'Padilla', N'Ap #489-8753 Dolor. Street', N'8664 Donec St.', N'Kansas City', N'MS', N'61757', N'aliquet.vel.vulputate@google.net', 1, 0, CAST(N'2023-12-16T22:23:51.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, N'Serena', N'Santana', N'Ap #501-8547 Orci, Street', N'1321 Vehicula. Rd.', N'Dover', N'IA', N'24577', N'in.consequat@outlook.couk', 2, 0, CAST(N'2023-05-03T12:34:28.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, N'Sean', N'Bullock', N'P.O. Box 671, 6330 Nec Street', N'3735 Vulputate, Ave', N'Davenport', N'AK', N'81667', N'vel.sapien@hotmail.ca', 2, 0, CAST(N'2024-04-13T13:46:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, N'Bernard', N'Pate', N'Ap #281-1461 Risus. Rd.', N'6181 Dignissim Ave', N'Orlando', N'WI', N'42543', N'arcu.sed.et@outlook.net', 1, 0, CAST(N'2023-02-16T16:29:44.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, N'Stephen', N'Delgado', N'P.O. Box 843, 3783 Vel Street', N'P.O. Box 103, 2076 Scelerisque St.', N'Fort Collins', N'CT', N'48158', N'pharetra@hotmail.net', 1, 0, CAST(N'2023-11-29T04:57:37.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, N'Haley', N'House', N'P.O. Box 228, 9476 Mauris Av.', N'2593 Mus. Av.', N'Bozeman', N'OH', N'58826', N'adipiscing.ligula.aenean@hotmail.org', 2, 0, CAST(N'2023-12-08T00:32:01.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, N'Justina', N'Barr', N'714-8974 Et, Rd.', N'150-4484 Ridiculus Road', N'Frankfort', N'KS', N'25670', N'non.dapibus@hotmail.org', 2, 1, CAST(N'2023-12-09T05:32:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, N'Gemma', N'Kelley', N'442-4787 Elit, St.', N'P.O. Box 304, 5284 Risus. Av.', N'Kapolei', N'AZ', N'29326', N'egestas.hendrerit.neque@protonmail.org', 1, 0, CAST(N'2022-10-10T09:09:18.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, N'Henry', N'Payne', N'P.O. Box 117, 4821 Lectus. Ave', N'669-712 Morbi Rd.', N'Anchorage', N'MA', N'19483', N'morbi@icloud.couk', 1, 0, CAST(N'2024-04-03T13:14:03.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, N'Dorothy', N'Hays', N'P.O. Box 196, 8696 Id, St.', N'6535 Mollis Road', N'Portland', N'KY', N'57225', N'vitae.diam@hotmail.ca', 2, 0, CAST(N'2024-03-27T13:17:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, N'Nolan', N'Newman', N'Ap #746-7605 Quisque Ave', N'Ap #900-9563 Mauris. Road', N'Fort Worth', N'ID', N'34555', N'non.lorem@aol.com', 2, 0, CAST(N'2024-01-16T10:48:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, N'Alan', N'Hopkins', N'8379 Non, Rd.', N'P.O. Box 749, 3849 Augue. Av.', N'Owensboro', N'MN', N'75419', N'eleifend@aol.com', 1, 0, CAST(N'2024-03-30T11:27:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, N'Lana', N'George', N'866-6711 Tortor Ave', N'600-2699 Ultricies St.', N'Lakewood', N'KY', N'26385', N'ac.mi@yahoo.edu', 1, 0, CAST(N'2023-05-17T05:43:16.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, N'Mira', N'Evans', N'Ap #159-2049 Augue Ave', N'813 Non Road', N'Houston', N'CA', N'36749', N'morbi.metus@hotmail.ca', 2, 1, CAST(N'2023-03-10T17:50:30.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, N'Quynn', N'Bush', N'P.O. Box 338, 3795 Nec Rd.', N'7797 Mollis. Road', N'Covington', N'PA', N'24386', N'odio.semper.cursus@yahoo.couk', 2, 1, CAST(N'2024-01-18T16:54:57.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, N'Indira', N'Goodwin', N'5855 Eu Av.', N'Ap #681-3399 Pharetra Street', N'Virginia Beach', N'MA', N'55391', N'fusce.mi@google.com', 1, 0, CAST(N'2022-09-15T19:52:21.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, N'Pandora', N'Becker', N'Ap #824-8980 Felis. St.', N'8391 Vitae Ave', N'Kapolei', N'PA', N'77645', N'mus@yahoo.edu', 1, 1, CAST(N'2023-05-02T07:30:13.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8964963' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, N'Hedy', N'Baker', N'P.O. Box 791, 4760 Sed Ave', N'842-6671 Enim Rd.', N'Des Moines', N'GA', N'83667', N'massa.mauris.vestibulum@google.org', 2, 0, CAST(N'2023-06-02T08:44:26.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, N'Katelyn', N'Foley', N'523-1092 Ut Road', N'Ap #988-783 Blandit Av.', N'Dallas', N'FL', N'84375', N'et.magnis@google.com', 2, 1, CAST(N'2023-04-24T10:11:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, N'Beau', N'Crane', N'9523 Sit Avenue', N'P.O. Box 323, 3816 Magna. St.', N'Oklahoma City', N'TN', N'16768', N'arcu.ac@aol.com', 1, 0, CAST(N'2023-06-28T04:25:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, N'Vance', N'Gilmore', N'Ap #977-2456 Semper Street', N'Ap #454-6636 At Rd.', N'Duluth', N'MA', N'81518', N'consectetuer@protonmail.edu', 1, 0, CAST(N'2023-09-13T11:53:12.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, N'Cole', N'Sanders', N'Ap #361-7089 Vulputate, St.', N'1717 A Avenue', N'Pocatello', N'HI', N'25812', N'at.velit@icloud.org', 2, 1, CAST(N'2023-01-08T11:46:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, N'Jennifer', N'Kent', N'670-9305 Pellentesque Rd.', N'P.O. Box 937, 7289 Diam St.', N'Savannah', N'WI', N'21167', N'magna.a@hotmail.net', 2, 0, CAST(N'2023-11-06T06:36:48.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, N'Dahlia', N'Vaughan', N'P.O. Box 958, 8997 Ridiculus Road', N'2976 Pharetra. Road', N'Stamford', N'FL', N'75433', N'magna.cras.convallis@protonmail.couk', 1, 1, CAST(N'2022-10-10T01:39:09.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, N'Joelle', N'Cooke', N'141-4819 Hendrerit Street', N'2253 Etiam Road', N'Anchorage', N'UT', N'73684', N'cras.dolor.dolor@icloud.edu', 1, 1, CAST(N'2022-08-01T19:10:00.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, N'Wing', N'Henson', N'P.O. Box 720, 5634 Gravida St.', N'776-5177 Gravida Avenue', N'Bridgeport', N'TX', N'23112', N'cras.interdum.nunc@google.net', 2, 1, CAST(N'2023-12-12T06:44:55.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, N'Lane', N'William', N'587-7938 Lobortis Ave', N'Ap #804-2580 Suspendisse Av.', N'Juneau', N'ID', N'63204', N'porta@aol.edu', 2, 1, CAST(N'2023-10-28T12:27:23.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, N'Paloma', N'Delaney', N'487-5249 Lorem Road', N'Ap #973-9126 Tellus Rd.', N'Covington', N'HI', N'72672', N'vulputate.lacus.cras@google.net', 1, 0, CAST(N'2024-04-23T19:17:34.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, N'Jael', N'Case', N'Ap #165-5601 Mattis St.', N'6738 Vestibulum Rd.', N'Grand Island', N'OH', N'21836', N'nulla.facilisi.sed@protonmail.net', 1, 1, CAST(N'2022-09-05T08:18:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, N'Giselle', N'English', N'614-4693 Pharetra. Av.', N'117-4613 Velit Street', N'Fort Worth', N'ID', N'56708', N'lacus.mauris@protonmail.edu', 2, 0, CAST(N'2023-12-15T19:53:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, N'Todd', N'Quinn', N'317-9943 Ipsum Street', N'Ap #784-9413 Velit Street', N'Davenport', N'WI', N'79528', N'purus.in@protonmail.edu', 2, 1, CAST(N'2023-02-06T00:57:39.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, N'Ignacia', N'Clay', N'958-4199 Iaculis St.', N'P.O. Box 799, 1408 Augue St.', N'Pittsburgh', N'CT', N'28818', N'duis@google.org', 1, 0, CAST(N'2022-11-11T22:19:48.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, N'Troy', N'Bowman', N'P.O. Box 571, 4913 Dictum Road', N'Ap #986-8153 Parturient Avenue', N'Springdale', N'DE', N'98224', N'tellus.phasellus@yahoo.com', 1, 1, CAST(N'2023-11-09T19:14:50.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, N'Bevis', N'Mendoza', N'5226 Duis Av.', N'Ap #109-9178 Tincidunt Rd.', N'West Valley City', N'KS', N'72108', N'sapien@google.com', 2, 1, CAST(N'2022-10-13T16:57:06.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, N'Odysseus', N'Conrad', N'Ap #781-3498 Amet Ave', N'571-4838 Ut Rd.', N'Las Vegas', N'IL', N'92796', N'blandit@aol.ca', 2, 0, CAST(N'2023-06-17T18:22:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, N'Harrison', N'Melton', N'P.O. Box 723, 598 Blandit St.', N'406-3924 Vehicula. Avenue', N'Rochester', N'MA', N'37122', N'quisque@aol.com', 1, 1, CAST(N'2023-03-18T16:02:49.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, N'August', N'Mendoza', N'837-9535 Volutpat. Avenue', N'6852 Non, Avenue', N'Olathe', N'IL', N'87918', N'nunc@protonmail.edu', 1, 0, CAST(N'2023-05-24T00:24:24.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, N'Chastity', N'Byers', N'774-2439 Nec, Avenue', N'Ap #974-6055 Cursus St.', N'Iowa City', N'MS', N'22542', N'at.velit@protonmail.org', 2, 0, CAST(N'2024-04-21T05:56:02.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, N'Carson', N'Morton', N'796-7773 Aliquet St.', N'767-4301 Sed Avenue', N'Norman', N'VT', N'47476', N'accumsan@protonmail.com', 2, 0, CAST(N'2024-04-19T21:47:17.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, N'Nadine', N'Payne', N'Ap #391-6378 Sed, Avenue', N'942-9836 Mauris Av.', N'Tallahassee', N'NE', N'67432', N'nascetur.ridiculus@aol.ca', 1, 0, CAST(N'2022-12-05T04:52:00.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, N'Garrison', N'Harrington', N'Ap #721-7242 Ultrices Rd.', N'Ap #858-7014 Integer Avenue', N'Houston', N'CT', N'36577', N'tortor.dictum.eu@icloud.edu', 1, 0, CAST(N'2023-05-14T21:53:41.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, N'Fuller', N'Acevedo', N'1719 Felis Road', N'815-8791 Est Avenue', N'Gary', N'AR', N'40476', N'sociis@protonmail.ca', 2, 0, CAST(N'2023-06-16T19:00:58.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, N'Ulla', N'Rosales', N'767-9422 Feugiat Road', N'Ap #379-5953 Mauris Av.', N'Fayetteville', N'KY', N'75275', N'eleifend@icloud.net', 2, 0, CAST(N'2023-09-26T02:31:33.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, N'Ivor', N'Bauer', N'Ap #740-4950 Penatibus Avenue', N'138-373 Magna Ave', N'Butte', N'MI', N'45430', N'aliquam.eu@hotmail.edu', 1, 1, CAST(N'2023-03-02T23:42:19.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, N'Tasha', N'Wynn', N'P.O. Box 975, 8348 Ante. Rd.', N'636-9618 Nonummy Rd.', N'Joliet', N'MI', N'71667', N'sed.id@google.ca', 1, 0, CAST(N'2022-11-27T06:14:40.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, N'Kellie', N'Oliver', N'786-1812 Fringilla Rd.', N'107-637 Posuere St.', N'Cleveland', N'TN', N'36342', N'fusce@hotmail.ca', 2, 0, CAST(N'2023-12-05T03:41:45.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, N'Uma', N'Mckay', N'P.O. Box 513, 4795 Sapien. Ave', N'Ap #404-7798 Ac Road', N'Racine', N'FL', N'62217', N'semper.egestas@protonmail.com', 2, 1, CAST(N'2024-05-05T20:18:43.0000000' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:29.8978465' AS DateTime2), 99999)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (103, N'GG', N'Doe', N'123 main st', N'Apt 203', N'High Point', N'NC', N'27265', N'gg@me.com', 34, 0, CAST(N'2023-06-16T16:40:08.7064312' AS DateTime2), NULL, CAST(N'2023-06-16T16:40:08.7064312' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (104, N'GG1', N'BOB1', N'123 main st', N'Apt 203', N'Nashville', N'TN', N'32765', N'gg2@me.com', 34, 0, CAST(N'2023-06-16T16:50:07.3411338' AS DateTime2), NULL, CAST(N'2023-06-16T16:50:07.3411338' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (105, N'GG2', N'bob', N'123 Main ST', N'123', N'Nashville', N'TN', N'34567', N'GG3@ME.COM', 34, 0, CAST(N'2023-06-16T16:53:35.4383748' AS DateTime2), NULL, CAST(N'2023-06-16T16:53:35.4383748' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (106, N'GG', N'Bob', N'123 main st', N'34', N'Nashville', N'TN', N'34564', N'gg3@me.com', 34, 0, CAST(N'2023-06-16T17:01:15.5022846' AS DateTime2), NULL, CAST(N'2023-06-16T17:01:15.5022846' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (107, N'GG', N'Bob', N'123 main st', N'34', N'Nashville', N'TN', N'34566', N'GG4@me.com', 34, 0, CAST(N'2023-06-16T17:03:01.8647230' AS DateTime2), NULL, CAST(N'2023-06-16T17:03:01.8647230' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (108, N'gg', N'bob', N'123 main st', N'123', N'nashville', N'TN', N'34567', N'gg5@me.com', 34, 0, CAST(N'2023-06-16T17:11:05.1903642' AS DateTime2), NULL, CAST(N'2023-06-16T17:11:05.1903642' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (109, N'Greg', N'Barnes', N'123 main st', N'123 main st', N'nashville', N'TN', N'34567', N'gg6@me.com', 34, 0, CAST(N'2023-06-16T17:17:24.7826877' AS DateTime2), NULL, CAST(N'2023-06-16T17:17:53.5033333' AS DateTime2), 109)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (110, N'gg6', N'bob', N'123 main st', N'123', N'HG', N'TN', N'34567', N'gg6@me.com', 34, 0, CAST(N'2023-06-16T18:50:11.6595057' AS DateTime2), NULL, CAST(N'2023-06-16T18:50:11.6595057' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (111, N'gg8', N'bob', N'123 main st', N'ttt', N'hg', N'TN', N'34567', N'gg8@me.com', NULL, 1, CAST(N'2023-06-16T19:03:52.3745206' AS DateTime2), NULL, CAST(N'2023-06-16T19:03:52.3745206' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (112, N'gg8', N'bob1', N'123 main st', N'123 st', N'hght', N'TN', N'34657', N'gg8@me.com', 34, 1, CAST(N'2023-06-16T19:07:01.5777719' AS DateTime2), NULL, CAST(N'2023-06-16T19:07:01.5777719' AS DateTime2), NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [AddressLine1], [AddressLine2], [City], [State], [Zip], [EmailId], [ManagerId], [IsManager], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (113, N'gg9', N'bob', N'123 main st', N'233423', N'gppp', N'TN', N'3456', N'gg9@me.com', 34, 1, CAST(N'2023-06-16T19:12:56.5044823' AS DateTime2), NULL, CAST(N'2023-06-16T19:12:56.5044823' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersRoles] ON 
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (1, 61, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (2, 51, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (3, 27, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (4, 94, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (5, 2, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (6, 60, 2, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (7, 59, 1, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (8, 47, 2, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (9, 19, 2, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (10, 15, 3, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0894779' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (11, 87, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (12, 82, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (13, 32, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (14, 60, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (15, 93, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (16, 78, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (17, 87, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (18, 32, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (19, 42, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (20, 11, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (21, 45, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (22, 93, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (23, 9, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (24, 30, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (25, 58, 3, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (26, 18, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (27, 50, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (28, 19, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (29, 87, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (30, 63, 4, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (31, 56, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (32, 51, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (33, 8, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (34, 61, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (35, 52, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (36, 66, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (37, 79, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (38, 29, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (39, 38, 2, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (40, 62, 1, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0912273' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (41, 85, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (42, 16, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (43, 82, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (44, 61, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (45, 17, 4, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (46, 49, 2, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (47, 35, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (48, 52, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (49, 32, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (50, 60, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (51, 27, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (52, 19, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (53, 2, 2, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (54, 31, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (55, 43, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (56, 31, 4, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (57, 17, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (58, 55, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (59, 48, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (60, 59, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (61, 15, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (62, 59, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (63, 8, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (64, 22, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (65, 15, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (66, 14, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (67, 99, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (68, 45, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (69, 31, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (70, 2, 1, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0922584' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (71, 86, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (72, 53, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (73, 53, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (74, 74, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (75, 69, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (76, 21, 4, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (77, 50, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (78, 78, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (79, 34, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (80, 33, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (81, 94, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (82, 38, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (83, 59, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (84, 71, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (85, 34, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (86, 95, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (87, 69, 3, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (88, 98, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (89, 67, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (90, 25, 3, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (91, 68, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (92, 68, 2, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (93, 64, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (94, 68, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (95, 2, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (96, 30, 5, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (97, 24, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (98, 39, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (99, 17, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (100, 28, 1, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999, CAST(N'2023-06-09T21:25:40.0932556' AS DateTime2), 99999)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (102, 1, 2, CAST(N'2023-06-16T21:05:46.3333333' AS DateTime2), 0, CAST(N'2023-06-16T21:05:46.3333333' AS DateTime2), 0)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (103, 108, 1, CAST(N'2023-06-16T17:11:08.6233333' AS DateTime2), NULL, CAST(N'2023-06-16T17:11:08.6233333' AS DateTime2), NULL)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (104, 109, 1, CAST(N'2023-06-16T17:17:26.8833333' AS DateTime2), NULL, CAST(N'2023-06-16T17:17:26.8833333' AS DateTime2), NULL)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (105, 110, 5, CAST(N'2023-06-16T18:50:27.4466667' AS DateTime2), NULL, CAST(N'2023-06-16T18:50:27.4466667' AS DateTime2), NULL)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (106, 111, 2, CAST(N'2023-06-16T19:03:52.4100000' AS DateTime2), NULL, CAST(N'2023-06-16T19:03:52.4100000' AS DateTime2), NULL)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (107, 112, 2, CAST(N'2023-06-16T19:07:01.6066667' AS DateTime2), NULL, CAST(N'2023-06-16T19:07:01.6066667' AS DateTime2), NULL)
GO
INSERT [dbo].[UsersRoles] ([UserRoleId], [UserId], [RoleId], [CreateTS], [CreatedBy], [UpdateTS], [UpdatedBy]) VALUES (108, 113, 2, CAST(N'2023-06-16T19:12:56.5666667' AS DateTime2), NULL, CAST(N'2023-06-16T19:12:56.5666667' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[UsersRoles] OFF
GO
/****** Object:  Index [IDX_ManagerId]    Script Date: 6/17/2023 1:36:06 AM ******/
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
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseSubTypesRef_Expense] FOREIGN KEY([ExpenseSubTypeId])
REFERENCES [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_ExpenseSubTypesRef_Expense]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseTypesRef_Expense] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_ExpenseTypesRef_Expense]
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
