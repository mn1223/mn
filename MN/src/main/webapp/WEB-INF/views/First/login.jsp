<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script>


function btnlogin_click(){
	
	var pp=$("#mmid").val()+"";
	var id=$("#mmpwd").val()+"";
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
			};
	
	$.ajax({
		headers : headers,
	    type:"GET",
	    data : {"mmid":pp,"mmpwd":id},
	    url:"/uu",
	    dataType:"text",
	    success:function(data){
	    	if(data=='x'){
	    		alert("탈퇴한 회원입니다.");
	    	}else{
	    		$("#form").submit();
	    	}
	    	},
	     error : function(error){
	    	 
	    	 var ms = "<p style='color:#f00;'>로그인에 실패하였습니다.아이디 또는 패스워드를 입력해십시요</p>";
			$("#error").html(ms);
	     }
	});
}
</script>
</head>
<body>
	<form method="post" id="form"
		action="${pageContext.request.contextPath}/successcommonhome">
		<div>
			<label>아이디</label> <input type="text" id="mmid" name="mmid" />
		</div>
		<div>
			<label>비밀번호</label> <input type="text" id="mmpwd" name="mmpwd" />
		</div>
	</form>
	<div id = "error"></div>
	<div style="margin-top: 10px">
	<button type="button" id="btnlogin" onclick="btnlogin_click();">로그인</button>
		</div>
	
	
	<br>
	<a href="/idfind">아이디찾기</a>
	<a href="/pwfind">비밀번호찾기</a>
	<a href="/signupgo">회원가입</a>

</body>
</html>