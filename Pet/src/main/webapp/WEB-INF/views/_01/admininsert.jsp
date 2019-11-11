<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

	
</style>
<script type="text/javascript">


$(document).ready(function(){
	$("button").click(function(){
		
			$("form").submit();
		
	});
});

</script>
</head>
<body>
<div style="width:300px;margin:10% auto;">
<form:form modelAttribute="AdminBean" action='_01.saveAdmin'
			method='POST'>
		<table>
			<tr>
				<td>admin_Id</td>
				<td><form:input path='admin_Id' /><span id="sp1"></span></td>
			</tr>
			<tr>
				<td>name</td>
				<td><form:input path='name' /></span></td>
			</tr>
			<tr>
				<td>password</td>
				<td><form:input path='password' /></span></td>
			</tr>
			
		</table>
	</form:form>
	<button id="b1">確定</button>
	</div>
</body>
</html>