using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using CommonOperationLib;
using System.Data;

namespace BusinessLib
{
    public class Order
    {
        private Order() { }
        public static readonly InterfaceLib.IOrder order = Factory.CreateOrderObject();

        public static bool AddOrder(ModeLib.Order o,DataTable dt)
        {
            return order.InsertOrder(o,dt);
        }

        public static DataTable GetOrderByEmail(string email)
        {
            return order.SelectOrderByEmail(email);
        }
    }
}
