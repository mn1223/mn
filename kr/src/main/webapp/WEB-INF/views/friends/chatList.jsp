<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.left-box {
  
  float: left;
}
.right-box {
  
  float: right;
}
</style>
</head>
<body>
<div class='left-box'>
	<h2>친구 목록</h2>
	<c:choose>
	
		<c:when test="${empty list}">
			<tr>
				<td colspan="5" align="center">데이터가 없습니다</td>
			</tr>
		</c:when>
		
		<c:when test="${!empty list}">
			<c:forEach var ="list" items="${list}">
				<tr>
					<td>
						<c:out value="${list.mmname}"/>
					</td>
				</tr>
			</c:forEach>			
		</c:when>
	
	</c:choose>
</div>
<div class='right-box'>
	<h2>채팅 목록</h2>
</div>
</body>
</html>