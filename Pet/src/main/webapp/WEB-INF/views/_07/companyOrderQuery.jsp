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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 判斷日期格式 -->
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
  
  
  jq1(document).ready(function(){
		var company_id =jq1("#company_id").val();
		jq1("#clickmeS").click(function() {
			jq1.ajax({
    			url:"queryOrderByStatus",
    			data:{
    				key1:jq1("#from").val(),
    				key2:jq1("#to").val(),
    				key3:company_id,
    				key4:jq1("#status1").val()
    			},
//     			dataType: "text",
    			type:"post",
    			success:function (data){
    				alert(data);
     				unprocessedOrder(data);
    			}
    		});
		});
  });
   function unprocessedOrder(data) {
  	 	
			var unprocess=JSON.parse(data);
			var txt ="<tr><th>訂單日期</th><th>訂單編號</th><th>訂購人</th><th>收貨人</th><th>地址</th><th>出貨日期</th>";
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
				txt +="<tr id='title"+i+"'><td>"+ order_date;
				txt +="<td><a onclick='queryDetail(" +i+ ")'><input type='hidden' id='order_id"+i+"' value=\""+unprocess[i].order_id+"\">"+unprocess[i].order_id+"</a>";
				txt +="<td>"+unprocess[i].member_id;
				txt +="<td>"+unprocess[i].recipient;
				txt +="<td>"+unprocess[i].address;
				txt +="<td>"+ship_date;
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
				alert(data);
 				showDetail(data,p);
			}
		});
		}
	}

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
					Pet陪你<br> 廠商後台系統
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
			<li class="nav-item active"><a class="nav-link"
				href="orderManagement"> <i style='width: 17px'
					class="fas fa-fw fa-chart-area"></i> <span>訂單管理</span></a></li>

			<!-- Nav Item - 統計報表 -->
			<li class="nav-item"><a class="nav-link" href="companyOrderCharts"> <i
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

					

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						

						

						

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
								 <a class="dropdown-item" href="_01.updataCompanyPage" >
                  				<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		  			修改資料
                				</a>
								<a class="dropdown-item" href="_01.getCompanyLogout" > <i
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
					<h1 class="h3 mb-2 text-gray-800">已出貨訂單</h1>
					<p class="mb-4">
						<a>ORDER QUERY</a>.
					</p>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<a> <label for="from">訂單起日</label> 
					<input type="text" id="from" name="startdate"> 
					<input type="hidden" value='${CompanyLoginOK.company_id}' name='company_id' id='company_id'> 
					<label for="to">~訂單迄日</label> 
					<input type="text" id="to" name="enddate">
					</a> 
					<a style='padding-right: 100px;'>
					<input type="hidden" id='status1' value='3'>
<!-- 					 <label for="" class="t1">商品狀態</label> -->
<!-- 					 <select  name='status' id='status1'> -->
<!-- 							<option value='1'>未處理</option> -->
<!-- 							<option value="2">已處理未出貨</option> -->
<!-- 							<option value="3">已處理已出貨</option> -->
<!-- 					</select> -->
						<button id='clickmeS'>查詢</button>
					</a> 
					<a href="orderManagement">返回訂單管理</a> 
						</div>
					<!-- DataTales Example -->

			<div class="card shadow mb-4">
			<div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" scellspacing="0">
									<thead>
										<tr>
											<th>訂購日期</th>
											<th>訂單編號</th>
											<th>會員ID</th>
											<th>收件人</th>
											<th>售價</th>
											<th>出貨日期</th>
										</tr>
									</thead>

									<tbody>  
										<c:forEach items="${queryOrder}" var="p1" varStatus="s">
									<tr>
									<td>${p1.order_date}
									<td>${p1.order_id}
									<td>${p1.member_id}
									<td>${p1.recipient}
									<td>${p1.total}
									<td>${p1.ship_date}
									
									<c:set var="count" value="${s.count}" />	
					
									</c:forEach>
										
	
									</tbody>
								</table>
								<h3 class="count1">共${count}筆商品資料</h3>    
              </div>
            </div>
          </div>
				</div>
				<!-- /.container-fluid -->

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
   		
   
   </script>

</body>
</html>
