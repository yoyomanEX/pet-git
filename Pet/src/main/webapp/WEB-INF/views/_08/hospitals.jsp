<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>醫院資料</title>
</head>
<body>
<p>
<hr>
<div class='center' >
	<h2>醫院資料</h2>
	<c:if test='${empty allHospitals}'>
		查無醫院資料<br>
	</c:if>
	<c:if test='${not empty allHospitals}'>
		<c:forEach var='hospitals' varStatus='vs' items='${allHospitals}'>
			<c:if test ='${vs.first}'>
				<c:out value="<table border='1'>" escapeXml='false'/>
				<c:out value="<tr><td>編輯</td><td>ID</td><td>NAME</td><td>ADDRESS</td><td>TEL</td>" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td width='70'><a href='hospitals/${hospitals.hospital_id}'>
					Update
					</a>
				</td>
				<td>${hospitals.hospital_id}</td>
				<td>${hospitals.hospital_name}</td>
				<td>${hospitals.hospital_address}</td>
				<td>${hospitals.hospital_tel}</td>
							
			</tr>
			<c:if test ='${vs.last }'>
				<c:out value="</table>" escapeXml='false'/>
			</c:if>
		</c:forEach>
	</c:if>
<p/>
<a href='${pageContext.request.contextPath}/_08/index_hospital'>回到醫院管理</a>
</div>
<hr>
<%--
   java.util.Enumeration<String> e = request.getAttributeNames();
    while (e.hasMoreElements()){
    	String name = e.nextElement();
    	Object value = request.getAttribute(name);
    	out.println(name + "==>" + value+ "<hr>");
    }
    
--%>




</body>
</html>