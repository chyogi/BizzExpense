namespace BizzExpense.Models
{
    public class ExpenseSubTypeRef
    {
        public int ExpenseSubTypeRefId { get; set; }
        public int ExpenseTypeId { get; set; }
        public string? ExpenseSubTypeDescription { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; }
    }
}
