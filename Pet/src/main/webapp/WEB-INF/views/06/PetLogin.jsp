<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
document.addEventListener("DOMContentLoaded", function () {
   // document.getElementById("userPassword").addEventListener("blur", checkPwd);
    document.getElementById("userName").addEventListener("blur", checkName);
    
});

function checkName(){
	let name = document.getElementById("userName").value;
	console.log(name);
	 if (name == "") {
         document.getElementById("nameSP").innerHTML = "<img src ='Image/error.png'>請輸入名字:(";
     }
}

</script>
</head>

<body>

	<h2>登入頁面</h2>
	<form method="post"
		action="${pageContext.request.contextPath}/06/petLogin">

		輸入帳號:<input type="text" name="userName" id="userName"/>
		<span id="nameSP"></span>
		<br>
		 輸入密碼:<input type="password" name="userPassword" id="userPassword"/>
		<span id="passSP"></span>
		 
		   <input type="submit" value="送出" onclick="checkSubmit();" style="width:100px;height:30px">
	
	</form>
</body>
</html>