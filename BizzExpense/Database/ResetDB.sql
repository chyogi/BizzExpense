DELETE FROM [dbo].[ApprovalStatus]
DELETE FROM [dbo].[Expenses]
DELETE FROM [dbo].[LogIn]
DELETE FROM [dbo].[Users]
DELETE FROM [dbo].[UsersRoles]
DELETE FROM [dbo].[StatusRef]
DELETE FROM [dbo].[RolesRef]
DELETE FROM [dbo].[ExpenseSubTypesRef]
DELETE FROM [dbo].[ExpenseTypesRef]

SELECT '[dbo].[ApprovalStatus]', COUNT(*) FROM [dbo].[ApprovalStatus]
SELECT '[dbo].[Expenses]', COUNT(*) FROM [dbo].[Expenses]
SELECT '[dbo].[ExpenseSubTypesRef]', COUNT(*) FROM [dbo].[ExpenseSubTypesRef]
SELECT '[dbo].[ExpenseTypesRef]', COUNT(*) FROM [dbo].[ExpenseTypesRef]
SELECT '[dbo].[LogIn]', COUNT(*) FROM [dbo].[LogIn]
SELECT '[dbo].[RolesRef]', COUNT(*) FROM [dbo].[RolesRef]
SELECT '[dbo].[StatusRef]', COUNT(*) FROM [dbo].[StatusRef]
SELECT '[dbo].[Users]',  COUNT(*) FROM [dbo].[Users]
SELECT '[dbo].[UsersRoles]', COUNT(*) FROM [dbo].[UsersRoles]

DBCC CHECKIDENT ('[dbo].[ApprovalStatus]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[Expenses]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[ExpenseSubTypesRef]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[ExpenseTypesRef]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[LogIn]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[RolesRef]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[StatusRef]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[Users]', RESEED, 0);
GO
DBCC CHECKIDENT ('[dbo].[UsersRoles]', RESEED, 0);
GO
