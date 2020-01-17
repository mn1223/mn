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
						</form:form>
					</tr>


					<div class="logo">
						로고
						<!-- <img alt="로고" src=""> -->
					</div>
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a href="/managermain"></a></td>
			
			</sec:authorize>
			</table>
		</header>
		<div class="main">
			<button style="cursor: pointer;" onclick="location.href='/mmmain'">
				<img alt="매치 메이커" src="resources/img/matchmaker.png"> <br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />메치 메이커<br />(페이지 이동)
			</button>
			<button style="cursor: pointer;" onclick="location.href='/nfmain'">
				<img alt="반갑다 친구야" src="resources/img/nicemeetyou.png"> <br />반갑다
				친구야<br />(페이지 이동)
			</button>
		</div>
		<footer>
			<table>
				<tr>
					<td><a>회사소개</a></td>
					<td><a>개인정보취급방침</a></td>
					<td><a>서비스약관</a></td>
					<td><a>제휴문의</a></td>
					<td><a>이메일수집거부</a></td>
					<td></td>
				</tr>
				<tr>
					<td><a>로고</a></td>
					<td><a>주소</a><br /> <a>카피라이트</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</footer>
	</div>
</body>
</html>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: 0;
	background: none;
	color: inherit;
}

table {
	border-spacing: 0
}

body {
	background: white;
}

html {
	font-size: 100px
}

div.base {
	width: 8.4rem;
	min-height: 100%;
	position: absolute;
	top: 0;
	left: 50%;
	transform: translate(-50%);
	background: white;
}

div.base div.main button:first-child {
	float: left;
}

div.base div.main button:nth-child(2) {
	float: right;
}

div.base div.main button {
	background: #2EFEF7;
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

footer
 
table
 
tr
 
td
:not
 
(
:last-child
 
){
width
:
 
12%;
font-size
:
 
0
.12rem
;


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