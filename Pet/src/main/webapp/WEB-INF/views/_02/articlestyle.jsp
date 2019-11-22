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

<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animations.css">
<link href='${pageContext.request.contextPath}/css/jquery.qtip.min.css' rel='stylesheet' />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"></script>
<style>
.flex-container {
	display: -webkit-flex;
	display: flex;
	width: 100%;
	height: 360px;
	justify-content: center;
}

.flex-item {
	width: 550px;
	height: 360px;
	margin: 30px;
	border-radius: 20px;
	text-align: center;
	padding-top: 100px;
}

#flex-item-1 {
	background-image: url(img/style1.JPG);
	background-size: cover;
	visibility: hidden;
}

#flex-item-2 {
	background-image: url(img/style2.JPG);
	background-size: cover;
	visibility: hidden;
}

#section-content {
	margin-top: 100px;
}

#div-greeting {
	margin-bottom: 100px;
	text-align: center;
}

#div-greeting h1 {
	font-size: 70px;
	color: #002147;
	font-weight: bold;
}

h3 {
	color: #ffffff;
	font-size: 60px;
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {
		$(".flex-item").addClass("fadeIn")
	})
	
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
					<br>
					<h1 class="m-0 font-weight-bold text-primary">部落格樣式管理</h1>
					<br>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">



						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">


									<div class="flex-container">

										<a href="<spring:url value='myblog2'/>">
											<div class="flex-item" id="flex-item-1">
											<form action="${pageContext.request.contextPath}/myblog2" method="post">
												<button type="submit" id="style1" name="style1" value="style1" class="btn btn-default;opacity:0.2"><h3 style="color: black">樣式1</h3></button>
											</form>
											
											</div>
										</a> <a href="<spring:url value='myblog'/>">
											<div class="flex-item" id="flex-item-2">
											<form action="${pageContext.request.contextPath}/myblog" method="post">
												<button type="submit" id="style2" name="style2" value="style2" class="btn btn-default;opacity:0.2"><h3 style="color: black">樣式2</h3></button>
											</form>
											</div>
										</a>

									</div>


								</div>
							</div>
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
						<span>Copyright &copy; PET陪你寵物網 2019</span>
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

	

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>

</body>

</html>
