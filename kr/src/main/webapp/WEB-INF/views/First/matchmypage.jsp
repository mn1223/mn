<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	$("#inform").show();
	$("#editform").hide();
	$("#eschool").show();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").hide();
	$("#editeschool").hide();
	$("#editmschool").hide();
	$("#edithschool").hide();
	$("#edituschool").hide();
});
function eschool(){ 
	$("#eschool").show();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").hide();
}

function mschool(){
	$("#eschool").hide();
	$("#mschool").show();
	$("#hschool").hide();
	$("#uschool").hide();
}

function hschool(){
	$("#eschool").hide();
	$("#mschool").hide();
	$("#hschool").show();
	$("#uschool").hide();
}

function uschool(){
	$("#eschool").hide();
	$("#mschool").hide();
	$("#hschool").hide();
	$("#uschool").show();
}

//삭제 버튼 클릭 이벤트
$(document).on('click', '#btndelete', function() {
	var url = "${pageContext.request.contextPath}/delete";
	location.href = url;
});

//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnupdate', function() {
		$("#inform").hide();
		$("#editform").show();
	});
	
	$(document).on('click', '#btnsave', function() {
		var name = $('#mmname').val();
		var mid = $('#mmid').val();
		var mmpwd = $('#mmpwd').val();
		var mmphonenum = $('#mmphonenum').val();
		var mmgender = $('#mmgender').val();
		
		var paramData = JSON.stringify({
		"mmname" :name,
		"mmid" :mid,
		"mmpwd":mmpwd,
		"mmphonenum": mmphonenum,
		"mmgender":mmgender

		});
		console.log(paramData);		
		var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};		
	
		$.ajax({
			headers : headers,
			type : "POST",
			url : "/ckkkkk",
			data : paramData,	
			success : function(data) {
				console.log(data);
				location.reload();
				alert('성공');			
			},
			error : function(e){
				console.log(e);
				alert('error');
			}		
		});	
	});
	
	function editeschoolinfo(){
		$("#eschool").hide();
		$("#editeschool").show();
		$("#bt_e").attr('disabled',true);
		$("#bt_m").attr('disabled',true);
		$("#bt_h").attr('disabled',true);
		$("#bt_u").attr('disabled',true);
		
	}
	function editmschoolinfo(){
		$("#mschool").hide();
		$("#editmschool").show();
		$("#bt_e").attr('disabled',true);
		$("#bt_m").attr('disabled',true);
		$("#bt_h").attr('disabled',true);
		$("#bt_u").attr('disabled',true);
	}
	function edithschoolinfo(){
		$("#hschool").hide();
		$("#edithschool").show();
		$("#bt_e").attr('disabled',true);
		$("#bt_m").attr('disabled',true);
		$("#bt_h").attr('disabled',true);
		$("#bt_u").attr('disabled',true);
	}
	function edituschoolinfo(){
		$("#uschool").hide();
		$("#edituschool").show();
		$("#bt_e").attr('disabled',true);
		$("#bt_m").attr('disabled',true);
		$("#bt_h").attr('disabled',true);
		$("#bt_u").attr('disabled',true);
	}



    
    //학교검색 ajax
    function schoolSearch(){
	var gubun = $("#gubun").val();
	var region = $("#region").val();
	var name = $("#name").val();
	
	
	var headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		};		
	
	$.ajax({
		headers : headers, 
		url : "/schoolSearch",
		data : {"gubun":gubun,"name":name,"region":region},
		dataType : "json",
		type : "GET",
		success:function(data){
			var html = "";
			console.log(data);
			$(data).each(function(){				
				html += '<tr>';
				html +='<th>'+this.schoolName+'<th>';
				html +='<th>'+this.adres+'<th>';
				html +='<button onclick=selectSchool("'+this.schoolName+'")>선택</button>';
				html += '<tr>';
			});
			$("#school-grid").html(html);
		},
		error : function(e){
			alert(e);	
		}
	});
}
    
    function selectSchool(schoolName){
    	$("#selectschool").val(schoolName);

    }
    function sendSchool(){
    	$("#eschoolName").val($("#selectschool").val());
    	$("#mschoolName").val($("#selectschool").val());
    	$("#hschoolName").val($("#selectschool").val());
    	$("#uschoolName").val($("#selectschool").val());
    }
    
   	//학교 등록 ajax(초등학교)
   	function eschooleditcom(){
   		var eschoolName = $("#eschoolName").val();
   		var eschoolgy = $("#eschoolgy").val();
   		var searchType = "es";
   		
   		var headers = {
   				"Content-Type" : "application/json",
   				"X-HTTP-Method-Override" : "POST"
   			};
   		var paramData = JSON.stringify({
   			"eschool" :eschoolName,
   			"eschoolgy" :eschoolgy,
   			"searchType" : searchType

   			});  		
   		$.ajax({
   			headers : headers, 
   			url : "/schoolUpd",
   			type : "POST",
   			data : paramData,
   			success : function(result){
   				location.reload();
   				alert("성공");
   			},
   			error : function(e){
   				alert(e);
   			}
   		});
   	}
   	//학교 등록 ajax(중학교)
   	function mschooleditcom(){
   		var mschoolName = $("#mschoolName").val();
   		var mschoolgy = $("#mschoolgy").val();
   		var searchType = "ms";
   		
   		var headers = {
   				"Content-Type" : "application/json",
   				"X-HTTP-Method-Override" : "POST"
   			};
   		var paramData = JSON.stringify({
   			"mschool" :mschoolName,
   			"mschoolgy" :mschoolgy,
   			"searchType" : searchType

   			});  		
   		$.ajax({
   			headers : headers, 
   			url : "/schoolUpd",
   			type : "POST",
   			data : paramData,
   			success : function(result){
   				location.reload();
   				alert("성공");
   			},
   			error : function(e){
   				alert(e);
   			}
   		});
   	}
   	//학교 등록 ajax(고등학교)
   	function hschooleditcom(){
   		var hschoolName = $("#hschoolName").val();
   		var hschoolgy = $("#hschoolgy").val();
   		var searchType = "hs";
   		
   		var headers = {
   				"Content-Type" : "application/json",
   				"X-HTTP-Method-Override" : "POST"
   			};
   		var paramData = JSON.stringify({
   			"hschool" :hschoolName,
   			"hschoolgy" :hschoolgy,
   			"searchType" : searchType

   			});  		
   		$.ajax({
   			headers : headers, 
   			url : "/schoolUpd",
   			type : "POST",
   			data : paramData,
   			success : function(result){
   				location.reload();
   				alert("성공");
   			},
   			error : function(e){
   				alert(e);
   			}
   		});
   	}
  //학교 등록 ajax(대학교)
   	function uschooleditcom(){
   		var uschoolName = $("#uschoolName").val(); 
   		var uschooley = $("#uschooley").val();
   		var uschoolma = $("#uschoolma").val();
   		var searchType = "us";
   		
   		var headers = {
   				"Content-Type" : "application/json",
   				"X-HTTP-Method-Override" : "POST"
   			};
   		var paramData = JSON.stringify({
   			"uschool" :uschoolName,
   			"uschooley" :uschooley,
   			"uschoolma" :uschoolma,
   			"searchType" : searchType
   			});  		
   		$.ajax({
   			headers : headers, 
   			url : "/schoolUpd",
   			type : "POST",
   			data : paramData,
   			success : function(result){
   				location.reload();
   				alert("성공");
   			},
   			error : function(e){
   				alert(e);
   			}
   		});
   	}




</script>
</head>
<body>
	실시간 예약현황
	<br>
	<h2>회원 정보</h2>
<div id="inform">
		<div>
			<label>이름:</label><c:out value="${userInfo.mmname}"/>
		</div>
		<div>
			<label>아이디:</label><c:out value="${userInfo.mmid}"/>
		</div>
		<div>
			<label>비밀번호수정:</label><c:out value="${userInfo.mmpwd}"/>
		</div>
		<div>
			<label>전화번호:</label><c:out value="${userInfo.mmphonenum}"/>
		</div>
		<div>
			<label>성별:</label><c:out value="${userInfo.mmgender}"/>
		</div>
		<button type="button" id="btnupdate">수정하기</button>
</div>

<div id= "editform">
	<label>이름</label> <input type="text" id="mmname" value ="${userInfo.mmname}"/><br>
	<label>아이디</label><input type="text" id="mmid" value="${userInfo.mmid}" readonly="readonly"><br>
	<label>비밀번호수정</label><input type="text" id="mmpwd" value="${userInfo.mmpwd}"><br>
	<label>전화번호</label><input type="text" id="mmphonenum" value="${userInfo.mmphonenum}"><br>
	<label>성별</label><input type="text" id="mmgender" value="${userInfo.mmgender}"><br>
	<button type="submit" id="btnsave">저장하기</button>
</div>
<br>
<!-- 학교 정보 입력 form -->



	<input type="button" id = "bt_e" value ="초등학교" onclick ="eschool()">
	<input type="button" id = "bt_m" value ="중학교" onclick ="mschool()">
	<input type="button" id = "bt_h" value ="고등학교" onclick ="hschool()">
	<input type="button" id = "bt_u" value ="대학교" onclick ="uschool()">

		<div id = "eschool">
			<label>초등학교:</label><c:out value= "${scinfo.eschool}"/><br>
			<label>졸업년도:</label><c:out value ="${scinfo.eschoolgy}년"/><br>
			<button type="button" id="btnschool" onclick="editeschoolinfo()">등록및 수정</button>		
		</div>
		<div id = "editeschool">
			<label>초등학교</label> <input type="text" id="eschoolName" name="eschoolName" value ="${scinfo.eschool}" readonly/>
			<button id ="searchBtn" data-toggle="modal" data-target="#myModal">학교 찾기</button>
			<br>
			<label>초등학교졸업년도</label> <input type="text" id="eschoolgy"
				name="eschoolgy" value="${scinfo.eschoolgy}" /><br>
			<button type="button"  onclick="eschooleditcom()">완료</button>	
		</div>
		
		<div id = "mschool">	
			<label>중학교:</label><c:out value="${scinfo.mschool}"/><br>
			<label>졸업년도:</label><c:out value ="${scinfo.mschoolgy}년"/><br>
			<button type="button"  onclick="editmschoolinfo()">등록및 수정</button>			
		</div>
		<div id = "editmschool">
		<label>중학교</label> <input type="text" id="mschoolName" name="mschoolName" value="${scinfo.mschool}" readonly/>
		<button id ="searchBtn" data-toggle="modal" data-target="#myModal">학교 찾기</button>
		<br>
		<label>졸업년도</label> <input type="text" id="mschoolgy"
				name="mschoolgy" value="${scinfo.mschoolgy}"/><br>
		<button type="button"  onclick="mschooleditcom()">완료</button>		
		</div>
		
		<div id = "hschool">	
			<label>고등학교:</label><c:out value="${scinfo.hschool}"/><br>
			<label>졸업년도:</label><c:out value ="${scinfo.hschoolgy}년"/><br>
			<button type="button"  onclick="edithschoolinfo()">등록및 수정</button>
			
		</div>
		<div id = "edithschool">
		<label>고등학교</label> <input type="text" id="hschoolName" name="hschoolName" value="${scinfo.hschool}" readonly/>
		<button id ="searchBtn" data-toggle="modal" data-target="#myModal">학교 찾기</button><br>
			<label>졸업년도</label> <input type="text" id="hschoolgy"
				name="hschoolgy" value ="${scinfo.hschoolgy}"/><br>
		<button type="button" onclick="hschooleditcom()">완료</button>	
		</div>
		
		<div id = "uschool">	
			<label>대학교:</label><c:out value="${scinfo.uschool}"/><br> 
			<label>학과:</label><c:out value="${scinfo.uschoolma}"/><br>
			<label>입학년도:</label><c:out value ="${scinfo.uschooley}년"/><br>
			<button type="button"  onclick="edituschoolinfo()">등록및 수정</button>	
		</div>
		<div id = "edituschool">
			<label>대학교</label> <input type="text" id="uschoolName" name="uschoolName" value="${scinfo.uschool}" readonly/>
			<button id ="searchBtn" data-toggle="modal" data-target="#myModal">학교 찾기</button><br>
			<label>학과</label> <input type="text" id="uschoolma" name="uschoolma" value="${scinfo.uschoolma}" /><br>
			<label>입학년도</label> <input type="text" id="uschooley"
				name="uschooley" value ="${scinfo.uschooley}"/><br>
			<button type="button" onclick="uschooleditcom()">완료</button>
		</div>

	<br>
	<button type="button" id="btndelete">회원탈퇴</button>
	<br>
	<hr>
	<br> 1:1문의 및 대학교 인증<br>
	<a href="/board/getBoardListFour">문의게시판 이동</a>
	<br>
	<br>
	<hr>
	<h2>실시간 예약 현황</h2>
	 <table border="1">
        	<colgroup>
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			
			<thead id=po3>
        		<tr>
        			<th>파티번호</th>
	        		<th>파티일자</th>
	        		<th>입금상태</th>
	        		<th>예약상태</th>
	        		<th id=rCancel>예약취소</th>
        		</tr>
        	</thead>
        	
        	<tbody id="uInfo">
        	
			</tbody>
      	</table>    
      	
      	<script>
      		$("#rCancel").on("click",function(){
      			alert("삭제버튼입니다.");
      		});
      	
      	</script>
	
	
	
	
	<!-- 학교 찾기 modal -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <div class="form-horizontal" id="search-block">

   <div class="margin-bottom-5">

    <select class="form-control form-group-margin" id="gubun" name="gubun" placeholder="구분">
        <option value="elem_list">초등학교</option>
        <option value="midd_list">중학교</option>
        <option value="high_list">고등학교</option>
        <option value="univ_list">대학교</option>
       </select>  
     </div>
 
<div class="margin-bottom-5">
<select class="form-control form-group-margin" id="region" name="region" placeholder="지역">
        <option value="">전체</option>
        <option value="100260">서울특별시</option>
        <option value="100267">부산광역시</option>
        <option value="100269">인천광역시</option>
        <option value="100271">대전광역시</option>
        <option value="100272">대구광역시</option>
        <option value="100273">울산광역시</option>
        <option value="100275">광주광역시</option>
        <option value="100276">경기도</option>
        <option value="100278">강원도</option>
        <option value="100280">충청북도</option>
        <option value="100281">충청남도</option>
        <option value="100282">전라북도</option>
        <option value="100283">전라남도</option>
        <option value="100285">경상북도</option>
        <option value="100291">경상남도</option>
        <option value="100292">제주도</option>
       </select>              
     </div>
 
<div class="margin-bottom-5">
<input class="form-control" id="name" placeholder="학교이름" type="text">
     </div>
<div class="margin-bottom-5">
<button class="btn btn-default" id="search" type="button" onclick="schoolSearch()">검색</button>
     </div>
</div>
<h4>검색 결과</h4>
<div id="school-grid">
</div>
<input type ="text" id = selectschool value =""/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick ="sendSchool()"data-dismiss="modal">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>