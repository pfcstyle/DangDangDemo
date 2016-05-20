using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeLib;
using BusinessLib;

public partial class CheckLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region 获取传递过来的数据
            ModeLib.Customer c = new ModeLib.Customer(Request["username"], Request["userpass"].Substring(4));//Substring用于密码加密一致性处理
            #endregion

            #region 验证登录信息是否正确
            if (BusinessLib.Customer.CheckCustomerLogin(c))
            {
                Session["user"] = c;
                if (Session["page"] != null)
                {
                    Response.Redirect("OrderInfo.aspx");
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('用户名或密码错误，请重试！');location.href='Login.aspx'</script>");
                Response.End();
            }
            #endregion

        }
    }
}