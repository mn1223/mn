<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 -->

<%-- <script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script> --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%-- fontawesome script --%>
<script type="text/javascript" src="/resources/fontawesome/js/all.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<!-- Bootstrap theme -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"> --%>

<!-- common CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'/>">

<!--메뉴바 추가 부분-->

<header class="blog-header py-3" style="height: 155px; weight: auto;">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      
      <a href="${pageContext.request.contextPath}/">
      <img alt="메인 페이지" src="/resources/img/logoMain.png" height="100px" width="auto" style="margin-top: 60px; margin-left:400px; float:left;">
      </a>
      </div>
      
      <div class="col-4 text-center">
        <h1>
        	<a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/mmmain">
        		
        		<!-- font awesome{s} -->
      			<i class="fas fa-heart fa-3x" style="color:#FF0000;"></i>
      			<!-- font awesome{e} -->
      			
        	</a>
        </h1>
      </div>      
      <div id="btnMenu">
      	<div id="btnMenuIn">     
			<sec:authorize access="isAuthenticated()">
          		<a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">로그아웃</a>
			</sec:authorize>
        </div>
      </div>
    </div>    
  </header>

<body>
 <div style="width: 100%; text-align:center;">
	<div id="menu1" >
		<ul> 
			 <li><a href="${pageContext.request.contextPath}/matchmaker/member">회원관리</a></li>
			 <li><a href="${pageContext.request.contextPath}/matchmaker/party">파티관리</a></li>
			 <li><a href="${pageContext.request.contextPath}/matchmaker/reservation">예약관리</a></li>
			 <li><a href="${pageContext.request.contextPath}/board/getBoardListFourMa">1:1문의 관리</a></li>
	    </ul>
	</div>	
 </div>
 <br/> 
</body>

<style>
* {
	margin: 0;
	padding : 0;
}

body{
	font: 17px 'Nanum Gothic', sans-serif;
}

a{
	text-decoration: none;
	color: #000000;
}

li{
	list-style:none;
}

#btnMenu {	
	width : 100%;
	text-align : left;
}

#btnMenuIn {
	display : inline-block;
}

#menu1 {
	display: inline-block;
	height: 50px;
	width: 1100px;
	border-top:1px solid black;
	border-bottom:1px solid black
}

#menu1 ul{
	width: 600px;
	margin: 0 auto;
	overflow: hidden;
}

#menu1 ul li{
	float:left;
	width:33%;
	height: auto;
	line-height: 47px;
	text-align:center;	
}

#menu1 ul li a{
	display: block;
}

#menu1 ul li a:hover{
	color:#fff;
	background:#2478FF;	
}
</style>