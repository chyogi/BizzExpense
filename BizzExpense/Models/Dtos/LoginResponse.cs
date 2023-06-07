namespace BizzExpense.Models.Dtos
{
    public class LoginResponse
    {
        public bool? IsAuthorized { get; set; }
        public int RoleId { get; set; }
        public string? RoleDescription { get; set; }
        public string? FirebaseId { get; set; }
        public User? User { get; set; }  

    }
}
