<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>board</title>
<style>


</style>

<script>
	//작성버튼 클릭시
	$(document).on('click', "#btnWriteForm", function(e) {
		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/board/boardFormTwo";
	});
	
	//목록버튼 클릭시
	$(document).on('click', "#btnlistForm", function(){
		
		location.href = "${pageContext.request.contextPath}/board/getBoardListTwo";
	});
	
	//제목을 클릭했을때 상세보기로 이동
	function fn_contentView(bno){
		var url = "${pageContext.request.contextPath}/board/getBoardContentTwo";
		url = url + "?bno="+bno		
		location.href = url;
	}
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${pageContext.request.contextPath}/board/getBoardListTwo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
  //페이지 번호 클릭!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
	  	var url = "${pageContext.request.contextPath}/board/getBoardListTwo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + keyword;
		
		location.href = url;
		console.log(url);
		
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${pageContext.request.contextPath}/board/getBoardListTwo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	//검색 버튼 이벤트
	$(document).on('click', '#btnSearch', function(e){
		var form = document.userinput;
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/board/getBoardListTwo";		
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);		
		form.submit;
	});
</script>

</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<h2>후기 게시판(매치메이커)</h2>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>                                 
								</tr>
							</c:when>
							<c:when test="${!empty boardList}">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td><c:out value="${list.rNum}" /></td>
										<td><a href="#"
											onClick="fn_contentView(<c:out value="${list.bno}"/>)">
											<c:out value="${list.title}" />
										</a></td>
										<td><c:out value="${list.bommid}" /></td>
										<td><c:out value="${list.viewCnt}" /></td>
										<td><fmt:formatDate value="${list.boDate}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>					
				</table>
			</div>
			<div>
				<button type="button" class="btn btn-sm btn-primary"
					id="btnWriteForm">글쓰기</button>
			
				<button type="button" class="btn btn-sm btn-primary"
					id="btnlistForm">목록</button>
			</div>
			<br />			

			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination">
					
					<!-- 이전 버튼 -->
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a>
						</li>
					</c:if>
					
					<!-- 번호 출력 -->
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a 	class="page-link" href="#"
						 onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')">
								${idx} </a></li>
					</c:forEach>
					
					<!-- 다음 버튼 -->
					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">다음</a></li>
					</c:if>

				</ul>
			</div>
			<!-- pagination{e} -->
			
			
			<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">					
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="t"<c:out value="${search.searchType eq 't' ? 'selected' : ''}"/>>제목</option>					
					<option value="c"<c:out value="${search.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"<c:out value="${search.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				</select>
			</div>
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">				
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" type="submit" >검색</button>
			</div>			
		</div>
		<!-- search{e} -->
		<!-- footer{s} -->
			
		<!-- footer{e} -->		
		</div>
		
	</article>	
</body>
</html>