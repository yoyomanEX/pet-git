<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<script type="text/javascript">
		function showpostblog(no) {
			// $.ajax({
			// 	type: "GET",
			// 	url: "deleteBlog?id=" + no,

			// 	success: function (response) {
			// 		if (response) {
			// 			alert("刪除成功")
			// 		} else {
			// 			alert("刪除失敗")


			// 		}
			// 	}
			// });
			alert("Blog ID",no)
		}
		
		function showArt(data){
			var text="";
			var artss=JSON.parse(data);
			var txt = "<th>日期<th>作者<th>內容<檢舉>";
			for(i=0;i<artss.length;i++){
				var postTime="";
				if(artss[i].postTime!='' && typeof artss[i].postTime!='undefined'){
					var v1 = new Date(artss[i].postTime);
					postTime = v1.getFullYear()+"-"+(v1.getMonth()+1)+''+addZero(v1.getDate(),2);
				}
				
//	 			txt +="<tr><td>" + postTime;
				txt +="<td>" + artss[i].postTime;
				txt +="<td>" + artss[i].memberId;
				txt +="<td>" + artss[i].content;
			}
			document.getElementById("").innerHTML=txt;
			
		}
	</script>


</head>

<body>
	<div style="width: 550px; margin: 0 auto;">

		<table>
			<tr>
				<th>日期</th>
				<th>標題</th>
				<th>作者</th>
            </tr>

				<c:forEach items="${arts }" var="art" varStatus="s">
			<tr>
				<td>${art.postTime}</td>
				<td>${art.title}</td>
				<td>${art.memberId}</td>

				<td><button class="b1" value="${art.no}">修改</button></td>
				<td><button class="b2" value="${art.no}" onclick="showpostblog('${art.no}')">刪除</button></td>
			</tr>
			   </c:forEach>
		</table>
	</div>
</body>

</html>