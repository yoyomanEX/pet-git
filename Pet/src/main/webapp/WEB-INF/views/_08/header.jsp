<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<header class="header_area">

	
	<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					
					<c:choose>
   						<c:when test="${empty LoginOK}">
   							<div class="sub_header_social_icon float-right" style="float:right">
							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">登入/註冊</a>
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
									</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/_01.updataMemberPage"> <i
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
					
					

				</nav>
				<!-- End of Topbar -->
	
<!-- 		<div class="sub_header"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row align-items-center"> -->
<!-- 					<div class="col-4 col-md-4 col-xl-6"> -->
<!-- 						<div id="logo"> -->
<!-- 							<a href="index.html"><img src="img/Logo.png" alt="" title="" /></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-8 col-md-8 col-xl-6 "> -->
<%-- 						<c:if test="${empty LoginOK}"> --%>
<!-- 							<div class="sub_header_social_icon float-right"> -->
<!-- 							<a href="#"><i class="flaticon-phone"></i>02</a> -->
<!-- 							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">Longin</a> -->
<!-- 							<a href="friendlist" class="btn_1 d-none d-md-inline-block">account</a> -->
<!-- 						</div> -->
<%-- 						</c:if> --%>
						
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="main_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="ti-menu"></i>
							</button>

							<div class="collapse navbar-collapse justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link active"
										href="<spring:url value='/'/>">Home</a></li>
									<li class="nav-item"><a
										href="<spring:url value='/_08/contents_Front'/>"
										class="nav-link">𨑨迌 食飯</a></li>
									<li class="nav-item"><a href="<spring:url value='/allactivity'/>" class="nav-link">寵物跑跳碰</a>
									</li>
									<li class="nav-item"><a
										href="<spring:url value='/06/petProductSale'/>"
										class="nav-link">PET陪你購物</a></li>
									<li><a href="<spring:url value='/blogIndex'/>"
										class="nav-link">PET-Blog</a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> PET PET 資訊欄 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="${pageContext.request.contextPath}/_08/hospitalsFront">醫院資訊</a> <a
												class="dropdown-item" href="${pageContext.request.contextPath}/_08/hotelsFront">旅館資訊</a> <a
												class="dropdown-item" href="${pageContext.request.contextPath}/_08/resFront">餐廳資訊</a>
										</div></li>
									<li class="nav-item"><a href="#" class="nav-link">PET
											PET Q&A</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header part end-->
