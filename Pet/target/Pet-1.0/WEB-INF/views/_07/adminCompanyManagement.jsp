<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="margin: 0px auto;">
		<tr height="52" bgcolor="lightblue" align="center">
			<td width="350"><p align="left" /> <a
				href='${pageContext.request.contextPath}/reviewCompany'>待審核廠商資料</a><BR></td>
			<td width="350"><p align="left" /> 
			<!--這的href是導向HomeController裡的@RequestMapping("/welcome")名字 -->
				<a href='${pageContext.request.contextPath}/adminCompanyList'>已上架廠商</a><BR></td>
			<td width="350"><p align="left" /> <a
				href='${pageContext.request.contextPath}/obtainedCompany'>已下架廠商</a><BR></td>
		
		</tr>
	</table>
</body>
</html>