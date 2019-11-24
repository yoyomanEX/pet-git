<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!--   <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript"
	src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>">
	
</script>

<%-- <script src="${pageContext.request.contextPath}/js/jquery.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>


<script>
	//     $(document).ready(function(){   //button的id不能相同，所以如果用迴圈增加刪除紐，只會有一個有反應
	// 		$("#button2").click(function(){
	// 			alert("删除成功");

	// 		});
	//     });
	function myFunction() {
		document.getElementById("frm1").submit();
	}
	function clickDelete() {
		alert("删除成功");
		//     	var msg = "請問確定要刪除嗎???刪除後無法回復";
		//     	if (confirm(msg)==true){
		//     	return true;
		//     	}else{
		//     	return false;
		//     	}
	}
	function room() {
		window
				.open(
						'dogroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
	function catroom() {
		window
				.open(
						'catroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
	function petroom() {
		window
				.open(
						'petroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
</script>


<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<jsp:include page="header_member.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<section>
						<div class='text-center'>
							<div class="container" style="text-align: center">
								<h1>好友清單</h1>
							</div>
							<form action='select' method="post" id="frm1"
								class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
								<div class="input-group">
									<input type="text" name='friendid'
										class="form-control bg-light border-0 small"
										placeholder="Search for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button"
											onclick="myFunction()">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
							<br> <a href="friendlist">好友列表</a> <a href="application">申請列表</a>
							<a href="waiting">等候回覆</a>
						</div>
					</section>
					<hr
						style="height: 1px; border: none; color: #333; background-color: #333;">
					<div class="row">
						<c:forEach var='friend' items='${friends}'>
							<c:set var='status' scope='session' value='${friend.status}' />
							<c:if test='${status=="waiting"}'>
								<div class="col-xl-4 col-md-6 mb-4">
									<div class="card border-left-primary shadow py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1 "
														style='font-size: 18px'>${friend.name}</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">${friend.mid}</div>
												</div>
												<table>
													<tr>
														<td><form action='newfriend' method="post">
																<input type="hidden" name='friendid'
																	value='${friend.mid}'> <input type="submit"
																	value="加入好友" />
															</form>
															<form action='cancelapplication' method="post">
																<input type="hidden" name='friendid'
																	value='${friend.mid}'> <input type="submit"
																	value="拒絕" />
															</form></td>
													</tr>
												</table>
												<div class="col-auto">
													<img class="rounded-circle" width="60" height="60"
											src="getMbPicture/${friend.mid}" alt="">
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:if>
						</c:forEach>
					</div>

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
				src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
			<!-- Page level custom scripts -->
			<script
				src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
			<script
				src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>
</body>

</html>