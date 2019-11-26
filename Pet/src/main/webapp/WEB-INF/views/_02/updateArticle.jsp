<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"> </script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function(){
	CKEDITOR.replace('editor',{
		 removePlugins: 'resize',
		 height:'300px',
		 filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
	     filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'
	});
});
</script>


  <title>pET ʕ•ᴥ•ʔ 陪你</title>
  <link rel="icon" href="img/about_icon.png">

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

 <jsp:include page="header_member.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          

          <form action="${pageContext.request.contextPath}/editArticle2" method="post" enctype="multipart/form-data">
   
          <div>
              <input id="articleImage" name="articleImage" type="file">
          <input type="hidden" style="margin-bottom:16px;font-size:15px;width:100%;border-radius:5px" name="no" id="no" value="${arts.no}">
          <input type="text" style="margin-top:20px;font-size:25px;width:100%;border-radius:5px" name="title" id="title" value="${arts.title}">
          <span id="titlesp"></span>
                <div style="margin-top:10px;margin-bottom:16px;font-size:25px;width:100%;border-radius:5px">

						<select style="width:100%;font-size:25px;width:100%;border-radius:5px;color:#4F4F4F" name="categories" id="categories" >     
                           <c:choose>
                           <c:when test="${arts.categories==1}">
                              <option value="1" selected>PET你&nbsp✿&nbsp寵物報報 </option>
                              <option value="2">PET你&nbsp✿&nbsp寵物美容保養 </option>
                              <option value="3">PET你&nbsp✿&nbsp寵物旅遊 </option>
                              <option value="4">PET你&nbsp✿&nbsp其他 </option>
                           </c:when>
                           <c:when test="${arts.categories==2}">
                              <option value="1">PET你&nbsp✿&nbsp寵物報報 </option>
                              <option value="2" selected>PET你&nbsp✿&nbsp寵物美容保養 </option>
                              <option value="3">PET你&nbsp✿&nbsp寵物旅遊 </option>
                              <option value="4">PET你&nbsp✿&nbsp其他 </option>
                           </c:when>
                           <c:when test="${arts.categories==3}">
                              <option value="1">PET你&nbsp✿&nbsp寵物報報 </option>
                              <option value="2">PET你&nbsp✿&nbsp寵物美容保養 </option>
                              <option value="3" selected>PET你&nbsp✿&nbsp寵物旅遊 </option>
                              <option value="4">PET你&nbsp✿&nbsp其他 </option>
                           </c:when>
                           <c:when test="${arts.categories==4}">
                              <option value="1">PET你&nbsp✿&nbsp寵物報報 </option>
                              <option value="2">PET你&nbsp✿&nbsp寵物美容保養 </option>
                              <option value="3">PET你&nbsp✿&nbsp寵物旅遊 </option>
                              <option value="4" selected>PET你&nbsp✿&nbsp其他 </option>
                           </c:when>
                           </c:choose>
                           
                        </select>
                        
			  </div>

          <input type="hidden" name="postTime" id="time" value="${arts.postTime}">
          <input type="hidden" name="message" id="message" value="${arts.report}">
          <input type="hidden" name="lock" id="lock" value="${arts.available}">
          <input type="hidden" name="like" id="like" value="${arts.likeCount}">
<%--           <input type="hidden" style="margin-bottom:16px;font-size:15px;width:100%;border-radius:5px" name="articleImage" id="articleImage" value="${arts.coverImage}"> --%>
          </div>
          
          <textarea id="editor" name="content">${arts.content}</textarea>
          
          
<!--           <button type="reset" class="btn btn-info btn-lg" style="margin:13px;float:right" onclick="javascript:history.back()">放棄修改</button> -->
          
          <a href="<spring:url value='/article'/>" class="btn btn-info btn-lg" style="margin:13px;float:right">
           <span class="glyphicon-info-sigh glyphicon"></span>放棄修改
           </a>
           
          <button type="submit" class="btn btn-primary btn-lg" style="margin:13px;float:right">儲存文章</button>

          <!-- <input type="button" value="Strip HTML" onclick="ShowStrippedText()" /><br /> -->
          <!-- <input type="button" class="btn btn-primary btn-lg" value="Set CKeditor data" onclick="editorValue()" />-->
          
          </form>









      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
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
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>



</body>

</html>
