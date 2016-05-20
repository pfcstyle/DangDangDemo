using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using InterfaceLib;
using System.Data;
using System.Data.SqlClient;
using CommonOperationLib;

namespace DataAccessLib
{
    public class Order:IOrder
    {
        public bool InsertOrder(ModeLib.Order order, DataTable dt)
        {
            SqlConnection con = null;
            try
            {
                con = DataAccess.GetConnection();
                if (con != null && con.State.Equals(ConnectionState.Closed))
                {
                    con.Open();
                }
                SqlTransaction transation = con.BeginTransaction();
                #region 插入订单并返回订单号
                SqlParameter[] sp = new SqlParameter[13];
                sp[0] = DataAccess.MakeSqlParameter("orderid",SqlDbType.NChar,16,ParameterDirection.Output,null);
                sp[1] = DataAccess.MakeSqlParameter("orderemail",SqlDbType.VarChar,128,ParameterDirection.Input,order.UserEmail);
                sp[2] = DataAccess.MakeSqlParameter("ordername",SqlDbType.VarChar,16,ParameterDirection.Input,order.OrderName);
                sp[3] = DataAccess.MakeSqlParameter("orderaddress",SqlDbType.VarChar,256,ParameterDirection.Input,order.OrderAddress);
                sp[4] = DataAccess.MakeSqlParameter("orderdate",SqlDbType.VarChar,16,ParameterDirection.Input,order.OrderDate);
                sp[5] = DataAccess.MakeSqlParameter("orderpostcode",SqlDbType.VarChar,16,ParameterDirection.Input,order.OrderPostcode);
                sp[6] = DataAccess.MakeSqlParameter("orderphone",SqlDbType.VarChar,24,ParameterDirection.Input,order.OrderPhone);
                sp[7] = DataAccess.MakeSqlParameter("ordersendway",SqlDbType.VarChar,128,ParameterDirection.Input,order.OrderSend);
                sp[8] = DataAccess.MakeSqlParameter("orderpayway",SqlDbType.VarChar,16,ParameterDirection.Input,order.OrderPay);
                sp[9] = DataAccess.MakeSqlParameter("orderstate",SqlDbType.VarChar,16,ParameterDirection.Input,order.OrderState);
                sp[10] = DataAccess.MakeSqlParameter("orderyunfei",SqlDbType.Int,0,ParameterDirection.Input,order.OrderYunfei);
                sp[11] = DataAccess.MakeSqlParameter("orderjine",SqlDbType.Decimal,0,ParameterDirection.Input,order.OrderJine);
                sp[12] = DataAccess.MakeSqlParameter("orderbackup",SqlDbType.VarChar,128,ParameterDirection.Input,order.OrderBackup);

                object oid = DataAccess.InsertByProc("addorder",sp,con,transation);
                if (oid != null)
                {
                    string orderid = oid.ToString();
                    order.OrderId = orderid;
                    #region 插入详细信息
                    if (dt != null)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        { 
                            SqlParameter[] spp=new SqlParameter[7];
                            spp[0] = DataAccess.MakeSqlParameter("orderid",SqlDbType.NChar,16,ParameterDirection.Input,orderid);
                            spp[1] = DataAccess.MakeSqlParameter("productid",SqlDbType.Int,0,ParameterDirection.Input,dt.Rows[i][0].ToString());
                            spp[2] = DataAccess.MakeSqlParameter("productname",SqlDbType.VarChar,128,ParameterDirection.Input,dt.Rows[i][1].ToString());
                            spp[3] = DataAccess.MakeSqlParameter("productprice",SqlDbType.Decimal,0,ParameterDirection.Input,dt.Rows[i][3]);
                            spp[4] = DataAccess.MakeSqlParameter("productnumber",SqlDbType.Int,0,ParameterDirection.Input,dt.Rows[i][5]);
                            spp[5] = DataAccess.MakeSqlParameter("productjine",SqlDbType.Decimal,0,ParameterDirection.Input,(Convert.ToInt32( dt.Rows[i][5])* Convert.ToDouble(dt.Rows[i][3])));
                            spp[6] = DataAccess.MakeSqlParameter("orderitembackup",SqlDbType.VarChar,128,ParameterDirection.Input,"");

                            object result = DataAccess.InsertByProc("addorderitem", spp, con, transation);
                            if (Convert.ToInt32(result) <= 0)
                            {
                                transation.Rollback();
                                con.Close();
                                return false;
                            }
                        }
                        transation.Commit();
                        con.Close();
                        return true;
                    }                    
                    #endregion
                }

                transation.Rollback();
                con.Close();
                return false;

                #endregion
            }
            catch (Exception ee)
            {
                return false;
            }
            finally
            {
                if (con.State.Equals(ConnectionState.Open))
                {
                    con.Close();
                }
            }
        }
        //public DataTable SelectOrderById(string orderid)
        //{ 
            
        //}
        public DataTable SelectOrderByEmail(string email)
        {
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = DataAccess.MakeSqlParameter("email",SqlDbType.VarChar,128,ParameterDirection.Input,email);
            return DataAccess.GetDataTableByProc("selectorderbyemail", sp);
        }
    }
}
