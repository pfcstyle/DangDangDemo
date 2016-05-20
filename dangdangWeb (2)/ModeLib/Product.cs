using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ModeLib
{
    public class Product
    {
        #region 数据
        private int productid; //商品id
        private int categoryid;  //商品类别id
        private string productname; //商品名称
        private string productimage; //商品图片名称
        private string productbigimage; //商品大图片名称
        private string productsmallimage;  //商品小图片名称
        private double productprice;  //商品价格
        private double productlowprice; //商品销售价
        private int productquantity;  //商品库存量
        private string productbackup;  //备用字段
        #endregion
        #region 方法
        public Product(int productid, int categoryid, string productname, string productimage, string productbigimage, string productsmallimage, double productprice, double productlowprice, int productquantity, string productbackup)
        {
            this.productid = productid;
            this.categoryid = categoryid;
            this.productname = productname;
            this.productimage = productimage;
            this.productbigimage = productbigimage;
            this.productsmallimage = productsmallimage;
            this.productprice = productprice;
            this.productlowprice = productlowprice;
            this.productquantity = productquantity;
            this.productbackup = productbackup;
        }
        #endregion
        public int ProductId
        {
            get { return this.productid; }
            set { this.productid = value; }
        }
        public int CategoryId
        {
            get { return this.categoryid; }
            set { this.categoryid = value; }
        }
        public string ProductName
        {
            get { return this.productname; }
            set { this.productname = value; }
        }
        public string ProductImage
        {
            get { return this.productimage; }
            set { this.productimage = value; }
        }
        public string ProductBigImage
        {
            get { return this.productbigimage; }
            set { this.productbigimage = value; }
        }
        public string ProductSmallImage
        {
            get { return this.productsmallimage; }
            set { this.productsmallimage = value; }
        }
        public double ProductPrice
        {
            get { return this.productprice; }
            set { this.productprice = value; }
        }
        public double ProductLowPrice
        {
            get { return this.productlowprice; }
            set { this.productlowprice = value; }
        }
        public int ProductQuantity
        {
            get { return this.productquantity; }
            set { this.productquantity = value; }
        }
        public string ProductBackup
        {
            get { return this.productbackup; }
            set { this.productbackup = value; }
        }
    }
}
