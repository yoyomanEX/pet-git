<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>diaplayRes</title>
</head>
<body>
	<p>&nbsp;</p>
	<hr>
	<div class='center'>
		<table border='1' >
			<tr bgcolor='#ffcc66'>
				<th colspan='2'>醫&nbsp;院&nbsp;資&nbsp;料</th>
			</tr>
			<tr bgcolor='#ffcc66'>
				<td width='80'>id</td>
				<td class='b'>&nbsp;${hosBean.hospital_id}</td>
			</tr>
			
			<tr bgcolor='#ffcc66'>
				<td width='80'>name</td>
				<td class='b'>&nbsp;${hosBean.hospital_name}</td>
			</tr>
			<tr bgcolor='#ffcc66'>
				<td width='80'>address</td>
				<td width='200' class='b'>&nbsp;${hosBean.hospital_address}</td>
			</tr>
			<tr bgcolor='#ffcc66'>
				<td width='80'>tel</td>
				<td width='200' class='b'>&nbsp;${hosBean.hospital_tel}</td>
			</tr>
		</table>
		<p>
		<a href='${pageContext.request.contextPath}/_08/hospital'>回到醫院總覽</a>
	</div>
</body>
</html>