<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商品详细信息</title>
    <link href="css/product.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <center>
    <div id="content">
           <div id="body">
    	    <div id="name"><asp:Label ID="namelabel" runat="server" Text=""></asp:Label></div>
        <div id="datu">
        	<a href="#"><asp:Image ID="datuimage" runat="server" /></a>
            <span id="remai">
                </span>
            <a id="fangda" href="#"></a>
        </div>
        <div id="xiangqing">
        	<div><span id="shangjia">当当网</span></div><br/>
            <p><label>当&nbsp;当&nbsp;价：￥</label><asp:Label ID="lowpricelabel" runat="server"
                    Text="" class="lowprice"></asp:Label></p>
            <p><label>市&nbsp;场&nbsp;价：￥</label><asp:Label ID="pricelabel" runat="server" Text=""></asp:Label><span>(为您节省￥ 
    <asp:Label ID="chapricelabel" runat="server" Text=""></asp:Label>)</span></p>
            <p><label>顾客评分：</label><span><img src="images/star_red.gif"/><img src="images/star_red.gif"/><img src="images/star_red.gif"/><img src="images/star_red.gif"/><img src="images/star_red.gif"/></span><a href="#">&nbsp;&nbsp;已有<span>808</span>人评论</a></p>
            <p><label>库&nbsp;&nbsp;&nbsp;&nbsp;存：</label><asp:Label ID="youhuolabel"
                    runat="server" Text="" class="youhuo"></asp:Label></p><br/><br/>
            <div id="goumai">
            	<div>我要买：&nbsp;<input id="shulianginput" type="text"  onkeyup="checknum('shulianginput');"/>&nbsp;件<span id="shuliang">数量超过10请联系010-88888888！</span></div><br/>
                <div><button type="button" onclick="addtoshopcart();" class="mai"></button><button type="button" class="cang"></button></div>
            </div>
            <div id="jifen">送积分：&nbsp;&nbsp;<span id="fen">660</span>&nbsp;&nbsp;收藏人气：&nbsp;&nbsp;<span id="qi">2954</span></div>
            <asp:Label ID="productidlabel" runat="server" Text=""></asp:Label>
            <asp:Label ID="productsmallimage" runat="server" Text=""></asp:Label>
        </div>
    </div>
        </div>
    </center>

</body>
<script language="javascript" type="text/javascript" src="js/product.js"></script>
</html>
