UPDATE u1
   SET u1.[IsManager] = 0
  from [dbo].[Users] u1
  inner join [dbo].[UsersRoles] ur1 on ur1.UserId = u1.UserId
  inner join [dbo].[RolesRef] rr1 on rr1.RoleRefId = ur1.roleId and rr1.RoleRefId <> 2

  UPDATE u1
   SET u1.[IsManager] = 1
  from [dbo].[Users] u1
  inner join [dbo].[UsersRoles] ur1 on ur1.UserId = u1.UserId
  inner join [dbo].[RolesRef] rr1 on rr1.RoleRefId = ur1.roleId and rr1.RoleRefId = 2