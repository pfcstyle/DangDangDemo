using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckUserEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 获取传过来的数据并处理
        string useremail = Request["useremail"].Trim();
        ModeLib.Customer c = new ModeLib.Customer(useremail,"");
        #endregion
        #region 判断用户名是否唯一
        int result=(BusinessLib.Customer.CheckCustomerName(c)?1:0);
        #endregion
        #region 将数据发回
        Response.Clear();
        Response.Write(result);
        Response.End();
        #endregion
    }
}