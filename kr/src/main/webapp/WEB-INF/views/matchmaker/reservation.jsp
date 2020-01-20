<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script src="/js/javascript.js"></script>
<head>
<meta charset="UTF-8">
<title>달력</title>
<style type="text/css">
	table{width:1200px; margin:auto;}
	th{border:1px solid black; background-color: silver; padding:5px; width : 100px;}
    td{border:1px solid black; height: 60px; font-size: 12pt; vertical-align: top; text-align: right;}	

	td div{
		color:white;
		background:pink;
	}
	
	#po {text-align:center;}
	#po2 {text-align:center;}
	#po3 {text-align:center;}
	#po4 {text-align:center;}
	#po5 {text-align:center;}
	#po6 {text-align:center;}
	#po7 {text-align:center;}
	#po8 {text-align:center;}
	.po9 {text-align:center;}
	#pid {text-align:center;}
</style>
</head>
<body>

<c:forEach var="list" items="${tbook}" varStatus="status">

    <c:set var="result" value="${result}!${list.pDate}"/>

</c:forEach>

<h1>관리자 페이지(매치 메이커 공통)</h1>
	<h2>예약관리</h2> <a href="/">홈으로</a>
	
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
	
	<br/>
      <table border="1">
        	<colgroup>
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			
			<thead id=po3>
        		<tr>
        			<th>회원이름</th>
	        		<th>회원아이디</th>
	        		<th>파티날짜</th>
	        		<th>성별</th>
	        		<th>전화번호</th>
	        		<th>예약상태</th>
	        		<th>입금상태</th>
	        		<th>수정완료</th>
        		</tr>
        	</thead>
        	
        	<tbody id="plist" id=po4>
			</tbody>
      	</table>    
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
	
	
	$("table tr:not(:nth-child(1)):not(:nth-child(2)) td:nth-child(7)").on("click",function(){
		var value = $(this).children("span").html();
		var pDate;
		now = $(this);
		
		if(value!=""&&value!=undefined&&value!="&nbsp;"){
			yy = pad(yy, 4);
			mm = pad(mm, 2);
			value = pad(value, 2);
			pDate = yy+''+mm+''+value;
			console.log(pDate);
			
			$.ajax({
		    	type : "POST",
		    	
		    	url: "/matchmaker/puSearch",

		        data: {"pDate":pDate},
		        
		        dateType : 'json',

		        success: function(data){
		        		console.log(data.length);
		        		$("#plist").html("");
		        		var htmls = "";
		        		if(data.length < 1){
		        			alert("현재 해당 일자 파티를 신청한 회원이 없습니다.");
		        			//htmls = "<td>현재 파티신청 한 회원이 없습니다.</td>";
		        		}else{
		        			console.log(data);
		        			
		        			$(data).each(function(){
		          				htmls = "<tr class='"+this.mmid+"'>";
		        				htmls += "<td id=po2>"+this.mmname+"</td>";
		        				htmls += "<td id=pid>"+this.mmid+"</td>";
		        				htmls += "<td id=po4>"+this.pdate+"</td>";
		        				htmls += "<td id=po5>"+this.mmgender+"</td>";
		        				htmls += "<td id=po6>"+this.mmphonenum+"</td>";
		        				htmls += "<td id=po7><select name='ubookstatus' >"
		        			     		 +"<option value='N'>예약 대기</option>"
		        						 +"<option value='Y'>예약 승인</option></select></td>";

		        				htmls +=  "<td id=po8><select name ='ubookdeposit' >"
	        						 	 +"<option value='N'>입금 확인X</option>"
	        						 	 +"<option value='Y'>입금 확인O</option></select></td>";
	    		        				
		        				htmls += "<td class=po9><button type='button' onclick=regInfo('"+this.mmid+"',this,'"+this.pdate.split("-")[0]+""+this.pdate.split("-")[1]+""+this.pdate.split("-")[2].split(" ")[0]+"');>수정</button></td>";
		      					htmls += "</tr>";
		      					$("#plist").append(htmls);
		      					
		      					console.log('ubookdeposit : '+this.ubookdeposit);
		      					if(this.ubookdeposit!="N"){
			      					$("."+this.mmid+":last-child #po7 option:last-child").attr("selected","selected");
			      				}else{
			      					$("."+this.mmid+":last-child #po7 option:first-child").attr("selected","selected");
			      				}	
		      					
		      					console.log('ubookstatus : '+this.ubookstatus);
		      					if(this.ubookstatus!="N"){
		      						$("."+this.mmid+":last-child #po8 option:last-child").attr("selected","selected");
		      					}else{
		      						$("."+this.mmid+":last-child #po8 option:first-child").attr("selected","selected");
		      					}
		      					
		        			});
		        		}
		        }//Ajax Seccess end
		      }); //Ajax end
		}
	});
	
	function regInfo(mmid,self,date){
		var ubookstatus = $(self).parent().prev().find("option:selected").val();
		var ubookdeposit = $(self).parent().prev().prev().find("option:selected").val();
		//alert(ubookstatus+"/"+ubookdeposit);
		//console.log(mmid+""+ubookstatus+""+ubookdeposit);
		
		 $.ajax({
		    	type : "POST",
		    	
		        url: "/matchmaker/puUpd",

		        data: {"ubookstatus":ubookstatus, 
		        	   "ubookdeposit":ubookdeposit,
		        	   "mmid":mmid,
		        	   "pdate":date},

		        success: function(data){
		        	console.log(data);
		        	if(data!="false"){ 
		        		data='Y'
		        		location.reload();
			       		alert("수정 성공 !!!!");
		        	}else{
		        		data='N'
		        		alert("수정 실패 !!!!");
		        		location.reload();
		        	}
		        },
		        error: function (){        
		        	alert("통신상태가 안좋음");
		        }
		      });
		};
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