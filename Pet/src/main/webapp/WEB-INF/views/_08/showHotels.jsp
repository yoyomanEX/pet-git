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
<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("check1").addEventListener("blur", check);
	});
	function check() {
		var theName = document.getElementById("check1").value;
		var reName = /^[\u4e00-\u9fff]$/;
		if (theName == "") {
			alert('請輸入中文');
		} else if (reName.test(theName)) {
			alert('輸入正確');
		} else {
			alert('輸入錯誤');
		}

	}
</script>
<style>
* {
	font-family: 微軟正黑體;
}

td {
	font-size: 15px;
	text-align: center;
}
</style>

</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->
	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-content-center">
				<div class="col-lg-7 col-xl-6">
					<div class="banner_text">
						<h5>Welcome to pET ʕ•ᴥ•ʔ 陪你</h5>
						<h1>PET pET ʕ•ᴥ•ʔ 資訊欄</h1>
						<a href="#" class="btn_1">our service</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part end-->
	<!-- about part start-->
	<section class="about_part section_padding">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-md-6">
					<div class="about_img">
						<img style="width: 300px; height: 300px;" src="${pageContext.request.contextPath}/img/08_img/hotel.jpg">
					</div>
				</div>
				<div class="col-md-5">
					<div class="about_text">
						<img src="${pageContext.request.contextPath}/img/about_icon.png"
							class="about_icon" alt="">
						<h2>旅館資訊</h2>
						<p>We care your pet as you care</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- about part end-->
	<!-- Map part end-->
	<div align="left">
	<iframe align="left" src="https://www.google.com/maps/d/embed?mid=1prcCjV5B2K1aSLdC_mtEWg9PBxLA8ZIY" width="600" height="600" frameborder="0" style="margin-left: 40px; border:0;" allowfullscreen=""></iframe>
	</div>
	<!-- Map part end-->
	<div align="right" style="margin-right: 80px; height: 1100px;">
		<div align="right" style="margin-right: 170px;">
			<table style="margin: 10px;">
				<tr>
					<a href="hotelsFront2"> <input class="btn_1" type="submit"
						value="查詢地址" />
					</a>
					<a href="#"> <input type="text" id="check1" size="15"
						name="hotel_name" /> <input class="btn_1" type="submit"
						value="名稱搜尋" />
					</a>
				</tr>
			</table>
		</div>
		<c:if test='${not empty allHotels}'>
			<c:forEach var='hotels' varStatus='vs' items='${allHotels}'>
				<c:if test='${vs.first}'>
					<c:out value="<table border='1'>" escapeXml='false' />
					<c:out value="<tr><td>編號</td><td>旅館名稱</td><td>地址</td><td>電話</td>"
						escapeXml='false' />
				</c:if>

				<tr>
					<td>${hotels.hotel_id}</td>
					<td>${hotels.hotel_name}</td>
					<td>${hotels.hotel_address}</td>
					<td>${hotels.hotel_tel}</td>

				</tr>
				<c:if test='${vs.last }'>
					<c:out value="</table>" escapeXml='false' />
				</c:if>
			</c:forEach>
		</c:if>
		<%-- 		<c:if test='${empty allHotels}'> --%>
		<!-- 					查無旅館資料<br> -->
		<%-- 		</c:if> --%>
	</div>
	<p style="margin: 50px;">


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
		<script
			src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
		<!-- custom js -->
		<script src="${pageContext.request.contextPath}/js/custom.js"></script>
		<!-- 瀑布流 js -->
		<script
			src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
</body>
</html>