using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ModeLib;
using System.Data;

namespace InterfaceLib
{
   public interface ICustomer
    {
       int AddCustomer(Customer c);
       DataTable SelectCustomer(Customer c);
    }
}
