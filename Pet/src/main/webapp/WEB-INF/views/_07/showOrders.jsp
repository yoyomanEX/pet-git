<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <!DOCTYPE html> -->
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
</head>
<body>
<p>
<hr>
<div class='center' >
	<h2>表單下載</h2>
	<c:if test='${empty orderCharts}'>
		查無資料<br>
	</c:if>
	<c:if test='${not empty orderCharts}'>
		<c:forEach var='ordercharts' varStatus='vs' items='${orderCharts}'>
			<c:if test ='${vs.first }'>
				<c:out value="<table border='1'>" escapeXml='false'/>
				<c:out value="<tr><td>訂單編號</td><td>訂單日期</td><td>出貨日期</td><td>總金額</td></tr>" escapeXml='false'/>
			</c:if>
			
			<tr>
				<td width='100'>${ordercharts.order_id}</td>
				<td width='100'>${ordercharts.order_date}</td>
				<td width='100'>${ordercharts.ship_date}</td>
				<td width='100'>${ordercharts.total}</td>
			</tr>
			<c:if test ='${vs.last}'>
				<c:out value="</table>" escapeXml='false'/>
			</c:if>
		</c:forEach>
	</c:if>
<p/>
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