<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반갑다친구야 : 친구록</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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


				html += '<th style="font-size:20px;"><input type="button" onclick=getFInfo("'+this.yourid+'") data-toggle="modal" data-target="#myModal" value="'+this.mmname+'"></input><th>';
				html += '<th><button onclick = deleteFriendFalse("'+this.myid+'","'+this.yourid+'","T") style="margin-left:230px; padding: 5px;">친구 삭제</button><th>';

				html += '<th><button onclick = gochat("'+this.yourid+'","'+this.mmname+'") style="margin-left:10px; padding: 5px;">채팅 하기</button><th>' 
				html += '</tr>';
				

			});
			$("#friendTrue").html(html);
		},
		
		error : function(e){
			alert(e);
		}
	});
	
}


function gochat(yourid,mmname){
	location.href = "/chating?myid=${myid}&yourid="+yourid+"&mmname="+mmname;
}
function getFInfo(yourid){
	
	
	$.ajax({
		type:"GET",
		url:"/getInfo",
		data:{"yourid":yourid},
		dataType:"json",
		success:function(data){
			var html ="";
			html+='<th>'+data.eschool+'</th>';
			html+='<th>'+data.mschool+'</th>'; 
			html+='<th>'+data.hschool+'</th>';
			html+='<th>'+data.uschool+'</th>';
			$("#schoolInfo").html(html); 
		},
		error:function(e){
			alert(e);
		}
	});
	
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

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
       	<table>
       		<thead id = "schoolInfo">  
       		 
       		</thead>
       	</table>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick ="sendSchool()"data-dismiss="modal">Save changes</button>
      </div>
    </div>
  </div>
</div>
 

</body>
</html>