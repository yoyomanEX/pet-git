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
    
<style>
body {
background-image: url(img/007-bg017.jpg);
background-size: cover;
background-repeat: no-repeat;
background-attachment: fixed;

/* background-position: 50% -15%; */
}
</style>
<script>

//文章分類
$(document).ready(function() {
	$("#button1").click(function(){
// 		alert("成功");
		$.ajax({
  			url:"${pageContext.request.contextPath}/getblogfood",
  			type:"post",
  			headers : {
				Accept : "text/html, application/xhtml+xml, */*"
			},
  			success:function (data){
  				$("#petblog").empty();
  				$("#petblog").append(data);
  			}
  		});
	});
})

$(document).ready(function() {
	$("#button2").click(function(){
		$.ajax({
  			url:"${pageContext.request.contextPath}/getblogtravel",
  			type:"post",
  			headers : {
				Accept : "text/html, application/xhtml+xml, */*"
			},
  			success:function (data){
  				$("#petblog").empty();
  				$("#petblog").append(data);
  			}
  		});
	});
})

$(document).ready(function() {
	$("#button3").click(function(){
// 		alert("成功");
		$.ajax({
  			url:"${pageContext.request.contextPath}/getblogbeauty",
  			type:"post",
  			headers : {
				Accept : "text/html, application/xhtml+xml, */*"
			},
  			success:function (data){
  				$("#petblog").empty();
  				$("#petblog").append(data);
  			}
  		});
	});
})

$(document).ready(function() {
	$("#button4").click(function(){
// 		alert("成功");
		$.ajax({
  			url:"${pageContext.request.contextPath}/getbloganother",
  			type:"post",
  			headers : {
				Accept : "text/html, application/xhtml+xml, */*"
			},
  			success:function (data){
  				$("#petblog").empty();
  				$("#petblog").append(data);
  			}
  		});
	});
})


</script>
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
                            <h1>blog</h1>
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
                        <div class="single-blog-post d-flex flex-wrap" id="petblog">
                            <!-- Thumbnail -->
                           
                            <c:forEach items="${arts }" var="art" varStatus="s">
                            
                            
                            
                            <c:choose>
                                <c:when test="${art.coverImage==null}">
                                <div class="post-thumbnail mb-50">
                            </div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumbnail mb-50">
                                    <img width='600' height='500' src='<c:url value="/getArtPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                            
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



                    </div>

                    <!-- Pager -->
                    <ol class="foode-pager mt-50">
                        <li><a href="#"><i class="fa fa-long-arrow-left" aria-hidden="true"></i> Newer</a></li>
                        <li><a href="#">Older <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></li>
                    </ol>
                </div>

<div class="col-lg-4">
                  <div class="blog_right_sidebar">
<!--                       <aside class="single_sidebar_widget search_widget"> -->
<!--                           <form action="#"> -->
<!--                             <div class="form-group"> -->
<!--                               <div class="input-group mb-3"> -->
<!--                                 <input type="text" class="form-control" placeholder = 'Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'"> -->
<!--                                 <div class="input-group-append"> -->
<!--                                   <button class="btn" type="button"><i class="ti-search"></i></button> -->
<!--                                 </div> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                             <button class="button rounded-0 primary-bg text-white w-100" type="submit">Search</button> -->
<!--                           </form> -->
<!--                       </aside> -->
                      
                      <aside class="single_sidebar_widget newsletter_widget">
                        <h4 class="widget_title"><i class="fa fa-user-circle-o"></i>&nbsp&nbsp關於我</h4>

                        <div style=>
                            <div class="about-thumbnail" align="center">
                                <img width='60' height='72' src='getPicture' />
<!--                                 <img width='200' height='300' src="img/single_adopt_5.png" /> -->
                            </div>
                            <!-- Content -->
                            <div class="widget-content text-center" style="padding-bottom:40px">
                                <img src="img/core-img/signature.png" alt="">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
                            </div>
                            </div>
                        
                      </aside>

                      <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">Category</h4>
                        <ul class="list cat-list">
                            <li><a href="#" class="d-flex" id="button1"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp✿&nbsp美食</span> <span></span></a></li>
                            <li><a href="#" class="d-flex" id="button2"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp✿&nbsp旅遊</span> <span></span></a></li>
                            <li><a href="#" class="d-flex" id="button3"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp✿&nbsp保養</span> <span></span></a></li>
                            <li><a href="#" class="d-flex" id="button4"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbsp&nbspPET&nbsp✿&nbsp知識</span> <span></span></a></li>
                        </ul>
                      </aside>

                      <aside class="single_sidebar_widget popular_post_widget">
                          <h3 class="widget_title"><i class="fa fa-heart"></i>&nbsp&nbsp推薦文章</h3>
                         
                         <c:forEach items="${artss }" var="art" varStatus="s">
                          <div class="media post_item">
                              <c:choose>
                                <c:when test="${art.coverImage==null}">
                                 <div class="post-thumb"></div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumb">
                                    <img width="50" height="50" src='<c:url value="/getArtPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                              <div class="media-body">
                                  <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title">
                                        <h6>${art.title}</h6>
                                  </a>
                                  <p>${fn:substring(art.postTime, 0 ,10)}</p>
                              </div>
                          </div>
                         </c:forEach>
                          
                      </aside>

                      <aside class="single_sidebar_widget instagram_feeds">
                        <h4 class="widget_title"><i class="fa fa-home"></i>&nbsp&nbsp誰來我家</h4>
                        <ul class="instagram_row flex-wrap">
                           <c:forEach var='visit' items='${visit}'>
                            <li>
                                  <img src="getMbPicture/${visit.otherid}" width="80" height="80" alt="">&nbsp&nbsp
                            </li>
                 	      		</c:forEach>
                        </ul>
                      </aside>


                      
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
</body>

</html>