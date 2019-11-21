<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>pET ʕ•ᴥ•ʔ 陪你</title>
  <link rel="icon" href="img/about_icon.png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
  <link href="css/adminarticle.css" rel="stylesheet">
  <style>
  .city {display:none}
  </style>
  

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <script>
  function myonoffswitch(){
	  document.getElementById('id01');
	  
	  
  }
  
  function lick(){
	  alert("按我")
  }
  </script>

</head>


<body class="">
    <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="./index.html">
      <br>
       <h3 style="color:#B700FF;font-size:28px">pET◖⚆ᴥ⚆◗陪你</h3>
       <h2 style="color:#FF0059;font-weight: bold;"> 管理員後台</h2>
<%--         <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img" alt="..."> --%>
      </a>
      <hr class="my-3">
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/team-1-800x800.jpg
">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="${pageContext.request.contextPath}/views/profile.jsp" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
<!--             <div class="col-6 collapse-brand"> -->
<%--               <a href="${pageContext.request.contextPath}/index.jsp"> --%>
<%--                 <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png"> --%>
<!--               </a> -->
<!--             </div> -->
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-4 mb-3 d-md-none">
          <div class="input-group input-group-rounded input-group-merge">
            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <span class="fa fa-search"></span>
              </div>
            </div>
          </div>
        </form>
        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item  class=" active" ">
          <a class=" nav-link active " href=" ${pageContext.request.contextPath}/index.jsp"> <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/views/icons.jsp">
              <i class="ni ni-planet text-blue"></i> Icons
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/views/maps.jsp">
              <i class="ni ni-pin-3 text-orange"></i> Maps
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/views/profile.jsp">
              <i class="ni ni-single-02 text-yellow"></i> 出貨管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/views/tables.jsp">
              <i class="ni ni-bullet-list-67 text-red"></i> 商品管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/login.jsp">
              <i class="ni ni-key-25 text-info"></i> 廠商管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/adminarticle">
              <i class="ni ni-circle-08 text-pink"></i> 文章檢舉管理
            </a>
          </li>
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Documentation</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
              <i class="ni ni-spaceship"></i> Getting started
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
              <i class="ni ni-palette"></i> Foundation
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
              <i class="ni ni-ui-04"></i> Components
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="${pageContext.request.contextPath}/index.jsp"></a>
  
  
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/team-4-800x800.jpg">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#!" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    
<!--     改背景色 -->
    <div class="header bg-gradient-primary pb-5 pt-3 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
 
        </div>
      </div>
    </div>
    
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <br>
          <h1 class="m-0 font-weight-bold text-primary">檢舉管理後台</h1><br>
        
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
   
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr align="center" >
                      <th style="font-family:標楷體;font-size:20px">發文時間</th>
                      <th style="font-family:標楷體;font-size:20px">標題</th>
                      <th style="font-family:標楷體;font-size:20px">發文者</th>
                      <th style="font-family:標楷體;font-size:20px">檢舉狀態</th>
                      <th style="font-family:標楷體;font-size:20px">權限管理</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${arts }" var="art" varStatus="s" >
                    <tr>
                      <td style="width:10%;font-size:18px" align="center">${fn:substring(art.postTime, 0 ,10)}</td>
                      <td style="width:48%;font-size:18px">
                       <a href="<spring:url value='postblog?id=${art.no}' />" style="color:	#3C3C3C">${art.title}</a>
                      </td>
                      <td style="width:13%;font-size:15px" align="center">${art.memberId} </td>
                      <td> 
                           
								<c:choose>
									<c:when test="${art.report==true}">

										<button class="rebt btn btn-danger" id="reportno" name="reportno" value="${art.no}"  style="font-size: 20px">有檢舉</button>
										
									    
									</c:when>
									<c:otherwise>

										<input type="button" class="btn btn-info" id="${art.no}" style="font-size: 20px" value="無檢舉">
                                        
									</c:otherwise>
								</c:choose>
							
                      </td>
                      <td> 
<%--                         <form action="${pageContext.request.contextPath}/adminlockarticle" method="post"> --%>
                            
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${art.available==true}"> --%>
<%--                                         <input type="hidden" value="${art.no}" name="no"> --%>
<!-- 										<button type="submit" class="btn btn-info" id="lock" name="lock" value="lock" style="font-size: 20px">未封鎖</button> -->

<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%--                                         <input type="hidden" value="${art.no}" name="no"> --%>
<!-- 										<button type="submit" class="btn btn-danger" id="lock" name="lock" value="lock" style="font-size: 20px">已封鎖</button> -->

<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 					      </form> -->
					      
					      <form action="${pageContext.request.contextPath}/adminlockarticle" method="post">
                                  
                                    <input type="hidden" value="${art.no}" name="no">
                                 
                                 <c:choose>
                                    <c:when test="${art.available==true}">
                                        <button id="lock" name="lock" value="lock" style="font-size: 20px" class="far fa-smile-beam btn btn-info" aria-hidden="true" type="submit">&nbsp未封鎖</button>
                                   
                                    </c:when>
                                    <c:otherwise>
                                        <button id="lock" name="lock" value="lock" style="font-size: 20px" class="far fa-frown btn btn-danger" aria-hidden="true" type="submit">&nbsp已封鎖</button>
                                    </c:otherwise>
                                 </c:choose>
                                 

                                 
                                 
                             </form>
					      
					      
					      
                      </td>
                    </tr>
                  </c:forEach>   
                  </tbody>
                  <tfoot>
                    <tr align="center">
	                  <th style="font-family:標楷體;font-size:20px">發文時間</th>
                      <th style="font-family:標楷體;font-size:20px">標題</th>
                      <th style="font-family:標楷體;font-size:20px">發文者</th>
                      <th style="font-family:標楷體;font-size:20px">檢舉狀態</th>
                      <th style="font-family:標楷體;font-size:20px">權限管理</th>
				    </tr>
				 </tfoot>              
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->


  </div>
  <!-- End of Page Wrapper -->
  
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-blue"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
   <h2 style="font-family:標楷體;font-size:40px;padding:10px;color:white;" align="center">檢舉內容</h2>
  </header>

  <div class="w3-bar w3-border-bottom">
   <button class="tablink w3-bar-item w3-button"></button>
<!--    <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'time')">檢舉時間</button> -->
<!--    <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'content')">檢舉原因</button> -->
  </div>
  
             <table align="center">
                    <tr style="width:500px">
<!--                       <th style="font-family:標楷體;font-size:30px" align="center">檢舉時間</th> -->

                      <th style="font-family:標楷體;font-size:30px">檢舉人</th>
                      <th style="width:100px"></th>
                      <th style="width:100px"></th>
                      <th style="font-family:標楷體;font-size:30px">檢舉原因</th>
                    </tr>
                    <tr style="width:500px">
<!--                       <td id="retime" style="width:20%;font-family:標楷體;font-size:25px"></td> -->

                      <td id="remember" style="font-family:標楷體;font-size:25px"></td>
                      <td style="width:100px"></td>
                      <td style="width:100px"></td>
                      <td id="recontent" style="font-family:標楷體;font-size:25px"></td>
                    </tr>
              </table>




  
<!--   <div class="w3-container w3-light-grey w3-padding"> -->
<!--    <button class="w3-button w3-right w3-white w3-border" onclick="document.getElementById('id01').style.display='none'">Close</button> -->
<!--   </div> -->
  
 </div>
</div>

</div>


  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
        </div>
      </div>

  </div>
  <!--   Core   -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
  
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
  <script>
//   $("button").on("click",".reportBtn",function(){
// 	  var no10999 = $('#no10999').val;
// 	  console.log(no10999);
//   })

	  
	  $("button.rebt").click(function(){
		  console.log($(this).val());
		  var reno = $(this).val();
		  $.ajax({
			  url:"adminreport",
			  data:{reportno:reno},
		      success:function(data){
		    	  
			    document.getElementById('remember').innerHTML = data.memberId;
				document.getElementById('recontent').innerHTML = data.content;
		
		      }
		  })
		  document.getElementById('id01').style.display='block';
	  });
	  
	  

  </script>
</body>

</html>