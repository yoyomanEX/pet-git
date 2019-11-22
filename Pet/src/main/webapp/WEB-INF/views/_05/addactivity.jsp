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
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.15-rc1/jquery.twzipcode.js"></script>
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script>
	$(function() {
		$("#datepicker1").datepicker({
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
	$("#zipcode3").twzipcode({
"zipcodeIntoDistrict": true,
"css": ["city form-control", "town form-control"],
"countyName": "city", // 指定城市 select name
"districtName": "town" // 指定地區 select name
});
</script>
<style>
.city, .town{width: 100%;}
.f1{float:left;margin-left:5px;margin-right:5px;width:calc(5% - 10px)}
.f2{float:left;margin-left:5px;margin-right:5px;width:calc(10% - 10px)}
.f3{float:left;margin-left:5px;margin-right:5px;width:calc(15% - 10px)}
.f4{float:left;margin-left:5px;margin-right:5px;width:calc(20% - 10px)}
.f5{float:left;margin-left:5px;margin-right:5px;width:calc(25% - 10px)}
.f6{float:left;margin-left:5px;margin-right:5px;width:calc(30% - 10px)}
.f7{float:left;margin-left:5px;margin-right:5px;width:calc(35% - 10px)}
.f8{float:left;margin-left:5px;margin-right:5px;width:calc(40% - 10px)}
.f9{float:left;margin-left:5px;margin-right:5px;width:calc(45% - 10px)}
.f10{float:left;margin-left:5px;margin-right:5px;width:calc(50% - 10px)}
.f11{float:left;margin-left:5px;margin-right:5px;width:calc(55% - 10px)}
.f12{float:left;margin-left:5px;margin-right:5px;width:calc(60% - 10px)}
.f13{float:left;margin-left:5px;margin-right:5px;width:calc(65% - 10px)}
.f14{float:left;margin-left:5px;margin-right:5px;width:calc(70% - 10px)}
.f15{float:left;margin-left:5px;margin-right:5px;width:calc(75% - 10px)}
.f16{float:left;margin-left:5px;margin-right:5px;width:calc(80% - 10px)}
.f17{float:left;margin-left:5px;margin-right:5px;width:calc(85% - 10px)}
.f18{float:left;margin-left:5px;margin-right:5px;width:calc(90% - 10px)}
.f19{float:left;margin-left:5px;margin-right:5px;width:calc(95% - 10px)}
.f20{float:left;margin-left:5px;margin-right:5px;width:calc(100% - 10px)}
</style>
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
							<form:form modelAttribute="PetActivityBean" method='post'
								class="user" enctype="multipart/form-data">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:input path='activity_title'
											class="form-control form-control-user" placeholder="活動名稱"
											autocomplete="off" />
										<span id="sp1"></span>
									</div>
									<div class="col-sm-6">
										<form:textarea rows="8" cols="50" path='activity_content'
											class="form-control form-control-user" placeholder="活動內容"
											autocomplete="off" />
										<span id="sp1"></span>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6">
										<form:input path='number_limit'
											class="form-control form-control-user" placeholder="人數上限"
											autocomplete="off" />
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
											autocomplete="off" />
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<form:input path='end_date'
											class="form-control form-control-user" id="datepicker1"
											autocomplete="off" />
									</div>
<!-- 									<div class="col-sm-6"> -->
<%-- 										<form:input path='activity_add' --%>
<%-- 											class="form-control form-control-user" autocomplete="off" /> --%>
<!-- 									</div> -->
									<div id="zipcode3">
										<div class="f3" data-role="county"></div>
										<div class="f4" data-role="district"></div>
									</div>
									<form:input name="Address" type="text" path="activity_add"
										class="f13 address form-control" autocomplete="off"/>
										
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