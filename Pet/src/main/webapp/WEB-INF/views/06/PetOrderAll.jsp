<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">
<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.20/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	$(function() {
		$(".showDetail").click(function() {
			var orderid = $(this).attr("orderid");
			$("tr[orderid=" + orderid + "]").toggle();
		});

		$("#myTable").DataTable({
			"searching" : false,
			"bLengthChange" : false,
			"pageLength" : 8,
			"ordering": false,
			"bInfo" : false
		});
	});
</script>
<style>
.productImg {
	width: 130px;
	height: 90px;
}
</style>

</head>
<body id="page-top">
			<jsp:include page="header_member.jsp" />
	
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>
						
							
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">會員訂單</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Order Detail</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="myTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>訂單日期</th>
											<th>訂單編號</th>
											<th>總額</th>
											<th>目前狀態</th>
											<th>訂單明細</th>
										</tr>
									</thead>
									<c:forEach var='list' items='${orderList}'>
										<tbody>
											<tr>
												<td><fmt:formatDate value="${list.order_date}"
														pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
												<td>${list.order_id}</td>
												<td>$ ${list.total}</td>
												<c:choose>
													<c:when test="${list.payment_status ==1}">
														<td style="color: #FF2D2D;">新訂單尚未付款</td>
													</c:when>
													<c:when
														test="${list.payment_status ==2 and list.status != 3}">
														<td style="color: #FF2D2D;">已付款待出貨</td>
													</c:when>
													<c:when
														test="${list.payment_status ==2 and list.status == 3}">
														<td style="color: #FF2D2D;">已於 <fmt:formatDate
																value="${list.ship_date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
															出貨
														</td>
													</c:when>
													<c:when test="${list.payment_status ==3}">
														<td style="color: #FF2D2D;">付款失敗訂單取消</td>
													</c:when>
												</c:choose>
												<td><input type="button" class="showDetail"
													orderid="${list.order_id}" value="check me↙ " /></td>
											</tr>

											<tr orderid="${list.order_id}"
												style="display: none; color: #3763e6">
												<td>商品圖片</td>
												<td>商品名稱</td>
												<td>數量</td>
												<td>合計金額</td>
												<td>是否免運</td>
											</tr>
											<c:forEach var='detailList' items='${orderListDetail}'>
												<c:if test='${list.order_id == detailList.order_id}'>
													<tr orderid="${list.order_id}"
														style="display: none; color: #3763e6">
														<td><img alt="ʕ•ᴥ•ʔ" class='productImg'
															src="${pageContext.request.contextPath}/06/downloadFile/${detailList.product_id}.jpg">
														</td>
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
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- End of Main Content -->
				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2019</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script
			src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script
			src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
		<!-- Page level plugins -->
		<script
			src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		<!-- Page level custom scripts -->
		<script
			src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
</body>
</html>
