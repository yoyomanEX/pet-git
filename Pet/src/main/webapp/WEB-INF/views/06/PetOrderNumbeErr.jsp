<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>leopet || Home</title>
<link rel="icon" href="img/about_icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<style>
#sidebar_left {
	background-color: #FFB5B5;
	width: 260px;
	height: 800px;
	text-align: center;
	float: left;
}

#content {
	margin-left: 260px;
	margin-right: 260px;
	/* 	background-color: #F2FFF2; */
	text-align: center;
}

.productImg {
	width: 130px;
	height: 90px
}

.button {
	display: inline-block;
	border-radius: 25px;
	background-color: #FF5151;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 10px;
	width: 180px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

fieldset {
	background-color: #FFB5B5;
	border-radius: 3px;
	width: 800px;
	border: 5px double rgb(51, 46, 46);
	text-align: center;
	font-family: Microsoft JhengHei;
	font-size: 18px;
	font-weight: bold;
	margin: auto;
}
#pageBackground {
	background-image: url(img/aa.png);
}
</style>
</head>
<body bgcolor="#fdf5e6">
<!--::header part start::-->
<!-- 	<header class="header_area"> -->
<!-- 		<div class="sub_header"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row align-items-center"> -->
<!-- 					<div class="col-4 col-md-4 col-xl-6"> -->
<!-- 						<div id="logo"> -->
<!-- 							<a href="index.html"> -->
<!-- 								<img src="img/Logo.png" alt="" title="" /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-8 col-md-8 col-xl-6 "> -->
<!-- 						<div class="sub_header_social_icon float-right"> -->
<!-- 							<a href="#"> -->
<!-- 								<i class="flaticon-phone"></i> -->
<!-- 								+02 213 - 256 (365) -->
<!-- 							</a> -->
<!-- 							<a href="#" class="btn_1 d-none d-md-inline-block">Become a Volunteer</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- Header part end-->
		<jsp:include page="header.jsp" />
		<div class="main_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="ti-menu"></i>
							</button>
							<div class="collapse navbar-collapse justify--center" id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li class="nav-item">
										<a href="contact.html" class="nav-link"></a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="pageBackground">
		<div id="sidebar_left">
			<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
			<p>
			<h2 style="color: red">注意！！！！！</h2>
			<img src="img/noImg.jpg" style="width: 220px; height: 220px">
			<h4>可愛貓咪出沒(๑• . •๑) </h4>
			</p>
		</div>
		<div id='content'>
			<h2>訂單失敗通知</h2>
			<h2>您的訂單未成功下單，失敗訂單編號為：${orderNumber}，請持此編號洽詢客服。</h2>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>