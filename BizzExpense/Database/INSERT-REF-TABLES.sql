USE [BizzExpense]
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
