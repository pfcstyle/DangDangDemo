using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckValidateCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 获取传过来的数据
        string validatecode = Request["validatecode"].Trim();
        string flag = Request["flag"].Trim();
        #endregion
        #region 判断验证码是否正确
        int result = (validatecode == Session[flag].ToString() ? 1 : 0);
        #endregion
        #region 将数据发回
        Response.Clear();
        Response.Write(result);
        Response.End();
        #endregion

    }
}