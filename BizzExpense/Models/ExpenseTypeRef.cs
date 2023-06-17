namespace BizzExpense.Models
{
    public class ExpenseTypeRef
    {
        public int ExpenseTypeRefId { get; set; }
        public string? ExpenseTypeDescription { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; } 
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; }
    }
}
