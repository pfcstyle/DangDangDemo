<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="MyOrders" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的订单</title>
    <link href="css/myorder.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div id = "content">
        <div id="body">
    	    <div>
        	    <span class="orderstate">订单列表</span>
    	    </div>
            <div class="orderlist">
                <table  cellspacing="0" cellpadding="0">
                  <tr class="head">
                    <td>订单号</td>
                    <td>下单日期</td>
                    <td>总货款</td>
                    <td>运费</td>
                    <td>送货方式与时间</td>
                    <td>付款方式</td>
                    <td>订单状态</td>
                    <td>订单详情</td>
                    <td>处理订单</td>
                  </tr>
            <asp:repeater ID="repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("DdOrderId") %></td>
                        <td><%# Eval("DdOrderDate") %></td>
                        <td><%# Eval("DdOrderAmount")%></td>
                        <td><%# Eval("DdOrderYunfei") %></td>
                        <td><%# Eval("DdOrderSend") %></td>
                        <td><%# Eval("DdOrderPay") %></td>
                        <td><%# Eval("DdOrderState") %></td>
                        <td>
                            <a href="javascript:void(0);" class="xiangqin">查看</a>
                        </td>
                        <td>
                            <a href="javascript:void(0);" onclick="" class="xiangqin">取消</a>
                            <a href='https://pay3.chinabank.com.cn/PayGate?orderid=<%# Eval("DdOrderId") %>'  class="xiangqin">付款</a>
                        </td>
                     </tr>
                </ItemTemplate>
            </asp:repeater>
                 </table>
      	    </div>
        </div>
    </div>
</center>
</body>
<script language="javascript" type="text/javascript" src="js/myorder.js"></script>
</html>
