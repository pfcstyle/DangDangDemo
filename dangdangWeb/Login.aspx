<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div id="content">

 <div id="body">
    	<div id="loginshang"></div>
        <div id="loginzhong">
        	<p>
            	<span id="zuospan"></span>
                <span id="youspan">还不是当当用户？</span><a href="Register.aspx"></a>
            </p>
            
            <div><label>用户名</label><span class="inputspan"><input id="nameinput" onclick="shubiaoclick('name',1);" onblur="shubiaoclick('name',0);" type="text"/></span></div>
            <div><label></label><span id="namehelpspan" class="helpspan">请输入注册时的邮箱地址！</span><span id="namewarnspan" class="warnspan">请填写登录用的邮箱地址！</span></div>
            <div><label>密&nbsp;&nbsp;码</label><span  class="inputspan"><input id="passinput" onclick="shubiaoclick('pass',1);" onblur="shubiaoclick('pass',0);" type="password"/></span><a href="#">忘记密码</a></div>
            <div><label></label><span id="passhelpspan" class="helpspan">请填写长度为6-20个字符的密码！</span><span id="passwarnspan" class="warnspan">请填写登录密码！</span></div>
            <div><label></label><button onmouseover="shubiaoover(this,1);" onmouseout="shubiaoover(this,0);" onclick="check();" type="button"></button></div>
           
        </div>
        <div id="loginxia"></div>
    </div>

</div>
</center>
</body>
<script language="javascript" type="text/javascript" src="js/login.js"></script>
</html>
