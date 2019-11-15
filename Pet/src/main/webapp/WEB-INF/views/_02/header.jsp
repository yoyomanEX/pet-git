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
							<a href="index.html"><img src="img/Logo.png" alt="" title="" /></a>
						</div>
					</div>
					<div class="col-8 col-md-8 col-xl-6 ">
						<div class="sub_header_social_icon float-right">
							<a href="#"><i class="flaticon-phone"></i>02</a>
							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">Longin</a>
							<a href="friendlist" class="btn_1 d-none d-md-inline-block">account</a>
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
									<li class="nav-item active"><a class="nav-link active" href="<spring:url value='/'/>">Home</a></li>
									<li class="nav-item"><a href="travel.jsp" class="nav-link">𨑨迌
											食飯</a></li>
									<li class="nav-item"><a href="#" class="nav-link">交朋友</a>
									</li>
									<li class="nav-item">
									<a href="<spring:url value='/06/petProductSale'/>" class="nav-link">PET陪你購物</a>
									</li>
									<li>
									<a href="<spring:url value='/blogIndex'/>" class="nav-link">blog</a>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> PET PET 醫療站 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="hospital.jsp">醫院資訊</a> <a
												class="dropdown-item" href="question.jsp">PET PET Q&A</a>
										</div></li>
									<li class="nav-item"><a href="contact.html"
										class="nav-link">Contact</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>