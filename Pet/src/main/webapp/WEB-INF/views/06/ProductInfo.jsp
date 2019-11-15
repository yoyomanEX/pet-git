<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
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
		$(".checkPro").click(function() {
			event.preventDefault();
			var productId = $(this).attr("productId");
			console.log("productI="+productId);
			$('#selectPrdId').val(productId);
			$('#orderSubmit').attr('action', "${pageContext.request.contextPath}/06/productDetail");
			$('#orderSubmit').submit();
		});
	});

	$(function() {
		$("#addToCar").click(function() {
			$('#orderSubmit').attr('action', "${pageContext.request.contextPath}/06/addProductToCar");
			$('#orderSubmit').submit();
		});
		$("#clearCar").click(function(){
			$("#orderSubmit").attr("action","${pageContext.request.contextPath}/06/petClearCar");
			$("#orderSubmit").submit();
		})
	})
	
	
</script>
<style>
#content {
	margin-left: 0px;
	/* 	background-color: #F2FFF2; */
	text-align: center;
}
</style>
</head>
<body>
	<div id="content">
		<form method="post" id="orderSubmit" action="${pageContext.request.contextPath}/06/petOrder">
			<input type="hidden" id="selectPrdId" name="selectPrdId" value="">
			<table style="text-align: center; width: 800px; font-family: Microsoft JhengHei; font-size: 18px; font-weight: bold;" border=1>
				<%--items=表示處理的陣列跟集合 要循環的訊息 var=用來儲存目前元素的值--%>
				<c:forEach items="${products}" var="pro">
					<input type="hidden" name="productId" value="${pro.product_id}">
					<tr>
						<td>
							<img alt="ʕ•ᴥ•ʔ" class='productImg' src="${pageContext.request.contextPath}/06/downloadFile/${pro.product_id}.jpg">
						</td>
						<td>
							<a class="checkPro" productId="${pro.product_id}" href="">${pro.product_name}</a>

						</td>
						<td>${pro.price}$</td>
						<td>
							<c:choose>
								<c:when test="${pro.amount==0}">
									<input type="hidden" name="amount" value="0" class="textNum" style="text-align: center;" />
									<h4>商品目前補貨中ʕ•ᴥ•ʔ</h4>
								</c:when>
								<c:otherwise>
									<input type="button" name="minus" class='buttonMinus' value='-'>
									<input type="number" readonly name="amount" value="0" min="0" max="10" class="textNum" style="text-align: center;" />
									<input type="button" name="add" class='buttonAdd' value='+' amount="${pro.amount}">
									<input type='hidden' class='cartProductItemSumPrice' price="${pro.price}">
									<input type='hidden' productId="${pro.product_id}" class='productName' text="${pro.product_name}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
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
</body>
</html>