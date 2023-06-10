CREATE DATABASE [BizzExpense]
GO
use [BizzExpense]

CREATE TABLE [Users] (
  [UserId] int PRIMARY KEY IDENTITY(1, 1),
  [FirstName] nvarchar(255),
  [LastName] nvarchar(255),
  [AddressLine1] nvarchar(255),
  [AddressLine2] nvarchar(255),
  [City] nvarchar(255),
  [State] nvarchar(255),
  [Zip] nvarchar(255),
  [EmailId] nvarchar(255),
  [ManagerId] int,
  [IsManager] bit, 
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [UsersRoles] (
  [UserRoleId] int PRIMARY KEY IDENTITY(1, 1),
  [UserId] int,
  [RoleId] int,
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [StatusRef] (
  [StatusRefId] int PRIMARY KEY IDENTITY(1, 1),
  [StatusDescription] nvarchar(255),
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [RolesRef] (
  [RoleRefId] int PRIMARY KEY IDENTITY(1, 1),
  [RoleDescription] nvarchar(255),
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [LogIn] (
  [LogInId] int PRIMARY KEY IDENTITY(1, 1),
  [UserId] int,
  [FirebaseId] nvarchar(255),
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [Expenses] (
  [ExpenseId] int PRIMARY KEY IDENTITY(1, 1),
  [ExpenseTypeId] int,
  [ExpenseSubTypeId] int,
  [ExpenseAmount] decimal(10,2),
  [SubmittedByUserId] int,
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [ApprovalStatus] (
  [ApprovalStatusId] int PRIMARY KEY IDENTITY(1, 1),
  [ExpenseId] int,
  [StatusId] int,
  [Comments] nvarchar(255),
  [ApproverId] int,
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [ExpenseTypesRef] (
  [ExpenseTypeRefId] int PRIMARY KEY IDENTITY(1, 1),
  [ExpenseTypeDescription] nvarchar(255),
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

CREATE TABLE [ExpenseSubTypesRef] (
  [ExpenseSubTypeRefId] int PRIMARY KEY IDENTITY(1, 1),
  [ExpenseTypeId] int,
  [ExpenseSubTypeDescription] nvarchar(255),
  [CreateTS] datetime2 DEFAULT SYSDATETIME(),
  [CreatedBy] int DEFAULT 99999,
  [UpdateTS] datetime2 DEFAULT SYSDATETIME(),
  [UpdatedBy] int DEFAULT 99999
)
GO

ALTER TABLE [Login] 
ADD CONSTRAINT FK_UserLogin 
FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId])
GO

ALTER TABLE [Expenses] 
ADD CONSTRAINT FK_UserExpense
FOREIGN KEY ([SubmittedByUserId]) REFERENCES [Users] ([UserId])
GO

ALTER TABLE [Users] 
ADD CONSTRAINT FK_UserUserManagerId
FOREIGN KEY ([ManagerId]) REFERENCES [Users] ([UserId])
GO

CREATE INDEX IDX_ManagerId
ON Users (ManagerId);
GO 

ALTER TABLE [ApprovalStatus] 
ADD CONSTRAINT FK_UserApprovalStatusManagerId
FOREIGN KEY ([ApproverId]) REFERENCES [Users] ([UserId])
GO

ALTER TABLE [ApprovalStatus] 
ADD CONSTRAINT FK_ExpenseApprovalStatus
FOREIGN KEY ([ExpenseId]) REFERENCES [Expenses] ([ExpenseId])
GO

ALTER TABLE [UsersRoles] 
ADD CONSTRAINT FK_UserUserRole
FOREIGN KEY ([UserId]) REFERENCES [Users] ([UserId])
GO

ALTER TABLE [UsersRoles] 
ADD CONSTRAINT FK_RoleRefUserRole
FOREIGN KEY ([RoleId]) REFERENCES [RolesRef] ([RoleRefId])
GO

ALTER TABLE [ApprovalStatus] 
ADD CONSTRAINT FK_StatusRefApprovalStatus
FOREIGN KEY ([StatusId]) REFERENCES [StatusRef] ([StatusRefId])
GO

ALTER TABLE [ExpenseSubTypesRef]
ADD CONSTRAINT FK_ExpenseTypesRefExpenseSubTypesRef
FOREIGN KEY ([ExpenseTypeId]) REFERENCES [ExpenseTypesRef]  ([ExpenseTypeRefId])
GO

ALTER TABLE [Expenses] 
ADD CONSTRAINT FK_ExpenseTypesRef_Expense
FOREIGN KEY ([ExpenseTypeId]) REFERENCES [dbo].[ExpenseTypesRef] ([ExpenseTypeRefId])
GO

ALTER TABLE [Expenses] 
ADD CONSTRAINT FK_ExpenseSubTypesRef_Expense
FOREIGN KEY ([ExpenseSubTypeId]) REFERENCES [dbo].[ExpenseSubTypesRef] ([ExpenseSubTypeRefId])
GO