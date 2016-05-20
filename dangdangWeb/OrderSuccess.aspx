<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSuccess.aspx.cs" Inherits="OrderSuccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>订单提交成功</title>
    <link href="css/ordersuccess.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div id="content">

 <div id="body">
    	<div id="tu"><a href="ShopCar.aspx">我的购物车</a></div>
        <div id="xinxi">
        	<p id="dingbu"><span id="oktu"></span><asp:Label ID="haospan" runat="server" Text=""></asp:Label><a href="#"> 查看订单状态&gt;&gt;</a></p>
            <p id="zhongbu">您需要在收货时向送货员支付<span id="qianspan">￥401.80</span></p>
        	<p id="dibu">* 您可以在<a href="MyOrders.aspx">我的订单</a>中查看或取消您的订单，由于系统需进行订单预处理，您可能不会立刻查询到刚提交的订单</p>
        </div>
    </div>

</div>
</center>
</body>
</html>
