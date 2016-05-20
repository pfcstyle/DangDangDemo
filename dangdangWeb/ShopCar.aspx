<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopCar.aspx.cs" Inherits="ShopCar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>购物车</title>
    <link href="css/cart.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
    <div id="content">
        <div id="body">
    	    <div id="tu"></div>
            <ul>
                <li class="name">商品名称</li>
                <li class="jifen">积分</li>
                <li class="lowprice">当当价</li>
                <li class="sheng"><span title ="在当当价基础上再优惠">&nbsp;&nbsp;&nbsp;优惠&nbsp;&nbsp;&nbsp;</span></li>
                <li class="num">数量</li>
                <li class="operate">操作</li>
            </ul>
            <div id="nogood">
        	    <p>您还没有挑选商品，<a href="Index.aspx" target="_self">去首页看看&gt;&gt;</a></p>
            </div>
            <div id="goodlist">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
        	    <div class="goodinfo" id="gooddiv<%# Container.ItemIndex +1 %>" >
            	    <span class="mingcheng"><a href='Product.aspx?productid=<%# Eval("DdProductId") %>' target="_blank"><img src='<%# Eval("DdProductSmallImage","images/{0}") %> '/></a><p><a href='Product.aspx?productid=<%# Eval("DdProductId") %>' target="_blank"><%# Eval("DdProductName") %></a></p></span><span class="fenshu">0</span><span class="dijia">￥&nbsp;<%# Eval("DdProductLowPrice")%>&nbsp;</span><span class="jiesheng">减￥&nbsp;<%# Eval("DdProductChaPrice") %></span><span class="shuliang"><input type="text" id="maishuliang<%# Container.ItemIndex +1 %>" value='<%# Eval("DdProductNumber") %>' disabled="disabled"/><a href="javascript:void(0);"  onclick="gaishuliang(<%# Container.ItemIndex +1 %>,1);" class="tiaoshu" id="xiangshang"></a><a href="javascript:void(0);" onclick="gaishuliang(<%# Container.ItemIndex +1 %>,0);" class="tiaoshu" id="xiangxia"></a></span><span class="caozuo"><a href="javascript:void(0);" onclick="shanchushangping(<%# Container.ItemIndex +1 %>);">删除</a></span>
                    <input type="hidden" id="hide<%# Container.ItemIndex +1 %>" value='<%# Eval("DdProductId") %>'/>
                    <div class="xiaoxidiv" id="xiaoxidiv<%# Container.ItemIndex +1 %>">
                	    <div class="xinxidiv">
                    	    <p id="messagep<%# Container.ItemIndex +1 %>">修改成功！<br/>你购买的商品总金额为: ￥<font color="red">234.15</font><br/><a href="javascript:void(0);" onclick="guanbitishidiv(1);">关闭</a></p>
                        </div>
                        <div class="jiantoudiv"></div>
                    </div>
                    <div class="shanchudiv" id="shanchudiv<%# Container.ItemIndex +1 %>">
                        <div class="neirongdiv">您确定要删除吗？<br/><a href="javascript:void(0);" onclick="quedingshanchu(<%# Container.ItemIndex +1 %>);">确定</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="quxiaoshanchu(<%# Container.ItemIndex +1 %>);">取消</a></div>
                        <div class="arrowdiv"></div>
                    </div>    
                </div>
                </ItemTemplate>
            </asp:Repeater>       
            </div>
            <div id="jiesuan">
        	    <p>商品金额总计：&nbsp;￥&nbsp;<asp:Label ID="qianshu" runat="server" Text=""></asp:Label></p><br/>
                <p>
            	    <a href="Index.aspx" id="jixugouwu" target="_self">继续购物</a>&nbsp;
                    <a href="OrderInfo.aspx" id="qujiesuan"></a>
                </p>
            </div>       
        </div>
    </div>
    <script language="javascript" type="text/javascript" src="js/cart.js"></script>
    </center>
</body>
</html>