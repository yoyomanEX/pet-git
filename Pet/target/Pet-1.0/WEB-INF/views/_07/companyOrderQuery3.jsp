<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 判斷日期格式 -->
<script>
  var jq1=$.noConflict();
  jq1( function() {
    var dateFormat = "yy-mm-dd",
      from = jq1( "#from" )
        .datepicker({
          dateFormat: 'yy-mm-dd',
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = jq1( "#to" ).datepicker({
     	dateFormat: 'yy-mm-dd',
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = jq1.datepicker.parseDate(dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  
  
  jq1(document).ready(function(){
		
		var company_id =jq1("#company_id").val(); 
		var status1 =jq1("#status1").val(); 
		jq1("#clickmeS").click(function() {
			jq1.ajax({
    			url:"queryOrderByStatus",
    			data:{
    				key1:jq1("#from").val(),
    				key2:jq1("#to").val(),
    				key3:company_id,
    				key4:status1      				
    			},
//     			dataType: "text",
    			type:"post",
    			success:function (data){
    				alert(data);
     				showEmp(data);
    			}
    		});
		});
    });
   function showEmp(data) {
  	 	
			var empss=JSON.parse(data);
			var txt ="<th>訂單日期<th>訂單編號<th>訂購人<th>收貨人<th>地址<th>出貨日期<th>訂單狀態<th><button class=\"b4\">新增</button>";
			for(i=0;i<empss.length;i++){
				var order_date = "";
				if(empss[i].order_date != '' && typeof empss[i].order_date != 'undefined'){
					var v1 = new Date(empss[i].order_date);
					order_date = v1.getFullYear()+"-"+(v1.getMonth()+1)+"-"+addZero(v1.getDate(),2)+" "+addZero(v1.getHours(),2)+":"+addZero(v1.getMinutes(),2)+":"+addZero(v1.getSeconds(),2);
				}
				
				var ship_date = "";
				if(empss[i].ship_date){
					var v1 = new Date(empss[i].ship_date);
					ship_date = v1.getFullYear()+"-"+(v1.getMonth()+1)+"-"+addZero(v1.getDate(),2)+" "+addZero(v1.getHours(),2)+":"+addZero(v1.getMinutes(),2)+":"+addZero(v1.getSeconds(),2);
				}
				txt +="<tr><td>"+ order_date;
				txt +="<td>"+empss[i].order_id;
				txt +="<td>"+empss[i].member_id;
				txt +="<td>"+empss[i].recipient;
				txt +="<td>"+empss[i].address;
				txt +="<td>"+ship_date;
				txt +="<td><button class=\"b1\" value=\""+empss[i].empno+"\" onclick=\"showEmp2("+empss[i].empno+")\">修改</button>";
				txt +="<td><button class=\"b2\" value=\""+empss[i].empno+"\">刪除</button>";
			}
			document.getElementById("dataTable").innerHTML=txt;
		}
		
   function addZero(p,n) {
  	 var s = p.toString();
  
		for(var i=0;i<s.length;i++){
			 if(s.length<n){
					s="0"+s;
				}else{
					return s;
				}
		}
  	
	}

  
</script>

</head>
<body id="page-top">


	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">查詢訂單</h1>
		<p class="mb-4">
			<a>ORDER QUERY</a>.
		</p>

		<!-- DataTales Example -->

					<a> <label for="from">訂單起日</label> 
					<input type="text" id="from" name="startdate"> 
					<input type="hidden" value='${CompanyLoginOK.company_id}' name='company_id' id='company_id'> 
					<label for="to">~訂單迄日</label> 
					<input type="text" id="to" name="enddate">
					</a> 
					<a style='padding-right: 200px;'>
					 <label for="" class="t1">商品狀態</label>
					 <select name='status' id='status1'>
							<option value='1'>未處理</option>
							<option value="2">已處理未出貨</option>
							<option value="3">已處理已出貨</option>
					</select>
						<button id='clickmeS'>查詢(JQuery)</button>
					</a> 
					<a href="orderManagement">返回訂單管理</a> 
				</div>
			<!-- 內文開始 -->

			<!-- 	畫面出來的位置 -->
				<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>訂購日期</th>
											<th>訂單編號</th>
											<th>會員ID</th>
											<th>收件人</th>
											<th>售價</th>
											<th>出貨日期</th>
											<th>訂單狀態</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${queryOrder}" var="p1" varStatus="s">
									<tr>
									<td>${p1.order_date}
									<td>${p1.order_id}
									<td>${p1.member_id}
									<td>${p1.recipient}
									<td>${p1.total}
									<td>${p1.ship_date}
									<td>${p1.status}
									<c:set var="count" value="${s.count}" />
										</c:forEach>
									</tbody>
								</table>
								<h3 class="count1">共${count}筆商品資料</h3>

</body>
</html>
