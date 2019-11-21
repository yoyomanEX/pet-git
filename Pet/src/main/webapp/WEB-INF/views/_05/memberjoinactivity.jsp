<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>All Activity</title>
<link rel="stylesheet"
	href="css/teacher.css"
	type="text/css">

</head>
<body>

	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>活動清單</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='memberjoin' items='${memberjoinactivity}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px ">
					<div  class="thumbnail" style="width: 320px; height: 340px">
						<div>
						<img width="200px" height="100px"
							src="<c:url value='/activitypicture/${memberjoin.activity_id}' /> " />
							</div>
						<div class="caption">
							<p><b style='font-size: 20px;'>${memberjoin.activity_title}</b></p>
							<p>${memberjoin.end_date}</p>
<%-- 							<p>${activity.activity_content}</p> --%>
<%-- 							<p>人數：${activity.current_number}/${activity.number_limit}</p> --%>

							<p>
							
								<a href="<spring:url value='/activity?activity_id=${activity.activity_id}' />"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a> 
<!-- 								<a -->
<%-- 									href="<spring:url value='product.json?id=${product.bookId}' />" --%>
<!-- 									class="btn btn-primary"> <span -->
<!-- 									class="glyphicon-info-sigh glyphicon"></span>JSON -->
<!-- 								</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
