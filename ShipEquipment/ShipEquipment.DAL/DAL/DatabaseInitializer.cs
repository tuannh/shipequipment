using ShipEquipment.Biz.Domain;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.DAL
{
    public class DatabaseInitializer : DropCreateDatabaseIfModelChanges<ShipEquipmentContext>
    {
        protected override void Seed(ShipEquipmentContext context)
        {
            InitNewsCategory(context);
            InitAdminUser(context);
        }

        private void InitNewsCategory(ShipEquipmentContext context)
        {
            var cateList = new List<NewsCategory>()
            { 
                new NewsCategory() { Id = 1, Name = "Tin tức", Alias = "tin-tuc", DisplayOrder = 1 },
                new NewsCategory() { Id = 2, Name = "Thông tin khuyến mãi", Alias = "thong-tin-khuyen-mai", DisplayOrder = 2 },
                new NewsCategory() { Id = 3, Name = "Thông tin thị trường", Alias = "thong-tin-thi-truong", DisplayOrder = 3 },
                new NewsCategory() { Id = 4, Name = "Tin tức & sự kiên", Alias = "tin-tuc-su-kien", DisplayOrder = 4 },
                new NewsCategory() { Id = 5, Name = "Kiến thức tham khảo", Alias = "kien-thuc-tham-khao", DisplayOrder = 5 }
            };

            cateList.ForEach(cate => context.NewsCategories.Add(cate));

            context.SaveChanges();

        }

        private void InitAdminUser(ShipEquipmentContext context)
        {
            var admin = new User()
            {
                Username = "admin",
                Password = "VhL+dONCCxu68w0qZiuRJuBJx5k=",
                PasswordSalt = "/+jj1XHAkCKH8MGbXSmETg==",
                Email = "nht257@yahoo.com",
                IsAdmin = true,
                CreatedDate = DateTime.Now,
                Active = true
            };
            context.Users.Add(admin);

            var webmaster = new User()
            {
                Username = "webmaster",
                Password = "UR+o5v1LPhotXzvrCakeUAvpAzQ=",
                PasswordSalt = "BbXwoC3mCjjwBFPWmDhNug==",
                Email = "redhearthcm@gmail.com",
                IsAdmin = true,
                CreatedDate = DateTime.Now,
                Active = true
            };
            context.Users.Add(webmaster);

            context.SaveChanges();
        }
    }
}
