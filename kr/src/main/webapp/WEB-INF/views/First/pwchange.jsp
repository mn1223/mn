<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkpwd() {
		var mmpwd = document.getElementById("mmpwd").value;
		var re_mmpwd = document.getElementById("re_mmpwd").value;
	
		if (mmpwd != re_mmpwd) {
			document.getElementById('pwsame').innerHTML = '비밀번호가 일치하지않습니다.';
			return false;
		}
  }
</script>
<body>
	<a href="${pageContext.request.contextPath}/">
		<img alt="로고" src="resources/img/logoMain.png" height="200px" width="auto" style="margin-left : 850px;" >
	</a>
	<div>
		<div id = "pwChange" style="padding : 50px; margin-left : 380px; width: 1100px; height: 400px; background-color: #FAFAFA; text-align: center;">
			<form method="post" name="form" action="${pageContext.request.contextPath}/changenotice" 
			onsubmit="return checkpwd()">
			<div style="margin-top: 100px;">
				<label>수정할비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="password" id="mmpwd" name="mmpwd" />
			</div>
			
			<br/>
			<br/>
			
			<div>
				<label>수정할비밀번호재확인</label> <input type="password" id="re_mmpwd" name="re_mmpwd" />
			</div>
			<p id="pwsame" style="color: red;"></p>
			<br/>
			<br/>
			<button type="submit" id="btnpwchange" style="height: 40px; width: 200px; font-size: 20px;">확인</button>	
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

label {
	font-size : 20px;
	font-weight : bold;
}

</style>
</html>