using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App_Domain.Models
{
    internal class Targy
    {

        public int Id { get; set; } 
        public string Nev { get; set; }
        public int TargyId { get; set; }
        public IEnumerable<ZH> zhk { get; set; }
        public IEnumerable<Beadando> beadandok{ get; set; }
        public Targyinfo targyinfo { get; set; }


    }
}
