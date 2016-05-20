<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品列表</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
   <div  id="content">

        <div id="body">
    	<div id="guanggao"></div>
        <div id="meizhuang">
        	<h2>
                <p class="meitu"></p>
            	<div>
                    <a href="#" title="防晒隔离"  target="_blank">防晒隔离</a><span>|</span>
                    <a href="#" title="控油平衡"  target="_blank">控油平衡</a><span>|</span>
                    <a href="#" title="深层清洁"  target="_blank">深层清洁</a><span>|</span>
                    <a href="#" title="粉刺祛痘"  target="_blank">粉刺祛痘</a><span>|</span>
                    <a href="#" title="缤纷彩妆"  target="_blank">缤纷彩妆</a><span>|</span>
                    <a href="#" title="魅惑香氛"  target="_blank">魅惑香氛</a><span>|</span>
                    <a href="#" title="头发护理"  target="_blank">头发护理</a><span>|</span>
                    <a href="#" title="清凉沐浴"  target="_blank">清凉沐浴</a>
                </div>
			</h2>
            <div id="chanpin">
            	<div id="zuolie">
    				<a id="img1" class="img" onmouseover="ting(1);" onmouseout="zou();" style="display:block;" href="#" title="大牌特卖" target="_blank"><img src="images/zuotu1.jpg" alt="大牌特卖" /></a>
                    <a id="img2" class="img" onmouseover="ting(2);" onmouseout="zou();"  href="#" title="玉兰油" target="_blank"><img src="images/zuotu2.jpg" alt="玉兰油" /></a>
                    <a id="img3" class="img" onmouseover="ting(3);" onmouseout="zou();" href="#" title="买宝洁高端发膜立减10元" target="_blank"><img src="images/zuotu3.jpg" alt="买宝洁高端发膜立减10元" /></a>
                    <span><a id="a1" class="dangqian" onmouseover="ting(1);" onmouseout="zou();" href="#"></a><a id="a2" onmouseover="ting(2);" onmouseout="zou();" href="#"></a><a id="a3" onmouseover="ting(3);" onmouseout="zou();" href="#"></a></span>
                </div>
            	<div id="zhonglie">
                	<ul>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                    	        <li>
                        	        <p><a href='Product.aspx?productid=<%# Eval("DdProductId") %>' target="_self"><img src='<%# Eval("DdProductImage","images/{0}") %>'/></a></p>
                                    <p><a href='Product.aspx?productid=<%# Eval("DdProductId") %>' target="_self"><%# Eval("DdProductName") %></a></p>
                                    <p><span>¥<%# Eval("DdProductLowPrice") %></span><span class="lowprice">¥<%# Eval("DdProductPrice") %></span></p>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <div id="zhongxia">
                    	<a href="#"><img  src="images/zhongxiatu1.jpg"/></a><a href="#"><img  src="images/zhongxiatu2.jpg"/></a><a href="#"><img  src="images/zhongxiatu3.jpg"/></a>
                    </div>
                </div>
                <div id="youlie">
                	<div id="youshang">
                    	<div>
                        	<a href="#"><img src="images/youshangtu1.jpg"/><span>54%</span></a><a href="#"><img src="images/youshangtu2.jpg"/><span>65%</span></a><a href="#"><img src="images/youshangtu3.jpg"/><span>70%</span></a>		
                        </div>
                        
                    </div>
                    <div id="youzhong"></div>
                    <div id="youxia">                 	
                    	<a href="#"><img src="images/youxiatu1.jpg"/></a><a href="#"><img src="images/youxiatu2.jpg"/></a><a href="#"><img src="images/youxiatu3.jpg"/></a><a href="#"><img src="images/youxiatu4.jpg"/></a><a href="#"><img src="images/youxiatu5.jpg"/></a><a href="#"><img src="images/youxiatu6.jpg"/></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="guanzhu"></div>
    </div>
    
</div>
</center>
</body>
</html>
