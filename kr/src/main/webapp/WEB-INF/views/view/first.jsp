<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="/resources/fontawesome/js/all.js"></script>
<link rel="stylesheet" href="/resources/css/default.css" type="text/css">
<title>1번째</title>
</head>
<body>
	<div class="base">
		<header>
			<table>
				<sec:authorize access="isAnonymous()">
					<tr>
						<td><a style="visibility: hidden;">공간띄기</a></td>
						<td><a style="visibility: hidden;">공간띄기</a></td>
						<td><a href="/login/loginForm">로그인</a></td>
						<td><a href="/signup">회원가입</a></td>
					</tr>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<tr>
						<form:form action="${pageContext.request.contextPath}/logout"
							method="POST">
							<td><a style="visibility: hidden;">공간띄기</a></td>
							<td><a style="visibility: hidden;">공간띄기</a></td>
							<td><input type="submit" value="로그아웃" /></td>
							<td><a href="/matchmaker/managermain">관리자 페이지</a></td>
						</form:form>
					</tr>
				</sec:authorize>
			</table>
			<div class="logo">
						로고
						<!-- <img alt="로고" src=""> -->
					</div>
		</header>
		<div class="main">
			<button style="cursor: pointer;" onclick="location.href='/mmmain'">
				<div style="height:178px;position:relative;">
				<img alt="매치 메이커" src="resources/img/matchmaker.png" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%)"> <br />
				</div>
				메치 메이커<br />
				(페이지 이동)
			</button>
			<button style="cursor: pointer;" onclick="location.href='/nfmain'">
				<div style="height:178px;position:relative;">
				<img alt="반갑다 친구야" src="resources/img/nicemeetyou.png" style="height:178px;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%)">
				</div>
				반갑다 친구야<br />
				(페이지 이동)
			</button>
		</div>
		<jsp:include page="/WEB-INF/views/view/footer.jsp"></jsp:include>
	</div>
</body>
</html>
<style>


div.base div.main button:first-child {
	float: left;
}

div.base div.main button:nth-child(2) {
	float: right;
}

div.base div.main button {
	background: #eee;
	border:1px solid #bbb;
	box-shadow: 0 0 11px 5px rgba(0,0,0,0.07);
	width: 4.06rem;
	height: 5.90rem;
	margin: 0.25rem 0 1.65rem 0;
}

header {
	text-align: right;
	height: 1.6rem;
	width: 100%;
}

header table {
	height: 0.25rem;
	width: 28%;
	font-size: 0.12rem;
	line-height: 0.25rem;
	margin-left: 72%;
}

header div.logo {
	height: 1.35rem;
	text-align: center;
	font-size: 0.6rem;
	line-height: 1.35rem;
	width: 100%;
}

</style>