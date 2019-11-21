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
	<div class="container">
		<div class="row">
			<c:forEach var='cont' items='${allcontents}'>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="<c:url value='getContPicture/${cont.content_id}' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${cont.content_title}</b>
							</p>
							<p>${cont.content_sub}</p>
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
	</div>

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