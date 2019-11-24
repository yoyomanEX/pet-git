<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
   <link rel="icon" href="${pageContext.request.contextPath}/img/about_icon.png">
<!-- Favicon -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" --%>
<!-- 	rel="icon" type="image/png"> -->
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/DataTables/datatables.min.css">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

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
	<jsp:include page="header_admin.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-expand-md navbar-dark"
			id="navbar-main">
			<div class="container-fluid">
				<!-- Brand -->
				<a style='font-size: 30px;'
					class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block"
					href="${pageContext.request.contextPath}/index.jsp">出貨管理</a>
				<p>PRODUCT MANAGEMENT</p>
				<!-- Form -->
				<form
					class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto"
					method="post"
					action="${pageContext.request.contextPath}/_06/queryOrder">
					<div class="form-group mb-0">
						<div class="input-group input-group-alternative">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fas fa-search"></i>
								</span>
							</div>
							<input class="form-control" placeholder="輸入用戶ID或訂單號碼"
								name="orderSearch" type="text">
						</div>
					</div>
				</form>
				<!-- User -->
				<ul class="navbar-nav align-items-center d-none d-md-flex">
					<li class="nav-item dropdown"><a class="nav-link pr-0"
						href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> </a>
						<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
							<div class=" dropdown-header noti-title">
								<h6 class="text-overflow m-0">Welcome!</h6>
							</div>
							<a href="${pageContext.request.contextPath}/profile.jsp"
								class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
									profile</span>
							</a> <a href="${pageContext.request.contextPath}/profile.jsp"
								class="dropdown-item"> <i class="ni ni-settings-gear-65"></i>
								<span>Settings</span>
							</a> <a href="${pageContext.request.contextPath}/profile.jsp"
								class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i>
								<span>Activity</span>
							</a> <a href="${pageContext.request.contextPath}/profile.jsp"
								class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
								<span>Logout</span>
							</a>
						</div></li>
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
											<h5 class="card-title text-uppercase text-muted mb-0">Unshipped
												Order</h5>
											<span class="h2 font-weight-bold mb-0"> <a
												href="${pageContext.request.contextPath}/_06/unshippedOrder">未出貨訂單</a>
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
											<h5 class="card-title text-uppercase text-muted mb-0">shipped
												Order</h5>
											<span class="h2 font-weight-bold mb-0"> <a
												href="${pageContext.request.contextPath}/_06/shippedOrder">已出貨訂單</a>
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
											<h5 class="card-title text-uppercase text-muted mb-0">error
												Order</h5>
											<span class="h2 font-weight-bold mb-0"> <a
												href="${pageContext.request.contextPath}/_06/errorOrder">失敗訂單</a>
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
			<div id="content">
				<br>
				<c:if test="${empty orderList}">
					<h2 style="text-align: center;">目前沒有要處理的訂單</h2>
				</c:if>
				<table
					style="text-align: center; width: 90%; font-family: Microsoft JhengHei; font-size: 20px; font-weight: bold;"
					border=1">
					<c:forEach var='list' items='${orderList}'>
						<tr>
							<th>訂單日期</th>
							<th>訂單編號</th>
							<th>總額</th>
							<th>用戶ID</th>
							<th>ECPay交易編號</th>
							<th>訂單明細</th>
						</tr>
						<tr>
							<td><fmt:formatDate value="${list.order_date}"
									pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
							<td>${list.order_id}</td>
							<td>${list.total}$</td>
							<td>${list.member_id}</td>
							<td>${list.merchant_no}</td>
							<td><input type="button" class="showDetail"
								orderid="${list.order_id}" value="check↙" /></td>
							<c:forEach var='detailList' items='${orderListDetail}'>
								<c:if test='${list.order_id == detailList.order_id}'>
									<tr orderid="${list.order_id}"
										style="display: none; color: #FF5151">
										<td>商品圖片</td>
										<td>商品ID</td>
										<td>商品名稱</td>
										<td>數量</td>
										<td>合計金額</td>
										<td>是否免運</td>
									</tr>
									<tr orderid="${list.order_id}"
										style="display: none; color: #FF5151">
										<td><img alt="ʕ•ᴥ•ʔ" class='productImg'
											src="${pageContext.request.contextPath}/_06/downloadFile/${detailList.product_id}.jpg">
										</td>
										<td>${detailList.product_id}</td>
										<td>${detailList.product_name}</td>
										<td>${detailList.amount}</td>
										<td>${detailList.total}$</td>
										<c:choose>
											<c:when test="${list.total < 299}">
												<td>N</td>
											</c:when>
											<c:otherwise>
												<td>Y</td>
											</c:otherwise>
										</c:choose>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test="${empty list.ship_date}">
									<tr orderid="${list.order_id}"
										style="display: none; color: #3657ff">
										<td>收件人</td>
										<td>收件人電話</td>
										<td>收件人地址</td>
										<td colspan="3">付款狀態</td>
									</tr>
									<tr orderid="${list.order_id}"
										style="display: none; color: #3657ff">
										<td>${list.recipient}</td>
										<td>${list.phone}</td>
										<td>${list.address}</td>
										<c:choose>
											<c:when test="${list.payment_status == 1}">
												<td colspan="3">訂單已成立但客戶尚未付款</td>
											</c:when>
											<c:when test="${list.payment_status == 2}">
												<td colspan="3">
													<div class="btn-group">
														<form method="post"
															action="${pageContext.request.contextPath}/_06/insertShippedDate">
															<input type="hidden" value="${list.order_id}"
																name="orderId"> <input class="button"
																type="submit" value="付款成功，出貨去"
																onclick="return confirm('訂單編號${list.order_id}，確定出貨嗎?')" />
														</form>
														<c:set var="count" value="${s.count}" />
													</div>
												</td>
											</c:when>
											<c:when test="${list.payment_status == 3}">
												<td colspan="3">交易失敗</td>
											</c:when>
										</c:choose>
									</tr>
								</c:when>
								<c:otherwise>
									<tr orderid="${list.order_id}"
										style="display: none; color: #FF5151">
										<td>收件人</td>
										<td>收件人電話</td>
										<td>收件人地址</td>
										<td colspan="3">出貨時間</td>
									</tr>
									<tr orderid="${list.order_id}"
										style="display: none; color: #FF5151">
										<td>${list.recipient}</td>
										<td>${list.phone}</td>
										<td>${list.address}</td>
										<td colspan="3"><fmt:formatDate value="${list.ship_date}"
												pattern="yyyy-MM-dd HH:mm"></fmt:formatDate> 已出貨。</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
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
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>


	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});

		$(function() {
			/*選擇器介紹:https://ithelp.ithome.com.tw/articles/10095237 
			JQuery選擇器 選擇(input元素 要做的事情:click後 下方執行方法*/
			$("input").click(function() {
				/*attr() 方法设置或返回被选元素的属性值。根据该方法不同的参数，其工作方式也有所差异。
				$(selector).attr(attribute)返回被选元素的属性值。
				this代表當前物件*/
				var orderid = $(this).attr("orderid");
				console.log('tr[orderid="' + orderid + '"]');
				/* 因為所有TR有設置ID 當點擊按鈕時產生orderid會傳給TR的orderId
				即可對該TR做顯示跟隱藏的替換工作*/
				$('tr[orderid=' + orderid + ']').toggle();
			});
		});
	</script>
</body>
</html>