using BizzExpense.Models;
using BizzExpense.Models.Dtos;

namespace BizzExpense.Repositories
{
    public interface IUserRoleRepository
    {
        IList<UserRoleDto> GetUserRoles(int userId);
        IList<RoleRef> GetAllRoleTypes();
    }
}
