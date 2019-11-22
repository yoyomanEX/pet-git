<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>leopet || Home</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<script>
document.addEventListener("DOMContentLoaded", function () {
   // document.getElementById("userPassword").addEventListener("blur", checkPwd);
    document.getElementById("userName").addEventListener("blur", checkName);
    
});

function checkName(){
	let name = document.getElementById("userName").value;
	console.log(name);
	 if (name == "") {
         document.getElementById("nameSP").innerHTML = "<img src ='Image/error.png'>請輸入名字:(";
     }
}

</script>
</head>

<body>
	<!--::header part start::-->
	<header class="header_area">
		<div class="sub_header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-4 col-md-4 col-xl-6">
						<div id="logo">
							<a href="index.html"><img src="img/Logo.png" alt="" title="" /></a>
						</div>
					</div>
					<div class="col-8 col-md-8 col-xl-6 ">
						<div class="sub_header_social_icon float-right">
							<a href="#"><i class="flaticon-phone"></i>+02 213 - 256 (365)</a>
							<a href="#" class="btn_1 d-none d-md-inline-block">Become a
								Volunteer</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="ti-menu"></i>
							</button>

							<div class="collapse navbar-collapse justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link active"
										href="index.html">Home</a></li>
									<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
									<li class="nav-item"><a href="services.html"
										class="nav-link">services</a></li>
									<li class="nav-item"><a href="gallery.html"
										class="nav-link">gallery</a></li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> ʕ•ᴥ•ʔ 陪你購物</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/06/petProductSale">購物中心</a>
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/06/PetOrderAll">會員訂單明細</a>
										</div></li>
									<li class="nav-item"><a href="blog.html" class="nav-link">blog</a>
									</li>
									<li class="nav-item"><a href="contact.html"
										class="nav-link">Contact</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>

<div >
	<h2>登入頁面</h2>
	<form method="post"
		action="${pageContext.request.contextPath}/06/petLoginOrder">
<h2>請先登入會員在使用完整服務 ʕ•ᴥ•ʔ </h2>
		輸入帳號:<input type="text" name="userName" id="userName"/>
		<span id="nameSP"></span>
		<br>
		 輸入密碼:<input type="password" name="userPassword" id="userPassword"/>
		<span id="passSP"></span>
		   <input type="submit" value="送出" onclick="checkSubmit();" style="width:100px;height:30px">
	</form>
	</div>
</body>
</html>