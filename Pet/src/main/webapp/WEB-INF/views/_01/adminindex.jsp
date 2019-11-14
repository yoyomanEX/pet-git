<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<div>
	<table>
		<tr>
			<td><span id="s1">活動列表</span></td>
		</tr>
		<tr>
			<td><span id="s2">新增活動</span></td>
		</tr>
	</table>
	</div>
	
	<div id="d1">
		
	</div>
	 
<script type="text/javascript">
	$("#s2").click(function() {
		$.ajax({
 			success:function (data){
 				inputAct(data);
 			}
 		});
	});	
	function inputAct(data) {
		var txt ="<table>";
		txt +="<tr><td>activity_title:<td><input type='text' id='activity_title'>";
		txt +="<tr><td>activity_content:<td><textarea rows='30' cols='30' id='activity_content'></textarea>";
		txt +="<tr><td>number_limit:<td><input type='text' id='number_limit'>";
		txt +="<tr><td>start_at_y:<td><input type='text' id='start_at_y'>";
		txt +="<tr><td>start_at_h:<td><input type='text' id='start_at_h'>";
		txt +="<tr><td>end_at_y:<td><input type='text' id='end_at_y'>";
		txt +="<tr><td>end_at_h:<td><input type='text' id='end_at_h'>";
		txt +="<tr><td><button id='b1'>送出</button>";	
		document.getElementById("d1").innerHTML=txt;
	}
	
	$("body").on("click","#b1",function(){
		$.ajax({
			url:"_01.savePetActivity",
 			data:{activity_title:$("#activity_title").val(),
 				activity_content:$("#activity_content").val(),
 				number_limit:$("#number_limit").val(),
 				//start_at_y:$("#start_at_y").val(),
 				//start_at_h:$("#start_at_h").val(),
 				//end_at_y:$("#end_at_y").val(),
 				//end_at_h:$("#end_at_h").val(),
 				 },
 			type:"post",
 			success:function (data){
 				inputSuccess(data);
 			}
 		});
	});
	
	function inputSuccess(data) {
		var txt ="成功";
		document.getElementById("d1").innerHTML=txt;
	}
	
</script>

</body>
</html>