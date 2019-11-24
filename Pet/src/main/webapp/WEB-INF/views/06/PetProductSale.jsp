<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>產品清單</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>leopet || Home</title>
<link rel="icon" href="img/about_icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/datatables.min.css"> --%>
<script
	src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.20/js/jquery.dataTables.js"></script>
<script>
	var sum = 0;
	var buycar = new Object();

	$(function() {

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

		//按下ENTER搜尋商品
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
		$(".checkPro")
				.click(
						function() {
							event.preventDefault();
							var productId = $(this).attr("productId");
							$('#selectPrdId').val(productId);
							$('#orderSubmit')
									.attr('action',
											"${pageContext.request.contextPath}/06/productDetail");
							$('#orderSubmit').submit();
						});
		//點選商品加入購物車
		$("#addToCar")
				.click(
						function() {
							$('#orderSubmit')
									.attr('action',
											"${pageContext.request.contextPath}/06/addProductsToCar");
							$('#orderSubmit').submit();
						});
		//清空購物車
		$("#clearCar")
				.click(
						function() {
							$("#orderSubmit")
									.attr("action",
											"${pageContext.request.contextPath}/06/petClearCar");
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
		});

		$("#myTable").DataTable({
			"searching" : false,
			"bLengthChange" : false,
			"pageLength" : 8,
			"bInfo" : false
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
	height: 800px;
	text-align: center;
	float: left;
}

#content {
	margin-left: 260px;
	/* 	background-color: #F2FFF2; */
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

.dataTables_wrapper .dataTables_paginate .paginate_button {
	box-sizing: border-box;
	display: inline-block;
	min-width: 1.5em;
	padding: 0.5em 1em;
	margin-left: 2px;
	text-align: center;
	text-decoration: none !important;
	cursor: pointer;
	*cursor: hand;
	color: #333 !important;
	border: 1px solid transparent;
	border-radius: 2px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current,
	.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover
	{
	color: #333 !important;
	border: 1px solid #979797;
	background-color: white;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white),
		color-stop(100%, #dcdcdc));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* Chrome10+,Safari5.1+ */
	background: -moz-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* FF3.6+ */
	background: -ms-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* IE10+ */
	background: -o-linear-gradient(top, white 0%, #dcdcdc 100%);
	/* Opera 11.10+ */
	background: linear-gradient(to bottom, white 0%, #dcdcdc 100%);
	/* W3C */
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active
	{
	cursor: default;
	color: #666 !important;
	border: 1px solid transparent;
	background: transparent;
	box-shadow: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active
	{
	cursor: default;
	color: #666 !important;
	border: 1px solid transparent;
	background: transparent;
	box-shadow: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	color: white !important;
	border: 1px solid #111;
	background-color: #585858;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #585858),
		color-stop(100%, #111));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #585858 0%, #111 100%);
	/* Chrome10+,Safari5.1+ */
	background: -moz-linear-gradient(top, #585858 0%, #111 100%);
	/* FF3.6+ */
	background: -ms-linear-gradient(top, #585858 0%, #111 100%);
	/* IE10+ */
	background: -o-linear-gradient(top, #585858 0%, #111 100%);
	/* Opera 11.10+ */
	background: linear-gradient(to bottom, #585858 0%, #111 100%);
	/* W3C */
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

	<jsp:include page="header.jsp" />

	<div id="pageBackground">
		<div id="sidebar_left">
			<h3>pETʕ•ᴥ•ʔ 陪你購物</h3>
			<input class="buttonSearch" placeholder="請輸入商品名稱" type="text"
				id="productSearch">

			<button type='submit' class="button" id='allProducts'
				style="vertical-align: middle">
				<span>全部商品</span>
			</button>
			<button type='submit' class="button" id='buttonCat'
				style="vertical-align: middle">
				<span>貓貓伙食</span>
			</button>
			<button type='submit' class="button" id='buttonDog'
				style="vertical-align: middle">
				<span>狗狗伙食 </span>
			</button>
			<button class="button" style="vertical-align: middle">
				<span>其他商品 </span>
			</button>
		</div>
		<div id="content">
			<form method="post" id="orderSubmit"
				action="${pageContext.request.contextPath}/06/petOrder">
				<input type="hidden" id="selectPrdId" name="selectPrdId" value="">
				<table id="myTable"
					style="text-align: center; width: 850px; font-family: Microsoft JhengHei; font-size: 18px; font-weight: bold;"
					border=1>
					<thead>
						<tr>
							<th>商品圖片</th>
							<th>商品名稱</th>
							<th>價格</th>
							<th>選購數量</th>
						</tr>
					</thead>
					<%--items=表示處理的陣列跟集合 要循環的訊息 var=用來儲存目前元素的值--%>
					<tbody>
						<c:forEach items="${products}" var="pro">
							<c:if test="${pro.status == 1}">
								<tr>
									<td><img alt="ʕ•ᴥ•ʔ" class='productImg'
										src="${pageContext.request.contextPath}/06/downloadFile/${pro.product_id}.jpg">
									</td>
									<td><a class="checkPro" productId="${pro.product_id}"
										href="">${pro.product_name}</a></td>
									<td>$${pro.price}</td>
									<td><c:choose>
											<c:when test="${pro.amount==0}">
												<input type="hidden" name="amount" value="0" class="textNum"
													style="text-align: center;" />
												<input type="hidden" name="productId"
													value="${pro.product_id}">
												<h4>商品目前補貨中ʕ•ᴥ•ʔ</h4>
											</c:when>
											<c:otherwise>
												<input type="button" name="minus" class='buttonMinus'
													value='-'>
												<input type="number" readonly name="amount" value="0"
													min="0" max="10" class="textNum"
													style="text-align: center;" />
												<input type="button" name="add" class='buttonAdd' value='+'
													amount="${pro.amount}">
												<input type='hidden' class='cartProductItemSumPrice'
													price="${pro.price}">
												<input type='hidden' productId="${pro.product_id}"
													class='productName' text="${pro.product_name}">
												<input type="hidden" name="productId"
													value="${pro.product_id}">
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div id="shoppingCart">
					<button type='button' class="button" id='addToCar'
						style="vertical-align: middle" carQuantity="${carQuantity}">
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
					<span> 已選商品 <span>${carQuantity}</span> 件
					</span> <br> <span> 合計 : <span> ${carTotal}</span> 元
					</span>
					<button type='button' class="button" id='goBuy'
						style="vertical-align: middle" carTotal="${carTotal}">
						<span>結帳去</span>
					</button>
					<c:if test="${carTotal > 0}">
						<button type='button' class="button" id='clearCar'
							style="vertical-align: middle">
							<span>清空購物車</span>
						</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>