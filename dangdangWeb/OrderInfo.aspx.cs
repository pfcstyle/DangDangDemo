using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class OrderInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 判断用户是否登录
        if (Session["user"] == null)
        {
            Session["page"] = "OrderInfo.aspx";
            Response.Redirect("Login.aspx");
        }
        #endregion
        #region 显示用户购物清单及费用信息
        if(Session["cart"]!=null)
        {
            DataTable dt = (DataTable)Session["cart"];
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();

            #region 计算并显示总金额
            double total = 0.0;
            for (int i = 0; i < dt.Rows.Count;i++ )
            {
                total += Convert.ToDouble(dt.Rows[i][3])*Convert.ToInt32(dt.Rows[i][5]);
            }
            this.zongespan.Text = total + "";

            #region 计算运费
            int yunfei = (total > 29) ? 0 : 5;
            this.yunfeispan.Text = yunfei.ToString();
            #endregion
            double zongsh = yunfei + total;
            this.zhifuspan.Text = zongsh.ToString();
            #endregion
        }
        #endregion
    }
}