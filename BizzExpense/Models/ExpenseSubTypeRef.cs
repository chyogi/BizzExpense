namespace BizzExpense.Models
{
    public class ExpenseSubTypeRef
    {
        public int ExpenseSubTypeRefId { get; set; }
        public int ExpenseTypeId { get; set; }
        public string? ExpenseSubTypeDescription { get; set; }
        public DateTime? CreateTS { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
