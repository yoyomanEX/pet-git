<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"></script>
<!--===============================================================================================-->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">  
     
<style>
body {
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
                            <h1>活動資訊</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::breadcrumb part start::-->

	<section class="container" style="padding-top:100px">
		<div class="row">
			<c:forEach var='activity' items='${allactivity}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 500px;border-width:3px;border-style:dashed;border-color:#FFAC55;padding:5px;margin:10px">
					<div  class="thumbnail" style="width: 320px; height: 340px">
						<div>
						<img width="200px" height="100px"
							src="<c:url value='/activitypicture/${activity.activity_id}' /> " />
							</div>
						<div class="caption">
							<p><b style='font-size: 20px;'>${activity.activity_title}</b></p>
							<p>${activity.end_date}</p>
<%-- 							<p>${activity.activity_content}</p> --%>
<%-- 							<p>人數：${activity.current_number}/${activity.number_limit}</p> --%>

							<p>
							
								<a href="<spring:url value='/activity?activity_id=${activity.activity_id}' />"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a> 
<!-- 								<a -->
<%-- 									href="<spring:url value='product.json?id=${product.bookId}' />" --%>
<!-- 									class="btn btn-primary"> <span -->
<!-- 									class="glyphicon-info-sigh glyphicon"></span>JSON -->
<!-- 								</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	
	<jsp:include page="footer.jsp" />

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- counterup js -->
    <script src="js/jquery.counterup.min.js"></script>
    <!-- waypoints js -->
    <script src="js/waypoints.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>

    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>
</html>
