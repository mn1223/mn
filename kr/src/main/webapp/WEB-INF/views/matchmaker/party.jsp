<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Calendar"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="/WEB-INF/views/layout/headerM.jsp"%>
<!DOCTYPE html>
<html>
<!-- JQuery -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="/js/javascript.js"></script>
<head>
<meta charset="UTF-8">
<title>달력</title>
<style type="text/css">
	table{width:700px; margin:auto;}
	th{border:1px solid black; background-color: silver; padding:5px; width : 100px;}
	td{border:1px solid black; height: 60px; font-size: 12pt; vertical-align: top; text-align: right;}	
	
	td div{
		color:white;
		background:green;
	}
}

</style>
</head>
<body>

<c:forEach var="list" items="${tbook}" varStatus="status">

    <c:set var="result" value="${result}!${list.pDate}"/>

</c:forEach>
	
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
					$("#"+check).append("<div>일정있음</div>");
				}
			}
		}
	});
	
	
	$("document").ready(function(){
	$("table tr:not(:nth-child(1)):not(:nth-child(2)) td:nth-child(7)").on("click",function(){
		var temp=$(this).text();
		console.log(temp);
		
		if(isNaN(temp)==true){
			console.log("일정있음");
			var value = $(this).children("span").html();
			now = $(this);
			
			if(value!=""&&value!=undefined&&value!="&nbsp;"){
				yy = pad(yy, 4);
				mm = pad(mm, 2);
				value = pad(value, 2);
				$(".modal").modal();
				$(".modal-body").html(
						"<p>Modal body text goes here.</p>"+
			            "파티날짜 :  <input class='party-date' style='width:300px; height:20px;'><br />"+
			            "인원수   :  <input class='party-cnt' value='30' readonly style='width:100px; height: 20px;'><br />"+
			            "금액     :  <input class='party-price' value='50000' readonly style='width:100px; height: 20px;'><br />"+
			            "장소     :  <input class='party-loc' value='인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층' readonly style='width:400px; height: 20px;'>"
			        );
							
				$(".modal-body p").html(mm+"/"+value);
				$(".party-date").val(yy+""+mm+""+value);
				$(".modal-title").html("파티 삭제하기");
				$(".modal-footer").html(
					"<button type='button' class='btn btn-primary' id='pDel'>삭제하기</button>" +
			        "<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>"		
				);

				$("#pDel").on("click",function(){
					var date = $(".party-date").val();
					var year = date.substr(0,4);
					var month = date.substr(4,2);
					var day = date.substr(6,2);

					var pDate = year+""+month+""+day;

					$.ajax({
				    	type : "POST",
				    	
				    	url: "/matchmaker/pDel",

				        data: {"pDate":pDate},

				        success: function(data){
				        	if(data!="false"){
				        		alert("파티 삭제 성공!");
				        		$("#"+value+" div").remove();
				        		$(".btn.btn-secondary").trigger("click");
				        		location.reload();
				        	}else{
				        		alert("파티 삭제 실패!");
				        	}
				        },
				        error: function (){        
				        	alert("파티에 예약한 회원이 이미 있습니다");
				        }
				      });
				});
			}else{
				
				alert("선택할 수 없는 일자 입니다.");
			}
			
		}else{
			console.log("일정없음");
		
			var value = $(this).children("span").html();
			now = $(this);
			
			if(value!=""&&value!=undefined&&value!="&nbsp;"){
				yy = pad(yy, 4);
				mm = pad(mm, 2);
				value = pad(value, 2);
				$(".modal").modal();
				$(".modal-body").html(
						"<p>Modal body text goes here.</p>"+
			            "파티날짜 :  <input class='party-date' style='width:300px; height:20px;'><br />"+
			            "인원수   :  <input class='party-cnt' value='30' readonly style='width:100px; height: 20px;'><br />"+
			            "금액     :  <input class='party-price' value='50000' readonly style='width:100px; height: 20px;'><br />"+
			            "장소     :  <input class='party-loc' value='인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층' readonly style='width:400px; height: 20px;'>"
			            );
							
				$(".modal-body p").html(mm+"/"+value);
				$(".party-date").val(yy+""+mm+""+value);
				$(".modal-title").html("파티 추가하기");
				$(".modal-footer").html(
						"<button type='button' class='btn btn-primary'>저장하기</button>" +
				        "<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>"		
					);
				
				$(".btn.btn-primary").on("click",function(){
					var date = $(".party-date").val();
					var year = date.substr(0,4);
					var month = date.substr(4,2);
					var day = date.substr(6,2);
								
					var pDate = year+""+month+""+day;
					var pCnt = $(".party-cnt").val();
					var pPrice = $(".party-price").val();
					var pLoc = $(".party-loc").val();
					
					$.ajax({
				    	type : "POST",
				    	
				    	url: "/matchmaker/party",

				        data: {"pDate":pDate,"pCnt":pCnt,"pPrice":pPrice,"pLoc":pLoc},

				        success: function(data){
				        	if(data!="false"){
				        		alert("파티 추가 성공!");
				        		now.append("<div>일정있음</div>");
				        		$(".btn.btn-secondary").trigger("click");
				        		$(".modal-body p").html("<span style='color:red'>변경사항이 저장 되었습니다!</span>");
				        	}else{
				        		alert("파티 추가 실패!");
				        	}
				        },
				        error: function (){        
				        }
				      });
				});
			
			}else{
				alert("선택할 수 없는 일자 입니다.");
			}
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