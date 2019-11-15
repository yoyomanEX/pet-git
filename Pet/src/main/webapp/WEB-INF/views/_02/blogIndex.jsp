<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>

<body>
	<!--::header part start::-->
     <jsp:include page="header.jsp" />
    <!-- Header part end-->


    
	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-post-slides owl-carousel">

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/2.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / 35 Comments</p>
					<a href="#" class="post-title">
						<h4>Fried Pizzas on parchment paper with basil.</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/3.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / Foody</p>
					<a href="#" class="post-title">
						<h4>Quick Vegan Enchiladas with Sweet Potato Sauce</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/4.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>aug 8, 2018 / health</p>
					<a href="#" class="post-title">
						<h4>Eleven Slushie Cocktails I Bookmarked</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/5.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / drinks</p>
					<a href="#" class="post-title">
						<h4>Homemade Strawberry Almond Milk</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/6.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / foody</p>
					<a href="#" class="post-title">
						<h4>Kitchen Sink Sunflower Salad in a bow.</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/2.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / 35 Comments</p>
					<a href="#" class="post-title">
						<h4>Fried Pizzas on parchment paper with basil.</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/3.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / Foody</p>
					<a href="#" class="post-title">
						<h4>Quick Vegan Enchiladas with Sweet Potato Sauce</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/4.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>aug 8, 2018 / health</p>
					<a href="#" class="post-title">
						<h4>Eleven Slushie Cocktails I Bookmarked</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/5.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / drinks</p>
					<a href="#" class="post-title">
						<h4>Homemade Strawberry Almond Milk</h4>
					</a>
				</div>
			</div>

			<!-- Single Hero Post -->
			<div class="single-hero-post">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(img/blog-img/6.jpg);"></div>
				<!-- Post Content -->
				<div class="hero-slides-content">
					<p>MAY 8, 2018 / foody</p>
					<a href="#" class="post-title">
						<h4>Kitchen Sink Sunflower Salad in a bow.</h4>
					</a>
				</div>
			</div>

		</div>
	</section>
	<!-- ##### Hero Area End ##### -->

	<!-- ##### Blog Content Area Start ##### -->
	<section class="blog-content-area section-padding-100">
		<div class="container">
			<div class="row">
				<!-- Featured Post Area -->
				<div class="col-12">
					<div class="featured-post-area">
						<div id="featured-post-slides"
							class="carousel slide d-flex flex-wrap" data-ride="carousel">

							<div class="carousel-inner">

								<div class="carousel-item active bg-img"
									style="background-image: url(img/blog-img/7.jpg)">
									<!-- Featured Post Content -->
									<div class="featured-post-content">
										<p>MAY 8, 2018 / foody</p>
										<a href="#" class="post-title">
											<h2>A Closer Look At Our Front Porch Items From Lowe’s</h2>
										</a>
									</div>
								</div>

								<div class="carousel-item bg-img"
									style="background-image: url(img/blog-img/6.jpg)">
									<!-- Featured Post Content -->
									<div class="featured-post-content">
										<p>MAY 8, 2018 / foody</p>
										<a href="#" class="post-title">
											<h2>12 Beautiful Vegan Panna Cottas</h2>
										</a>
									</div>
								</div>

								<div class="carousel-item bg-img"
									style="background-image: url(img/blog-img/2.jpg)">
									<!-- Featured Post Content -->
									<div class="featured-post-content">
										<p>MAY 8, 2018 / foody</p>
										<a href="#" class="post-title">
											<h2>Quick Vegan Enchiladas with Sweet Potato Sauce</h2>
										</a>
									</div>
								</div>

								<div class="carousel-item bg-img"
									style="background-image: url(img/blog-img/3.jpg)">
									<!-- Featured Post Content -->
									<div class="featured-post-content">
										<p>MAY 8, 2018 / foody</p>
										<a href="#" class="post-title">
											<h2>Instant Pot Mushroom Stroganoff with Vodka</h2>
										</a>
									</div>
								</div>

								<div class="carousel-item bg-img"
									style="background-image: url(img/blog-img/5.jpg)">
									<!-- Featured Post Content -->
									<div class="featured-post-content">
										<p>MAY 8, 2018 / foody</p>
										<a href="#" class="post-title">
											<h2>The Most Popular Recipe Last Month</h2>
										</a>
									</div>
								</div>
							</div>

							<ol class="carousel-indicators">
								<li data-target="#featured-post-slides" data-slide-to="0"
									class="active">
									<h2>01</h2> <a href="#" class="post-title">
										<h5>A Closer Look At Our Front Porch Items From Lowe’s</h5>
								</a>
								</li>
								<li data-target="#featured-post-slides" data-slide-to="1">
									<h2>02</h2> <a href="#" class="post-title">
										<h5>12 Beautiful Vegan Panna Cottas</h5>
								</a>
								</li>
								<li data-target="#featured-post-slides" data-slide-to="2">
									<h2>03</h2> <a href="#" class="post-title">
										<h5>Quick Vegan Enchiladas with Sweet Potato Sauce</h5>
								</a>
								</li>
								<li data-target="#featured-post-slides" data-slide-to="3">
									<h2>04</h2> <a href="#" class="post-title">
										<h5>Instant Pot Mushroom Stroganoff with Vodka</h5>
								</a>
								</li>

							</ol>

						</div>
					</div>
				</div>
			</div>
			
					<div class="top-header" style="margin-top: 60px">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							
							<!-- Search Form -->
<%-- 					    <form action="${pageContext.request.contextPath}/findBySearchblog" method="post" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"> --%>
							<div class="input-group">
								<input type="text" name="search" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
<!-- 						</form>	 -->
						
							
						</div>
					</div>
				</div>
			</div>
		</div>

			<div class="row justify-content-center">
				<!-- Blog Posts Area -->
				<div class="col-12 col-lg-8">
					<div class="blog-posts-area">

						 <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            
                            <c:forEach items="${arts }" var="art" varStatus="s">
                            
                             <div class="post-thumbnail mb-50">
                                <img width='300' height='450' src='<c:url value="/getPicture/${art.no }"/>'/>
                            </div>
                            
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">${fn:substring(art.postTime, 0 ,20)} / pet</p>
                                                            
                                <a href="#" class="post-title">
                                    <h4>${art.title}</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> ${art.memberId}</a>
<!--                                     <a href="#"><i class="fa fa-eye"></i> 192</a> -->
<!--                                     <a href="#"><i class="fa fa-comments"></i> 08</a> -->
                                    <a href="#"><i class="fa fa-thumbs-up"></i>&nbsp&nbsp${art.likeCount}</a>
                                </div>
                                <p class="post-excerpt">${fn:substring(art.content, 0 ,20)}</p>
                                <a href="<spring:url value='postblog?id=${art.no}' />" class="read-more-btn">Continue Reading <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </div>
                            
                             </c:forEach>
                            
                            
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>
					</div>

					<!-- Pager -->
					<ol class="foode-pager mt-50">
						<li><a href="#"><i class="fa fa-long-arrow-left"
								aria-hidden="true"></i> Newer</a></li>
						<li><a href="#">Older <i class="fa fa-long-arrow-right"
								aria-hidden="true"></i></a></li>
					</ol>
				</div>

				<!-- Blog Sidebar Area -->
				<div class="col-12 col-sm-9 col-md-6 col-lg-4">
					<div class="post-sidebar-area">
					
					     <!-- ##### Single Widget Area ##### -->
						<div class="single-widget-area">
							<!-- Adds -->
							<a href="#"><img src="img/blog-img/add4.jpg" alt=""></a>
						</div>

				

						<!-- ##### Single Widget Area ##### -->
						<div class="single-widget-area">
							<!-- Title -->
							<div class="widget-title">
								<h6>最新文章</h6>
							</div>

							<!-- Single Latest Posts -->
							<div class="single-latest-post d-flex">
								<div class="post-thumb">
									<img src="img/blog-img/lp1.jpg" alt="">
								</div>
								<div class="post-content">
									<a href="#" class="post-title">
										<h6>Weeknight Ponzu Pasta</h6>
									</a> <a href="#" class="post-author"><span>by</span> Erin
										Alderson</a>
								</div>
							</div>

							<!-- Single Latest Posts -->
							<div class="single-latest-post d-flex">
								<div class="post-thumb">
									<img src="img/blog-img/lp2.jpg" alt="">
								</div>
								<div class="post-content">
									<a href="#" class="post-title">
										<h6>The Most Popular Recipe Last Month</h6>
									</a> <a href="#" class="post-author"><span>by</span> Erin
										Alderson</a>
								</div>
							</div>

							<!-- Single Latest Posts -->
							<div class="single-latest-post d-flex">
								<div class="post-thumb">
									<img src="img/blog-img/lp3.jpg" alt="">
								</div>
								<div class="post-content">
									<a href="#" class="post-title">
										<h6>A Really Good Chana Masala</h6>
									</a> <a href="#" class="post-author"><span>by</span> Erin
										Alderson</a>
								</div>
							</div>

							<!-- Single Latest Posts -->
							<div class="single-latest-post d-flex">
								<div class="post-thumb">
									<img src="img/blog-img/lp4.jpg" alt="">
								</div>
								<div class="post-content">
									<a href="#" class="post-title">
										<h6>Spicy Instant Pot Taco Soup</h6>
									</a> <a href="#" class="post-author"><span>by</span> Erin
										Alderson</a>
								</div>
							</div>

							<!-- Single Latest Posts -->
							<div class="single-latest-post d-flex">
								<div class="post-thumb">
									<img src="img/blog-img/lp5.jpg" alt="">
								</div>
								<div class="post-content">
									<a href="#" class="post-title">
										<h6>Lime Leaf Miso Soup</h6>
									</a> <a href="#" class="post-author"><span>by</span> Erin
										Alderson</a>
								</div>
							</div>

						</div>


						<!-- ##### Single Widget Area ##### -->
						<div class="single-widget-area">
							<!-- Title -->
							<div class="widget-title">
								<h6>popular tags</h6>
							</div>
							<!-- Tags -->
							<ol class="popular-tags d-flex flex-wrap">
								<li><a href="#">Creative</a></li>
								<li><a href="#">Unique</a></li>
								<li><a href="#">Template</a></li>
								<li><a href="#">Photography</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">lifestyle</a></li>
								<li><a href="#">Wordpress Template</a></li>
								<li><a href="#">food</a></li>
								<li><a href="#">Idea</a></li>
							</ol>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Blog Content Area End ##### -->

	<!-- ##### Instagram Area Start ##### -->
	<div class="follow-us-instagram">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading">
						<h2>Follow Us On Instagram</h2>
						<span>@pET-blog</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="instagram-slides owl-carousel">
						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet1.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>
						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet5.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>
						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet2.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>

						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet4.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>


						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet6.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>

						<!-- Single Instagram Slide -->
						<div class="single-instagram-slide">
							<img src="img/blog-img/pet3.jpg" alt=""> <a href="#"><i
								class="fa fa-instagram"></i>Follow Me</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Instagram Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	
	<jsp:include page="footer.jsp" />
	<!-- footer part end-->


	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/js/active.js"></script>
	
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
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<!-- 瀑布流 js -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
</body>

</html>