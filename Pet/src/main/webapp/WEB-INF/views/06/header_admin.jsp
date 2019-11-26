<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
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
       <hr class="my-3">
<%--         <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img" alt="..."> --%>
      </a>
      <hr class="my-3">
 
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
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/_08/adminContent" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-planet text-blue"></i> 公告管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/savePetActivity" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-pin-3 text-orange"></i> 創立活動
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/_06/shippingManagement" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-single-02 text-yellow"></i> 出貨管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="${pageContext.request.contextPath}/_06/productList" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-bullet-list-67 text-red"></i> 商品管理
            </a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath}/adminCompanyManagement07" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-key-25 text-info"></i> 廠商管理
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/adminarticle" style="color:black;font-family:標楷體;font-size:25px">
              <i class="ni ni-circle-08 text-pink"></i> 文章檢舉管理
            </a>
          </li>
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
      
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
                
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold" style="font-size:30px">你好，${AdminLoginOK.name }</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
<!--               <a class="dropdown-item" href="friendlist">  -->
<!--               <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 會員中心</a>  -->
			  <a class="dropdown-item" href="_01.updataAdminPage"> 
			  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>修改資料</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/_01.getAdminLogout"> 
              <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
              
            </div>
          </li>
        </ul>

      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    
<!--     改背景色 -->
    <div class="header bg-gradient-primary pb-5 pt-5 pt-md-5">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
 
        </div>
      </div>
    </div>