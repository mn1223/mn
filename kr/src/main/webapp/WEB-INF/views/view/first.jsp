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
	<div>
	<img alt="메인 페이지" src="resources/img/mainPage.png" height="800px" width="auto" style="margin-top: 90px; float:left;">
	<img alt="메인 페이지" src="resources/img/mainPage.png" height="800px" width="auto" style="margin-top: 90px; margin-left: 270px; float:left;">	
	</div>	
	
	<div class="base" style="opacity : 0.95;">
		<header>
			<table>
				<sec:authorize access="isAnonymous()">
					<tr>
						<td><a style="visibility: hidden;">공간띄기</a></td>
						<td><a style="visibility: hidden;">공간띄기</a></td>
						
						<!-- <td><a href="/login/loginForm">로그인</a></td> -->
						<!-- <td><a href="/signup">회원가입</a></td> -->
						
						<td>
						<button id="login" type="button" onclick="location.href='${pageContext.request.contextPath}/login/loginForm'">로그인</button>
						</td>						
						<td><button id="signUp" type="button" onclick="location.href='${pageContext.request.contextPath}/signup'">회원가입</button></td>
					</tr>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<tr>
						<form:form action="${pageContext.request.contextPath}/logout" method="POST">

							<td><a style="visibility: hidden;">공간띄기</a></td>	
							<td><a style="visibility: hidden;">공간띄기</a></td>						
							<td>
							<!-- <input type="submit" value="로그아웃" /> -->
							<button id="logout" type="button" onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
							</td>
							<!-- <td><a href="/matchmaker/managermain">관리자 페이지</a></td> -->		

						</form:form>
					</tr>
				</sec:authorize>
			</table>
				<div class="logo">
					<img alt="로고" src="resources/img/logoMain.png" height="200px" width="auto">
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
#login{
	border: 1px solid #fff;
	background-color: #00B4DB;
	color: #fff;
	padding: 5px;	
	margin-top: 2px;
}

#signUp{
	border: 1px solid #fff;
	background-color: #00B4DB;
	color: #fff;
	padding: 5px;
	margin-top: 2px;
}

#logout{
	border: 1px solid #fff;
	background-color: #00B4DB;
	color: #fff;
	padding: 5px;
	margin-top: 2px;
}

#myPage{
	border: 1px solid #fff;
	background-color: #00B4DB;
	color: #fff;
	padding: 5px;
	margin-top: 2px;
}

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


footer table {
	position: absolute;
	top: 50%;
	left: 0;
	transform: translate(0, -50%);
	width: 100%;
	height: 80%;
}

footer table tr td:last-child {
	width: 40%;
}

footer table tr td:not(:last-child){
width:12%;
font-size: 0.12rem;
}

footer table tr:first-child td:not (:last-child ), footer table tr:nth-child(2) td:first-child
	{
	text-align: center;
}

footer table tr td {
	border-top: 1px solid black;
}

footer table tr:nth-child(2) td {
	border-bottom: 1px solid black;
}

footer {
	position: absolute;
	bottom: 0;
	height: 1.4rem;
	width: 100%;
}

</style>