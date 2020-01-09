<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>

</head>
<body>
<a href="/signup">회원가입</a>
<a href="/login">로그인</a>

<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06884d874f22537ddf2013c3781a3bbb"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.4388406, 126.6729244),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

</body>
</html>
