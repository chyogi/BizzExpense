namespace BizzExpense.Models
{
    public class ApprovalStatus
    {
        public int ApprovalStatusId { get; set; }
        public int ExpenseId { get; set; }
        public int StatusId { get; set; }
        public string? Comments { get; set; }
        public int? ApproverId { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; }
    }
}
