CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [address_line_1] nvarchar(255),
  [address_line_2] nvarchar(255),
  [city] nvarchar(255),
  [state] nvarchar(255),
  [zip] nvarchar(255),
  [email] nvarchar(255),
  [manager_id] int,
  [is_manager] bool,
  [created_at] timestamp
)
GO

CREATE TABLE [users_roles] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [role_id] int,
  [created_at] timestamp
)
GO

CREATE TABLE [status_ref] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [status_description] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [roles_ref] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [description] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [login] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [firebase_id] nvarchar(255),
  [created_at] timestamp
)
GO

CREATE TABLE [expenses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [expense_type] nvarchar(255),
  [expense_sub_type] nvarchar(255),
  [expense_amount] decimal,
  [submitted_by_user_id] int,
  [created_at] timestamp
)
GO

CREATE TABLE [approval_status] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [expense_id] int,
  [status_id] int,
  [message] nvarchar(255),
  [approver_id] int,
  [created_at] timestamp
)
GO

ALTER TABLE [login] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [expenses] ADD FOREIGN KEY ([submitted_by_user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [users] ADD FOREIGN KEY ([id]) REFERENCES [users] ([manager_id])
GO

ALTER TABLE [approval_status] ADD FOREIGN KEY ([approver_id]) REFERENCES [users] ([manager_id])
GO

ALTER TABLE [approval_status] ADD FOREIGN KEY ([expense_id]) REFERENCES [expenses] ([id])
GO

ALTER TABLE [users_roles] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [users_roles] ADD FOREIGN KEY ([role_id]) REFERENCES [roles_ref] ([id])
GO

ALTER TABLE [approval_status] ADD FOREIGN KEY ([status_id]) REFERENCES [status_ref] ([id])
GO
