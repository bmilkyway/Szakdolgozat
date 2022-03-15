using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App_Domain.Models
{
    internal class Targyinfo
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public string Tipus { get; set; }
        public int Kredit { get; set; }
        public string Kovetelmeny { get; set; }
        public string Ponthatar { get; set; }
        public string Vizsga { get; set; }
        public Targy targy { get; set; }

    }
}
