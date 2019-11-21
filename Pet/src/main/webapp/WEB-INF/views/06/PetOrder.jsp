<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購買清單</title>
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
<script type="text/javascript">
	$(function() {
		$("#backShopping").click(function() {
			$("#submitData").attr("action", "${pageContext.request.contextPath}/06/petProductSale");
			$("#submitData").submit();
		});


		//商品數量+號button執行動作 把更新的值塞到數目欄
		$(".buttonMinus").click(function() {
			var minus = $(this).siblings(".textNum").val();
			if (minus <= 0) {
				alert('選購數量不得為負ʕ•ᴥ•ʔ');
				return;
			} else {
				minus--;
				$(this).siblings(".textNum").val(minus);
				var minusTotal = minus * $(this).attr("price");
				$(this).parent().next().next().children("span.totalVal").attr("value", minusTotal);
				$(this).parent().next().next().children("span.totalVal").text(minusTotal);
// 				$("#totalVal").attr("value", minusTotal);
// 				console.log($("#").val());
				totalPrice();
				endPrice();
			}

		})

		//商品數量-號button執行動作 把更新的值塞到數目欄
		$(".buttonAdd").click(function() {
			var add = $(this).siblings(".textNum").val();
			if (addTotal >= 10) {
				alert("最大購買數量為10件，如有大量購買需求可以聯絡客服唷ʕ•ᴥ•ʔ");
				return;
			} else {
				add++;
				$(this).siblings(".textNum").val(add);
				var addTotal = add * $(this).attr("price");
				$(this).parent().next().next().children("span.totalVal").attr("value", addTotal);
				$(this).parent().next().next().children("span.totalVal").text(addTotal);
				//$("#totalVal").attr("value", addTotal);
				//console.log($("#totalVal").val());
				totalPrice();
				endPrice();
			}
		})

		//跑商品合計的金額 ,$(".totalVal").each跑商品合計迴圈
		function totalPrice() {
			var newSum = 0;
			$(".totalVal").each(function() {
				var newTotal = $(this).attr("value");
				newSum += parseInt(newTotal);
			})
			$("#sum").text(newSum);
		}
		////跑總合計的金額 (加上運費條件判斷,商品合計未滿299需加收運費,滿299則不用),$(".totalVal").each跑商品合計迴圈
		function endPrice() {
			var endSum = 0;
			$(".totalVal").each(function() {
				var endTotal = $(this).attr("value");
				endSum += parseInt(endTotal);
			});
			//#freight 運費欄
			if (endSum < 299) {
				endSum += 60;
				$("#freight").text("60");
			} else {
				$("#freight").text("0");
			}
			$("#endAmount").text(endSum);
			$("#finalAmount").attr("value", parseInt(endSum));
		}

	})
</script>
<style>
#sidebar_left {
	background-color: #FFB5B5;
	width: 260px;
	height: 800px;
	text-align: center;
	float: left;
}

#content {
	margin-left: 260px;
	margin-right: 260px;
	/* 	background-color: #F2FFF2; */
	text-align: center;
}

.productImg {
	width: 130px;
	height: 90px
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

fieldset {
	background-color: #FFB5B5;
	border-radius: 3px;
	width: 800px;
	border: 5px double rgb(51, 46, 46);
	text-align: center;
	font-family: Microsoft JhengHei;
	font-size: 18px;
	font-weight: bold;
	margin: auto;
}
</style>
</head>
<body bgcolor="#fdf5e6">
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
	<div id="sidebar_left">
		<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
		<p >
		<h2 style = "color: red">注意！！！！！</h2>
		<img src="img/noImg.jpg" style="width: 220px; height: 220px">
		<h4>可愛貓咪出沒(๑• . •๑) </h4>
		</p>
	</div>
	<div id='content'>
		<h2>購買商品清單</h2>
		<form method="post" action="${pageContext.request.contextPath}/06/petOrderConfirm" id="submitData">
			<table style="text-align: center; width: 800px; font-family: Microsoft JhengHei; font-size: 18px; font-weight: bold; margin: auto;" border=1>
				<tr>
					<th>產品圖片
					<th>產品名稱
					<th>數量
					<th>單價
					<th>
						小計
						<c:set value="0" var="sum" />
						<c:forEach var="product" items="${products}">
							<input type="hidden" name="productId" value="${product.product_id}">
							<input type="hidden" name="productName" value="${product.product_name}">
							<input type="hidden" name="price" value="${product.price}">
							<tr>
								<td>
									<img alt="ʕ•ᴥ•ʔ" class='productImg' src="${pageContext.request.contextPath}/06/downloadFile/${product.product_id}.jpg">
								<td>${product.product_name}
								<td>
									<input type="button" name="minus" class='buttonMinus' value='-' price="${product.price}">
									<input type="number" name="amount" value="${product.amount}" readonly min="0" max="10" class="textNum" style="text-align: center">
									<input type="button" name="add" class='buttonAdd' value='+' amount="${pro.amount}" price="${product.price}">
								<td>${product.price}
								<td>
									<span class="totalVal"  value="${product.price*product.amount}">${product.price*product.amount}</span>

									<!-- 設置sum累加 等於sum=sum+product.price*product.quantity -->
									<c:set var="sum" value="${sum+product.price*product.amount}" />
						</c:forEach>
			</table>
			<h2>
				商品合計:
				<span id="sum">${sum}</span>
				元
			</h2>
			<c:choose>
				<c:when test="${sum < 299}">
					<h2>
						運費:
						<c:set var="sum" value="${sum+60}"></c:set>
						<span id="freight">60</span>
						元
					</h2>
				</c:when>
				<c:otherwise>
					<h2>
						運費:
						<c:set var="sum" value="${sum}"></c:set>
						<span id="freight">0</span>
						元
					</h2>
				</c:otherwise>
			</c:choose>
			<hr style="height: 10px; border: none; border-top: 10px groove skyblue;">
			<h2>
				金額合計:
				<span id="endAmount">${sum}</span>
				<input type="hidden" id="finalAmount" name="total" value="${sum}">
				元
			</h2>
			<br>
			<fieldset>
				<legend>請填寫寄件資料</legend>
				收件人地址：
				<input type="text" name="address">
				<br>
				收件人姓名：
				<input type="text" name="name">
				<br>
				收件人電話：
				<input type="text" name="phone">
				<br>
				<button type='submit' class="button" id='buttonALL' style="vertical-align: middle">
					<span>下單去ʕ•ᴥ•ʔ</span>
				</button>
				<button type='button' class="button" id='backShopping' style="vertical-align: middle">
					<span>返回ʕ•ᴥ•ʔ</span>
				</button>
			</fieldset>
		</form>
	</div>
</body>
</html>