<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Argon Dashboard - Free Dashboard for Bootstrap 4 by
	Creative Tim</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png"
	rel="icon" type="image/png">
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
<style>
.btn-group .button {
	background-color: #B8B8FF; /* Green */
	border: 1px solid #CCCCFF;
	color: #000000;
	padding: 15px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	cursor: pointer;
	float: left;
	margin: auto;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
	box-sizing: border-box;
	display: inline-block;
	min-width: 1.5em;
	padding: 0.5em 1em;
	margin-left: 2px;
	text-align: center;
	text-decoration: none !important;
	cursor: pointer;
	*cursor: hand;
	color: #333 !important;
	border: 1px solid transparent;
	border-radius: 2px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current,
	.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover
	{
	color: #333 !important;
	border: 1px solid #979797;
	background-color: white;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white),
		color-stop(100%, #dcdcdc));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* Chrome10+,Safari5.1+ */
	background: -moz-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* FF3.6+ */
	background: -ms-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* IE10+ */
	background: -o-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* Opera 11.10+ */
	background: linear-gradient(to bottom, white 0%, #dcdcdc 100%);
	/* W3C */
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active
	{
	cursor: default;
	color: #666 !important;
	border: 1px solid transparent;
	background: transparent;
	box-shadow: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active
	{
	cursor: default;
	color: #666 !important;
	border: 1px solid transparent;
	background: transparent;
	box-shadow: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	color: white !important;
	border: 1px solid #111;
	background-color: #585858;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #585858),
		color-stop(100%, #111));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #585858 0%, #111 100%);
	/* Chrome10+,Safari5.1+ */
	background: -moz-linear-gradient(top, #585858 0%, #111 100%);
	/* FF3.6+ */
	background: -ms-linear-gradient(top, #585858 0%, #111 100%);
	/* IE10+ */
	background: -o-linear-gradient(top, #585858 0%, #111 100%);
	/* Opera 11.10+ */
	background: linear-gradient(to bottom, #585858 0%, #111 100%);
	/* W3C */
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #000000;
	border-collapse: collapse;
	width: 100%;
	text-align: center;
	font-size: 18px;
	float: left;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	background-color: #7962e4;
	color: white;
}

#body1 {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}

.productImg {
	width: 130px;
	height: 90px
}
</style>
</head>
<body class="">
	<jsp:include page="header_admin.jsp" />
		<div class="main-content">
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
			<div class="container-fluid">
				<!-- Brand -->
				<a style='font-size: 30px;' class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="${pageContext.request.contextPath}/index.jsp">商品管理</a>
				<p>PRODUCT MANAGEMENT</p>
				<!-- Form -->
				<form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto" method="post" action="${pageContext.request.contextPath}/_06/petProductsQuery">
					<div class="form-group mb-0">
						<div class="input-group input-group-alternative">
							<div class="input-group-prepend">
								<span class="input-group-text">
									<i class="fas fa-search"></i>
								</span>
							</div>
							<input class="form-control" placeholder="輸入商品編號或名稱" name="productSearch" type="text">
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
											<h5 class="card-title text-uppercase text-muted mb-0">Product
												Management</h5>
											<span class="h2 font-weight-bold mb-0"> <a
												href="${pageContext.request.contextPath}/_06/petProductsAll">商品管理</a>
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
											<h5 class="card-title text-uppercase text-muted mb-0">Add
												Product</h5>
											<span class="h2 font-weight-bold mb-0"> <a
												href="${pageContext.request.contextPath}/_06/petProductsNew">新增商品</a>
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
				<nav>
					<h2>商品資料</h2>
				</nav>
				<div id="demo">
					<table id="customers">
					<thead>
						<tr>
							<th>圖片</th>
							<th>編號</th>
							<th>名稱</th>
							<th>庫存</th>
							<th>成本</th>
							<th>售價</th>
							<th>分類</th>
							<th>狀態</th>
							<th>修改</th>
							</tr>
								</thead>
								
								<tbody>
								<c:forEach items="${pbs}" var="pbs" varStatus="s">
								<tr>
								
									<td><img alt="" class="productImg"
										src="${pageContext.request.contextPath}/_06/downloadFile/${pbs.product_id}.jpg">
									</td>
									<td name="pro" productid="${pbs.product_id}">${pbs.product_id}</td>
									<td>${pbs.product_name}</td>
									<td>${pbs.amount}</td>
									<td>${pbs.cost_price}</td>
									<td>${pbs.price}</td>
									<c:choose>
										<c:when test="${pbs.category == 1}">
											<td>狗狗專區</td>
										</c:when>
										<c:when test="${pbs.category == 2}">
											<td>貓咪專區</td>
										</c:when>
										<c:otherwise>
											<td>其它專區</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pbs.status == 1}">
											<td>上架中</td>
										</c:when>
										<c:otherwise>
											<td style="color: red;">下架中</td>
										</c:otherwise>
									</c:choose>
									<td>
										<div class="btn-group">
											<form method="post"
												action="${pageContext.request.contextPath}/_06/petProductUpdate">
												<input type="hidden" value="${pbs.product_id}"
													name="productId"> <input class="button"
													type="submit" value="修改" />
											</form>
											<c:set var="count" value="${s.count}" />
										</div>
										</c:forEach>
											</tbody>
							
					</table>
					<%-- <form method="post"
			action="${pageContext.request.contextPath}/PetProductDelete">
			輸入刪除商品編號:<input type="text" name="productId" /><input type="submit"
				value="送出" /> 
		</form>--%>
					<h3>共${count}筆資料</h3>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						scellspacing="0"></table>
				</div>
			</div>
		</div>
	</div>
	<!--   Core   -->
	<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.20/js/jquery.dataTables.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
		
		$(function() {

			$("#customers").DataTable({
				"searching" : false,
				"bLengthChange" : false,
				"bInfo" : false
			});
		});
	</script>
</body>

</html>