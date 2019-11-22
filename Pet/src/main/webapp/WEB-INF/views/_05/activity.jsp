<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>leopet || about</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
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

  <!-- ================ contact section start ================= -->
  
      <section class="about_part section_padding">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6">
                    <div class="about_img">
                        <img width="500" height="500" src="<c:url value='/activitypicture/${activity.activity_id}' /> " />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="about_text">
                        <h2 class="contact-title" style="font-size:66px;">${activity.activity_title}</h2>
                       
                        <p style="font-size:30px;">活動內容 ${activity.activity_content}</p>
		                
		                <p style="font-size:30px;">報名人數 ${activity.current_number}/${activity.number_limit}</p>
		              
		               <c:if test="${already != 1 }">
				
					<c:choose>
						<c:when
							test='${activity.current_number != activity.number_limit }'>
							<p style="font-size:30px;">報名
							<form action='peopleactivity' method="post">
								<input type="hidden" name='activity_id'
									value='${activity.activity_id}'><input type="submit"
									value='參加活動' style="font-size:30px;">
							</form>
							</p>
						</c:when>
						<c:otherwise>
							<p style="font-size:30px;">人數已滿</p>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${already == 1 }">
				<p style="font-size:30px;">已報名</p>
				</c:if>
				<p style="font-size:30px;">活動時間： ${activity.end_date}</p>
		                
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part start-->
  <section class="contact-section section_padding">
      <div class="container" >
         <iframe width="1100" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB0en-qV7XhFWwOPPqazsMhMV8j8RqdMqY&q=${activity.activity_add}"  allowfullscreen></iframe>
      </div>
  </section>
  <!-- ================ contact section end ================= -->

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