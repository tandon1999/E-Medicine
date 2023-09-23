namespace EMedicineBackEnd.Models
{
    public class Cart
    {
        public int ID { get; set; }
        public int UserId { get; set; }
        public string Email { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal Discount { get; set; }
        public string Quantity { get; set; }
        public decimal TotalPrice { get; set; }
        public int MedicineID { get; set; }
        public string MedicineName { get; set; }
        public string Manufacturer { get; set; }
        public string ImageUrl { get; set; }
    }
}
