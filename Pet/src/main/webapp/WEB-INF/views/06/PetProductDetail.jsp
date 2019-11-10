<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>產品清單</title>
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
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
<script>
	$(function() {
		$("#cartSubmit").click(function() {
			$.ajax({
				url : '${request.contextPath}/api/ajaxShoppingCar',
				type : 'post',
				data : $("#shoppingCart").serialize(),
				success : function(data) {
					$("#shoppingCart").empty();
					$("#shoppingCart").append(JSON.stringify(data));
				}
			})
		})
	})
	
	
	
		$(function() {
		$("#addToCar").click(function() {
			$('#orderSubmit').attr('action', "${pageContext.request.contextPath}/06/addProductToCar");
			$('#orderSubmit').submit();
		});
		$("#clearCar").click(function(){
			$("#orderSubmit").attr("action","${pageContext.request.contextPath}/06/productDetail");
			$("#orderSubmit").submit();
		})
		//商品數量+號button執行動作 把更新的值塞到數目欄
		$("#buttonAdd").click(function() {
			var addTotal = $(this).siblings(".textNum").val();
			if (addTotal >= 10) {
				alert("最大購買數量為10件，如有大量購買需求可以聯絡客服唷ʕ•ᴥ•ʔ");
			} else {
				var amountTotal = $(this).attr("amount");
				addTotal++;
				if (addTotal > amountTotal) {
					alert("本商品目前庫存只剩" + amountTotal + "件唷!");
					return;
				} else {
					//siblings("") 方法返回被选元素的同胞元素。
					$(this).siblings(".textNum").val(addTotal);
				}
			}
		});

		//商品數量-號button執行動作 把更新的值塞到數目欄
		$("#buttonMinus").click(function() {
			var minusTotal = $(this).siblings(".textNum").val();
			if (minusTotal <= 0) {
				alert('選購數量不得為負ʕ•ᴥ•ʔ');
			} else {
				minusTotal--;
				$(this).siblings(".textNum").val(minusTotal);
			}
		});
	});
	
	
</script>
<style type="text/css">
#shoppingCart {
	position: fixed;
	top: 30%;
	right: 5%;
	text-align: center;
	font-family: Microsoft JhengHei;
	font-size: 18px;
	font-weight: bold;
	float: right;
	width: 250px;
}

#sidebar_left {
	/* 	background-color: #FFB5B5;  */
	width: 260px;
	text-align: center;
	float: left;
}

#content {
	margin-left: 260px;
	margin-right: 260px;
	/* 	background-color: #F2FFF2; */
	text-align: center;
	width: 850px;
}

#pageBackground {
	background-image: url(/img/aa.png);
}

.button {
	display: inline-block;
	border-radius: 25px;
	background-color: #FF5151;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 10px;
	width: 180px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.productImg {
	width: 300px;
	height: 400px;
	float: left;
}
</style>
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
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li class="nav-item">
										<a href="contact.html" class="nav-link"></a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header part end-->
	<div id="pageBackground">
		<div id="sidebar_left">
			<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
			<button type='submit' class="button" id='buttonALL' style="vertical-align: middle">
				<span>全部商品</span>
			</button>
			<button type='submit' class="button" id='buttonCat' style="vertical-align: middle">
				<span>貓貓伙食</span>
			</button>
			<button type='submit' class="button" id='buttonDog' style="vertical-align: middle">
				<span>狗狗伙食 </span>
			</button>
			<button class="button" style="vertical-align: middle">
				<span>其他商品 </span>
			</button>
		</div>
		<div id="content">
			<form method="post" id="orderSubmit" action="${pageContext.request.contextPath}/06/petOrder">
				<input type="hidden" name="productId" value="${product.product_id}">
				<h1>${product.product_name}</h1>
				<hr>
				<br>
				<img alt="ʕ•ᴥ•ʔ" class='productImg' src="${pageContext.request.contextPath}/06/downloadFile/${product.product_id}.jpg">
				<h3>${product.describe}</h3>
				<br>
				<br>
				<br>
				<h3>價格:${product.price}$</h3>
								<c:choose>
									<c:when test="${product.amount==0}">
										<input type="hidden" name="amount" value="0" class="textNum" style="text-align: center;" />
										<h4>商品目前補貨中ʕ•ᴥ•ʔ</h4>
									</c:when>
									<c:otherwise>
										<input type="button" name="minus" id='buttonMinus' value='-'>
										<input type="number" readonly name="amount" value="0" min="0" max="10" class="textNum" style="text-align: center;" />
										<input type="button" name="add" id='buttonAdd' value='+' amount="${product.amount}">
										<input type='hidden' class='cartProductItemSumPrice' price="${product.price}">
<%-- 										<input type='hidden' productId="${product.product_id}" class='productName' text="${product.product_name}"> --%>
									</c:otherwise>
								</c:choose>
						
				<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
				<div id="shoppingCart">
					<button type='button' class="button" id='addToCar' style="vertical-align: middle">
						<span>加到購物車</span>
					</button>
					<br>
					<c:set var="carTotal" value="0"></c:set>
					<c:set var="carQuantity" value="0"></c:set>
					<c:forEach var="InCar" items="${productsInCar}">
						<c:set var="carTotal" value="${carTotal+InCar.price*InCar.amount}"></c:set>
						<c:set var="carQuantity" value="${carQuantity+InCar.amount}"></c:set>
						<input type="hidden" value="${InCar.product_id}">
						<span>${InCar.product_name} 數量x ${InCar.amount}</span>
						<br>
					</c:forEach>
					<hr>
					<span>
						已選商品
						<span>${carQuantity}</span>
						件
					</span>
					<br>
					<span>
						合計 :
						<span> ${carTotal}</span>
						元
					</span>
					<button type='submit' class="button" id='buttonALL' style="vertical-align: middle">
						<span>結帳去</span>
					</button>
					<c:if test="${carTotal > 0}">
						<button type='button' class="button" id='clearCar' style="vertical-align: middle">
							<span>清空購物車</span>
						</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
</body>
</html>