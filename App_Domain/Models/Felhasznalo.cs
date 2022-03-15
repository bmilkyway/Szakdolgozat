using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App_Domain.Models
{
    internal class Felhasznalo
    {
        
        public int Id { get; set; }
        public string Felhasznalonev { get; set; }  
        public string Jelszo { get; set; }  
        public string Nev { get; set; } 
        public DateTime SzulDate { get; set;}
        public string Telefonszam { get; set; }
        public string Email { get; set; }
        public string Lakcim { get; set; }
        public Kinezet kinezet { get; set; }    
        public IEnumerable<Targy> targyak { get; set; }

    }
}
