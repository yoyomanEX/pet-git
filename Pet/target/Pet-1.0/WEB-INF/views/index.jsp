<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet陪你寵物網</title>
</head>
<body>
<!-- 網站首頁 -->
	<h1 style="text-align: center">Pet陪你寵物網</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
		<!--這的href是導向HomeController裡的@RequestMapping("/welcome")名字 -->
			<td width="350"><p align="left" /><a href='${pageContext.request.contextPath}/adminLogin'>管理員後台</a><BR>
			</td>
			<td width="350"><p align="left" /><a href='${pageContext.request.contextPath}/companyLogin'>廠商後台</a><BR>
			</td>
		</tr>

	</table>
</body>
</html>