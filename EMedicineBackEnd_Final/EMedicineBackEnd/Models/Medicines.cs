using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EMedicineBackEnd.Models
{
    public class Medicines
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal Discount { get; set; }
        public int Quantity { get; set; }
        public string ExpDate { get; set; }
        public string ImageUrl { get; set; }
        public int Status { get; set; }
        public string Type { get; set; }
    }
}
