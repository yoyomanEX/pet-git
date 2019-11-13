<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/onebyonechat.css"
	type="text/css">
<title>OneByOneChat</title>
</head>
<style type="text/css">
</style>

<body>
	<c:set var="memberName" value="${ LoginOK.name }" />
	
	<c:set var='friend' value='${friends}'/>
	<div class="chat-wrap">
		<h1>Pet你即時通</h1>
		<div class="chat-con clearfix"></div>
		<div class="bottom">
			<input type="text" id="content">
			<button class="sendBtn" onclick="send()">發送</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		console.log("ovo");
	})
	
	$(document).on("load", function(){
		console.log("owo");
	})
	var uname = '${ memberName }';
	var username = '${ memberName }';
	var toName = '${friend}';
	var websocket = null;
	var date = new Date().toLocaleString();
	//判斷當前瀏覽器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/Pet/onebyonechat/"
				+ toName + "/"+ username);
		console.log("");
	} else {
		alert('Not support websocket')
	}

	//連接發生錯誤的方法
	websocket.onerror = function() {
	};

	//連接成功建立的方法
	websocket.onopen = function(event) {
		};

	//接收到消息的方法
	websocket.onmessage = function(event) {
		console.log(event.data);
		var messageObject = JSON.parse(event.data);
		var username = '${ memberName }';
		var html
		if (username === messageObject.sendName) {
			html = '<div class="chat-item item-right clearfix"><span class="img fr"></span><span class="message fr">'
					+ messageObject.content + '</span></div>'
		} else {
			html = '<div class="chat-item item-left clearfix rela"><span class="abs uname">'
					+ messageObject.sendName
					+ '</span><span class="img fl"></span><span class="fl message">'
					+ messageObject.content + '</span></div>'
		}
		$('.chat-con').append(html);
	}

	//連接關閉的方法
	websocket.onclose = function() {
	}

	//監聽窗口關閉事件，當窗口關閉時，主動去關閉websocket連接，防止連接還沒斷開就關閉窗口，server端會拋異常。
	window.onbeforeunload = function() {
		websocket.close();
	}

	//關閉連接
	function closeWebSocket() {
		websocket.close();
	}

	//發送消息
	function send() {
		var username = '${ memberName }';
		var toName = '${friend}';
		var content = $("#content").val();
		console.log(content);
		$("#content").val('');
		var messageBody = {
			"sendName" : username,
			"content" : content,
			"toName" : toName
		};
		websocket.send(JSON.stringify(messageBody));
	}

</script>

</html>