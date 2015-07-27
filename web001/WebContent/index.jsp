<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>登录页面</title>
		<!-- basic styles -->
		<link href="${ROOT_PATH }/public/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ROOT_PATH }/public/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		<!-- fonts -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${ROOT_PATH }/public/css/ace.min.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/css/ace-rtl.min.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ROOT_PATH }/public/css/ace-ie.min.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="${ROOT_PATH }/public/js/html5shiv.js"></script>
		<script src="${ROOT_PATH }/public/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf green"></i>
									<span class="red">${APPLICATION_SYSTEMNAME }</span>
								</h1>
								<h4 class="blue">&copy; ${APPLICATION_COMPANYNAME }</h4>
							</div>
							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												请输入用户名和密码
											</h4>
											<div class="space-6"></div>
											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名" />
															<i class="icon-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" />
															<i class="icon-lock"></i>
														</span>
													</label>
													<div class="space"></div>
													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label>
														<button type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															登陆
														</button>
													</div>
													<div class="space-4"></div>
												</fieldset>
											</form>
											<div class="social-or-login center">
												<span class="bigger-110"></span>
											</div>
											<div class="social-login center">
											</div>
										</div><!-- /widget-main -->
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->
		<!-- basic scripts -->
		<!--[if !IE]> -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<![endif]-->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ROOT_PATH }/public/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
			<script type="text/javascript">
				window.jQuery || document.write("<script src='${ROOT_PATH }/public/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
			</script>
		<![endif]-->
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ROOT_PATH }/public/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			function show_box(id) {
				jQuery('.widget-box.visible').removeClass('visible');
				jQuery('#'+id).addClass('visible');
			}
		</script>
		<div style="display:none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
		</div>
	</body>
</html>
