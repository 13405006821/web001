<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <title>登录页</title>
	<script language="javascript" src="${ROOT_PATH}/public/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ROOT_PATH}/public/style/login.css">
</head>
<body>
	<div class="loginBoard">
	<form name="LoginForm" id="loginbox" method="post">
		<div class="LoginTitle"><h3></h3></div>
		<ul>
			<li class="loginBoardTitle">
				<b></b>
			</li>
			<li id="err" class="forget"></li>
			<li>
				<label for="account" class="txt">用户名:</label>
				<span class="login_panel_username"><input  type="text" id="account" class="w200 username" ></span>
			</li>
			<li>
				<label for="password" class="txt">密&nbsp;&nbsp;码:</label>
				<span class="login_panel_password"><input maxlength="20" type="password" id="password" class="w200 password" ></span>
			</li>
			<li>
				<input type="button" id="subut" value="" class="buttonbox">
			</li>
		</ul>
	</form>
</div>
<script>
$(document).ready(function(){
	if (top.location != self.location){   
		top.location=self.location;   
	} 

	$('#loginbox').keydown(function(e){
		if(e.keyCode==13){
			$('#subut').click(); //处理事件
		}
	});

	$('#subut').click(function(){
		var user = $('#account').val();
		var pwd = $('#password').val();
		//验证输入是否符合格式要求
        if(check()){
			$.post("${ROOT_PATH}/admin/validateLogin.do",
				{'account':user,'password':pwd},
				function(r){
					if(r.result) {
						window.location.href = "${ROOT_PATH}/admin/main.html";
					}else{
						$("#err").text(r.message);
					}
				}, 'json'
			);
		};
	});

	function check(){
        $("#err").html("");
        var uid = $.trim($("#account").val());
        var psd = $("#password").val(); 
        if(uid===""){
        	$("#err").text("请输入用户名");
            $("#account").focus();
            return false;
        };
        if(psd===""){
        	$("#err").text("请输入密码");
            $("#password").focus();
            return false;
        };
        if(!uid || uid.length>10 ||uid.length<3){
            $("#err").text("请输入用户名字符长度为3-10个字符");
            $("#account").focus();
            return false;
        };
        if(!psd || psd.length<6 || uid.length>18){
            $("#err").text("请输入密码字符长度为6-18个字节");
            $("#password").focus();
            return false;
        };
        return true;
    };
});
</script>
</body>
