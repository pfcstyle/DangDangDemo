using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Web;
using System.Reflection;
using InterfaceLib;

namespace CommonOperationLib
{
    public class Factory
    {
        private Factory() { }
        private static readonly string path = ConfigeOperation.GetConfigValue("AppSettings", "dlnamespace");
        private static object CreateObject(string className)
        {
            object o = HttpContext.Current.Cache[path + "." + className];
            if (o == null)
            {
                try
                {
                    o = Assembly.Load(path).CreateInstance(path + "." + className);
                    HttpContext.Current.Cache[path + "." + className] = o;
                }
                catch (Exception e)
                {
                    throw e;
                }

            }
            return o;
        }

        public static InterfaceLib.IProduct CreateProductObject()
        {
            return (InterfaceLib.IProduct)CreateObject("Product");
        }

        public static InterfaceLib.ICustomer CreateCustomerObject()
        {
            return (InterfaceLib.ICustomer)CreateObject("Customer");//Customer对应数据访问类库的类名
        }

        public static InterfaceLib.IOrder CreateOrderObject()
        {
            return (InterfaceLib.IOrder)CreateObject("Order");
        }
    }
}
