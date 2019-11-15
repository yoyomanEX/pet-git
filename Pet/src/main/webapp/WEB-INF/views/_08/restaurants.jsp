<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET你ʕ•ᴥ•ʔ食飯</title>
</head>
<body>
<h1 align="center">PET你ʕ•ᴥ•ʔ食飯</h1>
<p>
<hr>
<div class='center' >
	<h2>restaurants資料</h2>
	<c:if test='${empty allrestaurants}'>
		查無restaurants資料<br>
	</c:if>
	<c:if test='${not empty allrestaurants}'>
		<c:forEach var='restaurants' varStatus='vs' items='${allrestaurants}'>
			<c:if test ='${vs.first}'>
				<c:out value="<table border='1'>" escapeXml='false'/>
				<c:out value="<tr><td>編輯</td><td>ID</td><td>NAME</td><td>ADDRESS</td><td>TEL</td>" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td width='70'><a href='restaurants/${restaurants.restaurant_id}'>
					Update
					</a>
				</td>
				<td>${restaurants.restaurant_id}</td>
				<td>${restaurants.restaurant_name}</td>
				<td>${restaurants.restaurant_address}</td>
				<td>${restaurants.restaurant_tel}</td>
							
			</tr>
			<c:if test ='${vs.last }'>
				<c:out value="</table>" escapeXml='false'/>
			</c:if>
		</c:forEach>
	</c:if>
<p/>
<a href='${pageContext.request.contextPath}/_08/index_hospital'>回到_08---管理</a>
</div>
<hr>

</body>
</html>