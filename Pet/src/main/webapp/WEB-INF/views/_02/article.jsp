<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
<%-- <script src="${pageContext.request.contextPath}/js/jquery.js"></script> --%>
<!-- 日期選擇器 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	//     $(document).ready(function(){   //button的id不能相同，所以如果用迴圈增加刪除紐，只會有一個有反應
	// 		$("#button2").click(function(){
	// 			alert("删除成功");

	// 		});
	//     });
</script>

 <script>
  var jq1=$.noConflict();   //因為會跟套件衝突，所以所有$換成jq1
  jq1( function() {
    var dateFormat = "mm/dd/yy/",
      from = jq1( "#from" )
        .datepicker({
          dateFormat:"yy/mm/dd",
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1   //調要幾個日期選擇器
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = jq1( "#to" ).datepicker({
        defaultDate: "+1w",
        dateFormat:"yy/mm/dd",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  
  
  jq1(document).ready(function(){
		var article_no =jq1("#no").val();
		jq1("#clickmeS").click(function() {
			jq1.ajax({
  			url:"queryArticleByDate",
  			data:{
  				key1:jq1("#from").val(),
  				key2:jq1("#to").val(),
  				key3:article_no,
  			},
//   			dataType: "text",
  			type:"post",
  			success:function (data){
//   				alert(data);
  				unprocessedArticle(data);
  			}
  		});
		});
});
  
  function unprocessedArticle(data){
	  var unprocess=JSON.parse(data);
	  var txt ="<thead align='center'><tr style='font-family: 標楷體; font-size: 20px' align='center'><th >日期<th>標題<th>作者<th>編輯<th>刪除</tr></thead>";
// 	  var txt ="<tfoot align='center'><tr style='font-family: 標楷體; font-size: 20px' align='center'><th >日期<th>標題<th>作者<th>編輯<th>刪除</tr></tfoot>";
	  for(i=0;i<unprocess.length;i++){
		  txt +="<tr><td style='width: 15%'>"+unprocess[i].postTime;
		  txt +="<td style='width: 48%'><a href='<spring:url value='postblog?id="+unprocess[i].no+"' />' class='post-title'  style='color:#3C3C3C'>"+unprocess[i].title;
		  txt +="<td style='width: 10%' align='center'>"+unprocess[i].memberId;		  
		  txt +="<td style='width: 8%' align='center'><form action='${pageContext.request.contextPath}/editArticle' method='post'><input type='hidden' value='"+unprocess[i].no+"' id='no' name='no'><button class='far fa-edit btn btn-primary' type='submit'>&nbsp編輯</button></form>";
		  txt +="<td style='width: 8%' align='center'><form action='${pageContext.request.contextPath}/GetDeleteblog' method='post'><input type='hidden' value='"+unprocess[i].no+"' id='no' name='no'><button onclick='clickDelete()' name='Delete' class='btn btn-danger fa fa-trash-alt' aria-hidden='true' type='submit'></button></form>";
		  txt +="</tr>";
	  }
	  document.getElementById("dataTable").innerHTML=txt;
  }
  </script>

</head>

<body id="page-top">

	<jsp:include page="header_member.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<br>
					<h1 class="m-0 font-weight-bold text-primary">文章管理後台</h1>
					<br>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">

						<div class="card-header py-3">
							<label for="from" style="font-family: 標楷體; font-size: 25px">發文日期&nbsp從</label>
							<input type="text" id="from" name="from">
							<input type="hidden" value="${LoginOK.member_Id}" name='no' id='no'> 
							<label for="to" style="font-family: 標楷體; font-size: 25px">到</label> 
							<input type="text" id="to" name="to">
							<button id='clickmeS'>查詢</button>
							<div style="float:right">
							<a href="<spring:url value='addArticle'/>" class="far fa-file-alt btn btn-success"> 
							   <span class="glyphicon-info-sigh glyphicon" style="font-size:20px"></span>發表新文章
							</a>
							</div>
						</div>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead align="center">
											<tr>
												<th style="font-family: 標楷體; font-size: 20px">日期</th>
												<th style="font-family: 標楷體; font-size: 20px">標題</th>
												<th style="font-family: 標楷體; font-size: 20px">作者</th>
												<th style="font-family: 標楷體; font-size: 20px">編輯</th>
												<th style="font-family: 標楷體; font-size: 20px">刪除</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${arts }" var="art" varStatus="s">
												<tr>
													<td style="width: 15%" align="center">${fn:substring(art.postTime, 0 ,21)}</td>
													<td style="width: 48%">
													   <a href="<spring:url value='postblog?id=${art.no}' />" class="post-title"  style="color:	#3C3C3C">${art.title}</a>
													</td>
													<td style="width: 10%" align="center">${art.memberId}</td>
													<td style="width: 8%" align="center">
														<form action="${pageContext.request.contextPath}/editArticle" method="post">
															<input type="hidden" value="${art.no}" id="no" name="no">
															<button class="far fa-edit btn btn-primary" type="submit" >&nbsp編輯</button>
														</form>
													</td>

													<td style="width: 8%" align="center">
														<form action="${pageContext.request.contextPath}/GetDeleteblog" method="post">
															<input type="hidden" value="${art.no}" id="no" name="no">
															<!--       <input type="submit" name="Delete" class="btn btn-danger" onclick="clickDelete()"  value="刪除" /> -->
															<button onclick="return confirm('請問確定要刪除嗎???刪除後無法回復') " name="Delete" class="btn btn-danger fa fa-trash-alt" aria-hidden="true" type="submit"></button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
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

</body>

</html>
