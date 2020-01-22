<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>
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

div.base {
	width: 68.6rem;
	position: absolute;
	top: 210px;
	left: 50%;
	transform: translate(-50%);
}

ul,li{list-style:none;}
.slide{height: 600px; overflow: hidden; position: relative;}
.slide ul{width:calc(100% *4); display: flex; animation:slide 8s infinite;}
.slide li{width:calc(100% /4); height: 600px;}
.slide li:nth-child(1){background-image: url("/resources/img/slider5.png");}
.slide li:nth-child(2){background-image: url("/resources/img/slider6.png");}
.slide li:nth-child(3){background-image: url("/resources/img/slider7.png");}
.slide li:nth-child(4){background-image: url("/resources/img/slider8.png");}
.slide input{display:none;}
.slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
.slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
 @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
}
/* 슬라이드 조작 */
#pos1:checked ~ ul{margin-left:0;}
#pos2:checked ~ ul{margin-left:-100%;}
#pos3:checked ~ ul{margin-left:-200%;}
#pos4:checked ~ ul{margin-left:-300%;}
/* bullet 조작 */
#pos1:checked ~ .bullet label:nth-child(1),
#pos2:checked ~ .bullet label:nth-child(2),
#pos3:checked ~ .bullet label:nth-child(3),
#pos4:checked ~ .bullet label:nth-child(4){background:#666;}
</style>
</head>
<body>
	<div class="base">
		<div class="main" style="padding-bottom: 45px;">
			<div class="slide">
					<input type="radio" name="pos" id="pos1" checked="checked">
					<input type="radio" name="pos" id="pos2">
					<input type="radio" name="pos" id="pos3">
					<input type="radio" name="pos" id="pos4">
					
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
			</div>
			
		</div>
			<jsp:include page="/WEB-INF/views/view/footer.jsp"></jsp:include>
		</div>


</body>
</html>