<!-- 會員後台index頁 -->
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
				<h1 style="padding: 160px;font-size:50px; ">Dear ${LoginOK.name} <br>您已進入pET ʕ•ᴥ•ʔ 寵物網 會員管理 </h1>

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
