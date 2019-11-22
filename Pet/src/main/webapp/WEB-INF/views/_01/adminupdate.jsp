<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  

  <title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">管理員修改</h1>
              </div>
              <form:form modelAttribute="AdminBean" action='_01.updataAdmin' method='POST' class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path='admin_Id' class="form-control form-control-user" placeholder="帳號" value="${AdminLoginOK.admin_Id }"/><span id="sp1"></span>
                  </div>
                  <div class="col-sm-6">
                  	<form:input path='name' class="form-control form-control-user" placeholder="暱稱" value="${AdminLoginOK.name }"/>
                    <form:errors path="name" cssStyle="color: red;"/>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  	<form:input path='password' type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>
                    <form:errors path="password" cssStyle="color: red;"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input path='checkPassword' type="password" class="form-control form-control-user"  placeholder="Repeat Password"/>
                  	<form:errors path="checkPassword" cssStyle="color: red;"/>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  	送出
               	</button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  

</body>

</html>