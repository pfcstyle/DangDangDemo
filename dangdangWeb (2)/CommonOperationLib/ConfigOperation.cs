using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Configuration;

namespace CommonOperationLib
{
    public class ConfigeOperation
    {
        private ConfigeOperation()
        { }
        #region 从配置文件中根据配置节名和配置项名获取配置值
        /// <summary>
        /// 从配置文件中获取配置值
        /// </summary>
        /// <param name="sectionname">配置节名</param>
        /// <param name="name">配置项名</param>
        /// <returns>配置值</returns>
        public static string GetConfigValue(string sectionname, string name)
        {
            string sn = sectionname.ToLower();
            switch (sn)
            {
                case "appsettings":
                    {
                        return ConfigurationManager.AppSettings[name];
                    }

                case "connectionstring":
                    {
                        return ConfigurationManager.ConnectionStrings[name].ToString();
                    }

                default:
                    {
                        return string.Empty;
                    }

            }


        }
        #endregion

    }
}
