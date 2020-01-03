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
	<form method="post" name="form" action="${pageContext.request.contextPath}/changenotice" 
	onsubmit="return checkpwd()">
	<div>
		<label>수정할비밀번호</label> <input type="text" id="mmpwd" name="mmpwd" />
	</div>
	<div>
		<label>수정할비밀번호재확인</label> <input type="text" id="re_mmpwd" name="re_mmpwd" />
	</div>
	<p id="pwsame" style="color: red;"></p>
	<button type="submit" id="btnpwchange">확인</button>	
	</form>	
</body>
</html>