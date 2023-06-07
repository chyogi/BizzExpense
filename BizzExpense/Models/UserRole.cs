namespace BizzExpense.Models
{
    public class UserRole
    {
        public int UserRoleId { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public DateTime? CreateTS { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
