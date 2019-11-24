<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!--   <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript"
	src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>">
	
</script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>


<script>
	//     $(document).ready(function(){   //button的id不能相同，所以如果用迴圈增加刪除紐，只會有一個有反應
	// 		$("#button2").click(function(){
	// 			alert("删除成功");

	// 		});
	//     });
	function myFunction() {
		document.getElementById("frm1").submit();
	}
</script>


<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

<jsp:include page="header_member.jsp" />
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<section>
						<div class='text-center'>
							<div class="container" style="text-align: center">
								<h1>參與活動清單</h1>
							</div>
							
					</section>
					<hr
						style="height: 1px; border: none; color: #333; background-color: #333;">

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

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

			<!-- Logout Modal-->
			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Ready to
								Leave?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are
							ready to end your current session.</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" href="login.html">Logout</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Bootstrap core JavaScript-->
			<script
				src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
			<script
				src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- Core plugin JavaScript-->
			<script
				src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
			<!-- Custom scripts for all pages-->
			<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
			<!-- Page level plugins -->
			<script
				src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
			<!-- Page level custom scripts -->
			<script
				src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
			<script
				src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>
</body>

</html>
