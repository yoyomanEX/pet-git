<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>pET ʕ•ᴥ•ʔ 陪你</title>
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
							
							var txt ="<th style='font-size: 15px;'>編號</th><th style='font-size: 15px;'>廠商統編</th><th style='font-size: 15px;'>廠商名稱</th><th style='font-size: 15px;'>Email</th><th style='font-size: 15px;'>地址</th><th style='font-size: 15px;'>連絡電話</th><th style='font-size: 15px;'>聯絡人</th><th style='font-size: 15px;'>再次審核</th>";

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
  <jsp:include page="header_admin.jsp" />
    
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
             
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <br>
          <h1 class="m-0 font-weight-bold text-primary">廠商管理</h1><br>
                       
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
           
          
               <span class="h2 font-weight-bold mb-0" style='float: left;padding-right: 20px;'>
                  <a class='btn btn-danger'   id='reviewCompany' href='#'>待審核廠商</a>
                </span>
               
               <span class="h2 font-weight-bold mb-0" style='float: left;padding-right: 20px;'>
                  <a class='btn btn-success' id='onsaleCompany' href='#'>上架廠商</a>
               </span>
           	   
           	    <span class="h2 font-weight-bold mb-0" style='float: left;padding-right: 20px;'>
                  <a class='btn btn-primary' id='obtainedCompany' href='#'>下架廠商</a>
                </span>
               
                 <span class="h2 font-weight-bold mb-0" style='float: left;padding-right: 20px;'>
                  <a class='btn btn-info' id='rejectCompany' href='#'>未通過廠商</a>
                 </span>
                 
              </div>
            </div>
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
        <!-- /.container-fluid -->
	     
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->





  <!-- Scroll to Top Button-->
  

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