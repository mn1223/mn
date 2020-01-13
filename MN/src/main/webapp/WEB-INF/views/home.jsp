<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Home</title>
</head>
<body>
<h1>Home!</h1>

<sec:authorize access="isAnonymous()">
<p><a href="<c:url value="/login/loginForm" />">로그인</a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="로그아웃" />
</form:form>
<a href="/matchmypage">마이페이지(매치메이커)</a>
<a href="/friendmypage">마이페이지(반갑다친구야)</a>
<a href ="/search">친구검색</a>
<a href ="/chatList">채팅 목록</a>
</sec:authorize>


<h3>
    [<a href="<c:url value="/intro/introduction" />">소개 페이지</a>]
    [<a href="<c:url value="/admin/adminHome" />">관리자 홈</a>]
    <sec:authorize access="isAnonymous()">
    [<a href="<c:url value="/signup" />">회원가입</a>] 
    </sec:authorize> 
</h3>
</body>
</html>


