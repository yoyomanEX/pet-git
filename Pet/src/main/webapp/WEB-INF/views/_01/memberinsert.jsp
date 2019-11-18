
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}
</style>
  <meta charset="utf-8">
  

  <title>SB Admin 2 - Register</title>

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
                <h1 class="h4 text-gray-900 mb-4">註冊會員</h1>
              </div>
              <form:form modelAttribute="MemberBean" action='_01.saveMember' method='POST' class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path='member_Id' class="form-control form-control-user" placeholder="帳號"/><br>&nbsp;
                    <form:errors path="account" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                  	<form:input path='name' class="form-control form-control-user" placeholder="暱稱"/>
                  </div>
                </div>
                <div class="form-group">
                   <form:input path='email' type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address"/>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  	<form:input path='password' type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Register Account
               	</button>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                
              </form:form>
              
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  

</body>


</html>