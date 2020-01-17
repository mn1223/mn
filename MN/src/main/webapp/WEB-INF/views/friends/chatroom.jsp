<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<style>
	#${myid}{
	#color : green;
	float:right;
	}
	</style>
</head>
<body>
	<h2>${yourid }</h2>
	<form id="chatForm">
		<input type="text" id="message"/>
		<button>send</button>
	</form>
	<div id="chat">${chatList }</div>
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				var mes = $("#message").val();
				var user = "${myid}";
				sock.send("<span id = ${myid}>"+user+":"+mes+"</span>");
				$("#message").val('').focus();
			});
		});
		
		var sock = new SockJS("/echo");
		sock.onmessage = function(e){
			$("#chat").append(e.data+"<br>"); 
		}
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		
	</script>
</body>
</html>