using BizzExpense.Models.Dtos;

namespace BizzExpense.Repositories
{
    public interface ILoginRepository
    {
        LoginResponse Login(LoginRequest loginRequest);
        void RegisterUser(RegisterDto registerDto);
    }
}
