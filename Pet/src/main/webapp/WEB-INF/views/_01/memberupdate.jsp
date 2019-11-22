<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

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
                <h1 class="h4 text-gray-900 mb-4">修改會員資料</h1>
              </div>
              <form:form modelAttribute="MemberBean" action='_01.updataMember' method='POST' class="user" enctype='multipart/form-data'>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path='member_Id' type="text" class="form-control form-control-user" value="${LoginOK.member_Id }" readonly="readonly"/><span id="sp1"></span>
                  </div>
                  <div class="col-sm-6">
                  	<form:input path='name' class="form-control form-control-user" placeholder="暱稱"  value="${LoginOK.name }"/>
                  	<form:errors path="name" cssStyle="color: red;"/>
                  </div>
                </div>
                <div class="form-group">
                   <form:input path='email' type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="email" value="${LoginOK.email }"/>
                	<form:errors path="email" cssStyle="color: red;"/>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  	<form:input path='password' type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="password" value="${LoginOK.password }"/>
                  	<form:errors path="password" cssStyle="color: red;"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input path='checkPassword' class="form-control form-control-user"  placeholder="Repeat Password"/>
                    <form:errors path="checkPassword" cssStyle="color: red;"/>                
                  </div>
                </div>
                <div class="form-group row">
                	<div class="col-sm-6 mb-3 mb-sm-0">
                    	<form:input path='tel'  class="form-control form-control-user"  placeholder="電話"  value="${LoginOK.tel }"/>
                    </div>
                </div>
                <div class="form-group">
                   <form:input path='address'  class="form-control form-control-user"  placeholder="住址" value="${LoginOK.address }"/>
                </div>
                <div>
                	<td>照片：<br>&nbsp;</td>
	   	  			<td>
	   	  	 			<form:input path="filImage" type='file' /><br>&nbsp;
	   	  			</td>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  	確定
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