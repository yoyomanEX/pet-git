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
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #000000;
	border-collapse: collapse;
	width: 60%;
	font-size: 20px;
	border-collapse: collapse;
	width: 60%;
}
</style>
</head>
<body class="">
	<jsp:include page="header_admin.jsp" />
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
				<form method="post" action="${pageContext.request.contextPath}/_06/petProductInsert" enctype="multipart/form-data">
					<table id="customers">
						<tr>
							<td>產品編號</td>
							<td>
								<input type="text" disabled value="系統自動產生">
							</td>
						<tr>
							<td>產品名稱</td>
							<td>
								<input type="text" name="product_name">
							</td>
						<tr>
							<td>庫存</td>
							<td>
								<input type="text" name="amount">
							</td>
						<tr>
							<td>進貨成本</td>
							<td>
								<input type="text" name="cost_price">
							</td>
						<tr>
							<td>售價</td>
							<td>
								<input type="text" name="price">
							</td>
						<tr>
							<td>商品描述</td>
							<td>
								<textarea rows="5" cols="40" name="describe"></textarea>
						<tr>
							<td>商品狀態</td>
							<td>
								<input type="radio" CHECKED name="status" value="1">
								上架
								<input type="radio" name="status" value="2">
								下架
							</td>
						<tr>
							<td>商品分類</td>
							<td>
								<input type="radio" CHECKED name="category" value="1">
								狗狗分類
								<input type="radio" name="category" value="2">
								貓咪分類
								<input type="radio" name="category" value="3">
								其它分類
							</td>
						<tr>
							<td>圖片</td>
							<td>
								<input type="file" name="file">
							</td>
					</table>
					<input type="submit" value="新增">
				</form>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" scellspacing="0"></table>
				</div>
			</div>
		</div>
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
</html>