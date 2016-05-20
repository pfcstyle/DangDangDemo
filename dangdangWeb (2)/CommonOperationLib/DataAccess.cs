using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace CommonOperationLib
{
    public class DataAccess
    {
        private DataAccess() { }

        #region 获取数据库连接对象
        private static SqlConnection con = new SqlConnection(ConfigeOperation.GetConfigValue("connectionstring", "dangdang"));
        #endregion

        #region 构造参数(调用存储过程用)

        public static SqlParameter MakeSqlParameter(string paraName, SqlDbType paraType, int paraSize, ParameterDirection pd, object paraValue)
        {
            SqlParameter sp = new SqlParameter(paraName, paraType);
            sp.Direction = pd;
            if (paraSize != 0)
            {
                sp.Size = paraSize;
            }
            if (paraValue != null)
            {
                sp.Value = paraValue;
            }
            return sp;
        }
        #endregion
        #region 构造命令对象
        public static SqlCommand MakeSqlCommand(string procName, SqlParameter[] sp)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procName;
            if (sp != null)
            {
                foreach (SqlParameter p in sp)
                {
                    command.Parameters.Add(p);
                }
            }
            return command;

        }

        #endregion
        #region 调用存储过程执行查询并以DataTable形式返回
        public static DataTable GetDataTableByProc(string procName, SqlParameter[] sp)
        {
            SqlCommand command = MakeSqlCommand(procName, sp);
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = command;

            DataTable dt = new DataTable();
            try
            {
                sda.Fill(dt);
                command.Dispose();
                return dt;
            }
            catch (SqlException se)
            {
                LogOperation.Log("执行 " + procName + " 存储过程时出异常:" + se.Message);
                return null;
            }
            finally
            {
                if (command != null)
                {
                    command.Dispose();
                }
            }

        }
        #endregion
        #region 调用存储过程实现添加、删除、修改
        public static object InsertAndOutId(string procname, string parname, SqlParameter[] sp)
        {
            SqlCommand command = MakeSqlCommand(procname, sp);
            try
            {
                con.Open();
                command.ExecuteNonQuery();
                object o = command.Parameters[parname].Value;
                con.Close();
                command.Dispose();
                return o;
            }
            catch (SqlException se)
            {
                return null;
            }
            finally
            {
                if (con.State.Equals(ConnectionState.Open))
                {
                    con.Close();
                }
                if (command != null)
                {
                    command.Dispose();
                }
            }
        }
        public static int NoQueryByProc(String procName, SqlParameter[] sp)
        {
            SqlCommand command = MakeSqlCommand(procName, sp);
            try
            {
                con.Open();
                int result = command.ExecuteNonQuery();
                con.Close();
                command.Dispose();
                return result;
            }
            catch (SqlException se)
            {
                LogOperation.Log("执行 " + procName + " 存储过程时出异常:" + se.Message);
                return 0;
            }
            finally
            {
                if (con.State.Equals(ConnectionState.Open))
                {
                    con.Close();
                }
                if (command != null)
                {
                    command.Dispose();
                }
            }
        }
        #endregion
        #region 应用事务的方法
        public static SqlConnection GetConnection()
        {
            return con;
        }
        public static SqlCommand MakeSqlCommand(SqlConnection conn, SqlTransaction tran, string procName, SqlParameter[] sp)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.Transaction = tran;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procName;
            if (sp != null)
            {
                foreach (SqlParameter p in sp)
                {
                    command.Parameters.Add(p);
                }
            }
            return command;

        }

        public static object InsertByProc(string procname, SqlParameter[] sp, SqlConnection conn, SqlTransaction tran)
        {
            SqlCommand command = MakeSqlCommand(conn, tran, procname, sp);
            try
            {
                if (procname == "addorder")
                {
                    int result = command.ExecuteNonQuery();
                    if (result > 0)
                    {
                        return command.Parameters["orderid"].Value.ToString();
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return command.ExecuteNonQuery();
                }

            }
            catch (SqlException se)
            {
                CommonOperationLib.LogOperation.Log(se.ToString());
                return null;
            }

        }
        #endregion
    }
}
