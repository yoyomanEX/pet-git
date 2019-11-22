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


</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header part end-->
<!-- 	 <div class="col-sm-10 col-sm-offset-1"> -->
<!--          <div class="col-md-4 col-sm-6"> -->
<!--              <div class="card-container"> -->
<!--                 <div class="card"> -->
<!--                     <div class="front"> -->
<!--                         <div class="cover"> -->
<!--                             <img src="images/rotating_card_thumb2.png"/> -->
<!--                         </div> -->
<!--                         <div class="user"> -->
<!--                             <img class="img-circle" src="images/rotating_card_profile3.png"/> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h3 class="name">John Marvel</h3> -->
<!--                                 <p class="profession">CEO</p> -->
<!--                                 <p class="text-center">"I'm the new Sinatra, and since I made it here I can make it anywhere, yeah, they love me everywhere"</p> -->
<!--                             </div> -->
<!--                             <div class="footer"> -->
<!--                                 <i class="fa fa-mail-forward"></i> Auto Rotation -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end front panel -->
<!--                     <div class="back"> -->
<!--                         <div class="header"> -->
<!--                             <h5 class="motto">"To be or not to be, this is my awesome motto!"</h5> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h4 class="text-center">Job Description</h4> -->
<!--                                 <p class="text-center">Web design, Adobe Photoshop, HTML5, CSS3, Corel and many others...</p> -->

<!--                                 <div class="stats-container"> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>235</h4> -->
<!--                                         <p> -->
<!--                                             Followers -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>114</h4> -->
<!--                                         <p> -->
<!--                                             Following -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>35</h4> -->
<!--                                         <p> -->
<!--                                             Projects -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="footer"> -->
<!--                             <div class="social-links text-center"> -->
<!--                                 <a href="#" class="facebook"><i class="fa fa-facebook fa-fw"></i></a> -->
<!--                                 <a href="#" class="google"><i class="fa fa-google-plus fa-fw"></i></a> -->
<!--                                 <a href="#" class="twitter"><i class="fa fa-twitter fa-fw"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end back panel -->
<!--                 </div> end card -->
<!--             </div> end card-container -->
<!--         </div> end col sm 3 -->
<!-- <!--         <div class="col-sm-1"></div> --> -->
<!--         <div class="col-md-4 col-sm-6"> -->
<!--              <div class="card-container manual-flip"> -->
<!--                 <div class="card"> -->
<!--                     <div class="front"> -->
<!--                         <div class="cover"> -->
<!--                             <img src="images/rotating_card_thumb.png"/> -->
<!--                         </div> -->
<!--                         <div class="user"> -->
<!--                             <img class="img-circle" src="images/rotating_card_profile2.png"/> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h3 class="name">Andrew Mike</h3> -->
<!--                                 <p class="profession">Web Developer</p> -->
<!--                                 <p class="text-center">"Lamborghini Mercy <br>Your chick she so thirsty <br>I'm in that two seat Lambo"</p> -->
<!--                             </div> -->
<!--                             <div class="footer"> -->
<!--                                 <button class="btn btn-simple" onclick="rotateCard(this)"> -->
<!--                                     <i class="fa fa-mail-forward"></i> Manual Rotation -->
<!--                                 </button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end front panel -->
<!--                     <div class="back"> -->
<!--                         <div class="header"> -->
<!--                             <h5 class="motto">"To be or not to be, this is my awesome motto!"</h5> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h4 class="text-center">Job Description</h4> -->
<!--                                 <p class="text-center">Web design, Adobe Photoshop, HTML5, CSS3, Corel and many others...</p> -->

<!--                                 <div class="stats-container"> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>235</h4> -->
<!--                                         <p> -->
<!--                                             Followers -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>114</h4> -->
<!--                                         <p> -->
<!--                                             Following -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>35</h4> -->
<!--                                         <p> -->
<!--                                             Projects -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="footer"> -->
<!--                             <button class="btn btn-simple" rel="tooltip" title="Flip Card" onclick="rotateCard(this)"> -->
<!--                                 <i class="fa fa-reply"></i> Back -->
<!--                             </button> -->
<!--                             <div class="social-links text-center"> -->
<!--                                 <a href="https://creative-tim.com" class="facebook"><i class="fa fa-facebook fa-fw"></i></a> -->
<!--                                 <a href="https://creative-tim.com" class="google"><i class="fa fa-google-plus fa-fw"></i></a> -->
<!--                                 <a href="https://creative-tim.com" class="twitter"><i class="fa fa-twitter fa-fw"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end back panel -->
<!--                 </div> end card -->
<!--             </div> end card-container -->
<!--         </div> end col sm 3 -->
<!-- <!--         <div class="col-sm-1"></div> --> -->
<!--         <div class="col-md-4 col-sm-6"> -->
<!--             <div class="card-container"> -->
<!--                 <div class="card"> -->
<!--                     <div class="front"> -->
<!--                         <div class="cover"> -->
<!--                             <img src="images/rotating_card_thumb3.png"/> -->
<!--                         </div> -->
<!--                         <div class="user"> -->
<!--                             <img class="img-circle" src="images/rotating_card_profile.png"/> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h3 class="name">Inna Corman</h3> -->
<!--                                 <p class="profession">Product Manager</p> -->

<!--                                 <p class="text-center">"I'm the new Sinatra, and since I made it here I can make it anywhere, yeah, they love me everywhere"</p> -->
<!--                             </div> -->
<!--                             <div class="footer"> -->
<!--                                 <div class="rating"> -->
<!--                                     <i class="fa fa-mail-forward"></i> Auto Rotation -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end front panel -->
<!--                     <div class="back"> -->
<!--                         <div class="header"> -->
<!--                             <h5 class="motto">"To be or not to be, this is my awesome motto!"</h5> -->
<!--                         </div> -->
<!--                         <div class="content"> -->
<!--                             <div class="main"> -->
<!--                                 <h4 class="text-center">Job Description</h4> -->
<!--                                 <p class="text-center">Web design, Adobe Photoshop, HTML5, CSS3, Corel and many others...</p> -->

<!--                                 <div class="stats-container"> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>235</h4> -->
<!--                                         <p> -->
<!--                                             Followers -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>114</h4> -->
<!--                                         <p> -->
<!--                                             Following -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                     <div class="stats"> -->
<!--                                         <h4>35</h4> -->
<!--                                         <p> -->
<!--                                             Projects -->
<!--                                         </p> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="footer"> -->
<!--                             <div class="social-links text-center"> -->
<!--                                 <a href="#" class="facebook"><i class="fa fa-facebook fa-fw"></i></a> -->
<!--                                 <a href="#" class="google"><i class="fa fa-google-plus fa-fw"></i></a> -->
<!--                                 <a href="#" class="twitter"><i class="fa fa-twitter fa-fw"></i></a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> end back panel -->
<!--                 </div> end card -->
<!--             </div> end card-container -->
<!--         </div> end col-sm-3 -->
<!--         </div> end col-sm-10 -->
<!--     <div class="space-200"></div> -->
    

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
<%-- 																<a href="<spring:url value='/announcement?id=${ann.announce_id}' />" --%>
<!-- 																	class="btn btn-primary"> <span -->
<!-- 																	class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
<!-- 																</a> <a -->
<%-- 																	href="<spring:url value='/product.json?id=${ann.announce_id}' />" --%>
<!-- 																	class="btn btn-primary">  -->
<!-- 																</a> -->
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
<!-- 	<script src="js/jquery-1.10.2.js" type="text/javascript"></script> -->
<!-- 	<script src="js/bootstrap.min.js" type="text/javascript"></script> -->

<!-- <script type="text/javascript"> -->
//     $().ready(function(){
//         $('[rel="tooltip"]').tooltip();

//         $('a.scroll-down').click(function(e){
//             e.preventDefault();
//             scroll_target = $(this).data('href');
//              $('html, body').animate({
//                  scrollTop: $(scroll_target).offset().top - 60
//              }, 1000);
//         });

//     });

//     function rotateCard(btn){
//         var $card = $(btn).closest('.card-container');
//         console.log($card);
//         if($card.hasClass('hover')){
//             $card.removeClass('hover');
//         } else {
//             $card.addClass('hover');
//         }
//     }


<!-- </script> -->
	



</body>
</html>