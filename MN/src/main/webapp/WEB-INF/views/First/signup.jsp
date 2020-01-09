<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
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
	<form method="post" id ="form" name="form" onsubmit="return checkpwd()"
		action="${pageContext.request.contextPath}/signupcomplete">
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
			<label>비밀번호</label> <input type="text" id="mmpwd" name="mmpwd" />
		</div>
		<div>
			<label>비밀번호확인</label> <input type="text" id="re_mmpwd"
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
			<label>질문</label> <input type="text" id="mmq" name="mmq" />
			  <select id="box2" >
			         <option value="어디서 태어났습니까?" selected="selected">어디서 태어났습니까?</option>
                     <option value="가장 애정하는 물품은?" >가장 애정하는 물품은?</option>
                     <option value="좋아하는 노래는?">좋아하는 노래는?</option>
               </select>
		</div>
		<div>
			<label>질문대답</label> <input type="text" id="mma" name="mma" />
		</div>
	</form>
	<div style="margin-top: 10px">
			<button type="button" id="btnSignup">가입하기</button>
	</div>
</body>
</html>