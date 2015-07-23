<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<table id="tbTable" class="normalTable">
	<tr>
		<th><input type="checkbox" onclick="checkAll(this);"/></th>
		<th>序号</th>
		<th>姓名</th>
		<th>生日</th>
		<th>手机号码</th>
		<th>操作</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="6">暂无数据</td>
		</tr>
	</c:if>
	<c:forEach items="${list}" var="question" varStatus="status">
		<tr>
			<td><input type="checkbox" value="${question.id}" class="ids"/></td>
			<td>${status.count}</td>
			<td>${question.name}</td>
			<td>${question.name}</td>
			<td>${question.name}</td>
			<td>
				<a href="javascript:;" class="enterClass green" onclick="info('${question.id}');">修改</a>
				<a href="javascript:;" class="endClass red" onclick="deleteData('${question.id}');">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
<pg:pager export="offset,currentPageNumber=pageNumber" items="${count}" isOffset="true" 
	maxPageItems="${pageSize}" maxIndexPages="${pageSize}" scope="request" index="center" url="question!table.action">
	<pg:param name="name" value="${name }" /> 
	<jsp:include page="/pages/base/ajaxPage.jsp" flush="true">
		<jsp:param value="listData" name="domId" />
	</jsp:include>
</pg:pager>