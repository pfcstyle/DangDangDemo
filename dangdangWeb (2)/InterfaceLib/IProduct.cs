using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;

namespace InterfaceLib
{
    public interface IProduct
    {
        DataTable SelectProductByCategoryId(int categoryid);
        DataTable SelectProductByProductId(int productid);
    }
}
