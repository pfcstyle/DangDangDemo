using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ModeLib;
using System.Data;

namespace InterfaceLib
{
   public interface IOrder
    {
       bool InsertOrder(ModeLib.Order order,DataTable dt);
      // DataTable SelectOrderById(string orderid);
       DataTable SelectOrderByEmail(string email);
    }
}
