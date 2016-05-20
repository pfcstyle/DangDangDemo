using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using CommonOperationLib;
using BusinessLib;
using InterfaceLib;
using System.Data.SqlClient;

namespace DataAccessLib
{
    public class Product : IProduct
    {
        public DataTable SelectProductByCategoryId(int categoryid)
        {
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = DataAccess.MakeSqlParameter("categoryid", SqlDbType.Int, 0, ParameterDirection.Input, categoryid);
            return DataAccess.GetDataTableByProc("selectproductbycategoryid", sp);
        }
        public DataTable SelectProductByProductId(int productid)
        {
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = DataAccess.MakeSqlParameter("productid", SqlDbType.Int, 0, ParameterDirection.Input, productid);
            return DataAccess.GetDataTableByProc("selectproductbyproductid", sp);
        }
    }
}

