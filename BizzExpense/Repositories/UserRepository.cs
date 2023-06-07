using BizzExpense.Models;
using BizzExpense.Utils;
using Microsoft.Data.SqlClient;

namespace BizzExpense.Repositories
{
    public class UserRepository : BaseRepository, IUserRepository
    {
        public UserRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public void AddUser(User user)
        {
            using (SqlConnection conn = Connection)
            {
                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"INSERT INTO [dbo].[Users]
                                                   ([FirstName]
                                                   ,[LastName]
                                                   ,[AddressLine1]
                                                   ,[AddressLine2]
                                                   ,[City]
                                                   ,[State]
                                                   ,[Zip]
                                                   ,[EmailId]
                                                   ,[ManagerId]
                                                   ,[IsManager]
                                                    ,[CreatedBy]
                                                    ,[UpdatedBy])

                                                    OUTPUT INSERTED.UserId

                                                    VALUES (
                                                    @firstName
                                                    ,@lastName
                                                    ,@addressLine1
                                                    ,@addressLine2
                                                    ,@city 
                                                    ,@state
                                                    ,@zip
                                                    ,@emailId
                                                    ,@managerId
                                                    ,@isManager
                                                    ,@CreatedBy
                                                    ,@UpdatedBy)";
                    DbUtils.AddParameter(cmd, "@firstName", user.FirstName);
                    DbUtils.AddParameter(cmd, "@lastName", user.LastName);
                    DbUtils.AddParameter(cmd, "@addressLine1", user.AddressLine1);
                    DbUtils.AddParameter(cmd, "@addressLine2", user.AddressLine2);
                    DbUtils.AddParameter(cmd, "@city", user.City);
                    DbUtils.AddParameter(cmd, "@state", user.State);
                    DbUtils.AddParameter(cmd, "@zip", user.Zip);
                    DbUtils.AddParameter(cmd, "@emailId", user.EmailId);
                    DbUtils.AddParameter(cmd, "@managerId", user.ManagerId);
                    DbUtils.AddParameter(cmd, "@isManager", user.IsManager);
                    DbUtils.AddParameter(cmd, "@CreatedBy", user.CreatedBy);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", user.UpdatedBy);


                    user.UserId = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void DeleteUser(int userId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = "DELETE FROM [dbo].[Users] " +
                                        "WHERE [UserId] = @UserId;";
                    DbUtils.AddParameter(cmd, "@UserId", userId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public User GetUser(int userId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        SELECT [UserId]
                                              ,[FirstName]
                                              ,[LastName]
                                              ,[AddressLine1]
                                              ,[AddressLine2]
                                              ,[City]
                                              ,[State]
                                              ,[Zip]
                                              ,[EmailId]
                                              ,[ManagerId]
                                              ,[IsManager]
                                              ,[CreateTS]
                                                ,[CreatedBy]
                                                ,[UpdateTS]
                                                ,[UpdatedBy]
                                          FROM [BizzExpense].[dbo].[Users]
                                           WHERE [UserId] = @UserId;";
                    DbUtils.AddParameter(cmd, "@UserId", userId);
                    var reader = cmd.ExecuteReader();
                    User user = null;

                    if (reader.Read())
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

                    }
                    reader.Close();
                    return user;
                }
            }
        }

        public void UpdateUser(User user)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                                        UPDATE [dbo].[Users]
                                           SET [FirstName] = @FirstName
                                              ,[LastName] = @LastName
                                              ,[AddressLine1] = @AddressLine1 
                                              ,[AddressLine2] = @AddressLine2 
                                              ,[City] = @City
                                              ,[State] = @State 
                                              ,[Zip] = @Zip 
                                              ,[EmailId] = @EmailId 
                                              ,[ManagerId] = @ManagerId 
                                              ,[IsManager] = @IsManager 
                                              ,[CreatedBy] = @CreatedBy
                                              ,[UpdatedBy] = @UpdatedBy
                                        WHERE [UserId] = @UserId;";
                    DbUtils.AddParameter(cmd, "@UserId", user.UserId);
                    DbUtils.AddParameter(cmd, "@FirstName", user.FirstName);
                    DbUtils.AddParameter(cmd, "@LastName", user.LastName);
                    DbUtils.AddParameter(cmd, "@AddressLine1", user.AddressLine1);
                    DbUtils.AddParameter(cmd, "@AddressLine2", user.AddressLine1);
                    DbUtils.AddParameter(cmd, "@City", user.City);
                    DbUtils.AddParameter(cmd, "@State", user.State);
                    DbUtils.AddParameter(cmd, "@Zip", user.Zip);
                    DbUtils.AddParameter(cmd, "@EmailId", user.EmailId);
                    DbUtils.AddParameter(cmd, "@ManagerId", user.ManagerId);
                    DbUtils.AddParameter(cmd, "@IsManager", user.IsManager);
                    DbUtils.AddParameter(cmd, "@CreatedBy", user.CreatedBy);
                    DbUtils.AddParameter(cmd, "@UpdatedBy", user.UpdatedBy);


                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
