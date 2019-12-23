<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>






<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<title>board</title>



<script>
	$(document).ready(function() {

		showReplyList();

	});

	$(document)
			.on(
					'click',
					'#btnList',
					function() {
						
						location.href = "${pageContext.request.contextPath}/board/getBoardList";
						
					});

	$(document).on('click', '#btnUpdate', function() {
		var url = "${pageContext.request.contextPath}/board/editForm";
		url = url + "?bno=" + ${boardContent.bno};
		url = url + "&mode=edit";
		location.href = url;
	});

	$(document).on('click', '#btnDelete', function() {

		var url = "${pageContext.request.contextPath}/board/deleteBoard";

		url = url + "?bno=" + ${boardContent.bno};

		location.href = url;
	});

	function showReplyList() {

		var url = "${pageContext.request.contextPath}/restBoard/getReplyList";

		var paramData = {
			"bno" : "${boardContent.bno}"
		};

		$
				.ajax({

					type : 'POST',

					url : url,

					data : paramData,

					dataType : 'json',

					success : function(resultt) {

						var htmlss = "";

						if (resultt.length < 1) {

							

						} else {

							$(resultt)
									.each(
											function() {

												htmlss += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';

												htmlss += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

												htmlss += '<title>Placeholder</title>';

												htmlss += '<rect width="100%" height="100%" fill="#007bff"></rect>';

												htmlss += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

												htmlss += '</svg>';

												htmlss += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

												htmlss += '<span class="d-block">';

												htmlss += '<strong class="text-gray-dark">'
														+ this.reg_id
														+ '</strong>';

												htmlss += '<span style="padding-left: 7px; font-size: 9pt">';

												htmlss += '<a href="javascript:void(0)" onclick="fn_editReply('
														+ this.rno
														+ ', \''
														+ this.reg_id
														+ '\', \''
														+ this.text
														+ '\' )" style="padding-right:5px">수정</a>';

												htmlss += '<a href="javascript:void(0)" onclick="fn_deleteReply('
														+ this.rno
														+ ')" >삭제</a>';

												htmlss += '</span>';

												htmlss += '</span>';

												htmlss += this.text;

												htmlss += '</p>';

												htmlss += '</div>';

											}); //each end

						}

						$("#replyList").html(htmlss);

					}// Ajax success end

				}); // Ajax end

	}

	//댓글 저장 버튼 클릭 이벤트

	$(document).on('click', '#btnReplySave', function() {

		var replyContent = $('#text').val();

		var replyReg_id = $('#reg_id').val();

		var paramData = JSON.stringify({
			"text" : replyContent

			,
			"reg_id" : replyReg_id

			,
			"bno" : '${boardContent.bno}'

		});

		var headers = {
			"Content-Type" : "application/json"

			,
			"X-HTTP-Method-Override" : "POST"
		};
		var url = "${pageContext.request.contextPath}/restBoard/saveReply";

		$.ajax({

			url : url

			,
			headers : headers

			,
			data : paramData

			,
			type : 'POST'

			,
			dataType : 'text'

			,
			success : function(result) {

				showReplyList();

				$('#text').val('');

				$('#reg_id').val('');
				

			}

			,
			error : function(error) {

				console.log("에러 : " + error);

			}

		});

	});
	
	function fn_editReply(rno, reg_id, text){

		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="rno' + rno + '">';

		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

		htmls += '<title>Placeholder</title>';

		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

		htmls += '</svg>';

		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

		htmls += '<span class="d-block">';

		htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';

		htmls += '<span style="padding-left: 7px; font-size: 9pt">';

		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rno + ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';

		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

		htmls += '</span>';

		htmls += '</span>';		

		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

		htmls += text;

		htmls += '</textarea>';

		

		htmls += '</p>';

		htmls += '</div>';

		

		$('#rno' + rno).replaceWith(htmls);

		$('#rno' + rno + ' #editContent').focus();
		
	}

	
	function fn_updateReply(rno, reg_id){

		var replyEditContent = $('#editContent').val();

		

		var paramData = JSON.stringify({"text": replyEditContent

				, "rno": rno

		});

		

		var headers = {"Content-Type" : "application/json"

				, "X-HTTP-Method-Override" : "POST"};

		var url = "${pageContext.request.contextPath}/restBoard/updateReply";

		$.ajax({

			url: url

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
	
	function fn_deleteReply(rno){

		var paramData = {"rno": rno};

		var url = "${pageContext.request.contextPath}/restBoard/deleteReply";

		$.ajax({

			url: url

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

</script>



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

					<span class="board_author"><c:out
							value="${boardContent.reg_id}" />,</span><span class="board_date"><c:out
							value="${boardContent.reg_dt}" /></span>

				</div>

				<div class="board_content">${boardContent.text}</div>

				<div class="board_tag">
					TAG :
					<c:out value="${boardContent.tag}" />
				</div>

			</div>



			<div style="margin-top: 20px">

				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

			<!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">

				<form:form name="form" id="form" role="form"
					modelAttribute="replyVO" method="post">

					<form:hidden path="bno" id="bno" />

					<div class="row">

						<div class="col-sm-10">

							<form:textarea path="text" id="text" class="form-control"
								rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>

						</div>

						<div class="col-sm-2">

							<form:input path="reg_id" class="form-control" id="reg_id"
								placeholder="댓글 작성자"></form:input>

							<button type="button" class="btn btn-sm btn-primary"
								id="btnReplySave" style="width: 100%; margin-top: 10px">
								저 장</button>

						</div>

					</div>

				</form:form>

			</div>

			<!-- Reply Form {e} -->



			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>

				<div id="replyList"></div>

			</div>

			<!-- Reply List {e}-->




		</div>



	</article>

</body>

</html>
