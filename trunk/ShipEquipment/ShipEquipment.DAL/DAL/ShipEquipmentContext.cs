using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;
using ShipEquipment.Biz.Domain;

namespace ShipEquipment.Biz.DAL
{
    public class ShipEquipmentContext : DbContext
    {
        public ShipEquipmentContext()
            : base("ShipEquipmentDb")
        {

        }

        public DbSet<Brand> Brands { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<FAQ> FAQs { get; set; }

        public DbSet<NewsArticle> NewsArticles { get; set; }

        public DbSet<NewsCategory> NewsCategories { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<ProductPhoto> ProductPhotos { get; set; }

        public DbSet<User> Users { get; set; }

        public DbSet<UserGuide> UserGuides { get; set; }

        public DbSet<Video> Videos { get; set; }

        public DbSet<Banner> Banners { get; set; }

        public DbSet<Content> Contents { get; set; }

        public DbSet<Page> Pages { get; set; }

        public DbSet<Province> Provinces { get; set; }

        public void Initialize()
        {
            Database.SetInitializer<ShipEquipmentContext>(new DatabaseInitializer());

            this.Database.Initialize(true);
        }

        public System.Data.Entity.DbSet<ShipEquipment.Biz.Domain.Order> Orders { get; set; }

        public System.Data.Entity.DbSet<ShipEquipment.Biz.Domain.District> Districts { get; set; }

        public System.Data.Entity.DbSet<ShipEquipment.Biz.Domain.Album> Albums { get; set; }

        public System.Data.Entity.DbSet<ShipEquipment.Biz.Domain.Photo> Photos { get; set; }
    }
}
