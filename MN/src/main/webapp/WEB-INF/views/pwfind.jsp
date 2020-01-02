<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" id="form"
		action="${pageContext.request.contextPath}/pwchange">
    <div>
		<label>아이디</label> <input type="text" id="mmid" name="mmid"/>
	</div>
	 <div>
		<label>질문</label> <input type="text" id="mmq" name="mmq"/>
	</div>
		<div>
		<label>정답</label> <input type="text" id="mma" name="mma"/>
	</div>
		<button type="submit" id="btnpwfind">확인</button>		
</body>
</html>