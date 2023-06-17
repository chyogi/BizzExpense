namespace BizzExpense.Models
{
    public class RoleRef
    {
        public int RoleRefId { get; set; }
        public string? RoleDescription { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; }
    }
}
