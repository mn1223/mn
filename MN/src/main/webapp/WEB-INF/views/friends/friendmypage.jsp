<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	showFriendListFalse();
	showFriendListTrue();
	showMyFriendListFalse()
});

function showMyFriendListFalse(){
	var myid = $("#myid").val();
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		url : "/getMyFriendFalse",
		headers : headers,
		type : "GET",
		data : {"myid":myid},
		dataType : "json",
		success : function(data){
			var html = "";
			$(data).each(function(){
				html += '<tr>';
				html += '<th>'+this.mmname+'<th>';
				html += '<th><button onclick =addFriend()>요청 삭제</button><th>'
				html += '<tr>';
			});
			$("#myfriendFalse").html(html);
		},
		error : function(e){
			alert(e);
		}				
	});
	
}

function showFriendListFalse(){
	var myid = $("#myid").val();
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		url : "/getFriendFalse",
		headers : headers,
		type : "GET",
		data : {"myid":myid},
		dataType : "json",
		success : function(data){
			var html = "";
			$(data).each(function(){
				html += '<tr>';
				html += '<th>'+this.mmname+'<th>';
				html += '<th><button onclick =addFriend("'+this.myid+'","'+this.yourid+'")>친구 추가</button><th>'
				html += '<tr>';
			});
			$("#friendFalse").html(html);
		},
		error : function(e){
			alert(e);
		}				
	});
	
}

function addFriend(myid,yourid){
	var myid = myid;
	var yourid = yourid;
	
	var paramData = JSON.stringify({
		"myid" : myid,
		"yourid" : yourid	
	});
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		url : "/addFriendTrue",
		headers : headers,
		data : {"myid":myid,"yourid":yourid},
		dataType : "json",
		type : "GET",
		success : function(mes){
			alert("친구 등록 완료!!!!!");
			location.reload();
		},
		error : function(e){
			alert(e);
		}
		
	});
	
}

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
				html += '<th><button>친구 삭제</button><th>';
				html += '<tr>';
			});
			$("#friendTrue").html(html);
		},
		
		error : function(e){
			alert(e);
		}
	});
	
}


</script>
</head>
<body>
<h2>마이페이지(반갑다 친구야)</h2>
<input type="hidden" id = "myid" value="${myid}">

<h3>받은 친구요청 리스트</h3>
<div id = "friendFalse">친구 요청
</div>

<h3>나의 친구요청 리스트</h3>
<div id = "myfriendFalse">친구 요청
</div>

<h3>친구 리스트</h3>
<div id = "friendTrue">친구 목록
</div>

</body>
</html>