using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class UpdateShopCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 获取传送过来的数据
        int productid = Convert.ToInt32(Request["productid"]);
        int productnumber = Convert.ToInt32(Request["productnumber"]);
        #endregion
        #region 修改购物车中数据
        DataTable dt=null;
        if (Session["cart"] != null)
        {
            dt = (DataTable)Session["cart"];
            DataRow[] rows = dt.Select("DdProductId='" + productid + "'");
            if (rows.Length > 0)
            {
                if (productnumber != 0)//安全性验证
                {
                    DataRow nr = rows[0];
                    nr["DdProductNumber"] = productnumber;
                    rows[0] = nr;
                }
                else
                {
                    rows[0].Delete();
                    dt.AcceptChanges();
                }
            }
            Session["cart"] = dt;
        }
        #endregion
        #region 计算总金额
        double total = 0.0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            total += Convert.ToDouble(dt.Rows[i][3]) * Convert.ToDouble(dt.Rows[i][5]);
        }
        #endregion
        #region 将数据发回
        Response.Clear();
        Response.Write(total);
        Response.End();
        #endregion
    }
}