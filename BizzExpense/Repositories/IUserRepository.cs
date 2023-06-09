﻿using BizzExpense.Models;

namespace BizzExpense.Repositories
{
    public interface IUserRepository
    {
        User GetUser(int userId);
        void AddUser(User user);
        void UpdateUser(User user);
        void DeleteUser(int userId);

    }
}
