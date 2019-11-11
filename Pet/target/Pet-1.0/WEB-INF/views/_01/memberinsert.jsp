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
<form:form modelAttribute="MemberBean" action='_01.saveMember'
			method='POST'>
		<table>
			<tr>
				<td>member_Id</td>
				<td><form:input path='member_Id' /><span id="sp1"></span></td>
			</tr>
			<tr>
				<td>name</td>
				<td><form:input path='name' /></span></td>
			</tr>
			<tr>
				<td>password</td>
				<td><form:input path='password' /></span></td>
			</tr>
			<tr>
				<td>address</td>
				<td><form:input path='address' /></span></td>
			</tr>
			<tr>
				<td>email</td>
				<td><form:input path='email' /><span id="sp5"></span></td>
			</tr>
			<tr>
				<td>tel</td>
				<td><form:input path='tel' /><span id="sp6"></span></td>
			</tr>
		</table>
	</form:form>
	<button id="b1">確定</button>
	</div>
</body>
</html>