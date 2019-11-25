<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<footer class="footer-area">
	<div class="container">
		<div class="row">
			<div class="col-12">

			</div>
		</div>

	</div>
</footer>
<!-- ##### Footer Area Start ##### -->

<!-- footer part start-->
<footer class="footer_area padding_top">
	<div class="container">
		<div class="row justify-content-center ">
			<div class="col-lg-8 col-xl-6">
				<div class="subscribe_part_text text-center">
					<h2>Subscribe Newsletter</h2>
					<p>We strictly follow the State Board’s sanitary and
						disinfection guidelines.</p>
					<div class="subscribe_form">
						<form action="#" name="#">
							<div class="input-group align-items-center">
								<input type="email" class="form-control"
									placeholder="enter your email">
								<div class="subscribe_btn input-group-append">
									<div class="btn_1">free trail</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-between section_padding">
			<div
				class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
				<h4>Menu</h4>
				<ul>
					<li><a href="#">home</a></li>
					<li><a href="#">𨑨迌食飯</a></li>
					<li><a href="#">寵物跑跳碰</a></li>
					<li><a href="#">PET陪你購物</a></li>
					<li><a href="#">PET-Blog</a></li>
					<li><a href="#">PET PET 資訊欄</a></li>
					<li><a href="#">PET PET Q&A</a></li>
				</ul>
			</div>
			<div
				class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
				<h4>Company</h4>
				<ul>
					<li><a href="<spring:url value='/_01.loginCompanyPage'/>">Login</a></li>
					<li><a href="#">Application</a></li>
				</ul>
			</div>
			<div
				class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
				<h4>Policy</h4>
				<ul>
					<li><a href="#">Private Policy</a></li>
					<li><a href="#">Shiiping Policy</a></li>
					<li><a href="#">Return Policy</a></li>
				</ul>
			</div>
			<div
				class="col-xl-2 col-sm-6 col-md-3 mb-4 mb-xl-0 single-footer-widget">
				<h4>Member</h4>
				<ul>
					<li><a href="#">Member Centre</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Track My Package</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="copyright_text">
					<img src="${pageContext.request.contextPath}/img/about_icon.png" alt="#">
					<!-- 						<h3>pET ʕ•ᴥ•ʔ陪你</h3> -->
					<p class="footer-text">
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved by pET ʕ•ᴥ•ʔ 陪你
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- footer part end-->