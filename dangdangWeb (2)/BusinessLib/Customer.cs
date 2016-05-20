using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using ModeLib;
using CommonOperationLib;
using InterfaceLib;

namespace BusinessLib
{
    public class Customer
    {
        private Customer()
        { 
        }

        private static readonly ICustomer customer = Factory.CreateCustomerObject();

        public static bool AddCustomer(ModeLib.Customer c)
        {
            return (customer.AddCustomer(c) > 0 ? true : false);
        }

        public static bool CheckCustomerName(ModeLib.Customer c)
        {
            DataTable dt = customer.SelectCustomer(c);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
            return true;
        }

        public static bool CheckCustomerLogin(ModeLib.Customer c)
        {
            DataTable dt = customer.SelectCustomer(c);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    if (c.UserName == Convert.ToString(dt.Rows[0][0]) && Encrypt.EncryptString(c.UserPass)==Convert.ToString(dt.Rows[0][1]))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}
