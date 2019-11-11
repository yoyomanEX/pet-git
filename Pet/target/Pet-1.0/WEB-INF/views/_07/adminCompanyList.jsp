<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>廠商列表</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>廠商列表</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var="c1" items="${adminCompanyList}">
				<div class="col-sm-6 col-md-3" style="width: 340px; height: 300px">
					<div class="thumbnail" style="width: 380px; height: 280px">
						<div class="caption">
							<p>編號：${c1.id}</p>
							<p>
								<b style='font-size: 16px;'>廠商統一編號：${c1.company_id}</b>
							</p>
							<p>廠商名稱：${c1.company_name}</p>
							<p>廠商電話：${c1.company_tel}</p>
							<p>廠商Email: ${c1.company_email}</p>
							<p>廠商地址: ${c1.company_add}</p>
							<p>廠商聯絡人: ${c1.contact_name}</p>
							<p><form method="post"
											action="${pageContext.request.contextPath}/obtainedByCompanyId">
											<input type="hidden" name="company_id" value="${c1.company_id}"> 
											<input type="hidden" value="${c1.status}" name="status">
											<input type="submit" value="下架" onclick="return confirm('廠商${c1.company_id}-${c1.company_name}，確定要下架嗎?')"/>
							</form>
										
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
