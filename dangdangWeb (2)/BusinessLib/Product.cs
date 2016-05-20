using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using CommonOperationLib;
using ModeLib;
using InterfaceLib;
using System.Data;

namespace BusinessLib
{
    public class Product
    {
        private Product() { }
        private static readonly IProduct product = Factory.CreateProductObject();
        public static DataTable GetProductByCategoryId(int categoryid)
        {
            return product.SelectProductByCategoryId(categoryid);
        }
        public static ModeLib.Product GetProductByProductId(int productid)
        {
            DataTable dt = product.SelectProductByProductId(productid);
            if (dt != null && dt.Rows.Count > 0)
            {
                int pid = Convert.ToInt32(dt.Rows[0][0]);
                int categoryid = Convert.ToInt32(dt.Rows[0][1]);
                string productname = dt.Rows[0][2].ToString();
                string productimage = dt.Rows[0][3].ToString();
                string productbigimage = dt.Rows[0][4].ToString();
                string productsmallimage = dt.Rows[0][5].ToString();
                double productprice = Convert.ToDouble(dt.Rows[0][6]);
                double productlowprice = Convert.ToDouble(dt.Rows[0][7]);
                int productquantity = Convert.ToInt32(dt.Rows[0][8]);
                string productbackup = dt.Rows[0][9].ToString();

                return new ModeLib.Product(pid, categoryid, productname, productimage, productbigimage, productsmallimage, productprice, productlowprice, productquantity, productbackup);
            }
            else
            {
                return null;
            }
        }
    }
}

