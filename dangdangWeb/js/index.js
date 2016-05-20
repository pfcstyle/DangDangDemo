// JavaScript Document
function $(id) {
    return document.getElementById(id);
}

var curindex=1;

function zidong()
{
	for ( var i=1;i<=3;i++)
	{
		$("img"+i).style.display="none";
		$("a"+i).className="";
	}
	$("img"+curindex).style.display="block";
	$("a"+curindex).className="dangqian";
	curindex=curindex+1;
	if (curindex > 3)
	{
		curindex=1;
	}
}

var zidongid=window.setInterval("zidong()",2000);

function ting(index)
{
	window.clearInterval(zidongid);
	curindex=index;
	for ( var i=1;i<=3;i++)
	{
		$("img"+i).style.display="none";
		$("a"+i).className="";
	}
	$("img"+curindex).style.display="block";
	$("a"+curindex).className="dangqian";	
}

function zou()
{
	curindex=curindex+1;
	if (curindex > 3)
	{
		curindex=1;
	}
	zidongid=window.setInterval("zidong()",2000);
}

function isIE_c(){
   return window.navigator.userAgent.toLowerCase().indexOf("msie")>=1?true:false;
}
//轮转广告
//slideimages数组为变换的图
var slideimages=new Array();
slideimages[0]="images/lunmaintu1.jpg";
slideimages[1]="images/lunmaintu2.jpg";
slideimages[2]="images/lunmaintu3.jpg";
slideimages[3]="images/lunmaintu4.jpg";
slideimages[4]="images/lunmaintu5.jpg";
slideimages[5]="images/lunmaintu6.jpg";


//slidetext数组为点击大图后跳到的地址
var slidelinks=new Array();
slidelinks[0]="#";
slidelinks[1]="#";
slidelinks[2]="#";
slidelinks[3]="#";
slidelinks[4]="#";
slidelinks[5]="#";
//焦点图初始内容－－start
var slidespeed=3000;


var filterArray=new Array();
filterArray[0]="progid:DXImageTransform.Microsoft.Pixelate (enabled=false,duration=2,maxSquare=25 )";
filterArray[1]="progid:DXImageTransform.Microsoft.Stretch (duration=1,stretchStyle=PUSH)";
filterArray[2]="progid:DXImageTransform.Microsoft.Stretch(duration=1)";
filterArray[3]="progid:DXImageTransform.Microsoft.Slide(bands=8, duration=1)";
filterArray[4]="progid:DXImageTransform.Microsoft.Fade ( duration=1,overlap=0.25 )";
filterArray[5]="progid:DXImageTransform.Microsoft.Stretch(duration=1)";

function tu_ove(){clearTimeout(setID);}

var setID;
var whichlink=0;
var whichimage=0;
var pixeldelay=0;
				
function gotoshow()
{
	window.open(slidelinks[whichlink]);
}
				
function slideit()
{
	var obj=document.getElementById("lunimg");
			
	obj.style.filter=filterArray[whichimage];//设置过滤方式
	
	//pixeldelay=obj.filters[0].duration*1000;
	
	if (isIE_c())
	{
	 	obj.filters[0].apply();
		obj.filters[0].play();			
	}
	obj.src=slideimages[whichimage];
				
	
	for (var j=1;j<=6;j++)
	{
		
		document.getElementById("lunimga"+j).className="";
		
	}			
	
	var index=whichimage+1;
	document.getElementById("lunimga"+index).className="lunshang";
	
				
				
				
	
	whichlink=whichimage;
	whichimage=(whichimage<slideimages.length-1)? whichimage+1 : 0;
	
	setID=setTimeout("slideit()",slidespeed);//+pixeldelay);
}

slideit();
function ove(n){
	clearTimeout(setID);
	whichimage=n;
	document.getElementById("lunimg").src=slideimages[whichimage];
	for (var j=1;j<=6;j++)
	{
		
		document.getElementById("lunimga"+j).className="";
		
	}			
	
	var index=whichimage+1;
	document.getElementById("lunimga"+index).className="lunshang";	
    
}
function ou()
{
	whichimage=(whichimage<slideimages.length-1)? whichimage+1 : 0;
	whichlink=whichimage;
	slideit();
}
function tu_ove()
{
	clearTimeout(setID);
}
		
/*公告*/
function shubiaoyidong(index)
{
	for (var i=1;i<=3;i++)
	{
		$("gonggaospan"+i).className="";
		$("gonggaodiv"+i).style.display="none";
	}
	$("gonggaospan"+index).className="ka";
	$("gonggaodiv"+index).style.display="block";
	
}





