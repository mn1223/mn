<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href = "board/getBoardList">게시판</a>
<!--  
<a href = "board/addBoard">게시판추가</a> -->
<a href = "menu/getMenu">게시판</a>

</body>
</html>