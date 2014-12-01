using ShipEquipment.Core.Extensions;
using ShipEquipment.Core.Interfaces;
using ShipEquipment.Core.Configurations;
using Ninject;
using Ninject.Modules;
using ShipEquipment.Core.Logs;
using System.Linq;
using System;
using ShipEquipment.Core.BaseObjects;
using ShipEquipment.Biz.DAL;

namespace ShipEquipment.Core.Configurations
{
    public class DbNinjectModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ILogProvider>().To<LogProvider>();
            Bind<SiteUrls>().To<SiteUrls>().InSingletonScope();
            Bind<SiteControl>().To<SiteControl>().InSingletonScope();

            Bind<ShipEquipmentContext>().To<ShipEquipmentContext>().InSingletonScope();
            // Bind<ShipEquipmentContext>().ToMethod(ctx => new ShipEquipmentContext()).InRequestScope();
            // Bind<ISession>().ToMethod(context => context.Kernel.Get<ISessionFactory>().OpenSession()).InRequestScope();
        }
    }
}