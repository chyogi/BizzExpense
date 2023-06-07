namespace BizzExpense.Models
{
    public class StatusRef
    {
        public int StatusRefId { get; set; }
        public string? StatusDescription { get; set; }
        public DateTime? CreateTS { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
