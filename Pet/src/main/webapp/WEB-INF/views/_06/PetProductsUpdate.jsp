<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim</title>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
<
title>產品資料 </title> <script src ="http: //code.jquery.com /jquery-1.12.4.min.js
	 "> </script> <style type ="text /css">#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #000000;
	border-collapse: collapse;
	width: 60%;
	font-size: 20px;
}
</style>
</head>
<body>
<body class="">
<jsp:include page="header_admin.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
			<div class="container-fluid">
				<!-- Brand -->
				<a style='font-size: 30px;' class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="${pageContext.request.contextPath}/index.jsp">商品管理</a>
				<p>PRODUCT MANAGEMENT</p>
				<!-- Form -->
				<form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto" method="post" action="${pageContext.request.contextPath}/_06/queryOrder">
					<div class="form-group mb-0">
						<div class="input-group input-group-alternative">
							<div class="input-group-prepend">
								<span class="input-group-text">
									<i class="fas fa-search"></i>
								</span>
							</div>
							<input class="form-control" placeholder="輸入商品編號或名稱" name="orderSearch" type="text">
						</div>
					</div>
				</form>
				<!-- User -->
				<ul class="navbar-nav align-items-center d-none d-md-flex">
					<li class="nav-item dropdown">
						<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							
						</a>
						<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
							<div class=" dropdown-header noti-title">
								<h6 class="text-overflow m-0">Welcome!</h6>
							</div>
							<a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
								<i class="ni ni-single-02"></i>
								<span>My profile</span>
							</a>
							<a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
								<i class="ni ni-settings-gear-65"></i>
								<span>Settings</span>
							</a>
							<a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
								<i class="ni ni-calendar-grid-58"></i>
								<span>Activity</span>
							</a>
							<a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
								<i class="ni ni-support-16"></i>
								<span>Support</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#!" class="dropdown-item">
								<i class="ni ni-user-run"></i>
								<span>Logout</span>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
		<!-- Header -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-3 pt-3 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Product Management</h5>
											<span class="h2 font-weight-bold mb-0">
												<a href="${pageContext.request.contextPath}/_06/petProductsAll">商品管理</a>
											</span>
										</div>
										<div class="col-auto"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">Add Product</h5>
											<span class="h2 font-weight-bold mb-0">
												<a href="${pageContext.request.contextPath}/_06/petProductsNew">新增商品</a>
											</span>
										</div>
										<div class="col-auto"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div align="center">
				<h2>更新商品</h2>
				<form method="post" action="${pageContext.request.contextPath}/_06/petProductUpdateDone" enctype="multipart/form-data">
					<table id="customers">
						<tr>
							<td>商品ID</td>
							<td>
								<input type="text" disabled value="${pb.product_id}">
							</td>
							<td>
								<input type="hidden" value="${pb.product_id}" name="productId">
								<input type="hidden" value="${pb.company_id}" name="companyId">
								
							</td>
						<tr>
							<td>商品名稱</td>
							<td>
								<input type="text" value="${pb.product_name}" name="productName">
							</td>
						<tr>
							<td>庫存</td>
							<td>
								<input type="text" value="${pb.amount}" name="amount">
						<tr>
							<td>成本
							<td>
								<input type="text" value="${pb.cost_price}" name="cost">
							</td>
						<tr>
							<td>售價</td>
							<td>
								<input type="text" value="${pb.price}" name="price">
							</td>
						<tr>
							<td>商品描述</td>
							<td>
								<textarea style="overflow: hidden; resize: none; width: 400px; height: 300px;" name="describe">${pb.describe}</textarea>
							</td>
						<tr>
							<td>圖片</td>
							<td>
								<input type="file" name="file">
							</td>
						<tr>
							<c:choose>
								<c:when test="${pb.status == 1}">
									<td>商品狀態</td>
									<td>
										<input type="radio" CHECKED name="status" value="1">
										上架
										<input type="radio" name="status" value="2">
										下架
									</td>
								</c:when>
								<c:otherwise>
									<td>商品狀態</td>
									<td>
										<input type="radio" name="status" value="1">
										上架商品
										<input type="radio" CHECKED name="status" value="2">
										下架商品
									</td>
								</c:otherwise>
							</c:choose>
						<tr>
							<c:choose>
								<c:when test="${pb.category == 1}">
									<td>商品類別</td>
									<td>
										<input type="radio" CHECKED name="category" value="1">
										狗狗分類
										<input type="radio" name="category" value="2">
										貓咪分類
										<input type="radio" name="category" value="3">
										其它分類
									</td>
								</c:when>
								<c:when test="${pb.category == 2}">
									<td>商品類別</td>
									<td>
										<input type="radio" name="category" value="1">
										狗狗分類
										<input type="radio" CHECKED name="category" value="2">
										貓咪分類
										<input type="radio" name="category" value="3">
										其它分類
									</td>
								</c:when>
								<c:otherwise>
									<td>商品類別</td>
									<td>
										<input type="radio" name="category" value="1">
										狗狗分類
										<input type="radio" name="category" value="2">
										貓咪分類
										<input type="radio" CHECKED name="category" value="3">
										其它分類
									</td>
								</c:otherwise>
							</c:choose>
					</table>
					<input type="submit" value="修改">
				</form>
			</div>
			<!--   Core   -->
			<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
			<!--   Optional JS   -->
			<!--   Argon JS   -->
			<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
			<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
			<script>
				window.TrackJS && TrackJS.install({
					token : "ee6fab19c5a04ac1a32a645abde4613a",
					application : "argon-dashboard-free"
				});
			</script>
</body>
</body>
</html>