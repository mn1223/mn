<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p>
    <a href="/board/getBoardListOne">1. 공지사항(매치메이커)</a><br/>    
    <a href="/board/getBoardListTwo">2. 후기(매치메이커)</a><br/>
    <a href="/board/getBoardListThree">3. Q/A(매치메이커)</a><br/>
    <a href="/board/getBoardListFour">4. 1:1문의(매치메이커)</a><br/><br/><br/>
    <a href="/board/getBoardListFive">5. Q/A(반갑다친구야)</a><br/>
    <a href="/board/getBoardListSix">6. 1:1문의(반갑다친구야)</a><br/>
</p>
</body>
</html>