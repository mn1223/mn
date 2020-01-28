<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<style>

.chat{
	display:inline-block;
	padding:40px 30px 10px 30px;
	min-height:80px;
	vertical-align:middle;
	white-space: normal;
    word-break: break-all;
	border-radius: 5px;
	width: 40%;
	font-size:1.2em;
}
.chat:after
{
	position:absolute;
	line-height:40px;
	top: 0;
    left: 30px;
    font-size:1.2em;
}
.chat#${myid}
{
	background: skyblue;
    color: white;
    margin: 10px 0 10px 100%;
    transform: translate(-110%);
    
}
.chat#${myid}:after
{
	content:"${myname}";
}
.chat:not(#${myid})
{
	background: #eee;
    color: grey;
    margin: 10px 100% 10px 0;
    transform: translate(10%);
}
.chat:not(#${myid}):after{
	content:"${yourname }";
}
.chat_container {
	position:;
	width: 987px;
	height: auto;
	max-height: 85%;
	overflow:auto;
	overflow-x:hidden;
	background: #ddd;
}

body {
	padding: 10px 450px;
}

#chatForm{
	width: 987px; 
	height: 100px;
	background:#eee;
}
#chatForm>input{
	margin-left:2%;
	width: 73%; 
	height: 100%;
	font-size:2em;
	border: 0;
    background: 0;
}
#chatForm>button{
	width: 25%; 
	height: 100%;
	font-size: 30pt; 
	font-style: italic; 
	font-weight: bold;
	float: right;
	border: 0;
    background: 0;
}
body>div, body>form{
	position:relative;
	left:50%;
	transform:translate(-50%);
	
}
body{
	overflow:visible;
}
</style>
</head>
<body>
	<div style="width:987px">
		<span
			style="background-color: #ddd; font-size: 20pt; margin-bottom: 30px;">${yourname }</span>
	</div>
	<div class="chat_container" id="chat">${chatList }<hr style="border-color:#333;"></div>

	<form id="chatForm" >
		<input type="text" id="message" placeholder="여기에 채팅을 입력하세요." />
		<button>전송</button>
	</form>


	

	<script>   
	$(".chat_container").scrollTop($(".chat_container")[0].scrollHeight);
		$(document).ready(
				function() {
					$("#chatForm").submit(
							function(event) {
								event.preventDefault();
								var mes = $("#message").val(); 
								var user = "${myid}";
								sock.send("<div class='chat' id = ${myid}>" 
										+ mes + "</div>");
								$("#message").val('').focus();
							});
				});

		var sock = new SockJS("/echo");
		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br>");
			$(".chat_container").scrollTop($(".chat_container")[0].scrollHeight);
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
		}
	</script>
</body>
</html>