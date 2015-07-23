<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>后台管理系统</title>
	<script language="javascript" src="${ROOT_PATH}/public/js/jquery.js"></script>
	<script type="text/javascript" src="${ROOT_PATH}/public/js/extend.js"></script> 
	<script type="text/javascript" src="${ROOT_PATH}/public/js/litewin.js"></script>
	<script type="text/javascript" src="${ROOT_PATH}/public/admin/js/common.js"></script>
	<link type="text/css" rel="stylesheet" href="${ROOT_PATH}/public/admin/style/reset.css" media="screen">
	<link type="text/css" rel="stylesheet" href="${ROOT_PATH}/public/admin/style/frame.css" media="screen">
	<link type="text/css" rel="stylesheet" href="${ROOT_PATH}/public/admin/style/header.css" media="screen">
	<link type="text/css" rel="stylesheet" href="${ROOT_PATH}/public/admin/style/global.css" media="screen">
	<link type="text/css" rel="stylesheet" href="${ROOT_PATH}/public/css/page.css" media="screen">
</head>
<body>
	<div id="header">
        <div class="logo">
          <a href="javascript:">logo</a>
        </div>
        <div id="topDiv" class="headerNav">	
			<div id="tmenu" class="nav">
				<ul class="hmenu">
				<c:forEach items="${topMenu}" var="m" varStatus="mi">
					<li value="${mi.index}" <c:if test="${mi.index==0}">class="navon"</c:if>><a href='javascript:;' onclick='clickTop("${mi.index}");'>${m.thename}</a></li>
				</c:forEach>
				</ul>
			</div>
	    </div>
        <div class="uinfo">
			您好 , ${SESSION_LOGIN_USER.name}  <a class="ml10" href="javascript:void(0)" onclick="if(confirm('确定退出吗？')){logout();}">退出</a>
		</div>
	</div>
	<div id="contrator">
	<div id="menuTree">
		<div class="menu">
			<c:forEach items="${leftMenu}" var="lm" varStatus="lmi">
			<ul name="leftTop" <c:if test="${lmi.index!=0}">class="hide"</c:if>>
				<c:forEach items="${lm}" var="lm1" varStatus="lm2i">
				<li class="menulist">
					<div class="menutree1">
						<a hidefocus="true" href="javascript:;" class="mius">${lm1[0].parentname}</a>
					</div>
					<ul class='menusub'>
						<c:forEach items="${lm1}" var="lm2" varStatus="lm2i">
							<li><a href='javascript:;' onclick='clickLeft("${lm2.thelink}")'>${lm2.thename}</a></li>
						</c:forEach>
					</ul>
				</li>
				</c:forEach>
			</ul>
			</c:forEach>
		</div>
	</div>
<div id="main"><iframe scrolling="yes" frameborder="0" id="mainFrame"  src="${ROOT_PATH}/admin/manageCenter/welcome.html" name="mainFrame" name="main"></iframe></div>
</div>
<script type='text/javascript'>

function setSize(){
	var _headerH = $id("header").offsetHeight,
	_bodyH = document.documentElement.clientHeight;
	$id("contrator").style.height = (_bodyH - _headerH) + "px";
}

events.addEvent(window,"load",setSize);
events.addEvent(window,"resize",setSize);


	function clickTop(i) {
		$('.menu > ul:visible').addClass("hide");
		$('.menu > ul:eq('+i+')').removeClass("hide");
		$('.menu > ul:eq('+i+') ul:eq(0) a:eq(0)').click();
	}

	function clickLeft(t) {
	
		var url = "";
		if(t != 'set'){
			url = "${ROOT_PATH}/admin/"+t;
		}else{
			url = "http://${ppmeetHost}/?r=webservice/api/surveysetting";
		}
		$('#mainFrame').attr("src",url); 
	}

	function logout(){
		window.location.href = '${ROOT_PATH}/admin/logout.html';
	};	

	$(document).ready(function(){
		$(".menu .menusub li a").on('click', function() {
			$(".menu .menusub li a").removeClass('tabon');
			$(this).addClass('tabon');
			$(".menu ul li.menulist .menutree1").removeClass('asdfon');
			$(this).parent().parent().parent().find(".menutree1").addClass("asdfon");
		});
	
		$(".menu ul li a").on('click', function() {
			var thisa = $(this);
			$(this).parent().parent().find(".menusub").slideToggle(100,function(){
				if ($(this).css("display") == "block")
					thisa.removeClass("plus").addClass("mius");
				else
					thisa.removeClass("mius").addClass("plus");
			});
		});
	
		//$('.menu > ul:eq(0) ul:eq(0) a:eq(0)').click();
	
		var menusubList = $("ul[class='menusub']");
		for(var i = 0;i < menusubList.length;i++) {
			var subObj = menusubList.eq(i);
			var subHTML = subObj.html();
			if($.trim(subHTML) == "") {
				subObj.parent().remove();
			}
		}
		var topMenuList = $(".hmenu li");
		for(var i = 0;i < topMenuList.length;i++) {
			var subObj = topMenuList.eq(i);
			var subVal = subObj.val();
			var subHTML = $('.menu > ul:eq('+subVal+')').html();
			if($.trim(subHTML) == "") {
			//	subObj.remove();
			}
		}
	});
</script>
</body>
</html>