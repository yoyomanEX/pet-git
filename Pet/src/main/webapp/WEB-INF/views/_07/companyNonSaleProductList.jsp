<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
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
	.img1{
	width: 150px;
	height: 150px;
	}	
</style>
</head>
<body>
	<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="companyManagementIndex">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class=""></i>
				</div>
				<div class="sidebar-brand-text mx-3">
				pET ʕ•ᴥ•ʔ<br>廠商後台管理
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
			<li class="nav-item active">
			<a class="nav-link collapsed" href="CompanyManagement"
				data-toggle="" data-target="#collapsePages"
				aria-controls="collapsePages"> 
				<i class="fas fa-fw fa-table"></i> 
				<span>商品管理</span>
			</a>
			</li>
			<!-- Nav Item - 訂單紀錄 -->
			 <li class="nav-item">
       		 	<a class="nav-link" href="orderManagement">
       		   <i style='width: 17px' class="fas fa-fw fa-chart-area"></i>
       		   
          	<span>訂單管理</span></a>
    		  </li>	
			<!-- Nav Item - Charts -->
     		 <li class="nav-item">
       		 	<a class="nav-link" href="companyOrderCharts">
       		   <i class="fas fa-fw fa-chart-area"></i>
          	<span>銷售報表</span></a>
    		  </li>
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
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

         
          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            
      
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">歡迎回來～${CompanyLoginOK.company_name}</span>
<!--                 <img class="img-profile rounded-circle" src=""> -->
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="_01.updataCompanyPage" >
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		  修改資料
                </a>
               
                <a class="dropdown-item" href="_01.getCompanyLogout" >
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		  登出
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">下架商品區</h1>
          <p class="mb-4"><a>NON SALE PRODUCT LIST</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            <form method="post" action='companyProductQueryAll' id='allProduct'>
              <h6 class="m-0 font-weight-bold text-primary" style="padding-left: 1200px;">
              	<a onclick="allProduct();" href="#">返回商品列表</a>
              <input  type="hidden" value='${CompanyLoginOK.company_id}'  name='company_id' id="company_id" >
              </h6>
             </form>
            </div>
            
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th style='width:11%;'>商品編號</th>
                      <th style='width:11%;'>商品圖片</th>
                      <th>商品名稱</th>
                      <th style='width:11%;'>售價</th>
                      <th style='width:11%;'>數量</th>
                      <th>商品描述</th>
                      <th style='width:11%;'>上架</th>
                    </tr>
                  </thead>
<!--                   <tfoot> -->
<!--                     <tr> -->
<!--                       <th>商品編號</th> -->
<!--                       <th>商品圖片</th> -->
<!--                       <th>商品名稱</th> -->
<!--                       <th>售價</th> -->
<!--                       <th>數量</th> -->
<!--                       <th>商品描述</th> -->
<!--                       <th>上架</th> -->
<!--                     </tr> -->
<!--                   </tfoot> -->
                  <tbody>
                    <c:forEach items="${nonSaleProduct}" var="p1" varStatus="s">
								<tr>
									<td>${p1.product_id}
									<input type="hidden" name="company_id" value='${CompanyLoginOK.company_id}'> 
									<td><img class="img1" alt=""
         								src="${pageContext.request.contextPath}/downloadFile/${p1.product_id}.jpg">
									<td>${p1.product_name}
									<td>${p1.price}
									<td>${p1.amount}
									<td>${p1.describe}
									<td><form method="get"
											action="${pageContext.request.contextPath}/onSaleProduct">
											<input type="hidden" name="product_id" value="${p1.product_id}">
											<input type="hidden" name="company_id" value="${CompanyLoginOK.company_id}">
											<input type="hidden" name="status" value="${p1.status}">
											<input type="submit" value="上架" onclick="return confirm('商品編號${p1.product_id}-${p1.product_name}，真的要重新上架嗎?')" />
										</form> <c:set var="count" value="${s.count}" />
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
            <span>Copyright &copy; PET陪你寵物網  2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
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
		function allProduct() {
			$('#allProduct').submit();
		}
	</script>
		
				
</body>
</html>
