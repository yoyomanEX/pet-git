<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<header>
			<div id="t1">
				<h1>Pet寵物網 廠商後台管理系統</h1>
			</div>
		</header>
		<div>
			<article>
				<form method="post" action="${pageContext.request.contextPath}/companyApplyFor2">
					<h2>申請
					
					合作廠商</h2>
					<table>
						<tr>
							<td>廠商統一編號:
							<td><input type="text" name="company_id" id="company_id" /> <span
								id="titlen"></span>
						<tr>
							<td>廠商名稱:
							<td><input type="text" name="company_name"
								 id="company_name" /> <span id="idn"></span>
						<tr>
							<td>廠商密碼:
							<td><input type="password" name="company_password"
								placeholder="ex.aB!123456" id="company_password" /> 
							<span id="idn"></span>
						<tr>
							<td>聯絡地址:
							<td><input type="text" name="company_add" 
							placeholder="請輸入完整公司地址" 	id="company_add" /> 
							<span id="idn"></span>
						<tr>
							<td>廠商電話:
							<td><input type="text" name="company_tel" 
							placeholder="ex.02-25121111"  id="company_tel" /> 
							<span id="idn"></span>
						<tr>
							<td>電子郵件:
							<td><input type="text" name="company_email" id="company_email" /> 
							<span id="pricen"></span>
						<tr>
							<td>聯絡人:
							<td><input type="text" name="contact_name" id="contact_name" /> 
							<span id="idn"></span>
						<tr>
							<td><input type="hidden" name="status" value="0" id="status" /> 
					</table>
					<div class="sub1">
						<input type="submit" value="送出" /> <input type="reset" value="清除" />
						<a href="/webapp/_07_product/productMaintain.html"></a>
					</div>
				</form>
			</article>
		</div>
	</div>
</body>
</html>