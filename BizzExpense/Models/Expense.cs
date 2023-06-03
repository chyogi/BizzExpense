namespace BizzExpense.Models
{
    public class Expense
    {
        public int ExpenseId { get; set; }
        public string? ExpenseType { get; set; }
        public string? ExpensSubType { get; set; }
        public decimal ExpenseAmount { get; set; }
        public int? SubmittedByUserId { get; set; }
        public DateTime CreatedTS { get; set; }

    }
}
