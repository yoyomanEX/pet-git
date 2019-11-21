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
  
<title>pET ʕ•ᴥ•ʔ 陪你</title>
<link rel="icon" href="img/about_icon.png">
  
<!--   <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-2.2.4.min.js"/>"> </script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
  
  
<script>
    document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("title").addEventListener("blur", checkPassword);  //事件繫結
    document.getElementById("editor").addEventListener("blur", checkcontent);  //事件繫結
});


function checkPassword() {
    var pass = document.getElementById("title").value;

    if (pass == "") {
        // alert("請輸入標題");
        document.getElementById("titlesp").innerHTML = "<b>&nbsp請輸入標題</b>";
        return (false);
    } else if(pass.length >= 25){
    	 document.getElementById("titlesp").innerHTML = "<b>&nbsp字數超過25字</b>";
    	 return (false);
    }
    document.getElementById("titlesp").innerHTML = "";
    return (true);
}

function checkcontent() {
    var cont = document.getElementById("editor").value;

    if (cont == "") {
        // alert("請輸入標題");
        document.getElementById("editor").innerHTML = "<b>&nbsp請輸入內容</b>";
        return (false);
    } 
    document.getElementById("editor").innerHTML = "";
    return (true);
}

</script>

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


</head>

<body id="page-top">

 <jsp:include page="header_member.jsp" />

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <form action="${pageContext.request.contextPath}/addArticle" method="post" enctype="multipart/form-data">
          <div>
              <input id="articleImage" name="articleImage" type="file">
           
          <input type="text" style="margin-top:20px;font-size:25px;width:100%;border-radius:5px" name="title" id="title"  value="${param.title }" placeholder="&nbsp請輸入文章標題"/>
<%--           <a style="color: red;">${ErrMsg.titleNull}${ErrMsg.titleOver}</a> --%>
          <span id="titlesp"></span>
             <div style="margin-top:10px;margin-bottom:16px;font-size:25px;width:100%;border-radius:5px">

						<select style="width:100%;font-size:25px;width:100%;border-radius:5px;color:#4F4F4F"  name="categories" id="categories" >
                           <option selected >請選擇文章分類</option>
                           <option value="1">PET你&nbsp✿&nbsp寵物報報 </option>
                           <option value="2">PET你&nbsp✿&nbsp寵物美容保養 </option>
                           <option value="3">PET你&nbsp✿&nbsp寵物旅遊 </option>
                           <option value="4">PET你&nbsp✿&nbsp其他 </option>
                        </select>
                        
			  </div>
          <input type=hidden style="margin-bottom:16px;font-size:15px;width:100%;border-radius:5px" name="postTime" id="time" value="${param.postTime}" readonly="readonly" placeholder="&nbsp發布日期"/>
          <input type="hidden" readonly="true" name="memberId" class="form-control" id="id" value='${LoginOK.member_Id}'>
          </div>
          
          <textarea id="editor" name="content">${param.content }</textarea>
<%--           <a style="color: red;">${ErrMsg.ContentNull}</a> --%>
<!--           <span id="contentsp"></span> -->
          
<!--           <button type="reset" class="btn btn-info btn-lg" style="margin:13px;float:right" onclick="javascript:history.back()">取消</button> -->
          
           <a href="<spring:url value='/article'/>" class="btn btn-info btn-lg" style="margin:13px;float:right">
           <span class="glyphicon-info-sigh glyphicon"></span>取消
           </a>
          
          <button type="submit" class="btn btn-primary btn-lg" style="margin:13px;float:right">發布文章</button>
          
          
          <!-- <input type="button" value="Strip HTML" onclick="ShowStrippedText()" /><br />
          <!--  <input type="button" class="btn btn-primary btn-lg" value="Set CKeditor data" onclick="editorValue()" /> -->
          
          </form>


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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
  <!-- Page level plugins -->
<%--   <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script> --%>
  <!-- Page level custom scripts -->
<%--   <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script> --%>
<%--   <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script> --%>

</body>

</html>
