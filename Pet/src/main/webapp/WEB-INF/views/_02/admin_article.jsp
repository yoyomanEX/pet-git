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
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <!-- jQuery版本 -->
  <script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"></script>
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!--   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->  
  <link href="css/adminarticle.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <script>
  function myonoffswitch(){
	  document.getElementById('exampleModalCenter');  
  }
  </script>
  
  <style>
  .city {display:none}
  </style>

</head>


<body class="">
    
    <jsp:include page="header_admin.jsp" />
    
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
             <div class="card-header py-3">
				<div style="float:right">
					<a href="<spring:url value='blogXML'/>" class="far fa-file-alt btn btn-success" style="font-size:20px"> 
						 <span class="glyphicon-info-sigh glyphicon" style="font-size:20px"></span>備份資料(Excel)
					</a>
				</div>
			</div>
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

<%-- 										<button class="rebt btn btn-danger" id="reportno" name="reportno" value="${art.no}"  style="font-size: 20px">有檢舉</button> --%>
										<!-- Button trigger modal -->
                                        <button type="button" style="font-size: 20px" class="rebt btn btn-danger" id="reportno" name="reportno" value="${art.no}" data-toggle="modal" data-target="#exampleModalCenter">有檢舉</button>
									    
									</c:when>
									<c:otherwise>

										<input type="button" class="btn btn-info" id="${art.no}" style="font-size: 20px" value="無檢舉">
                                        
									</c:otherwise>
								</c:choose>
							
                      </td>
                      <td> 
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



<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#0080FF" align="center">
        <h5 style="font-family:標楷體;font-size:40px;padding:10px;color:white;" align="center" class="modal-title" id="exampleModalCenterTitle">檢舉內容</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <h5 style="font-family:標楷體;font-size:30px">檢舉人</h5>
          <p id="remember" style="font-family:標楷體;font-size:25px;color:#4F4F4F"></p>
      <hr>
          <h5 style="font-family:標楷體;font-size:30px">檢舉原因</h5>
          <p id="recontent" style="font-family:標楷體;font-size:25px;color:#4F4F4F"></p>
      </div>
    </div>
  </div>
</div>
 
<!-- <div id="id01" class="w3-modal"> -->
<!--  <div class="w3-modal-content w3-card-4 w3-animate-zoom"> -->
<!--   <header class="w3-container w3-blue">  -->
<!--    <span onclick="document.getElementById('id01').style.display='none'"  -->
<!--    class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span> -->
<!--    <h2 style="font-family:標楷體;font-size:40px;padding:10px;color:white;" align="center">檢舉內容</h2> -->
<!--   </header> -->

<!--   <div class="w3-bar w3-border-bottom"> -->
<!--    <button class="tablink w3-bar-item w3-button"></button> -->
<!--    <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'time')">檢舉時間</button> -->
<!--    <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'content')">檢舉原因</button> -->
<!--   </div> -->
  
<!--              <table align="center"> -->
<!--                     <tr style="width:500px"> -->
<!--                       <th style="font-family:標楷體;font-size:30px" align="center">檢舉時間</th> -->

<!--                       <th style="font-family:標楷體;font-size:30px">檢舉人</th> -->
<!--                       <th style="width:100px"></th> -->
<!--                       <th style="width:100px"></th> -->
<!--                       <th style="font-family:標楷體;font-size:30px">檢舉原因</th> -->
<!--                     </tr> -->
<!--                     <tr style="width:500px"> -->
<!--                       <td id="retime" style="width:20%;font-family:標楷體;font-size:25px"></td> -->

<!--                       <td id="remember" style="font-family:標楷體;font-size:25px"></td> -->
<!--                       <td style="width:100px"></td> -->
<!--                       <td style="width:100px"></td> -->
<!--                       <td id="recontent" style="font-family:標楷體;font-size:25px"></td> -->
<!--                     </tr> -->
<!--               </table> -->


<!--   <div class="w3-container w3-light-grey w3-padding"> -->
<!--    <button class="w3-button w3-right w3-white w3-border" onclick="document.getElementById('id01').style.display='none'">Close</button> -->
<!--   </div> -->
<!--  </div> -->
<!-- </div> -->



  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  
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