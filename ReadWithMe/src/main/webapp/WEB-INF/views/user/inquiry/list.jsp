<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		
		//글쓰기 버튼
		$("#btnWrite").click(function() {
			$(location).attr("href", "/user/inquiry/write");
			// 		location.href = "/board/write";
		});
		
		//글삭제 버튼
		$("#btnDelete").click(function(){
			$(location).attr("href", "/user/inquiry/delete")
		});
		
		var search = $("input[name='search']").val();
 
		//	검색 버튼 클릭
		$("#btnSearch").click(function() {
			$(location).attr("href", "/user/inquiry?search=" + search);
		});
		
		//	카테고리 버튼
		$("button[name='category']").click(function(){
			var category = $("button[name='category']").val();
			
			$(location).attr("href", "/user/inquiry?category=" + category);
		});
	});	
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.wrap {
	margin: 0 auto;
	width: 1200px;
}

.container {
	min-height: 400px;
}
</style>

</head>
<body>

	<div class="wrap">

		<div class="container">

			<div style="height: 50px;"></div>
			
			<h1>1:1 질문</h1>
			
			<div style="height: 20px;"></div>
			
			<div style="height: 8px;"></div>
			
			<table class="table table-hover">
				<thead class="table-dark">
					<tr class="active">
						<th style="width: 8%;">글번호</th>
						<th>제목</th>
						<th style="width: 5%;">조회</th>
						<th style="width: 15%;">작성일</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="inquiry">
						<tr>
							<td>${inquiry.board_no }</td>
							<td><a
								href="/user/inquiry/view?board_no=${inquiry.board_no }">${inquiry.board_title }</a></td>
							<td>0</td>
							<td><fmt:formatDate value="${inquiry.board_date }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
							<td>
							<c:if test="${inquiry.check_reply == 0 }">
							답변 x
							</c:if>
							<c:if test="${inquiry.check_reply == 1 }">
							답변 ㅇ
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<span class="pull-left">총 게시글 : ${paging.totalCount }개</span>

			<div class="clearfix"></div>
			<div style="height: 10px;"></div>

			<button id="btnWrite" class="btn btn-primary pull-left" style="margin-right: 2px;">글쓰기</button>
			<button id="btnDelete" class="btn btn-primary pull-left" style="margin-right: 2px;">삭제</button>

			<div class="form-inline text-center">

				<form action="/user/inquiry/list" method="get">
					<input class="form-control" type="text" id="search" name="search" value="${paramData.search }"/>
					<button id="btnSearch" class="btn">검색</button>
				</form>
			</div>

			

			<c:if test="${not empty paramData.search }">
				<c:set var="searchParam" value="&search=${paramData.search }" />
			</c:if>

			<div class="text-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">

						<%-- 첫 페이지로 이동 --%>
						<c:if test="${paging.curPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="/user/inquiry?curPage=1${searchParam }">처음</a></li>
						</c:if>

						<%-- 이전 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.startPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="/user/inquiry?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
							</c:when>
							<c:when test="${paging.startPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 이전 페이지로 가기 --%>
						<c:if test="${paging.curPage > 1 }">
							<li class="page-item"><a class="page-link"
								href="/user/inquiry?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
						</c:if>




						<%-- 페이징 리스트 --%>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="i">
							<c:if test="${paging.curPage eq i }">
								<li class="page-item active"><a class="page-link"
									href="/user/inquiry?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
							<c:if test="${paging.curPage ne i }">
								<li class="page-item"><a class="page-link"
									href="/user/inquiry?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
						</c:forEach>




						<%-- 다음 페이지로 가기 --%>
						<c:if test="${paging.curPage < paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/inquiry?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
						</c:if>

						<%-- 다음 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.endPage ne paging.totalPage }">
								<li class="page-item"><a class="page-link"
									href="/user/inquiry?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
							</c:when>
							<c:when test="${paging.endPage eq paging.totalPage }">
								<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 끝 페이지로 이동 --%>
						<c:if test="${paging.curPage ne paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/inquiry?curPage=${paging.totalPage }${searchParam }">끝</a></li>
						</c:if>

					</ul>
				</nav>
			</div>

		</div>
		<!-- .container -->

	</div>
	<!-- .wrap -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />