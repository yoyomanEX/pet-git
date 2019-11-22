<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
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
</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->

	<!--::breadcrumb part start::-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h1>contact</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::breadcrumb part start::-->

	<!-- ================ contact section start ================= -->
	<section class="contact-section section_padding">
		<div class="container">
			<div class="d-none d-sm-block mb-5 pb-4">
				<div id="map" style="height: 480px;"></div>
				<script>
					function initMap() {
						var uluru = {
							lat : -25.363,
							lng : 131.044
						};
						var grayStyles = [ {
							featureType : "all",
							stylers : [ {
								saturation : -90
							}, {
								lightness : 50
							} ]
						}, {
							elementType : 'labels.text.fill',
							stylers : [ {
								color : '#ccdee9'
							} ]
						} ];
						var map = new google.maps.Map(document
								.getElementById('map'), {
							center : {
								lat : -31.197,
								lng : 150.744
							},
							zoom : 9,
							styles : grayStyles,
							scrollwheel : false
						});
					}
				</script>
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&callback=initMap"></script>

			</div>


			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">Get in Touch</h2>
				</div>
				<div class="col-lg-8">
					<form class="form-contact contact_form"
						action="contact_process.php" method="post" id="contactForm"
						novalidate="novalidate">
						<div class="row">
							<div class="col-12">
								<div class="form-group">

									<textarea class="form-control w-100" name="message"
										id="message" cols="30" rows="9"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Message'"
										placeholder='Enter Message'></textarea>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control" name="name" id="name" type="text"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter your name'"
										placeholder='Enter your name'>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<input class="form-control" name="email" id="email"
										type="email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email address'"
										placeholder='Enter email address'>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<input class="form-control" name="subject" id="subject"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Subject'"
										placeholder='Enter Subject'>
								</div>
							</div>
						</div>
						<div class="form-group mt-3">
							<button type="submit" class="button button-contactForm">Send
								Message</button>
						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-home"></i></span>
						<div class="media-body">
							<h3>Buttonwood, California.</h3>
							<p>Rosemead, CA 91770</p>
						</div>
					</div>
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-tablet"></i></span>
						<div class="media-body">
							<h3>00 (440) 9865 562</h3>
							<p>Mon to Fri 9am to 6pm</p>
						</div>
					</div>
					<div class="media contact-info">
						<span class="contact-info__icon"><i class="ti-email"></i></span>
						<div class="media-body">
							<h3>support@colorlib.com</h3>
							<p>Send us your query anytime!</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->

	<!-- footer part start-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer part end-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- counterup js -->
	<script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
	<!-- waypoints js -->
	<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
	<!-- easing js -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
	<!-- particles js -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/contact.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>

</html>