<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

div.logo {
	height: 1.35rem;
	text-align: center;
	font-size: 0.6rem;
	line-height: 1.35rem;
	width: 100%;
}
</style>
</head>
<body>
<div class="logo">
						로고
						<!-- <img alt="로고" src=""> -->
</div>
	<h1>반갑다친구야 메인</h1>
	<header>
		<table>
			<sec:authorize access="isAnonymous()">
				<tr>
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a href="/login/loginForm">로그인</a></td>
					<td><a href="/signup">회원가입</a></td>
					<td><a href="/friendmypage">마이페이지</a></td>
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
						
				<c:set var="name" value="${admin }" />

				<c:choose>
					<c:when test="${name eq 'admin@naver.com'}">
        				<tr>
						<a href="/matchmaker/managermain">관리자 페이지</a>
						</tr>
   	 				</c:when>

					<c:otherwise>
     						 <tr><a href="/friendmypage">마이 페이지</a>	</tr>
					 </c:otherwise>
				</c:choose>
			</sec:authorize>
		</table>
	</header>
	<a href = "/search">친구 찾기</a>
	<a href = "/chatList">채팅 목록</a>
	<a href = "/board/getBoardListFive">Q&A</a>

</body>
</html>