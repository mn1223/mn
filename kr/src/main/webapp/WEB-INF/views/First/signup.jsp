<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>

<html lang="en">
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
  
    <title>Signin Template for Bootstrap</title>
  </head>
<script>
	$(document).ready(function(){
		$('#box').change(function() {
			if($(this).val()=="1"){
				$('#mmid2').val("");
				$("#mmid2").attr("readonly", false);
			} else {
				$('#mmid2').val($(this).val());
				$("#mmid2").attr("readonly", true);
			}
		});
	});
	
	function checkpwd() {
		
		var mmpwd = document.getElementById("mmpwd").value;
		var re_mmpwd = document.getElementById("re_mmpwd").value;

		if (mmpwd != re_mmpwd) {
			document.getElementById('pwsame').innerHTML = '비밀번호가 틀렸습니다.';
			return false;
		}
	}
	
	$(document).ready(function(){
		$('#box2').change(function(){	
			$('#mmq').val($(this).val());
			$("#mmq").attr("readonly");
		});
	});

	$(document).on('click','#btnSignup',function(){
		
		    	var pp=$("#mmid2").val();
				var id=$("#mmid").val();
				var sum= id+"@"+pp;
		 
				$("#mmid").val(sum);
				
				  if(confirm("회원가입을 하시겠습니까")){
				    	if(idck==0){
				    		alert("아이디 중복체크를 해주세요");
				    		$("#mmid").val(id); 
				    		return false;
				    		
				    	}else{
				    		alert("축카축카");			
				    	    $("#form").submit();
				    	    $("#mmid").val("");
				    	}				    	
				  }
		});
	
	var idck=0;//아이디 중복일 경우=0, 아닐경우=1
	$(document).on('click','#idcheck',function(){
		
    	var pp=$("#mmid2").val();
		var id=$("#mmid").val();
		var sum= id+"@"+pp;
		
		alert(sum);
		var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
				};
		
		$.ajax({
			headers : headers,
		    type:"GET",
		    data:{"useridr":sum},
		    url:"/checking",
		    dataType:"json",
		    success:function(data8){
		    	if(data8.cnt>0){
		    		alert("아이디가 존재합니다. 다른 아이디를 입력해주세요");
		               } else {
		                   alert("사용가능한 아이디입니다");						          
		                   idck = 1;
		               }
		           },
		     error : function(error){
		               alert("error : " + error);
		     }
		        });
	});	
</script>
</head>
  <body>
  <div style="height: 850px; width: auto;">
  <a href="${pageContext.request.contextPath}/">
  <img alt="메인 페이지" src="/resources/img/logoMain.png" height="150px" width="auto" style="margin-left:850px; margin-top:0px;" >
  </a>
    <div class="container">
      <form class="form-signin" method="get" id ="form" name="form" onsubmit="return checkpwd()"
		action="${pageContext.request.contextPath}/signupcomplete">
        <h2 class="form-signin-heading"><center>Please sign in</center></h2>
      <div>
			<label>이름</label> <input type="text" id="mmname" name="mmname" />
		</div>
	<div id="divInputId">
			<label>아이디(4~8자의 영문 대소문자와 숫자로만 입력)</label><br> 
			<input type="text" id="mmid" name="mmid"/> @ 
			<input type="text" id="mmid2" name="mmid2"/>
			  <select id="box">
			         <option value="1" selected="selected">직접입력</option>
                     <option value="naver.com" >naver.com</option>
                     <option value="google.com">google.com</option>
                     <option value="daum.net">daum.net</option>
                 </select>
                <button type="button" id="idcheck">중복확인</button>
		</div>
		<div>
			<label>비밀번호</label> <input type="password" id="mmpwd" name="mmpwd" />
		</div>
		<div>
			<label>비밀번호확인</label> <input type="password" id="re_mmpwd"
				name="re_mmpwd" />
		</div>
		<p id="pwsame" style="color: red;"></p>
		<div>
			<label>전화번호</label> <input type="text" id="mmphonenum"
				name="mmphonenum" /> ex)01012345678
		</div>
		<div>
		<label>성별</label> <input type="radio" name="mmgender" value="남자"checked>남
		<input type="radio" name="mmgender" value="여자" checked>여 
		</div>
		<div>
			<label >질문</label> 
			  <select id="box2" id="mmq" name="mmq"  >
			         <option value="어디서 태어났습니까?" selected="selected">어디서 태어났습니까?</option>
                     <option value="가장 애정하는 물품은?" >가장 애정하는 물품은?</option>
                     <option value="좋아하는 노래는?">좋아하는 노래는?</option>
               </select>
		</div>
		<div>
			<label>질문대답</label> <input type="text" id="mma" name="mma" />
		</div>
		<br>
		<div class="oo" >
        <center><button class="btn btn-lg btn-primary btn-block" type="button" id="btnSignup" >signup</button></center>
         </div>     
      </form>
    </div> <!-- /container -->
    </div>
  </body>
<style>
input[type='text'] {
    border-radius:5px; 
}
#box2{
 border-radius:5px; 
}

body {
  padding-top: 90px;
  padding-bottom: 40px;
  background-color: #eee;
  background-image:url('mainPage.png');
  height : 900px;
  width : auto;
}
.form-signin {
  max-width: 600px;
  padding: 15px;
  margin: 0 auto;
}

.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}

.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>  

