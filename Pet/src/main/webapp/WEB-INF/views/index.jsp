<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
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
<!-- 自訂 - index CSS -->
<link rel="stylesheet" href="css/index.css">
<!-- <!-- 瀑布流 CSS -->
<!-- <link rel="stylesheet" href="waterfall.css"> -->

</head>

<body>
	<!--::header part start::-->
	<header class="header_area">
		<!--::header part end::-->

	
	<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					
					<c:choose>
   						<c:when test="${empty LoginOK}">
   							<div class="sub_header_social_icon float-right" style="float:right">
							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">登入/註冊</a>
							</div>
    					</c:when>
    
    					<c:otherwise>
    						<ul class="navbar-nav ml-auto">

							<div class="topbar-divider d-none d-sm-block"></div>

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow"><a
								class="nav-link dropdown-toggle" href="#" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span
									class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:20px">你好，${LoginOK.name }</span>
									<img class="img-profile rounded-circle" width='60' height='60' src='getPicture' />
							</a> <!-- Dropdown - User Information -->
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/_01.memberManagement"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 會員中心
									</a> <a class="dropdown-item" href="_01.updataMemberPage"> <i
										class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										修改會員
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/_01.getLogout" 
										> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div></li>

						</ul>
    					</c:otherwise>
					</c:choose>
					
					

				</nav>
				<!-- End of Topbar -->
	
<!-- 		<div class="sub_header"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row align-items-center"> -->
<!-- 					<div class="col-4 col-md-4 col-xl-6"> -->
<!-- 						<div id="logo"> -->
<!-- 							<a href="index.html"><img src="img/Logo.png" alt="" title="" /></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-8 col-md-8 col-xl-6 "> -->
<%-- 						<c:if test="${empty LoginOK}"> --%>
<!-- 							<div class="sub_header_social_icon float-right"> -->
<!-- 							<a href="#"><i class="flaticon-phone"></i>02</a> -->
<!-- 							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">Longin</a> -->
<!-- 							<a href="friendlist" class="btn_1 d-none d-md-inline-block">account</a> -->
<!-- 						</div> -->
<%-- 						</c:if> --%>
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="main_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="ti-menu"></i>
							</button>

							<div class="collapse navbar-collapse justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link active"
										href="<spring:url value='/'/>">Home</a></li>
									<li class="nav-item"><a
										href="<spring:url value='/_08/contents_Front'/>"
										class="nav-link">𨑨迌 食飯</a></li>
									<li class="nav-item"><a href="<spring:url value='/allactivity'/>" class="nav-link">寵物跑跳碰</a>
									</li>
									<li class="nav-item"><a
										href="<spring:url value='/06/petProductSale'/>"
										class="nav-link">PET陪你購物</a></li>
									<li><a href="<spring:url value='/blogIndex'/>"
										class="nav-link">PET-Blog</a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> PET PET 資訊欄 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="_08/hospitalsFront">醫院資訊</a> <a
												class="dropdown-item" href="_08/hotelsFront">旅館資訊</a> <a
												class="dropdown-item" href="_08/resFront">餐廳資訊</a>
										</div></li>
									<li class="nav-item"><a href="#" class="nav-link">PET
											PET Q&A</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header part end-->

	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-content-center">
				<div class="col-lg-7 col-xl-6">
					<div class="banner_text">
						<h5>Welcome to pET ʕ•ᴥ•ʔ 陪你</h5>
						<h1>陪伴你每一天</h1>
						<a href="#service" class="btn_1">our service</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->
	<!-- Toolbar part start -->
	<div>
		<ul class="toolbar_r">
			<li class="vnb">
			<a href="https://www.facebook.com/">
			<img id="vnb_fb" alt="" src="img/icon/facebook-g.svg" href="#" />
			</a>
			</li>
			<li class="vnb">
			<a href="https://www.youtube.com/?gl=TW">
			<img id="vnb_youtube" alt=""
				src="img/icon/youtube-g.svg" href="#" />
			</a>
			</li>
			<li class="vnb">
			<a href="http://localhost:8080/Pet/_01.memberloginPage">
			<img id="vnb_robot" alt=""
				src="img/icon/robot-g.svg" href="#" />
			</a>
			</li>
			<li class="vnb">
			<a href="http://localhost:8080/Pet/_01.memberloginPage">
			<img id="vnb_chat" alt=""
				src="img/icon/chat-g.svg" href="#" />
			</a>
			</li>
		</ul>
	</div>
	<!-- Toolbar part end -->

	<!-- about part start-->
	<section class="about_part section_padding">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-md-6">
					<div class="about_img">
						<img src="img/about.png" alt="">
					</div>
				</div>
				<div class="col-md-5">
					<div class="about_text">
						<img src="img/about_icon.png" class="about_icon" alt="">
						<h2>We care your pet As you care</h2>
						<p style="font-size: 30px;">讓pET ʕ•ᴥ•ʔ 陪你和你一起陪著你的毛孩子！</p>
<!-- 						<a href="#" class="btn_1">About Us</a> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- about part start-->
	<!-- service part start-->
	<section id="service" class="service_part section_padding services_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section_tittle text-center">
						<img src="img/about_icon.png" alt="">
						<h2>We Provide Best Services</h2>
<!-- 						<p>#####</p> -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="single_service_part">
						<img class="provide-service" src="img/animal_friend.jpg" alt="#">
						<h3>Friend & Activity</h3>
						<p style="font-size: 24px;">豐富的交友活動等著您與您的毛孩子來參加！</p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_service_part">
						<img class="provide-service" src="img/cat_write.jpg" alt="#">
						<h3>Blog</h3>
						<p style="font-size: 24px;">提供個人化的部落格紀錄毛孩子的每一天！</p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_service_part">
						<img class="provide-service" src="img/animal_shopping.jpg" alt="#">
						<h3>Shopping</h3>
						<p style="font-size: 24px;">最棒最豐富的商品等著您帶回家！</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- service part end-->
	<!-- 網站廣告輪播 part here -->
	<div style="height: 100px;"></div>
	<section class="client_review">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="client_review_content owl-carousel">
						<div class="singke_client_review">
							<img class="carousel_icon" src="img/carousel_knowledge.svg"
								alt="#">
							<h1 class="chinese">貓也會得糖尿病嗎？</h1>
							<p class="chinese" style="color: black;">- 你知道嗎？貓咪也像人一樣，會得糖尿病喔！</p>
						</div>
						<div class="singke_client_review">
							<img class="carousel_icon" src="img/carousel_promotion_1.svg"
								alt="#">
							<h1 class="chinese">渴望飼料6.4折</h1>
							<p class="chinese" style="color: black;">- pET ʕ•ᴥ•ʔ 陪你商城 - 會員專屬優惠！</p>
						</div>
						<div class="singke_client_review">
							<img class="carousel_icon" src="img/carousel_news.svg" alt="#">
							<h1 class="chinese">雪貂愛上狼犬…以為彼此是同類</h1>
							<p class="chinese" style="color: black;">- 主人無奈：雙眼每天被閃瞎</p>
						</div>
						<div class="singke_client_review">
							<img class="carousel_icon" src="img/carousel_carnival_2.png"
								alt="#">
							<h1 class="chinese">2019台北寵物節—毛孩友善聖誕城</h1>
							<p class="chinese" style="color: black;">- 活動日期 : 2019-12-01 ~ 2019-12-21 活動地點 :
								信義廣場（台北市信義區信義路五段11號，台北101對面）</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div style="height: 200px;"></div>
	<!-- client review part end -->
	 <!-- about part start-->
    <section style="margin-bottom: 200px;">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6">
                    <div class="about_img">
                        <img src="img/gallery-06.png" alt="">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="about_text">
                        <img src="img/about_icon.png" class="about_icon" alt="">
                        <h1 class="chinese" style="font-size: 45px;">陪伴你與你的毛小孩</h1>
                        <p style="height: 30px;">
                        <p style="font-size: 24px;">pET ʕ•ᴥ•ʔ 陪你團隊將盡最大的努力提供您與您的毛孩子最新的資訊與最好的商品！</p>
                        <div style="height: 30px;"></div>
                        <a href="_08/contents_Front" class="btn_1">閱讀更多資訊</a>
                        <span style="margin: 50px;"></span>
                        <a href="06/petProductSale" class="btn_1">進入購物商城</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part end-->
	<!--Announcement part start::-->
	<!-- Announcement part end-->

	<!-- footer part start-->
	<footer class="footer_area padding_top">
		<div class="container">
			<div class="row justify-content-center ">
				<div class="col-lg-8 col-xl-6">
					<div class="subscribe_part_text text-center">
						<h2>Subscribe Newsletter</h2>
						<p>We strictly follow the State Board’s sanitary and
							disinfection guidelines.</p>
						<div class="subscribe_form">
							<form action="#" name="#">
								<div class="input-group align-items-center">
									<input type="email" class="form-control"
										placeholder="enter your email">
									<div class="subscribe_btn input-group-append">
										<div class="btn_1">free trail</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-between section_padding">
				<div
					class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
					<h4>Menu</h4>
					<ul>
						<li><a href="#">home</a></li>
						<li><a href="#">𨑨迌食飯</a></li>
						<li><a href="#">寵物跑跳碰</a></li>
						<li><a href="#">PET陪你購物</a></li>
						<li><a href="#">PET-Blog</a></li>
						<li><a href="#">PET PET 資訊欄</a></li>
						<li><a href="#">PET PET Q&A</a></li>
					</ul>
				</div>
				<div
					class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
					<h4>Company</h4>
					<ul>
						<li><a href="<spring:url value='/_01.loginCompanyPage'/>">Login</a></li>
						<li><a href="#">Application</a></li>
					</ul>
				</div>
				<div
					class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
					<h4>Policy</h4>
					<ul>
						<li><a href="#">Private Policy</a></li>
						<li><a href="#">Shiiping Policy</a></li>
						<li><a href="#">Return Policy</a></li>
					</ul>
				</div>
				<div
					class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
					<h4>Member</h4>
					<ul>
						<li><a href="#">Member Centre</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Track My Package</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="copyright_text">
						<img src="img/about_icon.png" alt="#">
						<!-- 						<h3>pET ʕ•ᴥ•ʔ陪你</h3> -->
						<p class="footer-text">
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved by pET ʕ•ᴥ•ʔ 陪你
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- counterup js -->
	<script src="js/jquery.counterup.min.js"></script>
	<!-- waypoints js -->
	<script src="js/waypoints.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>



</body>

</html>