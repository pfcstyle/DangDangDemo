using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            #region 通过传过来的商品ID查询商品信息
            ModeLib.Product p = BusinessLib.Product.GetProductByProductId(Convert.ToInt32(Request["productid"]));
            #endregion
            #region 将商品信息显示在页面上
            this.productidlabel.Text = p.ProductId.ToString();
            this.namelabel.Text = p.ProductName;
            this.datuimage.ImageUrl = "images/" + p.ProductBigImage;
            this.lowpricelabel.Text = p.ProductLowPrice.ToString();
            this.pricelabel.Text = p.ProductPrice.ToString();
            double chaprice = p.ProductPrice - p.ProductLowPrice;
            this.chapricelabel.Text = chaprice.ToString();
            this.youhuolabel.Text = (p.ProductQuantity > 0 ? "有货" : "无货");
            this.productsmallimage.Text = p.ProductSmallImage.ToString();
            #endregion
        }
    }
}