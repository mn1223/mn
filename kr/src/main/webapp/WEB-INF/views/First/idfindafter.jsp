<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<script>

</script>


<body>
<div>
	<a href="${pageContext.request.contextPath}/">
		<img alt="로고" src="resources/img/logoMain.png" height="200px" width="auto" style="margin-left : 850px;" >
	</a>
		<div id = "friendTrue" style="padding : 50px; margin-left : 380px; width: 1100px; height: 400px; background-color: #FAFAFA; text-align: center;">
		<h1><c:out value="${idfindaftern.mmid}"/></h1>
		    <br/>
		    <br/>
			<a href="/pwfind">비밀번호찾기</a>
		</div>
</div>	
</body>

<style>
html {
	background-color: #F3F3F3;
}
</style>

</html>