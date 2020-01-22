<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	showFriendListTrue();
});

function showFriendListTrue(){
	var myid = $("#myid").val();
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		url : "/getFriendTrue",
		headers : headers,
		data : {"myid":myid},
		dataType:"json",
		type : "GET",
		success: function(data){
			var html = "";
			$(data).each(function(){
				html += '<tr>';
				html += '<th style="font-size:20px;">'+this.mmname+'<th>';
				html += '<th><button onclick = deleteFriendFalse("'+this.myid+'","'+this.yourid+'","T") style="margin-left:230px; padding: 5px;">친구 삭제</button><th>';
				html += '<th><button onclick = gochat("'+this.yourid+'") style="margin-left:10px; padding: 5px;">채팅 하기</button><th>' 
				html += '<tr>';
			});
			$("#friendTrue").html(html);
		},
		
		error : function(e){
			alert(e);
		}
	});
	
}


function gochat(yourid){
	location.href = "/chating?myid=${myid}&yourid="+yourid;
}



</script>

<style>
button {	
	border: 1px solid #368AFF;
	background-color: #FAFAFA;
	color: #368AFF;
	padding: 5px;
	font-size : 15px;
}

button:hover{
	color:#fff;
	background:#2478FF;	
}
</style>

</head>
<body>
<img alt="친구 리스트" src="/resources/img/whiteList.png" height="60px" width="auto" style="margin-left:380px; margin-top:50px;" >
<div id = "friendTrue" style="padding : 50px; margin-left : 380px; width: 1100px; height: 565px; background-color: #FAFAFA; ">
친구 목록

<input type="hidden" id = "myid" value="${myid}">
<div id ="friendTrue">


</div>
</div>

</body>
</html>