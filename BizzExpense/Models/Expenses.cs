namespace BizzExpense.Models
{
    public class Expenses
    {
        public int Id { get; set; }
        public string? ExpenseType { get; set; }
        public string? ExpensSubType { get; set; }
        public decimal ExpenseAmount { get; set; }
        public int? SubmittedByUserId { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}
