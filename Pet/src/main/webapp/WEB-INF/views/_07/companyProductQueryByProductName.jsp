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
					<h1>查詢商品</h1>
				</div>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: #333;">
		<section class="container">
			<div class="row">
				<table style="border: 1px solid black;">
					<tr style="border: 1px solid black;">
						<th>商品編號<th>廠商編號<th>商品名稱<th>售價<th>數量
						<th>產品資訊<th>修改<th>刪除 
						<c:forEach items="${allProduct}" var="p1"
								varStatus="s">
								<tr style="border: 1px solid black;">
									<td>${p1.product_id}
									<td>${p1.company_id}
									<td>${p1.product_name}
									<td>${p1.price}
									<td>${p1.amount}
									<td>${p1.describe}
									<td><form method="post"
											action="${pageContext.request.contextPath}/companyProductUpdate1">
											<input type="hidden" name="product_id"
												value="${p1.product_id}"> <input type="submit"
												value="修改" />
										</form>
									<td><form method="get"
											action="${pageContext.request.contextPath}/companyProductDeleteByProductId">
											<input type="hidden" name="product_id"
												value="${p1.product_id}"> <input type="submit"
												value="刪除"
												onclick="return confirm('商品編號${p1.product_id}-${p1.product_name}，真的要刪除嗎?')" />
										</form> <c:set var="count" value="${s.count}" />
							</c:forEach>
				</table>
				<h3 class="count1">共${count}筆商品資料</h3>
			</div>
		</section>
	</div>
</body>
</html>
