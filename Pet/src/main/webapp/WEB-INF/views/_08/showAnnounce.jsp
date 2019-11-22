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
<!-- 瀑布流 CSS -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/waterfall.css"> --%>

</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->
	<div style="height: 30px"></div>
	<section class="container">
		<div class="row">
			<c:forEach var='ann' items='${allAnnouncements}'>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<%-- 						<c:choose> --%>
						<%-- 						<c:when test="${announce_img==null }"> --%>
						<!-- 						123 -->
						<%-- 						</c:when> --%>
						<%-- 						<c:otherwise> --%>
						<img src="<c:url value='getAnnPicture/${ann.announce_id}' />" />
						<%-- 						</c:otherwise> --%>
						<%-- 						</c:choose> --%>
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${ann.announce_title}</b>
							</p>
							<p>${ann.announce_sub}</p>
							<p>
								<%-- 								<a href="<spring:url value='/announcement?id=${ann.announce_id}' />" --%>
								<!-- 									class="btn btn-primary"> <span -->
								<!-- 									class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
								<!-- 								</a> <a -->
								<%-- 									href="<spring:url value='/product.json?id=${ann.announce_id}' />" --%>
								<!-- 									class="btn btn-primary">  -->
								<!-- 								</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>

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
						<li><a href="#">Travel & Food</a></li>
						<li><a href="#">Activity</a></li>
						<li><a href="#">Shopping</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Information</a></li>
						<li><a href="#">Contact</a></li>
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