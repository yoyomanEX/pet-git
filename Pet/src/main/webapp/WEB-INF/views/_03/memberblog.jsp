<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pet你 || blog</title>
    <link rel="icon" href="..${pageContext.request.contextPath}/img/favicon.png">
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
    
     <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>

<body>
    <!--::header part start::-->

<jsp:include page="header.jsp" />
    <!-- Header part end-->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <img src="img/core-img/breadcrumb-line.png" alt="">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Blog Archive</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Content Area Start ##### -->
    <section class="blog-content-area section-padding-0-100">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Blog Posts Area -->
                <div class="col-12 col-lg-8">
                    <div class="blog-posts-area">

                        <!-- Featured Post Area -->
                        <div class="featured-posts">
                            <a href="#"><img src="img/blog-img/1.jpg" alt=""></a>
                            <!-- Featured Post Content -->
                            <div class="featured-post-content">
                                <p>MAY 8, 2018 / foody</p>
                                <a href="#" class="post-title">
                                    <h2>Quick Vegan Enchiladas with Sweet Potato Sauce</h2>
                                </a>
                            </div>
                        </div>
                        
                        <span>






                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            
                            <c:forEach items="${arts}" var="art" varStatus="s">
                            
                            <div class="post-thumbnail mb-50">
                                <a href="#"><img src="img/blog-img/8.jpg" alt=""></a>
                            </div>
                            
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">${fn:substring(art.postTime, 0 ,20)} / foody</p>
                                                            
                                <a href="#" class="post-title">
                                    <h4>${art.title}</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> ${art.memberId}</a>
                                    <a href="#"><i class="fa fa-thumbs-up"></i>&nbsp&nbsp${art.likeCount}</a>
                              
                                </div>
                                <p class="post-excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.</p>
                                
                                                                
                                <a href="${pageContext.request.contextPath}/postblog?id=${art.no}" class="read-more-btn">Continue Reading
<%--                                 <a href="<spring:url value='postblog?id=${art.no}' />" class="read-more-btn">Continue Reading --%>
                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                </a>
                            </div>
                            
                             </c:forEach>
                            
                            
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>






                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            <div class="post-thumbnail mb-50">
                                <a href="#"><img src="img/blog-img/9.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">MAY 12, 2018 / drinks</p>
                                <a href="#" class="post-title">
                                    <h4>Grain-Free Sweet &amp; Savory Activated Walnut Granola</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> Sarah Jenks</a>
                                    <a href="#"><i class="fa fa-eye"></i> 192</a>
                                    <a href="#"><i class="fa fa-comments"></i> 08</a>
                                </div>
                                <p class="post-excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.</p>
                                <a href="#" class="read-more-btn">Continue Reading <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </div>
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            <div class="post-thumbnail mb-50">
                                <a href="#"><img src="img/blog-img/10.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">MAY 15, 2018 / Coffee</p>
                                <a href="#" class="post-title">
                                    <h4>Self-Care Interview Series: Gabrielle Russomagno</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> Sarah Jenks</a>
                                    <a href="#"><i class="fa fa-eye"></i> 192</a>
                                    <a href="#"><i class="fa fa-comments"></i> 08</a>
                                </div>
                                <p class="post-excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.</p>
                                <a href="#" class="read-more-btn">Continue Reading <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </div>
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            <div class="post-thumbnail mb-50">
                                <a href="#"><img src="img/blog-img/11.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">MAY 20, 2018 / foody</p>
                                <a href="#" class="post-title">
                                    <h4>Green Skillet Pizza with Asparagus and Pesto</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> Sarah Jenks</a>
                                    <a href="#"><i class="fa fa-eye"></i> 192</a>
                                    <a href="#"><i class="fa fa-comments"></i> 08</a>
                                </div>
                                <p class="post-excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.</p>
                                <a href="#" class="read-more-btn">Continue Reading <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </div>
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap mt-50">
                            <!-- Thumbnail -->
                            <div class="post-thumbnail mb-50">
                                <a href="#"><img src="img/blog-img/12.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">MAY 28, 2018 / health</p>
                                <a href="#" class="post-title">
                                    <h4>Green Skillet Pizza with Asparagus and Pesto</h4>
                                </a>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> Sarah Jenks</a>
                                    <a href="#"><i class="fa fa-eye"></i> 192</a>
                                    <a href="#"><i class="fa fa-comments"></i> 08</a>
                                </div>
                                <p class="post-excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.</p>
                                <a href="#" class="read-more-btn">Continue Reading <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </div>
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>

                    </div>

                    <!-- Pager -->
                    <ol class="foode-pager mt-50">
                        <li><a href="#"><i class="fa fa-long-arrow-left" aria-hidden="true"></i> Newer</a></li>
                        <li><a href="#">Older <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></li>
                    </ol>
                </div>

                <!-- Blog Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-6 col-lg-4">
                    <div class="post-sidebar-area">

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area mt-0">
                            <form class="search-form" action="#" method="post">
                                <input type="search" name="search" class="form-control" placeholder="Search...">
                                <button><i class="fa fa-send"></i></button>
                            </form>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h6>About Me</h6>
                            </div>
                            <!-- Thumbnail -->
                            <div class="about-thumbnail">
                                <img src="img/blog-img/about-me.jpg" alt="">
                            </div>
                            <!-- Content -->
                            <div class="widget-content text-center">
                                <img src="img/core-img/signature.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
                            </div>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h6>Categories</h6>
                            </div>
                            <ol class="foode-catagories">
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> Drink</span> <span>(18)</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> Foody</span> <span>(28)</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> Tea</span> <span>(15)</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> Coffee</span> <span>(27)</span></a></li>
                            </ol>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h6>Latest Posts</h6>
                            </div>

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex">
                                <div class="post-thumb">
                                    <img src="img/blog-img/lp1.jpg" alt="">
                                </div>
                                <div class="post-content">
                                    <a href="#" class="post-title">
                                        <h6>Weeknight Ponzu Pasta</h6>
                                    </a>
                                    <a href="#" class="post-author"><span>by</span> Erin Alderson</a>
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
                                    </a>
                                    <a href="#" class="post-author"><span>by</span> Erin Alderson</a>
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
                                    </a>
                                    <a href="#" class="post-author"><span>by</span> Erin Alderson</a>
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
                                    </a>
                                    <a href="#" class="post-author"><span>by</span> Erin Alderson</a>
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
                                    </a>
                                    <a href="#" class="post-author"><span>by</span> Erin Alderson</a>
                                </div>
                            </div>

                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Adds -->
                            <a href="#"><img src="img/blog-img/add.png" alt=""></a>
                        </div>

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="widget-title">
                                <h6>Archives</h6>
                            </div>
                            <ol class="foode-archives">
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> January 2018</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> February 2018</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> March 2018</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> April 2018</span></a></li>
                                <li><a href="#"><span><i class="fa fa-stop" aria-hidden="true"></i> May 2018</span></a></li>
                            </ol>
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
                        <span>@foodeblog</span>
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
    <script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/js/active.js"></script>
</body>

</html>