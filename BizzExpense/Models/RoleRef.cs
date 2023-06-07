namespace BizzExpense.Models
{
    public class RoleRef
    {
        public int RoleRefId { get; set; }
        public string? RoleDescription { get; set; }
        public DateTime? CreateTS { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
