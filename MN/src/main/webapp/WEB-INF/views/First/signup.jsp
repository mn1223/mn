<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	/*$(document).on('click', '#btnSignup', function(e){
		e.preventDefault();
		$("#form").submit();
	});*/

	function checkpwd() {
		var mmpwd = document.getElementById("mmpwd").value;
		var re_mmpwd = document.getElementById("re_mmpwd").value;

		if (mmpwd != re_mmpwd) {
			document.getElementById('pwsame').innerHTML = '비밀번호가 틀렸습니다.';
			return false;
		}
	}
	
</script>
<article>
	<form method="post" name="form" onsubmit="return checkpwd()"
		action="${pageContext.request.contextPath}/First/signupcomplete">
		<div>
			<label>이름</label> <input type="text" id="mmname" name="mmname" />
		</div>
		<div>
			<label>아이디</label> <input type="text" id="mmid" name="mmid" />
		</div>
		<div>
			<label>비밀번호</label> <input type="text" id="mmpwd" name="mmpwd" />
		</div>
		<div>
			<label>비밀번호확인</label> <input type="text" id="re_mmpwd"
				name="re_mmpwd" />
		</div>
		<p id="pwsame" style="color: red;"></p>
		<div>
			<label>전화번호</label> <input type="text" id="mmphonenum"
				name="mmphonenum" />
		</div>
		<div>
		<label>성별</label> <input type="radio" name="mmgender" value="남자"checked>남
		<input type="radio" name="mmgender" value="여자" checked>여 
		</div>
		<div>
			<label>질문</label> <input type="text" id="mmq" name="mmq" />
		</div>
		<div>
			<label>질문대답</label> <input type="text" id="mma" name="mma" />
		</div>
		<div style="margin-top: 10px">
			<button type="submit" id="btnSignup">가입하기</button>
		</div>

	</form>

</article>