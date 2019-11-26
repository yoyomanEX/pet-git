<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Page Wrapper -->

<script>
	function room() {
		window
				.open(
						'dogroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
	function catroom() {
		window
				.open(
						'catroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
	function petroom() {
		window
				.open(
						'petroom',
						'newwindow',
						'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
</script>
<script>
	$(document).ready(function() {
		$("#messagesDropdown").click(function() {
			$.ajax({
				url : "friendlist2",
				type : "post",
				success : function(data) {
					showfriends(data);
				}
			});
		});
	});
	var Stop;
	$(document).ready(function() {
		Stop=setInterval(cartnumber,5000)//預設5000毫秒自動重複執行cartnumber()函數
		})
		function cartnumber() {
			$.ajax({
				url : "notice",
				type : "post",
				success : function(data) {
					console.log("ok");
					if(data.length!=0){
						$(".fa-bell").addClass("text-warning");
					}
					showNotice(data);
				}
			});
		}
	function NoticeClick(){
		clearInterval(Stop);
		$("#dataTotal").removeClass("badge badge-danger badge-counter").html("");
		$(".fa-bell").removeClass("text-warning");
	}

	function showNotice(data) {
		document.getElementById("dataTotal").innerHTML = data.length
		
		var txt = "";
		for (i = 0; i < data.length; i++) {
			if(data[i].friendstatus!=null){
			txt += '<a class="dropdown-item d-flex align-items-center" href="waiting"><div class="dropdown-list-image mr-3">'
					+ '<img class="rounded-circle"'
					+'width="60" height="60" src="'
					+'getMbPicture/'+data[i].otherid+'">'
					+ '</div><div class="font-weight-bold"><div class="text-truncate">'
					+ data[i].otherid + '向您申請好友</div></div></a>';}
			if(data[i].messagestatus!=null){
			txt += '<a class="dropdown-item d-flex align-items-center" href="postblog?id='+data[i].articleid+'"><div class="dropdown-list-image mr-3">'
				+ '<img class="rounded-circle"'
				+'width="60" height="60" src="'
				+'getMbPicture/'+data[i].otherid+'">'
				+ '</div><div class="font-weight-bold"><div class="text-truncate">'
				+'您的文章'+data[i].articlebean.title+'有新留言</div></div></a>';		
		}}
		document.getElementById("test1").innerHTML = txt;
	}

	function showfriends(data) {
		var txt = "";
		for (i = 0; i < data.length; i++) {
<<<<<<< HEAD
			txt += '<a class="dropdown-item d-flex align-items-center" onclick="talk(\''+data[i].mid+ '\')" >'
=======
			txt += '<a class="dropdown-item d-flex align-items-center" onclick="talk(\''+data[i].mid+'\')" >'
>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
			+'<div class="dropdown-list-image mr-3">'
				+ '<img class="rounded-circle"'
				+'width="60" height="60" src="'
				+'getMbPicture/'+data[i].mid+'">'
				+ '</div><div class="font-weight-bold"><div class="text-truncate">'
				+ '向'+data[i].name + '道聲招呼，開始你們的聊天吧!</div></div></a>';
		document.getElementById("test2").innerHTML = txt;
	}}
	var id="";
	function talk(id){
		window
		.open(
				'onebyonechat?friendid='+id,
				'newwindow',
				'height=600,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
	}
</script>
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html"  style="font-size:20px"> <!--         <div class="sidebar-brand-icon rotate-n-15"> -->
				<!--           <i class="fas fa-laugh-wink"></i> --> <!--         </div> -->
				<div class="sidebar-brand-text mx-3">pETʕ•ᴥ•ʔ陪你</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a href="<spring:url value='/'/>" class="nav-link"> 
			 <i class="fas fa-fw fa-tachometer-alt"></i> <span>PET首頁</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo" > <i class="far fa-edit"></i> <span>文章後台</span>
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
				aria-expanded="true" aria-controls="collapseUtilities"> <i class="fa fa-child"></i><span>&nbsp&nbspPET好朋友</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">&nbsp&nbsp好友清單</h6>
						<a class="collapse-item" href="friendlist"><i class="fa fa-users"></i>&nbsp&nbsp好友列表</a> <a
							class="collapse-item" href="application"><i class="fa fa-user-plus"></i>&nbsp&nbsp申請列表</a> <a
							class="collapse-item" href="waiting"><i class="fab fa-android"></i>&nbsp&nbsp等候回覆</a>
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
							class="fas fa-dog"></i>&nbsp&nbsp汪汪聊天室</a> <a href='#' class="collapse-item"
							onclick="catroom()"><i class="fas fa-cat"></i>&nbsp&nbsp喵喵聊天室</a> <a
							href='#' class="collapse-item" onclick="petroom()"><i
							class="fas fa-hippo"></i>&nbsp&nbspPET聊天室</a>
					</div>
				</div></li>
				
				<li class="nav-item"><a class="nav-link"
			href="<spring:url value='/memberjoinactivity'/>"> <i
				class="fas fa-paw"></i> <span>查詢已參與活動</span></a></li>
				
						<!-- Nav Item - Utilities Collapse Menu -->

			<li class="nav-item"><a class="nav-link collapsed" href="${pageContext.request.contextPath}/06/PetOrderAll"> <i class="fas fa-bone"></i> <span>會員訂單</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

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
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown" onclick="NoticeClick()"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span id="dataTotal" class="badge badge-danger badge-counter"></span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<div id='test1'></div>
								<a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Message</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown" 
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"><i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages --> 
<!-- 							<span	class="badge badge-danger badge-counter">7</span> -->
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Freind Center</h6>
								<div id='test2'></div>
								<a class="dropdown-item text-center small text-gray-500"
									href="#">Show More Freinds</a>
							</div></li>


						<c:choose>
   						<c:when test="${empty LoginOK}">
   							<div class="sub_header_social_icon float-right">
							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">Longin</a>
							</div>
    					</c:when>
    
    					<c:otherwise>
    						<ul class="navbar-nav ml-auto">

							<div class="topbar-divider d-none d-sm-block"></div>

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow"><a
								class="nav-link dropdown-toggle" href="#" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span
									class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:20px">你好，${LoginOK.name }</span>
									<img class="img-profile rounded-circle" width='60' height='60' src='${pageContext.request.contextPath}/getPicture' />
							</a> <!-- Dropdown - User Information -->
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/_01.memberManagement"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 會員中心
									</a> <a class="dropdown-item" href="_01.updataMemberPage"> <i
										class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										修改會員
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/_01.getLogout" 
										> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div></li>

						</ul>
    					</c:otherwise>
					</c:choose>

					</ul>

				</nav>
				<!-- End of Topbar -->
				
		