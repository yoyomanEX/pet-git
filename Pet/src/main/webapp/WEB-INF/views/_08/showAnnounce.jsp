<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div style="height: 30px"></div>
	<section class="about_part section_padding">
	<div class="container">
		<div class="row">
			<c:forEach var='ann' items='${allAnnouncements}'>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<%-- 						<c:choose> --%>
						<%-- 						<c:when test="${announce_img==null }"> --%>
						<!-- 						123 -->
						<%-- 						</c:when> --%>
						<%-- 						<c:otherwise> --%>
						<img src="<c:url value='getAnnPicture/${ann.announce_id}' />" />
						<%-- 						</c:otherwise> --%>
						<%-- 						</c:choose> --%>
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${ann.announce_title}</b>
							</p>
							<p>${ann.announce_sub}</p>
							<p>
								<%-- 								<a href="<spring:url value='/announcement?id=${ann.announce_id}' />" --%>
								<!-- 									class="btn btn-primary"> <span -->
								<!-- 									class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
								<!-- 								</a> <a -->
								<%-- 									href="<spring:url value='/product.json?id=${ann.announce_id}' />" --%>
								<!-- 									class="btn btn-primary">  -->
								<!-- 								</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
	</section>

	