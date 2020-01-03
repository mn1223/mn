<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 

<script>
//수정 버튼 클릭 이벤트
$(document).on('click','#btnupdate',function(){
	var url = "${pageContext.request.contextPath}/editForm";
	url = url + "?bno=" + $
	{
		boardContent.bno
	}
	;
	url = url + "&mode=edit";
	location.href = url;
});

//삭제 버튼 클릭 이벤트
$(document).on('click','#btndelete', function() {
	var url = "${pageContext.request.contextPath}/delete";
	location.href = url;
});
</script>
</head>
<body>
실시간 예약현황
<form>
</form>
<br>
회원정보 수정
<form>
	<div class="board_title">
		<c:out value="${LoginVO.mmname}" />
	</div>
				
<button type="button" id="btnupdate">수정하기</button>
</form> <button type="button" id="btndelete">회원탈퇴</button>
<br>
1:1문의 및 대학교 인증
</body>
</html>