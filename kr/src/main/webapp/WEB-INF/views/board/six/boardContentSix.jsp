<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>board</title>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">	

	//목록 이동 이벤트
	$(document)
			.on(
					'click',
					'#btnList',
					function() {
						location.href = "${pageContext.request.contextPath}/board/getBoardListSix";
					});
	
	//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/board/editFormSix";
		url = url + "?bno="+${boardContent.bno};
		url = url + "&mode=edit";
		location.href = url;
	});
	
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
    var url = "${pageContext.request.contextPath}/board/deleteBoardSix";
    url = url + "?bno=" + ${boardContent.bno};
		location.href = url;
	});
	
	<%-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ--%>
	//댓글 showReplyList 함수
	$(document).ready(function(){
		showReplyList();
	});
	
	//댓글 리스트 출력 ajax
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/restBoard/getReplyList";
		var paramData = {"bno" : "${boardContent.bno}"};
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
			if(result.length < 1){				
				
			} else {
	                    $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.boremmid + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rno + ', \'' + this.boremmid + '\', \'' + this.contents + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rno + ')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.contents;
	                     htmls += '</p>';
	                     htmls += '</div>';
	                });	//each end
			}
			$("#replyList").html(htmls);
            }	   // Ajax success end
		});	// Ajax end
	}
	
	//댓글 저장 버튼 클릭 이벤트
	$(document).on('click', '#btnReplySave', function(){
		var replyContents = $('#contents').val();
		var replyBoremmid = $('#boremmid').val();

		var paramData = JSON.stringify({"contents": replyContents
				, "boremmid": replyBoremmid
				, "bno":'${boardContent.bno}'
		});
		
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/saveReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				
				$('#contents').val('');
				$('#boremmid').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});
	
	
	//댓글 수정 버튼 이벤트
	function fn_updateReply(rno, boremmid){
		var replyEditContents = $('#editContents').val();
		
		var paramData = JSON.stringify({"contents": replyEditContents
				, "rno": rno
		});
		
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/updateReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	//댓글 삭제 버튼 이벤트
	function fn_deleteReply(rno){
		var paramData = {"rno": rno};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/deleteReply"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	
	//댓글 수정 버튼 클릭 이벤트
	function fn_editReply(rno, boremmid, contents){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + boremmid + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';


		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rno + ', \'' + boremmid + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContents" id="editContents" class="form-control" rows="3">';
		htmls += contents;
		htmls += '</textarea>';
		
		htmls += '</p>';
		htmls += '</div>';
		
		$('#rno' + rno).replaceWith(htmls);
		$('#rno' + rno + ' #editContents').focus();
	}
	
	
	
	

	
</script>

<style>
.board_title {
	font-weight : 700;
	font-size : 22pt;
	margin : 10pt;
}

.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}

.board_author {
	font-size : 10pt;
	margin-right : 10pt;
}

.board_date {
	font-size : 10pt;
}

.board_contents {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}
</style>

</head>

<body>
	<article>
		<div class="container" role="main">
			<h2>board Content</h2>

			<div class="bg-white rounded shadow-sm">
				<div class="board_title">
					<c:out value="${boardContent.title}" />
				</div>
				
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardContent.bommid}" /></span>
					<span class="board_date"><fmt:formatDate value="${boardContent.boDate}" pattern="yyyy-MM-dd" /></span>
				</div>				
				<div class="board_contents">${boardContent.contents}</div>				
			</div>

			<div style="margin-top: 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			
			<!-- Reply Form {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
				<form:hidden path="bno" id="bno"/>
				<div class="row">
					<div class="col-sm-10">
						<form:textarea path="contents" id="contents" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
					</div>
					<div class="col-sm-2">
						<form:input path="boremmid" class="form-control" id="boremmid" placeholder="댓글 작성자"></form:input>
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->
			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList"></div>
			</div> 
			<!-- Reply List {e}-->


		</div>
	</article>
</body>
</html>
















