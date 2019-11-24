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


<script>
// 與套版衝突，須將$改為jq1才可使用jQuery套件 
var jq1=$.noConflict();
jq1(function() {
	jq1("#datepicker1").datepicker({
			showOtherMonths : true,
			hideIfNoPrevNext : true,
			minDate : "0d",
			maxDate : "+30d",
			dateFormat : "yy-mm-dd"
		});
	});
	// 	$(function() {
	// 		$("#datepicker2").datepicker({
	// 			showOtherMonths : true,
	// 			hideIfNoPrevNext : true,
	// 			minDate : "0d",
	// 			maxDate : "+30d",
	// 			dateFormat: "yy-mm-dd"
	// 		});
	// 	});

</script>


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
          <h1 class="m-0 font-weight-bold text-primary" style='font-size: 40px;'>活動創建</h1><br>
			 <!--     內文位置 -->
  		<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block "><img alt="" src="img/nicecat.jpg" width="100%" ></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
<!-- 								<h1 style="font-size:50px;margin-bottom:30px">活動創建</h1> -->
							</div>
							<form:form modelAttribute="PetActivityBean" method='post' class="user" enctype="multipart/form-data">
								<div class="form-group row">
								<p style="font-size:25px;">活動名稱</p>
									<form:input path='activity_title'
											class="form-control form-control-user" 
											autocomplete="off" />
									<span id="sp1"></span>	
								</div>
							    <p style="font-size:25px;">活動內容</p>
							    <div>
							    
									<form:input style="height:30px;resize:none;margin-bottom:20px;" path='activity_content'
											class="form-control form-control-user" 
											autocomplete="off" />
								    <span id="sp1"></span>	
								</div>
								
								<div class="form-group row">
								<p style="font-size:25px;">人數上限</p>
								
									<form:input path='number_limit'
											class="form-control form-control-user" 
											autocomplete="off" />	
								</div>
								<div>
								<form:hidden path="current_number" value="0"/>
								</div>
								<div class="form-group row">
								<p style="font-size:25px;">活動照片</p>
									<form:input path='aimage' type='file'
											class="form-control form-control-user" id="activityImage"
											autocomplete="off" style="height:50px" />	
								</div>
								
								<div class="form-group row">
								<p style="font-size:25px;">活動日期</p>
									<form:input path='end_date'
											class="form-control form-control-user" id="datepicker1"
											 autocomplete="off" />	
								</div>

								<div class="form-group row">
								<p style="font-size:25px;">活動地點</p>
									<form:input name="Address" type="text" path="activity_add"
										class="form-control form-control-user"  autocomplete="off"/>	
								</div>
								
<!-- 								<div id="zipcode3"> -->
<!-- 										<div class="f3" data-role="county"></div> -->
<!-- 										<div class="f4" data-role="district"></div> -->
<!-- 							    </div> -->
								
							
								<button type="submit" class="btn btn-primary btn-user btn-block">
									建立活動</button>
							</form:form>
							<hr>
						</div>
					</div>
				</div>
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