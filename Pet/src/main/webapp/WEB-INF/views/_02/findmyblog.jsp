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
<!--===============================================================================================-->
	
	<link rel="stylesheet" type="text/css" href="css/main.css">  
     
<style>
section {
background-image: url(img/dog_bg.jpg);
background-size: cover;
background-repeat: no-repeat;
background-attachment: fixed;

/* background-position: 50% -15%; */
}
</style>
</head>

<body>
    <!--::header part start::-->

<jsp:include page="header.jsp" />
    <!-- Header part end-->
    
    <!--::breadcrumb part start::-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h1>${LoginOK.member_Id}blog</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::breadcrumb part start::-->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <img src="img/core-img/breadcrumb-line.png" alt="">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
<!--                             <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li> -->
<!--                             <li class="breadcrumb-item active" aria-current="page">Blog Archive</li> -->
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

       
                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap">
                            <!-- Thumbnail -->
                           
                            <c:forEach items="${arts }" var="art" varStatus="s">
                            
                            
                            
                            <c:choose>
                                <c:when test="${art.coverImage==null}">
                                <div class="post-thumbnail mb-50"></div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumbnail mb-50">
                                    <img width='450' height='500' src='<c:url value="/getPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                            
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">${fn:substring(art.postTime, 0 ,20)} / foody</p>
                                                            
                                <div class="post-title">
                                    <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title">
                                        <h4>${art.title}</h4>
                                    </a>
                                </div>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> ${art.memberId}</a>
                                    <a href="#"><i class="fa fa-thumbs-up"></i>&nbsp&nbsp${art.likeCount}</a>
                              
                                </div>
                                <p class="post-excerpt">${fn:substring(art.content, 0 ,20)}</p>
                                
                                                                
                                <a href="${pageContext.request.contextPath}/postblog?id=${art.no}" class="read-more-btn">Continue Reading
<%--                                 <a href="<spring:url value='postblog?id=${art.no}' />" class="read-more-btn">Continue Reading --%>
                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                </a>
                            </div>
                            
                      
                             </c:forEach>
                             
                             
                            
                            
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
                            <div class="how2 how2-cl4 flex-s-c" style="padding-top:10px">
								<h3 class="f1-m-2 cl3 tab01-title">
									關於我
								</h3>
							</div>
                            <!-- Thumbnail -->
                            <div style="padding-top:40px">
                            <div class="about-thumbnail">
                                <img width='60' height='72' src='getPicture' />
                            </div>
                            <!-- Content -->
                            <div class="widget-content text-center" style="padding-bottom:40px">
                                <img src="img/core-img/signature.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
                            </div>
                            </div>
                        </div>
                        
                        
                         <!--  -->
						<div class="p-t-50">
							<div class="how2 how2-cl4 flex-s-c" style="padding-top:10px">
								<h3 class="f1-m-2 cl3 tab01-title">
									Categories
								</h3>
							</div>
							<div style="padding-top:20px">
							<ol >
                                <li><a href="#"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp&nbsp美食</span> <span>(18)</span></a></li>
                                <li><a href="#"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp&nbsp旅遊</span> <span>(28)</span></a></li>
                                <li><a href="#"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp&nbsp保養</span> <span>(15)</span></a></li>
                                <li><a href="#"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp&nbsp知識</span> <span>(27)</span></a></li>
                            </ol>
							</div>
						</div>


                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                           <div class="how2 how2-cl4 flex-s-c" style="padding-top:10px">
								<h3 class="f1-m-2 cl3 tab01-title">
									推薦文章
								</h3>
							</div>
                            <div style="padding-top:30px">
                            <c:forEach items="${artss }" var="art" varStatus="s">

                            <!-- Single Latest Posts -->
                            <div class="single-latest-post d-flex">
                               
                               <c:choose>
                                <c:when test="${art.coverImage==null}">
                                <div class="post-thumb"></div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumb">
                                    <img src='<c:url value="/getPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                               
                                
                                <div class="post-content">
                                    <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title">
                                        <h6>${art.title}</h6>
                                    </a>
                                    <a href="#"><i></i>${fn:substring(art.postTime, 0 ,10)}</a>
                                    <div style="float:right">by${art.memberId}</div> 
                                </div>
                            </div>

                           </c:forEach>
                           </div>
                        </div>

         

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area">
                            <!-- Title -->
                            <div class="how2 how2-cl4 flex-s-c" style="padding-top:10px">
								<h3 class="f1-m-2 cl3 tab01-title">
									popular tags
								</h3>
							</div>
                            <!-- Tags -->
                            <div style="padding-top:30px">
                            <ol class="popular-tags d-flex flex-wrap" >
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
        </div>
    </section>
    <!-- ##### Blog Content Area End ##### -->



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