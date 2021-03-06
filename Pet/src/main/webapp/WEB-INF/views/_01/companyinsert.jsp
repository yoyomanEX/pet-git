<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  

  <title>pET ʕ•ᴥ•ʔ廠商後台管理</title>

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
                <h1 class="h4 text-gray-900 mb-4">註冊廠商</h1>
              </div>
              <form:form modelAttribute="CompanyBean" action='_01.saveCompany' method='POST' class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path='company_id' class="form-control form-control-user" placeholder="帳號"/><span id="sp1"></span>
                  	<form:errors path="company_id" cssStyle="color: red;"/>
                  </div>
                  <div class="col-sm-6">
                  	<form:input path='company_name' class="form-control form-control-user" placeholder="暱稱"/>
                  	<form:errors path="company_name" cssStyle="color: red;"/>
                  </div>
                </div>
                <div class="form-group">
                   <form:input path='company_email' type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address"/>
                   <form:errors path="company_email" cssStyle="color: red;"/>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  	<form:input path='company_password' type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>
                    <form:errors path="company_password" cssStyle="color: red;"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input path='checkPassword' type="password" class="form-control form-control-user"  placeholder="Repeat Password"/>
                    <form:errors path="checkPassword" cssStyle="color: red;"/>
                  </div>
                </div>
                <div class="form-group">
                   <form:input path='company_add'  class="form-control form-control-user"  placeholder="住址"/>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path='contact_name' class="form-control form-control-user" placeholder="聯絡人"/>
                  </div>
                  <div class="col-sm-6">
                  	<form:input path='company_tel' class="form-control form-control-user" placeholder="電話"/>
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