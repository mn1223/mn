<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<form method="post" id="form"
		action="${pageContext.request.contextPath}/idfindafter">
	<div>
		<label>이름</label> <input type="text" id="mmname" name="mmname"/>
	</div>
	<div>
		<label>전화번호</label> <input type="text" id="mmphonenum" name="mmphonenum" />
	</div>
	<button type="submit" id="btnidfind">확인</button>
	<br>
	<a href="/pwfind">비밀번호 찾기</a>
</body>
</html>