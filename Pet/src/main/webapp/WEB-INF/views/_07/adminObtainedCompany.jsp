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
	<div>
		<section>
			<div>
				<div class="container" style="text-align: center">
					<h1>下架廠商列表</h1>
				</div>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: #333;">
		<section class="container">
			<div class="row">
				<table style="border: 1px solid black;">
					<tr style="border: 1px solid black;">
						<th>編號
						<th>廠商統一編號
						<th>廠商名稱
						<th>廠商電話
						<th>廠商地址
						<th>電子郵件
						<th>聯絡人
						<th>重新上架
				 <c:forEach items="${obtainedCompany}" var="p1"
								varStatus="s">
								<tr style="border: 1px solid black;">
									<td>${p1.id}
									<td>${p1.company_id}
									<td>${p1.company_name}
									<td>${p1.company_tel}
									<td>${p1.company_add}
									<td>${p1.company_email}
									<td>${p1.contact_name}
									<td><form method="post"
											action="${pageContext.request.contextPath}/acceptByCompanyId1">
											<input type="hidden" name="company_id" value="${p1.company_id}"> 
											<input type="hidden" value="${p1.status}" name="status">
											<input type="submit" value="上架" onclick="return confirm('廠商${p1.company_id}-${p1.company_name}，確定重新上架嗎?')"/>
										</form>
							</c:forEach>
				</table>
				<h3 class="count1">共${count}筆商品資料</h3>
			</div>
		</section>
	</div>
</body>
</html>
