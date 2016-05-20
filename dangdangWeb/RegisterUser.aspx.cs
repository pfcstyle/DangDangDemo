using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region 接收传递过来的数据并处理
            string username = Request["username"].Trim();
            string userpass = Request["userpass"].Trim().Substring(4);
            ModeLib.Customer customer = new ModeLib.Customer(username,userpass);
            #endregion
            #region 将用户数据存数数据库表中
            if (BusinessLib.Customer.AddCustomer(customer))
            {
                Response.Redirect("Login.aspx?username=" + customer.UserName);
            }
            else {
                Response.Write("<script language='javascript'>alert('注册失败，请重试！');location.href='Register.aspx'</script>");
                Response.End();
            }
            #endregion
        }
    }
}