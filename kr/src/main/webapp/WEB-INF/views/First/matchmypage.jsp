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
	$("#eschool").show();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").hide();
	$("#editeschool").hide();
	$("#editmschool").hide();
	$("#edithschool").hide();
	$("#edituschool").hide();
});
function eschool(){
	$("#eschool").show();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").hide();
}

function mschool(){
	$("#eschool").hide();
	$("#mschool").show();
	$("#hschool").hide();
	$("#uschool").hide();
}

function hschool(){
	$("#eschool").hide();
	$("#mschool").hide();
	$("#hschool").show();
	$("#uschool").hide();
}

function uschool(){
	$("#eschool").hide();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").show();
}

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
	
	function editeschoolinfo(){
		$("#eschool").hide();
		$("#editeschool").show();
	}
	function editmschoolinfo(){
		$("#mschool").hide();
		$("#editmschool").show();
	}
	function edithschoolinfo(){
		$("#hschool").hide();
		$("#edithschool").show();
	}
	function edituschoolinfo(){
		$("#uschool").hide();
		$("#edituschool").show();
	}
	


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
<br>
<!-- 학교 정보 입력 form -->



	<input type="button" value ="초등학교" onclick ="eschool()">
	<input type="button" value ="중학교" onclick ="mschool()">
	<input type="button" value ="고등학교" onclick ="hschool()">
	<input type="button" value ="대학교" onclick ="uschool()">
	<form name="form" id="form" role="form" modelAttribute="LoginVO"
		method="post" action="${pageContext.request.contextPath}/saveBoard">
		<div id = "eschool">
			<label>초등학교:</label><c:out value="초등학교"/><br>
			<label>졸업년도:</label><c:out value ="9999년"/><br>
			<button type="button" id="btnschool" onclick="editeschoolinfo()">등록및 수정</button>		
		</div>
		<div id = "editeschool">
			<label>초등학교</label> <input type="text" id="eschool" name="eschool" />
			<button>학교 찾기</button>
			<br>
			<label>초등학교졸업년도</label> <input type="text" id="eschoolgy"
				name="eschoolgy" /><br>
			<button type="button"  onclick="eschooleditcom()">완료</button>	
		</div>
		
		<div id = "mschool">	
			<label>중학교:</label><c:out value="중학교"/><br>
			<label>졸업년도:</label><c:out value ="9999년"/><br>
			<button type="button"  onclick="editmschoolinfo()">등록및 수정</button>			
		</div>
		<div id = "editmschool">
		<label>중학교</label> <input type="text" id="mschool" name="mschool" />
		<button>학교 찾기</button>
		<br>
		<label>졸업년도</label> <input type="text" id="mschoolgy"
				name="mschoolgy" /><br>
		<button type="button"  onclick="mschooleditcom()">완료</button>		
		</div>
		
		<div id = "hschool">	
			<label>고등학교:</label><c:out value="고등학교"/><br>
			<label>졸업년도:</label><c:out value ="9999년"/><br>
			<button type="button"  onclick="edithschoolinfo()">등록및 수정</button>
			
		</div>
		<div id = "edithschool">
		<label>고등학교</label> <input type="text" id="mschool" name="mschool" />
		<button>학교 찾기</button><br>
			<label>졸업년도</label> <input type="text" id="mschoolgy"
				name="mschoolgy" /><br>
		<button type="button" onclick="hschooleditcom()">완료</button>	
		</div>
		
		<div id = "uschool">	
			<label>대학교:</label><c:out value="대학교"/><br>
			<label>입학년도:</label><c:out value ="9999년"/><br>
			<button type="button"  onclick="edituschoolinfo()">등록및 수정</button>	
		</div>
		<div id = "edituschool">
			<label>대학교</label> <input type="text" id="mschool" name="mschool" />
			<button>학교 찾기</button><br>
			<label>입학년도</label> <input type="text" id="mschoolgy"
				name="mschoolgy" /><br>
			<button type="button" onclick="uschooleditcom()">완료</button>
		</div>
	</form>
	<br>
	<button type="button" id="btndelete">회원탈퇴</button>
	<br>
	<hr>
	<br> 1:1문의 및 대학교 인증<br>
	<a href="/board/getBoardListFour">문의게시판 이동</a>
</body>
</html>