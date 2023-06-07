namespace BizzExpense.Models.Dtos
{
    public class ExpenseDto
    {
        public int ExpenseId { get; set; }
        public int ExpenseTypeId { get; set; }
        public string? ExpenseType { get; set; }
        public int ExpenseSubTypeId { get; set; }
        public string? ExpenseSubType { get; set; }
        public decimal? ExpenseAmount { get; set; }
        public int? SubmittedByUserId { get; set; }
        public DateTime? ExpenseCreatedTS { get; set; }
        public int? ExpenseCreatedByUserId { get; set; }
        public DateTime? ExpenseUpdatedTS { get; set; }
        public int? ExpenseUpdatedByUserId { get; set; }
        public int ApprovalStatusId { get; set; }
        public int? StatusId  { get; set; }
        public string? StatusDescription { get; set; }
        public string? Comments { get; set; }
        public int? ApproverId { get; set; }
        public DateTime? ApprovalCreatedTS { get; set; }
        public int? ApprovalCreatedByUserId { get; set; }
        public DateTime? ApprovalUpdatedTS { get; set; }
        public int? ApprovalUpdatedByUserId { get; set; }

    }
}
