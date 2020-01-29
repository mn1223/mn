/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */


$("document").ready(function(){
	$("#view").on("click",function(){
		location.href="http://192.168.0.241/matchmaker/member?keyword="+$("#sid").val();
	});
	
	$("td:last-child button").on("click",function(){
		var mmid = $(this).parent().parent().parent().find("td:nth-child(2)").html();
	    var mmgrade = $(this).parent().parent().parent().find("td:nth-child(6) select option:selected").val();
	    console.log(mmid);
	    $.ajax({
	    	type : "POST",
	    	
	        url: "/matchmaker/mmupdate",

	        data: {"mmid":mmid,"mmgrade":mmgrade},

	        success: function(data){
	        	if(data!="false"){
	        		$(this).parent().parent().find("td:nth-child(6) select option[value="+data+"]").attr("selected","selected");
	        		alert("수정 성공했습니다");
	        	}else{
	        		alert("수정 실패했습니다");
	        	}
	        },
	        error: function (){        
	        	alert("통신상태가 안좋음");
	        }
	      });
	});
});
