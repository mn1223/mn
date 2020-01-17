<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>


<script>
$(document).ready(function(){
	$("#inform").show();
	$("#editform").hide();
	
});

//삭제 버튼 클릭 이벤트
$(document).on('click', '#btndelete', function() {
	var url = "${pageContext.request.contextPath}/delete";
	location.href = url;
});

//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnupdate', function() {
		$("#inform").hide();
		$("#editform").show();
	});	
	
	$(document).on('click', '#btnsave', function() {
		var name = $('#mmname').val();
		var mid = $('#mmid').val();
		var mmpwd = $('#mmpwd').val();
		var mmphonenum = $('#mmphonenum').val();
		var mmgender = $('#mmgender').val();
		
		var paramData = JSON.stringify({
		"mmname" :name,
		"mmid" :mid,
		"mmpwd":mmpwd,
		"mmphonenum": mmphonenum,
		"mmgender":mmgender

		});
		console.log(paramData);		
		var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};		
	
		$.ajax({
			headers : headers,
			type : "POST",
			url : "/ckkkkk",
			data : paramData,	
			success : function(data) {
				console.log(data);
				location.reload();
				alert('성공');			
			},
			error : function(e){
				console.log(e);
				alert('error');
			}		
		});	
	});

</script>
</head>
<body>
	실시간 예약현황
	<br>
	<h2>회원 정보</h2>
<div id="inform">

		<div>
			<label>이름:</label><c:out value="${userInfo.mmname}"/>
		</div>
		<div>
			<label>아이디:</label><c:out value="${userInfo.mmid}"/>
		</div>
		<div>
			<label>비밀번호수정:</label><c:out value="${userInfo.mmpwd}"/>
		</div>
		<div>
			<label>전화번호:</label><c:out value="${userInfo.mmphonenum}"/>
		</div>
		<div>
			<label>성별:</label><c:out value="${userInfo.mmgender}"/>
		</div>
		<button type="button" id="btnupdate">수정하기</button>
</div>

<div id= "editform">
	<label>이름</label> <input type="text" id="mmname" value ="${userInfo.mmname}"/><br>
	<label>아이디</label><input type="text" id="mmid" value="${userInfo.mmid}" readonly="readonly"><br>
	<label>비밀번호수정</label><input type="text" id="mmpwd" value="${userInfo.mmpwd}"><br>
	<label>전화번호</label><input type="text" id="mmphonenum" value="${userInfo.mmphonenum}"><br>
	<label>성별</label><input type="text" id="mmgender" value="${userInfo.mmgender}"><br>
	<button type="submit" id="btnsave">저장하기</button>
</div>

	<br> 회원정보 수정
	<form name="form" id="form" role="form" modelAttribute="LoginVO"
		method="post" action="${pageContext.request.contextPath}/saveBoard">
		<div>
			<label>초등학교</label> <input type="text" id="eschool" name="eschool" />
		</div>
		<div>
			<label>초등학교졸업년도</label> <input type="text" id="eschoolgy"
				name="eschoolgy" />
		</div>
		<br>
		<div>
			<label>중학교</label> <input type="text" id="mschool" name="mschool" />
		</div>
		<div>
			<label>중학교졸업년도</label> <input type="text" id="mschoolgy"
				name="mschoolgy" />
		</div>
		<br>
		<div>
			<label>고등학교</label> <input type="text" id="hschool" name="hschool" />
		</div>
		<div>
			<label>고등학교졸업년도</label> <input type="text" id="hschoolgy"
				name="hschoolgy" />
		</div>
		<br>
		<div>
			<label>대학교</label> <input type="text" id="uschool" name="uschool" />
		</div>
		<div>
			<label>대학교학과</label> <input type="text" id="uschoolma"
				name="uschoolma" />
		</div>
		<div>
			<label>입학년도</label> <input type="text" id="uschooley"
				name="uschooley" />
		</div>
		<div>
			<button type="button" id="btnschool onclick="insert">등록및 수정</button>
		</div>
	</form>

	<button type="button" id="btndelete">회원탈퇴</button>
	<br> 1:1문의 및 대학교 인증
</body>
</html>