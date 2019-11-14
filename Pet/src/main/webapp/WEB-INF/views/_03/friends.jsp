<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css"
	rel="stylesheet">
<style type="text/css">
.user-title {
	font-size: 18px;
}
</style>
<title>friends</title>
<script>
	function myFunction() {
		document.getElementById("frm1").submit();
	}
</script>
</head>
<body>
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
			<br> <a href="friends">好友列表</a> <a href="application">申請列表</a> <a
				href="waiting">等候回覆</a>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">

	<div class="row">
		<c:forEach var='friend' items='${friends}'>
			<c:set var='status' scope='session' value='${friend.status}' />
			<c:if test='${status=="allow"}'>
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-4 col-md-6 mb-4">
					<div class="card border-left-primary shadow py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1 user-title">${friend.name}</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${friend.status}</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-user fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:if>
		</c:forEach>
	</div>
</body>
</html>
