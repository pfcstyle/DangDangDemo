// JavaScript Document
function $(id) {
    return document.getElementById(id);
}

function xiugaiguanbi(index)
{
	var neirong=$("xiugaia"+index).innerHTML;
	if (neirong == "[修改]")
	{
		$("xiugaia"+index).innerHTML="[关闭]";
		$("xuanzediv"+index).style.display="block";
	}
	else
	{
		$("xiugaia"+index).innerHTML="[修改]";
		$("xuanzediv"+index).style.display="none";
	}
}
String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};

function jiancha(index)
{
	var tianxieneirong="";
	switch (index)
	{
		case 1:
			if ($("name").value.trim() == "")
			{
				$("namespan").style.display="inline-block";
				return false;
			}
			if ($("dizhi").value.trim() == "")
			{
				$("dizhispan").style.display="inline-block";
				return false;
			}
			if ($("youbian").value.trim() == "")
			{
				$("youbianspan").style.display="inline-block";
				return false;
			}
			if ($("phone").value.trim() == "")
			{
				$("dianhuaspan").style.display="inline-block";
				return false;
			}

            tianxieneirong = $("name").value.trim() + " , " + $("dizhi").value.trim() + " , " + $("phone").value.trim() + " , " + $("youbian").value.trim();
            break;
        case 2:
             var annius = document.getElementsByName("songhuofangshi"); //数组，全部的送货方式
             for (var ai = 0; ai < annius.length; ai++) {
             if (annius[ai].checked) {
                tianxieneirong = annius[ai].value + " , " + $("songhuoshijian" + ai).value; //+" , "+$("songhuofeiyong"+ai).innerHTML;
                 var yunfei = 0;
                 var zong = parseFloat($("zongespan").innerHTML);
                 if (ai == 0) {
                    yunfei = zong > 29 ? 0 : 5;
                 } else if (ai == 1) {
                     yunfei = 10;
                 } else if (ai == 2) {
                     yunfei = (zong * 0.2 > 16 ? parseInt(zong * 0.2) : 16);
                 } else if (ai == 3) {
                     yunfei = 0;
                 }
                    $("yunfeispan").innerHTML = yunfei;
                    $("zhifuspan").innerHTML = (zong + yunfei);
                    break;
             }
         }

    break;
case 3:
    var annius = document.getElementsByName("fukuanfangshi");
    for (var ai = 0; ai < annius.length; ai++) {
        if (annius[ai].checked) {
            tianxieneirong = annius[ai].value;// " , " + $("fukuanspan" + ai).innerHTML;
            break;
        }
    }
    break;
	}
	
	$("xinxip"+index).innerHTML=tianxieneirong;
	$("xiugaia"+index).innerHTML="[修改]";
	$("xuanzediv"+index).style.display="none";
}

function zhanorsuo(index)
{
	if ($("hide"+index).value == 1)
	{
		$("hide"+index).value=0;
		$("fapiaoa"+index).className="headp headm";
		$("fapiaodiv"+index).style.display="block";
	}
	else
	{
		$("hide"+index).value=1;
		$("fapiaoa"+index).className="headp";
		$("fapiaodiv"+index).style.display="none";
	}
}

function xuantaitou(flag)
{
	if (flag == 1)
	{
		$("danwei").style.display="none";
	}
	else
	{
		$("danwei").style.display="inline-block";
	}
}

function  xuanfapiao(flag)
{
	if (flag ==1)
	{
		var fans=document.getElementsByName("taitou");	
		if (fans[1].checked)
		{
			var taitouneirong=$("danwei").value.trim();
			if (taitouneirong == "" || taitouneirong == "请填写单位名称")
			{
				$("warnspan").style.display="inline-block";
				return false;
			}
		}	
	}
	$("hide1").value=1;
	$("fapiaoa1").className="headp";
	$("fapiaodiv1").style.display="none";
}

function jihuo()
{
	if ($("kahaoinput").value.trim() == "")
	{
		$("kahaospan").style.display="inline-block";
		return false;
	}
	
	if ($("mimainput").value.trim() == "")
	{
		$("mimaspan").style.display="inline-block";
		return false;
	}
	
	$("hide2").value=1;
	$("fapiaoa2").className="headp";
	$("fapiaodiv2").style.display="none";
}

function gouxuan()
{
	if ($("fuxuan").checked)
	{
		$("gouxuanspan").style.display="none";
		return true;
	}
	else
	{
		$("gouxuanspan").style.display="inline-block";
		return false;
	}
}

function checkvalidatecode() {
    //通过ajax检查验证码

    var validatecode = $("validatecodeinput").value.trim();
    if (validatecode == "") {
        alert("请输入验证码！");
    } else {
        var xmlHttp = new XMLHttpRequest();

        //配置XMLHttpRequest对象
        xmlHttp.open("get", "CheckValidateCode.aspx?validatecode=" + validatecode + "&flag=orderinfo&time=" + new Date().getTime());

        //设置回调函数
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                result = parseInt(xmlHttp.responseText);
                if (result == 0) {
                    alert("验证码输入错误！");
                    $("validatecodeinput").value = "";
                    $("tijiaoanniu").style.display = "none";
                } else {
                    $("tijiaoanniu").style.display = "inline-block";
                }
            }
        }

        //发送请求
        xmlHttp.send(null);
    }


}
function tijiaodingdan()
{
	
    //检查收货信息是否填写完善
    if ($("name").value == "" || $("dizhi").value == "" || $("youbian").value == "" || $("phone").value == "") {
        alert("请确保收货人信息填写完整！");
        return;
    }
	//检查是否核对信息 
	if (!gouxuan())
	{
		return;
	}
    //检查验证码是否填写
    var validatecode = $("validatecodeinput").value.trim();
    if (validatecode == "") {
        alert("请输入验证码！");
        return;
    }
	//收集数据并提交 
    //获取收货人信息
    var name = $("name").value.trim();
    var dizhi = $("dizhi").value.trim();
    var youbian = $("youbian").value.trim();
    var phone = $("phone").value.trim();
    //获取送货方式信息
    var sendway = $("xinxip2").innerHTML.trim();
    //获取付费方式
    var payway = $("xinxip3").innerHTML.trim();
    //获取运费
    var yunfei = $("yunfeispan").innerHTML.trim();
    //获取货物总金额
    var zonge = $("zongespan").innerHTML.trim();

	window.location.href="OrderSuccess.aspx?name=" + name +"&dizhi=" + dizhi + "&youbian=" + youbian + "&phone=" + phone + "&sendway=" + sendway + "&payway=" + payway + "&yunfei=" + yunfei + "&zonge=" + zonge;
}