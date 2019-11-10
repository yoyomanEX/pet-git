<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<style type="text/css">
#sidebar_right {
	background-color: #FFECC9;
	width: 260px;
	text-align: center;
	float: right;
}

#sidebar_left {
	background-color: #FFB5B5;
	width: 260px;
	height: 400px;
	text-align: center;
	float: left;
}

#content {
	margin-left: 120px;
	margin-right: 280px;
	height: 400px;
	background-color: #F2FFF2;
	text-align: center;
}

.productImg {
	width: 90px;
	height: 50px
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
<script>
	//其作用和 $(document).ready()一樣 ，用意在DOM載入後執行ready()方法。
	$(function() {
		/*選擇器介紹:https://ithelp.ithome.com.tw/articles/10095237 
		JQuery選擇器 選擇(input元素 要做的事情:click後 下方執行方法*/
		$("input").click(function() {
			/*attr() 方法设置或返回被选元素的属性值。根据该方法不同的参数，其工作方式也有所差异。
			$(selector).attr(attribute)返回被选元素的属性值。
			this代表當前物件*/
			var orderid = $(this).attr("orderid");
			console.log('tr[orderid="' + orderid + '"]');
			/* 因為所有TR有設置ID 當點擊按鈕時產生orderid會傳給TR的orderId
			即可對該TR做顯示跟隱藏的替換工作*/
			$('tr[orderid=' + orderid + ']').toggle();
		});
	});
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
							<a href="index.html">
								<img src="img/Logo.png" alt="" title="" />
							</a>
						</div>
					</div>
					<div class="col-8 col-md-8 col-xl-6 ">
						<div class="sub_header_social_icon float-right">
							<a href="#">
								<i class="flaticon-phone"></i>
								+02 213 - 256 (365)
							</a>
							<a href="#" class="btn_1 d-none d-md-inline-block">Become a Volunteer</a>
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
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="ti-menu"></i>
							</button>
							<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item active">
										<a class="nav-link active" href="index.html">Home</a>
									</li>
									<li class="nav-item">
										<a href="about.html" class="nav-link">About</a>
									</li>
									<li class="nav-item">
										<a href="services.html" class="nav-link">services</a>
									</li>
									<li class="nav-item">
										<a href="gallery.html" class="nav-link">gallery</a>
									</li>
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ʕ•ᴥ•ʔ 陪你購物</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="${pageContext.request.contextPath}/06/petProductSale">購物中心</a>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/06/PetOrderAll">會員訂單明細</a>
										</div>
									</li>
									<li class="nav-item">
										<a href="blog.html" class="nav-link">blog</a>
									</li>
									<li class="nav-item">
										<a href="contact.html" class="nav-link">Contact</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="sidebar_left"></div>
	<div id="sidebar_right"></div>
	<div id="content">
		<h2>會員訂單明細</h2>
		HI!${userName},您好! 您的訂單如下:
		<br>
		<table style="text-align: center; width: 850px; font-family: Microsoft JhengHei; font-size: 18px; font-weight: bold;" border=1">
			<c:forEach var='list' items='${orderList}'>
			<tr>
				<th>訂單日期</th>
				<th>訂單編號</th>
				<th>總額</th>
				<th>出貨狀態</th>
				<th>訂單明細</th>
				
					<tr>
						<td>${list.order_date}</td>
						<td>${list.order_id}</td>
						<td>${list.total}$</td>
						<td>尚未出貨</td>
						<td>
							<input type="button" class="showDetail" orderid="${list.order_id}" value="checkʕ•ᴥ•ʔ " />
						</td>
						<c:forEach var='detailList' items='${orderListDetail}'>
							<c:if test='${list.order_id == detailList.order_id}'>
								<tr orderid="${list.order_id}" style="display: none; color: #FF5151">
									<td>商品圖片</td>
									<td>商品名稱</td>
									<td>數量</td>
									<td>合計金額</td>
									<td>是否免運</td>
								</tr>
								<tr orderid="${list.order_id}" style="display: none; color: #FF5151">
									<td>
										<img alt="ʕ•ᴥ•ʔ" class='productImg' src="${pageContext.request.contextPath}/06/downloadFile/${detailList.product_id}.jpg">
									</td>
									<td>${detailList.product_name}</td>
									<td>${detailList.amount}</td>
									<td>${detailList.total}$</td>
									<c:choose>
										<c:when test="${list.total < 299}">
											<td>N</td>
										</c:when>
										<c:otherwise>
											<td>Y</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
						</c:forEach>
				</c:forEach>
		</table>
	</div>
</body>
</html>