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
  function confirmDelete(hotel_id){
	  var result = confirm("確定刪除此筆記錄(hotel_id:" + hotel_id.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.value = "DELETE";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(hotel_id){
	  var result = confirm("確定送出此筆記錄(hotel_id:" + hotel_id.trim() + ")?");
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
<h2 class='center'>更新hotel資料</h2>
<hr>
<p> 
<form:form class='center' 
		action="${pageContext.request.contextPath}/_08/hotels/${hotelBean.hotel_id}" 
     modelAttribute="hotelBean" method="POST" >
    <input type="hidden" name="_method"  id='putOrDelete'   value="" >
    <input type="hidden" name="id"     value="${hotelBean.hotel_id}${param.hotel_id}" >
    <input type="hidden" name="finalDecision" value="" > 
    <Table>
         <TR>
             <TD align="RIGHT">ID：</TD>
             <TD align="LEFT">${hotelBean.hotel_id}${param.hotel_id}</TD>
         </TR>
         <TR>
             <TD align="RIGHT">NAME：</TD>
             <TD align="LEFT" >
                <form:input path="hotel_name"  size="30"/>
                <font color='red' size='-3'>${error.hotel_name}</font>
             </TD>
         </TR>             
                      
         <TR>
             <TD align="RIGHT">ADDRESS：</TD>
             <TD align="LEFT" > 
               <form:input path="hotel_address" />
               <font color='red' size='-3'>${error.hotel_address}</font>
             </TD>
         </TR>
          <TR>
             <TD align="RIGHT">TEL:</TD>
             <TD align="LEFT" > 
               <form:input path="hotel_tel" />
               <font color='red' size='-3'>${error.hotel_tel}</font>
             </TD>
         </TR>               

        <TR>
            <TD colspan="2" align="center">     
            <input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${hotelBean.hotel_id}');"> 
<%--             <input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${hotelBean.hotel_id}');" > --%>
				
            </TD>
            </TR>
         </Table>
         <c:if test="${not empty requestScope.modify}">   
           <c:remove var="hotelBean" scope="request" />       
         </c:if>
</form:form>
<p/>
<small>&lt;&lt;<a href="../hotels">回上一頁</a>&gt;&gt;</small>
</div>
</body>

</html>
