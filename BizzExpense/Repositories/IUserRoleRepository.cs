using BizzExpense.Models;
using BizzExpense.Models.Dtos;

namespace BizzExpense.Repositories
{
    public interface IUserRoleRepository
    {
        UserRoleDto GetUserRole(int userRoleId);
        IList<UserRoleDto> GetUserRoles(int userId);
        IList<RoleRef> GetAllRoleTypes();
        void AddUserRole(UserRole userRole);
        void UpdateUserRole(UserRole userRole);
        void DeleteUserRole(int userRoleId);
    }
}
