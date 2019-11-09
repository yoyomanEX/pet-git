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
				totalPrice();
				endPrice();
			}

		})

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
				totalPrice();
				endPrice();
			}
		})

		function totalPrice() {
			var newSum = 0;
			$(".totalVal").each(function() {
				var newTotal = $(this).attr("value");
				newSum += parseInt(newTotal);
			})
			$("#sum").text(newSum);
		}
		
		function endPrice() {
			var endSum = 0;
			$(".totalVal").each(function() {
				var endTotal = $(this).attr("value");
				endSum += parseInt(endTotal);
			})
			$("#endAmount").text(endSum);
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
		<p>唧唧復唧唧，木蘭當戶織。不聞機杼聲，惟聞女嘆息。 問女何所思，問女何所憶。女亦無所思，女亦無所憶。昨夜見軍帖，可汗大點兵，軍書十二卷，卷卷有爺名。阿爺無大兒，木蘭無長兄，願爲市鞍馬，從此替爺徵。 東市買駿馬，西市買鞍韉，南市買轡頭，北市買長鞭。旦辭爺孃去，暮宿黃河邊，不聞爺孃喚女聲，但聞黃河流水鳴濺濺。旦辭黃河去，暮至黑山頭，不聞爺孃喚女聲，但聞燕山胡騎鳴啾啾。
			萬里赴戎機，關山度若飛。朔氣傳金柝，寒光照鐵衣。將軍百戰死，壯士十年歸。 歸來見天子，天子坐明堂。策勳十二轉，賞賜百千強。可汗問所欲，木蘭不用尚書郎，願馳千里足，送兒還故鄉。 爺孃聞女來，出郭相扶將；阿姊聞妹來，當戶理紅妝；小弟聞姊來，磨刀霍霍向豬羊。開我東閣門，坐我西閣牀，脫我戰時袍，著我舊時裳。當窗理雲鬢，對鏡貼花黃。出門看火伴，火伴皆驚忙：同行十二年，不知木蘭是女郎。（貼 通：帖；驚忙
			一作：惶） 雄兔腳撲朔，雌兔眼迷離；雙兔傍地走，安能辨我是雄雌？</p>
	</div>
	<div id='content'>
		<h2>購買商品清單</h2>
		<form method="post" action="${pageContext.request.contextPath}/06/petOrderConfirm" id="submitData">
			<table style="text-align: center; width: 750px; font-family: Microsoft JhengHei; font-size: 18px; font-weight: bold; margin: auto;" border=1>
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
							<input type="hidden" name="amount" value="${product.amount}">
							<input type="hidden" name="price" value="${product.price*product.amount}">
							<tr>
								<td>
									<img alt="ʕ•ᴥ•ʔ" class='productImg' src="${pageContext.request.contextPath}/06/downloadFile/${product.product_id}.jpg">
								<td>${product.product_name}
								<td>
									<input type="button" name="minus" class='buttonMinus' value='-' price="${product.price}">
									<input type="number" value="${product.amount}" readonly min="0" max="10" class="textNum" style="text-align: center">
									<input type="button" name="add" class='buttonAdd' value='+' amount="${pro.amount}" price="${product.price}">
								<td>${product.price}
								<td>
									<span class="totalVal" value="${product.price*product.amount}">${product.price*product.amount}</span>
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
				<c:when test="${sum < 199}">
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
				元
			</h2>
			<br>
			<fieldset>
				<legend>請填寫寄件資料</legend>
				<input type="hidden" name="total" value="${sum}">
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