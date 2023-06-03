using BizzExpense.Models;

namespace BizzExpense.Repositories
{
    public interface IExpenseRepository
    {
        Expense GetExpenses(int userId);
        void AddExpense(Expense expense);
        Expense UpdateExpense(Expense expense);
        void DeleteExpense(int expenseId);
    }
}
