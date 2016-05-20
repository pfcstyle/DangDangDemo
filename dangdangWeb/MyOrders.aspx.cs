using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Write("<script language='javascript'>alert('您还没有登陆，请先登录！');location.href='Login.aspx'</script>");
                Response.End();
            }
            else
            {
                this.repeater1.DataSource = BusinessLib.Order.GetOrderByEmail(((ModeLib.Customer)Session["user"]).UserName);
                this.repeater1.DataBind();
            }
        }
    }
}