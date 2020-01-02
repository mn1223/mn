<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
</script>
<body>
	<form method="post" id="form"
		action="${pageContext.request.contextPath}/First/home">
		<div>
			<label>비밀번호</label> <input type="text" id="mmpwd" name="mmpwd" />
		</div>
		<div style="margin-top: 10px">
			<button type="submit" id="btndeletetry">확인</button>
		</div>
	</form>
</body>
</html>