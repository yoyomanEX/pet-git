<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理員後台系統</title>
</head>
<body>
	<h1 style="text-align: center">管理員後台系統</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
		<!--這的href是導向HomeController裡的@RequestMapping("/welcome")名字 -->
			<td width="350"><p align="left" /> <a href='${pageContext.request.contextPath}/adminCompanyManagement'>(站方)廠商管理</a><BR>
			</td>
			
		</tr>

	</table>
</body>
</html>