namespace BizzExpense.Models
{
    public class Expense
    {
        public int ExpenseId { get; set; }
        public int ExpenseTypeId { get; set; }
        public int ExpenseSubTypeID { get; set; }
        public decimal? ExpenseAmount { get; set; }
        public int? SubmittedByUserId { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; }

    }
}
