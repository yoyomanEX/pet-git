<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>pET ʕ•ᴥ•ʔ廠商後台管理</title>
<link rel="icon" href="img/about_icon.png">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<style>
.img1 {
	width: 150px;
	height: 150px;
}
</style>
<!-- 判斷日期格式 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  var jq1=$.noConflict();
  jq1( function() {
    var dateFormat = "yy-mm-dd",
      from = jq1( "#from" )
        .datepicker({
          dateFormat: 'yy-mm-dd',
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = jq1( "#to" ).datepicker({
     	dateFormat: 'yy-mm-dd',
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = jq1.datepicker.parseDate(dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
</script>


<!-- 報表查詢(依日期) -->
<script type="text/javascript">

jq1(document).ready(function(){
	var company_id =jq1("#company_id").val();
	jq1(".clickmeC").click(function() {
		jq1.ajax({
			url:"queryOrderByStatus.xls",
			data:{
				key1:jq1("#from").val(),
				key2:jq1("#to").val(),
				key3:company_id,
				key4:jq1("#status1").val()
			},
// 			dataType: "text",
			type:"post",
			success:function (data){
 		//		alert(data);
 				processedOrder(data);
			}
		});
	});
});
function processedOrder(data) {
	 	
		var unprocess=JSON.parse(data);
		var txt ="<tr><th>訂單日期</th><th>訂單編號</th><th>訂購人</th><th>收貨人</th><th>地址</th><th>總金額</th><th>出貨日期</th>";
		for(i=0;i<unprocess.length;i++){
			var order_date = "";
			if(unprocess[i].order_date != '' && typeof unprocess[i].order_date != 'undefined'){
				var v1 = new Date(unprocess[i].order_date);
				order_date = v1.getFullYear()+"-"+(v1.getMonth()+1)+"-"+addZero(v1.getDate(),2)+" "+addZero(v1.getHours(),2)+":"+addZero(v1.getMinutes(),2)+":"+addZero(v1.getSeconds(),2);
			}
			
			var ship_date = "";
			if(unprocess[i].ship_date){
				var v1 = new Date(unprocess[i].ship_date);
				ship_date = v1.getFullYear()+"-"+(v1.getMonth()+1)+"-"+addZero(v1.getDate(),2)+" "+addZero(v1.getHours(),2)+":"+addZero(v1.getMinutes(),2)+":"+addZero(v1.getSeconds(),2);
			}
			txt +="<tr style='background-color:#F0F0F0;' id='title"+i+"'><td>"+ order_date;
			txt +="<td>"+unprocess[i].order_id;
			txt +="<td>"+unprocess[i].member_id;
			txt +="<td>"+unprocess[i].recipient;
			txt +="<td>"+unprocess[i].address;
			txt +="<td>"+unprocess[i].total;
			txt +="<td>"+ship_date+"<a style='padding-left: 100px;' href='#' onclick='queryDetail(" +i+ ")'>訂單明細<input type='hidden' id='order_id"+i+"' value=\""+unprocess[i].order_id+"\"><img src='img/arrowdown.png'></a>";
			txt +="<tr>";
		}
		document.getElementById("dataTable").innerHTML=txt;
	}
	
function addZero(p,n) {
	 var s = p.toString();

	for(var i=0;i<s.length;i++){
		 if(s.length<n){
				s="0"+s;
			}else{
				return s;
			}
	}
	
}

</script>
<script>
	function queryDetail(p) {
		if(jq1(".title"+p).length>0){
			jq1(".title"+p).remove();
		}
		else{
		jq1.ajax({
			url:"queryDetail",
			data:{
				key1:jq1("#order_id"+p).val(),
			},
			type:"post",
			success:function (data){
// 				alert(data);
 				showDetail(data,p);
			}
		});
		}
	}
// 報表訂單明細
function showDetail(data,p) {
 	 	
		var empss=JSON.parse(data);
		var txt ="<tr class='title" + p + "'><th></th><th>產品編號</th><th>產品名稱</th><th>數量</th><th>金額</th>";
		for(i=0;i<empss.length;i++){
			txt += "<tr class='title" + p + "'><td></td>";
			txt += "<td>"+empss[i].product_id+"</td>";
			txt += "<td>"+empss[i].product_name+"</td>";
			txt += "<td>"+empss[i].amount+"</td>";
			txt += "<td>"+empss[i].total+"</td>";	
			txt += "<td></td></tr>"
			}
		$("#title" + p).after(txt);
		}
</script>


<!-- Charts Circle start -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
    
    
    jq1(document).ready(function(){
		var company_id =jq1("#company_id").val();
		jq1(".clickmeC").click(function() {
			jq1.ajax({
    			url:"companyOrderAmount",
    			data:{
    				key1:jq1("#from").val(),
    				key2:jq1("#to").val(),
    				key3:company_id,
    			},
    			dataType: "json",
    			type:"post",
    			success:function (result){
    				console.log(result);
//     				alert(result)
    			google.charts.load("current", {packages:["corechart"]});
    			google.charts.setOnLoadCallback(function(){
    				drawChart(result)
    		
    		});
			}
		})
		});
		 function drawChart(result) {
		        var data =new  google.visualization.DataTable();
		       data.addColumn("string","product_name");
		       data.addColumn("number","總計數量");
		       var dataArray=[];
		       jq1.each(result,function(i,obj){
		    	   dataArray.push([obj.product_name,obj.amount]);
		       });
		        data.addRows(dataArray);
		        
		        var piechart_options = {
		          title: '銷售紀錄(圓餅圖)',
		          width:500,
		          height:500,
		          is3D: true,
		          chartArea:{left:60,top:60,width:'100%',height:'100%'}
		        };
		        var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
		         piechart.draw(data,piechart_options);
		         
		         var barchart_options ={
		        	title:'銷售紀錄(長條圖)',
		        	width:500,
		        	height:500,
		        	chartArea:{left:60,top:60,width:'60%',height:'60%'}
		         };
		         var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
				 barchart.draw(data, barchart_options);
		 }
		
		});

    </script>
<!-- Charts Circle end -->
<!-- Charts start -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<!-- jQuery切換視窗 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  jq1( function() {
	  jq1( "#tabs" ).tabs();
  } );
  </script>


</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="companyManagementIndex">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class=""></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					Petʕ•ᴥ•ʔ<br> 廠商後台系統
				</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<!-- 			<li class="nav-item"><a class="nav-link" href="index.html"> -->
			<!-- 					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span> -->
			<!-- 			</a></li> -->
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<!-- 			<div class="sidebar-heading">XXXXXXX</div> -->
			<!-- Nav Item - 前台頁面-->
			<li class="nav-item">
			<a href="<spring:url value='/'/>" class="nav-link collapsed"> 
				<span style='margin-left: 10px;' class='btn btn-danger'>pET寵物網</span></a>
			
			</li>
			
			<!-- Nav Item - 商品管理-->
			<li class="nav-item"><a class="nav-link collapsed"
				href="CompanyManagement" data-toggle="" data-target="#collapsePages"
				aria-controls="collapsePages"> <i class="fas fa-fw fa-table"></i>
					<span>商品管理</span>
			</a></li>
			<!-- Nav Item - 訂單紀錄 -->
			<li class="nav-item"><a class="nav-link"
				href="orderManagement"> <i style='width: 17px'
					class="fas fa-fw fa-chart-area"></i> <span>訂單管理</span></a></li>

			<!-- Nav Item - 統計報表 -->
			<li class="nav-item active"><a class="nav-link" href="companyOrderCharts"> <i
					class="fas fa-fw fa-chart-area"></i> <span>銷售報表</span></a></li>
			 <!-- Nav Item - Charts -->
     		 <li class="nav-item">
       		 	<a class="nav-link" href="companyContent">
       		   <i class="fas fa-fw fa-wrench"></i>
          	<span>聯絡我們</span></a>
    		  </li>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" name='product_name'
								class="form-control bg-light border-0 small"
								placeholder="Search for.." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">歡迎回來～${CompanyLoginOK.company_name}</span>
								<!--                 <img class="img-profile rounded-circle" src=""> -->
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">

								<div class="dropdown-divider"></div>
								 <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  				<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		 			 修改資料
                				</a>
								
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">銷售報表查詢</h1>
					<p class="mb-4">
						<a>ORDER CHARTS</a>.
					</p>
					
					<div class="card shadow mb-4">
						<div class="card-header py-3">
						
					   
					  <form id='orderReports' style='float: left;' action="${pageContext.request.contextPath}/companyOrderList1.xls">
					  <a> <label for="from">訂單起日</label>
					  <input type="text" id="from" name="startdate"> 
					  <input type="hidden" value='${CompanyLoginOK.company_id}' name='company_id' id='company_id'> 
					  <label for="to">~訂單迄日</label> 
					  <input type="text" id="to" name="enddate">
					  <input type="hidden" id='status1' value="3">
					</a>
					</form>
					<a style='padding-right: 100px;'>
						<button  class='clickmeC'>查詢</button>
					</a> 
					<a href='#' onclick='excelReport();' class='btn btn-success'>
					EXCEL下載
					</a>
					
					
				</div>
				<div id="tabs">
  			<ul>
    			<li><a href="#tabs-1">銷售報表</a></li>
    			<li><a href="#tabs-2">銷售圖表</a></li>
    			
  			</ul>
  			<div id="tabs-1">
    			
    		<div class="card shadow mb-4">
			<div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" scellspacing="0">
    			</table>
    		</div>
    		</div>
    		</div>
    			
  			</div>
  			<div id="tabs-2">
   				<table class='columns'>
				 	<tr>
				 		<td style='padding-right: 60px;'><div  id='piechart_div' style="border:1px solid #ccc;"></div></td>
		                
		                <td><div id='barchart_div' style="border:1px solid #ccc"></div></td>
					</tr>
				</table>
            </div>
           </div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; PET陪你寵物網 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">確定要登出嗎?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">您真的要離開 PET陪你寵物網 廠商管理系統嗎Q_Q</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/login.jsp">登出</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

	<script>
   		function excelReport(){
   			$('#orderReports').submit();
   		}
   </script>

</body>
</html>