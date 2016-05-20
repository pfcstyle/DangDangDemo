using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
public partial class OrderSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region 获取传递过来的订单信息并处理
            string name = Request["name"];
            string dizhi=Request["dizhi"];
            string youbian=Request["youbian"];
            string phone = Request["phone"];
            string sendway = Request["sendway"];
            string payway = Request["payway"];
            int yunfei = Convert.ToInt32(Request["yunfei"]);
            double zonge = Convert.ToDouble(Request["zonge"]);
            string email = ((ModeLib.Customer)Session["user"]).UserName;

            ModeLib.Order o = new ModeLib.Order(email,name,dizhi,phone,youbian,sendway,payway,yunfei,zonge,"待审核",string.Empty,DateTime.Now.ToShortDateString(),string.Empty);
            DataTable dt=(DataTable)Session["cart"];
            #endregion
            #region 保存订单数据并显示相关提示信息（处理事务）
            if (BusinessLib.Order.AddOrder(o, dt))
            {
                this.haospan.Text = "订单" + o.OrderId + "已提交。";
            }
            else
            {
                Response.Write("<script language='javascript'>alert('订单提交失败，请重试！');location.href='OrderInfo.aspx'</script>");
                Response.End();
            }
            #endregion
        }
    }
}