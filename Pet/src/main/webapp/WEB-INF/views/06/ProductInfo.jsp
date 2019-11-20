<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
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

	function totalNum() {
		var sumNum = 0;
		$(".textNum").each(function() {
			var all = parseInt($(this).val());
			sumNum += all;
		});
		$("#cartSumNumber").text(sumNum);
	}

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

	//點選商品頁超連結執行SUBMIT動作
	$(function() {
		$(".checkPro")
				.click(
						function() {
							event.preventDefault();
							var productId = $(this).attr("productId");
							console.log("productI=" + productId);
							$('#selectPrdId').val(productId);
							$('#orderSubmit')
									.attr('action',
											"${pageContext.request.contextPath}/06/productDetail");
							$('#orderSubmit').submit();
						});
	});

	$(function() {
		$("#addToCar")
				.click(
						function() {
							$('#orderSubmit')
									.attr('action',
											"${pageContext.request.contextPath}/06/addProductsToCar");
							$('#orderSubmit').submit();
						});
		$("#clearCar")
				.click(
						function() {
							$("#orderSubmit")
									.attr("action",
											"${pageContext.request.contextPath}/06/petClearCar");
							$("#orderSubmit").submit();
						});

		$("#myTable").DataTable({
			"searching" : false,
			"bLengthChange" : false,
			"pageLength" : 8
		});
	})
</script>
<style>
#content {
	margin-left: 0px;
	/* 	background-color: #F2FFF2; */
	text-align: center;
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
</style>
</head>
<body>
	<div id="content">
		<form method="post" id="orderSubmit"
			action="${pageContext.request.contextPath}/06/petOrder">
			<input type="hidden" id="selectPrdId" name="selectPrdId" value="">
			<div class="setPageDiv">
				<div class="Pagination" id="pagination">
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
						<tbody>
							<%--items=表示處理的陣列跟集合 要循環的訊息 var=用來儲存目前元素的值--%>
							<c:forEach items="${products}" var="pro">
								<tr>
									<td><img alt="ʕ•ᴥ•ʔ" class='productImg'
										src="${pageContext.request.contextPath}/06/downloadFile/${pro.product_id}.jpg">
									</td>
									<td><a class="checkPro" productId="${pro.product_id}"
										href="">${pro.product_name}</a></td>
									<td>${pro.price}$</td>
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
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="shoppingCart">
				<button type='button' class="button" id='addToCar'
					style="vertical-align: middle">
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
				<button type='submit' class="button" id='buttonALL'
					style="vertical-align: middle">
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
</body>
</html>