<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Activity</title>
<link rel="stylesheet" href="css/teacher.css" type="text/css">
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>活動資訊</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<img width="100" height="200"
				src="<c:url value='/activitypicture/${activity.activity_id}' /> " />
			<div class="col-md-5">
				<h3>${activity.activity_title}</h3>
				<p>活動內容 ${activity.activity_content}</p>
				<p>報名人數 ${activity.current_number}/${activity.number_limit}</p>
				
				<c:if test="${already != 1 }">
				
					<c:choose>
						<c:when
							test='${activity.current_number != activity.number_limit }'>
							<p>報名
							<form action='peopleactivity' method="post">
								<input type="hidden" name='activity_id'
									value='${activity.activity_id}'><input type="submit"
									value='參加活動'>
							</form>
							</p>
						</c:when>
						<c:otherwise>
							<p>人數已滿</p>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${already == 1 }">
				<p>已報名</p>
				</c:if>
				<p>活動時間： ${activity.end_date}</p>
				<p>
<%-- 					<a href="<spring:url value='/products' />" class="btn btn-default"> --%>
<!-- 						<span class="glyphicon-hand-left glyphicon"></span>返回 -->
<!-- 					</a> -->
 <iframe 
      width="600" 
      height="450" 
      frameborder="0" 
      style="border:0" 
      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB0en-qV7XhFWwOPPqazsMhMV8j8RqdMqY&q=${activity.activity_add}" 
      allowfullscreen>
  </iframe>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
