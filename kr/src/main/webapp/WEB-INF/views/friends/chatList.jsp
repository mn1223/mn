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
				html += '<th>'+this.mmname+'<th>';
				html += '<th><button onclick = deleteFriendFalse("'+this.myid+'","'+this.yourid+'","T")>친구 삭제</button><th>';
				html += '<th><button onclick = gochat("'+this.yourid+'")>채팅 하기</button><th>' 
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

</head>
<body>
<input type="hidden" id = "myid" value="${myid}">
<div id ="friendTrue">


</div>

</body>
</html>