<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>pET ʕ•ᴥ•ʔ 陪你</title>
    <link rel="icon" href="img/about_icon.png">
</head>
<body>
<!-- Single Blog Post -->
                        <div class="single-blog-post d-flex flex-wrap" id="petblog">
                            <!-- Thumbnail -->
                            <c:forEach items="${c4}" var="art" varStatus="s">
                            <c:choose>
                                <c:when test="${art.coverImage==null}">
                                <div class="post-thumbnail mb-50"></div>
                                </c:when>
                              <c:otherwise>
                                <div class="post-thumbnail mb-50">
                                    <img width='450' height='500' src='<c:url value="/getArtPicture/${art.no }"/>'/>
                                </div>
                              </c:otherwise>
                              </c:choose>
                            <!-- Content -->
                            <div class="post-content mb-50">
                                <p class="post-date">${fn:substring(art.postTime, 0 ,20)} / foody</p>                       
                                <div class="post-title">
                                    <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title">
                                        <h4>${art.title}</h4>
                                    </a>
                                </div>
                                <div class="post-meta">
                                    <a href="#"><span>by</span> ${art.memberId}</a>
                                    <a href="#"><i class="fa fa-thumbs-up"></i>&nbsp&nbsp${art.likeCount}</a>
                                </div>
                                <p class="post-excerpt">${fn:substring(art.content, 0 ,20)}</p>                         
                                <a href="<spring:url value='postblog?id=${art.no}' />" class="read-more-btn">Continue Reading  
                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                </a>
                            </div>
                             </c:forEach>
                            <!-- Post Curve Line -->
                            <img class="post-curve-line" src="img/core-img/post-curve-line.png" alt="">
                        </div>
</body>
</html>