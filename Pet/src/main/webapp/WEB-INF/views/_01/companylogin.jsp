<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  
  <title>pET ʕ•ᴥ•ʔ廠商後台管理</title>

  
  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">廠商登入</h1>
                  </div>
                  <form:form modelAttribute="CompanyBean" action='_01.loginCompany' method='POST' class="user">
                    <div class="form-group">
                      <form:input path='company_id'  class="form-control form-control-user" placeholder="Account"/>
                    </div>
                    <div class="form-group">
                      <form:input path='company_password' type="password" class="form-control form-control-user"  placeholder="Password"/>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                      Login
                    </button>
                    
                  </form:form>
                  <hr>
                  
                  <div class="text-center">
                    <a class="small" href="_01.saveCompanyPage">註冊</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

</body>

</html>