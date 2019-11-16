<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>MVC</title>
<script type="text/javascript">
  function confirmDelete(restaurant_id){
	  var result = confirm("確定刪除此筆記錄(restaurant_id:" + restaurant_id.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.value = "DELETE";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(restaurant_id){
	  var result = confirm("確定送出此筆記錄(restaurant_id:" + restaurant_id.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.value = "PUT";
	      return true;
	  }
	  return false;
  }
</script>
</head>
<body>
<p>
<hr>
<div class='center' >
<h2 class='center'>更新restaurant資料</h2>
<hr>
<p> 
<form:form class='center' 
		action="${pageContext.request.contextPath}/_08/restaurants/${restaurantBean.restaurant_id}" 
     modelAttribute="restaurantBean" method="POST" >
    <input type="hidden" name="_method"  id='putOrDelete'   value="" >
    <input type="hidden" name="id"     value="${restaurantBean.restaurant_id}${param.restaurant_id}" >
    <input type="hidden" name="finalDecision" value="" > 
    <Table>
         <TR>
             <TD align="RIGHT">ID：</TD>
             <TD align="LEFT">${restaurantBean.restaurant_id}${param.restaurant_id}</TD>
         </TR>
         <TR>
             <TD align="RIGHT">NAME：</TD>
             <TD align="LEFT" >
                <form:input path="restaurant_name"  size="30"/>
                <font color='red' size='-3'>${error.restaurant_name}</font>
             </TD>
         </TR>             
                      
         <TR>
             <TD align="RIGHT">ADDRESS：</TD>
             <TD align="LEFT" > 
               <form:input path="restaurant_address" />
               <font color='red' size='-3'>${error.restaurant_address}</font>
             </TD>
         </TR>
          <TR>
             <TD align="RIGHT">TEL:</TD>
             <TD align="LEFT" > 
               <form:input path="restaurant_tel" />
               <font color='red' size='-3'>${error.restaurant_tel}</font>
             </TD>
         </TR>               

        <TR>
            <TD colspan="2" align="center">     
            <input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${restaurantBean.restaurant_id}');"> 
<%--             <input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${restaurantBean.restaurant_id}');" > --%>
				
            </TD>
            </TR>
         </Table>
         <c:if test="${not empty requestScope.modify}">   
           <c:remove var="hotelBean" scope="request" />       
         </c:if>
</form:form>
<p/>
<small>&lt;&lt;<a href="../restaurants">回上一頁</a>&gt;&gt;</small>
</div>
</body>

</html>
