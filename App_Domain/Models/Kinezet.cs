using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App_Domain.Models
{
    internal class Kinezet
    {
        public int Id { get; set; }
        public string Kulso { get; set; }
        public string Belso { get; set; }
        public Felhasznalo felhasznalo { get; set; }
    }
}
