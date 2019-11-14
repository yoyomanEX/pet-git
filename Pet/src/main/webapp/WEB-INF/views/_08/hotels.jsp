<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel資料</title>
</head>
<body>
<p>
<hr>
<div class='center' >
	<h2>Hotel資料</h2>
	<c:if test='${empty allHotels}'>
		查無醫院資料<br>
	</c:if>
	<c:if test='${not empty allHotels}'>
		<c:forEach var='hotels' varStatus='vs' items='${allHotels}'>
			<c:if test ='${vs.first}'>
				<c:out value="<table border='1'>" escapeXml='false'/>
				<c:out value="<tr><td>編輯</td><td>ID</td><td>NAME</td><td>ADDRESS</td><td>TEL</td>" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td width='70'><a href='hotels/${hotels.hotel_id}'>
					Update
					</a>
				</td>
				<td>${hotels.hotel_id}</td>
				<td>${hotels.hotel_name}</td>
				<td>${hotels.hotel_address}</td>
				<td>${hotels.hotel_tel}</td>
							
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