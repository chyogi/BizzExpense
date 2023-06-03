using BizzExpense.Models;
using BizzExpense.Utils;

namespace BizzExpense.Repositories
{
    public class UserRepository : BaseRepository, IUserRepository
    {
        public UserRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public void AddUser(User user)
        {
            throw new NotImplementedException();
        }

        public void DeleteUser(int userId)
        {
            throw new NotImplementedException();
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
                                          FROM [BizzExpense].[dbo].[Users]
                                           WHERE [UserId] = @userId;";
                    cmd.Parameters.AddWithValue("@userId", userId);
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
                        };

                    }
                    reader.Close();
                    return user;
                }
            }
        }

        public User UpdateUser(User user)
        {
            throw new NotImplementedException();
        }
    }
}
