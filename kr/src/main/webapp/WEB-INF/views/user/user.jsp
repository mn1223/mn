<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Calendar"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR); 
	int mm = cal.get(Calendar.MONTH)+1;
	try{
		yy=Integer.parseInt(request.getParameter("yy"));
	}catch(Exception e){
		yy=cal.get(Calendar.YEAR);
	}
	try {
		mm=Integer.parseInt(request.getParameter("mm"));
	}catch(Exception e){
		mm=cal.get(Calendar.MONTH)+1;
	}
	if (mm==13) {
		yy++;
		mm = 1;
	}
	if (mm ==0) {
		yy--;
		mm = 12;
	}
	if(yy<=0 || mm<1 || mm>12) {
		yy=cal.get(Calendar.YEAR);
		mm=cal.get(Calendar.MONTH)+1;
	}
	cal.set(yy,mm-1,1);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
%>
<!DOCTYPE html>
<html>
<!-- JQuery -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<head>
<meta charset="utf-8"/>
<title>파티 신청하기</title>
<style type="text/css">
	table{width:1300px; margin:auto;}
	th{border:1px solid black; background-color: silver; padding:5px; width : 100px;}
    td{border:1px solid black; height: 60px; font-size: 12pt; vertical-align: top; text-align: right;}	

	td div{
		color:white;
		background:skyblue;
	}
</style>
</head>
<body>
<h1>유저 페이지(매치 메이커 공통)</h1>
<a href="/">홈으로</a>
	
	<div id="map" style="margin-left: auto; margin-right: auto; display: block; width:800px;height:600px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77b46467b2a7bcb8d0da4e43a228063e"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
        center: new kakao.maps.LatLng(37.438848, 126.675116), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.438848, 126.675116); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    	
	</script>
	
	<br/><br/>
		<h2 style="text-align:center">파티신청하기</h2> 
	
<c:forEach var="list" items="${tbook}" varStatus="status">

	<c:set var="result" value="${result}!${list.pDate}"/>

</c:forEach>
<br/><br/>
<table data-mbook="${result}">
		<tr>
			<td colspan="2" align="center" style="border:none; text-align: right; height: 40px;">
				<a href="?yy=<%=yy-1 %>&mm=<%=mm %>">◀</a>
				<a href="?yy=<%=yy %>&mm=<%=mm-1 %>">◁</a>
			</td>
			<td colspan="3" align="center" style="border:none;text-align: center; height: 40px; font-size: 18pt;">
				<%=String.format("%04d년 %02d월",yy,mm) %>
			</td>
			<td colspan="2" align="center" style="border:none; text-align: left; height: 40px;">
				<a href="?yy=<%=yy %>&mm=<%=mm+1 %>">▷</a>
				<a href="?yy=<%=yy+1 %>&mm=<%=mm %>">▶</a>
			</td>
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
			<%	
				//1월의 요일을 맞추기 위해 공백을 출력
				for(int i=1; i<week; i++) out.println("<td>&nbsp;</td>");
				//1월부터 마지막 날짜까지 날짜를 출력. 출력한 날이 토요일이면 줄바꿈
				for(int i=1; i<=lastday; i++) {
					//출력한 날의 요일을 구한디.
					cal.set(yy,mm-1,i);
					week = cal.get(Calendar.DAY_OF_WEEK);
					if(week==1)
						out.println("<td style='color:red;' id='"+i+"'><span>"+i+ "</span></td>");
					else if(week==7)
						out.println("<td style='color:blue;' id='"+i+"'><span>"+i+ "</span></td>");
					else
						out.println("<td id='"+i+"'><span>"+i+ "</span></td>");
					if(week==7){
						out.println("</tr>");
						if(i<lastday) out.println("<tr>");
					}
				}
				if(week != 7){
					for(int i=week; i<7; i++) out.println("<td>&nbsp;</td>");
					out.println("</tr>");	
				}
			%>
		</tr>
	</table>
	<br/><br/><br/><br/><br/><br/>
	
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
		</div>
	</div>
</div>

</body>
<script>
function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	var now;
	var yy = <%=yy %>;
	var mm = <%=mm %>;
	
	var date = new Date(yy,(mm-1));
	
	var mbook = $("table").data("mbook").split("!");
	mbook.forEach(function(item){
		if(item!=""&&item!=undefined){
			var check = new Date(item.replace(" 00:00:00","").split("-"));
			date.setDate(1);
			if(date<=check){
				date.setMonth(date.getMonth()+1);
				date.setDate(0);
				if(check<=date){
					check = item.replace(" 00:00:00","").split("-")[2];
					check = parseInt(check);
					$("#"+check).append("<div>파티있음</div>");
				}
			}
		}
	});
	
	$("document").ready(function(){
		$("table tr:not(:nth-child(1)):not(:nth-child(2)) td:nth-child(7)").on("click",function(){
			var temp=$(this).text();
			console.log(temp);
			
			if(isNaN(temp)==true){
				console.log("파티일정있음");
				var value = $(this).children("span").html();
				now = $(this);
				
				if(value!=""&&value!=undefined&&value!="&nbsp;"){
					yy = pad(yy, 4);
					mm = pad(mm, 2);
					value = pad(value, 2);
					var date = yy+mm+value+"";
					$.ajax({
						url:"/user/getPno",
						type : "GET",
						data : {"pdate":date},
						dataType : "json",
						success : function(data){
							$(data).each(function() {
								$("#pno").val(this.pno);
								//alert($("#pno").val());
							});
							
						},
						error : function(e){
							alert(e);
						}
					});
					$(".modal").modal();
					$(".modal-body").html(
							"<p>Modal body text goes here.</p>"+
							"<input type='hidden' id='pno'>"+
					        "<input type='hidden' id= 'ubookmmid' value='${myid}'>"+
				            "파티날짜 :  <input class='party-date' style='width:300px; height:20px;'><br />"+
				            "인원수   :  <input class='party-cnt' value='30' readonly style='width:100px; height: 20px;'><br />"+
				            "금액     :  <input class='party-price' value='50000' readonly style='width:100px; height: 20px;'><br />"+
				            "장소     :  <input class='party-loc' value='인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층' readonly style='width:400px; height: 20px;'>"
				          
				    );	
					$(".modal-body p").html(mm+"/"+value);
					$(".party-date").val(yy+""+mm+""+value);
					$(".modal-title").html("파티 신청하기");
					$(".modal-footer").html(
						"<button type='button' class='btn btn-primary' id='insP'>신청하기</button>" +
				        "<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>"		
					);
					
					$("#insP").on("click",function(){
						var uid = $("#ubookmmid").val();
						var pno = $("#pno").val();
						console.log(uid+""+pno);
						$.ajax({
					    	type : "POST",
					    	
					    	url: "/user/insParty",

					        data: {"ubookmmid":uid,
					        	   "pno":pno},

					        success: function(data){
					      			console.log(data);
					      			if(data=="NN"){
					      				alert("이미 파티 신청을 한 상태입니다.");
					      			}
					        		if(data!="false"){
					        			alert("파티 신청 성공!!!!!");
					        			$("#"+value+" div").remove();
					        			$(".btn.btn-secondary").trigger("click");
					        			location.reload();
					        		}else{
					        			//alert("신청 실패!");
					        		}
					        	},
					       	error: function (){        
					        		alert("통신상태가 안좋음");
					     	  	 }
					      	});
						});
				}else{
					alert("선택할 수 없는 일자 입니다.");
				}
				
				
			}else{
				console.log("파티일정없음");
				alert("해당 일자에는 파티가 개설되어 있지 않습니다.");
			}
		});
	});
		
		
		$(".btn.btn-secondary").on("click",function(){
			$(".modal-body").html("");
		});
		
		$("table tr:not(:nth-child(1)):not(:nth-child(2)) td:not(:nth-child(7))").on("click",function(){
			alert("파티는 토요일에만 열립니다!");
		});
</script>

<style>
table tr:not(:nth-child(1)):not(:nth-child(2)) td:hover{
	box-shadow: 0 0 25px 5px rgba(0,0,255,0.1) inset;
	cursor:pointer;
}
table tr:not(:nth-child(1)):not(:nth-child(2)) td:click{
	background: grey;
}
</style>

</html>

