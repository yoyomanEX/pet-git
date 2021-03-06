<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
   <link rel="icon" href="${pageContext.request.contextPath}/img/about_icon.png">
<!-- Favicon -->
<%--   <link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png"> --%>
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
</head>

<body class="">
	<!-- Navigation -->
	<jsp:include page="header_admin.jsp"></jsp:include>
	<!-- Header -->
	<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
		<div class="container-fluid">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Hospital</h5>
										<span class="h2 font-weight-bold mb-0"> <a
											href='${pageContext.request.contextPath}/_08/hospitals'>管理醫院資料</a></span> 
											<p>
											<span
											class="h2 font-weight-bold mb-0"> <a
											href='${pageContext.request.contextPath}/_08/getEmptyHospitalForm'>醫院資料新增</a>
										</span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-danger text-white rounded-circle shadow">
											<!-- 											<i class="fas fa-chart-bar"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Hotel</h5>
										<span class="h2 font-weight-bold mb-0"><a href='${pageContext.request.contextPath}/_08/hotels'>管理旅館資料</a></span>
										<p>
										<span class="h2 font-weight-bold mb-0"><a
											href='${pageContext.request.contextPath}/_08/getEmptyHotelForm'>旅館資料新增</a></span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-warning text-white rounded-circle shadow">
											<!-- 											<i class="fas fa-chart-pie"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Restaurant</h5>
										<span class="h2 font-weight-bold mb-0"><a
											href='${pageContext.request.contextPath}/_08/restaurants'>餐廳資料管理</a></span> 
											<p>
											<span
											class="h2 font-weight-bold mb-0"><a
											href='${pageContext.request.contextPath}/_08/getEmptyResForm'>餐廳資料新增</a></span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-yellow text-white rounded-circle shadow">
											<!-- 											<i class="fas fa-users"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Announcement</h5>
										<span class="h2 font-weight-bold mb-0"><a
											href='${pageContext.request.contextPath}/_08/announcements'>公告資料管理 </a></span> 
											<p>
											<span
											class="h2 font-weight-bold mb-0"><a href='${pageContext.request.contextPath}/_08/contents'>站方文章管理</a></span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-info text-white rounded-circle shadow">
											<!-- 											<i class="fas fa-percent"></i> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
	<h1 style="margin:30px;" align="center">醫院資料管理</h1>
		<c:if test='${empty allHospitals}'>
		查無醫院資料<br>
		</c:if>
		<c:if test='${not empty allHospitals}'>
			<c:forEach var='hospitals' varStatus='vs' items='${allHospitals}'>
				<c:if test='${vs.first}'>
					<c:out value="<table border='1'>" escapeXml='false' />
					<c:out
						value="<tr><td>編輯</td><td>ID</td><td>NAME</td><td>ADDRESS</td><td>TEL</td>"
						escapeXml='false' />
				</c:if>

				<tr>
					<td width='70'><a href='hospitals/${hospitals.hospital_id}'>
							Update </a></td>
					<td>${hospitals.hospital_id}</td>
					<td>${hospitals.hospital_name}</td>
					<td>${hospitals.hospital_address}</td>
					<td>${hospitals.hospital_tel}</td>

				</tr>
				<c:if test='${vs.last }'>
					<c:out value="</table>" escapeXml='false' />
				</c:if>
			</c:forEach>
		</c:if>
		<p />
	</div>
	<hr>


	<!-- Footer -->

	<!--   Core   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>