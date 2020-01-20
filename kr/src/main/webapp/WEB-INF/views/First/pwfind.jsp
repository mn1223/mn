<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$('#box2').change(function(){
     	$('#mmq').val($(this).val());
    	$('#mmq').attr("readonly");
	});
});

function aaaa(){
	var a = $("#mmid").val(); 
	alert(a);
	alert($("#mmq").val());
	alert($("#mma").val());
	$("#form").submit();
};

</script>
</head>
<body>
<form method="GET" id="form" action="${pageContext.request.contextPath}/pwchange">
    <div>
		<label>아이디</label> <input type="text" id="mmid" name="mmid"/>
	</div>
	 <div>
		<label>질문</label> 
		<select id="mmq" name="mmq" >
			         <option value="어디서 태어났습니까?" selected="selected">어디서 태어났습니까?</option>
                     <option value="가장 애정하는 물품은?" >가장 애정하는 물품은?</option>
                     <option value="좋아하는 노래는?">좋아하는 노래는?</option>
               </select>
	</div>
		<div>
		<label>정답</label> <input type="text" id="mma" name="mma"/>
	</div>
		<button type="button" id="btnpwfind" onclick = aaaa();>확인</button>
</form>		
</body>
</html>