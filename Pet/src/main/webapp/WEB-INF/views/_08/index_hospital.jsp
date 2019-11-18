<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>資料管理(Info_for_REST)</title>
</head>  
<body>
<p>
<hr>
<div class='center' >
<h2>_08---管理</h2>
<br>
<a href='_08/getEmptyHospitalForm' >醫院資料新增</a><br>
<a href='_08/hospitals' >醫院資料查詢</a><br>
<br><!-- -------------------------------------------------------- -->
<a href='_08/getEmptyHotelForm' >Hotel資料新增</a><br>
<a href='_08/hotels' >Hotel資料查詢</a><br>
<br><!-- -------------------------------------------------------- -->
<a href='_08/getEmptyResForm' >restaurants資料新增</a><br>
<a href='_08/restaurants' >restaurants資料查詢</a><br>
<br>
<a href='${pageContext.request.contextPath}'>回前頁</a>
</div>
</body>
</html>