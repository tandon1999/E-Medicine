using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMedicineBackEnd.Models
{
    public class Orders
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public string CustomerName { get; set; }
        public string MedicineName { get; set; }
        public string Manufacturer { get; set; }
        public decimal UnitPrice { get; set; }
        public string OrderNo { get; set; }
        public decimal OrderTotal { get; set; }
        public string OrderStatus { get; set; }
        public string CreatedOn { get; set; }
        public int Quantity { get; set; }
        public DateTime ExpDate { get; set; }
        public string ImageUrl { get; set; }
        public decimal TotalPrice { get; set; }

    }
}
