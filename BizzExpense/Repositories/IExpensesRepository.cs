using BizzExpense.Models;

namespace BizzExpense.Repositories
{
    public interface IExpensesRepository
    {
        Expenses GetExpenses(int userId);
        void AddExpense(Expenses expense);
        Expenses UpdateExpense(Expenses expense);
        void DeleteExpense(int expenseId);
    }
}
