using ShipEquipment.Core.Utility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Web.Caching;
using System.Xml.Serialization;

namespace ShipEquipment.Core.Configurations
{
    [DataContract]
    public class SiteConfiguration
    {
        #region utility methods

        private const string CacheKey = "Configuration";

        public static SiteConfiguration GetConfig()
        {
            var config = SiteCache.Get<SiteConfiguration>(SiteConfiguration.CacheKey);
            if (config == null)
            {
                string path = Globals.MapPath("~/site.config");

                if (!File.Exists(path))
                    path = Globals.MapPath("~/config/site.config");

                if (!File.Exists(path))
                {
                    config = new SiteConfiguration();
                    SerializationUtility.Serialize<SiteConfiguration>(config, path);
                }
                else
                {
                    config = SerializationUtility.Deserialize<SiteConfiguration>(path);
                }

                var dep = new CacheDependency(path);
                SiteCache.Insert(SiteConfiguration.CacheKey, config, dep);
            }

            return config;
        }

        public static void SaveConfig(SiteConfiguration config)
        {
            if (config != null)
            {
                string path = Globals.MapPath("~/Claw.config");

                if (File.Exists(path))
                {
                    SerializationUtility.Serialize<SiteConfiguration>(config, path);
                }
                else
                {
                    path = Globals.MapPath("~/config/Claw.config");

                    if (File.Exists(path))
                        SerializationUtility.Serialize<SiteConfiguration>(config, path);
                }
            }
        }

        public SiteConfiguration()
        {
            LogException = true;
            LogEvent = true;
            RemoveWhitespaces = true;

            ConfigFile = new ConfigFile()
            {
                Log = "~/config/log4net.config",
                Route = "~/config/routes.config",
            };

            ErrorEmail = new ErrorEmail()
            {
                IsSendEmail = true,
                SmtpServer = "mail.cateno.no",
                SmtpUsername = "smtp@cateno.no",
                SmtpPassword = "2008-KL",
                SmtpPort = 25,
                SmtpAuthentication = false,
                EnableSsl = false,
                DefaultSender = "no-reply@cateno.no",
                DefaultReceiver = "tuannh@cateno.no",
                SubjectPrefix = "Error on site: ",
                FilterErrorCode = "*"
            };

            Banner = new Banner()
            {
                Width = 800,
                Height = 600,
                ThumbWidth = 200,
                ThumbHeight = 150,
                Quality = 80,
                Background = "#FFFFFF"
            };

        }

        #endregion

        #region properties

        [DataMember(Order = 1)]
        public bool LogException
        {
            get;
            set;
        }

        [DataMember(Order = 2)]
        public bool LogEvent
        {
            get;
            set;
        }

        [DataMember(Order = 3)]
        public bool RemoveWhitespaces
        {
            get;
            set;
        }

        [DataMember(Order = 4)]
        public ConfigFile ConfigFile
        {
            get;
            set;
        }

        [DataMember(Order = 5)]
        public ErrorEmail ErrorEmail
        {
            get;
            set;
        }

        [DataMember(Order = 6)]
        public Banner Banner { get; set; }

        [DataMember(Order = 7)]
        public bool AddTrailingSlash
        {
            get;
            set;
        }

        #endregion
    }

    public class ErrorEmail
    {
        public bool IsSendEmail
        {
            get;
            set;
        }

        public string SmtpServer { get; set; }

        public string SmtpUsername { get; set; }

        public string SmtpPassword { get; set; }

        public int SmtpPort { get; set; }

        public bool SmtpAuthentication { get; set; }

        public bool EnableSsl { get; set; }

        public string DefaultSender { get; set; }

        public string DefaultReceiver { get; set; }

        public string SubjectPrefix { get; set; }

        /// <summary>
        /// set * to send all error email. Using ";" or "," for splitter multi error code.
        /// </summary>
        public string FilterErrorCode { get; set; }
    }

    public class ConfigFile
    {
        public string Log
        {
            get;
            set;
        }

        public string Route
        {
            get;
            set;
        }
    }

    public class Banner
    {
        public int Width { get; set; }

        public int Height { get; set; }

        public int ThumbWidth { get; set; }

        public int ThumbHeight { get; set; }

        public int Quality { get; set; }

        public string Background { get; set; }
    }


}
