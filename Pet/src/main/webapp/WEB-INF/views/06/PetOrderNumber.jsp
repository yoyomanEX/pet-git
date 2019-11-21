<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<h2>訂單資料</h2>
	您的訂單已成功下單，您的訂單編號為：${orderNumber}，我們會盡快為您安排出貨。
	<br> 可至
	<a href="${pageContext.request.contextPath}/06/PetOrderAll">訂單明細</a>查看出貨狀況唷！
</body>
</html>