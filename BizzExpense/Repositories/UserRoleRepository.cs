using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Utils;
using Microsoft.Data.SqlClient;

namespace BizzExpense.Repositories
{
	public class UserRoleRepository : BaseRepository, IUserRoleRepository
	{
		public UserRoleRepository(IConfiguration configuration) : base(configuration)
		{
		}

		public UserRoleDto GetUserRole(int userRoleId)
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
										WHERE ur1.[UserRoleId]= @UserRoleId";
					DbUtils.AddParameter(cmd, "@UserRoleId", userRoleId);
					var reader = cmd.ExecuteReader();
					UserRoleDto userRoleDto = null;

					if (reader.Read())
					{
						userRoleDto = new UserRoleDto()
						{
							UserRoleId = DbUtils.GetInt(reader, "UserRoleId"),
							UserId = DbUtils.GetInt(reader, "UserId"),
							RoleId = DbUtils.GetInt(reader, "RoleId"),
							RoleDescription = DbUtils.GetString(reader, "RoleDescription"),
							CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
							CreatedBy = DbUtils.GetInt(reader, "CreatedBy"),
							UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
							UpdatedBy = DbUtils.GetInt(reader, "UpdatedBy"),

						};

					}
					reader.Close();
					return userRoleDto;
				}
			}
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
		public void AddUserRole(UserRole userRole)
		{
			using (SqlConnection conn = Connection)
			{
				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{
					cmd.CommandText = @"INSERT INTO [dbo].[UsersRoles]
													([UserId]
													,[RoleId]
													,[CreateTS]
													,[CreatedBy]
													,[UpdateTS]
													,[UpdatedBy])

													OUTPUT INSERTED.[UserRoleId]

													VALUES (
													@UserId
													,@RoleId
													,@CreateTS
													,@CreatedBy
													,@UpdateTS 
													,@UpdatedBy
													)";
					DbUtils.AddParameter(cmd, "@UserId", userRole.UserId);
					DbUtils.AddParameter(cmd, "@RoleId", userRole.RoleId);
					DbUtils.AddParameter(cmd, "@CreateTS", userRole.CreateTS);
					DbUtils.AddParameter(cmd, "@CreatedBy", userRole.CreatedBy);
					DbUtils.AddParameter(cmd, "@UpdateTS", userRole.UpdateTS);
					DbUtils.AddParameter(cmd, "@UpdatedBy", userRole.UpdatedBy);


					userRole.UserRoleId = (int)cmd.ExecuteScalar();
				}
			}
		}
		public void UpdateUserRole(UserRole userRole)
		{
			using (var conn = Connection)
			{
				conn.Open();
				using (var cmd = conn.CreateCommand())
				{
					cmd.CommandText = @"
										UPDATE [dbo].[UsersRoles]
										   SET [UserId] = @UserId
											  ,[RoleId] = @RoleId
											  ,[CreateTS] = @CreateTS 
											  ,[CreatedBy] = @CreatedBy 
											  ,[UpdateTS] = @UpdateTS
											  ,[UpdatedBy] = @UpdatedBy
										WHERE [UserRoleId] = @UserRoleId;";
					DbUtils.AddParameter(cmd, "@UserRoleId", userRole.UserRoleId);
					DbUtils.AddParameter(cmd, "@UserId", userRole.UserId);
					DbUtils.AddParameter(cmd, "@RoleId", userRole.RoleId);
					DbUtils.AddParameter(cmd, "@CreateTS", userRole.CreateTS);
					DbUtils.AddParameter(cmd, "@CreatedBy", userRole.CreatedBy);
					DbUtils.AddParameter(cmd, "@UpdateTS", userRole.UpdateTS);
					DbUtils.AddParameter(cmd, "@UpdatedBy", userRole.UpdatedBy);

					cmd.ExecuteNonQuery();
				}
			}
		}
		public void DeleteUserRole(int userRoleId)
		{
			using (var conn = Connection)
			{
				conn.Open();
				using (var cmd = conn.CreateCommand())
				{
					cmd.CommandText = "DELETE FROM [dbo].[UsersRoles] " +
										"WHERE [UserRoleId] = @UserRoleId;";
					DbUtils.AddParameter(cmd, "@UserRoleId", userRoleId);

					cmd.ExecuteNonQuery();
				}
			}
		}
	}
}
