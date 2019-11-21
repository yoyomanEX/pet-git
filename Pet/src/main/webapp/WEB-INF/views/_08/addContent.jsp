<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>Content</title>


</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增Content資料</h1>
		</div>
	</section>
	<hr>
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ContentBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='content_title'>
						標題 </label>
					<div class="col-lg-10">
						<form:input id="content_title" path="content_title" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='content_sub'>
						內容 </label>
					<div class="col-lg-10">
						<form:input id="content_sub" path="content_sub" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="contentImg">
						圖片 </label>
					<div class='col-lg-10'>
						<form:input id="contentImg" path="contentImg" type="file"
							class="form:input-large" />
					</div>
				</div>
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
