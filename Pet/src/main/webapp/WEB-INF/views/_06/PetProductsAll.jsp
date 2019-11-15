<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="./index.html">
				<img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown">
					<a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="ni ni-bell-55"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a>
						<a class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle">
								<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/team-1-800x800.jpg
">
							</span>
						</div>
					</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
							<i class="ni ni-single-02"></i>
							<span>My profile</span>
						</a>
						<a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
							<i class="ni ni-settings-gear-65"></i>
							<span>Settings</span>
						</a>
						<a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
							<i class="ni ni-calendar-grid-58"></i>
							<span>Activity</span>
						</a>
						<a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
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
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="${pageContext.request.contextPath}/index.jsp">
								<img src="${pageContext.request.contextPath}/assets/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
								<span></span>
								<span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- Form -->
				<form class="mt-4 mb-3 d-md-none">
					<div class="input-group input-group-rounded input-group-merge">
						<input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<span class="fa fa-search"></span>
							</div>
						</div>
					</div>
				</form>
				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item  class="active" ">
						<a class=" nav-link active " href=" ${pageContext.request.contextPath}/index.jsp">
							<i class="ni ni-tv-2 text-primary"></i>
							Dashboard
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="${pageContext.request.contextPath}/views/icons.jsp">
							<i class="ni ni-planet text-blue"></i>
							Icons
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="${pageContext.request.contextPath}/views/maps.jsp">
							<i class="ni ni-pin-3 text-orange"></i>
							Maps
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="${pageContext.request.contextPath}/views/profile.jsp">
							<i class="ni ni-single-02 text-yellow"></i>
							出貨管理
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link " href="${pageContext.request.contextPath}/_06/productList">
							<i class="ni ni-bullet-list-67 text-red"></i>
							商品管理
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/views/login.jsp">
							<i class="ni ni-key-25 text-info"></i>
							廠商管理
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/views/register.jsp">
							<i class="ni ni-circle-08 text-pink"></i>
							Register
						</a>
					</li>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Heading -->
				<h6 class="navbar-heading text-muted">Documentation</h6>
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item">
						<a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
							<i class="ni ni-spaceship"></i>
							Getting started
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
							<i class="ni ni-palette"></i>
							Foundation
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
							<i class="ni ni-ui-04"></i>
							Components
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="main-content">
		<!-- Navbar -->
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
							<div class="media align-items-center">
								<span class="avatar avatar-sm rounded-circle">
									<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/team-4-800x800.jpg">
								</span>
								<div class="media-body ml-2 d-none d-lg-block">
									<span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
								</div>
							</div>
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
				<nav>
					<h2>商品資料</h2>
				</nav>
				<div id="demo">
					<table id="customers">
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
							<c:forEach items="${pbs}" var="pbs" varStatus="s">
								<tr>
									<td>
										<img alt="" class="productImg" src="${pageContext.request.contextPath}/_06/downloadFile/${pbs.product_id}.jpg">
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
											<form method="post" action="${pageContext.request.contextPath}/_06/petProductUpdate">
												<input type="hidden" value="${pbs.product_id}" name="productId">
												<input class="button" type="submit" value="修改" />
											</form>
											<c:set var="count" value="${s.count}" />
										</div>
							</c:forEach>
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
<body id="body1">
	<Script>
		document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("bt").addEventListener("click", checkId);
		
		});
		let pros= document.getElementsByName("pro");
		pros.forEach(function(pro){
			pro.addEventListener("click",checkId);
		});
		
		
		
		
		function checkId() {
			let flag1=false;
			var id = document.getElementById("pi").value;
			var idLeng = id.length;
			let pros= document.getElementsByName("pro");
			pros.forEach(function(pro){
				var proId =pro.getAttribute("productid");
				console.log("proId="+ proId);
				if(id == proId){
					flag1 = true;
				}
			});
			if (id == "") { // 產品編號不得為空值
				document.getElementById("sp").innerHTML = "產品編號不得為空值";
			}else if(idLeng < 4 || idLeng > 4){ //產品編號不得小於等於4位數
				document.getElementById("sp").innerHTML = "產品編號長度需為4碼";
			}else if(flag1==false){//產品編號需是產品列表裡面有的
				document.getElementById("sp").innerHTML = "沒有這個產品編號";
			}else if(flag1) {
				document.form1.submit();
			}
		}
	</Script>
</body>
</html>