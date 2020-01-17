<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <%@ page session="false" %> -->
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-ko_KR.min.js"></script>
<script src="/js/javascript.js"></script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<h1>관리자 페이지(매치 메이커 공통)</h1>
	<h2>회원관리</h2><a href="/">홈으로</a>
	<p />
	회원 검색(회원이름 및 아이디) :
	<input type="text" name="name" id="sid"><button type="button" id="view">확인</button>

	<br />
	<br />
	<h2>Member List</h2>
	<table border="1">
		<colgroup>
			<col style="width: 15%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>회원이름</th>
				<th>회원아이디</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>회원등급(인증여부)</th>
				<th>수정 완료</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="status">
				<tr id="${status.index}">
					<td>${list.mmname}</td>
					<td>${list.mmid}</td>
					<td>${list.mmgender}</td>
					<td>${list.mmphonenum}</td>
					<td><fmt:formatDate value="${list.mmdate}" pattern="yy.MM.dd" /></td>
					<td><select class="grade" id="grade${status.index}">
  							<option value="Y">인증O</option>
  							<option value="N">인증X</option>
						</select></td>
						
						<script>
						var grade = "${list.mmgrade}";
						if(grade!='N'){
							$("#grade${status.index} option:first-child").attr("selected","selected");
						}else{
							$("#grade${status.index} option:last-child").attr("selected","selected");
						}
						$('#grade${status.index}').selectpicker();
						</script>
						
					<td><button type="button">수정</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>


</script>
</html>