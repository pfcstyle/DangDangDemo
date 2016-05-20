using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using ModeLib;
using InterfaceLib;
using CommonOperationLib;
using System.Data.SqlClient;

namespace DataAccessLib
{
    public class Customer:ICustomer
    {
        public DataTable SelectCustomer(ModeLib.Customer c)
        {
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = DataAccess.MakeSqlParameter("email", SqlDbType.VarChar, 128, ParameterDirection.Input, c.UserName);
            return DataAccess.GetDataTableByProc("selectcustomerbyemail", sp);
        }
        public int AddCustomer(ModeLib.Customer c)
        {
            SqlParameter[] sp = new SqlParameter[2];
            sp[0] = DataAccess.MakeSqlParameter("customeremail", SqlDbType.NVarChar, 128, ParameterDirection.Input, c.UserName);
            sp[1] = DataAccess.MakeSqlParameter("password", SqlDbType.VarChar, 128, ParameterDirection.Input, Encrypt.EncryptString(c.UserPass));
            return DataAccess.NoQueryByProc("insertcustomer", sp);
        }
    }
}
