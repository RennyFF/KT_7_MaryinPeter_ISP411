﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MasterFloorApp.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MasterFloorDBEntities : DbContext
    {
        private static MasterFloorDBEntities _Context { get; set; }
        public MasterFloorDBEntities()
            : base("name=MasterFloorDBEntities")
        {
        }

        public static MasterFloorDBEntities GetContext()
        {
            if (_Context == null)
            {
                _Context = new MasterFloorDBEntities();
            }
            return _Context;
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Cities> Cities { get; set; }
        public virtual DbSet<Directors> Directors { get; set; }
        public virtual DbSet<MaterialType> MaterialType { get; set; }
        public virtual DbSet<PartnerProducts> PartnerProducts { get; set; }
        public virtual DbSet<Partners> Partners { get; set; }
        public virtual DbSet<PartnerTypes> PartnerTypes { get; set; }
        public virtual DbSet<PostCodes> PostCodes { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<Regions> Regions { get; set; }
        public virtual DbSet<Streets> Streets { get; set; }
    }
}
