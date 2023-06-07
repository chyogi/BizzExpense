namespace BizzExpense.Models
{
    public class Login
    {
        public int LogInId { get; set; }
        public int UserId { get; set; }
        public string? FirebaseId { get; set; }
        public DateTime? CreateTS { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
