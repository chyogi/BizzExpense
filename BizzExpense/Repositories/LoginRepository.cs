using BizzExpense.Models;
using BizzExpense.Models.Dtos;
using BizzExpense.Utils;

namespace BizzExpense.Repositories
{
	public class LoginRepository : BaseRepository, ILoginRepository
	{
		public LoginRepository(IConfiguration configuration) : base(configuration)
		{
		}

		public LoginResponse Login(LoginRequest loginRequest)
		{
			using (var conn = Connection)
			{
				conn.Open();
				using (var cmd = conn.CreateCommand())
				{
					cmd.CommandText = @"
										  SELECT 
										  ur1.[RoleId]
										  ,rr1.[RoleDescription]
										  ,l1.[FirebaseId]
											,u1.[UserId]
											  , u1.[FirstName]
											  , u1.[LastName]
											  , u1.[AddressLine1]
											  , u1.[AddressLine2]
											  , u1.[City]
											  , u1.[State]
											  , u1.[Zip]
											  , u1.[EmailId]
											  , u1.[ManagerId]
											  , u1.[IsManager]
											  , u1.[CreateTS]
											  , u1.[CreatedBy]
											  , u1.[UpdateTS]
											  , u1.[UpdatedBy]
										  FROM [dbo].[Users] u1
										  INNER JOIN [dbo].[LogIn] l1 on l1.[UserId] = u1.[UserId]
										  INNER JOIN [dbo].[UsersRoles] ur1 on ur1.[UserId] = u1.[UserId]
										  INNER JOIN [dbo].[RolesRef] rr1 on rr1.RoleRefId = ur1.RoleId
										  where u1.[EmailId] = @EmailId
										"
					;

					DbUtils.AddParameter(cmd, "@EmailId", loginRequest.EmailId.ToLower());

					var reader = cmd.ExecuteReader();

					LoginResponse? loginResponse = null;
					User? user = null;

					while (reader.Read())
					{
						user = new User()
						{
							UserId = DbUtils.GetInt(reader, "UserId"),
							FirstName = DbUtils.GetString(reader, "FirstName"),
							LastName = DbUtils.GetString(reader, "LastName"),
							AddressLine1 = DbUtils.GetString(reader, "AddressLine1"),
							AddressLine2 = DbUtils.GetString(reader, "AddressLine2"),
							City = DbUtils.GetString(reader, "City"),
							State = DbUtils.GetString(reader, "State"),
							Zip = DbUtils.GetString(reader, "Zip"),
							EmailId = DbUtils.GetString(reader, "EmailId"),
							ManagerId = DbUtils.GetInt(reader, "ManagerId"),
							IsManager = DbUtils.GetNullableBool(reader, "IsManager"),
							CreateTS = DbUtils.GetNullableDateTime(reader, "CreateTS"),
							CreatedBy = DbUtils.GetInt(reader, "CreatedBy"),
							UpdateTS = DbUtils.GetNullableDateTime(reader, "UpdateTS"),
							UpdatedBy = DbUtils.GetInt(reader, "UpdatedBy"),
						};

						loginResponse = new LoginResponse()
						{
							IsAuthorized = true,
							RoleId = DbUtils.GetInt(reader, "RoleId"),
							RoleDescription = DbUtils.GetString(reader, "RoleDescription"),
							FirebaseId = DbUtils.GetString(reader, "FirebaseId"),
							User = user
						};

					}
					reader.Close();
					return loginResponse;
				}
			}
		}
	}
}
