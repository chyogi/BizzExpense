using BizzExpense.Models;
using BizzExpense.Models.Dtos;

namespace BizzExpense.Repositories
{
    public interface IExpenseRepository
    {
        ExpenseDto GetExpense(int expenseId);
        IList<ExpenseDto> GetExpenses(int userId);
        IList<ExpenseDto> GetExpensesByApprover(int approverId);
        IList<ExpenseTypeRef> GetAllExpenseTypes();
        IList<ExpenseSubTypeRef> GetAllExpenseSubTypes();
        IList<StatusRef> GetAllApprovalStatus();
        void AddExpense(AddExpenseDto addExpenseDto);
        void UpdateExpense(Expense expense);
        void UpdateExpenseStatus(ApprovalStatus approvalStatus);
        void DeleteExpense(int expenseId);
    }
}
