// JavaScript Document
function $(id) {
    return document.getElementById(id);
}

function gaishuliang(index,flag)
{
	var number=parseInt($("maishuliang"+index).value);
	var message="";
	var total=0;
	
	if (flag ==1)
	{
		number=number+1;
		if (number > 9)
		{
			number=number-1;

			message = '温馨提示！<br/>请联系大客户热线：010-88888888<br/><a href="javascript:void(0);" onclick="guanbitishidiv(' + index + ');">关闭</a>';
			//显示提示信息DIV
			$("messagep" + index).innerHTML = message;
			$("xiaoxidiv" + index).style.display = "block";
		}
		else
		{
		    //通过AJAX修改并重新计算总金额total
		    var xmlHttp = new XMLHttpRequest();
		    //获取需传递到服务器的值
		    var productid = parseInt($("hide" + index).value);
		    //配置对象
		    xmlHttp.open("get", "UpdateShopCar.aspx?productid=" + productid + "&productnumber=" + number + "&time" + new Date().getTime());
		    //设置回调函数
		    xmlHttp.onreadystatechange = function () {
		        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		            total = xmlHttp.responseText;
		            message = '修改成功！<br/>你购买的商品总金额为: ￥<font color="red">' + total + '</font><br/><a href="javascript:void(0);" onclick="guanbitishidiv(' + index + ');">关闭</a>';
		            //显示提示信息DIV
		            $("messagep" + index).innerHTML = message;
		            $("xiaoxidiv" + index).style.display = "block";
		            //在结算区显示总金额
		            $("qianshu").innerHTML = total;
		        }
		    }
		    //发送请求
		    xmlHttp.send(null);
			//message='修改成功！<br/>你购买的商品总金额为: ￥<font color="red">'+total+'</font><br/><a href="javascript:void(0);" onclick="guanbitishidiv('+index+');">关闭</a>';
		}
		
		$("maishuliang"+index).value=number;
		
	}
	else
	{
		number=number-1;
		if (number == 0)
		{
			number=number+1;

			message = '温馨提示！<br/>请单击右边的 删除 链接删除！<br/><a href="javascript:void(0);" onclick="guanbitishidiv(' + index + ');">关闭</a>';
			//显示提示信息DIV
			$("messagep" + index).innerHTML = message;
			$("xiaoxidiv" + index).style.display = "block";
		}
		else
		{
		    //通过AJAX修改并重新计算总金额total(商品编号在id为'hide'+index的元素值)
		    //通过AJAX修改并重新计算总金额total
		    var xmlHttp = new XMLHttpRequest();
		    //获取需传递到服务器的值
		    var productid = parseInt($("hide" + index).value);
		    //配置对象
		    xmlHttp.open("get", "UpdateShopCar.aspx?productid=" + productid + "&productnumber=" + number + "&time" + new Date().getTime());
		    //设置回调函数
		    xmlHttp.onreadystatechange = function () {
		        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		            total = xmlHttp.responseText;
		            message = '修改成功！<br/>你购买的商品总金额为: ￥<font color="red">' + total + '</font><br/><a href="javascript:void(0);" onclick="guanbitishidiv(' + index + ');">关闭</a>';
		            //显示提示信息DIV
		            $("messagep" + index).innerHTML = message;
		            $("xiaoxidiv" + index).style.display = "block";
		            //在结算区显示总金额
		            $("qianshu").innerHTML = total;
		        }
		    }
		    //发送请求
		    xmlHttp.send(null);
			//message='修改成功！<br/>你购买的商品总金额为: ￥<font color="red">'+total+'</font><br/><a href="javascript:void(0);" onclick="guanbitishidiv('+index+');">关闭</a>';
		}
		$("maishuliang"+index).value=number;
		
	}
	//显示提示信息DIV
	$("messagep"+index).innerHTML=message;
	$("xiaoxidiv"+index).style.display="block";
	//在结算区显示总金额
}


function guanbitishidiv(index)
{
	$("xiaoxidiv"+index).style.display="none";
}

function shanchushangping(index)
{
	$("shanchudiv"+index).style.display="block";
}

function quxiaoshanchu(index)
{
	$("shanchudiv"+index).style.display="none";
}

function quedingshanchu(index)
{
    $("shanchudiv" + index).style.display = "none";
    //获取需要删除的商品ID
    var productid = parseInt($("hide" + index).value);
    //
    //通过AJAX从购物车中删除商品并重新计算总金额total
    var xmlHttp = new XMLHttpRequest();
    //
    //配置对象
    xmlHttp.open("get", "UpdateShopCar.aspx?productid=" + productid + "&productnumber=0&time" + new Date().getTime());
    //设置回调函数
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            total = xmlHttp.responseText;
            if (parseInt(total) != 0) {
                ////刷新商品列表
                $("gooddiv" + index).style.display = "none";
                //在结算区显示总金额
                $("qianshu").innerHTML = total;
            } else {
                $("jiesuan").style.display = "none";
                $("goodlist").style.display = "none";
                $("nogood").style.display = "block";
            }
        }

    }

    //发送请求
    xmlHttp.send(null);
}