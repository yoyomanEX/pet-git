<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
  <meta name="google-signin-client_id" content="應用編號">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta charset="utf-8">
  
  <title>pET ʕ•ᴥ•ʔ 陪你</title>

  
  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-warning">

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
                    <h1 class="h4 text-gray-900 mb-4">會員登入</h1>
                  </div>
                  <form:form modelAttribute="MemberBean" action='_01.loginMember' method='POST' class="user">
                    <div class="form-group">
                      <form:input path='member_Id'  class="form-control form-control-user" placeholder="Account"/>
                    </div>
                    <div class="form-group">
                      <form:input path='password' type="password" class="form-control form-control-user"  placeholder="Password"/>
                    </div>
                    <div class="form-group">
                      
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                     	 登入
                    </button>
                    <hr>
                    <div  data-onsuccess="onSignIn" class="btn btn-google btn-user btn-block">
                    	<i class="fab fa-google fa-fw"></i> Login with Google
                    </div>
                  </form:form>
                  <hr>
                  
                  <div class="text-center">
                    <a class="small" href="_01.saveMemberPage">註冊</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); 
  console.log('Name: ' + profile.getName());
  console.log('Given Name: ' + profile.getGivenName());
  console.log('Family Name: ' + profile.getFamilyName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); 
}
    
 $.get("https://script.google.com/macros/s/Your_Sheet_ID/exec", {
                "name": profile.getName(),
                "email": profile.getEmail(),
   });
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
</body>

</html>