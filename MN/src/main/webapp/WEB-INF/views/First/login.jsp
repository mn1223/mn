<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div style="margin-top: 10px">
			<button type="submit" id="btnlogin">로그인</button>
		</div>
	</form>
	
	<c:if test="${msg == 'false'}">
		<p style="color:#f00;">로그인에 실패하였습니다.아이디 또는 패스워드를 입력해십시요</p>	
	</c:if>
	<br>
	<a href="/idfind">아이디찾기</a>
	<a href="/pwfind">비밀번호찾기</a>
	<a href="/signupgo">회원가입</a>

</body>
</html>