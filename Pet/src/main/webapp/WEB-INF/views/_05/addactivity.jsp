<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

<meta charset="utf-8">


<title>add activity</title>

<!-- Custom styles for this template-->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script>
	$(function() {
		$("#datepicker1").datepicker({
			showOtherMonths : true,
			hideIfNoPrevNext : true,
			minDate : "0d",
			maxDate : "+30d",
			dateFormat: "yy-mm-dd"
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			showOtherMonths : true,
			hideIfNoPrevNext : true,
			minDate : "0d",
			maxDate : "+30d",
			dateFormat: "yy-mm-dd"
		});
	});
</script>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form:form modelAttribute="PetActivityBean"
								method='post' class="user"
								enctype="multipart/form-data">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:input path='activity_title'
											class="form-control form-control-user" placeholder="活動名稱" 
											autocomplete="off"/>
										<span id="sp1"></span>
									</div>
									<div class="col-sm-6">
										<form:textarea rows="8" cols="50" path='activity_content'
											class="form-control form-control-user" placeholder="活動內容" 
											autocomplete="off"/>
										<span id="sp1"></span>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6">
										<form:input path='number_limit'
											class="form-control form-control-user" placeholder="人數上限" 
											autocomplete="off"/>
									</div>
									<div class="col-sm-6">
										<form:hidden path='current_number'
											class="form-control form-control-user" value="0" />
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6">
										<form:input path='aimage' type='file'
											class="form-control form-control-user" id="activityImage" 
											autocomplete="off"/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:input path='start_date'
											class="form-control form-control-user" id="datepicker1" 
											autocomplete="off"/>
									</div>
									<div class="col-sm-6">
										<form:input path='end_date'
											class="form-control form-control-user" id="datepicker2" 
											autocomplete="off"/>
									</div>
								</div>
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

</body>

</html>