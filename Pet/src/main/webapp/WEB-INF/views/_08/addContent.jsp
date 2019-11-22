<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Backstage</title>
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
										<h5 class="card-title text-uppercase text-muted mb-0">Traffic</h5>
										<span class="h2 font-weight-bold mb-0">350,897</span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-danger text-white rounded-circle shadow">
											<i class="fas fa-chart-bar"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-success mr-2"><i
										class="fa fa-arrow-up"></i> 3.48%</span> <span class="text-nowrap">Since
										last month</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">New
											users</h5>
										<span class="h2 font-weight-bold mb-0">2,356</span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-warning text-white rounded-circle shadow">
											<i class="fas fa-chart-pie"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-danger mr-2"><i
										class="fas fa-arrow-down"></i> 3.48%</span> <span class="text-nowrap">Since
										last week</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Sales</h5>
										<span class="h2 font-weight-bold mb-0">924</span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-yellow text-white rounded-circle shadow">
											<i class="fas fa-users"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-warning mr-2"><i
										class="fas fa-arrow-down"></i> 1.10%</span> <span class="text-nowrap">Since
										yesterday</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Performance</h5>
										<span class="h2 font-weight-bold mb-0">49,65%</span>
									</div>
									<div class="col-auto">
										<div
											class="icon icon-shape bg-info text-white rounded-circle shadow">
											<i class="fas fa-percent"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-success mr-2"><i
										class="fas fa-arrow-up"></i> 12%</span> <span class="text-nowrap">Since
										last month</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
		<p>
		<hr>
		<div class="container">
			<h1 style="text-align: center">新增Content資料</h1>
		</div>
		<hr>
		<div class="container">
			<!--       三個地方要完全一樣 -->
			<form:form method='POST' modelAttribute="ContentBean"
				class='form-horizontal' enctype="multipart/form-data">
				<fieldset>
					<div class="form-group">
						<label class="control-label col-lg-2 col-lg-2" for='content_title'>
							標題 </label>
						<div class="col-lg-10">
							<form:input id="content_title" path="content_title" type='text'
								class='form:input-large' />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-lg-2 col-lg-2" for='content_sub'>
							內容 </label>
						<div class="col-lg-10">
							<form:input id="content_sub" path="content_sub" type='text'
								class='form:input-large' />
						</div>
					</div>
					<div class="form-group">
						<label class='control-label col-lg-2 col-lg-2' for="contentImg">
							圖片 </label>
						<div class='col-lg-10'>
							<form:input id="contentImg" path="contentImg" type="file"
								class="form:input-large" />
						</div>
					</div>
					<div class="form-group">
						<div class='col-lg-offset-2 col-lg-10'>
							<input id="btnAdd" type='submit' class='btn btn-primary'
								value="送出" />
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="row align-items-center justify-content-xl-between">
			<div class="col-xl-6">
				<div class="copyright text-center text-xl-left text-muted">
					&copy; 2019 <a href="#" class="font-weight-bold ml-1"
						target="_blank">pET ʕ•ᴥ•ʔ 陪你</a>
				</div>
			</div>
		</div>
	</footer>
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