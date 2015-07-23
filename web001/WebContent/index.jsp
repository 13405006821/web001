<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<link rel="stylesheet" href= "${ROOT_PATH }/public/ymPrompt/skin/simple_gray/ymPrompt.css" />
		<script src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script src="${ROOT_PATH }/public/js/utils.js"></script>
		<script src="${ROOT_PATH }/public/ymPrompt/ymPrompt.js"></script>
		<title>功能学习</title>
	</head>
	<body>
		<div class="container">
			<div class="content">
				<h4 class="contentNav mySource">
					功能学习
				</h4>
				<div class="tabBox classIng currBox">
					<table id="tbTable" class="normalTable">
						<tr>
							<th width="20%">序号</th>
							<th width="60%">功能点</th>
							<th width="20%">操作</th>
						</tr>
						<tr>
							<td>1</td>
							<td align="left">题目信息管理(静态分页)</td>
							<td><a href="${ROOT_PATH}/question.action">查看</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>