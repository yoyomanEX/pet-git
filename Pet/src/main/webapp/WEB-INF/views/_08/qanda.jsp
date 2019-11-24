<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/about_icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- 自訂 - index CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/demos/style.css"> --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $(function() { $( "#accordion" ).accordion();} );
  </script>
</head>
<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->
	<section class="contact-section section_padding">
    <div class="container">
	<div id="accordion">
		<h3>Section 1</h3>
		<div>
			<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
				quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida
				in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam
				mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a
				velit eu ante scelerisque vulputate.</p>
		</div>
		<h3>Section 2</h3>
		<div>
			<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum
				sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris
				turpis porttitor velit, faucibus interdum tellus libero ac justo.
				Vivamus non quam. In suscipit faucibus urna.</p>
		</div>
		<h3>Section 3</h3>
		<div>
			<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
				Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in
				pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac
				felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
				nisi, eu iaculis leo purus venenatis dui.</p>
			<ul>
				<li>List item one</li>
				<li>List item two</li>
				<li>List item three</li>
			</ul>
		</div>
		<h3>Section 4</h3>
		<div>
			<p>Cras dictum. Pellentesque habitant morbi tristique senectus et
				netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum
				primis in faucibus orci luctus et ultrices posuere cubilia Curae;
				Aenean lacinia mauris vel est.</p>
			<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
				consequat lectus. Class aptent taciti sociosqu ad litora torquent
				per conubia nostra, per inceptos himenaeos.</p>
		</div>
	</div>
	
	</div>
	</section>
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
</body>
</html>