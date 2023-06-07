namespace BizzExpense.Models.Dtos
{
    public class AddExpenseDto
    {
        public Expense expense { get; set; }
        public ApprovalStatus approvalStatus { get; set;}
    }
}
