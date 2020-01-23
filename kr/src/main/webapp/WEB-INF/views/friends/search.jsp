<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반갑다 친구야 : 친구찾기</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
 
<script>

$(document).ready(function() {
	$("#es").show();
	$("#ms").hide();
	$("#hs").hide();
	$("#us").hide();
	$("#oschoolTable").show();
	$("#uschoolTable").hide();
});

function esc(){
	$("#es").show();
	$("#ms").hide();
	$("#hs").hide();
	$("#us").hide();
	$("#oschoolTable").show();
	$("#uschoolTable").hide();
}

function msc(){
	$("#es").hide();
	$("#ms").show();
	$("#hs").hide();
	$("#us").hide();
	$("#oschoolTable").show();
	$("#uschoolTable").hide();
}

function hsc(){
	$("#es").hide();
	$("#ms").hide();
	$("#hs").show();
	$("#us").hide();
	$("#oschoolTable").show();
	$("#uschoolTable").hide();
}

function usc(){
	$("#es").hide();
	$("#ms").hide();
	$("#hs").hide();
	$("#us").show();
	$("#oschoolTable").hide();
	$("#uschoolTable").show();
}


$(document).on('click', '#btnSearch1', function() {	
	var name = $('#mmname').val();
	var eschool = $('#eschool').val();
	var eschoolgy = $('#eschoolgy').val();
	var searchType = $('#searchType').val();
	
	if(name == '' && eschool == '' && eschoolgy == '' ){
		alert("검색어 입력 바람");
		
	}
	
	else{
	var paramData = JSON.stringify({
		"mmname" : name,
		"eschool" : eschool,
		"eschoolgy" : eschoolgy,
		"searchType" : searchType
	});
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		headers : headers,
		type : "POST",
		url : "/searchData1",
		data : paramData,
		dataType : "json",
		success : function(data){
			console.log(data);
			var html = "";			
			$(data).each(function(){	
				html += '<tr style="text-align:center;">';
				html += '<th style="width: 100px">'+this.mmname+'</th>';
				html += '<th style="width: 200px">'+this.eschool+'</th>';
				html += '<th style="width: 200px">'+this.eschoolgy+'</th>';
				html += '<th style="width: 150px">'+this.mmgender+'</th>';
				html += '<th><button onclick=friends_judge("'+ this.scmmid +'");>친구추가</button></th>';
				html += '</tr>';
			});//each end			
			$("#result").html(html);
		},
		error : function(e){
			alert("에러");
		}		
	});	
	}
});



function friends_judge(scmmid){
	var yourid = scmmid;
	var num = 0;
	var id = $('#loginId').val();
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		headers : headers,
		type : "GET",
		url : "/judgeFriend",
		data : {"myid" : id},
		dataType : "json",
		success : function(data){			
			$(data).each(function(){
				if(yourid == this.yourid || id == yourid){
					num++;					
				}else{
					
				}
			});
			//친구 유무 판단 후 작업 (num == 0 : 친구 등록/num!=0 : 친구 등록 X)
			if(num==0){
				alert("친구 등록 진행");
				friends_add(yourid);
			}else{
				alert("이미 등록된 친구 또는 자신 입니다.");
			}
		},
		error : function(e){
			alert(e);
		}		
	});
}

function friends_add(yourid){
	
	$.ajax({
		url : "/addFriend",
		type : "GET",
		dataType : "text",
		data : {"yourid" : yourid},
		success : function(result){
			alert("친구신청 완료!!!!");
		},
		error : function(e){
			alert(e);
		}
		
		
	});
	
}



$(document).on('click', '#btnSearch2', function() {	
	var name = $('#mmname2').val();
	var mschool = $('#mschool').val();
	var mschoolgy = $('#mschoolgy').val();
	var searchType = $('#searchType2').val();
	
	if(name == '' && mschool == '' && mschoolgy == '' ){
		alert("검색어 입력 바람");
		
	}
	else{
	var paramData = JSON.stringify({
		"mmname" : name,
		"mschool" : mschool,
		"mschoolgy" : mschoolgy,
		"searchType" : searchType
	});
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		headers : headers,
		type : "POST",
		url : "/searchData1",
		data : paramData,
		dataType : "json",
		success : function(data){			
			var html = "";			
			$(data).each(function(){
				html += '<tr style="text-align:center; ">';
				html += '<th style="width: 100px;"">'+this.mmname+'</th>';
				html += '<th style="width: 200px">'+this.mschool+'</th>';
				html += '<th style="width: 200px">'+this.mschoolgy+'</th>';
				html += '<th style="width: 150px">'+this.mmgender+'</th>';
				html += '<th><button onclick=friends_judge("'+ this.scmmid +'");>친구추가</button></th>';
				html += '</tr>';
			});//each end			
			$("#result").html(html);
		},
		error : function(e){
			alert(e);
		}		
	});
	}
});

$(document).on('click', '#btnSearch3', function() {	
	var name = $('#mmname3').val();
	var hschool = $('#hschool').val();
	var hschoolgy = $('#hschoolgy').val();
	var searchType = $('#searchType3').val();
	
	if(name == '' && hschool == '' && hschoolgy == '' ){
		alert("검색어 입력 바람");
		} 
	
	else{
	
	var paramData = JSON.stringify({
		"mmname" : name,
		"hschool" : hschool,
		"hschoolgy" : hschoolgy,
		"searchType" : searchType
	});
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		headers : headers,
		type : "POST",
		url : "/searchData1",
		data : paramData,
		dataType : "json",
		success : function(data){			
			var html = "";			
			$(data).each(function(){				
				html += '<tr style="text-align:center; ">';
				html += '<th style="width: 100px;"">'+this.mmname+'</th>';
				html += '<th style="width: 200px">'+this.hschool+'</th>';
				html += '<th style="width: 200px">'+this.hschoolgy+'</th>';
				html += '<th style="width: 150px">'+this.mmgender+'</th>';
				html += '<th><button onclick=friends_judge("'+ this.scmmid +'");>친구추가</button></th>';
				html += '</tr>';						
			});//each end			
			$("#result").html(html);
		},
		error : function(e){
			alert(e);
		}		
	});
	}
});

$(document).on('click', '#btnSearch4', function() {	
	var name = $('#mmname4').val();
	var uschool = $('#uschool').val();
	var uschooley = $('#uschooley').val();
	var searchType = $('#searchType4').val();
	var uschoolma = $('#uschoolma').val();
	
	if(name == '' && uschool == '' && uschooley == '' && uschoolma == '' ){
		alert("검색어 입력 바람");		
	}
	
	else{
	
	var paramData = JSON.stringify({
		"mmname" : name,
		"uschool" : uschool,
		"uschooley" : uschooley,
		"searchType" : searchType,
		"uschoolma" : uschoolma
	});
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};
	
	$.ajax({
		headers : headers,
		type : "POST",
		url : "/searchData1",
		data : paramData,
		dataType : "json",
		success : function(data){			
			var html = "";			
			$(data).each(function(){
				html += '<tr style="text-align:center; ">';
				html += '<th style="width: 100px;"">'+this.mmname+'</th>';
				html += '<th style="width: 200px">'+this.uschool+'</th>';
				html += '<th style="width: 200px">'+this.uschooley+'</th>';
				html += '<th style="width: 150px">'+this.mmgender+'</th>';
				html += '<th><button onclick=friends_judge("'+ this.scmmid +'");>친구추가</button></th>';
				html += '</tr>';
			});//each end			
			$("#result").html(html);
		},
		error : function(e){
			alert(e);
		}		
	});
	}
});

</script>

<style>
input {
	padding : 5px;
	text-align : center;
}

p {
	float: left;
}


</style>
</head>

<body>
<img alt="친구 찾기" src="/resources/img/fs.png" height="50px" width="auto" style="margin-left:380px; margin-top:10px;" >
<div style="padding : 50px; margin-left : 380px; width: 1100px; height: 565px; background-color: #FAFAFA; ">
	<div>
	
	</div>
	<div>
	<input type="button" value ="초등학교 동창" onclick ="esc()" style="margin-right: 20px;">
	<input type="button" value ="중학교 동창" onclick ="msc()" style="margin-right: 20px;">
	<input type="button" value ="고등학교 동창" onclick ="hsc()" style="margin-right: 20px;">
	<input type="button" value ="대학교 동창" onclick ="usc()" style="margin-right: 20px;">
	<input type="hidden" id = loginId value = ${id}>
	</div>
	<br/>
	<br/>		
	<div id = "es">
			<h2>초등학교 검색</h2>
			<div>
				 <input type ="text" name ="mmname" id ="mmname" placeholder="이름을 입력해 주세요" style="height:auto; width: 200px;">
				 <input type ="text" name ="eschool" id = "eschool" placeholder="초등학교를 입력해 주세요" style="height:auto; width: 250px;">
				 <input type ="text" name ="eschoolgy" id = "eschoolgy" placeholder="졸업년도 입력해 주세요" style="height:auto; width: 250px;">		 
				 <input type ="hidden" name ="searchType" id = "searchType" value="es">
				 <button type="button" id="btnSearch1" style="margin-left: 10px; padding: 10px; font-size: 18px;">검색</button>
			</div>
	</div>
	<div id = "ms">
			<h2>중학교 검색</h2>
			<div >
				 <input type ="text" name ="mmname2" id ="mmname2" placeholder="이름을 입력해 주세요" style="height:auto; width: 250px;">
				 <input type ="text" name ="mschool" id = "mschool" placeholder="중학교를 입력해 주세요" style="height:auto; width: 250px;">
				 <input type ="text" name ="mschoolgy" id = "mschoolgy" placeholder="졸업년도 입력해 주세요" style="height:auto; width: 250px;">		 
				 <input type ="hidden" name ="searchType2" id = "searchType2" value="ms">
				 <button type="button" id="btnSearch2" style="margin-left: 10px; padding: 10px; font-size: 18px;">검색</button>
			</div>
	</div>
	<div id = "hs">
			<h2>고등학교 검색</h2>
			<div >
				 <input type ="text" name ="mmname3" id ="mmname3" placeholder="이름을 입력해 주세요" style="height:auto; width: 250px;">
				 <input type ="text" name ="hschool" id = "hschool" placeholder="고등학교를 입력해 주세요" style="height:auto; width: 250px;">
				 <input type ="text" name ="hschoolgy" id = "hschoolgy" placeholder="졸업년도 입력해 주세요" style="height:auto; width: 250px;">		 
				 <input type ="hidden" name ="searchType3" id = "searchType3" value="hs">
				 <button type="button" id="btnSearch3" style="margin-left: 10px; padding: 10px; font-size: 18px;">검색</button>
			</div>
	</div>
	<div id = "us">
			<h2>대학교 검색</h2>
			<div >
				 <input type ="text" name ="mmname4" id ="mmname4" placeholder="이름을 입력해 주세요" style="height:auto; width: 200px;">
				 <input type ="text" name ="uschool" id = "uschool" placeholder="대학교를 입력해 주세요" style="height:auto; width: 200px;">
				 <input type ="text" name ="uschoolma" id = "uschoolma" placeholder="학과를 입력해 주세요" style="height:auto; width: 200px;">
				 <input type ="text" name ="uschooley" id = "uschooley" placeholder="입학년도 입력해 주세요" style="height:auto; width: 200px;">
				 <input type ="hidden" name ="searchType4" id = "searchType4" value="us">
				 <button type="button" id="btnSearch4" style="margin-left: 10px; padding: 10px; font-size: 18px;">검색</button>
			</div>
	</div>
	
	<div>
	<br/>	
		<table >
			<thead id="uschoolTable">
				<tr style="text-align:center;">
					<th style="width: 50px;">이름</th>
					<th style="width: 100px;">학교</th>
					<th style="width: 100px;">입학년도</th>
					<th style="width: 100px;">성별</th>
					<th style="width: 150px;">친구추가하기</th>							
				</tr>
			</thead>	
			<thead id="oschoolTable">
				<tr style="text-align:center;">
					<th style="width: 50px;">이름</th>
					<th style="width: 100px;">학교</th>
					<th style="width: 100px;">졸업년도</th>
					<th style="width: 100px;">성별</th>
					<th style="width: 150px;">친구추가하기</th>							
				</tr>
			</thead>		
			<tbody id ="result"></tbody>
		</table>
		
	</div>
</div>
</body>
<style>

</style>

</html>