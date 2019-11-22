<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<c:set var="memberName" value="${ LoginOK.name }" />
<h1>訪客${ memberName }</h1>

<img width='60' height='72' src='getPicture' />


</body>
</html>