<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>메인 페이지</title>
</head>
<body>
	<div class="base">
		<header>
			<table>
				<tr>	
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a style="visibility: hidden;">공간띄기</a></td>
					<td><a>로그인</a></td>
					<td><a>마이페이지</a></td>
				</tr>
			</table>
			<div class="logo">로고
				<!-- <img alt="로고" src=""> --></div>
				<hr/>
		</header>
		<div class="main">
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
					
					<p class="bullet">
						<label for="pos1">1</label>
						<label for="pos2">2</label>
						<label for="pos3">3</label>
						<label for="pos4">4</label>
						</p>
			</div>
			<div class="container">
				<div class="item">
					<img src="resources/img/cha1.png">
					
				</div>
				<div class="item">
					<img src="resources/img/cha2.png">
					
				</div>
				<div class="item">
					<img src="resources/img/cha3.png">
					
				</div>
				<div class="item">
					<img src="resources/img/cha4.png">
					
				</div>
			</div>
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
					<td><a>주소</a><br/>
					<a>카피라이트</a></td>
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

ul,li{list-style:none;}
.slide{height: 300px; overflow: hidden; position: relative;}
.slide ul{width:calc(100% *4); display: flex; transition:1s;}
.slide li{width:calc(100% /4); height: 300px;}
.slide li:nth-child(1){background:#ffa;}
.slide li:nth-child(2){background:#faa;}
.slide li:nth-child(3){background:#afa;}
.slide li:nth-child(4){background:#aaf;}
.slide input{display:none;}
.slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
.slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
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

table {
	border-spacing: 0
}

body {
	background: white;
}

html {
	font-size: 100px;
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

.container{
	display: grid;
	/*grid-template-columns : 40% 60%;*/
	grid-template-columns : 5fr 5fr;
	/*grid-template-columns : 1fr 1fr 1fr;*/
	/*grid-template-columns : repeat(3, 1fr);*/
	/*grid-template-columns : 200px 1fr;*/
	grid-auto-rows:1fr 1fr;
	grid-gap : 1rem;
	justify-items:center;
	align-items: start;
	height: 100vh;
	background: lightgray;
}

.item {
	background: rgba(255,0,0,0.5);
}
.item:nth-child(odd) {
	background: rgba(255,255,0,0.5);
}

.item:nth-child(2) {
	/*justify-self : center;*/
	/*align-self: center;*/
}

.item:nth-child(1) {
	/*grid-column : 1/3;*/
}
footer table {
	position: absolute;
	top:50%;
	left: 0;
	transform:translate(0,-50%);
	width: 100%;
	height: 80%;
}
footer table tr td:last-child {
	width: 40%;
}
footer table tr td:not (:last-child ){
	width: 12%;
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