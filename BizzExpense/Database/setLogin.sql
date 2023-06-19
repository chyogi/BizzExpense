select * from [dbo].[Users]
where userId not in (select userId from [dbo].[LogIn])

INSERT INTO [dbo].[LogIn] (UserId)
select userId from [dbo].[Users]
where userId not in (select userId from [dbo].[LogIn])


select * from [dbo].[Users]
where userId not in (select userId from [dbo].[UsersRoles])

INSERT INTO [dbo].[UsersRoles] (UserId, [RoleId])
select userId, 1 from [dbo].[Users]
where userId not in (select userId from [dbo].[UsersRoles])


select * from [dbo].[Users]
where IsManager = 1

--employee - non.leo@google.com
--manager - tincidunt.donec@hotmail.com