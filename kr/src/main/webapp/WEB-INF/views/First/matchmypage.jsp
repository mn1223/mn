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
	getpartylist();
	
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

<style>
* {
	padding : 0px;
	margin : 0px;
}

body {
	padding : 0px;
	margin : 0px;
	width : auto;
	height : 915px;
	background-color: #F3F3F3;
}

html {
	padding : 0px;
	margin : 0px;
	width: 1903px;
	height: 1900px;
	background-color: #F3F3F3;
}

button {
	margin-left: 500px;
	border: 1px solid #368AFF;
	background-color: #FAFAFA;
	color: #368AFF;
	padding: 5px;
	font-size : 15px;
}

input{
	margin-left: 10px;	
	padding: 5px;
	font-size : 15px;
}

td{
	padding: 10px;
	text-align : center;	
}

th{
	padding: 5px;
	text-align : center;
}

</style>

</head>
<body>
<div>
	<a href="${pageContext.request.contextPath}/mmmain">
		<img alt="매치메이커 메인" src="/resources/img/matchLogo.png" height="80px" width="auto" style="margin-left:750px; margin-top:50px; " >
	</a>
</div>
<br/>
<br/>
<div>
	<img alt="마이 페이지" src="/resources/img/myPage.png" height="50px" width="auto" style="margin-left:350px; margin-top:50px;" >
</div>
<div>
	<img alt="회원 정보" src="/resources/img/memberInfo.png" height="30px" width="auto" style="margin-left:350px; margin-top:50px;" >
</div>

		<div id="inform" style="padding : 50px; margin-left : 350px; width: 1300px; height: auto; background-color: #FAFAFA; ">
				
				<div style="font-size: 15pt;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<c:out value="${userInfo.mmname}"/>
				</div>
				<br/>  
				<div style="font-size: 15pt;">
					&nbsp;&nbsp;&nbsp;아이디:&nbsp;&nbsp;<c:out value="${userInfo.mmid}"/>
				</div>
				<br/>  
				<div style="font-size: 15pt;">
					비밀번호:&nbsp;&nbsp;<c:out value="${userInfo.mmpwd}"/>
				</div>
				<br/>  
				<div style="font-size: 15pt;">
					전화번호:&nbsp;&nbsp;<c:out value="${userInfo.mmphonenum}"/>
				</div>
				<br/>  
				<div style="font-size: 15pt;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별:&nbsp;&nbsp;<c:out value="${userInfo.mmgender}"/>
				</div>
				<br/>  
					<button type="button" id="btnupdate">비밀번호 수정하기</button>
		</div>


<!-- 회원정보 수정  -->
<div id= "editform" style="padding : 50px; margin-left : 350px; width: 1300px; height: auto; background-color: #FAFAFA; ">
	
	<div style="font-size: 15pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;<input type="text" id="mmname" value ="${userInfo.mmname}"/><br>
	</div>
	<br/>
	<div style="font-size: 15pt;">&nbsp;&nbsp;&nbsp;아이디&nbsp;&nbsp;<input type="text" id="mmid" value="${userInfo.mmid}" readonly="readonly">
	</div>
	<br/>
	<div style="font-size: 15pt;">비밀번호&nbsp;&nbsp;<input type="text" id="mmpwd" value="${userInfo.mmpwd}">
	</div>
	<br/>
	<div style="font-size: 15pt;">전화번호&nbsp;&nbsp;<input type="text" id="mmphonenum" value="${userInfo.mmphonenum}">
	</div>
	<br/>
	<div style="font-size: 15pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성별&nbsp;&nbsp;<input type="text" id="mmgender" value="${userInfo.mmgender}">
	</div>
		
	<br/>
	<button type="submit" id="btnsave">비밀번호 저장하기</button>
	
</div>




<!-- 학교 정보 입력 form -->
<img alt="학교 정보" src="/resources/img/schoolInfo.png" height="30px" width="auto" style="margin-left:350px; margin-top:50px;" >
<div id="schoolInfo" style="padding : 50px; margin-left : 350px; width: 1300px; height: auto; background-color: #FAFAFA; ">

	<input type="button" id = "bt_e" value ="초등학교" onclick ="eschool()">
	<input type="button" id = "bt_m" value ="중학교" onclick ="mschool()">
	<input type="button" id = "bt_h" value ="고등학교" onclick ="hschool()">
	<input type="button" id = "bt_u" value ="대학교" onclick ="uschool()">
	<button type="button" id="btndelete" style="margin-left: 700px; font-size:20px; font-weight: bold;">회원탈퇴</button>
	<br/>
	<br/>
		<!-- eschool{s} -->
		<div id = "eschool">
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;초등학교:&nbsp;&nbsp;<c:out value= "${scinfo.eschool}"/></div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;졸업년도:&nbsp;&nbsp;<c:out value ="${scinfo.eschoolgy}년"/><br/></div>
			<br/>
			<br/>
			<button type="button" id="btnschool" onclick="editeschoolinfo()" >등록 및 수정</button>
		</div>
		
		<div id = "editeschool">
			<div style="font-size: 20pt;">초등학교 
			<input type="text" id="eschoolName" name="eschoolName" value ="${scinfo.eschool}" readonly/>			
			<input type="button" id ="schoolSearch" data-toggle="modal" data-target="#myModal" value="학교찾기"></input>
			</div>			
			<br/>
			<br/>
			<div style="font-size: 20pt;">졸업년도 
			<input type="text" id="eschoolgy" name="eschoolgy" value="${scinfo.eschoolgy}" />
			<br/>
			<br/>
			<button type="button"  onclick="eschooleditcom()">수정완료</button>
			</div>	
		</div>
		<!-- eschool{e} -->
		
		<!-- mschool{s} -->
		<div id = "mschool">	
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;중학교:&nbsp;&nbsp;<c:out value= "${scinfo.mschool}"/></div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;졸업년도:&nbsp;&nbsp;<c:out value ="${scinfo.mschoolgy}년"/><br/></div>
			<br/>
			<br/>
			<button type="button" id="btnschool" onclick="editmschoolinfo()">등록 및 수정</button>		
		</div>
		
		<div id = "editmschool">		
		<div style="font-size: 20pt; margin-left:20px;">중학교 
			<input type="text" id="mschoolName" name="mschoolName" value ="${scinfo.mschool}" readonly/>			
			<input type="button" id ="schoolSearch" data-toggle="modal" data-target="#myModal" value="학교찾기"></input>
			</div>			
			<br/>
			<br/>
			<div style="font-size: 20pt;">졸업년도 
			<input type="text" id="mschoolgy" name="mschoolgy" value="${scinfo.mschoolgy}" />
			<br/>
			<br/>
			<button type="button"  onclick="mschooleditcom()">수정완료</button>
			</div>		
		</div>
		<!-- eschool{e} -->
		
		<!-- hschool{s} -->
		<div id = "hschool">	
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;고등학교:&nbsp;&nbsp;<c:out value= "${scinfo.hschool}"/></div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;졸업년도:&nbsp;&nbsp;<c:out value ="${scinfo.hschoolgy}년"/><br/></div>
			<br/>
			<br/>
			<button type="button" id="btnschool" onclick="edithschoolinfo()">등록 및 수정</button>
			
		</div>
		
		<div id = "edithschool">		
		<div style="font-size: 20pt;" >고등학교
			<input type="text" id="hschoolName" name="hschoolName" value ="${scinfo.hschool}" readonly />			
			<input type="button" id ="schoolSearch" data-toggle="modal" data-target="#myModal" value="학교찾기"></input>
			</div>			
			<br/>
			<br/>
			<div style="font-size: 20pt;">졸업년도 
			<input type="text" id="hschoolgy" name="hschoolgy" value="${scinfo.hschoolgy}" />
			<br/>
			<br/>
			<button type="button"  onclick="hschooleditcom()">수정완료</button>
			</div>
		</div>
		<!-- hschool{e} -->
		
		<!-- uschool{s} -->
		<div id = "uschool">			
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;&nbsp;대학교:&nbsp;&nbsp;<c:out value= "${scinfo.uschool}"/></div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학과:&nbsp;&nbsp;<c:out value ="${scinfo.uschoolma}"/><br/></div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">입학년도:&nbsp;&nbsp;<c:out value ="${scinfo.uschooley}년"/><br/></div>
			<br/>
			<br/>
			<button type="button" id="btnschool" onclick="edituschoolinfo()">등록 및 수정</button>
		</div>
		
		<div id = "edituschool">			
			<div style="font-size: 20pt; margin-left: 20px" >대학교
			<input type="text" id="uschoolName" name="uschoolName" value ="${scinfo.uschool}" readonly />			
			<input type="button" id ="schoolSearch" data-toggle="modal" data-target="#myModal" value="학교찾기"></input>
			</div>			
			<br/>
			<br/>
			<div style="font-size: 20pt; margin-left: 50px" >학과
			<input type="text" id="uschoolma" name="uschoolma" value ="${scinfo.uschoolma}" />
			</div>
			<br/>
			<br/>
			<div style="font-size: 20pt;">입학년도 
			<input type="text" id="uschooley" name="uschooley" value="${scinfo.uschooley}" />
			<br/>
			<br/>
			<button type="button"  onclick="uschooleditcom()">수정완료</button>
			</div>
		</div>
		<!-- uschool{e} -->	
	</div>
	
	<!-- 1:1문의 및 대학교 인증 -->
	<img alt="1:1문의 및 대학교 인증" src="/resources/img/oneToOne.png" height="30px" width="auto" style="margin-left:350px; margin-top:50px;" >
	<div id="oneToOne" style="padding : 50px; margin-left : 350px; width: 1300px; height: 150px; background-color: #FAFAFA; ">
		<div style="font-size: 25px; float: left; margin-top : 15px;">
			<a href="/board/getBoardListFour">1:1문의 및 대학교 인증 게시판 이동하기(클릭)</a>
		</div>
	</div>	
	
	<!-- 실시간 예약 현황 -->
	<img alt="실시간 예약 현황" src="/resources/img/list.png" height="30px" width="auto" style="margin-left:350px; margin-top:50px;" >
	<div id="reservation" style="padding : 50px; margin-left : 350px; width: 1300px; height: auto; background-color: #FAFAFA; ">
		<div id="resTable" style="padding: 0; margin-bottom: 20px;">			
			 	<table border="1">
		        	<colgroup>
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					
					<thead id=po3 style="margin: 10px">
		        		<tr >
		        			<th>파티번호</th>
			        		<th>파티일자</th>
			        		<th>입금상태</th>
			        		<th>예약상태</th>
			        		<th>예약취소</th>
		        		</tr>
		        	</thead>
		        	<tbody id="uInfo">
		        	</tbody>
		      	</table>
      	</div>
    </div>
      	
      	<script>
      		function getpartylist(){
      		$.ajax({
 		    	type : "POST",
 		    	
 		        url: "/getpartylist",
 		        
 		        dateType : 'json',

 		        success: function(data){
 		        	console.log(data.length);
 		        	$("#uInfo").html("");
	        		var htmls = "";
	        		if(data.length < 1){
	        			//alert("x");
	        		}else{
	        			console.log(data);
	        			
	        			$(data).each(function(){
	          				htmls = "<tr>";
	          				htmls += "<td>"+this.pno+"</td>";
	        				htmls += "<td>"+this.pdate+"</td>";
	        				htmls += "<td>"+this.ubookstatus+"</td>";
	        				htmls += "<td>"+this.ubookdeposit+"</td>";
	        				htmls += "<td><input type='button' value='삭제' onclick=rInfo('"+this.pno+"') ></input></td>";
	      					htmls += "</tr>";
	      					$("#uInfo").append(htmls);
	      				});
	        		}
	        }//Ajax Seccess end
	      }); //Ajax end
      		};

	     function rInfo(pno){
      		alert("삭제버튼입니다.");
      		$.ajax({
 		    	type : "POST",
 		    	
 		        url: "/delParty",
 		        
 		       data: {"pno":pno},

	        success: function(data){
	        	console.log(data);
	        	if(data!="false"){ 
	        		data='Y'
	        		location.reload();
		       		alert("삭제 성공 !!!!");
	        	}else{
	        		data='N'
	        		alert("삭제 실패 !!!!");
	        		location.reload();
	        	}
	        },
	        error: function (){        
	        	alert("통신상태가 안좋음");
	        }
	      });
	        		
         };
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