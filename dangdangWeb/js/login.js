// JavaScript Document
function $(id) {
    return document.getElementById(id);
}

function shubiaoclick(kind,flag)
{
	if (flag ==1)
	{
		$(kind+"input").className="danji";
		$(kind+"helpspan").style.display="inline-block";
		$(kind+"warnspan").style.display="none";
	}
	else
	{
		$(kind+"input").className="";
		$(kind+"helpspan").style.display="none";
	}
}

function shubiaoover(obj,flag)
{
	if (flag == 1)
	{
		obj.className="over";
	}
	else
	{
		obj.className="";
	}
}

String.prototype.trim=function(){return this.replace(/(\s*$)|(^\s*)/g, '');};

function check()
{
	/*非空验证*/
	var name=$("nameinput").value.trim();
	if ( name == '')
	{
		$("namewarnspan").style.display="inline-block";
		return false;
	}
	var pass=$("passinput").value.trim();
	if ( pass == '')
	{
		$("passwarnspan").style.display="inline-block";
		return false;
    }
    location.href = "CheckLogin.aspx?username=" + name + "&userpass=haha" + pass;//利用js跳转页面


}