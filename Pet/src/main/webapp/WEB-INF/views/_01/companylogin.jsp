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
<form:form modelAttribute="CompanyBean" action='_01.loginCompany'
			method='POST'>
		<table>
			<tr>
				<td>company_id</td>
				<td><form:input path='company_id' /><span id="sp1"></span></td>
			</tr>
			<tr>
				<td>company_password</td>
				<td><form:input path='company_password' /></span></td>
			</tr>
		</table>
	</form:form>
	<button id="b1">確定</button>
	</div>
</body>
</html>