<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim
  </title>
  <!-- Favicon -->
  <link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
// var jq1=$.noConflict();

//待審核廠商列表
$(document).ready(function(){
	$('#reviewCompany').click(function() {
		$.ajax({
    			url:"reviewCompany",
    			success:function (data){
    				showCompany(data);
    			}
    		});
		});
    });
   function showCompany(data) {
			var c1=JSON.parse(data);
			var txt ="<th style='font-size: 15px;'>編號</th><th style='font-size: 15px;'>廠商統編</th><th style='font-size: 15px;'>廠商名稱</th><th style='font-size: 15px;'>Email</th><th style='font-size: 15px;'>地址</th><th style='font-size: 15px;'>連絡電話</th><th style='font-size: 15px;'>聯絡人</th><th style='font-size: 15px;'>接受申請</th><th style='font-size: 15px;'>拒絕申請</th>";
			for(i=0;i<c1.length;i++){
				txt +="<tr><td>"+c1[i].id+"</td>";
				txt +="<td>"+c1[i].company_id+"</td>";
				txt +="<td>"+c1[i].company_name+"</td>";
				txt +="<td>"+c1[i].company_email+"</td>";
				txt +="<td>"+c1[i].company_add+"</td>";
				txt +="<td>"+c1[i].company_tel+"</td>";
				txt +="<td>"+c1[i].contact_name+"</td>";
				txt +="<td><button onclick='accept(" +i+ ");'><input type='hidden' id='status1"+i+"' value='1'><input type='hidden' id='company_id1"+i+"' value=\""+c1[i].company_id+"\">接受</button></td>";
				txt +="<td><button onclick='reject(" +i+ ");'><input type='hidden' id='status2"+i+"' value='9'><input type='hidden' id='company_id2"+i+"' value=\""+c1[i].company_id+"\">拒絕</button></td></tr>";
			}
			document.getElementById("dataTable").innerHTML=txt;
		}
   
	//接受審核
	 function accept(p){
// 		 $(this).hide();	
		 if (confirm("是否通過審核呢？")) {
			$.ajax({
  			url:"acceptByCompanyId",
  			data:{
  				key1:$("#company_id1"+p).val(),
  				key2:$("#status1"+p).val()
  			},
  			type:"post",
  			success:function (){
  				$("#company_id1"+p).parent().parent().parent().hide();	
				
			}
  		});
		 }
	 };

	//拒絕申請
	 function reject(p){
// 		 $(this).hide();	
		 if (confirm("是否確定拒絕申請呢？")) {
			$.ajax({
  			url:"rejectByCompanyId",
  			data:{
  				key1:$("#company_id2"+p).val(),
  				key2:$("#status2"+p).val()
  			},
  			type:"post",
  			success:function (){
  				$("#company_id2"+p).parent().parent().parent().hide();	
				
			}
  		});
		 }
	 };
	 

   
//    上架廠商列表
   $(document).ready(function(){
		$('#onsaleCompany').click(function() {
			$.ajax({
	    			url:"adminCompanyList",
	    			success:function (data){
	    				showOnsaleCompany(data);
	    			}
	    		});
			});
	    });
	   function showOnsaleCompany(data) {
				var c1=JSON.parse(data);
				var txt ="<th style='font-size: 15px;'>編號</th><th style='font-size: 15px;'>廠商統編</th><th style='font-size: 15px;'>廠商名稱</th><th style='font-size: 15px;'>Email</th><th style='font-size: 15px;'>地址</th><th style='font-size: 15px;'>連絡電話</th><th style='font-size: 15px;'>聯絡人</th><th style='font-size: 15px;'>廠商下架</th>";
				for(i=0;i<c1.length;i++){
					txt +="<tr><td>"+c1[i].id+"</td>";
					txt +="<td>"+c1[i].company_id+"</td>";
					txt +="<td>"+c1[i].company_name+"</td>";
					txt +="<td>"+c1[i].company_email+"</td>";
					txt +="<td>"+c1[i].company_add+"</td>";
					txt +="<td>"+c1[i].company_tel+"</td>";
					txt +="<td>"+c1[i].contact_name+"</td>";
					txt +="<td><button onclick='nonsale(" +i+ ");'><input type='hidden' id='status1"+i+"' value='2'><input type='hidden' id='company_id1"+i+"' value=\""+c1[i].company_id+"\">廠商下架</button></td></tr>";
				}
				document.getElementById("dataTable").innerHTML=txt;
			}
	 //廠商狀態改下架
		 function nonsale(p){	
			 if (confirm("是否確定要下架廠商呢？")) {
				$.ajax({
	  			url:"obtainedByCompanyId",
	  			data:{
	  				key1:$("#company_id1"+p).val(),
	  				key2:$("#status1"+p).val()
	  			},
	  			type:"post",
	  			success:function (){
	  				$("#company_id1"+p).parent().parent().parent().hide();	
					
				}
	  		});
			 }
		 };

	   
//	   下架廠商列表
	   $(document).ready(function(){
			$('#obtainedCompany').click(function() {
				$.ajax({
		    			url:"obtainedCompany",
		    			success:function (data){
		    				showObtainedCompany(data);
		    			}
		    		});
				});
		    });
		   function showObtainedCompany(data) {
					var c1=JSON.parse(data);
					var txt ="<th>編號<th>廠商統編<th>廠商名稱<th>Email<th>地址<th>連絡電話<th>聯絡人<th>重新上架";

					var txt ="<th style='font-size: 15px;'>編號</th><th style='font-size: 15px;'>廠商統編</th><th style='font-size: 15px;'>廠商名稱</th><th style='font-size: 15px;'>Email</th><th style='font-size: 15px;'>地址</th><th style='font-size: 15px;'>連絡電話</th><th style='font-size: 15px;'>聯絡人</th><th style='font-size: 15px;'>重新上架</th>";

					for(i=0;i<c1.length;i++){
						txt +="<tr><td>"+c1[i].id+"</td>";
						txt +="<td>"+c1[i].company_id+"</td>";
						txt +="<td>"+c1[i].company_name+"</td>";
						txt +="<td>"+c1[i].company_email+"</td>";
						txt +="<td>"+c1[i].company_add+"</td>";
						txt +="<td>"+c1[i].company_tel+"</td>";
						txt +="<td>"+c1[i].contact_name+"</td>";
						txt +="<td><button onclick='onsale(" +i+ ");'><input type='hidden' id='status1"+i+"' value='1'><input type='hidden' id='company_id1"+i+"' value=\""+c1[i].company_id+"\">重新上架</button></td></tr>";
					}
					document.getElementById("dataTable").innerHTML=txt;
				}
		
		 //廠商狀態重新上架
			 function onsale(p){	
				 if (confirm("是否確定要重新上架廠商呢？")) {
					$.ajax({
		  			url:"acceptByCompanyId1",
		  			data:{
		  				key1:$("#company_id1"+p).val(),
		  				key2:$("#status1"+p).val()
		  			},
		  			type:"post",
		  			success:function (){
		  				$("#company_id1"+p).parent().parent().parent().hide();	
						
					}
		  		});
				 }
			 };
//			   拒絕廠商列表
			   $(document).ready(function(){
					$('#rejectCompany').click(function() {
						$.ajax({
				    			url:"rejectCompany",
				    			success:function (data){
				    				showRejectCompany(data);
				    			}
				    		});
						});
				    });
				   function showRejectCompany(data) {
							var c1=JSON.parse(data);

<<<<<<< HEAD
							var txt ="<th>編號<th>廠商統編<th>廠商名稱<th>Email<th>地址<th>連絡電話<th>聯絡人<th>再次審核";

=======
>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
							var txt ="<th style='font-size: 15px;'>編號</th><th style='font-size: 15px;'>廠商統編</th><th style='font-size: 15px;'>廠商名稱</th><th style='font-size: 15px;'>Email</th><th style='font-size: 15px;'>地址</th><th style='font-size: 15px;'>連絡電話</th><th style='font-size: 15px;'>聯絡人</th><th style='font-size: 15px;'>再次審核</th>";
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
							for(i=0;i<c1.length;i++){
								txt +="<tr><td>"+c1[i].id+"</td>";
								txt +="<td>"+c1[i].company_id+"</td>";
								txt +="<td>"+c1[i].company_name+"</td>";
								txt +="<td>"+c1[i].company_email+"</td>";
								txt +="<td>"+c1[i].company_add+"</td>";
								txt +="<td>"+c1[i].company_tel+"</td>";
								txt +="<td>"+c1[i].contact_name+"</td>";
								txt +="<td><button onclick='onsale(" +i+ ");'><input type='hidden' id='status1"+i+"' value='1'><input type='hidden' id='company_id1"+i+"' value=\""+c1[i].company_id+"\">通過申請</button></td></tr>";
							}
							document.getElementById("dataTable").innerHTML=txt;
						}
				   //廠商狀態重新審核
					 function onsale(p){	
						 if (confirm("確定要通過申請嗎？")) {
							$.ajax({
				  			url:"acceptByCompanyId1",
				  			data:{
				  				key1:$("#company_id1"+p).val(),
				  				key2:$("#status1"+p).val()
				  			},
				  			type:"post",
				  			success:function (){
				  				$("#company_id1"+p).parent().parent().parent().hide();	
								
							}
				  		});
						 }
					 };
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
        <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
      </a>
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
            <div class="col-6 collapse-brand">
              <a href="${pageContext.request.contextPath}/index.jsp">
                <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png">
              </a>
            </div>
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
            <a class="nav-link " href="${pageContext.request.contextPath}/_06/shippingManagement">
              <i class="ni ni-single-02 text-yellow"></i> 出貨管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/_06/productList">
              <i class="ni ni-bullet-list-67 text-red"></i> 商品管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/adminCompanyManagement07">
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
<<<<<<< HEAD
      <div class="container-fluid">
=======
      <div class="container-fluid">

>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
        <!-- Brand -->
<<<<<<< HEAD
        <!-- Brand -->
=======

>>>>>>> branch 'master' of https://github.com/yoyomanEX/pet-git.git
        <a style='font-size: 30px;' class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="${pageContext.request.contextPath}/index.jsp">廠商管理</a>
        <p>COMPANY MANAGEMENT</p>
        <!-- Form -->
        <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
          </div>
        </form>
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
    <!-- Header -->
    <div class="header bg-gradient-primary pb-3 pt-3 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">COMPANY</h5>
                      <span class="h2 font-weight-bold mb-0">
                      <a id='reviewCompany' href='#'>待審核廠商</a>
                      
                      </span>
                    </div>
                    <div class="col-auto">
                     
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">ONSALE COMPANY</h5>
                      <span class="h2 font-weight-bold mb-0">
                      	<a id='onsaleCompany' href='#'>上架廠商</a></span>
                    </div>
                    <div class="col-auto">
                     
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">NONSALE COMPANY</h5>
                      <span class="h2 font-weight-bold mb-0">
                      	<a id='obtainedCompany' href='#'>下架廠商</a></span>
                    </div>
                    <div class="col-auto">
                      
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">REJECT COMPANY</h5>
                      <span class="h2 font-weight-bold mb-0">
                      	<a id='rejectCompany' href='#'>未通過廠商</a></span>
                    </div>
                    <div class="col-auto">
                      
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    			
                <div style="width:400px;padding-left: 20px;margin: 10px;" class="input-group input-group-alternative">
              <div class="input-group-prepend">                
              </div>
               <a href='#'>
              <input class="form-control" placeholder="Search" type="text">
             <span class="input-group-text"><i class="fas fa-search"></i></span></a>
            </div>
         
               <!--     內文位置 -->
  		 <div class="card shadow mb-4">
			<div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" 
                id="dataTable" width="100%" scellspacing="0"></table>
								   
              </div>
            </div>
          </div>
		</div>
       
   
       
      
      <!-- Footer -->
<!--       <footer class="footer"> -->
<!--         <div class="row align-items-center justify-content-xl-between"> -->
<!--           <div class="col-xl-6"> -->
<!--             <div class="copyright text-center text-xl-left text-muted"> -->
<!--               &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-xl-6"> -->
<!--             <ul class="nav nav-footer justify-content-center justify-content-xl-end"> -->
<!--               <li class="nav-item"> -->
<!--                 <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a> -->
<!--               </li> -->
<!--               <li class="nav-item"> -->
<!--                 <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a> -->
<!--               </li> -->
<!--               <li class="nav-item"> -->
<!--                 <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a> -->
<!--               </li> -->
<!--               <li class="nav-item"> -->
<!--                 <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
<!--         </div> -->
<!--       </footer> -->
    </div>
  </div>
  <!--   Core   -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <!--   Optional JS   -->
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
</body>

</html>