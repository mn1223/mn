<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/layout/headerNF.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>board</title>



<!-- ckeditor 사용을 위해 js 파일 연결 -->
<script
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<script>
	
	//저장 버튼
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardListSix";
					});
	
	
	
	$(document).ready(function(){		
		
		
		
	//이미지 업로드 컨트롤러 연결
		CKEDITOR.replace('contents',{
			filebrowserUploadUrl: '${pageContext.request.contextPath }/restBoard/imageUpload'
			
		});
	
		CKEDITOR.editorConfig = function(config) {
			  config.allowedContent = 'img';
		};		
		CKEDITOR.config.height = 400;
	
		 
	
	
	//입력 폼 세팅
	//console("<img alt="" src="/resources/img/e12a1296-bea6-440f-84e2-cf3dcdd04612.jpg" 
	//style="width: 1105px; height: 595px;" />");
	
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'edit'){
			
		$("#bommid").prop('readonly', true);
		$("input:hidden[name='bno']").val(<c:out value="${boardContent.bno}"/>);
		$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');

		$("#bommid").val('<c:out value="${boardContent.bommid}"/>');
		$("#title").val('<c:out value="${boardContent.title}"/>');
		$("#contents").val('<div id="contents" class="contents">${boardContent.contents}</div>');//!!!!
		}
	});	
</script>


<style>


.contents img { max-width:600px; height:auto; }
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form:form name="form" id="form" role="form" modelAttribute="boardVO"
				method="post"
				action="${pageContext.request.contextPath}/board/saveBoardSix">
				<form:hidden path="bno" />
				<input type="hidden" name="mode" />

				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" id="title" class="form-control"
						placeholder="제목을 입력해 주세요" />
				</div>

				<div class="mb-3">
					<label for="bommid">작성자</label>
					<form:input path="bommid" id="bommid" class="form-control"
						placeholder="이름을 입력해 주세요" />
				</div>

				<div class="mb-3">
					<label for="contents">내용</label>
						<form:textarea path="contents" id="contents" name="contents" class="form-control"
						rows="5" placeholder="내용을 입력해 주세요" />												
				</div>
			</form:form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>				
			</div>
		</div>
	</article>
</body>

</html>
