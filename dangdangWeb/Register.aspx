<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户注册</title>
    <link href="css/register.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div id="content">

    <div id="body">
    	<span id="zhucehelp"><a href="#">注册帮助</a></span>
        <div id="zhucewelcome">
        	<span id="welcometu"></span>
            <span id="zhuceshouji"><a href="#">使用手机号码注册</a>，安全方便且完全免费</span>
        </div>
        <div id="zhucebuzhou">
        	<span id="zhucetianxie">1.填写注册信息</span><span id="zhucechenggong">2.注册成功</span>
        </div>

   
        <p id="emailp" class="testp">
        	<label>Email地址：</label>
            <span id="emailinputspan" class="inputspan"><input type="text" id="txtemail" onblur="itemcheck('email')" onfocus="shurutishi('email');"/></span>
            <span id="emailspan" class="tishispan" style="display:inline-block;">请填写您常用的Email,方便您接收验证邮件、找回密码</span>
            <span id="emailokspan" class="checkok" style="display: none;"></span>
            <span id="emailerrorspan" class="checkerror" style="display:none;"></span>
        </p>
        <p id="passp">
        	<label>登录密码：</label>
            <span id="passinputspan" class="inputspan"><input type="password" id="txtpass" onblur="itemcheck('pass')" onfocus="shurutishi('pass');"/></span>
            <span id="passspan" class="tishispan" style="display:none;">密码可使用字母加数字或符号的组合,长度6-20个字符</span>
            <span id="passokspan" class="checkok" style="display: none;"></span>
            <span id="passerrorspan" class="checkerror" style="display:none;"></span>
        </p>   
        <p id="erpassp">
        	<label>确认密码：</label>
            <span id="erpassinputspan" class="inputspan"><input type="password" id="txterpass" onblur="itemcheck('erpass')" onfocus="shurutishi('erpass');"/></span>
            <span id="erpassspan" class="tishispan" style="display:none;">请再次输入您设置的密码</span>
            <span id="erpassokspan" class="checkok" style="display: none;"></span>
            <span id="erpasserrorspan" class="checkerror" style="display:none;"></span>
        </p>
        <p id="yanmap">
        	<label>验证码：</label>
          	<span id="yanmainputspan" class="inputspan"><input type="text" id="txtyanma" onblur="itemcheck('yanma')" onfocus="shurutishi('yanma');"/></span>
            <span id="yanmaspan" class="tishispan" style="display:none;">请输入验证码</span>
            <span id="yanmaokspan" class="checkok" style="display:none;"></span>
            <span id="yanmaerrorspan" class="checkerror" style="display:none;"></span>
        </p>
        <p class="tup">
        	<label></label>
        	<a href="#"><asp:Image runat="server" ImageUrl="~/GetValidateImage.aspx?flag=register"
             onClick="this.src='GetValidateImage.aspx?flag=register&temp='+Math.random();" /></a>
            <span id="kanbuqingspan">看不清？单击图片换张图</span>
        </p>  
        <p class="tongyip">
            <input type="checkbox" checked="checked" onclick="checktongyi(this,'tongyispan');"/>
            <span>我已阅读并同意《<a href="#">当当网交易条款</a>》和《<a href="#">当当网社区条款</a>》</span>
            <span id="tongyispan" style="display:none;" class="checkerror">抱歉，只有同意才能提交注册！</span>
        </p>
		<p>
        	<label></label>
        	<button type="button" onclick="checkall();" class="buttona" onmouseover="changebutton(this,1);" onmouseout="changebutton(this,0);"></button>
        </p>
   
    </div>

</div>
</center>
</body>
<script language=javascript type="text/javascript" src="js/register.js"></script>
</html>
