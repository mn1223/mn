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
	$('#box2').change(function(){
     	$('#mmq').val($(this).val());
    	$('#mmq').attr("readonly");
	});
});

function aaaa(){
	var a = $("#mmid").val();	
	$("#form").submit();
};

</script>
</head>
<body>
<div>
	<div>	
		<a href="${pageContext.request.contextPath}/">
			<img alt="로고" src="resources/img/logoMain.png" height="200px" width="auto" style="margin-left : 850px;" >
		</a>
	</div>
		<div>
			<img alt="비밀번호 찾기" src="/resources/img/findPw.png" height="50px" width="auto" style="margin-left:400px; margin-top:50px;" >
		</div>	
		
		
		<form method="GET" id="form" action="${pageContext.request.contextPath}/pwchange">
		  <div id = "friendTrue" style="padding : 50px; margin-left : 380px; width: 1100px; height: 400px; background-color: #FAFAFA; text-align: center;">
		  
		    <div style="font-size: 15pt; margin-top: 30px;">
				<label>아이디&nbsp;&nbsp;</label> <input type="text" id="mmid" name="mmid"/>
			</div>
			
			 <div style="font-size: 15pt; margin-top: 30px;">
				<label>질문&nbsp;&nbsp;&nbsp;&nbsp;</label> 
				<select id="mmq" name="mmq" >
					         <option value="어디서 태어났습니까?" selected="selected">어디서 태어났습니까?</option>
		                     <option value="가장 애정하는 물품은?" >가장 애정하는 물품은?</option>
		                     <option value="좋아하는 노래는?">좋아하는 노래는?</option>
		               </select>
			</div>
				<div style="font-size: 15pt; margin-top: 30px;">
				<label>정답&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text" id="mma" name="mma"/>
			</div>
				
				<br/>
				<br/>
				<button type="button" id="btnpwfind" onclick = aaaa(); style="height: 40px; width: 200px; font-size: 20px;">확인</button>
				
		</div>	
		</form>
</div>		
</body>
<style>
html {
	background-color: #F3F3F3;
}

input {
	height : 25px;
	width : 200px;
	text-align : center;
	font-size : 15px;
}

option, select {
	height : 25px;
	width : 200px;
	text-align : center;
	font-size : 15px;	
}
</style>

</html>