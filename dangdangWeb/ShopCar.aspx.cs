using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class ShopCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = null;
        #region 判断是添加货物到购物车还是查看购物车
        if (Request["productid"] != null)
        {
            #region 获取商品信息
            int productid = Convert.ToInt32(Request["productid"]);
            string productname = Request["productname"];
            string productsmallimage = Request["productsmallimage"];
            double productprice = Convert.ToDouble(Request["productprice"]);
            double chaprice = Convert.ToDouble(Request["chaprice"]);
            int productnumber = Convert.ToInt32(Request["productnumber"]);
            #endregion
            #region 获取购物车并将商品添加到购物车
            if (Session["cart"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("DdProductId");
                dt.Columns.Add("DdProductSmallImage");
                dt.Columns.Add("DdProductName");
                dt.Columns.Add("DdProductLowPrice");
                dt.Columns.Add("DdProductChaPrice");
                dt.Columns.Add("DdProductNumber");

                DataRow nr = dt.NewRow();
                nr["DdProductId"] = productid;
                nr["DdProductSmallImage"] = productsmallimage;
                nr["DdProductName"] = productname;
                nr["DdProductLowPrice"] = productprice;
                nr["DdProductChaPrice"] = chaprice;
                nr["DdProductNumber"] = productnumber;

                dt.Rows.Add(nr);

                Session["cart"] = dt;


            }
            else
            {
                dt = (DataTable)Session["cart"];
                DataRow[] rows = dt.Select("DdProductId='" + productid + "'");
                if (rows.Length > 0)
                {
                    DataRow nr = rows[0];
                    nr["DdProductNumber"] = Convert.ToInt32(nr["DdProductNumber"]) + productnumber;
                    rows[0] = nr;
                }
                else
                {
                    DataRow nr = dt.NewRow();
                    nr["DdProductId"] = productid;
                    nr["DdProductSmallImage"] = productsmallimage;
                    nr["DdProductName"] = productname;
                    nr["DdProductLowPrice"] = productprice;
                    nr["DdProductChaPrice"] = chaprice;
                    nr["DdProductNumber"] = productnumber;

                    dt.Rows.Add(nr);
                }
                Session["cart"] = dt;
            }
            #endregion
        }
        #endregion

        #region 显示购物车信息
        if (Session["cart"] != null)
        {
            dt = (DataTable)Session["cart"];
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();


            #region 统计总金额并显示
            double total = 0.0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                total += Convert.ToDouble(dt.Rows[i][3]) * Convert.ToDouble(dt.Rows[i][5]);
            }
            this.qianshu.Text = total + "";
            #endregion
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript'>alert('您还没有挑选商品，去首页看看！');location.href='Index.aspx'</script>");
            HttpContext.Current.Response.End();
        }
        #endregion


    }
}