// JavaScript Document
function $(id)
{
	return document.getElementById(id);
}


function yidao(index)
{
	for (var i=1; i<=5; i++)
	{
		$("orderspan"+i).className="orderstate";
		$("orderlistdiv"+i).style.display="none";
	}
	$("orderspan"+index).className="orderstate xuanzhong";
	$("orderlistdiv"+index).style.display="block";
}

function xianshidiv(n,bindex,index)
{
	$(n+bindex+index).style.display="block";
}

function guanbidiv(n,bindex,index)
{
	$(n+bindex+index).style.display="none";
}

String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};

var chuye=0;
function fanye(obj,flag,index)
{
	
	if (flag == 1)
	{
		obj.className="focus";	
		//获取初始页码
		chuye=parseInt(obj.value.trim());
	}
	else
	{
		//检查输入是否正确（要求是正整数且不大于总页数，如错误则恢复原数）
		var shuru=obj.value.trim();	
		var zongshu=parseInt($("zongyeshu"+index).innerHTML);
		if (isNaN(shuru) || shuru.length == 0 || parseInt(shuru)<1 || parseInt(shuru) > zongshu)
		{
			
			alert("页数错误！");
			obj.value=chuye;
		}
		else
		{
			obj.value=shuru;
			//实现分页
			//控制相关按钮的显示与隐藏（当为第一页时'第一页'及'上一页'链接不显示，当为最后一页时'最后一页'及'下一页'链接不显示）
			if (shuru == 1)
			{
				$("qian"+index).style.display="none";
				$("hou"+index).style.display="inline-block";
			}
			else if (shuru == zongshu)
			{
				$("qian"+index).style.display="inline-block";
				$("hou"+index).style.display="none";
			}
			else
			{
				$("qian"+index).style.display="inline-block";
				$("hou"+index).style.display="inline-block";
			}
		}
		
		//还原样式
		obj.className="";
	}
}

