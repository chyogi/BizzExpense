using BizzExpense.Models;

namespace BizzExpense.Repositories
{
    public interface IUsersRepository
    {
        Users GetUser(int userId);
        void AddUser(Users user);
        Users UpdateUser(Users user);
        void DeleteUser(int userId);
    }
}
