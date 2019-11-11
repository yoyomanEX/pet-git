<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   
  
<script>
$(document).ready(function(){
	$("#autobutton").click(function(){
		$("#content").val("這篇文章寫得好好喔!")
		
	})
	
})

$(document).ready(function(){
	$("#showmessage").click(function(){
		$("#hidemessage").toggle();
		
	})
	
})


function  confirmDelete(no) {
	alert("Blog ID===" + no)
	
}
</script>

<script>
function myFunction() {
  if (confirm("oops!! 請先登入!!")) {
  } else { }
}
</script>

 <script>
    $(document).ready(function(){
		$("#button2").click(function(){
				alert("已收到您的檢舉，會盡快為您處理");
		});
    });
 </script>

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
                            <li class="breadcrumb-item"><a href="#">Blog List</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Blog Single</li>
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

                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-thumbnail mb-30">
                            </div>
                            <div class="post-content">
                                <p class="post-date"> ${fn:substring(art.postTime, 0 ,10)}  / foody</p>
                                <h4 class="post-title" style="font-family:標楷體"> ${art.title}</h4>
                                <div class="post-meta">
                                    
                               
                                 <c:choose>
                                   <c:when test="${empty LoginOK}">
                                   <button style="padding:3px" class="btn btn-primary" onclick="myFunction()">檢舉</button>
                                   </c:when>
                                   <c:when test="${!empty LoginOK}">
                                   <button style="padding:3px" class="btn btn-primary" onclick="document.getElementById('id01').style.display='block'" >檢舉</button>
                                   </c:when>
                                 </c:choose>
                                 
                                 <a>
                                 <form action="${pageContext.request.contextPath}/articlelike" method="post">
                                 <input type="hidden" class="form-control" id="memberId" name="memberId" placeholder="memberId" readonly="true" value="${LoginOK.member_Id }">
                                 <input type="hidden" value="${art.no}" name="no">
                                 
                                 <c:choose>
                                 <c:when test="${empty LoginOK}">
                                 <button id="like" name="like" value="like" style="padding:8px" class="btn btn-primary fa fa-thumbs-up" aria-hidden="true" type="submit" onclick="myFunction()">&nbsp&nbsp${art.likeCount}</button>
                                 </c:when>
                                 <c:otherwise>
                                 <button id="like" name="like" value="like" style="padding:8px" class="btn btn-primary fa fa-thumbs-up" aria-hidden="true" type="submit">&nbsp&nbsp${art.likeCount}</button>
                                 </c:otherwise>
                                 </c:choose>
                                 </form>
                                 </a>
                                
                                <a href="#"><span>by</span> ${art.memberId} </a>
                                </div>
                                
                                
                                <p>${art.content }</p>
<!--                                 <p>What hadn’t shown up, however, was the idea that Vietnamese cuisine can be taken seriously, with complex techniques and in a fancier setting. That changed with last December’s opening of Taro, a surprisingly chic bistro in the forever up-and-coming Smichov neighborhood southwest of Old Town. Run by two brothers, Khanh and Giang Ta, Taro has no evening à la carte menu (there is one at lunch), instead offering just two options for dinner: a four-course tasting menu at 890 koruna (about $40) or a seven-course menu at 1,290 koruna per person, not including drinks. Cheap noodles this ain’t.</p> -->
<!--                                 <blockquote> -->
<!--                                     <div class="blockquote-icon"> -->
<!--                                         <img src="img/core-img/quote.png" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="blockquote-text"> -->
<!--                                         <h6>That’s not to say you’ll have the exact same thing if you stop by: the restaurant’s menus change constantly, based on seasonal ingredients.</h6> -->
<!--                                         <h6>Ollie Schneider</h6> -->
<!--                                     </div> -->
<!--                                 </blockquote> -->
<!--                                 <h4>You have 4 free articles remaining.</h4> -->
<!--                                 <p>A deconstructed gyoza started things off on my visit, topping a crisp won ton cracker with sweet and spicy candied ginger, a tender bite of smoky Peking duck and an aromatic cucumber gel for a crunchy and fragrant amuse bouche. Seven equally creative courses followed, often balancing sweet notes with bracing acidity.</p> -->
<!--                                 <p>A sweet-and-sour sea bass tartare, decorated with apple chips, mango chunks and creamy avocado purée, tasted more like a ceviche, while a green mango salad bathed in crisp passion fruit dressing contrasted tropical fruit flavors with juicy chunks of slow-cooked beef tenderloin.</p> -->
                            </div>
                        </div>

                        <!-- Post Tags & Share -->
                        <div class="post-tags-share d-flex justify-content-between align-items-center"></div>
                        
<!--     Modal      -->
<div class="w3-container">
<div style="float:right">
  
<!--   <button style="padding:3px;margin-bottom:7px" class="btn btn-primary" >留言</button> -->

<span>
   <c:forEach items="${arts }" var="art" varStatus="s" >
   <c:set var="count" value="${s.count }"/>
   </c:forEach>
   
   <c:choose>
       <c:when test="${empty count}">
        <h4 class="fa fa-comments-o" style="font-size:20px" id="showmessage">&nbsp&nbsp0則留言</h4>
       </c:when>
       <c:otherwise>
<%--       <h4 class="headline" id="showmessage">${count} 則留言</h4> --%>
       <h1 class="fa fa-comments-o" style="font-size:20px" id="showmessage">&nbsp&nbsp${count} 則留言</h1>
       </c:otherwise>
       </c:choose>
   
  </span>

</div>  
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
<!--         <h4 style="font-size:25px;font-weight: bold; font-family:標楷體">檢舉原因</h4> -->
      </div>

      <form class="w3-container" action="${pageContext.request.contextPath}/addReportblog" method="post">
     
        <div class="w3-section" style="text-align:center;">
          <label style="font-size:25px;font-weight: bold; font-family:標楷體;"><b>檢舉原因</b></label>
             <input type="hidden" class="form-control" id="member_Id" name="member_Id" placeholder="member_Id" readonly="true" value="${LoginOK.member_Id }">
             <input type="hidden" value="${art.no}" id="rpid" name="rpid">
             <textarea style="resize:none; height:250px" class="w3-input w3-border w3-margin-bottom" placeholder="請輸入原因" name="message" autofocus ></textarea>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit" id="button2">傳送</button>
 
        </div>
      </form>
    </div>
  </div>
</div>


                        <!-- Related Post Area -->
                        <div class="related-posts clearfix">
                            <!-- Line -->
<!--                             <div class="curve-line bg-img mb-50" style="background-image: url(img/core-img/breadcrumb-line.png);"></div> -->

                            <!-- Headline -->
                            
<!--                             <h4 class="headline">Relatest News</h4> -->

<!--                             <div class="row"> -->

<!--                                 Single Blog Post -->
<!--                                 <div class="col-12 col-md-6"> -->
<!--                                     <div class="single-blog-post related-post"> -->
<!--                                         Thumbnail -->
<!--                                         <div class="post-thumbnail mb-50"> -->
<!--                                             <a href="#"><img src="img/blog-img/13.jpg" alt=""></a> -->
<!--                                         </div> -->
<!--                                         Content -->
<!--                                         <div class="post-content mb-50"> -->
<!--                                             <p class="post-date">MAY 12, 2018 / drinks</p> -->
<!--                                             <a href="#" class="post-title"> -->
<!--                                                 <h4>Grain-Free Sweet &amp; Savory Activate Walnut Granola</h4> -->
<!--                                             </a> -->
<!--                                             <div class="post-meta"> -->
<!--                                                 <a href="#"><span>by</span> Sarah Jenks</a> -->
<!--                                                 <a href="#"><i class="fa fa-eye"></i> 192</a> -->
<!--                                                 <a href="#"><i class="fa fa-comments"></i> 08</a> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                                 Single Blog Post -->
<!--                                 <div class="col-12 col-md-6"> -->
<!--                                     <div class="single-blog-post related-post"> -->
<!--                                         Thumbnail -->
<!--                                         <div class="post-thumbnail mb-50"> -->
<!--                                             <a href="#"><img src="img/blog-img/14.jpg" alt=""></a> -->
<!--                                         </div> -->
<!--                                         Content -->
<!--                                         <div class="post-content mb-50"> -->
<!--                                             <p class="post-date">MAY 15, 2018 / Coffee</p> -->
<!--                                             <a href="#" class="post-title"> -->
<!--                                                 <h4>Self-Care Interview Series: Gabrielle Russomagno</h4> -->
<!--                                             </a> -->
<!--                                             <div class="post-meta"> -->
<!--                                                 <a href="#"><span>by</span> Sarah Jenks</a> -->
<!--                                                 <a href="#"><i class="fa fa-eye"></i> 192</a> -->
<!--                                                 <a href="#"><i class="fa fa-comments"></i> 08</a> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->

                            <!-- Line -->
                            <div class="curve-line bg-img" style="background-image: url(img/core-img/breadcrumb-line.png);"></div>
                        </div>

                            
                        <!-- Comment Area Start -->
<!--                         <div> -->
<%--                             <c:forEach items="${arts }" var="art" varStatus="s" > --%>
<%--                             <c:set var="count" value="${s.count }"/> --%>
<%--                             </c:forEach> --%>
<%--                             <h4 class="headline" id="showmessage">${count} 則留言</h4> --%>
<!--                         </div> -->
                        
                        <div id="hidemessage" class="comment_area clearfix" style="display:none">
                       
                        
                            <c:forEach items="${arts }" var="art" varStatus="s" >
                            <c:set var="count" value="${s.count }"/>
                            <h5 class="headline">#${count}</h5>
                            <ol>
                                <!-- Single Comment Area -->
                                <li class="single_comment_area">
                                    <div class="comment-wrapper d-flex">
                                        <!-- Comment Meta -->
                                        <div class="comment-author">
                                            <img src="img/blog-img/15.jpg" alt="">
                                        </div>
                                        <!-- Comment Content -->
                                        <div class="comment-content">
                                            <span class="comment-date">${fn:substring(art.postTime, 0 ,20)} </span>
                                            <h5>${art.memberId}</h5>
                                            <p>${art.content}</p>
                                            
                                   <c:if test="${LoginOK.member_Id == art.memberId }"><%-- 如果登入帳號和留言帳號一樣才會出現修改和刪除--%>
										<span>
												
										<button type="button" id="update${art.no}" class="btn btn-outline-info btn-sm" onClick="modifyComm(${cb.commNo},${mb.articleNo},'${cb.memberId}')">修改</button>
										<button type="button" name="delete"  class="btn btn-outline-danger btn-sm" onClick="confirmDelete('${art.no}')">刪除</button>
															
										</span>
							       </c:if>
                                            
                                        </div>
                                    </div>
                                    
                                </li>
                             
                            </ol>
                            
                            </c:forEach>
                            
                            
                        </div>

                        <!-- Leave A Comment -->
                        <br>
                        
                        <div class="leave-comment-area clearfix">
                            <div class="comment-form">
                                <h4 class="headline" >Leave A Comment</h4>

                                <!-- Comment Form -->
                                <form action="${pageContext.request.contextPath}/addReplyblog" method="post">
                                    <div class="row">
<!--                                         <div class="col-12 col-md-6"> -->
                                        <div class="col-12">
                                            <div class="form-group">
<%--                                                 <input type="text" class="form-control" id="Name" name="Name" placeholder="Name" value="${param.Name}"> --%>
                                                <input type="text" class="form-control" id="member_Id" name="member_Id" placeholder="member_Id" readonly="true" value="${LoginOK.member_Id }">
                                                <input type="hidden" value="${art.no}" id="id" name="id">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control" style="resize:none; height:250px" name="content" id="content" cols="30" rows="10" placeholder="Comment">${param.content}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                        
                                         <c:choose>
                                         <c:when test="${empty sessionScope.LoginOK}">
                                              <input type="submit" class="btn foode-btn" value="Post Comment" name="sessionNull" onclick="myFunction()">
                 
                                         </c:when>
                                         <c:otherwise>
                                              <input type="submit" class="btn foode-btn" value="Post Comment">
                                         </c:otherwise>
                                         </c:choose>
                               
                                            <button type="button" id="autobutton" class="btn foode-btn" >一鍵發文</button>
                                          
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Blog Sidebar Area -->
                <div class="col-12 col-sm-9 col-md-6 col-lg-4">
                    <div class="post-sidebar-area">

                        <!-- ##### Single Widget Area ##### -->
                        <div class="single-widget-area mt-0">
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
<!--                         <div class="single-widget-area"> -->
<!--                             Title -->
<!--                             <div class="widget-title"> -->
<!--                                 <h6>popular tags</h6> -->
<!--                             </div> -->
                            <!-- Tags -->
<!--                             <ol class="popular-tags d-flex flex-wrap"> -->
<!--                                 <li><a href="#">Creative</a></li> -->
<!--                                 <li><a href="#">Unique</a></li> -->
<!--                                 <li><a href="#">Template</a></li> -->
<!--                                 <li><a href="#">Photography</a></li> -->
<!--                                 <li><a href="#">travel</a></li> -->
<!--                                 <li><a href="#">lifestyle</a></li> -->
<!--                                 <li><a href="#">Wordpress Template</a></li> -->
<!--                                 <li><a href="#">food</a></li> -->
<!--                                 <li><a href="#">Idea</a></li> -->
<!--                             </ol> -->
<!--                         </div> -->

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


    <!-- footer part start-->

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