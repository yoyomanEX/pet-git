<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Pet陪你】站方後台管理系統</title>
</head>
<body>
	<h1 style="text-align: center">Pet陪你～站方後台管理頁面</h1>
	<form method="post" action="${pageContext.request.contextPath}/checkAdminLogin">
		<fieldset class="fil1">
			<legend class="t2">請登入帳號密碼</legend>
			<div class="st1">
				<label class="t1">帳號:</label> <input type="text" name="id"
					placeholder="guest" id="id" size="20" autocomplete="off">
				<span id="idn"></span>
				<p class="p1">(1.不可空白)</p>
			</div>

			<div class="st1">
				<label class="t1">密碼:</label> <input type="password" name="password"
					placeholder="請輸入密碼" size="20" id="password" autocomplete="off">
				<span id="idsp"></span>
				<p class="p1">(1.不可空白，2.至少6個字且必須包含英文字母、數字、特殊字元[!@#$%^&*])</p>
			</div>
		</fieldset>

		<div class="st2">
			<input type="submit" value="送出"/>
			<!--onclick="checkName();checkPwd();checkDate()" -->
			<input type="reset" value="清除">

		</div>
	</form>
</body>
</html>