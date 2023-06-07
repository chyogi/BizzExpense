namespace BizzExpense.Models.Dtos
{
    public class LoginRequest
    {
        public string? FirebaseId { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
    }
}
