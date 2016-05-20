// JavaScript Document
function $(id) {
    return document.getElementById(id);
}

String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};
var neirong=0;
function checknum(obj)
{
	neirong=$("shulianginput").value.trim();
	if (isNaN(neirong) || neirong.length>1 || neirong == 0)
	{
		$("shuliang").innerHTML="数量不对，请重新输入！";
		$("shuliang").style.color="red";
		return false;
	}
	else
	{
		$("shuliang").innerHTML="数量超过10请联系010-88888888！";
		$("shuliang").style.color="blue";
		return true;
	}
}

function addtoshopcart()
{
	if (checknum("shulianginput"))
	{
	    var id = $("productidlabel").innerHTML;
	    var image = $("productsmallimage").innerHTML;
	    var name = $("namelabel").innerHTML;
	    var price = $("lowpricelabel").innerHTML;
	    var chaprice = $("chapricelabel").innerHTML;
	    var number = $("shulianginput").value;

	    location.href = "ShopCar.aspx?productid=" + id + "&productname=" + name + "&productsmallimage=" + image + "&productprice=" + price + "&chaprice=" + chaprice + "&productnumber=" + number;
	}
	else
	{
	    location.href = "ShopCar.aspx";
	}
	
}