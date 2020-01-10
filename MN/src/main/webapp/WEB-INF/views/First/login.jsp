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
/*
$(document).on('click','#btnlogin',function(){
	var pp=$("#mmid").val();
	var id=$("#mmpwd").val();
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
			};
	
	$.ajax({
		headers : headers,
	    type:"POST",
	    data : {"id":pp,"pwd":id},
	    url:"/uu",
	    dataType:"json",
	    success:function(datae){
	    	alert(datae);
	    	
	    	},
	     error : function(error){
	               alert("error : " + error);
	     }
	    	});
});	*/

function grade(){
	
	var pp=$("#mmid").val()+"";
	var id=$("#mmpwd").val()+"";
	alert(pp);
	alert(id);
	
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
	    	alert(data);
	    	
	    	},
	     error : function(error){
	               alert("error : " + error);
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
	<div style="margin-top: 10px">
			<button type="button" id="btnlogin" onclick=grade();>로그인</button>
		</div>
	
	<c:if test="${msg == 'false'}">
		<p style="color:#f00;">로그인에 실패하였습니다.아이디 또는 패스워드를 입력해십시요</p>	
	</c:if>
	<br>
	<a href="/idfind">아이디찾기</a>
	<a href="/pwfind">비밀번호찾기</a>
	<a href="/signupgo">회원가입</a>

</body>
</html>