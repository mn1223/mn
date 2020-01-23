<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<style>
#${myid}{
#color:green;
float:right;
}

.chat_container{
	position:;
	width:987px;
	height:auto;
	background:#ddd;
	 
	 
}
body{ 
padding:10px 450px;  
}  



</style>    
</head>
<body>
	<div><span style="background-color: #ddd; font-size: 20pt; margin-bottom: 30px;">${yourname }</span></div>
	<div class ="chat_container" id="chat">${chatList }</div>

	<form id="chatForm" style="text-align: right;"> 
		<input type="text" id="message" placeholder="여기에 채팅을 입력하세요." style="width:775px; height:100px;" />   
		<button style="width:200px; height:100px; font-size:30pt; font-style:italic; font-weight: bold;" >전송</button>     
	</form>
  
	<script>   
		$(document).ready(
				function() {
					$("#chatForm").submit(
							function(event) {
								event.preventDefault();
								var mes = $("#message").val(); 
								var user = "${myid}";
								sock.send("<span id = ${myid}>" + user + ":"
										+ mes + "</span>");
								$("#message").val('').focus();
							});
				});

		var sock = new SockJS("/echo");
		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br>");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
		}
	</script>
</body>
</html>