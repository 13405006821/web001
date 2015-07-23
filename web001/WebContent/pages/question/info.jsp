<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<link rel="stylesheet" href= "${ROOT_PATH }/public/ymPrompt/skin/simple_gray/ymPrompt.css" />
		<script type="text/javascript" src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${ROOT_PATH }/public/DatePicker/WdatePicker.js"></script>
		<script src="${ROOT_PATH }/public/ymPrompt/ymPrompt.js"></script>
		<title>题目信息</title>
	</head>
	<body>
		<form action="" id="dataForm">
			<input name="question.id" type="hidden" value="${id}"/>
			<div class="container">
				<div class="content">
					<h4 class="contentNav upload">题目信息</h4>
					<ul class="detailBox checkDetail uploadBox">
						<li>
							<label for="" class="cName">题目：</label>
							<div class="cCont">
								<textarea rows="3" style="width: 90%;" name="question.name">${question.name}</textarea>
							</div>
						</li>
						<li>
							<label for="" class="cName">答案A：</label>
							<div class="cCont">
								<s:textarea name="question.answerList[0].name" rows="3" style="width: 90%;"></s:textarea>
								<s:hidden name="question.answerList[0].id"></s:hidden>
							</div>
						</li>
						<li>
							<label for="" class="cName">答案B：</label>
							<div class="cCont">
								<s:textarea name="question.answerList[1].name" rows="3" style="width: 90%;"></s:textarea>
								<s:hidden name="question.answerList[1].id"></s:hidden>
							</div>
						</li>
						<li>
							<label for="" class="cName">答案C：</label>
							<div class="cCont">
								<s:textarea name="question.answerList[2].name" rows="3" style="width: 90%;"></s:textarea>
								<s:hidden name="question.answerList[2].id"></s:hidden>
							</div>
						</li>
						<li>
							<label for="" class="cName">答案D：</label>
							<div class="cCont">
								<s:textarea name="question.answerList[3].name" rows="3" style="width: 90%;"></s:textarea>
								<s:hidden name="question.answerList[3].id"></s:hidden>
							</div>
						</li>
					</ul>
					<input type="button" value="提交保存" onclick="saveOrUpdate();" class="btn uploadSm" />
				</div>
			</div>
		</form>
	</body>
	<script type="text/javascript">
		function saveOrUpdate(){
			var params = $("#dataForm").serialize();
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/question!saveOrUpdate.action',
				data : params,
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.succeedInfo({
							message:'保存成功',
							width:400,
							height:260,
							handler:function(){
								window.parent.ymPrompt.doHandler('error',true);
								window.parent.ajaxHtml('${ROOT_PATH}/question!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.errorInfo({
							message:'保存失败'
						});
					}
				}
			});
		}
	</script>
</html>