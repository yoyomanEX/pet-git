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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">

<%-- <script src="${pageContext.request.contextPath}/js/jquery.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
	//     $(document).ready(function(){   //button的id不能相同，所以如果用迴圈增加刪除紐，只會有一個有反應
	// 		$("#button2").click(function(){
	// 			alert("删除成功");

	// 		});
	//     });
</script>

 <script>
  var jq1=$.noConflict();   //因為會跟套件衝突，所以所有$換成jq1
  jq1( function() {
    var dateFormat = "mm/dd/yy/",
      from = jq1( "#from" )
        .datepicker({
          dateFormat:"yy/mm/dd",
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1   //調要幾個日期選擇器
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = jq1( "#to" ).datepicker({
        defaultDate: "+1w",
        dateFormat:"yy/mm/dd",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  
  
  jq1(document).ready(function(){
		var article_no =jq1("#no").val();
		jq1("#clickmeS").click(function() {
			jq1.ajax({
  			url:"queryArticleByDate",
  			data:{
  				key1:jq1("#from").val(),
  				key2:jq1("#to").val(),
  				key3:article_no,
  			},
//   			dataType: "text",
  			type:"post",
  			success:function (data){
//   				alert(data);
  				unprocessedArticle(data);
  			}
  		});
		});
});
  
  function unprocessedArticle(data){
	  var unprocess=JSON.parse(data);
	  var txt ="<thead align='center'><tr style='font-family: 標楷體; font-size: 20px' align='center'><th >日期<th>標題<th>作者<th>編輯<th>刪除</tr></thead>";
// 	  var txt ="<tfoot align='center'><tr style='font-family: 標楷體; font-size: 20px' align='center'><th >日期<th>標題<th>作者<th>編輯<th>刪除</tr></tfoot>";
	  for(i=0;i<unprocess.length;i++){
		  txt +="<tr><td style='width: 15%'>"+unprocess[i].postTime;
		  txt +="<td style='width: 48%'><a href='<spring:url value='postblog?id="+unprocess[i].no+"' />' class='post-title'  style='color:#3C3C3C'>"+unprocess[i].title;
		  txt +="<td style='width: 10%' align='center'>"+unprocess[i].memberId;		  
		  txt +="<td style='width: 8%' align='center'><form action='${pageContext.request.contextPath}/editArticle' method='post'><input type='hidden' value='"+unprocess[i].no+"' id='no' name='no'><button class='far fa-edit btn btn-primary' type='submit'>&nbsp編輯</button></form>";
		  txt +="<td style='width: 8%' align='center'><form action='${pageContext.request.contextPath}/GetDeleteblog' method='post'><input type='hidden' value='"+unprocess[i].no+"' id='no' name='no'><button onclick='clickDelete()' name='Delete' class='btn btn-danger fa fa-trash-alt' aria-hidden='true' type='submit'></button></form>";
		  txt +="</tr>";
	  }
	  document.getElementById("dataTable").innerHTML=txt;
  }
  </script>



</head>



<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html"> <!--         <div class="sidebar-brand-icon rotate-n-15"> -->
				<!--           <i class="fas fa-laugh-wink"></i> --> <!--         </div> -->
				<div class="sidebar-brand-text mx-3">pET ʕ•ᴥ•ʔ 陪你</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i class="far fa-edit"></i> <span>文章後台</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">文章管理</h6>
						<a class="collapse-item" href="<spring:url value='/articlestyle'/>">
						<i class="fa fa-camera"></i>&nbsp&nbsp部落格樣式管理</a>
						<a class="collapse-item" href="<spring:url value='/article'/>">
						<i class="fa fa-paint-brush"></i>&nbsp&nbsp文章列表</a>
						<a class="collapse-item" href="<spring:url value='myblog'/>">
						<i class="fa fa-home"></i>&nbsp&nbsp我的部落格首頁</a>

					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>好友</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">好友清單</h6>
						<a class="collapse-item" href="friendlist">好友列表</a> <a
							class="collapse-item" href="application">申請列表</a> <a
							class="collapse-item" href="waiting">等候回覆</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseOne"
				aria-expanded="true" aria-controls="collapseOne"> <i
					class="fas fa-paw"></i> <span>寵物聊天室</span>
			</a>
				<div id="collapseOne" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
							<a href='#' class="collapse-item" onclick="room()"><i
							class="fas fa-dog"></i>汪汪聊天室</a>
							 <a class="collapse-item"
							href="catroom"><i class="fas fa-cat"></i> 喵喵聊天室</a> <a
							class="collapse-item" href="petroom"><i class="fas fa-hippo"></i>
							PET聊天室</a>
					</div>
				</div></li>
				
						<!-- Nav Item - Utilities Collapse Menu -->

			<li class="nav-item"><a class="nav-link collapsed" href="${pageContext.request.contextPath}/06/PetOrderAll"> <i

					class="fas fa-paw"></i> <span>會員訂單</span></a></li>


			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form action="${pageContext.request.contextPath}/findBySearch"
						method="post"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" name="title"
								class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">

								<button class="btn btn-primary" type="submit">
									<i class="fas fa-search fa-sm"></i>
								</button>

							</div>
						</div>
					</form>


					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"  style="font-size:20px">你好，${LoginOK.member_Id }</span>
								<img class="img-profile rounded-circle"
								src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<br>
					<h1 class="m-0 font-weight-bold text-primary">文章管理後台</h1>
					<br>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<label for="from" style="font-family: 標楷體; font-size: 25px">發文日期&nbsp從</label>
							<input type="text" id="from" name="from">
							<input type="hidden" value="${LoginOK.member_Id}" name='no' id='no'> 
							<label for="to" style="font-family: 標楷體; font-size: 25px">到</label> 
							<input type="text" id="to" name="to">
							<button id='clickmeS'>查詢</button>
							<div style="float:right">
							<a href="<spring:url value='addArticle'/>" class="far fa-file-alt btn btn-success"> 
							   <span class="glyphicon-info-sigh glyphicon" style="font-size:20px"></span>發表新文章
							</a>
							</div>
						</div>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead align="center">
											<tr>
												<th style="font-family: 標楷體; font-size: 20px">日期</th>
												<th style="font-family: 標楷體; font-size: 20px">標題</th>
												<th style="font-family: 標楷體; font-size: 20px">作者</th>
												<th style="font-family: 標楷體; font-size: 20px">編輯</th>
												<th style="font-family: 標楷體; font-size: 20px">刪除</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${arts }" var="art" varStatus="s">
												<tr>
													<td style="width: 15%" align="center">${fn:substring(art.postTime, 0 ,21)}</td>
													<td style="width: 48%">
													   <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title"  style="color:	#3C3C3C">${art.title}</a>
													</td>
													<td style="width: 10%" align="center">${art.memberId}</td>
													<td style="width: 8%" align="center">
														<form action="${pageContext.request.contextPath}/editArticle" method="post">
															<input type="hidden" value="${art.no}" id="no" name="no">
															<button class="far fa-edit btn btn-primary" type="submit" >&nbsp編輯</button>
														</form>
													</td>

													<td style="width: 8%" align="center">
														<form action="${pageContext.request.contextPath}/GetDeleteblog" method="post">
															<input type="hidden" value="${art.no}" id="no" name="no">
															<!--       <input type="submit" name="Delete" class="btn btn-danger" onclick="clickDelete()"  value="刪除" /> -->
															<button onclick="return confirm('請問確定要刪除嗎???刪除後無法回復') " name="Delete" class="btn btn-danger fa fa-trash-alt" aria-hidden="true" type="submit"></button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; PET陪你寵物網 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

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
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
