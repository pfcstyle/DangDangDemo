using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CommonOperationLib;
using System.IO;

public partial class GetValidateImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string flag = Request["flag"].Trim();

        string valid = "";//定义随机数
        MemoryStream ms = ValidateCode.Create(out valid);
        Session[flag] = valid;//验证码存储在Session中，供验证。
        Response.ClearContent();//清空输出流
        Response.ContentType = "image/png";//输出流的格式
        Response.BinaryWrite(ms.ToArray());//输出
        Response.End();
    }
}