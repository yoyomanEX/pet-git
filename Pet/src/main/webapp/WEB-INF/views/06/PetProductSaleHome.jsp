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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- Flexslider 圖片輪播套件 -->
<link href="http://cdn.bootcss.com/flexslider/2.6.3/flexslider.min.css" rel="stylesheet">




<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/flexslider/2.6.3/jquery.flexslider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.20/js/jquery.dataTables.js"></script>
<script>
	var sum = 0;
	var buycar = new Object();

	$(function() {

		$("#myTable").DataTable({
			"searching" : false,
			"bLengthChange" : false
		});

		$(".flexslider").flexslider({
			slideshowSpeed : 5000,
		});
		totalName();
		totalNum();
		totalPrice();

		//商品數量+號button執行動作 把更新的值塞到數目欄
		$(".buttonAdd").click(function() {
			var addTotal = $(this).siblings(".textNum").val();
			if (addTotal >= 10) {
				alert("最大購買數量為10件，如有大量購買需求可以聯絡客服唷ʕ•ᴥ•ʔ");
				return;
			} else {

				//判斷庫存數量是否小於客人點選數量,如小於則跳出庫存不足提醒
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
		$(".buttonMinus").click(function() {
			var minusTotal = $(this).siblings(".textNum").val();
			if (minusTotal <= 0) {
				alert('選購數量不得為負ʕ•ᴥ•ʔ');
			} else {
				minusTotal--;
				$(this).siblings(".textNum").val(minusTotal);
			}
		});

	});

	//跑商品名稱
	function totalName() {
		var productNames = '';
		$(".productName").each(function() {
			var productId = $(this).attr('productId');
			var addTotal = $(this).siblings(".textNum").val();
			var productName = $(this).attr("text");
			//判斷購買數量
			if (addTotal > 0) {
				productNames += productName + '數量x' + addTotal;
			}
			//將畫面上的購物車資料清空
			$("#textProducts").text(productNames);
		});
	}

	//跑商品總數量合計
	function totalNum() {
		var sumNum = 0;
		$(".textNum").each(function() {
			var all = parseInt($(this).val());
			sumNum += all;
		});
		$("#cartSumNumber").text(sumNum);
	}

	//跑商品總金額合計
	function totalPrice() {
		var zong = 0;
		$(".cartProductItemSumPrice").each(function() {
			var productPrice = $(this).attr("price");
			var addTotal = $(this).siblings(".textNum").val();
			var productTotal = productPrice * addTotal;
			zong += productTotal;
		})
		$("#Sum").text(zong);
	}
	//AJAX不更新頁面搜尋貓咪分類商品
	$(function() {
		$("#buttonCat").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/06/ProductInfoCat',
				type : 'post',
				headers : {
					Accept : "text/html, application/xhtml+xml, */*"
				},
				success : function(data) {
					$("#content").empty();
					$("#content").append(data);
				}

			});
		});

		//AJAX不更新頁面搜尋狗狗分類商品
		$("#buttonDog").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/06/ProductInfoDog',
				type : 'post',
				headers : {
					Accept : "text/html, application/xhtml+xml, */*"
				},
				success : function(data) {
					$("#content").empty();
					$("#content").append(data);
				}
			});
		});

		//AJAX不更新頁面搜尋全部分類商品
		$("#allProducts").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/06/productInfoAll',
				type : 'post',
				headers : {
					Accept : "text/html"
				},
				success : function(data) {
					$("#content").empty();
					$("#content").append(data);
				}
			});
		});
		$("#productSearch").keypress(function() {
			var productSearch = $("#productSearch").val();

			$.ajax({
				url : '${pageContext.request.contextPath}/06/productSearch',
				type : 'post',
				data : "&productSearch=" + productSearch,
				headers : {
					Accept : "text/html"
				},
				success : function(data) {
					$("#content").empty();
					$("#content").append(data);
				}
			});
		});
	});

	$(function() {
		//點選商品頁超連結 執行SUBMIT動作 傳到該商品詳細資料頁面
		$(".checkPro").click(function() {
			event.preventDefault();
			var productId = $(this).attr("productId");
			$('#selectPrdId').val(productId);
			$('#orderSubmit').attr('action', "${pageContext.request.contextPath}/06/productDetail");
			$('#orderSubmit').submit();
		});
		//點選商品加入購物車
		$("#addToCar").click(function() {
			$('#orderSubmit').attr('action', "${pageContext.request.contextPath}/06/addProductsToCar");
			$('#orderSubmit').submit();
		});
		//清空購物車
		$("#clearCar").click(function() {
			$("#orderSubmit").attr("action", "${pageContext.request.contextPath}/06/petClearCar");
			$("#orderSubmit").submit();

		});
		//判斷購物車有商品才可跳至結帳頁面
		$("#goBuy").click(function() {
			var carTotal = $(this).attr("carTotal");
			if (carTotal <= 0) {
				alert("請先選購商品在結帳唷!");
				return;
			} else {
				$('#orderSubmit').submit();
			}
		})
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
	height: 800px;
	text-align: center;
	float: left;
}

#content {
	/* 	background-color: #F2FFF2;text-align: center; */
	height: 800px;
	width: 1200px;
}

.flexslider {
	margin-left: 300px;
	height: 560px;
	width: 800px;
	text-align: center;
}

#pageBackground {
	background-image:
		url('${pageContext.request.contextPath}/06/img/aa.png');
}

.buttonSearch {
	display: inline-block;
	border-radius: 25px;
	border: none;
	color: black;
	text-align: center;
	font-size: 20px;
	padding: 10px;
	width: 180px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
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
	width: 130px;
	height: 90px;
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
								02
							</a>
							<a href="_01.memberloginPage" class="btn_1 d-none d-md-inline-block">Longin</a>
							<a href="friendlist" class="btn_1 d-none d-md-inline-block">account</a>
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
										<a class="nav-link active" href="index.jsp">Home</a>
									</li>
									<li class="nav-item">
										<a href="travel.jsp" class="nav-link">𨑨迌 食飯</a>
									</li>
									<li class="nav-item">
										<a href="#" class="nav-link">交朋友</a>
									</li>
									<li class="nav-item">
										<a href="${pageContext.request.contextPath}/06/petProductSale" class="nav-link">PET陪你購物</a>
									</li>
									<li>
										<a href="<spring:url value='/blogIndex'/>" class="nav-link">blog</a>
									</li>
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> PET PET 醫療站 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="hospital.jsp">醫院資訊</a>
											<a class="dropdown-item" href="question.jsp">PET PET Q&A</a>
										</div>
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
	<!-- Header part end-->
	<div id="pageBackground">
		<div id="sidebar_left">
			<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
			<input class="buttonSearch" placeholder="請輸入商品名稱" type="text" id="productSearch">
			<button type='submit' class="button" id='allProducts' style="vertical-align: middle">
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
			<div class="flexslider">
				<ul class="slides">
					<li>
						<img class="imgBanner" src="${pageContext.request.contextPath}/06/img/saleBanner01.png" alt="" style="height: 550px; width: 800px">
					</li>
					<li>
						<img class="imgBanner" src="${pageContext.request.contextPath}/06/img/saleBanner02.png" alt="" style="height: 550px; width: 800px">
					</li>
					<li>
						<img class="imgBanner" src="${pageContext.request.contextPath}/06/img/saleBanner03.png" alt="" style="height: 550px; width: 800px">
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>