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
    
    public partial class enKinezet
    {
        public int Id { get; set; }
        public string Belso { get; set; }
        public string Kulso { get; set; }
        public string Kep { get; set; }
        public string Link { get; set; }
    
        public virtual enFelhasznalo enFelhasznalo { get; set; }
    }
}
