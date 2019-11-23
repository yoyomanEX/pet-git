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
    
    <title>pET ʕ•ᴥ•ʔ 陪你</title>
    <link rel="icon" href="img/about_icon.png">
    
    <script src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"> </script>  
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"> 
	
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
	   
<style>
section {
background-image: url(img/dog_bg.jpg);
background-size: cover;
background-repeat: no-repeat;
background-attachment: fixed;

/* background-position: 50% -15%; */
}
</style>

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

$(document).ready(function(){
	$("#showmessage2").click(function(){
		$("#hidemessage2").toggle();
		
	})
	
})

function  confirmDelete(no) {
	alert("Blog ID===" + no)
// 	if (confirm("確定刪除留言 ? ") ) {
// 		document.forms[0].action="<c:url value='/deletReplyblog?commid=" + no +"' />" ;
// 		document.forms[0].method="POST";
// 		document.forms[0].submit();
		
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
		$("#btnreport").click(function(){
				alert("已收到您的檢舉，會盡快為您處理");
		});
    });
 </script>
 
<script type='text/javascript'>
    setTimeout('countdown()', 1000);

function countdown() {
	var s = document.getElementById('timer');
	if(s.innerHTML!="") s.innerHTML = s.innerHTML - 1;
	
	if (s.innerHTML == 0)
	window.location = "<spring:url value='/blogIndex'/>";
	else
	setTimeout('countdown()', 1000);
	}
	</script>
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
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h1 style="color:red"><marquee behavior="slide">welcome to myblog</marquee></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::breadcrumb part start::-->
    
    <c:choose>
            <c:when test="${art.available==true}">

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <img src="img/core-img/breadcrumb-line.png" alt="">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
<!--                             <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li> -->
<!--                             <li class="breadcrumb-item"><a href="#">Blog List</a></li> -->
<!--                             <li class="breadcrumb-item active" aria-current="page">Blog Single</li> -->
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
                <div class="col-12 col-lg-8"  id="petblog">
                    <div class="blog-posts-area">

                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-thumbnail mb-30">
                            </div>
                            <div class="post-content">
                              <c:choose>
                                <c:when test="${art.coverImage==null}">
                                <div class="post-thumbnail mb-50"></div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumbnail mb-50">
                                    <img width='600' height='500' src='<c:url value="/getArtPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                                <p class="post-date"> ${fn:substring(art.postTime, 0 ,10)}</p>
                                <h4 class="post-title" style="font-family:標楷體"> ${art.title}</h4>
                                <div class="post-meta">
                                    
                               <!-- Button trigger modal -->
                                 <c:choose>
                                   <c:when test="${empty LoginOK}">
                                   <button style="font-size:16px;padding:6px" class="btn btn-danger" onclick="myFunction()">檢舉</button>
                                   </c:when>
                                   <c:when test="${!empty LoginOK}">
                                   <button style="font-size:16px;padding:6px" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">檢舉</button>
                                   </c:when>
                                 </c:choose>
                                 
                                 <a>
                            <form action="${pageContext.request.contextPath}/articlelike" method="post">
                                    <input type="hidden" class="form-control" id="memberId" name="memberId" placeholder="memberId" readonly="true" value="${LoginOK.member_Id }">
                                    <input type="hidden" value="${art.no}" name="no">
                                 
                                 <c:choose>
                                    <c:when test="${empty LoginOK}">
                                        <button id="like" name="like" value="like" style="font-size:16px;padding:10px" class="btn btn-danger fa fa-thumbs-up" aria-hidden="true" type="submit" onclick="myFunction()">&nbsp&nbsp${art.likeCount}</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button id="like" name="like" value="like" style="font-size:16px;padding:10px" class="btn btn-danger fa fa-thumbs-up" aria-hidden="true" type="submit">&nbsp&nbsp${art.likeCount}</button>
                                    </c:otherwise>
                                 </c:choose>
                             </form>
                                 </a>
                                
                                <a href="#"><span>by</span> ${art.memberId} </a>
                                </div>
                                
                                      <p>${art.content }</p>
                                
                            </div>
                        </div>


<div style="float:right">
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
                        <!-- Post Tags & Share -->
                        <div class="post-tags-share d-flex justify-content-between align-items-center"></div>
                        
<!--     Modal      -->
<div>  
  <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#FFE6D9">
        <div style="text-align:center;">
        <h4 class="modal-title" id="exampleModalLongTitle" style="font-size:35px;font-weight: bold; font-family:標楷體;color:#FF2D2D">❀文章檢舉原因</h4>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/addReportblog" method="post">
     
        <div>
             <input type="hidden" class="form-control" id="member_Id" name="member_Id" placeholder="member_Id" readonly="true" value="${LoginOK.member_Id }">
             <input type="hidden" value="${art.no}" id="rpid" name="rpid">
             <textarea style="font-size:25px;resize:none; height:200px;width:460px;" class="form-control" placeholder="&nbsp&nbsp請輸入......" id="message" name="message" autofocus ></textarea>
             <button style="float:right" type="submit" class="btn btn-lg btn-info" id="btnreport">傳送</button>
        </div>
      </form>
      </div>
    </div>
  </div>
</div>
</div>


                        <!-- Related Post Area -->
                        <div class="related-posts clearfix">
                            <!-- Line -->
                            <div class="curve-line bg-img" style="background-image: url(img/core-img/breadcrumb-line.png);"></div>
                        </div>

                            
                        <!-- Comment Area Start -->
                        <div id="hidemessage" class="comment_area clearfix" style="display:none">
<!--                         <div  class="comment_area clearfix" > -->
                        
                            <c:forEach items="${arts }" var="art" varStatus="s" >
                            <c:set var="count" value="${s.count }"/>
                            <h5 class="headline">#${count}</h5>
                            <ol>
                                <!-- Single Comment Area -->
                                <li class="single_comment_area">
                                    <div class="comment-wrapper d-flex">
                                        <!-- Comment Meta -->
                                        <div class="comment-author">
                                             <img width='600' height='500' src='<c:url value="/getReplyPicture/${art.no }"/>'/>
                                        </div>
                                        <!-- Comment Content -->
                                        <div class="comment-content">
                                            <div style="padding-bottom:20px">
                                            <span class="comment-date">${fn:substring(art.postTime, 0 ,20)} </span>
                                            <h5>${art.memberId}</h5>
                                            <p>${art.content}</p>
                                            </div>
                                            
						<form action="${pageContext.request.contextPath}/articlelike" method="post">
                                    <input type="hidden" class="form-control" id="memberId" name="memberId" placeholder="memberId" readonly="true" value="${LoginOK.member_Id }">
<%--                                     <input type="hidden" value="${art.no}" name="no"> --%>
<%--                                     <button type="button"  class="btn foode-btn btn-sm" id="showmessage${reply.no }">回覆</button>  --%>
<!--                                          <input type="text" class="form-control" id="hidemessage"  style="display:none" name="inputcomm" placeholder="留言...."> -->
                        </form>                
                        
                        <!--  如果登入帳號和留言帳號一樣才會出現修改和刪除 -->
                                   <c:if test="${LoginOK.member_Id == art.memberId }">
<%-- 										<button type="button" id="update${art.no}" class="btn btn-outline-info " onclick="modifyComm(${cb.commNo},${mb.articleNo},${cb.memberId})">修改</button> --%>
                                   <form action="${pageContext.request.contextPath}/deletReplyblog" method="post">
                                        <input type="hidden" value="${art.article_no}" id="idid" name="idid">
										<input type="hidden" value="${art.no}" id="reno" name="reno">
										<button type="submit" name="delete"  class="btn btn-outline-danger " onclick="confirmDelete('${art.no}')">刪除</button>
								   </form>		
										</div>
							       </c:if>
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
                                                <input type="text" class="form-control" id="member_Id" name="member_Id" placeholder="member_Id" readonly="true" value="${LoginOK.name }">
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
                                <img width='60' height='72' src='${pageContext.request.contextPath}/getAboutPicture/${art.no } ' />
                            </div>
                            <!-- Content -->
                            <div class="widget-content text-center" style="padding-bottom:20px">
                                <img src="img/core-img/signature.png" alt="">
                                
                            </div>
                            </div>
                        </div>
                        
                        
                         <!--  -->
						<div class="p-t-50">
							<div class="how2 how2-cl4 flex-s-c" style="padding-top:10px">
								<h3 class="f1-m-2 cl3 tab01-title">
									文章分類
								</h3>
							</div>
							<div style="padding-top:20px">
							<ol >
                                <li><a href="#" id="button1"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbspPET你&nbsp✿&nbsp寵物報報</span> <span></span></a></li>
                                <li><a href="#" id="button2"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbspPET你&nbsp✿&nbsp寵物美容保養</span> <span></span></a></li>
                                <li><a href="#" id="button3"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbspPET你&nbsp✿&nbsp寵物旅遊 </span> <span></span></a></li>
                                <li><a href="#" id="button4"><span style="font-size:18px"><i class="fa fa-stop" aria-hidden="true"></i>&nbspPET你&nbsp✿&nbsp其他</span> <span></span></a></li>
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
                                    <img src='<c:url value="/getArtPicture/${art.no }"/>'/>
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

	
	</c:when>
        <c:otherwise>
              <span id='timer' style="font-size:50px;text-align:center; display:block;" >5</span>
              <span style="font-size:50px;text-align:center; display:block;">秒後，為您自動轉跳。</span>
              <img src="img/lockpicture.jpg" alt="" style="margin-left:150px"><br>
              

        </c:otherwise>
                                
     </c:choose>


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