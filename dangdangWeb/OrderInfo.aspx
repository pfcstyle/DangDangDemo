<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderInfo.aspx.cs" Inherits="OrderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>订单详情</title>
    <link href="css/orderinfo.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div id="content">
    <div id="body">
    	<div id="tu"><a href="ShopCar.aspx">我的购物车</a></div>
        <div>请确认以下信息，然后提交订单</div>
        <div id="info">
        	<div class="infoitem">
            	<h3>收货人信息&nbsp;&nbsp;<a href="javascript:void(0);" id="xiugaia1" onclick="xiugaiguanbi(1);">[修改]</a></h3>
                <p class="xinxi" id="xinxip1">请填写收货信息</p>
                <div class="xuanze" id="xuanzediv1">
                	<div>
                    	<p class="item"><label>收&nbsp;货&nbsp;人：</label><input class="txtinput" id="name"/><span class="warnspan" id="namespan">请填写收货人姓名！</span></p>
                        <%--<p class="item"><label>地&nbsp;&nbsp;&nbsp;&nbsp;区：</label><select class="select" id="sheng"><option value="北京">北京</option><option value="上海">上海</option></select>&nbsp;<select class="select" id="shi"><option value="北京市">北京市</option></select>&nbsp;<select class="select" id="quxian"><option value="东城区">东城区</option><option value="西城区">西城区</option><option value="海淀区">海淀区</option><option value="朝阳区">朝阳区</option></select></p>--%>
                        <p class="item"><label>街道地址：</label><input class="txtinput" id="dizhi"/><span class="warnspan" id="dizhispan">请填写收货人详细地址！</span></p>
                        <p class="item"><label>邮&nbsp;&nbsp;&nbsp;&nbsp;编：</label><input class="txtinput" id="youbian"/><span class="warnspan" id="youbianspan">请填写收货地邮编！</span></p>
                        <%--<p class="item"><label>手&nbsp;&nbsp;&nbsp;&nbsp;机：</label><input class="txtinput" id="mobile"/></p>--%>
                        <p class="item"><label>固定电话：</label><input class="txtinput" id="phone"/><span class="warnspan" id="dianhuaspan">请填写收货人手机或固定电话！</span></p>
                        <p class="anniu"><button type="button" onclick="jiancha(1);">确认收货人信息</button></p>
                    </div>
                </div>
            </div>
            <div class="infoitem">
            	<h3>送货方式&nbsp;&nbsp;<a href="javascript:void(0);" id="xiugaia2" onclick="xiugaiguanbi(2);">[修改]</a></h3>
                <p class="xinxi"  id="xinxip2">普通快递送货上门</p>
                <div class="xuanze" id="xuanzediv2">
                	<div>
                    	<p class="radioitem"><input type="radio" class="radioinput" name="songhuofangshi" value="普通快递送货上门" checked="checked" /> &nbsp;普通快递送货上门 （支持货到付款）&nbsp;&nbsp;&nbsp;送货上门时间：&nbsp;<select id="songhuoshijian0"><option value="时间不限">时间不限</option><option value="周一至周五">周一至周五</option><option value="周六日及假日">周六日及假日</option></select>&nbsp;&nbsp;<span id="songhuofeiyong0">运费5元（购物满29元免运费）</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput" name="songhuofangshi" value="加急快递送货上门" /> &nbsp;加急快递送货上门 （支持货到付款）&nbsp;&nbsp;&nbsp;送货上门时间：&nbsp;<select id="songhuoshijian1"><option value="时间不限">时间不限</option><option value="周一至周五">周一至周五</option><option value="周六日及假日">周六日及假日</option></select>&nbsp;&nbsp;<span id="songhuofeiyong1">运费10元</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput" name="songhuofangshi" value="邮政特快专递 EMS" /> &nbsp;邮政特快专递 EMS （不支持货到付款）&nbsp;送货上门时间：&nbsp;<select id="songhuoshijian2"><option value="时间不限">时间不限</option><option value="周一至周五">周一至周五</option><option value="周六日及假日">周六日及假日</option></select>&nbsp;&nbsp;<span id="songhuofeiyong2">运费订单总金额的20%,最低16元</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput" name="songhuofangshi" value="自提" /> &nbsp;自提&nbsp;选择自提地点：&nbsp;<select id="songhuoshijian3"><option value="清华大学紫荆公寓2号楼西侧">清华大学紫荆公寓2号楼西侧</option><option value="北京大学学一食堂南门">北京大学学一食堂南门</option></select>&nbsp;&nbsp;<span id="songhuofeiyong3">请在三日内凭收货人身份证上门取货，代领请出示收货人与提货人的身份证</span></p>
                        <p class="anniu"><button type="button" onclick="jiancha(2);">确认送货方式</button></p>
                    </div>
                </div>
            </div>
            <div class="infoitem">
            	<h3>付款方式&nbsp;&nbsp;<a href="javascript:void(0);" id="xiugaia3" onclick="xiugaiguanbi(3);">[修改]</a></h3>
                <p class="xinxi"  id="xinxip3">货到付款（现金）</p>
                <div class="xuanze" id="xuanzediv3">
                	<div>
                    	<p class="radioitem"><input type="radio" class="radioinput1" name="fukuanfangshi" value="网上支付" checked="checked" /> &nbsp;网上支付&nbsp;&nbsp;&nbsp;<span id="fukuanspan0">请在提交订单后及时进行网上支付&nbsp;&nbsp;开户名&nbsp;：&nbsp;北京当当科文电子商务有限公司&nbsp; 开户行&nbsp;:&nbsp;光大银行北京安定门支行&nbsp;账号&nbsp;:&nbsp;087511120100302167678</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput1" name="fukuanfangshi" value="货到付款" /> &nbsp;货到付款&nbsp;&nbsp;&nbsp;<span id="fukuanspan1">请您在收货时向送货员支付订单款项（温情提示：自备零钱）</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput1" name="fukuanfangshi" value="邮局汇款 " /> &nbsp;邮局汇款&nbsp;&nbsp;&nbsp;<span id="fukuanspan2">请您在汇款单的 请按汇款种类 中选择 商务汇款，商户客户号为：110700150&nbsp;到款时间一般为2-7个工作日,所购商品将在款项到达当当网帐户后发出</span></p>
                        <p class="radioitem"><input type="radio" class="radioinput1" name="fukuanfangshi" value="银行转帐 " /> &nbsp;银行转帐&nbsp;&nbsp;&nbsp;<span id="fukuanspan3">到款时间一般为1-5个工作日&nbsp;&nbsp;开户名&nbsp;：&nbsp;北京当当科文电子商务有限公司&nbsp; 开户行&nbsp;:&nbsp;光大银行北京安定门支行&nbsp;账号&nbsp;:&nbsp;087511120100302167678</span></p>
                        <p class="anniu"><button type="button" onclick="jiancha(3);">确认付款方式</button></p>
                    </div>
                </div>
            </div>
            <div class="infoitem noborder">
            	<h3>商品清单&nbsp;&nbsp;</h3>
                <p class="xinxi">商家：当当网<span  id="xiugaia">[<a href="ShopCar.aspx">返回修改购物车</a>]</span></p>
                <div id="liebiao">
                    <ul>
                        <li class="name">商品名称</li>
                        <li class="lowprice">当当价</li>
                        <li class="num">数量</li>
                        <li class="jiner">金额</li>
                    </ul>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                           <div>
                    	       <span class="ming"><%# Eval("DdProductName") %></span><span class="jia">￥<%# Eval("DdProductLowPrice") %></span><span class="shu"><%# Eval("DdProductNumber") %></span><span class="qian">￥<%# Convert.ToDouble(Eval("DdProductLowPrice"))*Convert.ToInt32(Eval("DdProductNumber")) %></span>
                           </div>
                        </ItemTemplate>
                    </asp:Repeater>    
                </div>
                <div id="fapiao">
                	<p><a  class="headp" id="fapiaoa1" href="javascript:void(0);" onclick="zhanorsuo(1)">索取发票</a><input id="hide1" type="hidden" value="1"/></p> 
                    <div class="fapiao" id="fapiaodiv1">
                    	<p><label>发票抬头：</label><input type="radio" onclick="xuantaitou(1);" checked="checked" name="taitou"/>个人&nbsp;<input type="radio" onclick="xuantaitou(0);" checked="checked"  name="taitou"/>单位&nbsp;<input id="danwei" type="text" value="请填写单位名称" /></p>
                        <p><label>发票内容：</label><select><option value="图书">图书</option><option value="IT数码" selected="selected">IT数码</option><option value="家用电器">家用电器</option><option value="食品">食品</option></select></p>
                        <p class="zhuyi">注：数码、手机、家电类商品将默认打印出商品名称和型号</p>
                        <p><span id="quedingspan"><a id="quedinga" href="javascript:void(0);"  onclick="xuanfapiao(1);">确认</a></span><span id="quxiaospan"><a id="quxiaoa" href="javascript:void(0);" onclick="xuanfapiao(0);">暂不需要</a></span><span id="warnspan">请填写发票抬头</span></p>
                    </div>
                    <p><a  class="headp" id="fapiaoa2" href="javascript:void(0);" onclick="zhanorsuo(2)">展开使用礼品卡/礼券</a><input id="hide2" type="hidden" value="1"/></p>
                     <div class="fapiao" id="fapiaodiv2">
                     	<p>卡号：<input type="text" id="kahaoinput"/><span class="kas" id="kahaospan">请填写卡号</span></p>
                        <p>密码：<input type="text" id="mimainput"/><span class="kas" id="mimaspan">请填写密码</span></p>
                        <p><span id="jihuospan"><a id="jihuoa" href="javascript:void(0);"  onclick="jihuo();">激活</a></span></p>
                     </div>
                	<div id="jinertongji">
                    	<p>商品金额总计：￥&nbsp;<asp:Label ID="zongespan" runat="server" Text=""></asp:Label></p>
                        <p>运费：￥&nbsp;<asp:Label ID="yunfeispan" runat="server" Text=""></asp:Label></p>
                        <p>您需支付：￥&nbsp;<asp:Label ID="zhifuspan" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
            </div>
            <div id="tijiao">
            	<p><span id="gouxuanspan">请核对信息后勾选</span>&nbsp;<input id="fuxuan" type="checkbox" onclick="gouxuan();"/>&nbsp;请核对以上信息，点击"提交订单"即表示您同意接受&nbsp;<a href="#">当当网交易条款</a></p>                
                <p>请输入图片上的字符：<a href="#"><asp:Image ID="Image1" runat="server" ImageUrl="~/GetValidateImage.aspx?flag=orderinfo"
             onClick="this.src='GetValidateImage.aspx?flag=orderinfo&temp='+Math.random();" /></a>&nbsp;单击图片换图&nbsp;<input id="validatecodeinput" type="text" value="" onblur="checkvalidatecode();"/></p>
            	<p><a id="tijiaoanniu" href="javascript:void(0);" onclick="tijiaodingdan();"></a></p>
            </div>
        </div>
    </div>
    
</div>
</center>
</body>
<script language="javascript" type="text/javascript" src="js/orderinfo.js"></script>
</html>
