//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SD_SOFT_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class enFelvettTargy
    {
        public int Id { get; set; }
        public string KurzusId { get; set; }
        public string FelhasznaloId { get; set; }
        public string Zh { get; set; }
        public string Beadando { get; set; }
        public string Pluszpont { get; set; }
    
        public virtual enTargy enTargy { get; set; }
        public virtual enFelhasznalo enFelhasznalo { get; set; }
    }
}