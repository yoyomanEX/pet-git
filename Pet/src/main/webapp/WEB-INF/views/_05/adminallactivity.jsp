<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>pET ʕ•ᴥ•ʔ 陪你</title>
  <link rel="icon" href="img/about_icon.png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet"  />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet"/>


<!-- Custom styles for this template-->
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.15-rc1/jquery.twzipcode.js"></script>
<link href="css/sb-admin-2.min.css" rel="stylesheet">





</head>

<body class="">
  <jsp:include page="header_admin.jsp" />
    
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
             
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <br>
          <h1 class="m-0 font-weight-bold text-primary" style='font-size: 40px;'>活動資訊</h1><br>
			 <!--     內文位置 -->
  		<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				
    <!--::breadcrumb part start::-->

	<section class="container" style="padding-top:100px; margin-left: 100px;">
		<div class="row" >
			<c:forEach var='activity' items='${allactivity}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px;border-width:3px;border-style:dashed;border-color:#FFAC55;padding:5px;margin:10px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<div>
						<img width="250px" height="200px"
							src="<c:url value='/activitypicture/${activity.activity_id}' /> " />
							</div>
						<div class="caption">
							<p><b style='font-size: 20px;'>${activity.activity_title}</b></p>
							<p>${activity.end_date}</p>
<%-- 							<p>${activity.activity_content}</p> --%>
<%-- 							<p>人數：${activity.current_number}/${activity.number_limit}</p> --%>

							<p>
							
								<a href="<spring:url value='/adminactivity?activity_id=${activity.activity_id}' />"
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
				
			</div>
		</div>
	</div>
  		
  		
  		
  		
  		
  		
  		
  		
  		

	     
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->

  <!--   Core   -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>

</html>