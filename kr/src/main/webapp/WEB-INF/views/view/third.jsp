<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<!-- JQuery -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>
<div>
<a href="${pageContext.request.contextPath}/">
<img alt="메인 페이지" src="/resources/img/logoMain.png" height="200px" width="auto" style="margin-left:970px; margin-top:50px;" >
</a>
</div>

<div id="loginForm" >
	<c:url value="/login" var="loginUrl" />
	<div class="modal-dialog text-center" >				  
			<div class="modal-content">
			  <div class="col-12 user-img">
					<img src="/resources/img/face.png">
				</div>

				<div class="col-12 form-input">
					<form:form name="f" action="${loginUrl}" method="POST"
						modelAttribute="LoginVO">
						<c:if test="${param.error != null}">
							<p style="color:red">아이디와 비밀번호가 잘못되었습니다.</p>
						</c:if>
						<c:if test="${param.logout != null}">
							<p>로그아웃 하였습니다.</p>
						</c:if>
						<div class="form-group">
							<input type="text" id="mmid" name="mmid" class="form-control"
								placeholder="Enter Email">
						</div>
						<div class="form-group">
							<input type="password" id="mmpwd" name="mmpwd" class="form-control"
								placeholder="Enter Password">
						</div>

						<button type="submit" class="btn btn-success">로그인</button>
					</form:form>

				</div>
				<br/>
				<div class="col-12 forgotid">
					<a href="/idfind">아이디를 잊어버리셨나요?</a>
				</div>

				<div class="col-12 forgotpwd">
					<a href="/pwfind">비밀번호를 잊어버리셨나요?</a>
				</div>
				<div class="col-12 forgotpwd">
					<a href="/signup">회원가입</a>
				</div>
			</div>
		</div>
	</div>


<style type="text/css">
* {
	margin : 0px;
	padding : 0px;
}

html{
	height : 100%;
	background-color:#F3F3F3;
}

body { 
	margin : 0px;
	padding : 0px;
	background-color:#F3F3F3;
} 

.main-section {
	margin: 0 auto;
	margin-top: 130px;
	padding: 0;
}

.modal-content {
	background-color: #555555;
	opacity: .8;
	padding: 0 18px;
	border-radius: 10px;
}

.user-img img {
	height: 120px;
	width: 120px;
}

.user-img {
	margin-top: -60px;
	margin-bottom: 45px;
}

.form-group {
	margin-bottom: 25px;
}

.form-group input {
	height: 42px;
	border-radius: 5px;
	border: 0;
	font-size: 18px;
	letter-spacing: 2px;
	padding-left: 54px;
}

.form.input button {
	width: 40%;
	margin: 5px 0 25px;
}

.btn.btn-success {
	background-color: #1c6288;
	font-size: 19px;
	border-radius: 5px;
	padding: 7px 14px;
	border: 1px solid #daf1ff;
}

.btn.btn-success:hover {
	background-color: #13445e;
	border: 1px solid #daf1ff;
}

.btn.btn-reg {
	background-color: #1c6288;
	font-size: 19px;
	border-radius: 5px;
	padding: 7px 14px;
	border: 1px solid #daf1ff;
	color: white;
}

.btn.btn-reg:hover {
	background-color: #13445e;
	border: 1px solid #daf1ff;
}

.forgotpwd {
	padding: 5px 0 25px;
}

.forgotpwd a {
	color: #daf1ff;
}

.forgotid {
	padding: 5px 0 25px;
}

.forgotid a {
	color: #daf1ff;
}
</style>
</html>

