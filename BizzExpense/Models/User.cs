﻿namespace BizzExpense.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? AddressLine1 { get; set; }
        public string? AddressLine2 { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? EmailId { get; set; }

        public int? ManagerId { get; set; }

        public bool? IsManager { get; set; }
        public DateTime? CreateTS { get; set; } = DateTime.Now;
        public int? CreatedBy { get; set; }
        public DateTime? UpdateTS { get; set; } = DateTime.Now;
        public int? UpdatedBy { get; set; } 
    }
}
