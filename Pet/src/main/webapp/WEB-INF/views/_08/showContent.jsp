<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/img/about_icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- 自訂 - index CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
<link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet' />

<link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href='${pageContext.request.contextPath}/css/rotating-card.css' rel='stylesheet' />
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet">

<script
	src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
<style>
body {
	margin-top: 100px;
}

.navbar-default .navbar-nav>li>a {
	padding: 15px 15px;
	margin: 5px 0;
}

.navbar-default {
	padding: 10px 0;
	background-color: rgba(255, 255, 255, 0.95);
	border-color: transparent;
	box-shadow: 0 0px 13px rgba(0, 0, 0, .2);
}

.btn-info, .btn-info:hover, .btn-info:focus {
	color: #FFF !important;
	background-color: #00bbff !important;
	border-color: #00bbff !important;
}

.btn-info {
	opacity: .8;
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.btn-info:hover, .btn-info:focus {
	opacity: 1;
}
</style>
<!-- 瀑布流 CSS -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/waterfall.css"> --%>

</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->
	
	 <div class="col-sm-10 col-sm-offset-1">
         <div class="col-md-4 col-sm-6">
             <div class="card-container">
                <div class="card">
               
                    <div class="front">
                     <c:forEach var='cont' items='${allcontents}'>
                        <div class="cover">
                            <img src="<c:url value='getContPicture/${cont.content_id}' />"/>
                        </div>
                        <div class="user">
                            <img class="img-circle" src="images/rotating_card_profile3.png"/>
                        </div>
                        <div class="content">
                            <div class="main">
                                <h3 class="name"><b style='font-size: 16px;'>${cont.content_title}</b></h3>
                                <p class="profession">${cont.content_sub}</p>
<!--                                 <p class="text-center">"I'm the new Sinatra, and since I made it here I can make it anywhere, yeah, they love me everywhere"</p> -->
                            </div>
                            <div class="footer">
                                <i class="fa fa-mail-forward"></i> Auto Rotation
                            </div>
                        </div>
                        </c:forEach>
                    </div> <!-- end front panel -->
                    <div class="back">
                        <div class="header">
                            <h5 class="motto">"To be or not to be, this is my awesome motto!"</h5>
                        </div>
                        <div class="content">
                            <div class="main">
                                <h4 class="text-center">Job Description</h4>
                                <p class="text-center">Web design, Adobe Photoshop, HTML5, CSS3, Corel and many others...</p>

                                <div class="stats-container">
                                    <div class="stats">
                                        <h4>235</h4>
                                        <p>
                                            Followers
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4>114</h4>
                                        <p>
                                            Following
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4>35</h4>
                                        <p>
                                            Projects
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="footer">
                            <div class="social-links text-center">
                                <a href="https://creative-tim.com" class="facebook"><i class="fa fa-facebook fa-fw"></i></a>
                                <a href="https://creative-tim.com" class="google"><i class="fa fa-google-plus fa-fw"></i></a>
                                <a href="https://creative-tim.com" class="twitter"><i class="fa fa-twitter fa-fw"></i></a>
                            </div>
                        </div>
                    </div> <!-- end back panel -->
                </div> <!-- end card -->
            </div> <!-- end card-container -->
        </div> <!-- end col sm 3 -->



<!-- 	<div style="height: 30px"></div> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row"> -->
<%-- 			<c:forEach var='cont' items='${allcontents}'> --%>
<!-- 				<div class="col-sm-6 col-md-3"> -->
<!-- 					<div class="thumbnail"> -->
<%-- 						<img src="<c:url value='getContPicture/${cont.content_id}' />" /> --%>
<!-- 						<div class="caption"> -->
<!-- 							<p> -->
<%-- 								<b style='font-size: 16px;'>${cont.content_title}</b> --%>
<!-- 							</p> -->
<%-- 							<p>${cont.content_sub}</p> --%>
<!-- 							<p> -->
<%-- 																<a href="<spring:url value='/announcement?id=${ann.announce_id}' />" --%>
<!-- 																	class="btn btn-primary"> <span -->
<!-- 																	class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
<!-- 																</a> <a -->
<%-- 																	href="<spring:url value='/product.json?id=${ann.announce_id}' />" --%>
<!-- 																	class="btn btn-primary">  -->
<!-- 																</a> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->

	<!-- footer part start-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer part end-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script
		src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- counterup js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
	<!-- waypoints js -->
	<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
	<!-- easing js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
	<!-- particles js -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<!-- 瀑布流 js -->
	<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
	<%-- 	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script> --%>
	<!-- 	<script -->
	<%-- 		src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script> --%>




</body>
</html>