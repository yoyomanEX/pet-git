<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<header class="header_area">
		<div class="sub_header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-4 col-md-4 col-xl-6">
						<div id="logo">
							<a href="index.html"><img
								src="${pageContext.request.contextPath}/img/Logo.png" alt=""
								title="" /></a>
						</div>
					</div>
					<div class="col-8 col-md-8 col-xl-6 ">
						<div class="sub_header_social_icon float-right">
							<a href="#"><i class="flaticon-phone"></i>+02 213 - 256 (365)</a>
							<a href="#" class="btn_1 d-none d-md-inline-block">Become a
								Volunteer</a>
						</div>
					</div>
				</div>
			</div>
		</div>
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
									<li class="nav-item active"><a class="nav-link"
										href="index.html">Home</a></li>
									<li class="nav-item"><a href="about.html"
										class="nav-link active">About</a></li>
									<li class="nav-item"><a href="services.html"
										class="nav-link">services</a></li>
									<li class="nav-item"><a href="gallery.html"
										class="nav-link">gallery</a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Pages </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="elements.html">Elements</a> <a
												class="dropdown-item" href="single-blog.html">Single
												blog</a>
										</div></li>
									<li class="nav-item">
<!--                                         <a href="blog.html" class="nav-link">blog</a> -->
										 <a href="<spring:url value='/blogIndex'/>" class="nav-link">blog</a>
									</li>
									<li class="nav-item"><a href="contact.html"
										class="nav-link">Contact</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

		<!-- Top Header Area -->
<!-- 		<div class="top-header" style="margin: 20px"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-12"> -->
<!-- 						<div -->
<!-- 							class="top-header-content d-flex align-items-center justify-content-between"> -->
<!-- 							Search Form -->
<!-- 							<div class="input-group"> -->
<!-- 								<input type="text" name="search" -->
<!-- 									class="form-control bg-light border-0 small" -->
<!-- 									placeholder="Search for..." aria-label="Search" -->
<!-- 									aria-describedby="basic-addon2"> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<button class="btn btn-primary" type="submit"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</header>