	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<div>
	<div>	
	<a href="${pageContext.request.contextPath}/">
		<img alt="로고" src="resources/img/logoMain.png" height="200px" width="auto" style="margin-left : 850px;" >
	</a>
	</div>
	<div>
	<img alt="아이디 찾기" src="/resources/img/findId.png" height="50px" width="auto" style="margin-left:400px; margin-top:50px;" >
	</div>
		<div id = "friendTrue" style="padding : 50px; margin-left : 380px; width: 1100px; height: 400px; background-color: #FAFAFA; text-align: center;">
		<form method="post" id="form" action="${pageContext.request.contextPath}/idfindafter">
			
			<div style="font-size: 15pt; margin-top: 70px;">
				<label>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text" id="mmname" name="mmname" placeholder="이름을 입력해주세요."/>
			</div>	
			
			<br/>
			<br/>
			
			<div style="font-size: 15pt;">
				<label>전화번호</label> <input type="text" id="mmphonenum" name="mmphonenum" placeholder="'-'를 빼고 입력해주세요." />
			</div>
			<br/>
			<br/>
			<br/>				
			<button type="submit" id="btnidfind" style="height: 40px; width: 200px;">확인</button>
			<br/>
			<br/>
			<a href="/pwfind">비밀번호 찾기</a>
		</form>
		</div>
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

</style>
</html>