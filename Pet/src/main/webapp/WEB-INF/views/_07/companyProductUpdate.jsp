<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head><script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>pET ʕ•ᴥ•ʔ廠商後台管理你廠商後台管理</title>
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


<!-- 前端輸入驗證 -->
<script>
document.addEventListener("DOMContentLoaded",
		function(){
		document.getElementById("product_name").addEventListener("blur",checkProductName);
		document.getElementById("price").addEventListener("blur",checkProductPrice);
		document.getElementById("amount").addEventListener("blur",checkProductAmount);
	});
	function checkProductName() {
		var theName = document.getElementById("product_name").value;
		var theNameLen = theName.length;
		var flag1 = false,flag2 = false;
		
		if(theNameLen==""){
			document.getElementById("pName").innerHTML = "<img src='img/error.png'> 不可空白";
		}else {
			document.getElementById("pName").innerHTML = "<img src='img/correct.png'>已輸入商品名稱";
		}
		
	}
	function checkProductPrice() {
		let thePrice= document.getElementById("price").value;
		let thePriceLen = thePrice.length;
		let flag1 = false, flag2 = false;

		if (thePriceLen == "") {
			document.getElementById("pPrice").innerHTML = "<img src='img/error.png'>不可空白";
		} 
		else if (thePriceLen > 1) {
			for (let i = 0; i < thePriceLen; i++) {
				let PriceChr = thePrice.charAt(i);
					if (PriceChr >= 0 && PriceChr <= 9) {
						flag1 = true;
					}else {
						flag2 = false;
					}

				if (flag1 == true && flag2 == false) {
					document.getElementById("pPrice").innerHTML = "<img src='img/correct.png'>已輸入價格";
				} else
					document.getElementById("pPrice").innerHTML = "<img src='img/error.png'>金額錯誤,請重新輸入";
				}
			}
			else {
			document.getElementById("pPrice").innerHTML = "<img src='img/error.png'>金額錯誤，請重新輸入";
		}

	}
	function checkProductAmount() {
		let theAmount= document.getElementById("amount").value;
		let theAmountLen = theAmount.length;
		let flag1 = false,flag2 = false;
		
		
		if(theAmountLen ==""){
			document.getElementById("pAmount").innerHTML = "<img src='img/error.png'>不可空白";
		}
		else if (theAmountLen >= 1) {
			for (let i = 0; i < theAmountLen; i++) {
				let AmountChr = theAmount.charAt(i);
					if (AmountChr >=1 && AmountChr <= 9) {
							flag1 = true;
					}else {
						flag2 = false;
					}

				if (flag1 == true && flag2 == false) {
					document.getElementById("pAmount").innerHTML = "<img src='img/correct.png'>已輸入數量";
				} else
					document.getElementById("pAmount").innerHTML = "<img src='img/error.png'> 數量錯誤,請重新輸入";
				}
			}
			else {
			document.getElementById("pAmount").innerHTML = "<img src='img/error.png'> 數量錯誤，請重新輸入";
		}
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
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="companyManagementIndex">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class=""></i>
				</div>
				<div class="sidebar-brand-text mx-3">
				pET ʕ•ᴥ•ʔ<br> 廠商後台管理
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
			<!-- Nav Item - 統計報表 -->
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

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

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
                 <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		  修改資料
                </a>
                
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              		  登出
                </a>
              </div>
            </li>
	
          </ul>
          </nav>
          </div>
          
<!--           內文 -->
    	 <!-- Page Heading -->
    	 <div class="container-fluid">
          <h1 class="h3 mb-2 text-gray-800">修改商品</h1>
          <p class="mb-4"><a>MODIFY PRODUCT</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">           
            <div class="card-header py-3">	 
              <form method="post" action="ProductQueryAll" id="allProduct">
              <h6  class="m-0 font-weight-bold text-primary" > 
           		<a onclick='allProduct();' href='#'>
           		返回商品列表
           		<input  type="hidden" value='${CompanyLoginOK.company_id}'  name='company_id' id="company_id" >
           		</a>          
               </h6>
               </form>
            </div>
    	
    	
    	
    	
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class=""></div>
          <div class="col-lg-7">
            <div class="p-5">
              
<%--              <jsp:useBean id="product_id" scope="application" class="com.web.model._07.CompanyProductBean"/> --%>
              <form class="user" id='updatePro' method="post" action="${pageContext.request.contextPath}/companyProductUpdate2" enctype="multipart/form-data">
                  <input  type="hidden" value='${CompanyLoginOK.company_id}'  name='company_id' id="company_id" >
                  
                  <div class="col-sm-6 mb-3 mb-sm-0">
                   <span>商品編號</span> <input  type="text" value="${product_id.product_id}" class="form-control form-control-user" name='product_id' id="product_id" readonly="readonly">
                  </div>
                  <br>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                   <span>商品名稱</span> <input  type="text" value="${product_id.product_name}" class="form-control form-control-user" name='product_name' id="product_name" placeholder="PRODUCT NAME">
                  <span style='float: right;' id='pName'></span>
                  </div>
                  <br>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <span>售價</span><input type="text" value="${product_id.price}" class="form-control form-control-user" name="price" id="price" placeholder="PRICE">
                    <span style='float: right;' id='pPrice'></span>
                </div>
                 <br>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <span>數量</span><input type="text" value="${product_id.amount}" class="form-control form-control-user" name="amount" id="amount" placeholder="AMOUNT">
                 <span style='float: right;' id='pAmount'></span>
                </div>
                	 <br>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  <label class="t1">適用寵物類別</label>
               							 <select name="category">
               							 <c:choose>
               							 <c:when test="${product_id.category==1}">
               							    <option value="1" selected>狗</option>
                   						    <option value="2">貓</option>
                   						    <option value="3">其他</option>
                						</c:when>
                						<c:when test="${product_id.category==2}">
               							    <option value="1">狗</option>
                   						    <option value="2" selected>貓</option>
                   						    <option value="3">其他</option>
                						</c:when>
                						<c:when test="${product_id.category==3}">
               							    <option value="1" >狗</option>
                   						    <option value="2" >貓</option>
                   						    <option value="3" selected>其他</option>
                						</c:when>
                						
                						</c:choose>
                						</select>
                  
                  
<!--                     <label class="t1">適用寵物類別</label> -->
<!--                							 <select name="category"> -->
<%--                							 <c:choose> --%>
<%--                							 <c:when test="${product_id.category==1}"> --%>
<!--                							  <option value="1" selected>狗</option> -->
<!--                    						  <option value="2">貓</option> -->
<!--                     					  <option value="3">其他</option> -->
<%--                 						</c:when> --%>
<%--                 						 <c:when test="${product_id.category==2}"> --%>
<!--                							  <option value="1">狗</option> -->
<!--                    						  <option value="2"selected>貓</option> -->
<!--                     					  <option value="3">其他</option> -->
<%--                 						</c:when> --%>
<%--                 						 <c:when test="${product_id.category==3}"> --%>
<!--                							  <option value="1">狗</option> -->
<!--                    						  <option value="2">貓</option> -->
<!--                     					  <option value="3" selected>其他</option> -->
<%--                 						</c:when> --%>
<%--                 						</c:choose> --%>
<!--                 						</select> -->
                </div>
                 <br>
                 
                 
                 <form action="/somewhere/to/upload" enctype="multipart/form-data">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <span>商品圖片：</span><input type="file" id="file" name='file' accept="image/gif, image/jpeg, image/png">
                </div>
                </form>
                <br>
                <div>
                    <span>選擇圖片：</span>
                	<td><img id='exImg' class="img1"src="${pageContext.request.contextPath}/downloadFile/${product_id.product_id}.jpg">
                </div>
                   <br>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <span>商品描述</span>
                   <textarea rows="10" cols="50" name="describe" id="describe">${product_id.describe}</textarea>
                </div>
				<input type="hidden" name="status" value="1" id="status">
                <br>
                <a class="btn btn-primary btn-user btn-block" onclick='updatePro();' style='color:white;'>送出 </a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

            <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; PET陪你寵物網  2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->
    <!-- End of Content Wrapper -->

  <!-- End of Page Wrapper -->

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

<!-- 新增商品送出submit -->
<script>
	function updatePro() {
		$('#updatePro').submit();
	}
	function allProduct() {
		$('#allProduct').submit();
	}
	
	 $("#file").change(function(){
	      //當檔案改變後，做一些事 
	     readURL(this);   // this代表<input id="imgInp">
	   });
	 function readURL(input){
		  if(input.files && input.files[0]){
		    var reader = new FileReader();
		    reader.onload = function (e) {
		       $("#exImg").attr('src', e.target.result);
		    }
		    reader.readAsDataURL(input.files[0]);
		  }
		}

</script>		
				
	
	
	
	
	
</body>
</html>