<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新增restaurant資料</title>
</head>
<body>
	<p>
	<hr>
	<div class='center'>
		<h2>新增restaurant資料</h2>
		<form:form modelAttribute="res" action='restaurants'
			method='POST'>
			name:<form:input path='restaurant_name' /><p>
			address:<form:input path='restaurant_address' /><p>
			tel:<form:input path='restaurant_tel' /><p>
			<br> 
			<br> 
			<input type='submit' value='提交'> 
			<input type='reset' value='還原'> 
			<br> 
			<br> 
			<a href='${pageContext.request.contextPath}/_08/index_hospital'>回到_08---管理</a>
		</form:form>
	</div>
</body>
</html>