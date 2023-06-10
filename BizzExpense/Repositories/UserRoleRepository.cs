using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Utils;

namespace BizzExpense.Repositories
{
	public class UserRoleRepository : BaseRepository, IUserRoleRepository
	{
		public UserRoleRepository(IConfiguration configuration) : base(configuration)
		{
		}

		public IList<UserRoleDto> GetUserRoles(int userId)
		{
			using (var conn = Connection)
			{
				conn.Open();
				using (var cmd = conn.CreateCommand())
				{
					cmd.CommandText = @"
										SELECT ur1.[UserRoleId]
											  ,ur1.[UserId]
											  ,ur1.[RoleId]
											  ,ur1.[CreateTS]  
											  ,ur1.[CreatedBy]  
											  ,ur1.[UpdateTS]  
											  ,ur1.[UpdatedBy]  
											  ,rr1.[RoleDescription]
										  FROM [dbo].[UsersRoles] ur1
										  INNER JOIN [dbo].[RolesRef] rr1 on rr1.RoleRefId = ur1.RoleId
										WHERE ur1.[UserId]= @UserId
										";

					DbUtils.AddParameter(cmd, "@UserId", userId);

					var reader = cmd.ExecuteReader();

					IList<UserRoleDto> userRoles = new List<UserRoleDto>();

					while (reader.Read())
					{
						userRoles.Add(new UserRoleDto()
						{
							UserRoleId = DbUtils.GetInt(reader, "UserRoleId"),
							UserId = DbUtils.GetInt(reader, "UserId"),
							RoleId = DbUtils.GetInt(reader, "RoleId"),
							RoleDescription = DbUtils.GetString(reader, "RoleDescription"),
							CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
							CreatedBy = DbUtils.GetInt(reader, "CreatedBy"),
							UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
							UpdatedBy = DbUtils.GetInt(reader, "UpdatedBy"),

						});

					}
					reader.Close();
					return userRoles;
				}
			}
		}
		public IList<RoleRef> GetAllRoleTypes()
		{
			using (var conn = Connection)
			{
				conn.Open();
				using (var cmd = conn.CreateCommand())
				{
					cmd.CommandText = @"
										SELECT [RoleRefId]
											  ,[RoleDescription]
											  ,[CreateTS]
											  ,[CreatedBy]
											  ,[UpdateTS]
											  ,[UpdatedBy]
										  FROM [dbo].[RolesRef]
										";

					var reader = cmd.ExecuteReader();

					IList<RoleRef> roleTypes = new List<RoleRef>();

					while (reader.Read())
					{
						roleTypes.Add(new RoleRef()
						{
							RoleRefId = DbUtils.GetInt(reader, "RoleRefId"),
							RoleDescription = DbUtils.GetString(reader, "RoleDescription"),
							CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
							CreatedBy = DbUtils.GetInt(reader, "CreatedBy"),
							UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
							UpdatedBy = DbUtils.GetInt(reader, "UpdatedBy"),
						});

					}
					reader.Close();
					return roleTypes;
				}
			}
		}
	}
}
